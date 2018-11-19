From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Nov 2018 15:55:43 +0100
Subject: [Buildroot] [PATCH v2 3/3] make: install host-make as host-make
In-Reply-To: <20181119145544.3466-1-peter@korsgaard.com>
References: <20181119145544.3466-1-peter@korsgaard.com>
Message-ID: <20181119145544.3466-3-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/e29/e293aadc692d2ed337881ef2172ddf66a60bc05c/

And many more.

Install as 'host-make' rather than just 'make', as that otherwise confuses a
number of packages when they invoke recursive / sub-make.  The internal job
control logic of GNU make is version dependant, so mixing versions may lead
to issues like:

make[1]: Entering directory `/home/peko/autobuild/instance-0/output/build/boa-0.94.14rc21'
(cd src && make -w --jobserver-fds=5,6 -j)
make: unrecognized option '--jobserver-fds=5,6'

With this rename, only packages explicitly opting in for our host-make
(using the BR2_MAKE / BR2_MAKE_HOST_DEPENDENCY logic) will use it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
v2: No changes
 package/make/make.mk                    | 7 +++++++
 support/dependencies/check-host-make.mk | 4 ++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/make/make.mk b/package/make/make.mk
index 1471576850..31915d192e 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -23,5 +23,12 @@ endif
 HOST_MAKE_DEPENDENCIES = host-pkgconf
 HOST_MAKE_CONF_OPTS = --without-guile
 
+# Rename host-make binary to ensure it isn't accidently used by
+# packages when they invoke recursive / sub-make.
+define HOST_MAKE_RENAME_BINARY
+	mv $(HOST_DIR)/bin/make $(HOST_DIR)/bin/host-make
+endef
+HOST_MAKE_POST_INSTALL_HOOKS += HOST_MAKE_RENAME_BINARY
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/support/dependencies/check-host-make.mk b/support/dependencies/check-host-make.mk
index 4235a393fd..66560ee85c 100644
--- a/support/dependencies/check-host-make.mk
+++ b/support/dependencies/check-host-make.mk
@@ -12,8 +12,8 @@ BR2_MAKE ?= $(call suitable-host-package,make,\
 	$(BR2_MAKE_VERSION_MIN) $(MAKE))
 
 ifeq ($(BR2_MAKE),)
-BR2_MAKE = $(HOST_DIR)/bin/make -j$(PARALLEL_JOBS)
-BR2_MAKE1 = $(HOST_DIR)/bin/make -j1
+BR2_MAKE = $(HOST_DIR)/bin/host-make -j$(PARALLEL_JOBS)
+BR2_MAKE1 = $(HOST_DIR)/bin/host-make -j1
 BR2_MAKE_HOST_DEPENDENCY = host-make
 else
 BR2_MAKE = $(MAKE)
-- 
2.11.0
