From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 08:07:05 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] iputils: fix ping and
 traceroute6 executable permissions
Message-ID: <20180131075150.7ADC488171@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca8e637eb49a67fac590590424e336f97b46d2d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

The iputils executables are installed without the setuid bit set,
which prevents some programs from working.

This patch adds a permission table to fix the permissions of the ping
and traceroute6 executables.

Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit b0e2d00289eeb1a7201ba49e5cedfd3175f92140)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iputils/iputils.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 21f5dcbe06..d3a12ac62c 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -76,4 +76,9 @@ define IPUTILS_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 755 $(@D)/traceroute6 $(TARGET_DIR)/bin/traceroute6
 endef
 
+define IPUTILS_PERMISSIONS
+	/bin/ping        f 4755 0 0 - - - - -
+	/bin/traceroute6 f 4755 0 0 - - - - -
+endef
+
 $(eval $(generic-package))
