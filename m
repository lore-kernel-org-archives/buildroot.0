From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Dec 2017 09:56:04 +0100
Subject: [Buildroot] [git commit] traceroute: pass INSTALL=$(INSTALL) as
 install time
Message-ID: <20171217085655.44726827CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4e713bf34a154ccf5e32c98eefff1e8fd3062b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by Peter, using cp during the installation isn't correct,
as it follows symbolic links, potentially over-writing the busybox
binary through its traceroute symbolic link. To avoid that, we pass
INSTALL=$(INSTALL) during the installation step.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/traceroute/traceroute.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/traceroute/traceroute.mk b/package/traceroute/traceroute.mk
index 5d185a2..9d74b8f 100644
--- a/package/traceroute/traceroute.mk
+++ b/package/traceroute/traceroute.mk
@@ -23,7 +23,8 @@ endef
 
 define TRACEROUTE_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		DESTDIR=$(TARGET_DIR) prefix=/usr install -C $(@D)
+		DESTDIR=$(TARGET_DIR) prefix=/usr install \
+		INSTALL=$(INSTALL) -C $(@D)
 endef
 
 $(eval $(generic-package))
