Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977C0CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 08:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40D72408E9;
	Fri, 16 Oct 2026 08:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZxBdJC0j_wsO; Fri, 16 Oct 2026 08:39:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5FA06408AB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792139957;
	b=qEX+AMbpD2/Zj33S+92ShWPoeYDj0HpRF2y0EH5kyUTYE7L8+JCu6rDwhMh7gS3/pCJ9
	 umbpXsb/ilcsvERBHVg2xVEeQtaGfqoqHNjWSUBFEMnUafYCAo0GhhoCTJCL+lI3hlQ3x
	 w/FeoWX8OqJUkj+MIm9lgC8VGCuTMNS+krqDtAeflmhJ2IzX7jZhRRj3nOTpGGFF87UEa
	 Tbfoynmx0vhTQY5iVvHsxBvOv9lek3osei46cw06ZBXkf9mu/oQMwn9po3pQ5qxfz/r7t
	 d6Fjiew5jH/gUwimkc9/RGsrU/Wob05oZyALHDYCLyqEWdAiGa83Y23biUQj8DZEeCg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792139957;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:X-Google-Original-From:To:Date:Message-Id:
	 X-Mailer:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=0ZXbue+zIR5YgKdVEdZg/rFaUQmLxiGwi52BOpVoU48=;
	b=Ur+rN63jx3hXCn9bBLgH+vn7QtXmHzcowt9h9xnqh6w/nbPXOY9pfiSxpZlQvelHXnnZ
	 iH1fCOrqU2Hv/oXlEJQLSCXLBEBeMbUFt78ZiN0BdN7ErGb7eim370knq20slK+X/xTXk
	 o5RPjL7e4gmYGYOEQFVaswKPayc1/WDtzV3zhFCkEuN4jynXYpJayER7eqKCT/PgRlB3k
	 5u1gtYWybDIqkucD5p21lE7kVF9gMknBwpOXv1FfWMCkwB6UGqu5iCtnjWkbR3cmHSKeQ
	 dcjk+9+fUoq1pmImdVojl6E+t9XW7qrtGm89IbDQR9zgh6OiaUb+Szip8TS2wWwn5Mg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=Eq3HppAd;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792139957;
	bh=0ZXbue+zIR5YgKdVEdZg/rFaUQmLxiGwi52BOpVoU48=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pp7i7QEbdguxC9sbiFjR/bQkhXJuUhaVg3DhFXpHET4H2ohinPh4hQVqBifMQzDDt
	 uIxm90DztJHPUUOu2VXwfj9N4DFQv2aJ2XtB6wownGt56ChyeE0DhelbSUYfMOhqSM
	 5RiwQaqqd4oxg0f2Q/U3nv73NZxTRSLtG55sgKyrSFR3ouyj/ZYCtZdXIjfrxhjKdC
	 2Zc0yFLfpfRm/VmeSUINuebAaRPvJlCYw+VlAebrW4T6eq1K2uR6ZVWCpiV+MM853S
	 zkvlsl6b0VkfHeLJ9zEMiNZbG4GpRCfjaJGunCoT/8H5dGDT2MbJ4G/hUhso9hxp/8
	 3lRj70WztYZeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FA06408AB;
	Fri, 16 Oct 2026 08:39:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B2710263
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9867A408AB
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:39:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i7dEa_K-2qtV for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 08:39:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3952E407D0
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::530"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792139954;
 b=sX6UNWafMwLaxJ2eALup1Li1LIofsnCMIR9FyYevrOs35uGBiCFXn9FDH/nUqMlOOcMD
 YvdenoAcdQCfZ+HzqsU01ke08H3/cxeP0SOTZNa9yNJafg3lEyxX+HwI0aH7qranrY+3W
 LLeQaO548pH5PYnV5/iVGrPAcqUg6XVTjIdvqtys0kYLndu/9QUL5ovC/T4fp6l2wSL1b
 Qfl/F3t0GDKQNpifybUGWVcf5MkYRwKWldAQOva3b6uKfEu28FpiBlK4IDOX8bA5uK7b0
 lcpnNo9N2PEVSLllNvNqWgces6rWtAExuDWj9TJ3iKEk4gZ1C1/GRhSNHxNJoOaKnhg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792139954;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=ugRZv8jaXDCzBVzCu6EwpBMBw/HdV3cYtLZi7Si6UKU=;
 b=iVc0yyBKZ3e9UscjjitPg2dKE6O8zAfTTSPNFrsMtK3uncwZY8U8kSHR0Hl3DQR48ezn
 vCqb8iZ15md3WRYCO1ee6m8IR7jyW52B6NZiYPVZtxCgUzMcRSWLW/3Nf77AZMpZJjyRl
 kU+w8hv2EYyROt5naxvbuWPPHhmZgaHF9KlLDzetAGbMj7cU0oYpDtun0Xtk6n2FcrU2F
 j6tkQS9X2pWWG1tUcG+IpkqUgplIRGKdQmslLMLSoPZ9AoA/8KWy00OBCBtqM5/V/uKrs
 CeLyqmsqvrcXmE2gvuQuS6oFkDY40ON5IWg4hbkb0nnqU/JPGmMoXmIAhPErNgW2LSQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=Eq3HppAd; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::530"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Eq3HppAd
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3952E407D0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:39:13 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6ae27f06c2fso5579428a12.3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 01:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1792139951; x=1792744751; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ugRZv8jaXDCzBVzCu6EwpBMBw/HdV3cYtLZi7Si6UKU=;
 b=Eq3HppAdRF4IrX0QTG6/t2Ct8r6GklAHEssz17n3r6kxewdY9AF1xRs26KLI73NcLv
 eYX7iIczcxSZzf0jzcLCAHRHUF+0V7bjKTqp7fatjylx4J/ccfVP90b1FxGgj0cyXl2E
 WBnU+A8NRWg4+C2JnPHTJyHewxP2pPMnDHHbefRcIaAbbSlN3aMH3fa13Orl15AvbJkK
 NumJv4CJiOyM6/weTyrbNeQoM26ILRtNUQZmJmXV9kSTPKh8A5wHmTyZBv/O3tOnBZtM
 EZZb8HI/4t//k1cm4iPtbxr2RH/KeTx779u68igBy7Hbi4BEvh7en/ekjoNORrJIITTL
 XjWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792139951; x=1792744751;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ugRZv8jaXDCzBVzCu6EwpBMBw/HdV3cYtLZi7Si6UKU=;
 b=MqQF8/ViRUULNGDMcix/FHhJD52gWess+NKkjVg3YSGa4D7nZcQQ5HkRWAuMD7g1OC
 qQlAyCfW8V46Ntj8e34mRg8JKGFOj+NBBZ0IJxDpQmTZw2innO5pQCosdLypZJk9I4lZ
 k9zzPJxfNBMXapwoGbNm95KCDdXzmzNrCsMvJujd4DVf85Hc+q2tW0zlg331zPUx+FJn
 U9ROWHR5+MRcGa28O4y5A82Y9vGzWmj5Vw7c6ifW1UM93EoYHVxa+RvnvmdJDPbMuJ52
 KNGA71FfVlv/ldaHvv6t4TI5SdIYnAGsRocaJsZIoF+TsXxFAfbrvve/ztTYzZF41wJS
 yKnA==
X-Gm-Message-State: AFq9FYKu1mJRkG3pSwliP0MGek4+S05F+3HP2V7/QOKU76+fPhD7p3TC
 DqwPvETLqI3vfJKrsxj9uSjN+EelXSKmS35ZN/DDJW4TwaHoJdXbDyegPFDbCg==
X-Gm-Gg: AYBFou172UJXRpk0QvqUeu93i+o8RgBYNF9GP1/bpqghifWsEmJKZdp2MBedhHr/gCI
 IibjYK4gOadbGEUUgv1kvNv9Q8e8oKlcnZGgTq8WT/U3s6/jWkoHIE28QRlZlh1GCuw7tKnGv3y
 /HNkctcjmSey7rp5SNCt72dMDhuMIMjqCqZKrvLbG03+Xo9O73LOBG5iIi71GdW+E94MSiCxQz9
 lcdeqRV+hV8MiE7lpPmr2DfbnjHZJxSfvuB4kRLUhl9QnFfN4UpvZgzukSZs+OkivilNZ6N+N0N
 lODW4KGObb4Z/4nkTGVseWvd6JfTR6TrEl7/qpj2H8D0GKJEZIbSt09SXuEfojmXvKaWvY23t3Z
 zuA5coDCmd3gT6/cyE+7ZzXNh5ERQlHe19+Fwrfu4mlrXdFN7dOjtdbNc2aNZ5342CkZmerSS+2
 4b19+v+oI+7otXb573mDzT4vyEz0R/C3rmKzx9dwtcyUdW/wGzTWdKPqsRrTEukVeN5aPuJM2Mh
 R3Nu/oKR4Yn0frnMVGoTwXKluzcfpw0Pl6VkzYWpuNMN8M=
X-Received: by 2002:a17:907:e00c:20b0:c35:babe:ab44 with SMTP id
 a640c23a62f3a-c35bace0101mr810437266b.0.1792139951242; 
 Fri, 16 Oct 2026 01:39:11 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4090dceadesm52896666b.20.2026.10.16.01.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 01:39:10 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 10:39:06 +0200
Message-Id: <20261016083906.2575324-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] DEVELOPERS: add Yegor Yefremov for
 libmicrohttpd and libwebsockets
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

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 349fb1d26a..0dda356bf7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3591,6 +3591,7 @@ F:	package/libaec/
 F:	package/libftdi1/
 F:	package/libical/
 F:	package/libmbim/
+F:	package/libmicrohttpd/
 F:	package/libndp/
 F:	package/libnftnl/
 F:	package/libqmi/
@@ -3599,6 +3600,7 @@ F:	package/libsoc/
 F:	package/libsocketcan/
 F:	package/libubox/
 F:	package/libuci/
+F:	package/libwebsockets/
 F:	package/libxmlb/
 F:	package/libxmlrpc/
 F:	package/linux-firmware/
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
