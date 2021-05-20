From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 20 May 2021 20:16:39 +0200
Subject: [Buildroot] [git commit] package/dhcp: add host-gawk optional
 dependency
Message-ID: <20210520175205.D10C88156F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=085d20e5e684a83736897332a7ec9d3363ea3e51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On hosts where gawk is not available, it is not possible to build the
package with server option (BR2_PACKAGE_DHCP_SERVER).
The build goes through without errors but the binaries are not created
and installed. The reason is that autotools cannot find gawk.

Fixes: Bug 13781

Reported-by: Kay Jeschonneck <kay.jeschonneck@airbus.com>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/dhcp/dhcp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 988c7792dc..8d7157f357 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -55,6 +55,7 @@ define DHCP_INSTALL_LIBS
 endef
 
 ifeq ($(BR2_PACKAGE_DHCP_SERVER),y)
+DHCP_DEPENDENCIES += host-gawk
 define DHCP_INSTALL_CTL_LIBS
 	$(MAKE) -C $(@D)/dhcpctl install-exec DESTDIR=$(TARGET_DIR)
 endef
