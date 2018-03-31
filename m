From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 1 Apr 2018 00:18:06 +0200
Subject: [Buildroot] [git commit] netcat: add forced dependence on BusyBox
Message-ID: <20180331221914.09682817AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2da613a7d94a4bd34e9f70533cf0d8b2803be5bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It may be necessary if packages become built in parallel, leading to a
race condition on the creation of the "nc" link.

Of course this still leaves a race conditon if other netcat competitors
but we must assume thet the user is a grown-up person who knows what is
doing.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
[Arnout: Don't force-remove the existing nc, not needed according to
         Romain.]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/netcat/netcat.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/netcat/netcat.mk b/package/netcat/netcat.mk
index eb7ddcac27..6c7c4b8f29 100644
--- a/package/netcat/netcat.mk
+++ b/package/netcat/netcat.mk
@@ -9,4 +9,10 @@ NETCAT_SITE = http://downloads.sourceforge.net/project/netcat/netcat/$(NETCAT_VE
 NETCAT_LICENSE = GPL-2.0+
 NETCAT_LICENSE_FILES = COPYING
 
+# Ensure Busybox gets built/installed before, so that this package overrides
+# Busybox nc.
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+NETCAT_DEPENDENCIES += busybox
+endif
+
 $(eval $(autotools-package))
