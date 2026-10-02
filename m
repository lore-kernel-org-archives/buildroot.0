Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81BECA5FDD
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 19:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A89478133D;
	Fri,  2 Oct 2026 19:26:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ziWXiej7rG0V; Fri,  2 Oct 2026 19:26:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CA51981183
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790969216;
	b=NRrbefagb1XxqMzlKr0aUJhP4i0e9q2lhdKs6VO2v+8cFtEYL+xlBuFNzHw4C0/H54A+
	 V2/vxID2Vd6wHWVmS2GzjW8kKG6soXGUpFstc8GjdH0ZRn8m6GoD6kQ6HJTTagf0/9h05
	 ygzq28BqKsnvyZn5ZD8J2DaT6BkMe0EEJFkK8x3dVlmwE9aqWW+ZxFY7seFJiZR3o+nOc
	 dqVTriq7b7etptgfRsgBxw5TZKcDqo6fEjcWBCr9Bv96fDsJa0NiSNTrIZYpf+gBsLptS
	 6ohAJUsYOM00Wz9s1zgMZQNNuPAoKhGzTL64t+erUg0w4VvKa5cxQcINFK4fYJ5tMJA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790969216;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=/QuHK37zrHQb0k0iNzyowGFiJvZm7qI2cU6DdHy0vdc=;
	b=kJV38Y8U8vqM3AfhbviOlBzzkY0jzOKDxky4Pd1oDjzNJp7lU4MgpB352Bc92ryPVamv
	 Io3k350d4WvEBhalXZvhCIlckPwSeflKslFis0h24/HHI5kRW4CL7oVNiFCXo/teGI2x9
	 Kbnv8IBH3rtvZ9phGCkVmI3VrAAukUafLcS/0h2O7Cn+EjX8yLxG3zRG+ZRuV+KxH2rLi
	 ci26WIkR9Up66FsqhQYx/uIA0NiESRs1v+SNMHXR9FiD/FLbEqgRtxLHSXxcl4GedZQEv
	 WUdXpiTfyc6jF9TLETiFPOrRmDgPAmspwEgCbzIaKoCPDnA9t75Z3/yjHgwGmOJbPzA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790969216;
	bh=/QuHK37zrHQb0k0iNzyowGFiJvZm7qI2cU6DdHy0vdc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V/d48z1lvufEh8bNYV0x+lMplmVAZY1beD1knv56G8mydCGgpqJxuXxT4OYBMSoF0
	 YjJQlVGMxd1s4XW133raMANTSDIS/PpvXv93S3tWezVzpp/gib0ooK4LEApfWIj/Uw
	 VDv2Yo3EY5MfpVRm++c0XhlRGvNrc1rLDyY/d2iAcDsj5k9jVvCLclNlg/l5vMg4OU
	 M6XGQMtSRKYN07dD7gzEn7LSP4dncgvycUrjsdatMhvE2AI6TEleI6WzU9K7rr1/zb
	 14lqfmWKCvjrAAhCdVacbDrQIcMnvmRY/zU8LxWAYQ0o+WOmfSiclWnrV6j7Cbak4x
	 FvjetlZxllzoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA51981183;
	Fri,  2 Oct 2026 19:26:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F1C32282
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D741F40DC6
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:26:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mU9f0unjF28o for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 19:26:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D152C40DC3
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:32::e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790969214;
 b=Axt04Xm952eEBEKKThYz711ExDsN6XPBSrmeMdTW21Bvf4XWGgrINtnp5hJOPf/pZL8A
 ljBeiJFcRQxHW6zsN5eK+9JaXp6E6vdhyERpZr1ucDPQFVS6BhENdVSJOz6qOI0qXbJVx
 S1PrXZExWX/24wBQTSx2D3prWmyV9bKyH1ScYK43etP8EmKICMdreV0mftDmJiExTF7I3
 BIKZoIz9G6iSaTLDoAybvIan6AuQ05/2sihug/GAqkesjVKfWuZu3vIzc22voRPfy/pdy
 qUUl3PgqF8Px720GkN4teClYHhc5aEC7ocJUZHkYwU2vH+FsDBaWzOL1ic7ijBC5Hgw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790969214;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=nkyQYzMiClSQMvnwGSKKNaVOyD3RAUxD76+AQLjMF6g=;
 b=a/+oSrnUXE8H+y22WLJGojTy8m4UlYWSqpu0fd0mEjdNHIlXSIWb5wsLklyurVvoGN4h
 7ehf/5Io+Pu9H/OR7Y6NCxIAkj6dA42zUIg4cCsc0P4DQwx9CyQgoSNVsLX+tpahLXmBq
 DmTXUQMkfs9VvcI57v9pvtYPzjW2oh2g7pY1QhFPfRHKRvkZXKa+EOJU2KajQDq3faYiD
 BwP22nusQzl/qURgHHpBiVRbrsfkwC5ioNu/fK1tIR3HD5CGV+mdwTLo1G/9vt/TqvBgk
 Q57O9e2pGjfZkF2zOd0MbiS9toCWGoA+2Jz5kJygYYcRHbXRpRIQl2Cng0heaCjBCxQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=VUoEQURq; 
 arc=none smtp.remote-ip="2607:f8b0:4864:32::e"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:32::e;
 helo=mail-oi2-x0e.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=VUoEQURq
Received: from mail-oi2-x0e.google.com (mail-oi2-x0e.google.com
 [IPv6:2607:f8b0:4864:32::e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D152C40DC3
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:26:53 +0000 (UTC)
Received: by mail-oi2-x0e.google.com with SMTP id
 5614622812f47-4f55cdcac69so239000b6e.0
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 12:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790969212; x=1791574012; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=nkyQYzMiClSQMvnwGSKKNaVOyD3RAUxD76+AQLjMF6g=;
 b=VUoEQURqN7Qmb1OnHdmsV3aQ0U3Ea7CX9MXZ8GTDPgX+yWSgEj1BxQFq2VXpzFGEgG
 hRF2dd7drZvQUzFXDXVVaf9+6T5i79zRkyn+4h5sk3dBRcbCAEb84L1+HT4SPIzYxTcb
 ZY6CIZ+BkQROit3nAxlE5MgJXaj9imi96riHHGRx/SiUGBZE+LkF/3nwOfXeTpW8xAEa
 ep6/mnTeYVT0eu92aMhN6wDKLstbtgNdwqE7zJB7QcuAzZPwDEyD5jknH2zttOK22yKs
 a731R91pZ1BlZHX2MV8SVxsdAemCvQ7j8XTzL9YEJgWwu7Dk+EAeRE4IbQWCAjk7vzte
 dmhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790969212; x=1791574012;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nkyQYzMiClSQMvnwGSKKNaVOyD3RAUxD76+AQLjMF6g=;
 b=I8ciJSHQ0CennloS3H+7vmVZvNO/eZyN9r5eXBX1LxA7bRbolnyj7cy2aM7xh6A8rD
 /Vc8mrOPqX0OX6oZK1Ynd90pp1pzZnt8GSDNF2obIsaV29O/MUnQXAvZ9HHrhbYNxYfo
 QXx7XWy8z+GqqoZLi6YUsNYBd3fZocVjE+/ssryAMxmNK2kJUyrmKJOvSSzXRbeSFzvV
 0VOHVmPOZQLVvDLflUcotN4nVPgv4+tA8vrprbLcGHfYOwus3bXMGw+Mn1gejb24xQVb
 PdG4Tue3bJV4t4paxFOX4WYwO0HfwSQ79XOtzADFZFa0UrzKbK6QZOn+292YTng8pjrr
 kSXA==
X-Gm-Message-State: AFuF++nOYb7wIEL8MBglVkrk2VlzydhC+vcsss9a/4oKV0N73O9xyX8u
 RkImSQGCgBSmFADZXRHOWVfd9ttroD2bdFrrqM6xey7ld1veomeVxfkHhVLYDQ==
X-Gm-Gg: AYBFou3qEsho4AySuTvoispNB8rewpRAjCmXhIg5bk/ymMzBsNOCAI50GfSvB63Pdrn
 Tn2uGG8ZzgANP6tUW77+kUbuOQBBrhko5IF8rifCSmpNC98ntVU3x4tNO0X/FxhWobdKyqVQfNI
 Ifj/OGGJQK0YssXl9QFDmS/Fitqc0VMzQrwlS6mjAxzlglv7TQQid7fuYLVjFvpG4pZCrJjzFDJ
 MbwH1md6GMgJ5qu2YF8Vn0Q5Oxsr4T7px+rsKlufD0OwfrrThZ+t/uAKzp9VulQzX1ZW3iuzSNq
 vruZIosTznVxnmIFkrQKzcZpxyH7EKjm0YiVs9sLUhq8rpgzIrVcBKypAuOYeGf9b67l/yglzBS
 1eZMYYg42RqBffwpAEv1kyL2myOc8iZ2Nt1wolKw4fX3XiWk6gDm61EiNaH1cGvUw35KdVO6yVT
 RNBfrOX5dM8+jOFNQGDP+jiTI07J2uK5kULt+MrRYsjDzisLpKkcp7Z1245TCcSfaHHhv7Z9WtO
 GgaZALk/uSi7y3tm5OSCyGD52ILMbGA8LYrZGnsds6TQqSiAmFOPLKJEtZZ5OZXE6M05NvVHAAE
 nxFPNTeWge5yE/Htv+adVGvDeL4Gf/HHyMdyf/D8ahtBft8Z5V0PgWG+rD4wohVs6Uuy+hJs19P
 SnSfC/mRO2xCMYjcAXoAGzFfUbOS+fFIy9kq7UUhnGA==
X-Received: by 2002:a05:6808:138a:b0:496:11f1:f2ad with SMTP id
 5614622812f47-4f526748581mr3203325b6e.6.1790969212077; 
 Fri, 02 Oct 2026 12:26:52 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-4f5258e8f20sm3054557b6e.18.2026.10.02.12.26.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 12:26:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Fri,  2 Oct 2026 13:26:46 -0600
Message-ID: <20261002192648.3757582-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v7 1/3] package/pkg-golang.mk: use golang
 toolchain default GOPROXY
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

This change sets the default GOPROXY value to match Go's built-in
default of "https://proxy.golang.org,direct" which provides several
benefits:

- Avoid package breakages due to missing module sources
- Better alignment with upstream Go toolchain defaults
- Faster downloads via the proxy compared to direct Git clones
- Maintains reproducible builds through Go's module checksum validation

The default value from the toolchain can be read with "go env GOPROXY"

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-golang.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index ffd50adecc..26da7be71b 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -101,7 +101,7 @@ $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
 $(2)_DOWNLOAD_POST_PROCESS = go
 $(2)_DL_ENV += \
 	$$(HOST_GO_COMMON_ENV) \
-	GOPROXY=direct \
+	GOPROXY="https://proxy.golang.org,direct" \
 	$$($(2)_GO_ENV)
 
 # If building in a sub directory, do the vendoring in there
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
