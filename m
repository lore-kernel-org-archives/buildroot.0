Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEC8CE7A94
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 13:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1545981AAC;
	Mon, 25 Sep 2023 13:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1545981AAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7LSUkW9MeDeA; Mon, 25 Sep 2023 13:51:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BD8E8146A;
	Mon, 25 Sep 2023 13:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BD8E8146A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA5711BF381
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 13:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83F9B40185
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 13:51:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83F9B40185
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tj7OZfAab97T for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 13:51:14 +0000 (UTC)
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F2B0A41595
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 13:51:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2B0A41595
Received: from unknown (HELO opfedv1rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 15:51:10 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Sep 2023 15:51:10 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 15:51:08 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Mon, 25 Sep 2023 15:51:08 +0200
X-IronPort-AV: E=Sophos;i="6.03,175,1694728800"; d="scan'208";a="44318298"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Mon, 25 Sep 2023 15:51:08 +0200
Message-ID: <fddc853041d6b720991aa3438feef2e9a431a91d.1695649859.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX606.corporate.adroot.infra.ftgroup
 (10.115.27.30) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1695649874; x=1727185874;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Kx9hTg+YAp6y/zdLapZy2forS2g4u+n4Wp/+96nLkgw=;
 b=rVkbeXZOI0p0nyByU+SAFtAXHIxVlrFb5HHQNyC2MT+zzYegITAhmzE1
 kVo7EIjZ/6LeBmIEpMlWvzlk5FOtrBNJiRe/2LOo5nohJ3HD0wvg3cltv
 DGVc+P1swJyxM4BjBMzPkQLoCCJvzabmIp0VwQFoXXz5Z280fbSGYcDmc
 pM0FNUuj9xefERVryEZDcJnX3SPe3ZNvN3KHCY92WbMUJa4+45hLxxMYd
 CN+6ch1/nx9i8Df/sI+A3wqsaMBvfDJb3NzBd3p02h1bOsN9M0imxO5VA
 YgGXdxg/6oXsp19KbZydEbS+EqgXHXp7k3VPhGjTxzmqysz15BZKoSBf1
 Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=rVkbeXZO
Subject: [Buildroot] [PATCHv3] package/go: cgo for the target needs the
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

From: Christian Stewart <christian@aperture.us>

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
Changes v2 -> v3:
  - properly reassign authorship to Christian (sorry for the screw up)

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
