From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Nov 2018 08:17:43 +0100
Subject: [Buildroot] [git commit] make: configure host-make with host- prefix
Message-ID: <20181120071904.9E94A8104C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=446a6f91b236ad48f01caa357f530699f443460f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
 package/make/make.mk                    | 4 ++++
 support/dependencies/check-host-make.mk | 4 ++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/make/make.mk b/package/make/make.mk
index 1471576850..10082353a2 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -23,5 +23,9 @@ endif
 HOST_MAKE_DEPENDENCIES = host-pkgconf
 HOST_MAKE_CONF_OPTS = --without-guile
 
+# Configure host-make binary to be 'host-make' to ensure it isn't
+# accidently used by packages when they invoke recursive / sub-make.
+HOST_MAKE_CONF_OPTS += --program-prefix=host-
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
