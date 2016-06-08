From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 8 Jun 2016 23:53:09 +0200
Subject: [Buildroot] [PATCH] makedevs: add xattr support
In-Reply-To: <6df4e9d3-decd-42dd-b127-20990cca8d64@EXDCVYARSGC003.eq1sgc.local>
References: <6df4e9d3-decd-42dd-b127-20990cca8d64@EXDCVYARSGC003.eq1sgc.local>
Message-ID: <20160608215309.GB3694@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Philippe, All,

Besides the comment by Thomas, here are mines...

On 2016-06-01 15:47 +0200, Philippe Reynes spake thusly:
> Add the support of capabilities to makedevs.
> Now, it's possible to add "|xattr <capability>"
> after a file description to also add a capability
> to this file. It's possible to add severals
> capabilities with severals lines.

Yeah, capabilities are stored as extended attributes.

It is not entirely clear how one is supposed to provide capabilities and
write the permission tables. You said:

    it's possible to add "|xattr <capability>" after a file description

Which I understood as:

    it's possible to append "|xattr <cap>" at the end of the file
    description

which got me pretty confused as how I could provide multiple
capabilities. Lookign at the code, it is not obvious either.

I gues what you really meant was that capabilities could be added on
following lines, like:

    /usr/bin/bar f 755 root root - - - - -
    |xattr cpa-foo
    |xattr cap-bar
    |xattr cap-buz

and so on... Right?

So we really need the documentation to be updated:

    https://buildroot.org/downloads/manual/manual.html#makedev-syntax

which is rendered from docs/manual/ in your buildroot tree (hint: the
file is named makedev-syntax.txt).

> Signed-off-by: Philippe Reynes <philippe.reynes@sagemcom.com>
> ---
>  package/makedevs/makedevs.c  |   66 ++++++++++++++++++++++++++++++++++++++++--
>  package/makedevs/makedevs.mk |    4 ++-
>  2 files changed, 67 insertions(+), 3 deletions(-)
> 
> diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
> index e5ef164..225b441 100644
> --- a/package/makedevs/makedevs.c
> +++ b/package/makedevs/makedevs.c
> @@ -35,6 +35,7 @@
>  #include <sys/sysmacros.h>     /* major() and minor() */
>  #endif
>  #include <ftw.h>
> +#include <sys/capability.h>
>  
>  const char *bb_applet_name;
>  uid_t recursive_uid;
> @@ -43,6 +44,8 @@ unsigned int recursive_mode;
>  #define PASSWD_PATH "etc/passwd"  /* MUST be relative */
>  #define GROUP_PATH "etc/group"  /* MUST be relative */
>  
> +void bb_xasprintf(char **string_ptr, const char *format, ...);

I'm not against forward declaration, but as Thomas said, just add the
new bb_set_xattr() function after bb_xasprintf().

>  void bb_verror_msg(const char *s, va_list p)
>  {
>  	fflush(stdout);
> @@ -190,6 +193,55 @@ int bb_make_directory (char *path, long mode, int flags)
>  	return -1;
>  }
>  
> +int bb_set_xattr(const char *fpath, const char *xattr)
> +{
> +	cap_t cap, cap_file, cap_new;
> +	char *cap_file_text, *cap_new_text;
> +	ssize_t length;
> +
> +	cap = cap_from_text(xattr);
> +	if (cap == NULL) {
> +		bb_perror_msg("cap_from_text failed for %s", xattr);
> +		return -1;
> +	}
> +
> +	cap_file = cap_get_file(fpath);
> +	if (cap_file == NULL) {
> +		/* if no capability was set before, we initialize cap_file */
> +		if (errno == ENODATA) {
> +			cap_file = cap_init();
> +		} else {
> +			bb_perror_msg("cap_get_file failed on %s", fpath);
> +			return -1;
> +		}
> +	}
> +
> +	if ((cap_file_text = cap_to_text(cap_file, &length)) == NULL) {
> +		bb_perror_msg("cap_to_name failed on %s", fpath);
> +		return -1;
> +	}
> +
> +	bb_xasprintf(&cap_new_text, "%s %s", cap_file_text, xattr);
> +
> +	if ((cap_new = cap_from_text(cap_new_text)) == NULL) {
> +		bb_perror_msg("cap_from_text failed on %s", cap_new_text);
> +		return -1;
> +	}
> +
> +	if (cap_set_file(fpath, cap_new) == -1) {
> +		bb_perror_msg("cap_set_file failed for %s (xattr = %s)", fpath, xattr);
> +		return -1;
> +	}
> +
> +	cap_free(cap);
> +	cap_free(cap_file);
> +	cap_free(cap_file_text);
> +	cap_free(cap_new);
> +	cap_free(cap_new_text);
> +
> +	return 0;
> +}
> +
>  const char * const bb_msg_memory_exhausted = "memory exhausted";
>  
>  void *xmalloc(size_t size)
> @@ -413,6 +465,7 @@ int main(int argc, char **argv)
>  	int opt;
>  	FILE *table = stdin;
>  	char *rootdir = NULL;
> +	char *full_name = NULL;
>  	char *line = NULL;
>  	int linenum = 0;
>  	int ret = EXIT_SUCCESS;
> @@ -454,15 +507,22 @@ int main(int argc, char **argv)
>  		unsigned int count = 0;
>  		unsigned int increment = 0;
>  		unsigned int start = 0;
> +		char xattr[255];
>  		char name[4096];
>  		char user[41];
>  		char group[41];
> -		char *full_name;
>  		uid_t uid;
>  		gid_t gid;
>  
>  		linenum++;
>  
> +		if (1 == sscanf(line, "|xattr %254s", xattr))
> +		{
> +			if (bb_set_xattr(full_name, xattr) < 0)

On the first line, full_name is NULL, because you haven't scanned any
file name yet. Check that you have already scanned a file line and error
out if not.

> +				ret = EXIT_FAILURE;
> +			continue;
> +		}
> +
>  		if ((2 > sscanf(line, "%4095s %c %o %40s %40s %u %u %u %u %u", name,
>  						&type, &mode, user, group, &major,
>  						&minor, &start, &increment, &count)) ||
> @@ -487,6 +547,9 @@ int main(int argc, char **argv)
>  		} else {
>  			uid = getuid();
>  		}
> +
> +		/* free previous full name */
> +		free(full_name);

Contrary to Thomas, I think this is correct.

Before your patch, full_name is allocated when we scan a line, and
deallocated after the line is parsed, because it is no longer used.

With your patch, you can't de-allocated at the end of the parsing of a
file-line, becasue you may need it on the following lines too, in case
they are xattr-lines.

So that's OK. But needs a little comment explaining so.

>  		full_name = concat_path_file(rootdir, name);
>  
>  		if (type == 'd') {
> @@ -585,7 +648,6 @@ int main(int argc, char **argv)
>  		}
>  loop:
>  		free(line);
> -		free(full_name);
>  	}
>  	fclose(table);
>  
> diff --git a/package/makedevs/makedevs.mk b/package/makedevs/makedevs.mk
> index fa8e753..0a724ad 100644
> --- a/package/makedevs/makedevs.mk
> +++ b/package/makedevs/makedevs.mk
> @@ -11,6 +11,8 @@ HOST_MAKEDEVS_SOURCE =
>  MAKEDEVS_VERSION = buildroot-$(BR2_VERSION)
>  MAKEDEVS_LICENSE = GPLv2
>  
> +HOST_MAKEDEVS_LDFLAGS = -lcap
> +
>  define MAKEDEVS_BUILD_CMDS
>  	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
>  		package/makedevs/makedevs.c -o $(@D)/makedevs
> @@ -22,7 +24,7 @@ endef
>  
>  define HOST_MAKEDEVS_BUILD_CMDS
>  	$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
> -		package/makedevs/makedevs.c -o $(@D)/makedevs
> +		package/makedevs/makedevs.c -o $(@D)/makedevs $(HOST_MAKEDEVS_LDFLAGS)

Like Thomas said, make libcap support optional, and require host-libcap.

Note that, obviously, you'll need to make the capabilities code in
makedev conditional. And error out if there is an xattr-line in the
permission table.

(Well, I mostly repeated what Thomas said...)

Regards,
Yann E. MORIN.

>  endef
>  
>  define HOST_MAKEDEVS_INSTALL_CMDS
> -- 
> 1.7.9.5
> 
> 
> #
> " Ce courriel et les documents qui lui sont joints peuvent contenir des
> informations confidentielles ou ayant un caract?? priv??S'ils ne vous sont
> pas destin?? nous vous signalons qu'il est strictement interdit de les
> divulguer, de les reproduire ou d'en utiliser de quelque mani?? que ce
> soit le contenu. Si ce message vous a ?? transmis par erreur, merci d'en
> informer l'exp??teur et de supprimer imm??atement de votre syst??
> informatique ce courriel ainsi que tous les documents qui y sont attach??"
> 
> 
>                                ******
> 
> " This e-mail and any attached documents may contain confidential or
> proprietary information. If you are not the intended recipient, you are
> notified that any dissemination, copying of this e-mail and any attachments
> thereto or use of their contents by any means whatsoever is strictly
> prohibited. If you have received this e-mail in error, please advise the
> sender immediately and delete this e-mail and all attached documents
> from your computer system."
> #
> 

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
