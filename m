Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1D4C5DF81
	for <buildroot@archiver.kernel.org>; Tue, 18 Aug 2026 20:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCEC981090;
	Tue, 18 Aug 2026 20:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ju3l479LyKAr; Tue, 18 Aug 2026 20:56:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787086612;
	bh=5Za7qhYK6TEtmARA2y5QOO2jjHM260gAwA3KlBrWg9w=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ig8z3Ny26EhZs+N3/PQ6LkFcOFvuOBN9Rlpn1ed10PVpKKRFLexMfsXfdHWxBwfA0
	 Q84i3DVab1O8uFVgPdEKzqsoqqzzfPstVDNWkXaCxiddaLnnykt782MGRCK+H6Ik4T
	 c95JrccHC6xWgQkOzNWi+eVIAON6i8gZyAbYLhhHjLad0kYmuKBJ0aRQPxQvdecrnO
	 hJTwgIEFRBnz7OFSr+MTYXOTNDMxE28C42ImX/YvdUFJTWnvcm5Q1G3601nYHzrTdI
	 yhUYgmHKNQgdtqdSe0hqVtLMbefkY/u/9WXlX9em+jR+WrCt2iR9ZAhmPhyiHz76cy
	 7bMSE2X8XhVVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9903480EB1;
	Tue, 18 Aug 2026 20:56:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D3DC333
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 20:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 638C680EA1
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 20:56:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tFq03OwOTfbz for <buildroot@buildroot.org>;
 Tue, 18 Aug 2026 20:56:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com;
 envelope-from=joseph@anodize.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=anodize.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=anodize.com header.i=@anodize.com
 header.a=rsa-sha256 header.s=google header.b=PHh9Iwf5
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF1D380EB1
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 20:56:49 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2ce98cb8165so1677715ad.1
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 13:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anodize.com; s=google; t=1787086609; x=1787691409; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=p1BxHDDYM8Kx/X1vtWTbUHlbEV8zfzX/THR8Q1KCVUI=;
 b=PHh9Iwf5m3AVGVSGbL41AnONFlL20XoAGY4pVCL2DdoX1sTztyf/03ijBpF201Frsy
 t+jMPUvMhj4T9+lepZenM5ohxUT5Ah+RFkQkYy27gPhdv+Cc5wj1nTQQDxbVcaCAYuFw
 RlbftiT6NVb45CUkFu98cev9xYyuRzJb+WeMRv/QyqhZ1TAMpY3PbSwzo90KpigPqdbq
 zjz2+CXPJzgmXtD7Mq3iGsM0eUtMp8AoO0xnF+DMr6ZHgWjK2RxmXcCD2I/CgWweAKGX
 oLLEa6ezKZ6/3A8e12/4US/einfNYHhMfI7chtGgLqX6GTJlD5ii/cVrPVw8TCZbtT4l
 ncew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787086609; x=1787691409;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=p1BxHDDYM8Kx/X1vtWTbUHlbEV8zfzX/THR8Q1KCVUI=;
 b=c7eRrXvUCY36Z9yietYoe9j8GDWFb0/Lu0QhNdQpa3xq87aVc2krbPcb3WbVjccGXR
 RuhUWPBRDYu7Bc6d5MkNhoOjQcvAbAQ0A1mnVTGRy+1X/IyARPH6euaYKQykPwAbV01Q
 xXwbLZu9F1w8VR/p47VpBQAAa8D2/4Vf0Y15MRfpaiBj4oALoirH/X55uvRL/q/fu6cY
 fWD/keAT97BHXWjZE5qGFqsDU16815ZbYAX/abEtIbmNzvY+4EqicOfmG2Uw4ortUl3Q
 FMqMeOtMwjvAorcb/8HidOB1k/UL/AUcvuaGCmhdIbaGOazrs34Ipk+S4IdZjvKQF43S
 yhMA==
X-Gm-Message-State: AOJu0YwtfQGGWD8xvhCTlkxPqmYfP19tVnwcvVGuA8r9OAA6BCerfOgS
 1TG74+vRrFDSOY0VV9otYJf4c0LOqbAVSslZDJHzI7xPBCAxuEFV/aKG0HPbSakAjAuB/gXCyoy
 +yMIiNRk=
X-Gm-Gg: AR+sD11LJqsrYRG25R8ZmpF7qOHKPskfdSHK3BAy7V/GgG/AAhVp5M01tbUs2WUAh9s
 F3Wn246udn3HtraigORKYgO+3VydXUy/CfkYCtkx0MtuJ6osbHOiUyY7Kq1HDhdi9oia2xZPFvu
 681gxld2gUwZ0vbj1ElmxtRWAmLkai+ADRLSJqNIWmPSsLwOpaaFvRCe5KOLDwZTjnU4coaYKmi
 Z196COYfO28t9iWJTqYSISBb3xYvqyBPJ62NjZkh9WgZ7MiTnhBp/wSQpxyf1pVp8j8b48lr3+b
 U7g6fHfxmO0Hmb5sp0i0Z51Zb21c2pt7iU4wi0CWabIcaLFpaUIkxYtNPIuAAijY/Tv8ml4YiHD
 n21/0u3mdJjXUewiD0bUgcW+3vy+6PuUybqOFjwMXRZ8Yt60/n1baY2ijgJfTbxdSQh78kJoJ6L
 nOGbyLk7EjXPuwF03iBlCHbXh3TzYY1U5cl+mJIYUS08ilFhtYhtDcGd3G1m8=
X-Received: by 2002:a17:903:1b68:b0:2cc:89ce:2f07 with SMTP id
 d9443c01a7336-2d5fc86cdbcmr1349775ad.1.1787086608683; 
 Tue, 18 Aug 2026 13:56:48 -0700 (PDT)
Received: from wash-4.local ([50.47.124.161]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d5bb51e0e5sm21159135ad.32.2026.08.18.13.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2026 13:56:48 -0700 (PDT)
From: Joseph Kogut <joseph@anodize.com>
Date: Tue, 18 Aug 2026 13:55:34 -0700
MIME-Version: 1.0
Message-Id: <20260818-passt-20260728-v1-2-aa8bc1ce2c5a@anodize.com>
References: <20260818-passt-20260728-v1-0-aa8bc1ce2c5a@anodize.com>
In-Reply-To: <20260818-passt-20260728-v1-0-aa8bc1ce2c5a@anodize.com>
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph@anodize.com>, joseph.kogut@gmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787086588; l=1238;
 i=joseph@anodize.com; s=20251022; h=from:subject:message-id;
 bh=LK2CBWpUbOol9dm4qIGqiuXCOk9ngv5vVyitAR/VLSA=;
 b=+QYQg6TiT108DMQ8uhTtXytsZTlejm4JfBa4gYN//6wluyH1oLCgRDPlLe3CujIZnedYTGS3l
 5HxPKWt9mIoCkZyZgBcRaPYVoFHzaXxyDlK2uiVZK9wiCicxrFzpPop
X-Developer-Key: i=joseph@anodize.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
Subject: [Buildroot] [PATCH 2/2] package/passt: bump to version
 2026_07_28.f8df3f1
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

Signed-off-by: Joseph Kogut <joseph@anodize.com>
---
 package/passt/passt.hash | 2 +-
 package/passt/passt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/passt/passt.hash b/package/passt/passt.hash
index af55658594..296e2724c4 100644
--- a/package/passt/passt.hash
+++ b/package/passt/passt.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  ac2562e4b589c518b6e30101daaa430691da2605ccc2988d0b704079c2aea4f3  passt-2025_06_11.0293c6f-git4.tar.gz
+sha256  2c9e0f3cdb33585edc28b8171d23e0631d718ace8acbad5c58bd415e644008af  passt-2026_07_28.f8df3f1-git4.tar.gz
 sha256  32dfe03d9985f5feb581da26a2fe6c84530cccb6b53ede0d8dab075cd048ac5b  LICENSES/BSD-3-Clause.txt
 sha256  aaf135472f81c5b4a0dca9367e5bb5e9750032b5bebe5442b36e4c0a47430df3  LICENSES/GPL-2.0-or-later.txt
diff --git a/package/passt/passt.mk b/package/passt/passt.mk
index 8f9ab937b1..e34e7e505e 100644
--- a/package/passt/passt.mk
+++ b/package/passt/passt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PASST_VERSION = 2025_06_11.0293c6f
+PASST_VERSION = 2026_07_28.f8df3f1
 PASST_SITE = https://passt.top/passt
 PASST_SITE_METHOD = git
 

-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
