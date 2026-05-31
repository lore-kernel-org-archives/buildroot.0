Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA9CCD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 20:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04C1B40F82;
	Sun, 31 May 2026 20:24:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H987tXaZmIWb; Sun, 31 May 2026 20:24:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A67840F89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780259088;
	bh=48Ioy7ti9+e7F4hljZVmsvo4EERrguuo0gKfP6FsSQ0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=KPjKBgYQR2CEcs8dd3VxGYozZw8OJYKqAXYmZ0tAGAdjXxBBWG1zngs6/EvjmlASv
	 5no5lw1DQ/qp5pFcqrtNqTlEta/uuG8Vunua4GPsvi+KiyufEh16HMsfvaFpXRvfu4
	 xYA7+1z0ZB44hzL1y+dimEMec1e1oXVlHGNmPm3WFlhH+Dujdl9FW+OCWbMsjoH/lM
	 D12Lphof4DPUELMO8ThAWybsdjek3y2kSddHG2JdSRamN4j+mqr3f1bXKJUmfgKRZO
	 2swS3U/eK9Kl9RGp4ixHa2FKXZDl0G/P3eE6OOMxoEQYcoue1jOzUZJDjIobo3I41d
	 v5lbYqGUnx6WA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A67840F89;
	Sun, 31 May 2026 20:24:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 04BA02AA
 for <buildroot@buildroot.org>; Sun, 31 May 2026 20:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAB898104C
 for <buildroot@buildroot.org>; Sun, 31 May 2026 20:24:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B9oobBiNxDUp for <buildroot@buildroot.org>;
 Sun, 31 May 2026 20:24:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CCC4E80F58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCC4E80F58
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCC4E80F58
 for <buildroot@buildroot.org>; Sun, 31 May 2026 20:24:45 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4906869f0cbso83765785e9.1
 for <buildroot@buildroot.org>; Sun, 31 May 2026 13:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780259083; x=1780863883;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dLz7Xg8eFn+w1lysingS23GG+l82Dz2ESwPU9HGI9/Y=;
 b=DlBSgUyjIe9dxP/0tS9Ho/3d1APOSNOpIdARO6fsFiHdo6lNKOrAPmPB6viXVpSQPk
 5ZJZJoV8ZNef/+SZm2i51+dvMAcpk9gvU7QOjdm9r8GcSoTPPrkcodULflrMfUBuSI27
 h9b6aUWrgMHufJfC3mlgAL6qh77dRnQrk9p9aiytqVeVQRxCwtoInxSQYiKSu2DqpgF7
 AbRfssQJKjYIa0Mhwlc4KFg5Hf6xPLnVG6RF5oLRYWt1Hie8aj50OR3LGakmqwqPGLG0
 3fIAKY3/FghKItVqgpxHPeDzoxoaxHccLUPYvsaiXsIkW8gCdJNWdpWZFr1IPkbktWNx
 sbLA==
X-Gm-Message-State: AOJu0Yw1x0LMyKPxjvcfGnBiWGvBG6AYLuKsneO2NTvD9RXKnltiL1ZF
 O21sIUTOo3e6wtp11M1NdUDSy99YuWpYiVe9MWLB6JFac7/tSNY3PsXaR4HzqpdypL+ijWdNMFU
 a5wGc
X-Gm-Gg: Acq92OFJmS6EORRoIJ9T/AeuwbRRu4AyAN2QU48KfpeUHtTFwD7hOx6EvsRtFbHeEjw
 MHhh6nNRRhQdC6YP2SyhWaMs6ubERw+J+Wyn25jJ+EyqoVT/UHRe6XAgfAC7HzMuNrpx0UqMegL
 igLXH4Q4JO5vtW+mXfT+mvHC/lqay3VAEVUSiB8jFiOZwZR5mtG5ePNrmapTE1KHBaiw82RQfIa
 4FovQX9iCCxEocjBmrrsc6hrHcvtk5+zUTQRDCfPEfLEzb57O0POkDEJRgSOIdtTa4/C1KMizIY
 /0jjBZaBVcJCR9pK0AUbo1E9Uy1AOwVY9sTWvfCbuOaKnb4GCu/ReEzne/BtWV0ASg6nUeGqdpE
 6zhJ1s77R4aPr67ujUhmcKPlimqU0NTnVOsW7hldQPyjEPB41+LS3xxBIsUgaBZq1/UfO0EOKTP
 ERKDQHdThksmtMoMzcXhD7aWpYwCj21izuZ8Og9xQCVAC5AT+ZWD38RuYSHrfITTM7uI8uOkD3T
 fmaFg+fKwLxbZxl0Kn8eVdAvyD6C3O8sBhN
X-Received: by 2002:a05:600c:450b:b0:490:6e11:c303 with SMTP id
 5b1f17b1804b1-490a29213bamr161194195e9.13.1780259083350; 
 Sun, 31 May 2026 13:24:43 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909d6a0e42sm195031595e9.8.2026.05.31.13.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2026 13:24:42 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sun, 31 May 2026 22:24:39 +0200
Message-ID: <20260531202439.1471287-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1780259083; x=1780863883; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dLz7Xg8eFn+w1lysingS23GG+l82Dz2ESwPU9HGI9/Y=;
 b=fE2dHqj5mVTk+QJnlfO1EaPsTg9FWTqdZrY7PqMWrL8AX3Nx1WDVbFJO3Vu8B4Sa2h
 xpHxiARQEJEqiVGn8UMZS8Ic9FphIQ8nioy9okEVxSXbeKTPcNvovuh1EX8jCg24un42
 0GJo0n9WaV4lzx3WSiBP/Cuy/0YLVkaXx8KWM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=fE2dHqj5
Subject: [Buildroot] [PATCH] package/libmodsecurity: needs host-pkgconf
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The configure script was regenerated for the 3.0.15 release but it now
error out if pkg-config is missing.

Add host-pkgconf in build dependency.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14607335870 (TestNginxModsecurity)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/libmodsecurity/libmodsecurity.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index c06d890979..8920cb012e 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -13,7 +13,7 @@ LIBMODSECURITY_LICENSE_FILES = LICENSE
 LIBMODSECURITY_CPE_ID_VENDOR = trustwave
 LIBMODSECURITY_CPE_ID_PRODUCT = modsecurity
 
-LIBMODSECURITY_DEPENDENCIES = pcre2
+LIBMODSECURITY_DEPENDENCIES = pcre2 host-pkgconf
 LIBMODSECURITY_CONF_OPTS = \
 	--without-pcre \
 	--with-pcre2="$(STAGING_DIR)/usr" \
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
