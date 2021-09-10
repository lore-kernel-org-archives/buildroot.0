Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A97C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 10:02:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDAA0610C8
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 10:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BDAA0610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77BF340690;
	Fri, 10 Sep 2021 10:02:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zlWvioIf-wEg; Fri, 10 Sep 2021 10:02:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB51C40672;
	Fri, 10 Sep 2021 10:02:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 33C9B1C1127
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 10:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FD4F60786
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 10:01:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nqo0ZaBiSSYm for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 10:01:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6429D605D7
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 10:01:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0834988C6A; Fri, 10 Sep 2021 10:00:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 12:00:32 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 79bfe255e915d621deb1294d64bb1cbc32c5bdff
X-Git-Newrev: ad98d9b7712f97ecb656ad2020f4a34dc233c9e0
X-Patchwork-Hint: ignore
Message-Id: <20210910100014.0834988C6A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/netsniff-ng: fix
 static build of mausezahn
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ad98d9b7712f97ecb656ad2020f4a34dc233c9e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The configure script fails to detect libpcap in static build because it
does not take into account the libnl dependency on link. As a result the
configure script silently disables mausezahn build even when
BR2_PACKAGE_NETSNIFF_NG_MAUSEZAHN is enabled. Add upstream patch to use
pkg-config for libpcap link flags.

Cc: Joris Lijssens <joris.lijssens@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit de39a17f7173c82db358054752d3d65a41f0ca09)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ect-libpcap-dependencies-using-pkg-config.patch | 51 ++++++++++++++++++++++
 package/netsniff-ng/netsniff-ng.mk                 |  2 +-
 2 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/package/netsniff-ng/0001-Detect-libpcap-dependencies-using-pkg-config.patch b/package/netsniff-ng/0001-Detect-libpcap-dependencies-using-pkg-config.patch
new file mode 100644
index 0000000000..bbcbd2bfc3
--- /dev/null
+++ b/package/netsniff-ng/0001-Detect-libpcap-dependencies-using-pkg-config.patch
@@ -0,0 +1,51 @@
+From 194ec61843b9598ce90873c812b817c4b96e2e0d Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Thu, 2 Sep 2021 12:56:00 +0300
+Subject: [PATCH] Detect libpcap dependencies using pkg-config
+
+When building statically the link command line must include all
+dependencies of all libraries. libpcap can optionally depend on libnl.
+mausezahn can't build statically in this case.
+
+Use pkg-config in configure and in the link command to construct the
+library flags we need to link with libpcap.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
+---
+Upstream status: commit 194ec61843b9598ce90873c812b817c4b96e2e0d
+
+ configure          | 4 +++-
+ mausezahn/Makefile | 2 +-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index 510826a798f5..598ae2433a7a 100755
+--- a/configure
++++ b/configure
+@@ -588,7 +588,9 @@ int main(void)
+ }
+ EOF
+ 
+-	$CC -o $TMPDIR/pcaptest $TMPDIR/pcaptest.c -lpcap >> config.log 2>&1
++	$CC -o $TMPDIR/pcaptest $TMPDIR/pcaptest.c \
++		$($PKG_CONFIG --libs libpcap 2>> config.log) \
++		>> config.log 2>&1
+ 	if [ ! -x $TMPDIR/pcaptest ] ; then
+ 		echo "[NO]"
+ 		echo "CONFIG_LIBPCAP=0" >> Config
+diff --git a/mausezahn/Makefile b/mausezahn/Makefile
+index ca16b6579583..9544565355cc 100644
+--- a/mausezahn/Makefile
++++ b/mausezahn/Makefile
+@@ -1,6 +1,6 @@
+ mausezahn-libs =	-lcli \
+ 			-lnet \
+-			-lpcap \
++			$(shell PKG_CONFIG_PATH=$(PKG_CONFIG_PATH) $(PKG_CONFIG) --libs libpcap 2> /dev/null ) \
+ 			-lrt \
+ 			-lpthread \
+ 			-lm
+-- 
+2.33.0
+
diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
index f45246da63..27bd707c84 100644
--- a/package/netsniff-ng/netsniff-ng.mk
+++ b/package/netsniff-ng/netsniff-ng.mk
@@ -13,7 +13,7 @@ NETSNIFF_NG_LICENSE_FILES = README COPYING
 NETSNIFF_NG_CONF_ENV = \
 	NACL_INC_DIR=/dev/null \
 	NACL_LIB_DIR=/dev/null
-NETSNIFF_NG_DEPENDENCIES = libnl libpcap libnetfilter_conntrack liburcu
+NETSNIFF_NG_DEPENDENCIES = host-pkgconf libnl libpcap libnetfilter_conntrack liburcu
 
 ifeq ($(BR2_PACKAGE_NETSNIFF_NG_MAUSEZAHN),y)
 NETSNIFF_NG_DEPENDENCIES += libcli libnet
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
