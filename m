From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jan 2018 23:22:52 +0100
Subject: [Buildroot] [git commit] iputils: fix ping and traceroute6
 executable permissions
Message-ID: <20180117222303.ECFAB83E41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0e2d00289eeb1a7201ba49e5cedfd3175f92140
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The iputils executables are installed without the setuid bit set,
which prevents some programs from working.

This patch adds a permission table to fix the permissions of the ping
and traceroute6 executables.

Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iputils/iputils.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index b20cd12..13e3389 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -69,4 +69,9 @@ define IPUTILS_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 755 $(@D)/traceroute6 $(TARGET_DIR)/bin/traceroute6
 endef
 
+define IPUTILS_PERMISSIONS
+	/bin/ping        f 4755 0 0 - - - - -
+	/bin/traceroute6 f 4755 0 0 - - - - -
+endef
+
 $(eval $(generic-package))
