Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43938CE7A94
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 11:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C248240571;
	Mon, 25 Sep 2023 11:34:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C248240571
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s09-lBgcZCMk; Mon, 25 Sep 2023 11:34:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 106EF41500;
	Mon, 25 Sep 2023 11:34:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 106EF41500
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7EC431BF2C9
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 11:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 578E44016C
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 11:34:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 578E44016C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1r_1ZV7imrsD for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 11:34:22 +0000 (UTC)
X-Greylist: delayed 346 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 25 Sep 2023 11:34:21 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 922D440129
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 922D440129
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 11:34:21 +0000 (UTC)
Received: from unknown (HELO opfedv1rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 13:34:18 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Sep 2023 13:34:18 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 13:34:17 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Mon, 25 Sep 2023 13:34:16 +0200
X-IronPort-AV: E=Sophos;i="6.03,174,1694728800"; d="scan'208";a="44229393"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Mon, 25 Sep 2023 13:34:16 +0200
Message-ID: <a9774109676af0756f842322eb9baf0a7bacdf48.1695641648.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX201.corporate.adroot.infra.ftgroup (10.115.26.6)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1695641661; x=1727177661;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G5459gpRNNHyznZH3fVNHYyTrUmREbp+GxXRl5SC7s0=;
 b=ISXXl0JchCCkWXHYcqKANmc2Y4uEhkyo+qYcqup2Nla6yfAE1cMDaQrz
 ABwNqg0IcgXrduaOPXyG3Jqqx/kJIHRvD95Hu0WOFtMI+iY1HGwN4Tl0M
 y0R/2r0yQNYstMnZgBQhlm0GeT71FAZCSfmwDHZU+8yht/dzQWxqbNLYc
 hlzCXALFjy9+g/ZrrhyOct8SnG6vJiFE5+MhFzdXnlN/Y7cdlA5ZZRoOq
 ShzAkEk3rcE7ofNaqIwA0MFGHk/DTbqYZXbihUpBb1yvNEZB5xFM1M4wE
 xugOszuJ62Kd3Y+w1AP+UvCVZfpl26YlOb9uTXhG+bvk5U1Oapk70VKL6
 A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=ISXXl0Jc
Subject: [Buildroot] [PATCHv2] package/go: fix installation
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
Cc: yann.morin@orange.com, Anisse Astier <anisse@astier.eu>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

When building for a target architecture that go does not support, the
isntallation fails with:

    $ make host-go
    [...]
    ln -sf ../lib/go/bin/go /home/nyma7486/dev/work/5GCroCo/O/pouet/per-package/host-go/host/bin/
    ln: failed to create symbolic link '/home/nyma7486/dev/work/5GCroCo/O/pouet/per-package/host-go/host/bin/': No such file or directory

Indeed, the HOST_DIR/bin is not guaranteed to exist when we install a
host package, so it needs to be explicitly created before we can create
entries in there.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Christian Stewart <christian@aperture.us>
Cc: Anisse Astier <anisse@astier.eu>

---
Changes v1 -> v2:
  - drop surious hunk
---
 package/go/go.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/go/go.mk b/package/go/go.mk
index aa5d7f97b5..e5195089ac 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -146,6 +146,7 @@ define HOST_GO_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/bin/go $(HOST_GO_ROOT)/bin/go
 	$(INSTALL) -D -m 0755 $(@D)/bin/gofmt $(HOST_GO_ROOT)/bin/gofmt
 
+	mkdir -p $(HOST_DIR)/bin
 	ln -sf ../lib/go/bin/go $(HOST_DIR)/bin/
 	ln -sf ../lib/go/bin/gofmt $(HOST_DIR)/bin/
 
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
