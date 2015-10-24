From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 24 Oct 2015 23:00:45 +0200
Subject: [Buildroot] [PATCH v5 05/36] package/efl/libefl: regenerate the
	configure script
In-Reply-To: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1445720476-21517-6-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Workaround a build issue with eldbus-codegen:

  CCLD     bin/eldbus/eldbus-codegen
  CXXLD    bin/eolian_cxx/eolian_cxx
  CCLD     lib/ecore_x/ecore_x_vsync
  CCLD     lib/evas/common/libevas_op_blend_sse3.la
  CCLD     lib/evas/common/libevas_convert_rgb_32.la
  CCLD     lib/ecore_ipc/libecore_ipc.la
[...]/i686-ctng-linux-gnu/bin/ld: warning: libefl.so.1, needed by lib/ecore/.libs/libecore.so, not found (try using -rpath or -rpath-link)
lib/ecore/.libs/libecore.so: undefined reference to `efl_control_suspend_set'
lib/ecore/.libs/libecore.so: undefined reference to `efl_control_interface_get'
collect2: error: ld returned 1 exit status
Makefile:19135: recipe for target 'bin/eldbus/eldbus-codegen' failed
make[6]: *** [bin/eldbus/eldbus-codegen] Error 1

A dependency on libefl seems to be missing for eldbus but by
regenerating eldbus-codegen build correctly.

Reported upstream: https://phab.enlightenment.org/T2718

Also, gettextize is needed since *.po files were generated with
an "old" gettext version (0.18):

Making all in po
*** error: gettext infrastructure mismatch: using a Makefile.in.in from gettext version 0.18 but the autoconf macros are from gettext version 0.19
Makefile:149: recipe for target 'check-macro-version' failed

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v4: rename to libefl
v3: fix gettextize
---
 package/efl/libefl/libefl.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
index 781f397..609ae6a 100644
--- a/package/efl/libefl/libefl.mk
+++ b/package/efl/libefl/libefl.mk
@@ -15,6 +15,11 @@ LIBEFL_INSTALL_STAGING = YES
 
 LIBEFL_DEPENDENCIES = host-pkgconf host-libefl dbus freetype jpeg lua udev zlib
 
+# regenerate the configure script:
+# https://phab.enlightenment.org/T2718
+LIBEFL_AUTORECONF = YES
+LIBEFL_GETTEXTIZE = YES
+
 # Configure options:
 # --disable-cxx-bindings: disable C++11 bindings.
 # --enable-lua-old: disable Elua and remove luajit dependency.
-- 
2.4.3
