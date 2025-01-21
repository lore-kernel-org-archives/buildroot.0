Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CCCC0218D
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 10:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D01C584920;
	Tue, 21 Jan 2025 10:45:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PHiGZa9SFoDi; Tue, 21 Jan 2025 10:45:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4213848A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4213848A3;
	Tue, 21 Jan 2025 10:45:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F24F959
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 10:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09CFD4101B
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 10:45:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I79HZ5OYWdSK for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 10:45:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.122;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9560E40C0B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9560E40C0B
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.122])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9560E40C0B
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 10:45:36 +0000 (UTC)
X-CSE-ConnectionGUID: zNzI3q9/Qj2g4HpbaufRow==
X-CSE-MsgGUID: UAzofBbQRX2xuIFazHjsvA==
Received: from unknown (HELO opfedv3rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 11:45:34 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 Jan 2025 11:45:34 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Tue, 21 Jan 2025 11:45:32 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 21 Jan 2025 11:45:32 +0100
X-CSE-ConnectionGUID: XroQhYk8RXSjdT+/Nfl7oA==
X-CSE-MsgGUID: 8spHOfozQ2qas1PTZq9mIA==
X-IronPort-AV: E=Sophos;i="6.13,221,1732575600"; d="scan'208";a="247130116"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 21 Jan 2025 11:45:32 +0100
Message-ID: <2d128a40f7b030365fcc63e13dbd48a641d912aa.1737456332.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX404.corporate.adroot.infra.ftgroup
 (10.115.26.17) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1737456337; x=1768992337;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W8oQ/bNvgnOygpq1Laz5o+qopwMWEvZxT8ovps9Ng4o=;
 b=oDJi0C8HYobvYIVsGHJixIsX4b1EWDDuE6Ikpxr/cj45RSdzte4D8yup
 QW/boD6ePHABjKAueRi+SXNf3RR3kc3jRmLrmzmgZpMT6QBmr8PXQg4zz
 NT71YW+VpO1LZN5gpMay4Y/1aMOIoCiC8A4HNcODlDaDvOHMq6GzC/44o
 2hPXZeZ7ileTadUq7W4WNQou3qJrX6f2o9Zd5WjvGzfg7OR37Pf17EHmv
 OrKqJujhZkmGzIEmfEoKEkZOJmEleHK20nwTq2iDp3OUjzzND9fMqESXL
 JxiP5HYnBnhDHsQou0SxbiiKPfuB7/m5GHUz8CIbfWhFDNrs9Bhd4i18P
 g==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=oDJi0C8H
Subject: [Buildroot] [PATCH] package/pkg-generic: store reall version in
 legal manifest
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

The legal manifest currently stores the $(PKG)_VERSION variable.
However, that variable undergoes a set of changes so that it is
suitable for creating files and Makefile rules; that new value
is purely a technical, internal detail of how Buildroot handles
things.

In the legal manifest, we need access to the real value for the
version, as this is what will allow actual references to the
upstream package. If the version string is mangled, like slashes
replaced with underscores, this introduces ambiguities as to what
exactly the version is.

Change the legal manifest to include the actual, original value as
was set in the .mk file.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index fe0a7bef38..fb9d9996c8 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1193,7 +1193,7 @@ else
 endif # other packages
 
 endif # redistribute
-	@$$(call legal-manifest,$$(call UPPERCASE,$(4)),$$($(2)_RAWNAME),$$($(2)_VERSION),$$(subst $$(space)$$(comma),$$(comma),$$($(2)_LICENSE)),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_ACTUAL_SOURCE_SITE),$$(call legal-deps,$(1)))
+	@$$(call legal-manifest,$$(call UPPERCASE,$(4)),$$($(2)_RAWNAME),$$($(2)_DL_VERSION),$$(subst $$(space)$$(comma),$$(comma),$$($(2)_LICENSE)),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_ACTUAL_SOURCE_SITE),$$(call legal-deps,$(1)))
 endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
 	$$(foreach hook,$$($(2)_POST_LEGAL_INFO_HOOKS),$$(call $$(hook))$$(sep))
 
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
