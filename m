Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65D9C3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 15:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76F83401DF;
	Thu, 15 Aug 2024 15:19:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5xJevUHpmBNC; Thu, 15 Aug 2024 15:19:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BEE140EC4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BEE140EC4;
	Thu, 15 Aug 2024 15:19:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C0921BF584
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 15:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED33D407D2
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 15:19:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2n9JfWelmWfk for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 15:19:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.14;
 helo=sender4-op-o14.zoho.com; envelope-from=george.kiagiadakis@collabora.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 247BA4027B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 247BA4027B
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com
 [136.143.188.14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 247BA4027B
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 15:19:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1723734261; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Gz1aVjZ37ZhEBq1UpE4MvU5ie7y+/MaSWa0vBEWqyXUh0ZieI1MzxyRppq/SfMEN4c7aepx9lfIBsdh5t7R87sJQCUGhr1AY68BRRTqVwh+QROQe0lfMix4ALAplUdlgLhghYWnPtlbSfLBzTXZqUIA3UH18OnbxKfQR4iIEhYM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723734261;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=FenfFutgsL0o3C2fw9oNNO57pgz8wDS9B2czc7YT/1s=; 
 b=UpnpH+Llr0FTBe21093GWPh5JFi7Sb7YoavJO2p2tiK896thweMbaWg8duAnXC7qLbE64FKlj0tG4vTmALxKjBumEejiKZZlK+xlq+qOBS5WqgcM1/LKNCT05w9EdNYOTG6ckmFHz0aWCQUHEbbDzvdZMmdBx2GKZiTL+oiWkI4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=george.kiagiadakis@collabora.com;
 dmarc=pass header.from=<george.kiagiadakis@collabora.com>
Received: by mx.zohomail.com with SMTPS id 17237342585459.603535759807869;
 Thu, 15 Aug 2024 08:04:18 -0700 (PDT)
From: George Kiagiadakis <george.kiagiadakis@collabora.com>
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 18:03:40 +0300
Message-ID: <20240815150344.241837-3-george.kiagiadakis@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240815150344.241837-1-george.kiagiadakis@collabora.com>
References: <20240815150344.241837-1-george.kiagiadakis@collabora.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1723734261; 
 s=zohomail; d=collabora.com; i=george.kiagiadakis@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=FenfFutgsL0o3C2fw9oNNO57pgz8wDS9B2czc7YT/1s=;
 b=FW+XhAo7eZxNoSZIi8+M92OjskkE/i/bfVAE0vQLBUlZKxvtZdPMTPyZrk34Berf
 riSvI0fyeXbZRkGlJQgkbYNHjuMtSYB+JcYs/c1D9gdnFrxazm6pvdZcxRxS6WOHT2Y
 eW+tzTg07dXHQE6YHbwSoYQF+FQmxko4vW4I7Pm8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=collabora.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=collabora.com header.i=george.kiagiadakis@collabora.com
 header.a=rsa-sha256 header.s=zohomail header.b=FW+XhAo7
Subject: [Buildroot] [PATCH 3/4] package: add wireplumber in the config
 system
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
 package/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/Config.in b/package/Config.in
index f2c63ffb6e..33cb50522f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -61,6 +61,7 @@ menu "Audio and video applications"
 	source "package/vlc/Config.in"
 	source "package/vorbis-tools/Config.in"
 	source "package/wavpack/Config.in"
+	source "package/wireplumber/Config.in"
 	source "package/yavta/Config.in"
 	source "package/ympd/Config.in"
 	source "package/zynaddsubfx/Config.in"
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
