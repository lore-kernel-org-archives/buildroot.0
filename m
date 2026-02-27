Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615621048921
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 23:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B767B83CCE;
	Fri, 27 Feb 2026 23:14:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AXVxpwuXoTE7; Fri, 27 Feb 2026 23:14:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94BF983CC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772234073;
	bh=bqU2ldKvCGaihrmIKdjdHzQnRo/oNaIP+hKIbbHy1zA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mLDrHMtjTT6ykyvYm/nLMosXPL4JN3RR4zLTgnOrWdSKC8+9SUQuwLLmFZGiALEmF
	 ISB+NrZpTBnyN0s6OPAz8Oa6NYGlYp1hDYuwJbGRrDxN900I3MhMzJXSt5CJw7CupY
	 e2iZMZhlBDJrV+czxNw6z/Ed6Rc7ZJJ/0QyvbRTnYRANkHa1mAw8P+sAqBaqq5sedH
	 Ps90O9vgdcfPnxqhaGrTqNv//aqob0vpk1Q3FTrq3hf9rlQl4xejmgZp0TbTx7nIUR
	 KNlY8Xgll3m781B6D/f9hx8dUwQaaco/4xdlrU2Jj+Au+bQLk0/vrMb7o+hEvxQdMu
	 15LeCIYPgFccg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94BF983CC0;
	Fri, 27 Feb 2026 23:14:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EBEDC131
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 23:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDCF8418CF
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 23:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nju26U-z6eJ6 for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 23:14:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com;
 envelope-from=joseph@anodize.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4CCB1418A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CCB1418A6
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4CCB1418A6
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 23:14:30 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2aadc18f230so17266635ad.3
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 15:14:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772234069; x=1772838869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Z12pHZjfGxUrHVmA7Jl+DQmUBTpe42lfPvwshcHH1U8=;
 b=MLR4eKaoyvUIeNo2hvKC3LA+RG/PzdCigQqlKipGffSi+Dg63hxtk/OajcdUd+GtJ1
 wAM3e0acYQll/0LFNwx9ce04Jq+sssGv6Ud5TP5ZLeaxR90AIVER81rcMeN1sZTv3Blq
 gZ5YZwRfZnpTC1QDDmdCNTo8zTh4CfumuYk4shlsXfp/Tv8459ZQgvXtZwOAbZkk4Tu3
 EwzlR2JLKlZ2Dekomql69EE4TrObnkCaYd/9ATQSsKNS50ixE2MMAO/zup1TTupl7Jb2
 t2d3F0JQl+gQya/UVY5b+KBqQaezyZlmlFyzB4JzL9wyU7cKnEz90fAdJ+wSimGHD2QO
 PKaw==
X-Gm-Message-State: AOJu0YyPPnePcCO+jWRYyE2a5cJDgzoLdJyimTl7kTTHrLO+uVmK4pMZ
 ooeBONPezyo7zpjgvUkB+B1oE7aJ6kp5Pw57ld49oD6DRdENCjtpGJm8Z6gPBpSYIccD+CVEdaV
 VQQKT
X-Gm-Gg: ATEYQzyPo/8Ns4bDpCbKadX/PDonCxuDpvoTEeU4mr2uOCc6UxSrQmUs/VvZMp/xPTH
 ZAysSiDIC73rcRcviGJ/J6k0cRSOy12LUgR9whoM92+GwPT85ucxFIANWBm1V5iZySxN5eZkgAe
 igcI+c1c6hkvl9WKcTQ2/fMbGeLGvzNgot0+BOmb7C9vVoGkP38lhizxW+0EjX6HIyE8sdM9l0B
 BpWLoo//t/DkqAsgjsyoNP6ZaGEViqtUbqmXd7/aw5FC/sMOvjwzxtmVGeyWWNW8E7t2g2BccHO
 T67b/phrZym/baJ0Po7ObAj4ifVHyWLND0xc9g/jjoREHOo0pM5KP9HuNVey/NkqXkqEjqXNzRA
 emNehyAk2JQMKJxwebtPmlozq/NUPLi29YSVRD0niGtytvveCTc8IB5o3pl9aQZxCe/NlTkcoGS
 CDOXGq31VOmOyEEBBCUy5ulZAN4SoK2jAl2iXdHwNCPxzlOQ==
X-Received: by 2002:a17:903:2b04:b0:2a9:62ce:1c12 with SMTP id
 d9443c01a7336-2ae2e4da12bmr51467115ad.53.1772234068957; 
 Fri, 27 Feb 2026 15:14:28 -0800 (PST)
Received: from wash.clouded-fir.ts.net ([50.120.91.49])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb69fff3sm72007995ad.48.2026.02.27.15.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 15:14:27 -0800 (PST)
From: Joseph Kogut <joseph@anodize.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>, Adam Ford <aford173@gmail.com>,
 Steve deRosier <derosier@cal-sierra.com>
Date: Fri, 27 Feb 2026 15:14:08 -0800
Message-ID: <20260227-mesa3d-amdgpu-virtio-v1-4-3e6d10d4eaef@anodize.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227-mesa3d-amdgpu-virtio-v1-0-3e6d10d4eaef@anodize.com>
References: <20260227-mesa3d-amdgpu-virtio-v1-0-3e6d10d4eaef@anodize.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anodize.com; s=google; t=1772234069; x=1772838869; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z12pHZjfGxUrHVmA7Jl+DQmUBTpe42lfPvwshcHH1U8=;
 b=RfoZonSjTKSo7HYth/gt8iuh+j2BGrbB2Qg/xMK8/4jroyHYmBARjpykDTw9EJbn3B
 kStZ/FDDW3tseCm7UnWlAoA2zxIRmB7rthHxyzNGzAohIEDluatVkFO9QEBI4eIyZLrs
 wGuCBIju1CgNhnAMdEynqxxtyVrtti7QevNRX9fXt1aNGZl4OTeHcHGTDNKWKELJTtg2
 6YP/rc2q0vuSJbzbVcF2bkixS41lrsne/AyvvW3JR4A99nvq7NCzoYArT7Gk5mvVYvv3
 OPd/940Tk+fBT0Ac8M1lUdtlS/0Wqah+dcc85m70U/OFRFUedLnv7NQvI8eLWnNxZdjX
 Rehw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=anodize.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=anodize.com header.i=@anodize.com
 header.a=rsa-sha256 header.s=google header.b=RfoZonSj
Subject: [Buildroot] [PATCH 4/4] DEVELOPERS: add package/mesa3d for Joseph
 Kogut
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

From: Joseph Kogut <joseph.kogut@gmail.com>

Add mesa3d package to the list of files I maintain.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 88a684d9ac..972ae87633 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1756,6 +1756,7 @@ F:	package/llama-cpp/
 F:	package/llvm-project/clang/
 F:	package/llvm-project/lld/
 F:	package/llvm-project/llvm/
+F:	package/mesa3d/
 F:	package/python-cython/
 F:	package/python-pycups/
 F:	package/python-raven/

-- 
2.53.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
