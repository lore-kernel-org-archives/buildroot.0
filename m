From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 12:57:28 +0100
Subject: [Buildroot] [git commit] netsniff-ng:Prevent finding host installed
	nacl
Message-ID: <20151217115732.90AC982531@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=049ed21a640f6c5e4cbfff3518654cddc60eefad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netsniff-ng/netsniff-ng.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
index 4fed88c..40eecab 100644
--- a/package/netsniff-ng/netsniff-ng.mk
+++ b/package/netsniff-ng/netsniff-ng.mk
@@ -8,6 +8,10 @@ NETSNIFF_NG_VERSION = v0.5.9
 NETSNIFF_NG_SITE = $(call github,netsniff-ng,netsniff-ng,$(NETSNIFF_NG_VERSION))
 NETSNIFF_NG_LICENSE = GPLv2
 NETSNIFF_NG_LICENSE_FILES = README COPYING
+# Prevent netsniff-ng configure script from finding a host installed nacl
+NETSNIFF_NG_CONF_ENV = \
+	NACL_INC_DIR=/dev/null \
+	NACL_LIB_DIR=/dev/null
 NETSNIFF_NG_DEPENDENCIES = \
 	libnl libpcap libcli libnetfilter_conntrack \
 	liburcu libnet
@@ -15,6 +19,7 @@ NETSNIFF_NG_DEPENDENCIES = \
 # hand-written configure script and makefile
 define NETSNIFF_NG_CONFIGURE_CMDS
 	(cd $(@D); \
+		$(NETSNIFF_NG_CONF_ENV) \
 		$(TARGET_CONFIGURE_ARGS) \
 		$(TARGET_CONFIGURE_OPTS) \
 		./configure \
