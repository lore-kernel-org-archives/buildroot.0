Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCB9D2ECF7
	for <buildroot@archiver.kernel.org>; Tue, 20 Jan 2026 08:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E34E24EE20;
	Tue, 20 Jan 2026 08:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6FqrfX0R22Vl; Tue, 20 Jan 2026 08:24:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14A994EE3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768897461;
	bh=7asQrdEYeBFkX/LKu9zg95YBLjM0viDRjW36mXNatDI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JZPkS/PcyIrT0lzSuAdzl7Brym0o1a0gDvXq0J9G/6bihi41LPf+QpJ47SVq8Q9We
	 CYUuGZoYiiUlX/QQN6RnWLKGZ09Dy9l7Kn3k3P+z20ZRzvIvSMsSYDCCLDmnor+7Of
	 Hob0j4wEYrW3zKlI0Xnf0SFqWuuy/ZaAC6ZZKkO9H3OxAnsk+vGcg271bcFqtwNbEs
	 yOTm4mSkJeUF9KLrMQIMVYe81P5Q7DUZjR8ZLq3hBv+G3R0Rhr1iAM4TppzcaDfcH/
	 ST8w3k+E7cDi51z4zvGTKM9Opggd60yRrmqY+VVotiVWOkdqfQ1DgPBbPIiWPdBdEx
	 6w+ZSD9yLmG3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14A994EE3A;
	Tue, 20 Jan 2026 08:24:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D7AA42CE
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 08:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FC7A4EE19
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 08:24:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 48mIXXJhpt77 for <buildroot@buildroot.org>;
 Tue, 20 Jan 2026 08:24:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A836C41D61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A836C41D61
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A836C41D61
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 08:24:12 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b876c0d5318so687973466b.0
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 00:24:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768897450; x=1769502250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mwTUSJVlBpdPjvgx+ikPIpOIHLCijJv8t5VI1Dqit3M=;
 b=V/XrmVT/JWyW7bIajalaWqJ5KYt+gXIOOaKIpsBjA3v78xU0civ/Hj4iMvt7MDgIla
 16wz9Nz7Y11SN19+cQtKWWE7J6A095l+HDk0j6wWo/d1TI4D/Lndr8Kxi+eAIRdyMeBy
 JGPbF3zdNUVoG7Ppq9IjJ+3M+V3O4fgpvH+oZWYA3QDwgq/2/b2p+Ed2BIa4nB8jvY4u
 JHOn3s0d/MXK3cToMfs412XJNDoG9Pi0DE7Me+KB8YzUf8E3PKNnRuzdqMgX697CVxKK
 +f51flC5QeAvamIO8Fr/KKHnQyXVEh/Apv3BhfxlP4cUSS97lUFG1a2L95gvYXuArGt7
 nX6Q==
X-Gm-Message-State: AOJu0YzgvfE8IV0YIK0M6UgBhDi9Ycvc5ViCI6mNnKha/zduZ4KAsCuJ
 vzBdBE2sBkT4HZ9+nJDkjsINepFeBdz0Gp7zWYrQwr0oM+99E4jJkc0uu9b8mORcjVVaEEBDlgb
 4CB2c
X-Gm-Gg: AY/fxX6sDCRIG59WjVwSQGYMindpSmLeKdVk//+IYAsDqGjoAxn/xKP+m28Y/8rQX+E
 HURFpo84qEmQhWh4oQFYjPn6LhICZsPl+qMEQKrGzOPLqcT7nhJ6gJBkSVjMsUVaqn70oQjWb8I
 nzXDbR8U5O5Uq61eg2QnLu20JJvKEGfl5FVG72Wf9lWegJgGAGBY9YkWSWspeYmDg/FZAAU7DE+
 w746VcEDnUVmKsSu57fYeM79mOVsG5UV0wLjR/pOQjxITBktUcuh3mkZrvW77v/5mbP+igjY8pv
 4pSuXZMbPkpBDuj9K7+DBSytLaepKq8Wdtr+grb/IwBWPWn1D92JgbzXWa4c187mOr31Q7a2kyo
 XqZLFGO66ytH3BFPD56s67SobdscrHqp2vhN3Rqt4arzGx8bcARnX3VerceweZu6+TPhjWPnpop
 TEuiD9EpOs7caPHBsHe6PCUCTz0M6kP6yTQGU=
X-Received: by 2002:a17:907:1b25:b0:b87:d09c:1825 with SMTP id
 a640c23a62f3a-b88002350aemr98500466b.13.1768897450500; 
 Tue, 20 Jan 2026 00:24:10 -0800 (PST)
Received: from arch (94.105.116.200.dyn.edpnet.net. [94.105.116.200])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b87959fbefdsm1307568566b.55.2026.01.20.00.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 00:24:10 -0800 (PST)
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Julien Viard de Galbert <julien@vdg.name>, Nimai Mahajan <nimaim@gmail.com>
Date: Tue, 20 Jan 2026 09:24:05 +0100
Message-ID: <20260120082405.46683-6-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120082405.46683-1-thomas.perale@mind.be>
References: <20260120082405.46683-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1768897450; x=1769502250; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mwTUSJVlBpdPjvgx+ikPIpOIHLCijJv8t5VI1Dqit3M=;
 b=THVW6pB9OCPiffHig9Y7NVTV27wf80K4Zk75m7LUWap2m9s7KHgVyyGgg073uJjKl5
 WWkZZa2pJgegyTShT1NUuZYr2cviy16VCNujj2hmftyPAwDnYxBn+1xdcyg737aBK02L
 9G6yparSk/XPYrb3D/9MpnDG0YHRWHDaL5cSM6IYHOc31aoSVvd1jPajadBgTHn7agUO
 G7A9Amt06rxylSz/CTFViusT1jZ15QHTdCjl6FjOSj9+wau2+/Dt2wdsh6i0erMDY6jy
 ZKdglP2n9Psd8VLePwuQGdprLJWjsfqt/BQ0rb5YfMAMIZyTQW5/LlHj++4rwJ5WG2eI
 3wog==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=THVW6pB9
Subject: [Buildroot] [PATCH 6/6] package/libucl: add CPE
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

The CPE `vstakhov:libucl` is a valid CPE for the package libucl.

See the latest CVE: CVE-2025-6499 [1] that reference the upstream
repository.

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-6499

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libucl/libucl.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libucl/libucl.mk b/package/libucl/libucl.mk
index bf5e368f2b..7b0e5b8e8c 100644
--- a/package/libucl/libucl.mk
+++ b/package/libucl/libucl.mk
@@ -12,6 +12,8 @@ LIBUCL_LICENSE = BSD-2-Clause
 LIBUCL_LICENSE_FILES = COPYING
 LIBUCL_DEPENDENCIES = host-pkgconf
 
+LIBUCL_CPE_ID_VENDOR = vstakhov
+
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 LIBUCL_DEPENDENCIES += libcurl
 LIBUCL_CONF_OPTS += --enable-urls
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
