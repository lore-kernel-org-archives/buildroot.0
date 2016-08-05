From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  5 Aug 2016 19:07:59 +0200
Subject: [Buildroot] [PATCH 1/2] iproute2: fix no-thread build
Message-ID: <1470416880-16148-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

iproute2 believes that it needs to link with libpthread for its arpd
binary, because "some db implementations require thread". Therefore, our
iproute2.mk explicitly disables the build of arpd when thread support is
not available.

However, the sed expression it uses no longer works. The Makefile used
to look like:

TARGETS = foo baz baz arpd foobar

so replacing " arpd " with a space was working fine. However, the
Makefile got changed in iproute2 to:

ifeq (... berkeleydb available ...)
     TARGETS += arpd
endif

i.e, with no space at the end of the line. This made our sed expression
ineffective, causing build issues with no-thread configurations since
arpd was no longer disabled.

To address this, instead of sed-ing the Makefile, we overwrite the
berkeleydb detection of iproute2, by writing to the "Config" file, like
we're doing for other aspects of the package.

Fixes:

  http://autobuild.buildroot.net/results/03a37a2372a4c2e438a073e015c49d9e554b86b7/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iproute2/iproute2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 91d5033..edc17ad 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -42,7 +42,7 @@ ifeq ($(BR2_PACKAGE_BERKELEYDB_COMPAT185)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
 IPROUTE2_DEPENDENCIES += berkeleydb
 else
 define IPROUTE2_DISABLE_ARPD
-	$(SED) "/^TARGETS=/s: arpd : :" $(IPROUTE2_DIR)/misc/Makefile
+	echo "HAVE_BERKELEY_DB:=n" >> $(IPROUTE2_DIR)/Config
 endef
 endif
 
-- 
2.7.4
