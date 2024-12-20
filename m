Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC15E77188
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 13:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E31A83D72;
	Fri, 20 Dec 2024 13:31:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mBbz_ia7FJIo; Fri, 20 Dec 2024 13:31:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52EF783D69
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52EF783D69;
	Fri, 20 Dec 2024 13:31:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 33DCA938
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 13:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 209B540A86
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 13:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SZtkkfOiGNkF for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 13:31:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B357740A82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B357740A82
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B357740A82
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 13:31:11 +0000 (UTC)
X-CSE-ConnectionGUID: lkNr4R+CRdae8gbgd34n9Q==
X-CSE-MsgGUID: XvS34MUeTy6Akof5ItrkmA==
Received: from unknown (HELO opfedv1rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 14:31:11 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Dec 2024 14:31:10 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Fri, 20 Dec 2024 14:31:09 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 20 Dec 2024 14:31:08 +0100
X-CSE-ConnectionGUID: c/409Ep+RyKFRmU8yoG/Vw==
X-CSE-MsgGUID: Ao5+Nv68RaOBiMz8n6TmVA==
X-IronPort-AV: E=Sophos;i="6.12,250,1728943200"; d="scan'208";a="231590061"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Fri, 20 Dec 2024 14:31:02 +0100
Message-ID: <34276855814dfd02f2279a7fb0d0b16a8c1eb43f.1734701459.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734701459.git.yann.morin@orange.com>
References: <cover.1734701459.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX104.corporate.adroot.infra.ftgroup (10.115.26.5)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1734701471; x=1766237471;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TzqfM9wWRs5GReZo7ZNy3sL1cXXqaLzLdLfxamniGAE=;
 b=TKAi+OA+mX9YxbB8JALT+yQgIAt4aoUFzGBW5mXRvUI3TyYB2vEYTLXZ
 i7falVVEG/hXDEv7V1aqwN2fR9xTL9Vd2lEwTyxtcqU8c3Pc9JIZA0f/o
 72UEVd+hUsb72toZFTCq+v1CorN6FaY3PnLSSK2J5i2SLUweNuzYniIYl
 0YJcZISK4Gfq3caXMTTXWHJYwOcQWxkWZHAfcvg3ekL7462SYg3IWwtBw
 ZUXWgRJtMapcehPccpDtLLGqvG5SRgL/3xHBIjwRgi/tUakel41/w7i++
 5pxEmvEI+vVVEvGveCdBjK32yTzj5LXGluGUYMHgzevCPuG6E6GYRFXIF
 Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=TKAi+OA+
Subject: [Buildroot] [PATCH 4/5] utils/get-developers: sort reported
 developers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

The list of reported developers is not ordered: that may leave the
impression (when receiving a patch) that a Cc is more important than
another, by virtue of being earlier in the list.

Also, the ordering changes on every call.

Report the developers in an alphabetically order, so that there is no
confusion anymore, and so the ordering is reproducible across calls.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 utils/get-developers | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/get-developers b/utils/get-developers
index b45e617bff..3253ce5d6b 100755
--- a/utils/get-developers
+++ b/utils/get-developers
@@ -98,6 +98,7 @@ def __main__():
                 if i in dev.infras:
                     matching_devs.add(dev.name)
 
+        matching_devs = sorted(matching_devs)
         if args.email:
             for dev in matching_devs:
                 print(dev)
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
