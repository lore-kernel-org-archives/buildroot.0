From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 22:14:16 +0100
Subject: [Buildroot] [git commit] Revert "runc: bump to v1.0.0-rc4"
Message-ID: <20171122210707.4FC9C802D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=821df3431254f44bbae444b1eaba62f918526fcc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 3861ce09d0acd6425873332300c6caa75863017f.

As reported on IRC, runc v1.0.0-rc4 is not compatible with the docker-engine
version we are using, so lets revert for 2017.11:

20:27 < eschu> It looks like 25 days ago buildroot had runc updated to
               1.0.0-rc4, which breaks compatibility with the docker-engine
               version 17.05.  Is there somewhere issues like this are
               reported?  Or is it just expected on non-release versions of
               buildroot?

20:47 < Jacmet> eschu: ahh, so the new runc doesn't work with the old
                docker-engine?  what kind of errors do you get exactly?

20:49 < eschu> Jacmet:  yes, runc made a change from -console to
               --console-socket, which results in "Incorrect Usage" error
               "flag provided but not defined: -console"

20:51 < eschu> Jacmet:  basically docker-engine 17.05 uses -console, but
               support for that was cut off in runc around the first 1.0.0
               versions.  I'll check the patches out, or might just
               downgrade to buildroot 2017.08 release

20:51 < agb> Jacmet: unfortunately this issue has hit a number of distributions
             https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=877146

20:53 < Jacmet> agb: thanks.  I'll send a revert for 2017.11 and hopefully
                we can make progress on the other docker packages for
                2018.02

Cc: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index 08e306d..3e188c5 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	3ffefd293932d2ad509701878dd7dd6ef498c3667198a33e8e5d5a3cbce0eeaa	runc-v1.0.0-rc4.tar.gz
+sha256	b5c50d7d9a5f610d5424f96196efa306ec708fd9299302dd919545099c16b7c1	runc-9c2d8d184e5da67c95d601382adf14862e4f2228.tar.gz
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 0b51e11..fb3fec2 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = v1.0.0-rc4
+RUNC_VERSION = 9c2d8d184e5da67c95d601382adf14862e4f2228
 RUNC_SITE = $(call github,opencontainers,runc,$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
@@ -38,8 +38,7 @@ define RUNC_CONFIGURE_CMDS
 endef
 
 define RUNC_BUILD_CMDS
-	cd $(RUNC_GOPATH)/src/github.com/opencontainers/runc && \
-		$(RUNC_MAKE_ENV) $(HOST_DIR)/bin/go \
+	cd $(@D) && $(RUNC_MAKE_ENV) $(HOST_DIR)/bin/go \
 		build -v -o $(@D)/bin/runc \
 		-tags "$(RUNC_GOTAGS)" -ldflags "$(RUNC_GLDFLAGS)" .
 endef
