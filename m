From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 9 May 2018 16:55:36 +0200
Subject: [Buildroot] [PATCH] xfsprogs: bump to 4.16.1
In-Reply-To: <1525876323-62495-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1525876323-62495-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180509165536.14b0c47b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  9 May 2018 09:32:03 -0500, Matt Weber wrote:

> diff --git a/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch b/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
> index 74636c2..9030a2a 100644
> --- a/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
> +++ b/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
> @@ -14,6 +14,8 @@ Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>  [Sent upstream: https://www.spinics.net/lists/xfs/msg36149.html]
>  [baruch: update for v4.15.1; extend to include scrub]
>  Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> +[matt: update for v4.16.1; adjusted libunistring -> libicu]
> +Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
>  ---
>   mdrestore/Makefile | 2 +-
>   scrub/Makefile     | 2 +-
> @@ -38,8 +40,8 @@ index 063279400262..949f6fd8ba94 100644
>  +++ b/scrub/Makefile
>  @@ -70,7 +70,7 @@ xfs_scrub.c
>   
> - LLDLIBS += $(LIBHANDLE) $(LIBFROG) $(LIBPTHREAD) $(LIBUNISTRING) $(LIBRT)
> - LTDEPENDENCIES += $(LIBHANDLE) $(LIBFROG) $(LIBUNISTRING) $(LIBRT)
> + LLDLIBS += $(LIBHANDLE) $(LIBFROG) $(LIBPTHREAD) $(LIBICU_LIBS) $(LIBRT)
> + LTDEPENDENCIES += $(LIBHANDLE) $(LIBFROG)

Does this also remove $(LIBRT) ?

Why is this now done in patch 0001, while it was done in 


> diff --git a/package/xfsprogs/0005-xfs_scrub-fix-cross-compile-with-libunistring.patch b/package/xfsprogs/0005-xfs_scrub-fix-cross-compile-with-libunistring.patch
> deleted file mode 100644
> index dfb66c6..0000000
> --- a/package/xfsprogs/0005-xfs_scrub-fix-cross-compile-with-libunistring.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From 45d9ba0f01cceb75f72d157a9e4d9aaeb753a9c4 Mon Sep 17 00:00:00 2001
> -From: Baruch Siach <baruch@tkos.co.il>
> -Date: Tue, 20 Mar 2018 14:13:28 +0200
> -Subject: [PATCH] xfs_scrub: fix cross compile with libunistring
> -
> -Commit 4bbed4ecc2a (xfs_scrub: warn about normalized Unicode name collisions)
> -added -lunistring to the list of the xfs_scrub dependencies. When cross
> -compiling make fails to find the library on the target sysroot:
> -
> -make[3]: *** No rule to make target `-lunistring', needed by `xfs_scrub'.  Stop.
> -
> -Remove -lunistring from make dependencies of xfs_scrub to fix that.
> -
> -Cc: Darrick J. Wong <darrick.wong@oracle.com>
> -Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ----
> -Upstream status: https://patchwork.kernel.org/patch/10296957/
> -
> - scrub/Makefile | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/scrub/Makefile b/scrub/Makefile
> -index 949f6fd8ba94..979603f524ff 100644
> ---- a/scrub/Makefile
> -+++ b/scrub/Makefile
> -@@ -69,7 +69,7 @@ vfs.c \
> - xfs_scrub.c
> - 
> - LLDLIBS += $(LIBHANDLE) $(LIBFROG) $(LIBPTHREAD) $(LIBUNISTRING) $(LIBRT)
> --LTDEPENDENCIES += $(LIBHANDLE) $(LIBFROG) $(LIBUNISTRING) $(LIBRT)
> -+LTDEPENDENCIES += $(LIBHANDLE) $(LIBFROG) $(LIBRT)

this patch before ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
