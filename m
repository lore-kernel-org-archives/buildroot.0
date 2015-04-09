From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 9 Apr 2015 23:23:31 +0200
Subject: [Buildroot] [PATCH 1/2] package/makedevs: add recursive option
In-Reply-To: <1426243805-8317-2-git-send-email-angelo.compagnucci@gmail.com>
References: <1426243805-8317-1-git-send-email-angelo.compagnucci@gmail.com>
 <1426243805-8317-2-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20150409212331.GB4192@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo, All,

On 2015-03-13 11:50 +0100, Angelo Compagnucci spake thusly:
> This patch adds the possibilty to change owner/permission
> of a folder recursively.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

[I really only did a review and no actual tests]

As a side comment: maybe that would be interesting to submit a similar
patch for busybox (where makedevs originated); note however that busybox
has changed quite a lot since we forked makedevs...

Regards,
Yann E. MORIN.

> ---
>  package/makedevs/makedevs.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
> index ab90b93..e575427 100644
> --- a/package/makedevs/makedevs.c
> +++ b/package/makedevs/makedevs.c
> @@ -34,6 +34,8 @@
>  #ifndef __APPLE__
>  #include <sys/sysmacros.h>     /* major() and minor() */
>  #endif
> +#include <ftw.h>
> +
>  
>  const char *bb_applet_name;
>  
> @@ -332,6 +334,7 @@ void bb_show_usage(void)
>  	fprintf(stderr, "Where name is the file name,  type can be one of:\n");
>  	fprintf(stderr, "      f       A regular file\n");
>  	fprintf(stderr, "      d       Directory\n");
> +	fprintf(stderr, "      r       Directory recursively\n");
>  	fprintf(stderr, "      c       Character special device file\n");
>  	fprintf(stderr, "      b       Block special device file\n");
>  	fprintf(stderr, "      p       Fifo (named pipe)\n");
> @@ -364,6 +367,20 @@ void bb_show_usage(void)
>  	exit(1);
>  }
>  
> +bb_recursive(const char *full_name, uid_t uid, gid_t gid, unsigned int mode){
> +
> +	int chmod_chown(const char *fpath, const struct stat *sb,
> +		int tflag, struct FTW *ftwbuf) {
> +		if (chown(fpath, uid, gid) == -1) return -1;
> +		if ((mode != -1)) {
> +			if (chmod(fpath, mode) < 0) return -1;
> +		}
> +		return 0;
> +	}
> +
> +	return nftw(full_name, chmod_chown, 20, FTW_MOUNT | FTW_PHYS);
> +}
> +
>  int main(int argc, char **argv)
>  {
>  	int opt;
> @@ -474,6 +491,12 @@ int main(int argc, char **argv)
>  				ret = EXIT_FAILURE;
>  				goto loop;
>  			}
> +		} else if (type == 'r') {
> +			if (bb_recursive(full_name, uid, gid, mode) < 0) {
> +				bb_perror_msg("line %d: recursive failed for %s", linenum, full_name);
> +				ret = EXIT_FAILURE;
> +				goto loop;
> +			}
>  		} else
>  		{
>  			dev_t rdev;
> -- 
> 1.9.1
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
