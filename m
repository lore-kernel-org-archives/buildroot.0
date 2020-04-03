From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 3 Apr 2020 09:53:06 +0200
Subject: [Buildroot] [git commit] package/netdata: link with libatomic when
 needed
Message-ID: <20200403073947.3352D8152C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d7bd6520810d2a4e955ff5a30b6f35db50a1ca83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

netdata uses __atomic_fetch_add_2

Fixes:
 - http://autobuild.buildroot.org/results/1eb033ba7bf85ba3e25572a106f08faf49cd05b2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netdata/netdata.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/netdata/netdata.mk b/package/netdata/netdata.mk
index d169881a9c..529eb24e9c 100644
--- a/package/netdata/netdata.mk
+++ b/package/netdata/netdata.mk
@@ -47,6 +47,10 @@ else
 NETDATA_CONF_OPTS += --disable-https
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+NETDATA_CONF_ENV += LIBS=-latomic
+endif
+
 define NETDATA_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/netdata/S60netdata \
 		$(TARGET_DIR)/etc/init.d/S60netdata
