Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67AADC36006
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 10:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AC3180E66;
	Tue, 17 Sep 2024 10:17:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xrGmtk0bRlTM; Tue, 17 Sep 2024 10:17:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5CEC80ED2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5CEC80ED2;
	Tue, 17 Sep 2024 10:17:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5042C1BF20F
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 10:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EC8A60781
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 10:17:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QWYqEunkhzfN for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 10:17:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C05E0605CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C05E0605CB
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C05E0605CB
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 10:17:22 +0000 (UTC)
Received: from unknown (HELO opfedv1rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 12:17:21 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Sep 2024 12:17:20 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Tue, 17 Sep 2024 12:17:18 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 17 Sep 2024 12:17:17 +0200
X-IronPort-AV: E=Sophos;i="6.10,235,1719871200"; d="scan'208";a="194862033"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 17 Sep 2024 12:17:17 +0200
Message-ID: <45637d224995588db97c5908d41ea67600e432f3.1726568237.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX203.corporate.adroot.infra.ftgroup (10.115.26.8)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1726568244; x=1758104244;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=McLjRmx857Bt2byIYpR2paB5Ng+EdXVRWrmaGr0dcLM=;
 b=MDDbljR5ZbyQmBl8UCCFS8yXAoiQ31B/henJpuuXT38t7NdaE83ze4kZ
 LDNf7SzmmaCRot0nQkG9rarRlQNHHIEB+wN2i4DcVYKu70zLIVn5xWuHg
 oZo7QqWGD+dPMRBTtATRGyGGsL+sz8lu8r6ml4INnrBx4oc0hbJFt7oD8
 CE5mLM1x4ZtXegCU5XwrV4gy2/s9078I+EpXLIpiUOvDpOO2LNTKDY2AK
 Dwy7dzSSPWhoWlL8nuYiOMpMFPCH/JtOXQ2tpRZHvEZVZ19Qp4QiOtvt3
 51WgAC31fOtdnRAGt2aKq+ngRfEXuEygH5lyDA0RuzRFO6VeZE38OoIDa
 w==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=MDDbljR5
Subject: [Buildroot] [PATCH] package/skopeo: ignore un-applicable CVE
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
Cc: yann.morin@orange.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

The CVE tracker detects that CVE-2019-10214 impacts skopeo, but this is
a false positive. Indeed, that CVE applies to containers/image (which is
vendored in skopeo), and is matched for un-versioned skopeo (notice the
dash '-' in the CPE ID):

    https://nvd.nist.gov/vuln/search/results?adv_search=true&isCpeNameSearch=true&query=cpe:2.3:a:skopeo_project:skopeo:-:*:*:*:*:*:*:*

and does not apply to any versioned skopeo (1.16.1 and "any version" for
example; notice the star '*' or the version instead of the dash, in the
CPE ID):

    https://nvd.nist.gov/vuln/search/results?adv_search=true&isCpeNameSearch=true&query=cpe:2.3:a:skopeo_project:skopeo:*:*:*:*:*:*:*:*
    https://nvd.nist.gov/vuln/search/results?adv_search=true&isCpeNameSearch=true&query=cpe:2.3:a:skopeo_project:skopeo:1.16.1:*:*:*:*:*:*:*

This was fixed in containers/image in upstream commit a3d69a4a (Use the
same HTTP client for contacting the bearer token server and the
registry, 2019-08-01) which has been released in containers/image
v3.0.0 (2019-08-02), which has been vendored in skopeo since commit
bebcb94653cc (vendor github.com/containers/image@v3.0.0) released the
same day in skopeo 0.1.38 (2019-02-08).

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 package/skopeo/skopeo.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
index 9859d774d4..e2f7b8e889 100644
--- a/package/skopeo/skopeo.mk
+++ b/package/skopeo/skopeo.mk
@@ -11,6 +11,10 @@ SKOPEO_LICENSE = Apache-2.0
 SKOPEO_LICENSE_FILES = LICENSE
 SKOPEO_CPE_ID_VALID = YES
 
+# Applies to skopeo without a version; in practice, unaplicable since
+# skopeo 0.1.38 (2019-08-02)
+SKOPEO_CVE_IGNORE = CVE-2019-10214
+
 HOST_SKOPEO_DEPENDENCIES = \
 	host-btrfs-progs \
 	host-libgpgme \
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
