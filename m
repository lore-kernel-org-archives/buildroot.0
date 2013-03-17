From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 17 Mar 2013 16:03:40 +0100
Subject: [Buildroot] [git commit] zeromq: add PGM/EPGM support
Message-ID: <20130317150312.ECEBC9B135@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eaf746eb9e8b10d5ff5011a989014b3df4b31ddc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This adds support for Pragmatic General Multicast protocol on raw
IP (PGM, RFC 3208) or UDP frames (EPGM) for use as zeromq reliable
multicast transport. The library relies on openpgm package to
implement the protocol itself.

Signed-off-by: Alexander Lukichev <alexander.lukichev@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/zeromq/Config.in |    9 +++++++++
 package/zeromq/zeromq.mk |    5 +++++
 2 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
index e1d3d52..b7dc8a6 100644
--- a/package/zeromq/Config.in
+++ b/package/zeromq/Config.in
@@ -23,3 +23,12 @@ config BR2_PACKAGE_ZEROMQ
 	  ??MQ is from iMatix and is LGPL open source.
 
 	  http://www.zeromq.org/
+
+config BR2_PACKAGE_ZEROMQ_PGM
+	bool "PGM/EPGM support"
+	depends on BR2_PACKAGE_ZEROMQ
+	select BR2_PACKAGE_OPENPGM
+	help
+	  Add support for Pragmatic General Multicast protocol (RFC 3208)
+	  implemented either over raw IP packets or UDP datagrams
+	  (encapsulated PGM). This requires OpenPGM library.
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 2d0026d..ba585d9 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -11,4 +11,9 @@ ZEROMQ_DEPENDENCIES = util-linux
 ZEROMQ_LICENSE = LGPLv3+ with exceptions
 ZEROMQ_LICENSE_FILES = COPYING COPYING.LESSER
 
+ifeq ($(BR2_PACKAGE_ZEROMQ_PGM),y)
+	ZEROMQ_DEPENDENCIES += host-pkgconf openpgm
+	ZEROMQ_CONF_OPT = --with-system-pgm
+endif
+
 $(eval $(autotools-package))
