Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48B6CE7A94
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 12:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F3884190A;
	Mon, 25 Sep 2023 12:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F3884190A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G89FNJi8Awy0; Mon, 25 Sep 2023 12:36:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1853A41938;
	Mon, 25 Sep 2023 12:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1853A41938
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D4461BF38C
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 12:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5322781F55
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 12:36:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5322781F55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jArT7zIIYhpp for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 12:36:32 +0000 (UTC)
X-Greylist: delayed 430 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 25 Sep 2023 12:36:31 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0B5881F50
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0B5881F50
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 12:36:31 +0000 (UTC)
Received: from unknown (HELO opfedv1rlp0b.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 14:29:18 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0b.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Sep 2023 14:29:18 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 14:29:16 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Mon, 25 Sep 2023 14:29:15 +0200
X-IronPort-AV: E=Sophos;i="6.03,174,1694728800"; d="scan'208";a="44806712"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Mon, 25 Sep 2023 14:29:15 +0200
Message-ID: <85bdd1b26ba56471330e98465095d943b54e3e74.1695644947.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX107.corporate.adroot.infra.ftgroup (10.115.27.4)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1695645391; x=1727181391;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QD+oScHpfpYs/jlH2/L9t8YXdPOVWN1alpf4QA4tEEY=;
 b=lWynm5+cppM1eZlw3qiPig8Ga9zYGNa1P9poYOLp68qP/VTu9ia68o/i
 Y7mBzy7la0ym+lVOz+SL3o6614L6Ryh1a3FKMC7dYT2tY1DhiOkL3GFHn
 p0nRCLe6OMKBhm50nTWqdFiGdmzrwvIBCHOkpwewgU6S/D/R8TaoRTEHW
 79VGfHu63fdbt1c0hRGNKzbDCZ91UMC14fPlrMQoA+r+nowzkckvZk7bN
 n3b0d2qpD+dIW4IrZArEBEXFLssBDVoQcvnRrbD2U49pbHwqhr1E9IS3n
 HzlXcfScqbSzhykfptyp22PBbfnyKLpkQVFGbc6NUsncqua0MOyPho+Jz
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=lWynm5+c
Subject: [Buildroot] [PATCHv2] package/go: cgo for the target needs the
 toolchain
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: yann.morin@orange.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart <christian@aperture.us>, Anisse Astier <anisse@astier.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Build go with cgo support needs to build some .c files to generate
target support code, and thus calls the cross C compiler, which is
failing when the toolchain is not built before host-go:

    >>> host-go 1.21.1 Building
    cd .../build/host-go-1.21.1/src && GO111MODULE=off GOCACHE=.../per-package/host-go/host/share/host-go-cache GOROOT_BOOTSTRAP=.../per-package/host-go/host/lib/go-1.19.11 GOROOT_FINAL=.../per-package/host-go/host/lib/go GOROOT=".../build/host-go-1.21.1" GOBIN=".../build/host-go-1.21.1/bin" GOOS=linux CC=/usr/bin/gcc CXX=/usr/bin/g++ CGO_ENABLED=1 CC_FOR_TARGET=".../per-package/host-go/host/bin/arm-linux-gcc" CXX_FOR_TARGET=".../per-package/host-go/host/bin/arm-linux-g++" GOOS="linux" GOARCH=arm  GOARM=6 GO_ASSUME_CROSSCOMPILING=1 ./make.bash
    Building Go cmd/dist using .../per-package/host-go/host/lib/go-1.19.11.  (go1.19.11 linux/amd64)
    go tool dist: cannot invoke C compiler [".../per-package/host-go/host/bin/arm-linux-gcc"]: fork/exec .../per-package/host-go/host/bin/arm-linux-gcc: no such file or directory

    Go needs a system C compiler for use with cgo.
    To set a C compiler, set CC=the-compiler.
    To disable cgo, set CGO_ENABLED=0.

This happens systematically with PPD, and happens without PPD when
host-go is explicitly built (by running: "make host-go").

Since only CGO support needs to compile C files, onmy add the toolchain
dependency in that case.

When the target is not supported by go, then there is obviously no need
to depend on the toolchain (even if we unconditionally enable cgo
support in only-for-the-host host-go).

Signed-off-by: Christian Stewart <christian@aperture.us>
[yann.morin@orange.com:
  - only add the toolchain dependency for target cgo
  - reword commit log
]
Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Anisse Astier <anisse@astier.eu>

---
Changes v1 -> v2:
  - only add the toolchain dependency for target cgo
  - reword commit log

v1 by Christian:
    https://lore.kernel.org/buildroot/20230728052530.1122268-1-christian@aperture.us/
---
 package/go/go.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/go/go.mk b/package/go/go.mk
index e5195089ac..6f080be5c0 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -90,6 +90,7 @@ HOST_GO_TARGET_ENV = \
 # any target package needing cgo support must include
 # 'depends on BR2_TOOLCHAIN_HAS_THREADS' in its config file.
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+HOST_GO_DEPENDENCIES += toolchain
 HOST_GO_CGO_ENABLED = 1
 else
 HOST_GO_CGO_ENABLED = 0
-- 
2.34.1

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
