From: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 27 Nov 2010 18:55:20 -0500
Subject: [Buildroot] [PATCH] tcpdump: punt duplicate versioned binary
Message-ID: <1290902120-12063-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The tcpdump packag likes to install two binaries into /usr/sbin --
one named "tcpdump" and one named "tcpdump.<ver>".  But it does this
by installing the file twice rather than using links.  Since the alt
name is useless to us, just punt it.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 package/tcpdump/tcpdump.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index e295e69..a359522 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -15,3 +15,5 @@ TCPDUMP_CONF_OPT:=--without-crypto \
 TCPDUMP_DEPENDENCIES:=zlib libpcap
 
 $(eval $(call AUTOTARGETS,package,tcpdump))
+
+TCPDUMP_INSTALL_TARGET_CMDS += && rm -f $(TARGET_DIR)/usr/sbin/tcpdump.$(TCPDUMP_VERSION)
-- 
1.7.3.2
