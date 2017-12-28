From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Dec 2017 23:25:43 +0100
Subject: [Buildroot] [git commit] erlang: remove non-SMP build option
Message-ID: <20171228222546.A048A80294@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c68ec4297ec9fea58fab910fe095bbfefd11c6f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The non-SMP scheduler was deprecated with the Erlang/OTP 20.0 release and
slated for removal with the next major Erlang release. Since the non-SMP
scheduler isn't even built anymore, this option no longer has the
intended effect of saving space or compile time. The SMP scheduler
supports both SMP and non-SMP processors, so removing the option will
not break any platforms.

We do not need to add a legacy entry, because the new behavior is the
same as with the option previously set (i.e. SMP enabled).

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang/Config.in | 10 ----------
 package/erlang/erlang.mk |  4 ----
 2 files changed, 14 deletions(-)

diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 1cd93ca..96af551 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -27,16 +27,6 @@ config BR2_PACKAGE_ERLANG
 
 if BR2_PACKAGE_ERLANG
 
-config BR2_PACKAGE_ERLANG_SMP
-	bool "enable SMP support"
-	help
-	  Erlang provides both a UP and an SMP emulator. The UP
-	  emulator is always built, and this option enables
-	  compilation of the SMP emulator. The choice of which
-	  emulator to use is made at runtime. If you do not need SMP
-	  support, turning this option off reduces compile time and
-	  the size of the Erlang installation.
-
 config BR2_PACKAGE_ERLANG_MEGACO
 	bool "install megaco application"
 	help
diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 733c1d5..5705b98 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -74,10 +74,6 @@ ERLANG_CONF_OPTS += --enable-shared-zlib
 ERLANG_DEPENDENCIES += zlib
 endif
 
-ifeq ($(BR2_PACKAGE_ERLANG_SMP),)
-ERLANG_CONF_OPTS += --disable-smp-support
-endif
-
 # Remove source, example, gs and wx files from staging and target.
 ERLANG_REMOVE_PACKAGES = gs wx
 
