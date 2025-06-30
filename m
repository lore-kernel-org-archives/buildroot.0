Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07400C8302D
	for <buildroot@archiver.kernel.org>; Mon, 30 Jun 2025 13:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE24D610E0;
	Mon, 30 Jun 2025 13:05:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nLkYHybcNlt0; Mon, 30 Jun 2025 13:05:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC94B61060
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC94B61060;
	Mon, 30 Jun 2025 13:05:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 16892223
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 13:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 080E440722
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 13:05:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TqBohsnzdMmL for <buildroot@buildroot.org>;
 Mon, 30 Jun 2025 13:05:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.236;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9A0C9406FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A0C9406FE
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A0C9406FE
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 13:05:16 +0000 (UTC)
X-CSE-ConnectionGUID: czjyR8oCQ8GaLYvLDG85Dw==
X-CSE-MsgGUID: v/c9vwQHS66t7VpVsOjcFg==
Received: from unknown (HELO opfedv1rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 15:05:12 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Jun 2025 15:05:12 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57;
 Mon, 30 Jun 2025 15:05:10 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 30 Jun 2025 15:05:10 +0200
X-CSE-ConnectionGUID: AOIYbnr8QBmxXCgKTxiTcQ==
X-CSE-MsgGUID: QWUHLK9ISLecG7vOhyHgrA==
X-IronPort-AV: E=Sophos;i="6.16,277,1744063200"; d="scan'208";a="307871131"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Julien Olivain <ju.o@free.fr>
Date: Mon, 30 Jun 2025 15:05:10 +0200
Message-ID: <c509e65797c5662315ce9316ee1c4b50e5275111.1751288710.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX206.corporate.adroot.infra.ftgroup (10.115.27.7)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1751288718; x=1782824718;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ENMOkZbyTJZBEt8yTtB8IeAHU52NNxP00hz/MxzgbMQ=;
 b=Jh5K2rffKSO6qzmbiDAqhLhOxqqNYd8XKieYgCtpjmTumu8o6Ak9V5FT
 Izn8wCsGWkBHk7jqvkDIrPC1k3vixu8uHpcM1b0fIzzyuo3rV4ttVpe2M
 vUkzPormhlfGhP8lmcY3CaB70l7wogH0G8bog59dg0g94bLDnT08Ye8FI
 Cy8VGzJXcqKS8B3OfXdoJcOXnRkKljp1rYk6Ay8P4v25fvaPCAQYH2V1g
 6+W+IFyvmXAkVTAhW0kd1qPhrypulf94MbJnyFA6AUB1VSy/D/6LXiWIw
 4da5t4Dkdcy3TjgRm6E9nAlgqxBRBdZqgZN9IoKI238K1Q+TTl48G8PSj
 w==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=Jh5K2rff
Subject: [Buildroot] [PATCH] package/passt: needs headers >= 5.0
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

Upstream passt only documents runtime dependencies; and they advertise
being able to run on kernel 3.8 or later. However, they do not document
the build dependencies.

As reported by Julien, since 2024_12_11.09478d5, upstream requires
kernel headers >= 5.0, as they make use of linux/vhost_types.h, only
introduced in 5.0.

Add a dependency to kernel headers, and propagate it to podman, updating
the previous 4.14 requirement.

Reported-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 package/passt/Config.in  | 4 ++++
 package/podman/Config.in | 6 +++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/passt/Config.in b/package/passt/Config.in
index a2d2f4f1fe..a93a088670 100644
--- a/package/passt/Config.in
+++ b/package/passt/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PASST
 	bool "passt"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
 	help
 	  passt: Plug A Simple Socket Transport
 	  pasta: Pack A Subtle Tap Abstraction
@@ -17,3 +18,6 @@ config BR2_PACKAGE_PASST
 	  hence not requiring any capabilities or privileges.
 
 	  https://passt.top/passt/about/
+
+comment "passt needs a toolchain w/ headers >= 5.0"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
diff --git a/package/podman/Config.in b/package/podman/Config.in
index 6bfd477f38..cb7984f709 100644
--- a/package/podman/Config.in
+++ b/package/podman/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_PODMAN
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS  # netavark
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # libgpgme
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS  # libseccomp
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14  # shadow
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0  # passt
 	depends on BR2_TOOLCHAIN_HAS_THREADS  # conmon
 	depends on BR2_USE_WCHAR  # conmon
 	select BR2_PACKAGE_HOST_GO
@@ -82,12 +82,12 @@ endchoice
 
 endif
 
-comment "podman needs a toolchain w/ headers >= 4.14, threads, wchar"
+comment "podman needs a toolchain w/ headers >= 5.0, threads, wchar"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 \
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_USE_WCHAR
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
