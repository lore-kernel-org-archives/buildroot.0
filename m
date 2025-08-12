Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074FECA0EDB
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 10:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E47384528;
	Tue, 12 Aug 2025 10:02:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pccfrhiWBtnu; Tue, 12 Aug 2025 10:02:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8C7284537
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8C7284537;
	Tue, 12 Aug 2025 10:02:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 07196B8B
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 10:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1D2A41160
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 10:02:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gDkP64fqKn5I for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 10:02:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D18CF41E44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D18CF41E44
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D18CF41E44
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 10:02:08 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-af93381a1d2so838542366b.3
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 03:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754992927; x=1755597727;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a7LuTJ6YXNnkTmAADNh3Jp4H3cke2efB8O7D5UzN0d0=;
 b=ro+tLUYVdHbsyKp+ajaboUfROPPYvKramvYAUaKbMl2JqCRu34Wey7ArlZjbX0EXqD
 fKwApG9rxsXse5RuQigLwQkFD6YmTxTZQRaJ0DuQKqk+uviLG927fTmMV6YSm7la1ofM
 ih6LMiYqxwLzqLmR0SH46P/4dqgH59h+sLhwlYseR+/O3sxHGFP586irMPR/VI6GRr7y
 nSHtxw4zWk5mDX5vlzoHssHKMiui84DlLXCMvOnEU3wWSScAje72hODkDD0oqmJQMYcS
 LdWN0b8bdtfzI+r7q/DZLuU8pzkXn7B/+En7BXsC/IdAx+XlWuLCrkzcodovERiLK46C
 sOcA==
X-Gm-Message-State: AOJu0Yw4I8RcQ7stbEwR+HZlI4bTfHc9a3rpewCRiUx/8iALGQubZOsA
 9iPYoJjM+HCWS1PAtV5ul8JjA3O0A4KOgHxMomr94VYBDtsfw3FJNxJErVBqP3mrL7uau6YvOH1
 PG36g7xU=
X-Gm-Gg: ASbGncuUPnIkngWQwlsoTFxcPVNyy8U698ngdN1O+BX378FjAFyJFrroUZpSfM7kGLs
 QG3yuWRFOsbxymie/0yJKdUn46O7jxD1F2rX6zSIgWmMhzWY/mzCB0Qs29I7CCw2AMEYCpzuOP8
 MccVFyp8n3DVbYDXAgdSHdu7mdlra1+rnMJEEA7doFnZMD9LkNcfaFqrHrci+j6EGi/opf4NqdB
 MfHr89iaxKhNXSe0HCgzIdovsARy1uW4LBepfk4oXK9BltBKhfju+nEM4pS03skmNphNNwjStQj
 l3haaY0z47gkiTJE5UD7/dgu560Uj/Mf5D8MIcY2wNiAe/MzO9ZhqPxUDygurU3rmir89syNvSy
 5y1/x74kB5yhsByR6mXPLKbk0i6kzAJj07Xn1OOr5blJDmCHdVYWI6A==
X-Google-Smtp-Source: AGHT+IGfHV03tWbKpeBOZX94OaosD7VV9MBZJmmFzGHH+b+4/Q4SJCLbRRZ2KrhDHXz22icZqr0Sgw==
X-Received: by 2002:a17:906:f59f:b0:ae6:eff6:165b with SMTP id
 a640c23a62f3a-afa1e1ea662mr215300766b.60.1754992925213; 
 Tue, 12 Aug 2025 03:02:05 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a243619sm2181494966b.129.2025.08.12.03.02.04
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 03:02:04 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 12 Aug 2025 12:01:45 +0200
Message-ID: <20250812100148.717381-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754992927; x=1755597727; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=a7LuTJ6YXNnkTmAADNh3Jp4H3cke2efB8O7D5UzN0d0=;
 b=M4FyF8VutfVNuWpIdZOmmzXeBeAlsatUcl4Q71M+NaGgVqkvusYAsBaBloRa6TISyr
 wTmlEFCE8yCwDOYKLH6Q8Q/GWweya5jNtej2PDsUg2O0c2fPXjiYCcP3Enhyi+u0wXYK
 AHG3NHgG/6UAcd4DBDiH5RNPmM3FULFmtCt/Db4W0Vde8AbNKFJz32ZsgnnRUDh082Eg
 rv8I/r1d0raAseFTVtnhSN+zfW4P+d/lBhTmneSpNwVbZoIMDtfzCMoU4PujpSN+y196
 /iJ7CbwRhAjKG7b/zWwFLVgDN18Om1trhiHQ2rxM0T06pQdLBRMch4xcLHlhUJm0nBmn
 wCuA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=M4FyF8Vu
Subject: [Buildroot] [PATCH 1/4] package/openconnect: add CPE vendor
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

infradead is a valid CPE vendor for openconnect, see
https://nvd.nist.gov/products/cpe/detail/2877E5FD-6361-465D-81D7-AE1EBB3E059F

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/openconnect/openconnect.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openconnect/openconnect.mk b/package/openconnect/openconnect.mk
index 3fd9f990b0..73716d708e 100644
--- a/package/openconnect/openconnect.mk
+++ b/package/openconnect/openconnect.mk
@@ -9,6 +9,7 @@ OPENCONNECT_SITE = https://www.infradead.org/openconnect/download
 OPENCONNECT_DEPENDENCIES = host-pkgconf libxml2 zlib
 OPENCONNECT_LICENSE = LGPL-2.1
 OPENCONNECT_LICENSE_FILES = COPYING.LGPL
+OPENCONNECT_CPE_ID_VENDOR = infradead
 OPENCONNECT_CONF_OPTS = \
 	--disable-dsa-tests \
 	--with-vpnc-script=/etc/vpnc/vpnc-script \
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
