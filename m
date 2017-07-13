From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 13 Jul 2017 10:25:48 -0400
Subject: [Buildroot] [PATCH 1/2] uclibc-ng: enable fts in default config
	file.
Message-ID: <20170713142549.28078-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

currently there are a few packages in buildroot that are set to not
be selectable unless the user wishes to use glibc specifically because
the package uses fts.h.

uClibc actually does have a fts implimentation, and it's selectable in
uclib-menuconfig.  However; this has two issues with it:

1) Most users wouldn't know that there is even a uClibc-menuconfig
2) Even if the user does select fts support in uClibc-menuconfig, the
   packages that would now compile and work would still not be selectable
   because they explicitly require BR2_TOOLCHAIN_USES_GLIBC.

Enabling fts support increases the size of uclibc by 75~kb according to
the menuconfig option.  This is a acceptable size increase to fix the
few packages that require fts.h support.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/uclibc/uClibc-ng.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uclibc/uClibc-ng.config b/package/uclibc/uClibc-ng.config
index 5beb2bd90..3a3a15fa3 100644
--- a/package/uclibc/uClibc-ng.config
+++ b/package/uclibc/uClibc-ng.config
@@ -33,6 +33,7 @@ UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
 UCLIBC_HAS_PRINTF_M_SPEC=y
 UCLIBC_HAS_WORDEXP=y
 UCLIBC_HAS_NFTW=y
+UCLIBC_HAS_FTS=y
 UCLIBC_HAS_FTW=y
 UCLIBC_HAS_GNU_GLOB=y
 RUNTIME_PREFIX="/"
-- 
2.13.0
