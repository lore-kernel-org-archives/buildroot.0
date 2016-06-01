From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jun 2016 17:20:37 +0200
Subject: [Buildroot] [PATCH] makedevs: add xattr support
In-Reply-To: <6df4e9d3-decd-42dd-b127-20990cca8d64@EXDCVYARSGC003.eq1sgc.local>
References: <6df4e9d3-decd-42dd-b127-20990cca8d64@EXDCVYARSGC003.eq1sgc.local>
Message-ID: <20160601172037.640e8989@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for working on this topic! I'm sure Gustavo will have a closer
look, but I have a few comments below.

On Wed, 1 Jun 2016 15:47:01 +0200, Philippe Reynes wrote:
> Add the support of capabilities to makedevs.
> Now, it's possible to add "|xattr <capability>"
> after a file description to also add a capability
> to this file. It's possible to add severals
> capabilities with severals lines.

I was initially a bit confused, because you're both talking about
extended attributes and capabilities here. After reading some stuff, my
understanding is that capabilities are in fact encoded through the
extended attribute mechanism. So perhaps, this should be made clearer.

> 
> Signed-off-by: Philippe Reynes <philippe.reynes@sagemcom.com>
> ---
>  package/makedevs/makedevs.c  |   66 ++++++++++++++++++++++++++++++++++++++++--
>  package/makedevs/makedevs.mk |    4 ++-
>  2 files changed, 67 insertions(+), 3 deletions(-)

This needs an update to the Buildroot documentation as well.

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

What about moving the function instead of using this forward
declaration. Or alternatively, add your new bb_set_xattr() function
somewhere below bb_xasprintf().


> +		if (1 == sscanf(line, "|xattr %254s", xattr))
> +		{
> +			if (bb_set_xattr(full_name, xattr) < 0)
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

Is this change really related?

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

So this makes host-makedevs assume that libcap is available on the
build machine. I think we should instead add a Config.in option to
indicate if we want to support extended attributes in makedevs, and in
this case, host-makedevs should depend on host-libcap.

Of course, if makedevs is built without libcap support, it should
return an error and exit if an entry with |xattr is found.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
