Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34F3C77B7C
	for <buildroot@archiver.kernel.org>; Wed,  2 Jul 2025 13:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B82F417A5;
	Wed,  2 Jul 2025 13:07:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HexdLnh4uTkQ; Wed,  2 Jul 2025 13:07:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A96941061
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A96941061;
	Wed,  2 Jul 2025 13:07:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C43D9128
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 13:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B61CB41484
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 13:07:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xxz3CaqnwM1x for <buildroot@buildroot.org>;
 Wed,  2 Jul 2025 13:07:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.237;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B51A940121
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B51A940121
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B51A940121
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 13:07:24 +0000 (UTC)
X-CSE-ConnectionGUID: Z+1HorxlQhGDUVi20Yxpzw==
X-CSE-MsgGUID: Gc0rYpPKS9aegYAMsNcqdw==
Received: from unknown (HELO opfedv1rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 15:07:22 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Jul 2025 15:07:21 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57;
 Wed, 2 Jul 2025 15:07:20 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 02 Jul 2025 15:07:18 +0200
X-CSE-ConnectionGUID: oeLOnwADTE6veFFzPzGgzQ==
X-CSE-MsgGUID: xyuE19TlSNWyxBByD171MA==
X-IronPort-AV: E=Sophos;i="6.16,281,1744063200"; d="scan'208";a="304544479"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: Christian Stewart <christian@aperture.us>, "Yann E . MORIN"
 <yann.morin@orange.com>
Date: Wed, 2 Jul 2025 15:07:18 +0200
Message-ID: <cover.1751461630.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX306.corporate.adroot.infra.ftgroup
 (10.115.27.11) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1751461645; x=1782997645;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7DWjKRfS8AO5x2LqhaE1K+RcHZBJLHWxxQInhOVZdyw=;
 b=fvdYBZqlrt8lEZDHZTzDjgVYLvcSVB51NBJ2jnyJXqwUTl6mhw6maw94
 /2saySxtkUEdZF7NZRsEcANSA96t0ueYthLJpFxdbSRh7TAQfaUUk1mAl
 ZKffTXE26nC5YZ7Vg+twV++jbLLxUzIRGv7BOX1xWtY7h6dscuNsKChF0
 SMGQtNZPC2fA1sf7TMOLHawZg8f8LnjMtG0lE5vdWGuk+eP82enVDK2/p
 IXnsY98FnkMyRzgrX08JwL7BgJNpARpAjz4Bm2Am4f4ebR57EAyiECbP7
 qHrQhFme5j3GVtOKE8SYi22knnYBYXOrMR//nt1pjfVLr9Sg1unxXS9Et
 w==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=fvdYBZql
Subject: [Buildroot] [PATCH 0/2] package/cni-plugins: install omitted plugin
 and bump version
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

Hello All!

This small series does just what it says on the tin: it builds and
installs a plugin that was previously omitted, and then it bumps to the
latest version.


Regards,
Yann E. MORIN.


The following changes since commit 533c0aac289a545d07efc69766227d71d2df9d80

  package/daq: fix build with GCC14 (2025-07-01 23:39:58 +0200)


are available as patches in this mail series,

for you to apply patches up to 45b9b1cc3eac6c9834c5bd9f06463694ffae638b

  package/cni-plugins: bump to version 1.7.1 (2025-07-02 15:01:16 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      package/cni-plugins: enable sbr
      package/cni-plugins: bump to version 1.7.1

 package/cni-plugins/cni-plugins.hash | 2 +-
 package/cni-plugins/cni-plugins.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'

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
