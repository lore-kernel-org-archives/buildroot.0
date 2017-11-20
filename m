From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 20 Nov 2017 13:08:59 -0500
Subject: [Buildroot] [NEXT v3 2/8] libpjsip: add portaudio option
In-Reply-To: <20171120180905.5903-1-aduskett@gmail.com>
References: <20171120180905.5903-1-aduskett@gmail.com>
Message-ID: <20171120180905.5903-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, --with-external-pa also has no effect on the build result,
other than giving the warning:
<command-line>:0:0: warning: "PJMEDIA_AUDIO_DEV_HAS_PORTAUDIO" redefined

 Indeed, os-auto.mk will set this define twice: it is set to 1 due to
--with-external-pa, and then set to 0 due to --enable-sound
(AC_PJMEDIA_SND=alsa) or --disable-sound (AC_PJMEDIA_SND=null). The 0 "wins" so
portaudio is not used at all.

Instead of adding an explicit --without-external-pa, I patched the build system
to set PJMEDIA_AUDIO_DEV_HAS_PORTAUDIO properly, submitted the patch upstream,
and ran several tests to make sure that the code functions properly.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - Remove the option to enable or disable portaudio support in favor of
    just depending on portaudio if it's selected by the user.
    
Changes v2 -> v3:
  - Re-add the option to enable or disable support
  - Add 0002-fix-building-against-external-portaudio.patch to fix the broken
    --with-external-pa option.
  - select BR2_PACKAGE_LIBPJSIP_ALSA if portaudio is selected with a note in
    the Config.in as to why.

 ...2-fix-building-against-external-portaudio.patch | 75 ++++++++++++++++++++++
 package/libpjsip/Config.in                         |  7 ++
 package/libpjsip/libpjsip.mk                       |  9 +++
 3 files changed, 91 insertions(+)
 create mode 100644 package/libpjsip/0002-fix-building-against-external-portaudio.patch

diff --git a/package/libpjsip/0002-fix-building-against-external-portaudio.patch b/package/libpjsip/0002-fix-building-against-external-portaudio.patch
new file mode 100644
index 0000000..9fe6a98
--- /dev/null
+++ b/package/libpjsip/0002-fix-building-against-external-portaudio.patch
@@ -0,0 +1,75 @@
+From d173d3bc68bdfdcc1f00baff903072b3e89c6c36 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Mon, 20 Nov 2017 11:45:13 -0500
+Subject: [PATCH] fix building against external portaudio
+
+currently, --with-external-pa has no effect other than giving the warning
+<command-line>:0:0: warning: "PJMEDIA_AUDIO_DEV_HAS_PORTAUDIO" redefined
+
+os-auto.mk will set this define twice if alsa is selected:
+1 due to the --with-external-pa
+0 due to the --enable-sound
+
+This is a simple fix:
+- Add linking to portaudio if --with-external-pa is defined.
+- Remove the hardcoded PJMEDIA_AUDIO_DEV_HAS_PORTAUDIO 0 if alsa is selected
+  and instead move it to a else clause when checking if --with-external-pa was
+  passed at configure time.
+
+upstream-status: pending
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ aconfigure                   | 1 +
+ aconfigure.ac                | 1 +
+ pjmedia/build/os-auto.mak.in | 3 ++-
+ 3 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/aconfigure b/aconfigure
+index aec2a28..23bf9a6 100755
+--- a/aconfigure
++++ b/aconfigure
+@@ -6281,6 +6281,7 @@ _ACEOF
+ if ac_fn_c_try_compile "$LINENO"; then :
+   { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes!!" >&5
+ $as_echo "yes!!" >&6; }
++				  LIBS="$LIBS -lportaudio"
+ 				   ac_external_pa="1"
+ 
+ else
+diff --git a/aconfigure.ac b/aconfigure.ac
+index e9770b7..432b56a 100644
+--- a/aconfigure.ac
++++ b/aconfigure.ac
+@@ -675,6 +675,7 @@ AC_ARG_WITH(external-pa,
+ 						     ]],
+ 						  [Pa_Initialize();])],
+ 				  [AC_MSG_RESULT(yes!!)
++				  [LIBS="$LIBS -lportaudio"]
+ 				   ac_external_pa="1"
+ 				   ],
+ 				  [AC_MSG_ERROR([Unable to use PortAudio. If PortAudio development files are not available in the default locations, use CFLAGS and LDFLAGS env var to set the include/lib paths])])
+diff --git a/pjmedia/build/os-auto.mak.in b/pjmedia/build/os-auto.mak.in
+index f998f66..5881e65 100644
+--- a/pjmedia/build/os-auto.mak.in
++++ b/pjmedia/build/os-auto.mak.in
+@@ -190,6 +190,8 @@ endif
+ ifeq (@ac_external_pa@,1)
+ # External PA
+ export CFLAGS += -DPJMEDIA_AUDIO_DEV_HAS_PORTAUDIO=1
++else
++export CFLAGS += -DPJMEDIA_AUDIO_DEV_HAS_PORTAUDIO=0
+ endif
+ 
+ #
+@@ -235,7 +237,6 @@ endif
+ #
+ ifneq ($(findstring alsa,$(AC_PJMEDIA_SND)),)
+ export CFLAGS += -DPJMEDIA_AUDIO_DEV_HAS_ALSA=1 \
+-		 -DPJMEDIA_AUDIO_DEV_HAS_PORTAUDIO=0 \
+ 		 -DPJMEDIA_AUDIO_DEV_HAS_WMME=0
+ endif
+ 
+-- 
+2.13.6
+
diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index 0e03ebf..4d4777a 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -18,6 +18,13 @@ config BR2_PACKAGE_LIBPJSIP_ALSA
 	bool "alsa support"
 	select BR2_PACKAGE_ALSA_LIB
 
+config BR2_PACKAGE_LIBPJSIP_PORTAUDIO
+	bool "portaudio support"
+	select BR2_PACKAGE_PORTAUDIO
+	# portaudio can compile without alsa, but it will
+	# disable sound, which would be useless.
+	select BR2_PACKAGE_LIBPJSIP_ALSA
+
 endif #BR2_PACKAGE_LIBPJSIP
 
 comment "libpjsip needs a toolchain w/ C++, threads"
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index e4b726e..850b3c0 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -74,4 +74,13 @@ else
 LIBPJSIP_CONF_OPTS += --disable-sound
 endif
 
+ifeq ($(BR2_PACKAGE_LIBPJSIP_PORTAUDIO),y)
+LIBPJSIP_DEPENDENCIES += portaudio
+LIBPJSIP_CONF_OPTS += --with-external-pa
+else
+LIBPJSIP_CONF_OPTS += --without-external-pa
+endif
+
+
+
 $(eval $(autotools-package))
-- 
2.13.6
