Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10230CDB46F
	for <buildroot@archiver.kernel.org>; Mon, 22 Jun 2026 22:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B67F44059C;
	Mon, 22 Jun 2026 22:57:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MrnIF7YeWkY8; Mon, 22 Jun 2026 22:57:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BBFB4058F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782169020;
	bh=tFvbnaKPi6NIyy2UXqixYnwNZqHjAnIse7XqEwyWPhg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nlqBLLf9IArOhsdNpUYhXbZlhxJU+CpTqpbXCmMs84JMmkgdj1YNaClbcfF//Gncs
	 Bsyt2ENSQlnLFaHQHSB2u56QojuFbJrZTYntDcf16HwBODicjigzyVoeJK38k8T1Y9
	 H3GUit+htTsNmJLUs7JkXb5eLELse5eVDASMMzVca8Wjs4tZAWw2DjsFhQFfYfgKft
	 14KyqSp7ryVu/5MDKXvVCYXh2JRQVo69ugE501vxjuvX9ZndAM5JANQ4jS2AnLKyY9
	 Rh/jWR+Yb6lF/IsMHIf4iU/rZ0i4Pq2vhsC/x4s7Y7swF6kGPUtjihIu1289Nh7f7P
	 sciEOpWLa641g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BBFB4058F;
	Mon, 22 Jun 2026 22:57:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 73502367
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 22:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58B3760702
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 22:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c0IGHo6zQ0Si for <buildroot@buildroot.org>;
 Mon, 22 Jun 2026 22:56:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8992B606FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8992B606FF
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8992B606FF
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 22:56:58 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-7e9784666b3so87664a34.1
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 15:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782169017; x=1782773817;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WqjoA+/s0LhWu9xbT1TcjaW8Sw4CR4zeuLYK4FOVfjg=;
 b=TX/aKS4X+zyKd7lrJZso6OPRMQXKdDN96I4I5F9hcjFLxLb/fqgkpc3jboYAyIhxHo
 dtyCoXWYYicgl0By6cmTtg+pKsqTunlfFaCSSpphCCvVrfFqAt4jo7y5egC6738cs4u7
 xmcFYXmDaVYb9INMHexgpbOe41wHuIFvw+QlX0dxM26pmQIz74OPdRGbke6DTCv6u8n3
 npfnzLY6bnK4lcqZQZQuZPleh51wzv5FGPLlepFIGJPiKelU2ucu010/YAN+GwtGxpSj
 DJveygkiInJGfjZJ9RrVZLs890lPwKaLZ2k9ctG+lTEqbW/m/f+plsRfGCDUfPA59HDo
 1HHA==
X-Gm-Message-State: AOJu0Yyc2oNMdNallCQ/ezOJaCDoyNzIA8ci74USl1Sw3zMVVuZpRX3w
 uNqgfdxOFZTX622XZINpGCElgZFfkFcVfezggShKW5K7QsTb7HxxRGWmeDRzTFQEuco=
X-Gm-Gg: AfdE7ckm6wQjrotfxWcaYx2XRUWrWIRXrzO5nlal1arWiEfXjaWm1of5a6pyeEQ8C8o
 jd+F5dVCF10/tjQ/1imQsgWLSRf2kPf0o00xj+x8OAf9XTMjhwfeSz75PB49ZYRkp/6oJccuyex
 WHUZgpcVnIzeVzm0b59HSHJtX4jlI6I6YY9z40sRTj4Ru9XnYx8XqKlhT0+pOjsrO41iA0iOeVp
 LLUXIzGrsif2z8lA044W/OeKWQDNDXrJ4I6XklEL4+JiUycgj+7cY4Xhj0h5aImEvKStAJI1apP
 DHGd6UpzuLL12zPeucFp/pKiH/n5QoFx8yLOYNdbG071bvxRGThEtCH5bOegIX2R7j7VC22OHlk
 CDfDh0+VXoqoUT3iK49tNEDxocXhNSGSBpXvYVEc5ior083++JFnTCud3BNuNEpK44HWDhY5v4E
 pPS+BErlhh1wMHSAagg+MS7zfnsjG7dZshxJJudcJ/NrhRo+amXTbZOd55OkCV/o9gIC46iLW8p
 tvI5+axTclSmRBFGpFf1qels47XF0f3lYijHXHBTtUvd8WKJjTSClTywD8T4o5dnKjh2XMaxyam
 KxoicQ/Z13WLMQo=
X-Received: by 2002:a05:6830:380e:b0:7e3:d29b:fea4 with SMTP id
 46e09a7af769-7e940bcbc1bmr12799098a34.22.1782169017398; 
 Mon, 22 Jun 2026 15:56:57 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (97-118-25-163.hlrn.qwest.net.
 [97.118.25.163]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e94429778csm7570877a34.20.2026.06.22.15.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 15:56:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 22 Jun 2026 16:56:52 -0600
Message-ID: <20260622225652.211757-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782169017; x=1782773817; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WqjoA+/s0LhWu9xbT1TcjaW8Sw4CR4zeuLYK4FOVfjg=;
 b=jGLIB+GVFmGVsxUbNJkfUHiPM5ku4RsndVav4dNiFczfK9rbIcm1yak2Rn5Pcq0Az8
 qjg9IvpTvjWWUDCpfksrveC0kMn75xp/YSNLb2CGLt6IP/2GIhyeSIn2Nixye1r8nDSY
 RVnFaj/33T68SNFgU/rmo4l65N/vvjTXopMkiP9/fOeto0zeL44Rrc5s9XzDGc0iRX6r
 vJIy8pw+fqsU4v/e+5w1xA3/uddTIDE4xBoiPm3fmJK8LNa90/WpjopBsDxKnbpBIcOG
 TaYhtqU2AyU9kg1StEnxkgjKBdUdCPFw730GX1VKrDhGMKhFpEpk4UME87oILA7OB8YL
 O0Xw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=jGLIB+GV
Subject: [Buildroot] [PATCH 1/1] package/cloudflared: bump to version
 2026.6.1
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/cloudflared/cloudflared.hash | 2 +-
 package/cloudflared/cloudflared.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cloudflared/cloudflared.hash b/package/cloudflared/cloudflared.hash
index 407d24ccdb..89110ffe3f 100644
--- a/package/cloudflared/cloudflared.hash
+++ b/package/cloudflared/cloudflared.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  803d3e162dc91da6b3b4f7961f57c113fa818d45517758511f72d254d68a46ba  cloudflared-2025.8.1-go2.tar.gz
+sha256  c3619a29cc529a5bc43ba99e1b298483ac0b8d8c412f69575c089a6bd4a7867d  cloudflared-2026.6.1-go2.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/cloudflared/cloudflared.mk b/package/cloudflared/cloudflared.mk
index 03b6a8fae6..44ddc82226 100644
--- a/package/cloudflared/cloudflared.mk
+++ b/package/cloudflared/cloudflared.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLOUDFLARED_VERSION = 2025.8.1
+CLOUDFLARED_VERSION = 2026.6.1
 CLOUDFLARED_SITE = $(call github,cloudflare,cloudflared,$(CLOUDFLARED_VERSION))
 CLOUDFLARED_LICENSE = Apache-2.0
 CLOUDFLARED_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
