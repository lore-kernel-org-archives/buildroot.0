Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B28AE7718E
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 07:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C853D80F8E;
	Mon, 23 Dec 2024 07:27:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zAXYQOKK7BiW; Mon, 23 Dec 2024 07:27:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2EA680FA2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2EA680FA2;
	Mon, 23 Dec 2024 07:27:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C0CD3D8
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 07:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60D32415F6
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 07:27:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BVXW1nAHjkFW for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 07:27:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5536E41607
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5536E41607
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5536E41607
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 07:27:30 +0000 (UTC)
X-CSE-ConnectionGUID: SWgipGkeQI66uL7IDSDX7w==
X-CSE-MsgGUID: T2MPzUUVQIOoZkB0sO8msQ==
Received: from unknown (HELO opfedv3rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2024 08:27:28 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Dec 2024 08:27:28 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Mon, 23 Dec 2024 08:27:27 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 23 Dec 2024 08:27:26 +0100
X-CSE-ConnectionGUID: Psuvv3oERTuWtUV3WslD9A==
X-CSE-MsgGUID: H2T8TIHHSN+1kwlwkKk30g==
X-IronPort-AV: E=Sophos;i="6.12,256,1728943200"; d="scan'208";a="237749943"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Julien Olivain <ju.o@free.fr>
Date: Mon, 23 Dec 2024 08:27:20 +0100
Message-ID: <af1aba057da1bd3bb056f7e6886641149bf22592.1734938835.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734938835.git.yann.morin@orange.com>
References: <cover.1734938835.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX404.corporate.adroot.infra.ftgroup
 (10.115.26.17) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1734938851; x=1766474851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BZZHCfFyMRnu/bsprb+PZJJvC1vwhsOfW7q3Ihszb1Y=;
 b=YgSJldjvCiTj2IQUVGk6fOc5qbR+GALs1f7DYfztLdR9lexojn6BYZOZ
 YDyuWfgZJreveo7kEwSQnH7z9JevH9lAD0glEsbZ8Dgf7/cmmFRkNKGrw
 8L1N+huZQt2WntHnkG+znO+APZc1I6jELqAqZ7zHWCDRKoGT/qn+XDDGD
 QrufdTQ7FWtLziONXss2noKPR4MaQHWMGCuYkk8oY2aALWLahQZAi+pso
 GbJFXTjzM13mvg0CDOFJZhZ38tWnxhrAn7z9GReq9CKqL6JQiVM+HGw6X
 mc/r+INGOG5DjmW5Wh8F2TEtXJy08qAgtMQGwprw1vLsS8sKGISOK4SZu
 Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=YgSJldjv
Subject: [Buildroot] [PATCH 5/5] utils/get-developers: add option to report
 Cc: lines
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

It is very common to use the output of get-developers to add cc: lines
in the commit log.

Add an option so that get-developers reports Cc: lines ready to be
pasted in a commit log. That new option behaves similarly to the
existing -e option: it only affects the output when parsing a patch.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Julien Olivain <ju.o@free.fr>

---
Changes v1 -> v2:
  - model the help text after the one of the -e option, below  (Julien)
  - extend commit log to explain that.
---
 utils/get-developers | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/utils/get-developers b/utils/get-developers
index 3253ce5d6b..83c573bf23 100755
--- a/utils/get-developers
+++ b/utils/get-developers
@@ -17,6 +17,8 @@ def __main__():
                         help='find developers in charge of these files')
     parser.add_argument('-c', dest='check', action='store_const',
                         const=True, help='list files not handled by any developer')
+    parser.add_argument('--cc', action="store_true",
+                        help='list affected developers as CC: lines ready to be pasted in a commit log')
     parser.add_argument('-e', dest='email', action='store_const',
                         const=True, help='only list affected developer email addresses')
     parser.add_argument('-v', dest='validate', action='store_const',
@@ -99,9 +101,9 @@ def __main__():
                     matching_devs.add(dev.name)
 
         matching_devs = sorted(matching_devs)
-        if args.email:
+        if args.email or args.cc:
             for dev in matching_devs:
-                print(dev)
+                print(f"{'Cc: ' if args.cc else ''}{dev}")
         else:
             result = "--to buildroot@buildroot.org"
             for dev in matching_devs:
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
