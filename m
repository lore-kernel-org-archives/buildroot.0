Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B2F1061B06
	for <buildroot@archiver.kernel.org>; Mon, 30 Mar 2026 14:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4875C40BC6;
	Mon, 30 Mar 2026 14:46:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PDKyPx4z5GXO; Mon, 30 Mar 2026 14:46:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BA6440C55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774881976;
	bh=fq4rp5qsLD9+ytZGC0Rulip5l25lUftmKj/Apz+HolY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RLlvhSsKdyOOsQKpqVBwvbq9g83PpG3KTuBNpeiWWC1i98pgqKXAqfJjwQsGQ/w7R
	 hSNv98QTvh/sIZZ9WdJMJJ9HV+dCse6H3VHcBDT1YhAQTheuXqArrIfh3ulm4FQacR
	 kUGTgGZt6nEMl7RHQ+lZkXs3ymjRUYFsEUvqBbkV80mCI5E0v2wU+yXiWBZv89LpV+
	 0DlD7h6uHTPTnsg77GieVN360IC0Jkkjeqx10ZYAbj4CtxTkX+eblQ4c+mUahiFNOR
	 MVxTzXDoCwYc6iblMyicfOk67vgYjDC2Qz672SnOn38qrUcoso/0eYQ1uR/aqvXQQx
	 hfX702Rdh9Kew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BA6440C55;
	Mon, 30 Mar 2026 14:46:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DD0F410F
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 14:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2B1C80FA8
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 14:46:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U35n8j_aO5MM for <buildroot@buildroot.org>;
 Mon, 30 Mar 2026 14:46:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f29; helo=mail-qv1-xf29.google.com;
 envelope-from=a.p.dicarlo@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 15E1A80FAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15E1A80FAB
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15E1A80FAB
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 14:46:13 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-8a068db9989so13251316d6.0
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 07:46:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774881972; x=1775486772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CRcvjwgfzMJqmIY9vTp53BdvrH0doqH3Tf34oQ3VR6U=;
 b=G/O3D6xHsGX+vDDjRdzk2khhXEmF/OoccuCunWZ06PclpeUw6thXWxZc4050HPXlZe
 ApFd6Bio8nu+joHZtggStqAlZlfMb3mUrQBmcjreqaTqoe3gVzywm5qVXxD2BXpxt6Kx
 Lh1xwVHmnTwCxv6cUOIBQ1RG9coOEZRUNyQ3zGyPLin9iGxhzv10wGiy7UnchLSNjuWs
 BqPKP5yS2pNa+t7Si7jUM6mu5W6W2UbbOAJA+Dxs6d0cSshAlXhaZDOltM7xtjattOUC
 VSuBbBuq0GvBsB7NIWr9mO0Y7g5yK0K2POufK7hvTaQtM9rvwlyir/nxlgK7fIsKLsIX
 AwTg==
X-Gm-Message-State: AOJu0YzTluVjaI5sbmoWb8oMm7TSHyCziwZ/gr94jv7CbR7jW22CdqWx
 L6B+yIgJAg0urpWKc3anb57U0uo5YaC3JtZY73BhC4gOShK19q4G1Jq6cQNpOs5C
X-Gm-Gg: ATEYQzyJZlJHPgri95odF0FJFUJ298lSq6NY8zx0xbRge+X4U+FZ/gx9IlYRChnS47f
 3OixiLoz7jbMBGWpHjSLKSEVzQMXWOF7tCc+wmWt4pZYLIVOI0pMF71p2RqyDGjU5gA73krtopK
 PS2BSEx2RHcycWplhoCGxC+INB04PchLIfaqOWI2shrf8U7x8ptcclyHMQ/UTi3l6zMptCFaCUB
 svRu1lKUxWWvBrFUfBbe/PFASl4claxURg36uQafWXJiglYQ/MDHF+WFQNJ6oQ47Tdn5xaidKJR
 wVo5Zlt0u3VPLmUPGolQ+SDyszQclYZJ1mn3lGCmG9Up2duaRZt1jq3WtnoOcfVL5kDvrq6Iy1Q
 +/O6ZWZBD8kKkkUMp+RPOdMW3EcLTe7vf9F2W5DQCAcHwS1fD71HFx7nZkA/Netm/QAPP54eiwv
 ydsLq9a5TVYI5ogn47YMT3Zw==
X-Received: by 2002:a05:6214:2486:b0:89e:da6f:69cb with SMTP id
 6a1803df08f44-89eda6f6b30mr125005126d6.7.1774881971711; 
 Mon, 30 Mar 2026 07:46:11 -0700 (PDT)
Received: from adicarlo.nyc ([2603:7000:4000:24ab:21e:4fff:feac:60a])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89f3ba99abbsm59246956d6.28.2026.03.30.07.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2026 07:46:09 -0700 (PDT)
Received: from yogur.coo (yogur.coo [192.168.7.134])
 by adicarlo.nyc (Postfix) with ESMTP id BD49DA987A5;
 Mon, 30 Mar 2026 10:46:08 -0400 (EDT)
Received: by yogur.coo (Postfix, from userid 1000)
 id A386C8B; Mon, 30 Mar 2026 10:46:08 -0400 (EDT)
From: Adam Di Carlo <a.p.dicarlo@gmail.com>
To: buildroot@buildroot.org
Cc: Adam Di Carlo <a.p.dicarlo@gmail.com>
Date: Mon, 30 Mar 2026 10:45:51 -0400
Message-ID: <20260330144553.2525883-3-a.p.dicarlo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330144553.2525883-1-a.p.dicarlo@gmail.com>
References: <20260329154709.539516-1-a.p.dicarlo@gmail.com>
 <20260330144553.2525883-1-a.p.dicarlo@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774881972; x=1775486772; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CRcvjwgfzMJqmIY9vTp53BdvrH0doqH3Tf34oQ3VR6U=;
 b=ZkYHIwz0FZyG/Wi9nvzbJAfgdc73zsvvQi7JFa/gB5Zq/cDDBwib4v5ZGB+WFC/Vzd
 smE/oVgjz1JC5QPcPurmZgXfivCoXZn1TuqOgYDnT83ajUeKoL/GC84lqt6I+ENlhBfK
 e1CN7MBBP32OdpahufgoB3ecDhrKbjA2brv8SaBcGNd1EQKN9kx8/A2Mh/a8DaxPx8ub
 BX8Y/Wgkqw+bpcOovOmEmLQOZS5scLvpwZSafSfUy6VgpwXM1iDHOoG7fSUdFIIZ6nE2
 TGzMu9Fmp9V6ZLQCKMmIbj9i3E0wG67EeHn6XXWmz/tq1frFYNq263abusSxe1fFJhqz
 O5sg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ZkYHIwz0
Subject: [Buildroot] [PATCH v2 2/3] package/gst1-plugins-bad: decouple va
 from drm and separately select them
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

Disabling BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VA was also disabling
DRM support, and that in term mostly crippled KMS support.  Both
should be enabled or disabled separately, with any dependancies
expressed elsewhere.

Signed-off-by: Adam Di Carlo <a.p.dicarlo@gmail.com>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index c6fb669e13..e488fa3c2d 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -746,14 +746,15 @@ endif
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VA),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Dva=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += libva
+else
+GST1_PLUGINS_BAD_CONF_OPTS += -Dva=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_LIBDRM),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Ddrm=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += libdrm
-endif
 else
-GST1_PLUGINS_BAD_CONF_OPTS += \
-	-Ddrm=disabled \
-	-Dva=disabled
+GST1_PLUGINS_BAD_CONF_OPTS += -Ddrm=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VOAACENC),y)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
