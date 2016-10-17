From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 17 Oct 2016 22:16:00 +0200
Subject: [Buildroot] [PATCH] trinity: not available on musl
In-Reply-To: <1476721016-21596-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1476721016-21596-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <CAHXCMMK_BqdLO-FDqGUn8DaJcwZoxmnP-YoqMptE+QK9A+Bfow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Oct 17, 2016 at 6:16 PM, Rahul Bedarkar
<rahul.bedarkar@imgtec.com> wrote:
> After fixing following build failures with musl:
>
> * error: unknown type name __uint32_t and __uint64_t
> * error: unknown type name pid_t and uid_t
> * error: fatal error: bits/sockaddr.h: No such file or directory
>
> it fails with
>
>   fds/files.c: In function 'file_tree_callback':
>   fds/files.c:172:10: error: 'FTW_CONTINUE' undeclared (first use in this function)
>      return FTW_CONTINUE;
>             ^
>   fds/files.c:172:10: note: each undeclared identifier is reported only once for each function it appears in
>   fds/files.c:178:10: error: 'FTW_SKIP_SUBTREE' undeclared (first use in this function)
>      return FTW_SKIP_SUBTREE;
>             ^
>   fds/files.c:185:10: error: 'FTW_STOP' undeclared (first use in this function)
>      return FTW_STOP;
>             ^
>   fds/files.c: In function 'open_fds_from_path':
>   fds/files.c:197:26: error: 'FTW_ACTIONRETVAL' undeclared (first use in this function)
>     int flags = FTW_DEPTH | FTW_ACTIONRETVAL | FTW_MOUNT;
>
> As per ftw man-page, flag FTW_ACTIONRETVAL is specific to glibc. It is
> not available on musl. Since package uses it unconditionally, we mark
> it not available on musl.
>
> Fixes:
>   http://autobuild.buildroot.net/results/cb4/cb4a665746652679487dee2c2e4bca881be3724b/
>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  package/trinity/Config.in | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/package/trinity/Config.in b/package/trinity/Config.in
> index 2495e5d..02cd20a 100644
> --- a/package/trinity/Config.in
> +++ b/package/trinity/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_TRINITY
>         bool "trinity"
>         depends on BR2_USE_MMU # fork()
> +       depends on !BR2_TOOLCHAIN_USES_MUSL # FTW_ACTIONRETVAL
>         depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 || \
>                 BR2_mips || BR2_mipsel || BR2_powerpc || BR2_powerpc64 || \
>                 BR2_powerpc64le || BR2_sparc || BR2_x86_64
> @@ -8,3 +9,10 @@ config BR2_PACKAGE_TRINITY
>           A Linux System call fuzz tester
>
>           http://codemonkey.org.uk/projects/trinity/
> +
> +comment "trinity needs a uClibc or glibc toolchain"

Not only glibc toolchains, but also uclibc-ng ones.

> +       depends on BR2_USE_MMU
> +       depends on BR2_TOOLCHAIN_USES_MUSL
> +       depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 || \
> +               BR2_mips || BR2_mipsel || BR2_powerpc || BR2_powerpc64 || \
> +               BR2_powerpc64le || BR2_sparc || BR2_x86_64
> --
> 2.6.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,

-- 
Samuel
