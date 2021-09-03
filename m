Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C7E8C433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 04:40:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B08D61058
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 04:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B08D61058
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tkos.co.il
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB469425AA;
	Fri,  3 Sep 2021 04:40:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H65KPLG43A69; Fri,  3 Sep 2021 04:40:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30B244252E;
	Fri,  3 Sep 2021 04:40:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 558521BF373
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 04:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BE5482E9D
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 04:39:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t-AlGqdiHnor for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 04:39:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [192.115.133.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F34328297F
 for <buildroot@busybox.net>; Fri,  3 Sep 2021 04:39:56 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id D2D3344042B;
 Fri,  3 Sep 2021 07:39:36 +0300 (IDT)
From: Baruch Siach <baruch@tkos.co.il>
To: buildroot@busybox.net
Date: Fri,  3 Sep 2021 07:39:28 +0300
Message-Id: <eb6c1c71663811f27493ec0b7f32f9bdb88a8820.1630643968.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/netsniff-ng: fix static build of
 mausezahn
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
Cc: Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

The configure script fails to detect libpcap in static build because it
does not take into account the libnl dependency on link. As a result the
configure script silently disables mausezahn build even when
BR2_PACKAGE_NETSNIFF_NG_MAUSEZAHN is enabled. Add upstream patch to use
pkg-config for libpcap link flags.

Cc: Joris Lijssens <joris.lijssens@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...ibpcap-dependencies-using-pkg-config.patch | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 package/netsniff-ng/0001-Detect-libpcap-dependencies-using-pkg-config.patch

diff --git a/package/netsniff-ng/0001-Detect-libpcap-dependencies-using-pkg-config.patch b/package/netsniff-ng/0001-Detect-libpcap-dependencies-using-pkg-config.patch
new file mode 100644
index 000000000000..bbcbd2bfc391
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
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
