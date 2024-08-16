Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810F5C3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 16 Aug 2024 09:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3580960D72;
	Fri, 16 Aug 2024 09:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id arlpKkM-GuaI; Fri, 16 Aug 2024 09:11:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0202360698
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0202360698;
	Fri, 16 Aug 2024 09:11:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA5CC1BF292
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 09:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A70874024A
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 09:11:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ni8702l0qjNK for <buildroot@lists.busybox.net>;
 Fri, 16 Aug 2024 09:11:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.14;
 helo=sender4-op-o14.zoho.com; envelope-from=george.kiagiadakis@collabora.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C3BFE4023B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3BFE4023B
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com
 [136.143.188.14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C3BFE4023B
 for <buildroot@buildroot.org>; Fri, 16 Aug 2024 09:11:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1723799507; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Nt3S47/YewDryQzC/Glo65tL8joG0D0LMCcnFVlVRThVgekHvXYHgFvqvKmyoLvz9PCiQz71R0PqOEx1QCxNwSI50Bpx7RwdU7GWFf8NvHFLP/EGccD1XFrrn9paEZLy8cCwK7n8o/VOWrhXIiNw7NZf5HPpd+Tu6DQrFGcZTHQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723799507;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=EB/flI9TB6yjU4+vQuQYXxxZBn/nBqdRZzbrDXZajE8=; 
 b=FuOaPv9XHtN/1F3PFDvqgtvDNBY9cuyJJh854q5HbS2YmtcGvDR1d0kRKfMHP1e5fs7nXQpYxO2DR5/t2BcdxKXh1qf2NZ8uwLMM0Y9j877I/v/eNQAGzZtTqc9Cck4a8m9ICrt8mMHdu3ai8WeOOMckvEGw3KSIJWIlaF4Neqs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=george.kiagiadakis@collabora.com;
 dmarc=pass header.from=<george.kiagiadakis@collabora.com>
Received: by mx.zohomail.com with SMTPS id 172379950675787.14161291424273;
 Fri, 16 Aug 2024 02:11:46 -0700 (PDT)
From: George Kiagiadakis <george.kiagiadakis@collabora.com>
To: buildroot@buildroot.org
Date: Fri, 16 Aug 2024 12:06:59 +0300
Message-ID: <20240816091119.38036-3-george.kiagiadakis@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240816091119.38036-1-george.kiagiadakis@collabora.com>
References: <20240816091119.38036-1-george.kiagiadakis@collabora.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1723799507; 
 s=zohomail; d=collabora.com; i=george.kiagiadakis@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=EB/flI9TB6yjU4+vQuQYXxxZBn/nBqdRZzbrDXZajE8=;
 b=gsed/1xSqe6Mw4iBpohUFStW8rRIWVpip7aYLKIgudYot1BMGuKK9modDuSwgTNg
 nKjWoKxyNJC73thwcliaWQC/Q+r5OHX+064rahBTdUendfMBWOHX6R8myuX5ZUW0Ddi
 Mf1CoEdLxFw1hZqwzOY+hqPhsyo3cDbypS0pVFM0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=collabora.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=collabora.com
 header.i=george.kiagiadakis@collabora.com header.a=rsa-sha256
 header.s=zohomail header.b=gsed/1xS
Subject: [Buildroot] [PATCH v2 3/4] package: move wireplumber from Graphics
 to Audio/Video
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

WirePlumber is a PipeWire session manager, essential to the operation
of PipeWire in most use cases. It is not a graphical application,
nor does it support graphics in any way. It is only there to support
PipeWire and it should be kept together with PipeWire in the menus.

Signed-off-by: George Kiagiadakis <george.kiagiadakis@collabora.com>
---
Changes since v1:
  - Reworked to move the option instead of adding it a second time
    in the Audio/Video section

 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index f2c63ffb6e..8a39e82de4 100644
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
@@ -1763,7 +1764,6 @@ menu "Graphics"
 	source "package/waylandpp/Config.in"
 	source "package/webkitgtk/Config.in"
 	source "package/webp/Config.in"
-	source "package/wireplumber/Config.in"
 	source "package/wlroots/Config.in"
 	source "package/woff2/Config.in"
 	source "package/wpebackend-fdo/Config.in"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
