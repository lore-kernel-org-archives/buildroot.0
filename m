Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D709D2ECF7
	for <buildroot@archiver.kernel.org>; Tue, 20 Jan 2026 08:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 007474EE14;
	Tue, 20 Jan 2026 08:24:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c8leaseTyXDB; Tue, 20 Jan 2026 08:24:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19BC14EE17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768897453;
	bh=uWCTk1Cnr4mMxg+2opb17AZxMGJaZr2Lr5MgW+VOwfk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Gc+DCIunIYSEHKYtmkELu5tt2iq4+ywF8FxacXP156eKc9rl2LStOAcwVrY+X4lCV
	 ai3xW/5D11ElBgtqNVlsdkld8mQy6d2ioXLkv56Q4wWg4jE+Ep0o07wlEh2bot1vQ7
	 Z/J056zA9pP08NUmNfSY90G72fEB9J2rcEIOxQcmI6Wn6cVvbcUydd2U3fg12KShQ/
	 QvxlPsGMCwxHR+k9tan7XcsbO7kThWEtG4auBvWmsV9JKJ/WbpyLhYd8Pv6rSzh8PC
	 Ds7LKf3noTb6sW3o0S18Mk67v1RMW1wMf9jJfHU9dO8Q00/rTO9WwwkNFgTCNipp9R
	 G0Gcyd2g03/Fg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19BC14EE17;
	Tue, 20 Jan 2026 08:24:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A2EB42A8
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 08:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86F4441D61
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 08:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0UcLRtmA-nvk for <buildroot@buildroot.org>;
 Tue, 20 Jan 2026 08:24:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 70E714EE14
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70E714EE14
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70E714EE14
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 08:24:10 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b876c0d5318so687969466b.0
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 00:24:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768897448; x=1769502248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4FzzbophiJ3va8Kxktsau8saEpkvCe/ton5Kts2rboY=;
 b=Oct4qhkczoqSVDX7ZJ4dm4egUNGs45MrMYTfkiz9B5r0AsrGOslkawCSlx3OLkWcW7
 u77PLWJQ+nAVYJSAxWTqYPqF3yZYbCmLZDWIPAzhCkTHPrO2nyQWV4XqjO7+GNNX3Ac4
 MqjZ6FALiDOeiZa9MQHoKmkmokBADmaBtGI4SsobWLI9sXMYs2E9xIfaf2GI/hMXDIsj
 mLiyTImKydhotLP/5QxSRTZl9EBVAHRSayBzvtS/QMWV04Cy7tX+oHBVW5eo1yIh4hFY
 R7/X3E+E8ITzW8+8RA8+vuDdcLB64r0cZP9KpL/d4HGrGr1Gy4QBiL0oOuqbAoEEU53p
 s8YA==
X-Gm-Message-State: AOJu0YzitsKRWPcW0NCPGWlvcvA5fdL9B+iz2eDHL4f4Ufu7hM0hQvgg
 2K+5vq/MSn9oyqICsQav8dJfPLNB3RlvwKcF5Ih8vag0Smc3CgG9NeNstj2OXbG6eKk+ndZoOwp
 5IFv3
X-Gm-Gg: AZuq6aJA1UdEuUZlMRe1szR8wiQNrgghtRw4Xfs3tyDk6rbyniIFtXEEOMulqGrFf7b
 R+D8I5pofpMoWuccwndtBydm6zbZK8trgfcT5TWx/KyoAuBnRAYErJFJNuHv6fj94kogkUe7oLs
 f8SEQ6fd+R58gvAmznK0jjjICJ/SvTEm0BucoIqUa4X6SeCSbm0d3AKZTpBlHnqc35o2YakS0rg
 dnl++dDM4BA2drqHkaOwC9wzJGvzDZVnGod7caUGQ3xjSdYjXwC+aIfoOLgbEW0XuJQXTBjYiGH
 ezf8uK5g9IgZR+g0k9P6/10RPBZyClxLAxy8cGFj5ULXE0eD3w3EJihuEU3sRTqZV9xUcxrdp48
 QPup86TOplPconDElNORpHvJTsrMkM4Gzq4o4NUUSu7++43zvwKw2oS76ITSkKFGFJgPJyqjWe9
 6lal1/9bYmxRe2XdBc6T2QwwARO/0reUZ/DJs=
X-Received: by 2002:a17:906:c14c:b0:b83:24a1:5e17 with SMTP id
 a640c23a62f3a-b8800361087mr95515066b.44.1768897448073; 
 Tue, 20 Jan 2026 00:24:08 -0800 (PST)
Received: from arch (94.105.116.200.dyn.edpnet.net. [94.105.116.200])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b87959fbefdsm1307568566b.55.2026.01.20.00.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 00:24:07 -0800 (PST)
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Julien Viard de Galbert <julien@vdg.name>, Nimai Mahajan <nimaim@gmail.com>
Date: Tue, 20 Jan 2026 09:24:02 +0100
Message-ID: <20260120082405.46683-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120082405.46683-1-thomas.perale@mind.be>
References: <20260120082405.46683-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1768897448; x=1769502248; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4FzzbophiJ3va8Kxktsau8saEpkvCe/ton5Kts2rboY=;
 b=eQz35FEW7Yv4qkjl9FLyNKrASAd7l9N4w5HGl5mWDMEOex0qEM6DDxkIgs/KU7BgwC
 eJTZ7ykRKygMjmMRJNs57ixuo/WY3shCCLf8HcAKfuleGM/g6VRmfWiv4RJBR1ubnckS
 3EPFO5ObLYgoycE0VIeKRTbR8QOZTC/zUOD+lNciIA8wpA2GM1jsjREFk4N1H4YQlS2t
 /VARfxI4Fn97uxeETFNbPeSKzsCUM09T2ejKHdTUqQTW36eSATgodmo60DhPHjCL7LKg
 Gj27WpO0PM8B8Z1rpXtdFXeFNBpHOgOVJV8FPQRPjZmF8mW4vKSQ7cXcDJW42WekdMbB
 mK+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eQz35FEW
Subject: [Buildroot] [PATCH 3/6] package/mp4v2: add CPE
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CPE `mp4v2:mp4v2` is valid for the package mp4v2. See the latest
CVE: CVE-2023-33719 that reference the upstream repository.

[1] https://nvd.nist.gov//vuln/detail/CVE-2023-33719

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mp4v2/mp4v2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mp4v2/mp4v2.mk b/package/mp4v2/mp4v2.mk
index ae777cdc75..8d8e184b99 100644
--- a/package/mp4v2/mp4v2.mk
+++ b/package/mp4v2/mp4v2.mk
@@ -12,6 +12,8 @@ MP4V2_INSTALL_STAGING = YES
 MP4V2_LICENSE = MPL-1.1
 MP4V2_LICENSE_FILES = COPYING
 
+MP4V2_CPE_ID_VENDOR = mp4v2
+
 # help2man expects to be able to run utilities on the build machine to
 # grab --help output which doesn't work when cross compiling, so
 # disable it
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
