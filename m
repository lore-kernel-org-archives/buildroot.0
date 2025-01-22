Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5C1C02181
	for <buildroot@archiver.kernel.org>; Wed, 22 Jan 2025 06:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9700761153;
	Wed, 22 Jan 2025 06:48:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 83Y1ZKrPv-Gh; Wed, 22 Jan 2025 06:48:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9A7A61141
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9A7A61141;
	Wed, 22 Jan 2025 06:48:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 38B3CD7
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 06:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B1E141861
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 06:48:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XJrjvo7cfFvq for <buildroot@buildroot.org>;
 Wed, 22 Jan 2025 06:48:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6503240388
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6503240388
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6503240388
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 06:48:44 +0000 (UTC)
X-CSE-ConnectionGUID: 6H2ESDQUQT+pbzR/d6JZ6Q==
X-CSE-MsgGUID: TNZQEzaGSIqm4oyqHwhdmg==
Received: from unknown (HELO opfedv1rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 07:48:41 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Jan 2025 07:48:41 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Wed, 22 Jan 2025 07:48:39 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 22 Jan 2025 07:48:38 +0100
X-CSE-ConnectionGUID: Qzg18hDKQQesQQvSXSYO7g==
X-CSE-MsgGUID: uCJ94rM2TzKDptvUfN4vpw==
X-IronPort-AV: E=Sophos;i="6.13,224,1732575600"; d="scan'208";a="245596045"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 22 Jan 2025 07:48:38 +0100
Message-ID: <b345d4f8d7c4dcb795ec6fcb9e4aaa5c5cd4553b.1737528518.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX407.corporate.adroot.infra.ftgroup
 (10.115.27.16) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1737528524; x=1769064524;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GXh4mKdc7B9k2o4ZF7IlS7Y5hiIN9LBj9aCnuRtd5OY=;
 b=Guo8/jYfabJW7/4oa8vesrdi7Fqvnnq7fJaeNjJ8jLv2iP4XyHlKfH6Z
 vRBiAom5cHZzrHgPoi2O2zp3TVlbk3NRcvgGrzBudk5vNtSjPrzfo9p3m
 LYdG3pliO5O17rCHMqTYWwiro8ZbvHhoRrd46KLeAIolj+qAMCLU4DY98
 +zkJfjQ4/w0jus/MtCgofcKoXAlenNNbWTVFTkGomsXjyvbZGB0Z5xRVH
 wcXLHOAbX8e1c6isiU1pgYOE6sArkM5Uc1UgwRNE2ZFUpVzz+O/6k7cbL
 HEjdyDVPBFw6r0e7FYEZO7DRiHkDYjGFFCJvAP3YEWGlkDpVwVUXchDVP
 A==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=Guo8/jYf
Subject: [Buildroot] [PATCH v2] package/pkg-generic: store real version in
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

In Buildroot, there is no package, with a constant version, that
exhibits that issue; for those packages where it is possible to
set a custom git tree and version, like linux or uboot, such a
custom tree can have tags with a slash (not a colon or a space,
forbidden by git); packages in a br2-external can also use such
version strings as well.

The packages that do have such versions are not legion, but they
do exist. For example, Apache's ant buildsystem does use a slash
in their reelase tags, like rel/1.10.15:
    https://github.com/apache/ant/tags

Change the legal manifest to include the actual, original value
as was set in the .mk file.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---
Changes v1 -> v2:
  - add example where that could happen  (Luca)
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
