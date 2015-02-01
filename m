From: Alex Suykov <alex.suykov@gmail.com>
Date: Sun, 1 Feb 2015 19:56:01 +0200
Subject: [Buildroot] [PATCH] package/benejson: disable for static-only
 builds
In-Reply-To: <1422743798-18921-1-git-send-email-yann.morin.1998@free.fr>
References: <1422743798-18921-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150201175601.GA28929@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sat, Jan 31, 2015 at 11:36:38PM +0100, Yann E. MORIN wrote:

> benejson does not know how to build static-only libraries. as well,
> it is not able to build shared-only libs either.
Well, actually scons allows specifying targets explicitly.

Benejson is just a small library, so it should not cause much
trouble later. And there's already a similar block with install
commands anyway.


--- a/package/benejson/benejson.mk
+++ b/package/benejson/benejson.mk
@@ -20,10 +20,18 @@ endef
 BENEJSON_POST_PATCH_HOOKS += BENEJSON_DISABLE_WCHAR
 endif
 
+BENEJSON_SCONS_TARGETS = include
+ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+BENEJSON_SCONS_TARGETS += lib/libbenejson.a
+endif
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+BENEJSON_SCONS_TARGETS += lib/libbenejson.so
+endif
+
 define BENEJSON_BUILD_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS) CROSS=$(TARGET_CROSS) \
-		$(SCONS))
+		$(SCONS) $(BENEJSON_SCONS_TARGETS))
 endef
 
 ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
