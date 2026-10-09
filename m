Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7593CA5FED
	for <buildroot@archiver.kernel.org>; Fri,  9 Oct 2026 08:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 936F140903;
	Fri,  9 Oct 2026 08:34:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HnxZT9GAQJAk; Fri,  9 Oct 2026 08:34:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 89C544093F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791534874;
	b=Fg9jhcgHGTN5FlaYPpMvLuSlr/KIVRHYIQVqwPu2L/CNwoErt8kCdquZP8YtLmtMTZog
	 nvisl0zuWcuwVK9Ilnmbxw+dZJVxQipwmegxK4DslURPElsu0VocBi/yPEbZXhT2hWYQY
	 60vCl0LzT/45pOFRnt3IlSpBJT8KGDmzdD0WaV5Ksrcx4+aBGUbI4LAI/VvBrFaTcihna
	 oExOGzc7zTjKqV7dHoB/66YowiJPya/YMZdSDVDUoqBX8LybPoN8nPh4GsXlWByQh//zI
	 b2cb7667BIDuNSq6LlZg8Qo+8VUx7QyvChPX5wRW2pNadEQmmjjPzefqHYkXSw16EKQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791534874;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:X-Google-Original-From:To:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=EtVgHDcSbBCXui5NEzDNjtqc1v8Xd5t31e2ZcRBEzPE=;
	b=gr2vou+X6IImv58TBfrRzxGr1ib2bszMIgYkaIiXbqwbl0tVqteYupmoYzWkuXYggkKq
	 M+xLAHuviftUdCJOGoSV9k9Qcr6UV7jU8XVhaQIRHA41bIRgpZgQbG4ljKSEPCp6yGNW2
	 R75DwhHhEtTvO8SlsHR89m435MnmtOa15skFbvNkATQEX+9L26PmpBtbz6PQM30R9VYLS
	 bpCFwuKW4pO4w09f1A1qDAZaptfJJrwphTaJFBTPE5tVsFEVWoZC8MN1S0xr1l4556KeF
	 +jym8Y/xx6ncA24GsImtsUJDzDmx8g9pzFexAhywjz6/lfpwDi1LM5bLZbKPtF8wvaw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791534874;
	bh=EtVgHDcSbBCXui5NEzDNjtqc1v8Xd5t31e2ZcRBEzPE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fP+ucRG+IHXzE2ZC28Z3Qx9fWV4tiP9iMhsb0MNrdFs4Bbi3frFGxXJJl2FtIy4cs
	 4fs+Tw48YLZIWBpDe09YuQxMwtPjqD08xDFmWdz4xshV2nwnQp/esqN3FLlOi7sCL/
	 QdldnLLXBxv4IlmHCuTZdscttajHCqDDSvQEgFiLZT5ykBqw/kFWrRfJu3i6BCG5kC
	 +rgch/00DA0c6vf6TjW2IqKB5eDWTQPSt09UsjThIMq3fTAMFpgHIXnvpHKLF+JyMs
	 /1u0Z2rY725LVWtB1i99n0zeID/gTKquAn4/Lus8rPzcRBTgRe/hPcmbnvPyBwQKY5
	 AX/qHf16z1m6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89C544093F;
	Fri,  9 Oct 2026 08:34:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2821D75
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 08:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A1B98146D
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 08:34:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 54Y1-phPdAk0 for <buildroot@buildroot.org>;
 Fri,  9 Oct 2026 08:34:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CF67A810DA
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::633"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791534871;
 b=JvnKMwholCiExwB7Mg84axhzZKlbBC2CVSX5cJVospbE1xwFRaohz75n4WBlQwuQ2sbs
 Cj6v5w5s1iv8Bv6MNFREALC9tLd7c6218oMk49uSrnsMZtAjc4IXi0RtoqgZWXySimWbY
 9aUkddAbsou0CmvgMN6+SwGwSaRPx8w1sHzoKvRPvGK6xYQeuEaegpCdBv7Jb8xLErBfv
 9Wv+WdYan+F6GWJOqUwyjz80zoLyd+bXs7cc6509ofPxjG6aQQDdsL1wmxGTEqcQduMBN
 3v1ITjeGHkHBguAJs+PS+4lix6IEpNKhonuGAiHQmt/Q4dzkaq1s7EoFMmWlxx2NQUQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791534871;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=6h5kp2dmQRBRABZ7lB+ijoQolGdGfhqse32oVEX4GZg=;
 b=eep9uGDSMjmEyd84SlNW12e+6naElKJlEf49TxNRNgvGRZlDo/Ki6mr4okpypgoA89uy
 FF4kSHIkBfr9v5mhLm+njePZqL9aI8mpuhwvbopweoduPOnxi0WP8S9o9r9aBqATUCxh7
 /V3MCL/PCsjnEbQ88yEM1GDS807EC3w0KCmXQXHyy0oADk+/Uldb35zcE/OT//Xg6lKjl
 AOwiHtEJjmqT9y7xBeyZrT54nIri7m0F3H/FHu4HMviktFjWsW/lYi+akGlvdHYQahFhI
 a5fJT+ERC4/3L+KqSLiEuXVcrdFjwzamkZd+MSOBCw7zkCvQK//YtDkh1K5HzEWROmg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=a0YvJYea; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::633"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=a0YvJYea
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF67A810DA
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 08:34:30 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-c315a445752so572271466b.3
 for <buildroot@buildroot.org>; Fri, 09 Oct 2026 01:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1791534869; x=1792139669; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6h5kp2dmQRBRABZ7lB+ijoQolGdGfhqse32oVEX4GZg=;
 b=a0YvJYeaRW1cKslMPWUOs57gfvuc6nQ8Z0rWaDEJ/GIOiuFDup345LuIrjG8DUyWla
 TXlWHi/aqfxqLvg3pxHqw8re2sRuncpvezuKTwesqI+6um7P9DkDNov1uZX0iqQHMh0C
 wuQk0XefymWaKYSUSKp16j7PvGf/CK/lkXGTCAPySFxoWQ08du82Q+tNrG4MXugMEHKC
 P3oeWCDT+ogwNNsGIdH+VDVPZlR52dQmBeR2ayU19xs8BPoJlb77REmlIcJ72uFXWTc6
 9r19byMru90NUJEjd3L03M+X9Rnnr0ROecVtdqYsvpAkMWkPQKWQdSCaH4oOb96Cigi9
 06Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791534869; x=1792139669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=6h5kp2dmQRBRABZ7lB+ijoQolGdGfhqse32oVEX4GZg=;
 b=LMpcHDybUpqJcHgj1FTNoMgA6irzFW213ZJV2n8NnJBC1cF9BUSxTWMhb7zR1R3TWG
 zkzUYc/ZTmmTNkX2e8pDZC1j+NdvuCcdtKMVKSWIoGUyK3+8sTT8NpC0QGMX2xR285XZ
 JTrBiy7XTcp3EEEcQj9Mvj8C3Gl75zkKuAoJR3DMtalHTAVRs7KPM4/zRUAm1G9r3eye
 buBXFdrcS3wsy4fyZa2UOJ459+NvRdEDEAlXjHK4rvqQAPuXpXbAjVO2+YlzYn/2rr5k
 RvTftMtPwC1WUvdHVbYM5P1ywuokfqA67XlxHRAzPp0VnRMBq2TSrc68b1q1F43QPTm5
 0Vgw==
X-Gm-Message-State: AFq9FYJLDh03Cd3I1o9+CzaZgonKGW44j4C04JXz6hFvFBYa4Pxdva+e
 PFNCGwqlAJXk1JfJTDNmDkkVqqUIyyp1qPiOjikdlmoCv0OaL4BiP095aSQRFg==
X-Gm-Gg: AYBFou1j9GZ5wjlac6xwW0KUGT6ANltT5WtXYGfYZWN9wi2g5bAyfFAWAHazXYXydq7
 rNiYtTXFHkh/c1i3g7xtupXzh75koB0wVXtLLy9cReHfLfAUaaVzpoGn35CiEwOg7eOFil1NC50
 RsU3G5qe0zyxlMASg0rFIxHdWVc+MfRnYVFoSydCnVS4gW7Zo247/UlT+mL2AMIMKgS0iESNAYR
 5+UeMneF926auEadng+lh+r+WMzYjiYoBNmqs5Z+qdsNKXCvtiX2GDd7ULWkTqv4EF2jISNi6Sk
 XOsS4GOV06rsaLTM1ZsFILnI5ADz9YCD4W7lIC3cq3fDFG0sfn7l2Z/N7KKHLM5jbXDNAG6WZAe
 Q06hb/tpY58mMSziyiluFJU7R1m52zN5TatfDoNaZt0b/vbbwV2GGQkawRYr1nt2KbtNEs1gp0P
 XOq+LPB/31HGNtL1krw7kY9ic3L0CarKQgyp/BHkQTD1PNx/ovy4+Oe+2TtfHnUbY5mmJ/h9RvR
 43yfWvtAmoLRH5om0n8QOA9s0B5iDnwAqz4s1UtWk3TYMw=
X-Received: by 2002:a17:907:3ea2:b0:c26:1691:b369 with SMTP id
 a640c23a62f3a-c31a9f6ba9dmr124035366b.34.1791534868312; 
 Fri, 09 Oct 2026 01:34:28 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c31a9a3ae32sm63836966b.28.2026.10.09.01.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2026 01:34:27 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  9 Oct 2026 10:34:20 +0200
Message-Id: <20261009083420.1298439-3-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261009083420.1298439-1-yegorslists@gmail.com>
References: <20261009083420.1298439-1-yegorslists@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-types-{python-dateutil,
 psutil, setuptools}: skip build dependency check
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

From: Yegor Yefremov <yegorslists@googlemail.com>

The latest typeshed stub packages declare a build dependency on
setuptools >= 82.0.1, which is only needed to accept PEP 561 stub names
as package-data keys. Our setuptools 80.9.0 has been patched to accept
them, so skip the build dependency check.

Fixes: https://autobuild.buildroot.org/results/1ce798157bff8a423ca8c7c9f0e82620890ec3b3

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
---
 package/python-types-psutil/python-types-psutil.mk             | 3 +++
 .../python-types-python-dateutil.mk                            | 3 +++
 package/python-types-setuptools/python-types-setuptools.mk     | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/package/python-types-psutil/python-types-psutil.mk b/package/python-types-psutil/python-types-psutil.mk
index 0e0875345a..28d5f9f1a7 100644
--- a/package/python-types-psutil/python-types-psutil.mk
+++ b/package/python-types-psutil/python-types-psutil.mk
@@ -10,5 +10,8 @@ PYTHON_TYPES_PSUTIL_SITE = https://files.pythonhosted.org/packages/97/0a/f48b9b0
 PYTHON_TYPES_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_TYPES_PSUTIL_LICENSE = Apache-2.0
 PYTHON_TYPES_PSUTIL_LICENSE_FILES = LICENSE
+# setuptools >= 82.0.1 is required upstream only to accept PEP 561
+# stub names as package-data keys, which our setuptools is patched for
+HOST_PYTHON_TYPES_PSUTIL_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(host-python-package))
diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.mk b/package/python-types-python-dateutil/python-types-python-dateutil.mk
index f5b44c836f..2cc13750e7 100644
--- a/package/python-types-python-dateutil/python-types-python-dateutil.mk
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.mk
@@ -10,5 +10,8 @@ PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/c8/4
 PYTHON_TYPES_PYTHON_DATEUTIL_SETUP_TYPE = setuptools
 PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE = Apache-2.0
 PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE_FILES = LICENSE
+# setuptools >= 82.0.1 is required upstream only to accept PEP 561
+# stub names as package-data keys, which our setuptools is patched for
+PYTHON_TYPES_PYTHON_DATEUTIL_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
diff --git a/package/python-types-setuptools/python-types-setuptools.mk b/package/python-types-setuptools/python-types-setuptools.mk
index d0cfdba1bc..a2c8119509 100644
--- a/package/python-types-setuptools/python-types-setuptools.mk
+++ b/package/python-types-setuptools/python-types-setuptools.mk
@@ -10,5 +10,8 @@ PYTHON_TYPES_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/4f/cd/3b2
 PYTHON_TYPES_SETUPTOOLS_SETUP_TYPE = setuptools
 PYTHON_TYPES_SETUPTOOLS_LICENSE = Apache-2.0
 PYTHON_TYPES_SETUPTOOLS_LICENSE_FILES = LICENSE
+# setuptools >= 82.0.1 is required upstream only to accept PEP 561
+# stub names as package-data keys, which our setuptools is patched for
+HOST_PYTHON_TYPES_SETUPTOOLS_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
