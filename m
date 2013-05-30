From: Lionel Orry <lionel.orry@gmail.com>
Date: Thu, 30 May 2013 11:47:21 +0200
Subject: [Buildroot] [PATCH] ext-toolchain-wrapper: fix paths if
 executable was resolved by PATH
In-Reply-To: <51A5CD3F.1070100@fh-kl.de>
References: <51A5CD3F.1070100@fh-kl.de>
Message-ID: <CAKAx1cjJfwT9hGSDSxHAvNOz3PjqB7jY7A4DWL6RvB78uVEXNA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 29, 2013 at 11:41 AM, Patrick Ziegler
<patrick.ziegler@fh-kl.de> wrote:
> If ext-toolchain-wrapper or any symbolic link to it was resolved by PATH,
> the wrapper takes the working directory to calculate the relative paths.
>
> Now '/proc/self/exe' is used to resolve the absolute path to the toolchain
> directory if the wrapper was called neither with a relative nor an absolute
> path.

This patch saved my day and I could remove my own weird customizations
to ext-toolchain-wrapper. Works like a charm, I'd like to see it
integrated.

BR,
Lionel

>
> Signed-off-by: Patrick Ziegler <patrick.ziegler@fh-kl.de>
> ---
>  toolchain/toolchain-external/ext-toolchain-wrapper.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
> index 9a2fc70..e71a90a 100644
> --- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
> +++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
> @@ -61,7 +61,7 @@ int main(int argc, char **argv)
>         char *relbasedir, *absbasedir;
>         char *progpath = argv[0];
>         char *basename;
> -       int ret;
> +       int ret, i, count = 0;
>
>         /* Calculate the relative paths */
>         basename = strrchr(progpath, '/');
> @@ -77,7 +77,19 @@ int main(int argc, char **argv)
>                 absbasedir = realpath(relbasedir, NULL);
>         } else {
>                 basename = progpath;
> -               absbasedir = realpath("../..", NULL);
> +               absbasedir = malloc(PATH_MAX + 1);
> +               ret = readlink("/proc/self/exe", absbasedir, PATH_MAX);
> +               if (ret < 0) {
> +                       perror(__FILE__ ": readlink");
> +                       return 2;
> +               }
> +               for (i = ret; i > 0; i--) {
> +                       if ('/' == absbasedir[i]) {
> +                               absbasedir[i] = '\0';
> +                               if (3 == ++count)
> +                                       break;
> +                       }
> +               }
>         }
>         if (absbasedir == NULL) {
>                 perror(__FILE__ ": realpath");
> --
> 1.8.1.2
>
>
> --
> Dipl.-Inf. (FH) Patrick Ziegler
>
> University Of Applied Sciences
> Kaiserslautern
>
> Amerikastrasse 1
> D-66482 Zweibruecken
> Germany
>
> Phone:  +49 631 3724 5526
> Mail:   patrick.ziegler at fh-kl.de
> PGP KeyID 0xB4796B8C
>
> http://www.fh-kl.de
> http://www.fh-kl.de/fachbereiche/imst/iuk-knowhow.html
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
