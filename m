Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22685CD8CB9
	for <buildroot@archiver.kernel.org>; Wed, 10 Jun 2026 08:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3FAD60861;
	Wed, 10 Jun 2026 08:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pa2-3gS8K3kP; Wed, 10 Jun 2026 08:40:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2BCF60856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781080858;
	bh=/lD2em88F8cSQrAUC/KKdIrc2JD52g7GKPnN6XdMs9k=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jAKTjI86Vr9EJCTGCg/rWSTNpr5pD9s3ONU77aPSlBuc+gG81W8OrIzdvSrjah92r
	 ex/aQmjpMQ64ckzL6vssLZWIF9aApHkGXTvflJcFjB5GN0IfZFP4r/sK8YSQZL06RS
	 72NT37FvAYeiIC4nwydmIzVXWMUWUBeSoPTESKad4b509a9QnyWrm0zl1EjIFskCJb
	 6ujePknJOjhz/BSt2jFlVMnNjZ3ZXXzGJ9ZvNlL9D6ZvcpsPva+Ox+Ru/Qyc8YCj7N
	 OpjdrwCT2wkkpAiP0N7rVGeOzdHrDhACERFj8wYjSqohZMEGy2/hCsIZBOXXQNcQRk
	 cBD4ceBBX75Fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2BCF60856;
	Wed, 10 Jun 2026 08:40:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 83647196
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 08:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6836281A99
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 08:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KROh4apgQqco for <buildroot@buildroot.org>;
 Wed, 10 Jun 2026 08:40:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B9A0F81A95
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9A0F81A95
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9A0F81A95
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 08:40:53 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-490ac357c55so69311975e9.1
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 01:40:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781080852; x=1781685652;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=de2CQyp7IvoYYWV8QmCC/QSpyzH0sw4aiHC/CrKg3l8=;
 b=RheOYArrTzUxZeSUXPQdw5QctfYuw/J2O5sNAa3b7mM1gCvTroTfZhqPzQJKNq19Bk
 Bp0+BFVv3jc6jzNK7vMMxaPCwudV8C6u6FC06pD8FQT4ldSGZNnNsoL1YClTYDhH+Teo
 1fG70+lXZBHbEvSKhWb3PHxTxEsCearvmrR7tajPvMdJdSgCjmU/UN2UR0ReuQaB13Ir
 haiaN2jPmvi4JlUnw9Zt0omGI5BCabymI3KsNbSqcaAHjaXnkOJlybEHyHHQ7aI+BAZK
 kDU1DiIMW4C8DkPoY50TkZUINgq4gjCpvGu/fRYvc11DmbZAts8/6vezYvFt1LQmNqI8
 lZgg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+WisiBoeQh2fV2QPy7n20ItjhfaZwBdXJfsevls+qpAgzJ8Uu5/Gu5g7bTQerPdfTk71GdOmZbeuc=@buildroot.org
X-Gm-Message-State: AOJu0Yyg/6Gj8nEOlLMzJUlV+90itEzrWjXa1fDmnukJ6yes6Ic5Nd7I
 ocu4K5kFrGfqqnIr5AjZ44mSvhThAs0YxGRI+qw9qHXZ/XE7AEs1qt/KMNBaOtfTHkM=
X-Gm-Gg: Acq92OHekmu0SxM9w7y+bn/7qYHDECa4TIWXZWo0MkkWY54mFs/KzprYIPb6MDogsAG
 ISkFMM7WdF3KyEjC+/E43aonbd8PF5dgegNptVIcDnU6VTTMqHn90zp52hmorbMtwDrcfXiez+3
 xcRpj3SPSgM/y4lx12oxAMZ4YND8Gv6iQHxtLijd3P0pGsqmFZCkRna1Qq4FynkL6buy+NjYmKK
 GXTgd20cuG+1zyn6H6SF7FZjDZETP/WbJuMZCMSqyPBji8camnchlc8bvvI5kpnt+2hLuQFpsZb
 8PxbafUoq7JHAP3SYg3VS2S4MhNthfreM0wqXZFajSrjHZmIYLty2metSC0N5Q+8Ro0zuxvyuYG
 uEVIWGF7B37yRBe3QtzVNAs5tz6UF+HoX4o7SL5w6e+USLxugGeClBSAggy2STLVTmRodZGcAo+
 XiLwBbe2U6BByCUVcunO4kzQcAbA==
X-Received: by 2002:a05:600c:35d4:b0:490:b8d3:5dcc with SMTP id
 5b1f17b1804b1-490c25e4634mr404514475e9.19.1781080851910; 
 Wed, 10 Jun 2026 01:40:51 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f35fb24sm74800001f8f.34.2026.06.10.01.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 01:40:51 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 Bernd Kuhls <bernd@kuhls.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin@orange.com>
Date: Wed, 10 Jun 2026 10:40:25 +0200
Message-ID: <20260610084025.103446-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608221416.919015-1-titouan.christophe@mind.be>
References: <20260608221416.919015-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781080852; x=1781685652; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=de2CQyp7IvoYYWV8QmCC/QSpyzH0sw4aiHC/CrKg3l8=;
 b=IRFaLRol0FWRcAH+G4hxtl3Qe/3tyEEUd21s4OmgTsvAkpzXB2g0C91JUHWXjcigTo
 I8smvkN7U4LP+G7FpyVY/uv03hGBIpvelMAAQpDlluHxP5qwlc10UpvTnhgiOzIM0Af6
 rLSxFlUj8x4/KxiZcWCRaQq+CFI0qdwWD0GjQWWVDQA3htRs8l3R1jfgLvomKmPZNLLr
 NCCsq7kRx446q+x6Y6H8Q5ZHR5WPv93JxtuZpugOTCa6CvEYo+egoBkJ+knsspmrRb6e
 I+V03gVMAGucdTBAtcIEbtYDYllYvdqoagnEmeRmUiDhWN2yRn3HinrirAlpg95n9TTt
 QJCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=IRFaLRol
Subject: Re: [Buildroot] [PATCH 1/2] utils/checkpackagelib: add new check
 MissingCVEPatch
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

Hi Titouan,

In reply of:
> When manually patching a vulnerability in a Buildroot package, it is a
> common practice to mark the corresponding CVE as ignored for that package.
> This is done by appending the CVE identifier to <PKG>_IGNORE_CVES, and
> adding a comment above to reference the patch that contains the fix.
> 
> However, as packages get bumped and their patches are added, removed or
> rebased; it happens that IGNORE_CVES get outdated. One important issue is
> marking a CVE as ignored, while the corresponding patch is not in Buildroot.
> 
> To detect such cases, add a new checker to checkpackagelib that finds
> occurences of:
> 
>     # 000x-some-patch.patch
>     PKG_IGNORE_CVES += CVE-XXXX-YYYY
> 
> where the file 000x-some-patch.patch does not exist.
> 
> Assisted-by: Claude:claude-opus-4.8
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

> ---
>  utils/checkpackagelib/lib_mk.py      | 35 ++++++++++++++++++++
>  utils/checkpackagelib/test_lib_mk.py | 49 ++++++++++++++++++++++++++++
>  2 files changed, 84 insertions(+)
> 
> diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
> index 5d48e8929c..9c19e5acc5 100644
> --- a/utils/checkpackagelib/lib_mk.py
> +++ b/utils/checkpackagelib/lib_mk.py
> @@ -6,6 +6,7 @@
>  
>  import os
>  import re
> +from pathlib import Path
>  
>  from checkpackagelib.base import _CheckFunction
>  from checkpackagelib.lib import ConsecutiveEmptyLines  # noqa: F401
> @@ -117,6 +118,40 @@ class Indent(_CheckFunction):
>                          text]
>  
>  
> +class MissingCVEPatch(_CheckFunction):
> +    PATCH_COMMENT = re.compile(r"^#\s*(\S+\.patch)\s*$")
> +    IGNORE_CVES = re.compile(r"^[A-Z0-9_]+_IGNORE_CVES\s*\+?=")
> +
> +    def before(self):
> +        self.pending_patch = None
> +        self.package_dir = Path(self.filename).parent
> +
> +    def check_line(self, lineno, text):
> +        m = self.PATCH_COMMENT.match(text.rstrip())
> +        if m:
> +            self.pending_patch = (lineno, m.group(1), text)
> +            return
> +
> +        # other comments do not break the association between the patch
> +        # comment and the following _IGNORE_CVES assignment
> +        if text.lstrip().startswith("#"):
> +            return
> +
> +        if self.IGNORE_CVES.search(text):
> +            if self.pending_patch is None:
> +                return
> +            patch_lineno, patch_name, patch_text = self.pending_patch
> +            self.pending_patch = None
> +
> +            if not (self.package_dir / patch_name).is_file():
> +                return ["{}:{}: patch file '{}' mentioned for ignored CVEs is missing"
> +                        .format(self.filename, patch_lineno, patch_name),
> +                        patch_text]
> +            return
> +
> +        self.pending_patch = None

I havn't thought about solving this check like this but since you are checking
for the existance of the patch file, if the patch file exist you can also
probably read the content and check for the `CVE: ` trailer presence in the
patch body.

Best regards,
PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
