From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Nov 2018 21:53:22 +0100
Subject: [Buildroot] [git commit] package/strace: don't remove strace-graph
 unconditionally
Message-ID: <20181202071600.07519803E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe3d60edf292a3c4609ccda5527f113297ac9d44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

strace-graph is a perl script. This script is removed unconditionally
since commit 720c0ca5ba7 ("strace: convert to makefile.autotools.in
format") from 2008. Since then Buildroot added support for perl on
target. Don't remove strace-graph when perl is built for target.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
[Thomas: move the hook definition inside the condition.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/strace/strace.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 471dbc2e1d..6efe9c5174 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -34,10 +34,12 @@ else
 STRACE_CONF_OPTS += --without-libiberty
 endif
 
+ifeq ($(BR2_PACKAGE_PERL),)
 define STRACE_REMOVE_STRACE_GRAPH
 	rm -f $(TARGET_DIR)/usr/bin/strace-graph
 endef
 
 STRACE_POST_INSTALL_TARGET_HOOKS += STRACE_REMOVE_STRACE_GRAPH
+endif
 
 $(eval $(autotools-package))
