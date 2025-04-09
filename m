Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC42AC36002
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 20:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7445261AC3;
	Wed,  9 Apr 2025 20:04:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rZZeyt_X0NvJ; Wed,  9 Apr 2025 20:04:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F97261ACE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F97261ACE;
	Wed,  9 Apr 2025 20:04:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 210E3220
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75A2B82194
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VF7vyAOwwyAa for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 20:03:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E4B0583F76
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4B0583F76
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4B0583F76
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:56 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cf0d787eeso1139765e9.3
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 13:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744229035; x=1744833835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=x+EIPzK/JuXD4/qtVZlj9+B8eB16+T+yGFDIpqa7sCw=;
 b=a8ZBYxFgUP6QHfxZCl/03511fd29Z+gvajIxdMFCTKGXUKXCPJtZVbGYS2ocRaGP0z
 91byYE1nBsoFxUMzvG6S/7mE1rOW0O9wek5ZQYm9iwqjp7pJO4zPheL74BSGli25zWXg
 FPbfc117p/EWjd4z9KJkKjYRbaF84lt8oEouASxPR6hzFJXa/JGAhdjcU0y4XvRdOxv+
 OigwQqYbPN11tem2TRetEQFGyjvaj57OerxQuB2WCLRtyP3m8bo4YpiFwGU8FSk3WMqp
 anzNkkFaw73Mxg7Z9pGGfYRh+q2wUePlat1PMgj0xHV/sKliBqnJVPNr9IxPL8J1fLEW
 6k3A==
X-Gm-Message-State: AOJu0YxQGsMCr6klDGBX6xdS4cmeAPw+6mc0XvKOQlhf9s6Mp1XH1KA/
 T1fa8nwx4/QRBdzFjG9R2q6l9tHJftBZCRXen/cArc4UTTI0IdpN3iTZLQ==
X-Gm-Gg: ASbGncu+3IpXT2aI39n2YmgXfhPuNoJfrGmnJ52rW+oxA+ijg0s+yL/sKlAVKLhavLe
 GmrkzPtFZuCJ90vQJTk/7PW765CsJ7O9yuO8M68uBr47iqx/Jp/0fCwzAXZJFxHUWhN6S454+UT
 z6/Can5m/e28JKolBsmDjFPxuWoYdAktFjWthHTVyqQo/qy0REdsYeUpYchIyZLJgqpL0GYV8B0
 JIGoE/WBJ2kzidH/ClgQq5PxdD1pTiaYPLcE57FBP6Kg9hKk2wdneyJ4lV44aLG3Lte993PaE3s
 B0wftmhTY9TqWGanyqfpv0dZsSSQgUt5NGEjXZyrcG4Mv3nKBxM=
X-Google-Smtp-Source: AGHT+IGBjzsnaa5UGY6U8WYMiSm51hiF9zjCvmXlV9LtF+u7kXvgUrpQSWDQAGiJqZ2+TEdFODuKzw==
X-Received: by 2002:a5d:6daa:0:b0:391:2bcc:11f2 with SMTP id
 ffacd0b85a97d-39d8f2734cemr64072f8f.1.1744229034705; 
 Wed, 09 Apr 2025 13:03:54 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8937734esm2526113f8f.32.2025.04.09.13.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 13:03:54 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed,  9 Apr 2025 22:03:37 +0200
Message-ID: <0d57096398e70de59055d9f6186d69e71b543915.1744229017.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1744229017.git.yann.morin.1998@free.fr>
References: <cover.1744229017.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744229035; x=1744833835; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x+EIPzK/JuXD4/qtVZlj9+B8eB16+T+yGFDIpqa7sCw=;
 b=F4audHmYz0/EYrhH+kQ3CcwonxaVnax4FIZJGGYeMV6ZFPmSGInh3y6M/caGws75Kp
 pEbLKtqK+UE4mOD+qsdV8iFpefyJjMLRIutGcMAhexJkd4iICthh/mA+p3ZXxCvsOBwi
 1uxjqN6HD241pymquPv3ftx4zIygDxZapbDFYr4qq7QlorVUWSU25AoD5dq32HjWlRUe
 Q1w4FwsVUFvShv0eXEUWR7ySNq0wpP7IfHBmF1a7tA0/AENFXy2L0yYLNyu65QRm70y4
 zf5PUaCP4DMvQYzSXv+kFl4+ftAETrBL2lHGRUFs4df2Jbemc7hsCfVoQONvODftYP/N
 BGMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=F4audHmY
Subject: [Buildroot] [PATCH 22/29 v2] package/boost: explain how to maintain
 the list of libraries
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

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/boost/boost.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index aa7b93a375..6847ea5cfe 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -12,6 +12,14 @@ BOOST_LICENSE = BSL-1.0
 BOOST_LICENSE_FILES = LICENSE_1_0.txt
 BOOST_CPE_ID_VENDOR = boost
 
+# This is the list of libraries that Boost can build. They may not all be
+# exposed in the Buildroot menuconfig; only add them as the need arises.
+# How to maintain that list (the last step takes a bit of time):
+#  - make boost-direclean
+#  - make boost-configure
+# Buildrrot will then report any disrepancy: either libraries in this list
+# but no longer present in the newer Boost version, or libraries missing in
+# this list but present in that nwewer version.
 BOOST_ALL_LIBS = \
 	atomic \
 	chrono \
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
