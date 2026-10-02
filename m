Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC7EECA5FE0
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 19:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8827240DC3;
	Fri,  2 Oct 2026 19:26:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kN3pZ7oUfzUJ; Fri,  2 Oct 2026 19:26:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 71C7B40DC6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790969218;
	b=NfTKQtFVUBM7UxhmM5b8iV5rnmXSYPYwxKfMQZVf8fIOsoDEb2A/iOsMYFCN6scJmMlW
	 gmOtrMyM3rTy4k0yahzcnDVWUof3NFy0ZbocxuoHMj5Vxhp83oeF/uBoghD5C/6UHRweL
	 KjpTmqSkLki4bgLU6rQM6YctZ0wpxtwsA4SEno7U3lZOLDYMktPwi3W/CYViG6qveAyOc
	 ARmik1yNc4wgZMGC3klmICl2XxD3kz1PDFGQLNmzDssHNSX7i7CoZD8fY+Udyyi3GKWTe
	 UyTHKUYTJlQWxSn9Wn7dnhEF2f6LKzggARuU8YOCskSZKXNjyIb590UIzJfobtGY6Pw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790969218;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=a7C8PYecA96MJK9Fc4MjxkikgcUp+8d62KNJaujaFoc=;
	b=O0T2KczwG4vkMXbpaX6L0yzIpxM6c5kbiKfyAPAMdl21+W0zgZ43NmFM8BKCxODzNgHX
	 tWWZJdu8KlvOvMaJX4NA5xocNfdRO4vyKMzykmDX+Ygs23FGvc6j4cZOIGVh4Yooc1bpl
	 fpaBzZEvTFeeDCR5WXwh3mGDSQ8umEYpCxulUzP11lKuuaCwy3nAwZErtTH7BId1XFNXB
	 0feN0BuqESIFNG7426072TRj1qRgU2Cn9lov/+jL319pBU4qW5bsnnzxWgCrBfMJ8gCCV
	 GTvy65bEBuYl0SeO2agIjMAxWL+wzm+zJVP0ZbKCCMZtek4RVXyBp6J027/OxeMEg2A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790969218;
	bh=a7C8PYecA96MJK9Fc4MjxkikgcUp+8d62KNJaujaFoc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EwunVxRMBU2yKWG3bJNawx6/+yegV0r/Fgd8RziYd2k6Z5YhhPUtzbd0ezIOeiSca
	 A0umMi44eWIJM5BtvVoY0V8876yoC+F2cIffl9hykzNnozKZ7h2fR9tcSdVhKLEUc5
	 zkvyS/bx/kz77svWlvrkh1tuHEEpO9k/ad+uYPxCeBdscAdZA4FttMGy+HbnW79Syi
	 IY+BXnErwNtREokLgltLHq3j2EmkwiTFe0hQ97ZgvHCwm2Z+4d5y2g/qhPaPnxg9or
	 fVFC7QTM1kWApBkBN7V3KPM0KpaWjekzJNyIuZPWdE5LyKgiRZMLamJWt+v/cI8PLU
	 kKz+/Mkq3+NqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71C7B40DC6;
	Fri,  2 Oct 2026 19:26:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A07781D2
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87726400F5
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:26:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s18uZ4LZKGkB for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 19:26:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 93AF5400C7
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:32::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790969214;
 b=eOhiIITS6aJ6DC+Tre3AW4w8cSJO++hZxwv5q/ZCn0bI9YiL/kqoqZtTng/FQvk0au94
 XNMzA51uNguRCmIBW0aWdHbufNfKO+elUeGKGtOpgTF5QqXSUNxg6M5TAln+OSge8hCuc
 Ln5O9sJpWlTD3J1biVSwyN2lugfSesDF5rtlxyo0SrI2dEDkk5m0FDfKk2mU6iTytq0BI
 ZcsrrnzELTv68miHYG1jq3vXRjWRgCOnUWVdKoHimhzck40Bm7ruVzOf8JoKQ06T9frNa
 HzUSg+nzzJbg6jRycF676/Cc9qAbP/pVVsWo3x+jfNlH2GQpoAXqxuU80+y8b2nvFPw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790969214;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=W9snav8lBFhr5M+3vfBuPj9F9Add6tfpNtz+KfpUits=;
 b=WkurSDcS2vWWfewikbgY6KJC4XsUWy6kj4vhA+YZtCu1CV4/j6vC9vBhnFDmQCBzD5Jd
 5RgAJiPCQfdVB3IKgZ4MTN9AGH+9mbiAz8voqpBfRWwysHDflpAiJzaPneUuBMYZKmSmd
 VKF7ocquBc/guUm9DKiubHtwjVG5bddQnRdqbUYJRLDUSn7DD3dLwqM243Cj87gZaY78r
 k5vQlWKG4yMUgtZTTGf7F5HVR4aJZUgUwkFo6Ux5gBnTp4/nJdBG/lC+pzAe0qFAGJMHN
 aDiZSfdFctZaN5i3VvcX0xML1guaFoJ81T2sS6LBxv+89hDehERpYZshlzGk7PUzPNg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="O/56lMzB"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:32::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:32::10; helo=mail-oi2-x10.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=O/56lMzB
Received: from mail-oi2-x10.google.com (mail-oi2-x10.google.com
 [IPv6:2607:f8b0:4864:32::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 93AF5400C7
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:26:54 +0000 (UTC)
Received: by mail-oi2-x10.google.com with SMTP id
 5614622812f47-4b37a2ffee6so73420b6e.2
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 12:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790969213; x=1791574013; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=W9snav8lBFhr5M+3vfBuPj9F9Add6tfpNtz+KfpUits=;
 b=O/56lMzBu4fLdwcEKINjZxoyhO1hnW4/doiTT+5VZZsd9Fz2y3C37L+jXLTMDMkT+u
 QnJRNAreIbWPmIjfEh/VPBfWNSIfTK4PGMU/4mtqpad1N3mf1cCHojEmo12YxZKjUewG
 mRvnohLFZOIGXwNImVVH/bouQJhGq/PJIma6g4SZ/fsbKdRDwm8yKC4EenUauL/dqxuk
 JBuwd5ptCZXledcQ+nXAPViYYaPONxzqR2t+95LABMwvlN8R7fhlOzOVRolYZ6eWY7OR
 9kjLXvwygeUiahwk2k8uqxJ6fGRAXAwTaBK9iyJbhY1uzRaynGJCCdQatV+8JbDdk3GL
 vtDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790969213; x=1791574013;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=W9snav8lBFhr5M+3vfBuPj9F9Add6tfpNtz+KfpUits=;
 b=dSUAbBSudo6Yu9Tg+KKoWnUw9DYwp64K99Xkp/Ll8BED49qu3jFlMO1k7RoCcxy5IA
 LMtom7Qs+NFYTA+VmAar9I6XYyq/3Dp0OwPPn4e+Si3fDXS2IHH+LSVNOoMRNMAkbh0k
 xa8CaHo61Ngeew2D8A5KexefbSA+wNGJM4lchNpzEOVIo7lPJynmI4crPNW5kO6NxnGq
 AsYB2vLOO6g9ysxfdu0U1mOekCScqtD3ODXDsRd95UeLMmi84zJ2l7Q3ZecQ+aLDgxV5
 MbTmF5FVaUcT7fQfAuPXo1WzTPqcI2zU0/azFLNn35cGcVf8k4XBIppw5wUzk0Pm9bTy
 W5kg==
X-Gm-Message-State: AFuF++mF8SMU20jtxaLWjMOG8pDejmmiP0IYuaobpPOhMe0fsMazU35E
 SZlcOUzDfvw5Ng6N4qE7NKy0399oI5PWMbLMN96wRRzZhTabkHTfua5t2OqeDA==
X-Gm-Gg: AYBFou12GqUxH6OtND8/Xn29nA4C0l1V7q2g54ulV48dtMKkg8mabqPJyHr/luC//d/
 6C+1Wo222K5UOz8mJqRQ8dhENNvBpfV1SrppEezL4VCN+ckHX60e8uLePF5UY0GkkFDP4hZiEIP
 KD+TpqmeViB6PJ6zfUxBUI7zX9HqmakdTVQnW1ZrxDcPu9xVkKD+YlkMkqAXscgWsAp9yzmMdSm
 Qdt7HIPwtBwhib4wp5t6VA/L2GV0jDlB+IWbYj5HjJwoNWw+I+QFUD/jpLc2yAJAXEpDsVbUtIr
 zXgXg+dT38F7GVM8hRu/s8MuaoMc7MDYxzW5VkjiziNnB+Zr6Fa8RoZGfmqjFp7yHUD08lQjc4E
 bR8CjtCEwq/zzWHC3d89qVxV9UJMIbYugzMsYAr4tp3w9ejMdmbxgarz40fS0pyO7Nu7pjQUCaJ
 5Ndpb+eA22Ss1X4k+zCoOiSnIgA5JJJiI9k9mdHT/b9bCYSPSgtUlWfS+1wzelfXa3SdA8zOXWn
 ni6X4tmKdPivL9qCRfIZpeCPCys/j+lu65echR8ZRRtWSQgXwELIXyEYulNGs6fxPbmnNANlgXm
 K494XJ3JIPMhQy8+tUbBaJbyrWH052aCs6FYmU+lt1Si/4GrLJZLTckIrU570vfxu5e53nbNtes
 rs54nn5pf/cDbytbJzkQF33K/pVHKbLbFzzb5MKqRslmEvPP46j61
X-Received: by 2002:a05:6808:1b22:b0:4e9:73ce:e2a1 with SMTP id
 5614622812f47-4f52a9855f0mr2342666b6e.44.1790969213171; 
 Fri, 02 Oct 2026 12:26:53 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-4f5258e8f20sm3054557b6e.18.2026.10.02.12.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 12:26:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Fri,  2 Oct 2026 13:26:47 -0600
Message-ID: <20261002192648.3757582-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002192648.3757582-1-james.hilliard1@gmail.com>
References: <20261002192648.3757582-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v7 2/3] package/pkg-golang.mk: make GOPROXY
 configurable
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

BR2_GOPROXY now configures the Go module proxy URL used to download Go modules
specified in project go.mod and go.sum files. By default, it uses Google's
official Go module mirror at proxy.golang.org, falling back to direct downloads
if the module is not found in the mirror.

The default value from the toolchain can be read with "go env GOPROXY"

We rely on package developers to audit their dependencies in go.mod and go.sum.

The value can be configured to:
- A comma-separated list of proxy URLs
- "off" to disable all downloads
- "direct" to download directly from source repositories

For more details on Go module proxies:
https://go.dev/ref/mod#module-proxy

Discussion:
https://lore.kernel.org/all/CADvTj4pXO2rwJ8oCzzGNY+OxLuo3uJnDT2PAxbyquw0L6dhfiA@mail.gmail.com/T/#t

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Christian Stewart <christian@aperture.us>
---
v1 -> v2:

 - added more context and links
 - renamed to GOPROXY instead of GOPROXY_LIST
 - moved into the !BR2_PRIMARY_SITE_ONLY section

v2 -> v3:
 - split out GOPROXY default change

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 Config.in             | 16 ++++++++++++++++
 package/pkg-golang.mk |  2 +-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index ac58c685d1..34e9ec6705 100644
--- a/Config.in
+++ b/Config.in
@@ -334,6 +334,22 @@ config BR2_LUAROCKS_MIRROR
 
 	  See http://luarocks.org
 
+config BR2_GOPROXY
+	string "Go module proxy"
+	default "https://proxy.golang.org,direct"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	help
+	  The Go module proxy URL used to download Go modules. By
+	  default, it uses the official Go module mirror, falling back
+	  to direct downloads if the module is not found in the mirror.
+
+	  The value can be one of:
+	    - Comma-separated list of proxy URLs
+	    - "off" to disable all downloads
+	    - "direct" to download directly from source repositories
+
+	  See https://go.dev/ref/mod#module-proxy
+
 config BR2_CPAN_MIRROR
 	string "CPAN mirror (Perl packages)"
 	default "https://cpan.metacpan.org"
diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 26da7be71b..3e388cb257 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -101,7 +101,7 @@ $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
 $(2)_DOWNLOAD_POST_PROCESS = go
 $(2)_DL_ENV += \
 	$$(HOST_GO_COMMON_ENV) \
-	GOPROXY="https://proxy.golang.org,direct" \
+	GOPROXY=$$(call qstrip,$$(BR2_GOPROXY)) \
 	$$($(2)_GO_ENV)
 
 # If building in a sub directory, do the vendoring in there
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
