Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910A7C8303F
	for <buildroot@archiver.kernel.org>; Wed,  2 Jul 2025 10:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DA8641887;
	Wed,  2 Jul 2025 10:52:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jAr-05khqS20; Wed,  2 Jul 2025 10:52:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DFCA4188F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DFCA4188F;
	Wed,  2 Jul 2025 10:52:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 866DD179
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 10:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CC3241871
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 10:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uXMueT2UHxBj for <buildroot@buildroot.org>;
 Wed,  2 Jul 2025 10:52:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9FF7441887
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FF7441887
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FF7441887
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 10:52:33 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-addda47ebeaso1392426966b.1
 for <buildroot@buildroot.org>; Wed, 02 Jul 2025 03:52:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751453551; x=1752058351;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vl/a+rJ3Yu9mzggknglgwU4IFK+WJHw1DPOPF0zlIbY=;
 b=KsvVKMnlvTvOeFMWBVuCbTtY0100b/i3i+i+T7hcTSzmOIU9SwaFIW4JNtMxi7Bb7M
 k12RRl1l7P4Wvv1xQPb8p9EstQmSh5o+amHYFfmQQg6Vm5HD+4QIWOnNkHgtk3BHE7+Y
 Zm3Ptq6HePPmOl2+DXny6L03qWitYMM5XxpIykJowPVYWSQ/dszK9HNARnb0NuRX2Gv6
 JYDB3HhE1NF0YiJjOt3vDS1ByYmazV4zRGc/5ayNu+U9lK57nMO1egGsUney7ewOe0YO
 Kfo+XIqZsE5tbbMxhhlVt/JmLbKaSFs6uiHiDL/yGdDsWQiDWeboXseUYf1wnMswceNm
 ti1Q==
X-Gm-Message-State: AOJu0YwXpmeKHyeM1IHzoyppM+7vVZ7ePw1KaGLPEX63/UX/TDEz3XdI
 G6/EW/B7UWu7JnWMBxNdHlrQdr6MXxbhOrmc8OyO0p4BgZWB3/BzUTvbqHSvQZM=
X-Gm-Gg: ASbGncvJhMzhggNcThFGX+mNewBL0HS9JOSumTyReHg225/WgjFMl8yptRRbtM0zPFi
 de4g3TRhp6plJXCBTPh9H+IQj3RpNcEZmdNcD9MADegl7CmOsqulLn9JRhUcIvD0DjIbZTq1Tx2
 KxWYM/8RriHnXYNmXZ6sQYQgnPEA9wWOsC1ZykNmAHqaN///h/a/7fMbxAdoaAOazJjXFF3GmDo
 qTOVuB2B/pV12VrMD8hzSubqTqtS9g1Ccusq5y8pnQQ3AIyKY5CLjf/Zk9XVrelj9tsq9iX0dC8
 WsolzOwQbRVCJ5QTeZy4odDEMqCoMl0D7q+pyHj9l5MhaX8ByPlruc4/boTe/qWpOfF1dxr4EUs
 EKqDt6amEe8Q=
X-Google-Smtp-Source: AGHT+IEolMSe5EcSrbiPmPNIEVPW29JFYNkTs/4v09QfKd5bcNRXsEn5jmOuJ1kW9m9MMEFu4xrZKg==
X-Received: by 2002:a17:907:7249:b0:ad5:8594:652e with SMTP id
 a640c23a62f3a-ae3c2d13b9fmr218409166b.35.1751453550998; 
 Wed, 02 Jul 2025 03:52:30 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3a39189cbsm431182766b.89.2025.07.02.03.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 03:52:29 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: elmehdi.younes@smile.fr
Date: Wed,  2 Jul 2025 12:52:23 +0200
Message-ID: <20250702105225.42296-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250527171400.78560-1-shirokovalexs@gmail.com>
References: <20250527171400.78560-1-shirokovalexs@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751453551; x=1752058351; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vl/a+rJ3Yu9mzggknglgwU4IFK+WJHw1DPOPF0zlIbY=;
 b=EE6i79i8tu5o0+vZRgFL4L3lNg4jYyNCkTFd4/6p0Cej0B2VOAC60DRDl2f85HTw7z
 AHxau9DEKNgVbJnpWdufEKRVvN/3otbtuiZk9KJUB4c6szHuaFCCfu7APBAQFUcdNVjw
 xE9A9/k7/Zl0KJjvyTPTN99hAaXL3Equk1CHoHXsLDtpDVOb/w2yji0bnKsN1uCgS0rg
 zZIx/k54bfhte3fJXi/VYQBjnG4YC/kgHnVMGmd59a/mZXsXsSoErR0f0k/yhKMhzPea
 gVSv2MBRdb7L7jR8X1icwqXQPeUGmoIFgbBHHrbMgIOapl505V4Rs4I3XcoeOTrHZqkU
 x1jQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EE6i79i8
Subject: [Buildroot] [next,v5,1/3] package/uutils-coreutils: new package
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SXQgc2VlbXMgd2UgY2FuIHByb3ZpZGUgYSBicmllZiBzdW1tYXJ5IGF0IHRoaXMgcG9pbnQ6Cgox
LiBSZWFkaW5nIHRoZSBsaXN0IG9mIHBhY2thZ2VzIGZyb20gYGZlYXRfY29tbW9uX2NvcmVgIGlz
IGN1cnJlbnRseSB0aGUgYmVzdAphdmFpbGFibGUgYXBwcm9hY2guIEl0IHJlc3VsdHMgaW4gbWlu
aW1hbCBhbmQgc2ltcGxlIGNvZGUgd2hpbGUgc3RpbGwgcHJvdmlkaW5nCnN1ZmZpY2llbnQgZnVu
Y3Rpb25hbGl0eS4gSSB0ZXN0ZWQgaXQgb24gbXkgc2lkZSwgYW5kIGl0IHdvcmtzIHZlcnkgd2Vs
bC4KVGhlcmVmb3JlLCBJ4oCZZCBsaWtlIHRvIHByb2NlZWQgd2l0aCB0aGlzIGFwcHJvYWNoIGFu
ZCBjYW4gcHJvdmlkZSB2NiBwYXRjaGVzCndpdGggdGhlIGNoYW5nZS4KCjIuIEnigJlsbCBjb250
YWN0IHRoZSB1dXRpbHMtY29yZXV0aWxzIGRldmVsb3BlcnMgdG8gdW5kZXJzdGFuZCB0aGVpciBp
ZGVhcwpyZWdhcmRpbmcgdGhlIGNvbmZpZ3VyYXRpb24gb2YgdGhlIGFwcCBsaXN0LiBBdCB0aGUg
c2FtZSB0aW1lLCBJ4oCZbGwgdHJ5IHNldmVyYWwKYXBwcm9hY2hlcyBvbiB0aGUgQnVpbGRyb290
IHNpZGUg4oCUIGp1c3QgdG8gZXhwZXJpbWVudCwgZ2FpbiBleHBlcmllbmNlLCBhbmQKY29tcGFy
ZSBtZXRob2RzLiBJIGV4cGVjdCB0aGlzIHdpbGwgdGFrZSBzb21lIHRpbWUuIEnigJlkIGxpa2Ug
dG8gZGVsaXZlciB0aGUKY29uZmlndXJhdGlvbi1yZWxhdGVkIGNoYW5nZXMgbGF0ZXIsIHNlcGFy
YXRlbHkgZnJvbSB0aGUgIm5ldyBwYWNrYWdlIiBjaGFuZ2VzCihpZiB0aGF0IG1hdGNoZXMgQnVp
bGRyb2904oCZcyBhcHByb2FjaCBhbmQgdmlzaW9uKS4KCldoYXQgZG8geW91IHRoaW5rPwoKVGhh
bmsgeW91CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
