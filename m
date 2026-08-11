Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5A2C5AC67
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 12:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B9D1605FD;
	Tue, 11 Aug 2026 12:05:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zE8SpwJsZ134; Tue, 11 Aug 2026 12:05:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51B8B6065A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786449937;
	bh=/UrbQFg5n0/RkXqHjOAwGNW/a8v+8tcyeU4wdSsnnhg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WQexCncdx6vTvGaq36wxTiPk/wk7NiKKfLo7c6WprGq2aBDwnE58OGlhF5Cf5iiMt
	 KJbwPCvQfdpVFSDQP7mtnWnEa/qKPAlU+KGnPcpQun/l+dlnhf7vNsIupAqEFVorbB
	 8e+2eLLc1iyetJDGBVoQvfE7fiPjrUog5uI6LLYvJhG35BS+14HXwaMXZG5qKjGacA
	 2PT+m8zFTGN3cbJOJCjLMfdl7Mc/C8Oc1NWiCaJwN84wh/ub6slYZ3a6nb8lQ8biE7
	 K7ptc9unflJkNVyX/nPmApRT4vv0Bp1NAnbf2rCTMatOYsKHiZx56IZaPJOH3EAUT0
	 m3tpjoucFZrAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51B8B6065A;
	Tue, 11 Aug 2026 12:05:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A9224345
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 12:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F34180CAB
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 12:05:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B1X_PLAr50l1 for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 12:05:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A921A80CA2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A921A80CA2
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A921A80CA2
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 12:05:33 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-496bb7cdf51so41798715e9.2
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 05:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786449931; x=1787054731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=6rfAE2Asp9zIIqVAnGZWZMlpK87ylv34KY/o/82a/Fs=;
 b=oWprKCtK594ib97hRsCipphFQDLdq2yKJ77wmTXE4cGKrYbjfClOCNGdzxlm04Q9Ta
 LTb8QL721CtC4R2qF8Qiuw/hoIaUD5QLBiTi4fpdjTLDjJ5CNOBc72gvWEJkcMVLYkOE
 cgvGbb5ItRmzoOVjo5COnlEjwdCqHalTzFVKXh5W74gMu+u1ISLGPTMANvPFlIxxf9sa
 CAr62yf1+ok+5gbyOqYqyqInaBu9os1DdMBBojFXMFZIdcJkq5B0R0B038f/KzAkklQ9
 lFsze/ICmklzSOQ3Jt9DLDhv1hCq8X41Ncu+6Z/Jb0P36xQWMwAhSsttKvathJbIpneL
 o5vQ==
X-Gm-Message-State: AOJu0Yx66466uwp61LGYrbjbUWaSkvAQxl+8LANoAg3r18SO5bv8Ek/V
 ip8lECKo0VCBjtIEfrg988Fx6wFhJ4FQniI9is5OhjaBRhiPczASkoYqovM5iTOI27bqaHkjsGd
 smVgC
X-Gm-Gg: AR+sD11Kd2eGtyg7xZmReUWdU5DqugPEnHfcqRGsTjKC2r1XPUL/C/cX5rckl726C8b
 ukfkDzDhV2+iYwp+y4fGSK5snTX3OWNKlniAvjqXNjKGwD0xjUomH69Tmwh0SB+FjZKRodOqNa9
 qNPjsBfztaevSQte9CctExl3wTZ3NuufgFas8fn6II6rhFWBdHiRpWiL9PVvI6I3ogGrCF7xOO/
 TbmeWU7uS6++MFBfCM3g1dyPW+BK8wsjYzyjKwS9mkBjyMb6xRhdSLJtjEKgpesxPdoqpSL5q9l
 ttD0mHeAW+5fgww1UIq1D7Vj3ZozdGxQUYtDp7fuTcEsZHbgT/juZrTFFYnPmVRpRpSfyxUJlsW
 rRA2WYsV5GdnmcbhP5rje4coxM3g/DW0tTapncMQHS8IcX39x+ScMC5RKb6Yb0yhkd+frdUQsjZ
 7htHGilFuFRoEyGW2FaT7C9eDQwxB3742g+DHShbRxVEiifuXs7UHsxkc=
X-Received: by 2002:a05:600c:674a:b0:495:5045:39e6 with SMTP id
 5b1f17b1804b1-499784712bamr53381255e9.17.1786449931585; 
 Tue, 11 Aug 2026 05:05:31 -0700 (PDT)
Received: from arch ([213.211.149.70]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499740c5e0esm57011745e9.6.2026.08.11.05.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2026 05:05:31 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>,
	Edgar Bonet <bonet@grenoble.cnrs.fr>
Date: Tue, 11 Aug 2026 14:05:30 +0200
Message-ID: <20260811120530.130487-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811120530.130487-1-thomas.perale@mind.be>
References: <20260811120530.130487-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786449931; x=1787054731; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6rfAE2Asp9zIIqVAnGZWZMlpK87ylv34KY/o/82a/Fs=;
 b=ZsrN55K+gRwou/jj67UgRtcqgAlmshHZyU/WiyxTS2+ROzIFY0+BC2ZEneyLOAmeSC
 lNqSrSTmPWJIs7pAe6J+XISFL/oTNeU215hqQwN4ORUPvo+g+OH1HscB2QCwNSA995lU
 0P033LJazDgqd9q8sm27ddRSx8v9XwsbSngVWUfmCi+g4GZyFC3XFm8a7yFEWidqF8eb
 94MK+kf9Vv9XCeeq+BP3lEzpAXFXfRtgd7mvTPXpTwrQPcLIhxNBChBYfit0ylellmAH
 5SxMLIaE75n/phgw+rqwat/Xn/nYG6mfHSVgwdHHUd5S+itQvAv2Ru0qcwp1c3uhIKuB
 DCMw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZsrN55K+
Subject: [Buildroot] [PATCH v3] website/lts: update release wording
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

Update the release wording to align with the documentation.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 docs/website/lts.html | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/docs/website/lts.html b/docs/website/lts.html
index 3bfd2a4374..189011f016 100644
--- a/docs/website/lts.html
+++ b/docs/website/lts.html
@@ -80,7 +80,7 @@
             </h2>
             <p class="br-lts-item-text">
             Vulnerability fixes applied to the <code>master</code> branch will be
-            prioritized for backporting to the LTS & stable branches.
+            prioritized for backporting to stable branches.
             </p>
         </div>
     </div>
@@ -98,9 +98,9 @@
     <br/>
     To address these requirements, the release model evolves into the following.
     <br/>
-    The LTS releases are now extended for a 3-year period. An LTS release
-    is started every 2 years.
-    In between, stable releases are made every 3 months.
+    Starting with 2025.02, the first release of every odd-numbered year is a long-term
+    support (LTS) release supported for three years.
+    In between, non-LTS releases are made every 3 months.
     </p>
 
     <br/>
@@ -316,7 +316,7 @@
                 To make sure the packages of interest to the sponsors don't
                 include regressions between releases.
                 Sponsors may submit a list of packages to be tested
-                before an LTS & stable release.
+                before a bugfix release.
             </p>
         </div>
     </div>
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
