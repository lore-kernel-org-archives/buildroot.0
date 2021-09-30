Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF6AC433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 03:53:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 090EE615E1
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 03:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 090EE615E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DB5942572;
	Thu, 30 Sep 2021 03:53:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HlK7LO_ZHTuf; Thu, 30 Sep 2021 03:53:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD7FB42570;
	Thu, 30 Sep 2021 03:52:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 84D3C1BF97F
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 03:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72E41402B5
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 03:52:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hzn5SUVaXd6E for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 03:52:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A16E40190
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 03:52:57 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id b16so4452404qtt.7
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 20:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZtSLnUeQRC3Q1QFW23UO1CdghWRjnAaHXzvdo0bydfc=;
 b=mwR5/c9+QtwtbeYu2QphTRa5b3W3wJbgGkRumjr/5FAUmiA80jHDwxcD4Z8hCYusaO
 kqcfSj1ELB2Fj02FOYTZpiHqX1dVDwPCx/eokk+4re5lNwy8m+A28Zh54UZvWdNUcYtE
 JKweKzZ7m5MsdvSQgNgdrC0ecs2x5Qysb7kQMJbFBtqtF8qL6uA9QZ5cLvvVBcbycEfq
 FMUD+57+cYD4BEds9nACyopgxJzBBeraXIHC1ywXuOmhj2g0pv2pxU3sVBU7t/DycwWe
 wG1YGoOMRwQ/9OGItzVjJAg0qj2r7eI3vbYjUqiQKPn2iJWHOeFNTi1/j+hJm6MezmgB
 Yp0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZtSLnUeQRC3Q1QFW23UO1CdghWRjnAaHXzvdo0bydfc=;
 b=uDU+KijtZXHzo9bUdc4/tQ9oMPHrIJZS0ahGets0Ep+xKcy5wOGNZO20a1TNl5iQqv
 eTx0+uOxo/xWD9FTkGOTyMwrXeumWg4RCl36K570njW8ZeY4QibHoNOEOzWiYtLmzhUe
 gAwx5TE1nbmnX3UtLqhA1CP4QUdeLcxnJ0ccDEtCovprurtZeB2F9pkZ7F4N5CRmSfPr
 r7ReFX10eHnJdPMPcyrpaWeI50TZsWpec4O8MQJ/hwQ21HJ9iByo/JGvqFFjleW8FhDr
 gE2s8enyPIPrhl14Q72/raAu+9FSJ89j7Xr9+zHHlBvGkwejVYTaBsMmZRf9yshjczmQ
 ZhhA==
X-Gm-Message-State: AOAM532UNC0aEq03JgdAbg5kcwS8xpsGpUhNmyoIAKNAIN5YKKKW/ufI
 Ag+4yeWqBshGPTcGN9Pj2ebrsfaIyQcCkHvO
X-Google-Smtp-Source: ABdhPJxyipuzm0W3ffzjUPidYnsd6LGVGJc793EGT8bVBiJN1/8V2Nid8RCpS0+nn82BqlAQ9Jl46A==
X-Received: by 2002:a05:622a:1815:: with SMTP id
 t21mr4115359qtc.373.1632973976328; 
 Wed, 29 Sep 2021 20:52:56 -0700 (PDT)
Received: from blueberry.lan (199-189-229-49.dhcp.imoncommunications.net.
 [199.189.229.49])
 by smtp.gmail.com with ESMTPSA id u12sm904093qkk.109.2021.09.29.20.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 20:52:55 -0700 (PDT)
From: sam.voss@gmail.com
To: buildroot@buildroot.org
Date: Wed, 29 Sep 2021 22:52:49 -0500
Message-Id: <20210930035250.23687-1-sam.voss@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/ripgrep: ignore CVE-2021-3013 as
 Windows only
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
Cc: Sam Voss <sam.voss@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Sam Voss <sam.voss@gmail.com>

CVE-2021-3013 does not impact any buildroot versions of ripgrep as it is
a Windows-only exploit targeting ripgrep versions earlier than 13. It
can be safely ignored on our LTS branches.

Signed-off-by: Sam Voss <sam.voss@gmail.com>

---

Note: Please apply this patch to:

  * 2021.02.x
  * 2021.05.x
  * 2021.08.x

Master currently has version 13, which does not report this CVE.
---
 package/ripgrep/ripgrep.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
index 450bb020e3..8d0185595d 100644
--- a/package/ripgrep/ripgrep.mk
+++ b/package/ripgrep/ripgrep.mk
@@ -10,6 +10,9 @@ RIPGREP_LICENSE = MIT
 RIPGREP_LICENSE_FILES = LICENSE-MIT
 RIPGREP_CPE_ID_VENDOR = ripgrep_project
 
+# CVE only impacts ripgrep on Windows
+RIPGREP_IGNORE_CVES += CVE-2021-3013
+
 RIPGREP_DEPENDENCIES = host-rustc
 RIPGREP_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo \
 	__CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS="nightly" \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
