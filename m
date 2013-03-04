From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Mon,  4 Mar 2013 11:48:12 +0200
Subject: [Buildroot] =?utf-8?q?=5BPATCH_v4_2/2=5D_zeromq=3A_add_PGM/EPGM_s?=
	=?utf-8?q?upport?=
In-Reply-To: <1362390492-22434-1-git-send-email-alexander.lukichev@gmail.com>
References: <1362390492-22434-1-git-send-email-alexander.lukichev@gmail.com>
Message-ID: <1362390492-22434-2-git-send-email-alexander.lukichev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds support for Pragmatic General Multicast protocol on raw
IP (PGM, RFC 3208) or UDP frames (EPGM) for use as zeromq reliable
multicast transport. The library relies on openpgm package to
implement the protocol itself.

Signed-off-by: Alexander Lukichev <alexander.lukichev@gmail.com>
---
Although zeromq sources come with a pre-packaged version of
openpgm, due to cross-compilation problems of openpgm it is easier
to build it independently of zeromq, install it into staging tree
and then make zeromq link against installed library using
--with-system-pgm configure option. The patch takes this approach,
placing a dependency on openpgm package and selecting to build it
when a user selects "PGM/EPGM support" option in Buildroot config.
---
 package/zeromq/Config.in | 9 +++++++++
 package/zeromq/zeromq.mk | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
index e1d3d52..b7dc8a6 100644
--- a/package/zeromq/Config.in
+++ b/package/zeromq/Config.in
@@ -23,3 +23,12 @@ config BR2_PACKAGE_ZEROMQ
 	  ?MQ is from iMatix and is LGPL open source.
 
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
index 284a168..2ee6cf3 100644
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
-- 
1.8.0.1
