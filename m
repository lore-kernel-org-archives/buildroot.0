Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96A1C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 11:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6393782FBE;
	Tue,  4 Oct 2022 11:15:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6393782FBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MvwFWBpAt7s8; Tue,  4 Oct 2022 11:15:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A19E582C98;
	Tue,  4 Oct 2022 11:15:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A19E582C98
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 759BC1BF863
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 11:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E4F2416BE
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 11:15:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E4F2416BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b1zv7RMwpcgm for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 11:15:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 297E5415DA
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 297E5415DA
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 11:15:36 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id y5so989272lfl.4
 for <buildroot@buildroot.org>; Tue, 04 Oct 2022 04:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=7za53tAinXPc/vFNJOR8shRwnYe/vu0nWxgvJx622PY=;
 b=pQplKpkZoEFYM6QqvUcYVPw9OobWL3duOBLNFuPTOUMrZAZLpsy1t9haVKjn2jbcu8
 tssOnTm5j8qS37G5KXndm4PY+z3xwoX8xZXToL/MTZ4gviaMRi5vXpfMshJKhEFlu+08
 Yyf9MA34lFiyOn1SlVYdbtZD3DimNmhjPYxHzoZNCHEEPREhRsbSVOUqzXkb+CAOVNIF
 vLLsxEev1ugpxaMRqS3fuUYbpgay778SZiEVRH3v20T+2rT4Vig6z6M4eDA40HAla2r8
 WVFaGsiGcCiFezaJxzp8PbHjCFjagxfoafdN/1e1RA5b9doRuiA1CLyM3nsQCwrIb9LH
 KKlA==
X-Gm-Message-State: ACrzQf1OH59m2yrzRnAnTXTcx3/pQcEkHRdaZ3DJ5Qrkl0mlHSDFa5gE
 j7k/hy2YWKtKp0oAtmuPOKm4za5f9WvdTA==
X-Google-Smtp-Source: AMsMyM7L4zKtAe0sezihnMJJ2IFHGWNQfbHQ9aIr807898Uya6176bmiRPDpIKNL7F6JwD4srxMPDA==
X-Received: by 2002:a19:6446:0:b0:49a:9b06:f4be with SMTP id
 b6-20020a196446000000b0049a9b06f4bemr9460269lfj.157.1664882134185; 
 Tue, 04 Oct 2022 04:15:34 -0700 (PDT)
Received: from localhost.localdomain (dsl-129-78.bl27.telepac.pt.
 [176.79.129.78]) by smtp.googlemail.com with ESMTPSA id
 n18-20020a2e9052000000b0026acd11cd51sm1222701ljg.59.2022.10.04.04.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 04:15:33 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  4 Oct 2022 12:15:26 +0100
Message-Id: <20221004111528.384625-1-nunog@fr24.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fr24.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=7za53tAinXPc/vFNJOR8shRwnYe/vu0nWxgvJx622PY=;
 b=UcApwCT86mO/pYv4r8p148bnGuCCifYEmiX4vTPD4nX/2fTthBNRFVKkipRHvpqWFX
 w8qsDaVG1ICt41uTnBQtdDcSxbQG5rmLKRNnXthMhi85hnjiLxxR971Oq4OBhhP2th4X
 /LzRJYviSvH14S5etTZWwIzhFmsz7ExkoVd/gnypDy3Ycs7REds4xnp25WgOfdH9Gnvv
 agnzCMLCzc56duzQW3QCmzpxlNkp4vYN9FL/9I27cZwRZsaNDHzU+tly9H4xKneXGxQW
 QdwG1DxA+q++rv1K0SrKVRffoW2j3HtgpOKz5OwqWKotCtZRVI7Xwd+AKZCbIe8/1tA0
 e2Kw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=fr24.com header.i=@fr24.com
 header.a=rsa-sha256 header.s=google header.b=UcApwCT8
Subject: [Buildroot] [PATCH 1/3] package/linux: don't leak host timezone
 into linux version string
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Nuno_Gon=C3=A7alves_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Nuno=20Gon=C3=A7alves?= <nunog@fr24.com>
Cc: =?UTF-8?q?Nuno=20Gon=C3=A7alves?= <nunog@fr24.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogTnVubyBHb27Dp2FsdmVzIDxudW5vZ0BmcjI0LmNvbT4KLS0tCiBsaW51
eC9saW51eC5tayB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2xpbnV4L2xpbnV4Lm1rIGIvbGludXgvbGludXgubWsKaW5k
ZXggZWZkYzIxZWZmMi4uNmI1NDdhNjhlZCAxMDA2NDQKLS0tIGEvbGludXgvbGludXgubWsKKysr
IGIvbGludXgvbGludXgubWsKQEAgLTE2Miw3ICsxNjIsNyBAQCBMSU5VWF9NQUtFX0VOViArPSBc
CiAJS0JVSUxEX0JVSUxEX1ZFUlNJT049MSBcCiAJS0JVSUxEX0JVSUxEX1VTRVI9YnVpbGRyb290
IFwKIAlLQlVJTERfQlVJTERfSE9TVD1idWlsZHJvb3QgXAotCUtCVUlMRF9CVUlMRF9USU1FU1RB
TVA9IiQoc2hlbGwgTENfQUxMPUMgZGF0ZSAtZCBAJChTT1VSQ0VfREFURV9FUE9DSCkpIgorCUtC
VUlMRF9CVUlMRF9USU1FU1RBTVA9IiQoc2hlbGwgTENfQUxMPUMgVFo9J1VUQycgZGF0ZSAtZCBA
JChTT1VSQ0VfREFURV9FUE9DSCkpIgogZW5kaWYKIAogIyBnY2MtOCBzdGFydGVkIHdhcm5pbmcg
YWJvdXQgZnVuY3Rpb24gYWxpYXNlcyB0aGF0IGhhdmUgYQotLSAKMi4zNy4zCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
