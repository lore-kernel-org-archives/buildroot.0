From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jan 2014 10:03:44 -0300
Subject: [Buildroot] [PATCH] mpd: add more gcc exclusions
Message-ID: <1389791024-15833-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The codesourcery powerpc toolchains also include a gcc that's too old
for mpd to build properly. Fixes:
http://autobuild.buildroot.net/results/be0/be0aff9814ded4ba74999283530b805af01992da/

Also add toolchain comment exclusion for avr32 & sparc since it won't be
available anyway.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mpd/Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 5a03a62..063c65d 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -4,7 +4,9 @@ menuconfig BR2_PACKAGE_MPD
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
-	depends on !(BR2_avr32 || BR2_sparc) # gcc too old
+	# avr32, sparc & CS powerpc gcc are too old
+	depends on !(BR2_avr32 || BR2_sparc)
+	depends on !(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 || BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009)
 	depends on !BR2_UCLIBC_VERSION_0_9_32 # lacks signalfd
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
@@ -200,5 +202,6 @@ endif
 
 comment "mpd needs a toolchain w/ C++, threads, wchar"
 	depends on BR2_USE_MMU
+	depends on !(BR2_avr32 || BR2_sparc)
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.3.2
