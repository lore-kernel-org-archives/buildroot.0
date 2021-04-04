From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Apr 2021 11:24:47 +0200
Subject: [Buildroot] [git commit branch/2020.11.x] package/netsnmp: fix
 script net-snmp-create-v3-user's usage of 'ps'.
Message-ID: <20210404090013.6081B8B72E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6775abacaf0fc680266fce60a8c9299d221ce489
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

net-snmp-create-v3-user uses ps to check if snmpd is running.  To know
how to invoke 'ps', the build system use 'which ps' and does other
checks for the output format of 'ps', therefore inspecting 'ps' on the
build machine instead of the target.

If the build machine runs a OS like Debian, that uses a merged-usr and a
PATH of '/usr/bin:/bin', then 'which ps' returns /usr/bin/ps, which will
not work on the target if it does not also use a merged-usr.

Hardcode 'ps' to be /bin/ps to fix this issue and to improve build
reproducibility.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 57d339f20bdb46f509fff37629b0e0725241b26d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netsnmp/netsnmp.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 904279d1fb..c97953c683 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -10,7 +10,9 @@ NETSNMP_SOURCE = net-snmp-$(NETSNMP_VERSION).tar.gz
 NETSNMP_LICENSE = Various BSD-like
 NETSNMP_LICENSE_FILES = COPYING
 NETSNMP_INSTALL_STAGING = YES
-NETSNMP_CONF_ENV = ac_cv_NETSNMP_CAN_USE_SYSCTL=no
+NETSNMP_CONF_ENV = \
+	ac_cv_NETSNMP_CAN_USE_SYSCTL=no \
+	ac_cv_path_PSPROG=/bin/ps
 NETSNMP_CONF_OPTS = \
 	--with-persistent-directory=/var/lib/snmp \
 	--with-defaults \
