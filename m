From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Jan 2018 22:19:14 +0100
Subject: [Buildroot] [git commit] package/kmsxx: don't install static
 libraries when BR2_SHARED_STATIC_LIBS=y
Message-ID: <20180110212116.F0D4182756@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28d5ca9c96f5144e86fac7ec6485fa5634cd6e97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The kmsxx build system can only build either shared libraries *or*
static libraries, not both. Therefore, the build currently fails when
BR2_SHARED_STATIC_LIBS=y because we try to install the static
libraries, that haven't been built.

We fix this by not installing the static libraries when
BR2_SHARED_STATIC_LIBS=y, making BR2_SHARED_STATIC_LIBS=y essentially
the same as BR2_SHARED_LIBS=y for this package.

Fixes bug #10331.

Reported-by:  Frederic MATHIEU <frederic.mathieu@dualis.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kmsxx/kmsxx.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
index 5c4a0c1..dc0f8c1 100644
--- a/package/kmsxx/kmsxx.mk
+++ b/package/kmsxx/kmsxx.mk
@@ -44,12 +44,15 @@ define KMSXX_INSTALL_TARGET_CMDS
 	$(KMSXX_INSTALL_TARGET_TESTS)
 endef
 
+# kmsxx only builds shared or static libraries, so when
+# BR2_SHARED_STATIC_LIBS=y, we don't have any static library to
+# install
 define KMSXX_INSTALL_STAGING_CMDS
 	$(foreach l,$(KMSXX_LIBS),\
 		$(if $(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),
 			$(INSTALL) -D -m 0755 $(@D)/lib/lib$(l).so \
 				$(STAGING_DIR)/usr/lib/lib$(l).so)
-		$(if $(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),
+		$(if $(BR2_STATIC_LIBS),
 			$(INSTALL) -D -m 0755 $(@D)/lib/lib$(l).a \
 				$(STAGING_DIR)/usr/lib/lib$(l).a)
 		mkdir -p $(STAGING_DIR)/usr/include/$(l)
