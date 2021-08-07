Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A3EBC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 08:58:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F8C560F10
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 08:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F8C560F10
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 208F340411;
	Sat,  7 Aug 2021 08:58:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EbgJNtcMHYAh; Sat,  7 Aug 2021 08:58:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64CAB40496;
	Sat,  7 Aug 2021 08:58:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 910FA1BF2FA
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 08:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C46F83AFE
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 08:58:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qqHy7RFwbFtz for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 08:58:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0783483A81
 for <buildroot@busybox.net>; Sat,  7 Aug 2021 08:58:04 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 l11-20020a7bcf0b0000b0290253545c2997so7700641wmg.4
 for <buildroot@busybox.net>; Sat, 07 Aug 2021 01:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i95dkSwF581Ke0BjGCGeZLbr1BO1CEI6/jN7y7GBQtk=;
 b=nsW961nAPmljTw6dzP1Epq1Iv9pxq4NDCh8CfbepsACb4JA2R8LKsGpwe3gZMg3l/a
 627gVLuzQ7vzlzxDnm+ysc+Os5oBDAQ54qjX8korW+qbHxDyWmZhqAZz+ZJXdjCxgzH8
 Wi4nPTGlL/bT7UJ5SR8O218zO5fZb3dyfGwCvPT/A8KxrFU9oog8DDlcdkoiK9wT3vBx
 EmrA16zXF9SL8auTWak5bN7J7ET75vZ9BFctO+Oo9AI13QDcpG3T11BBM3D1LDt2cYSM
 3oBS6A+j0w90+p1mg2s46U6BrssooXw+hX0S8V+nhI98Sua4xLJIu8B/hirqkC2r2tdt
 zE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i95dkSwF581Ke0BjGCGeZLbr1BO1CEI6/jN7y7GBQtk=;
 b=h1Y1FW9e8p83++dQDMlB+6ipsHD7/evLMJMkbT/WS8nm3S6krOFebNV+BJ7kGRIaha
 gTKHAMIS75aqC5neuPqZ7y0vG8/NGFhaIIi2RtLPcuQq+FsikBKE36GFuTSp6/Bd0mGE
 m62ftfhPmaafKP/h6pxKNenbu/AMbQAqlOOHU6BhFPrxudp6c5LUCfzHU8POHC1bvRm4
 2KDgSWoW70XDsq6XXi4TJ2fNMv5g5gB6XrCf4XOfikKP+5uer2opGdXt4c/cugxGV1Wu
 wxSxWskgh9d89kUWKTL61OwqICLTPzOai1OWIpKaLHFogIF22yqm9YwOAA+jALZk2CJC
 00Ig==
X-Gm-Message-State: AOAM530CnmtO816ZDEEOclJAGbJRKNdUTGab0sCtrLmmE+wlFrnWxX1T
 oDq7xK28tHDKs/G/3pFbERXi7SkNIPc=
X-Google-Smtp-Source: ABdhPJyheWK4VutWv0mEnfJqJJOdYnyxwNHp6MIIVzhefeWURbYKXYWbQtw0iOXjcvm7/kXIWQQ7cQ==
X-Received: by 2002:a7b:cb98:: with SMTP id m24mr7270782wmi.24.1628326683293; 
 Sat, 07 Aug 2021 01:58:03 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id t16sm12718110wmi.13.2021.08.07.01.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 01:58:03 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat,  7 Aug 2021 10:57:52 +0200
Message-Id: <20210807085752.3269-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210807085752.3269-1-francois.perrad@gadz.org>
References: <20210807085752.3269-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 2/2] package/luaossl: force no sysctl
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

same issue as with lua-lunix

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luaossl/0001-force-no-sysctl.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/luaossl/0001-force-no-sysctl.patch

diff --git a/package/luaossl/0001-force-no-sysctl.patch b/package/luaossl/0001-force-no-sysctl.patch
new file mode 100644
index 000000000..558d0dce7
--- /dev/null
+++ b/package/luaossl/0001-force-no-sysctl.patch
@@ -0,0 +1,28 @@
+From d701a8f40bef389f8caf5ea67651179fa55a6e0b Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Wed, 4 Aug 2021 14:56:51 +0200
+Subject: [PATCH] force no sysctl
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ luaossl-rel-20200709/luaossl-20200709-0.rockspec | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/luaossl-rel-20200709/luaossl-20200709-0.rockspec b/luaossl-rel-20200709/luaossl-20200709-0.rockspec
+index fb66acb..c0073b0 100644
+--- a/luaossl-rel-20200709/luaossl-20200709-0.rockspec
++++ b/luaossl-rel-20200709/luaossl-20200709-0.rockspec
+@@ -114,6 +114,10 @@ build = {
+ 						nil, nil, nil, nil;
+ 						"dl";
+ 					};
++					defines = {
++						nil, nil, nil, nil;
++						"HAVE_SYS_SYSCTL_H=0";
++					};
+ 				};
+ 			};
+ 		};
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
