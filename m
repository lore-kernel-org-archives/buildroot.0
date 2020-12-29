From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 14:07:35 +0100
Subject: [Buildroot] [git commit] package/iputils: add SELinux module
Message-ID: <20201229134644.02E8B82830@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=560d42efae6a5bce60e496ddf7b0651f483f67d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for the iputils is added by the admin/netutils module in the
SELinux refpolicy for the following tools :
 - arping
 - ping
 - tracepath
 - traceroute6

Support for rdisc is added by services/rdisc.

Support for tftpd is added by services/tftp.

Note: listing the same SELinux module multiple times is OK, as the list
of modules is eventually $(sort)ed anyway.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
[yann.morin.1998 at free.fr: simplifications to only use positive logic]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/iputils/iputils.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 4f8d9cb768..92974592a6 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -27,6 +27,15 @@ IPUTILS_CONF_OPTS += \
 	-DBUILD_TRACEROUTE6=$(if $(BR2_PACKAGE_IPUTILS_TRACEROUTE6),true,false) \
 	-DBUILD_NINFOD=$(if $(BR2_PACKAGE_IPUTILS_NINFOD),true,false)
 
+# Selectively select the appropriate SELinux refpolicy modules
+IPUTILS_SELINUX_MODULES = \
+	$(if $(BR2_PACKAGE_IPUTILS_ARPING),netutils) \
+	$(if $(BR2_PACKAGE_IPUTILS_PING),netutils) \
+	$(if $(BR2_PACKAGE_IPUTILS_TRACEPATH),netutils) \
+	$(if $(BR2_PACKAGE_IPUTILS_TRACEROUTE6),netutils) \
+	$(if $(BR2_PACKAGE_IPUTILS_RDISC),rdisc) \
+	$(if $(BR2_PACKAGE_IPUTILS_TFTPD),tftp)
+
 #
 # arping
 #
