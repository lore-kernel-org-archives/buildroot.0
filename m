Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16810C531DC
	for <buildroot@archiver.kernel.org>; Fri, 16 Aug 2024 09:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8A0160B6F;
	Fri, 16 Aug 2024 09:11:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fd3fRi9DJuFm; Fri, 16 Aug 2024 09:11:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE36060E35
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE36060E35;
	Fri, 16 Aug 2024 09:11:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3291E1BF292
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 09:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A26F4025A
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 09:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SfI1owJy-AGM for <buildroot@lists.busybox.net>;
 Fri, 16 Aug 2024 09:11:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.14;
 helo=sender4-op-o14.zoho.com; envelope-from=george.kiagiadakis@collabora.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 58A0E4023B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58A0E4023B
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com
 [136.143.188.14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58A0E4023B
 for <buildroot@buildroot.org>; Fri, 16 Aug 2024 09:11:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1723799511; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=MbB8VqEEbBVIqloeT9cxiUQ/ivMcJFBzG98ekGPoA/oa40bCLk/8sMe6r9jf2kcQraKkdx1osx0LWI/MZmf2HUyHc+KtW/hKyLQScfIR5Nd7vaUfIJYzXxiJB8qKB+NYqGHTeMcYpOAs8o8S3ioFCi4W22IXBc7aEaMpfYs+agM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723799511;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=HSVtMQlVaFwmSgYiAngEtqaWeFelofDKXDqGVVSxkWc=; 
 b=Lzthi9aRY+nf8r4mcXX1K0Lzx2cjkVE9XC63wVtKm7Cgsg/coZNJLXZoUdy20Vc5S9cAvdCEFOaJYgE2QBvnNt4rjTUloh3njsIhcEFJ5x0rheww5XZYDwsj1MGaMsSHQGR69yY/C1naVFKysOSH+MNNYCDg+BH2fXXn2Dj/jd4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=george.kiagiadakis@collabora.com;
 dmarc=pass header.from=<george.kiagiadakis@collabora.com>
Received: by mx.zohomail.com with SMTPS id 1723799509748168.41032865215925;
 Fri, 16 Aug 2024 02:11:49 -0700 (PDT)
From: George Kiagiadakis <george.kiagiadakis@collabora.com>
To: buildroot@buildroot.org
Date: Fri, 16 Aug 2024 12:07:00 +0300
Message-ID: <20240816091119.38036-4-george.kiagiadakis@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240816091119.38036-1-george.kiagiadakis@collabora.com>
References: <20240816091119.38036-1-george.kiagiadakis@collabora.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1723799511; 
 s=zohomail; d=collabora.com; i=george.kiagiadakis@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=HSVtMQlVaFwmSgYiAngEtqaWeFelofDKXDqGVVSxkWc=;
 b=VrXe3WLu2JqnaVlPp0we1gDDVJRa/E3+Pux+gF/FTCX5+UqH6mPt2C/s9E6FRox3
 ekQX7GezRPjA9tsoVKEm2dpoBb+4YGDewvouNHUGZoY8c1FzWUpalwLnmKDOuM7inmR
 u8G55BDC1uXuSewr/4otTWzzuyveQWFYCyFoMPKQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=collabora.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=collabora.com
 header.i=george.kiagiadakis@collabora.com header.a=rsa-sha256
 header.s=zohomail header.b=VrXe3WLu
Subject: [Buildroot] [PATCH v2 4/4] package/pipewire: add option to build
 the AAC codec in spa-bluez
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

This allows for more precise control of the AAC codec feature,
instead of it being silently enabled if the fdk-aac library happens
to be built earlier, or disabled otherwise.

Also remove the -Dbluez5-codec-opus=disabled option in the case where
the entire bluez5 integration is disabled. -Dbluez5=disabled implies
that all codecs are also disabled.

Signed-off-by: George Kiagiadakis <george.kiagiadakis@collabora.com>
---
Changes since v1:
  - Added details about the change in the commit message

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
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
