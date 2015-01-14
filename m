From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 20:28:34 +0100
Subject: [Buildroot] [git commit] rsyslog: enable more basic features
Message-ID: <20150114192851.547B380DE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0e7733e90e18a87dd8248b3284242e8e736a4140
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable all of the basic modules that don't require any dependencies.
Reasoning is simple, if someone wants rsyslog over a smaller busybox
logger or sysklogd it's probably looking for features.

[Thomas: fix indentation.]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rsyslog/rsyslog.mk |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index fb5249c..a45111d 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -10,7 +10,12 @@ RSYSLOG_LICENSE = GPLv3 LGPLv3 Apache-2.0
 RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20
 RSYSLOG_DEPENDENCIES = zlib libestr liblogging json-c host-pkgconf
 RSYSLOG_CONF_ENV = ac_cv_prog_cc_c99='-std=c99'
-RSYSLOG_CONF_OPTS = --disable-generate-man-pages
+RSYSLOG_PLUGINS = imdiag imfile impstats imptcp \
+	mmanon mmaudit mmfields mmjsonparse mmpstrucdata mmsequence mmutf8fix \
+	mail omprog omruleset omstdout omuxsock \
+	pmaixforwardedfrom pmciscoios pmcisconames pmlastmsg pmsnare
+RSYSLOG_CONF_OPTS = --disable-generate-man-pages \
+	$(foreach x,$(call qstrip,$(RSYSLOG_PLUGINS)),--enable-$(x))
 
 # Build after BusyBox
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
