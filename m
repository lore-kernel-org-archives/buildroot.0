Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392F3C27C53
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 23:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53BD6849CC;
	Wed,  5 Jun 2024 23:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NZFbxI3ocB2M; Wed,  5 Jun 2024 23:35:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A795849CD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A795849CD;
	Wed,  5 Jun 2024 23:35:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 70C751BF5A5
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 23:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E74B611A7
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 23:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CYdi6SfU2CyM for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 23:35:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org;
 envelope-from=jarkko@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 35DC0611A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35DC0611A3
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 35DC0611A3
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 23:35:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F234561485;
 Wed,  5 Jun 2024 23:35:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4380CC2BD11;
 Wed,  5 Jun 2024 23:35:15 +0000 (UTC)
From: Jarkko Sakkinen <jarkko@kernel.org>
To: buildroot@buildroot.org
Date: Thu,  6 Jun 2024 02:35:01 +0300
Message-ID: <20240605233503.23516-2-jarkko@kernel.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240605233503.23516-1-jarkko@kernel.org>
References: <20240605233503.23516-1-jarkko@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1717630515;
 bh=H285Dxn2p2WmhqnGPhIw4sogWbbq+C9FU8CEXBsZxPI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qJng7DOWOR8ES+gh+E6yIwqPWSNdtZrHDSdWTbBMOXqu69XDrG6G4ue9sWDM5cnQT
 L6pAh0AmQ5WA2nLCFnRVhY3Sap+9Ph2vXOpEySudCo7q/Q47OavU80TmLCjvw8Vsxw
 ikAJrCTFN642/PZDApaD0s+pSfLsc8mVchcfV9K9DnnohJqQeAlQ9kfs7UmBq5vLWz
 lhRTwaVa/T9sWHNZf1CdF7tZ3EnTglyt2irFpdm+VDWWzH2oUFH8yYRvchF7SAELW5
 wrWhjE3CI6zvXGVxUyQ7esRMJROsLMlhF8bf3GztBxnDWsdxrMu3b8gbGg+O4KSqAN
 fDrt3FFQ6gbrQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qJng7DOW
Subject: [Buildroot] [PATCH v7 1/3] package/json-glib: add host build
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
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
v7:
- Rebase to f77d698f83b2 ("support/scripts/apply-patches: use appropriate TAR").
v3:
- Remove host kconfig symbol.
- HOST_JSON_GLIB_CONF_OPTS = -Dintrospection=disabled
v2:
- Disable GOI and NLS for the host.
- Add the missing host config.
---
 package/json-glib/json-glib.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index cd53f24cee..cc9f8c9fa1 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -18,6 +18,11 @@ JSON_GLIB_DEPENDENCIES = \
 	host-pkgconf \
 	libglib2

+HOST_JSON_GLIB_DEPENDENCIES = \
+	host-pkgconf \
+	host-libglib2
+HOST_JSON_GLIB_CONF_OPTS = -Dintrospection=disabled
+
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 JSON_GLIB_CONF_OPTS += -Dintrospection=enabled
 JSON_GLIB_DEPENDENCIES += gobject-introspection
@@ -34,3 +39,4 @@ endif
 JSON_GLIB_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)

 $(eval $(meson-package))
+$(eval $(host-meson-package))
--
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
