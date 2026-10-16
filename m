Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1098CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8E2840ABC;
	Fri, 16 Oct 2026 15:03:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hvElLbA1hrnC; Fri, 16 Oct 2026 15:03:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9275240AAA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163012;
	b=GMhJSKj1tLDUGM5kBZW8nnl5g5uqlmSrqzneSeH37WuP1I8/3PFlapNK8T+OOLq8NOUF
	 zPGXG/zOcNNueT56jc/LxAAUn8xC85ZujD0q5oGVEPy3ynyZVlHSVtAHGsRSWEQ98+Onn
	 0DZ3BsSr0PtNpmTu61R2S9UIhKyboDUkhLMYSeDAc2lqXnW27Ad7BZTXZw9hjtuabA+a5
	 vPrah/Fn2dNIl5ZALfKgtBLb/Vl+08GBXtCgNJSknuA9e6dPa57kuNk6hqgzfW3G6H268
	 il6vwojvMX6d/8r/ELucNJxbZTSoYu8KoYFCvcm47I2L24zOtI2Y1mIaXYGdKK1ovDA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163012;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=7Sw0UDS6THZURhnDB5itOOUCPgquQvG1FFdZcFACrFk=;
	b=kqyj/Jq7Kq5ckbAKV1WjZbHrF9Z+DSACbjac+1TNPQ3RslPD0OKatQrAfN+b0psyQRxY
	 O8Ivf+OIVDmzDhIuJrkcNE3cM4JnSiY04l8Pcx+TQpcBd1UfOh0Ywbp+2mHsnEWqx28OK
	 6OtgXfb+wwnVhL0bqfVzG2Uy1brxJViESX44D7RuQVuUrb1nT7iDjqS6PO6ZcLuC043vl
	 9MH2MrobXsPsbbCEOAJ4Wtl6B6P8UnjZzGECmlc+r5F8eSXWOjEidAdWOxdQUp5WfB5Et
	 K+iCie8HkB5n3gTLso972QGkdHPezHo3HGKdQhYU7Wzy+HIOQRWeDcQs/imXCefSffQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163012;
	bh=7Sw0UDS6THZURhnDB5itOOUCPgquQvG1FFdZcFACrFk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PZI2hccq6aDRk/2P/wC2AyAmZh99JI1YRhb28d1beQ+mZZpR8SBK6J9o4YJgANm/X
	 jjCW7JnpxLVux9vcnjBAlA59Z1EIT8l/9MNYax4EyZzawgJ6r6aPEDbqzbpXppmC2a
	 ZNXgIo8fxon0gWA6ccofGQ7SrF3bG4Gexn82qSo8+beRKpHQNUCrFvVDwELgVpKZxB
	 Cg/ZGFQGN1nZcDjkY9NnrLFRHr6zlgoCfxMR9eXWPsXjSbQ2Ob3W5yzB2W+aSqfV13
	 H7nRfTm4WlG6UZVQ+T/DrtZ/0v9UqI1M54AZ9l6dxoLWwlBRN0KOhvOZhnCR4+fx/H
	 SfCOgrKJAynrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9275240AAA;
	Fri, 16 Oct 2026 15:03:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ADDA17AD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FA7B60B29
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id asyGqfHiO84t for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:03:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A821F60B27
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163009;
 b=W86u0gLjNnS5KO3EWKYufEzTtEkDWQqrWXKDuGjvcDYwalHebB/RaYiMHyEToT7cbtkT
 88dy3nrOcaCldtlIyi6fLs8ZQSvnkd51dKejY0AIj0IynSLHoKOrZnPcluY2dB+SQhofr
 890ylqGFK/hbxsEg1uL0MCHs9O2dnRJg51g0ufzxNokz0BcTbNC2H609ior0bxRJykTBM
 XYdzsWo70arcLDVRE2d5C30zPKrA+ByNsRBCFZ0jwWWvH/RxFTkH4TlT0F+LQ/27+ma7t
 HrS/Yw4jmu4vqcz9WkicMHd30MEaEtQwhUperND/WrqlJqNjp6Xb4rc1st0QNpfuZxQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163009;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=eZZLZegV/psG154XDDwDgsDGrAkPFIXP75B/3EW2/m0=;
 b=flR4jQ1/XpK1KlTKHoN8HYHDpWL4XSAdnukbviSHc+ZKoYdVRIlNbJzSPCj3K96pE/3k
 Gf960UNDiBs+gL/2JBiWGroCyFwiYERpJzm8XaGlnINh3UJ49SUCaeKRw8FSD26qUV2jk
 ienOIQN1H7Lq67kFpCT+Aw3HixQbRmmkPNRicCF63cEqik2ERtl8NLtpmnXQ+qJro9joS
 XhnKZ8MAzx3gDl0pDzhfIJb1PVeR5lR71LNQ2ZD+95hfnS/LMbijoBR7DAtOG26spobTB
 rCxLMg3PybbcHQRtNC3qwH0TfTep9VyXXgRXwhtM5hnzS11w+lRTQoQKq4xh8CCRCUw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=VWE7oaFY; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A821F60B27
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:28 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a021c809e3so640665e9.0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:03:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163006; x=1792767806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=eZZLZegV/psG154XDDwDgsDGrAkPFIXP75B/3EW2/m0=;
 b=Wlw8QYD5n/MMHL/SBWfCnjSoaBWTduFa/8O5XTiYtDu0Ljkzot+bhJyVwj6iusgIlh
 WWSPS82+m6eBU2T+dJWrRh37VuPxatVDPKEmgDGhlDr89H4zVHx8esdmizl9kBRNWKEi
 1QdQyluJMZY07rQbKl4kOlEzx/v9UltcNJd2KCC0FLxWkjgkKPWO0tVyzwNUDMCqiF9k
 7xbjH4tKmJGzX429JB3iHjkLvQhQelgTgXtMhz5Ti11lN9H46D9AwEiWc1mDnFsyh0mA
 MwDBpEhQT1/QvBO92WOkQOe0SiuJR5eEDHbQwmIx6VGfOxunox/AV3LQFon9co4+KtWy
 Dv0Q==
X-Gm-Message-State: AFq9FYLh8vcDoXEiOSeOvaGJbGRfoa5TcEGFNZHEcJdyJqgX+P5mGBBi
 lBfFYS6jcga62BG9mldwVkMAnwp0UZKa3bmr3uRXaL11uXyLWkjuKEFHqfTiQwhWkLNfM2VIOC9
 qszVv3Dw=
X-Gm-Gg: AYBFou1UKnDMQkNYFZvxnsC/yfOmAFzkk8+cHb+8MtOboL/BZCLpAYzI1BqfwbfxJWK
 dqnUCR54v38snjv/4dhXRJwaHqoNkl9UgYVq2xLiA+msISov4/cHYwfk8/NfRS9h1s2uNiNTDbA
 mk2jGhnLqDZlIz2aZFNHHWWcdeQT0BNp1sRQ7raQG5RnhYaRQkqqMcAHc6NvRGIs9OCzzJRNIka
 e/iaGJIyeeDM4mBW9E1xjVcOO+WhFJrLS4oImZ48qM40mvnyD5azzAgAAHfcyXGajIWIV6WNuYs
 aoql/LLeqgkgKAFLVN2W4pLSBTBy5D6Ocxt7gaNdt/2h4qQulVrU9V/X99eYt5aqXr4ynXhhTXO
 Un6TtHXdgimh0Lfq9tpds0MwI20wjlBkMnu1lrDJdh6rBsn4gVEzd2Gc5lRTgVUJFR2YQpc88tv
 g5Q/fqStagYzaU5uQ7Bf1E1T8aghu/JNPmihruM1yH+cdgD1S7+es3VwQ5kbaWFAIeR59VTY1oO
 p4VWE+8Ovtstw/9u7B0EWguDgXBNgftnltyZ/U/Xg==
X-Received: by 2002:a05:600c:4684:b0:49c:cee0:e7c1 with SMTP id
 5b1f17b1804b1-4a1d76001e9mr1496285e9.16.1792163006156; 
 Fri, 16 Oct 2026 08:03:26 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1cdf2f0d1sm29086355e9.2.2026.10.16.08.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:03:25 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:03:22 +0200
Message-ID: <20261016150324.65525-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260918091142.62239-2-thomas.perale@mind.be>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/3] utils/checkpackagelib: support other
 identifiers than CVE
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Currently the MissingCVEPatch check will complain if another
> identifiers than a CVE-YYYY-XXXX is passed after the 'CVE: '
> trailer in the patch header introduced in [1].
> 
> If a package 'foo' defines the following:
> 
> FOO_IGNORE_CVES += GHSA-abcd-1234-efgh
> 
> And correctly references it in a patch header:
> 
> CVE: GHSA-abcd-1234-efgh
> 
> check-package will report the following:
> 
> package/foo/foo.mk: patch file '0001-some-patch.patch' is missing 'CVE:' tag
> 
> While we could argue that GHSA identifier should not be present in the
> 'IGNORE_CVES' variable, it's still valuable for users to have a way to
> correctly ignore and link a patch for their vulnerability report.
> 
> From our point of view it allows us to track GHSA vulnerabilities that
> could later be assigned a CVE so we can update the IGNORE_CVES variable.
> 
> This commit relaxes the constraint on the 'CVE' trailer to just check
> for the presence of the trailer in some patch.
> 
> [1] 1167d0ff3d docs/manual: mention CVE trailer
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> Reviewed-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  utils/checkpackagelib/lib_mk.py      | 9 +++++++--
>  utils/checkpackagelib/test_lib_mk.py | 5 +++++
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
> index 065733d464..c5b85bcda9 100644
> --- a/utils/checkpackagelib/lib_mk.py
> +++ b/utils/checkpackagelib/lib_mk.py
> @@ -121,7 +121,7 @@ class Indent(_CheckFunction):
>  class MissingCVEPatch(_CheckFunction):
>      PATCH_COMMENT = re.compile(r"^#\s*(\S+\.patch)\s*$")
>      IGNORE_CVES = re.compile(r"^[A-Z0-9_]+_IGNORE_CVES\s*\+?=")
> -    CVE_TAG_IN_PATCH = re.compile(r"^CVE: *CVE-\d+-\d+$")
> +    CVE_TAG_IN_PATCH = "CVE: "
>  
>      def before(self):
>          self.pending_patches = []
> @@ -136,7 +136,12 @@ class MissingCVEPatch(_CheckFunction):
>                          .format(self.filename, patch_lineno, patch_name),
>                          patch_text]
>  
> -            if not any(map(self.CVE_TAG_IN_PATCH.match, patch_file.open())):
> +            trailers = [
> +                line.partition(self.CVE_TAG_IN_PATCH)[2].strip()
> +                for line in patch_file.open()
> +                if line.startswith(self.CVE_TAG_IN_PATCH)
> +            ]
> +            if not trailers:
>                  return ["{}: patch file '{}' is missing 'CVE:' tag"
>                          .format(self.filename, patch_name),
>                          patch_text]
> diff --git a/utils/checkpackagelib/test_lib_mk.py b/utils/checkpackagelib/test_lib_mk.py
> index 21effa9489..ba9dbd6aea 100644
> --- a/utils/checkpackagelib/test_lib_mk.py
> +++ b/utils/checkpackagelib/test_lib_mk.py
> @@ -239,6 +239,11 @@ MissingCVEPatch = [
>       {},
>       'FOO_IGNORE_CVES += CVE-2000-1234\n',
>       []),
> +    ('patches present with other identifier',
> +     {'0001-some-fix.patch': 'CVE: GHSA-abcd-1234-efgh'},
> +     '# 0001-some-fix.patch\n'
> +     'FOO_IGNORE_CVES += GHSA-abcd-1234-efgh\n',
> +     []),
>      ]
>  
>  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
