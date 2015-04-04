From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun, 5 Apr 2015 01:17:56 +0200
Subject: [Buildroot] [PATCH 1/2] package/makedevs: add recursive option
In-Reply-To: <1426243805-8317-2-git-send-email-angelo.compagnucci@gmail.com>
References: <1426243805-8317-1-git-send-email-angelo.compagnucci@gmail.com>
 <1426243805-8317-2-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <CA+TH9VkgQNNQkWgjLh5yhcY7_r0F-2b8ceXd+6BTTHTmO1D-uA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Buildroot developers,
Il 13/mar/2015 11:50, "Angelo Compagnucci" <angelo.compagnucci@gmail.com>
ha scritto:
>
> This patch adds the possibilty to change owner/permission
> of a folder recursively.
>
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---

Anybody willing to review this patch? I think it's very important to have
the option to set permission on folders recursively!

I think this patch is really simple and could be reviewed/accepted with a
minimal effort.

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
>         fprintf(stderr, "Where name is the file name,  type can be one
of:\n");
>         fprintf(stderr, "      f       A regular file\n");
>         fprintf(stderr, "      d       Directory\n");
> +       fprintf(stderr, "      r       Directory recursively\n");
>         fprintf(stderr, "      c       Character special device file\n");
>         fprintf(stderr, "      b       Block special device file\n");
>         fprintf(stderr, "      p       Fifo (named pipe)\n");
> @@ -364,6 +367,20 @@ void bb_show_usage(void)
>         exit(1);
>  }
>
> +bb_recursive(const char *full_name, uid_t uid, gid_t gid, unsigned int
mode){
> +
> +       int chmod_chown(const char *fpath, const struct stat *sb,
> +               int tflag, struct FTW *ftwbuf) {
> +               if (chown(fpath, uid, gid) == -1) return -1;
> +               if ((mode != -1)) {
> +                       if (chmod(fpath, mode) < 0) return -1;
> +               }
> +               return 0;
> +       }
> +
> +       return nftw(full_name, chmod_chown, 20, FTW_MOUNT | FTW_PHYS);
> +}
> +
>  int main(int argc, char **argv)
>  {
>         int opt;
> @@ -474,6 +491,12 @@ int main(int argc, char **argv)
>                                 ret = EXIT_FAILURE;
>                                 goto loop;
>                         }
> +               } else if (type == 'r') {
> +                       if (bb_recursive(full_name, uid, gid, mode) < 0) {
> +                               bb_perror_msg("line %d: recursive failed
for %s", linenum, full_name);
> +                               ret = EXIT_FAILURE;
> +                               goto loop;
> +                       }
>                 } else
>                 {
>                         dev_t rdev;
> --
> 1.9.1
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150405/257df3f5/attachment.html>
