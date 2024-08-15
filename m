Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC01C3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 15:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1AFA440EC4;
	Thu, 15 Aug 2024 15:19:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iA5Wq_6Lemx5; Thu, 15 Aug 2024 15:19:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 080E840199
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 080E840199;
	Thu, 15 Aug 2024 15:19:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 569DE1BF584
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 15:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4355180AEB
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 15:19:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CBsaVKWIUw-p for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 15:19:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.14;
 helo=sender4-op-o14.zoho.com; envelope-from=george.kiagiadakis@collabora.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 907F580ACD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 907F580ACD
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com
 [136.143.188.14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 907F580ACD
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 15:19:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1723734271; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FYAKiPZYnFOC9uu2uUqWLTMqWAlh78BFN6PXtpXGgaajoJHUrpoaE+qZXiwopUEzxpUG/mtqH1EPI8IbIOcEy8F8tlpfF+lHmfRB1Uk+uyVCQlKejXA7VSibZ7CPpwKuGqIdezWLqJGKnTDVkHf99630TClfTNoZaDqZYnF2UI8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723734271;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=DZ7SGeRng4hNsYhS+FSDeZsNKYREd9YuMPKLH1HFe1Q=; 
 b=Ldf1b4ItjpOt6K0lOYUUkyQkUdSbVTXi+dBj/kQOL+z59439uqGdXKx01TQuTcC9nRyjgCrR2P+x9vfJCFYoz+Kj0qMMXKpb1bjwXSke7DLOLWDTdBVSJAYQ2bC6yv6vn0OFviQmjha+3vPhNOCLXEsIqC4eBCb2PeQvxIvktUY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=george.kiagiadakis@collabora.com;
 dmarc=pass header.from=<george.kiagiadakis@collabora.com>
Received: by mx.zohomail.com with SMTPS id 1723734270014453.58675949527185;
 Thu, 15 Aug 2024 08:04:30 -0700 (PDT)
From: George Kiagiadakis <george.kiagiadakis@collabora.com>
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 18:03:41 +0300
Message-ID: <20240815150344.241837-4-george.kiagiadakis@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240815150344.241837-1-george.kiagiadakis@collabora.com>
References: <20240815150344.241837-1-george.kiagiadakis@collabora.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1723734271; 
 s=zohomail; d=collabora.com; i=george.kiagiadakis@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=DZ7SGeRng4hNsYhS+FSDeZsNKYREd9YuMPKLH1HFe1Q=;
 b=kb3pP8uaTMqRzA8RVxGGnThg0U8t6Vv30t7uuzt/yS/QMWbZ/AopF9LaBWHSK7iQ
 08D+vwzbjK8q5Fz8KLkUwBeb+I+kQxkjqHnKWpBl3yiMJ46+p2XEJ+C3rMgTxtvJ5ey
 PqBtfHBZamNn4MKsOpAWkVaA1/qyfMrGQ0QYrIlk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=collabora.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=collabora.com header.i=george.kiagiadakis@collabora.com
 header.a=rsa-sha256 header.s=zohomail header.b=kb3pP8ua
Subject: [Buildroot] [PATCH 4/4] package/pipewire: add option to build the
 AAC codec in spa-bluez
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 George Kiagiadakis <george.kiagiadakis@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: George Kiagiadakis <george.kiagiadakis@collabora.com>
---
 package/pipewire/pipewire.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 8df2d03758..eb86a98494 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -122,8 +122,14 @@ PIPEWIRE_DEPENDENCIES += opus
 else
 PIPEWIRE_CONF_OPTS += -Dbluez5-codec-opus=disabled
 endif
+ifeq ($(BR2_PACKAGE_FDK_AAC),y)
+PIPEWIRE_CONF_OPTS += -Dbluez5-codec-aac=enabled
+PIPEWIRE_DEPENDENCIES += fdk-aac
 else
-PIPEWIRE_CONF_OPTS += -Dbluez5=disabled -Dbluez5-codec-opus=disabled
+PIPEWIRE_CONF_OPTS += -Dbluez5-codec-aac=disabled
+endif
+else
+PIPEWIRE_CONF_OPTS += -Dbluez5=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_FFMPEG),y)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
