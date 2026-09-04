Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83898C61DD6
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E1F660C17;
	Fri,  4 Sep 2026 12:17:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6qynoS5ixPu4; Fri,  4 Sep 2026 12:17:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CBE1160C06
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524236;
	b=mty857At0MRtweljH8ADp1FKYr7oGMJ+4Ts4mLTWBjAn6pzTDm5fwY6SbaMcFD0Eg1ts
	 45etCvW8o4/+VpHhiRPHiLL852qjDz5wq+cdefZiofh3uiQX7RQcn+sQkjof3AoZ9epxY
	 qrcBDDbvWBQwT89wh6STGUK2Xbe5ymVNbundtmyxXAVKjWHkyGc0doqbPPRBkcZUISmjg
	 LfuCV9G3wWMmdYv2GU2MLOgtSNdAxTNfyB2O6H9V+rZuJ56pUbYL1It9HXAzQPWVI8hM2
	 lvA89+kDUUs8rYWbY6Eq5WXpO2OZv7OBFljrzc4kl9OW2pYqszJXf0ZGwBb7DUaIXCQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524236;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=hFpTTSc6lG3WMx4KMNi3OtlzPADsUIf9MnQTSMQ+Ijk=;
	b=JxUTi6aC5RfdEcPcZPvNB5WKOVzUqkzis8z5KzxSFzY+tFR2Caqj9W2wntSQEAWaufkh
	 Cqb8AvuGaWEeoeYnhW7UxXCdu9nKdBZBQyff9gzYT+xFVmLrxvdSHF1AskwyF34KVsQZI
	 GOgr5ErhWyptRORlOBej2LNaS+BZdMYj8vQcoMhAqWeSMnuQvD4/XfyWwm8ZTWD4uDQGl
	 fjENr3qqO0OoZmQZbGD0KoWH5bYD/H+tEl8uQ+svNDjItv8aYmdPZ8/zebXxHzJ6VrjBO
	 OfRZyFrSifCFg/o3Z9Z53CCG3VbgAuBVKlvz36/DBCmXBS5Mf6mTvVT+aBqN+gzpUzA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524236;
	bh=hFpTTSc6lG3WMx4KMNi3OtlzPADsUIf9MnQTSMQ+Ijk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PZfIohgRXQ5Q81gZdkFEpBRLxIJ0ljZLkDc6P3Nif51MpRdhD455S7wRl3extf0e2
	 b2bk4HztNVka2ep0Sdp7VlEJWr1VF24kxPKcfg/vVkp9HH/AwhrSXokY0X9SO+F2TA
	 QkW5XVgS/MLQnuoWmQxkx6jeOmC2FrWlssUqFqPJxwVlXVkdwiRMHn9IEKK91katLM
	 SZsy9ydPjKdCJUYTCjw56oTRkEw/4ZzmLPd6SGdlS3DaMwk2oeJVFtNl6zWDLSrt2T
	 pDCJ1FnzhKc+uD+Lm9nbOdKAjObLp6b7phvIgir0aAyQrIRHiHAYaHJVNSwJ8I+DQ0
	 /uVn6K/UaDFOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBE1160C06;
	Fri,  4 Sep 2026 12:17:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4520DF14
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3650181172
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H7YIDkNIzJfv for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:17:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 082B881174
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524233;
 b=UJRqgpq2abK3QWCO0jvgJ3X5ca3H3HY9Df1r4EGeu9KC+qKQMwTEty1fGGSHF30OoeUs
 qFbe612udue+40XNVy72EF3JS3yZHpiVt+flOyz6R9wCo8ZrJxU4HQyZ/fXD/8Gl3bLqC
 H3dmXrM/ZuDYOpSzBA2CjC9j3fUlfF7hmY4YBFx7pzwjyW5Etm0HQLLBv/HfXwpl7f87H
 I1WAfU7jI74/OesPIfyFWnjv20jRjw8oSwyPcE4J4rpc0LI+S+eYwRUNc1XoGZvooFQ24
 fQOVqj7ttr3PGUv8uV9xHTdgjN/H0ZDq5dL4JQiIXEbMJiTHLtMP++CtAD+W/r/MzKA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524233;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=m+07dEc7gTSiNtw+0+sjZOAU1lijDIkfuMFSKYOVjNE=;
 b=dWIq+uYasRKGW9C7g18znVhaTA2yJCu7jU6DptZzk7KFRZgt25bGsnBuxwc9CdJp3J2n
 n1oFyK9BMAbhrCu0/dDppXr6/WY1kd/Gm0q4Vtxr1U2TUbo6Zq75R3X5PlHBQNhYromA1
 p9hWL4Ohej+NsnlgXFAkZ0QQfpI8cmr+f3zg3M713wE61SfXHNaO/zcOBfYEUxEc/Vt7i
 wxR6h5evv8DL5PUwnoMGHfNdUWzouFAtSsqksc5SsR+nj+nOOb/XPw7VFx7hhmiy6l1M7
 EFVpzpMxQGEq8u/nAFuPtcYfl5rdb9czulW+V1DcKlYO6pxMqpbNigA0EPKdkcGCOeA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=CQ4IfaOg; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 082B881174
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:12 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-49b8eeb3ff2so8679455e9.2
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:17:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524230; x=1789129030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=m+07dEc7gTSiNtw+0+sjZOAU1lijDIkfuMFSKYOVjNE=;
 b=RpZak78Fq5vR9v0HhI35ItnyfckPWFSMl43YX0rgzQ0CI+KQONJHgVUQpq/Cv9xbiE
 C+tk5QG2Gdfax1kaDgH2A/dctqb8w1tGrcsjJizie3DKegRi192DZqUcMTNnUs3R07PG
 iarq/EjlOCMJI36GsbVLvINPxev9nG9CQ3wDup8Qggu91BNt3BjAmoOzY5iwJan9ZeeV
 BlAwMjyfNw8AEvmT9achnHRW6E1QecNpLzkctKVvi6mtry0tHf9pQFfSmHlcsuK4+S8n
 vHO9oKiOEEsBKStnlxRSl21Rj5WmxoyZHY7Tf26hRmmRE7IhyXm+pL7YJYGsxZLJO6/p
 8VkA==
X-Forwarded-Encrypted: i=1;
 AKwUvByUi70P5rgDtq5w3/KmPN/n8Duc26EG4kIouMCZJ7+slaB6xH9+dOmNsNjWwAmPwJiCSzIahEGQeG8=@buildroot.org
X-Gm-Message-State: AFuF++mX79TqNbxi2X3HH+g0MkGmhqKT1cLYX81LpCp4eqDugIE52E4k
 WuLeCaGhs1/0ABbrz61MrDAsWpbb/DbVWDtPMX9mjAbCcFuztiihwSujVEcWna0RaJE=
X-Gm-Gg: AYBFou3mCO6/nk58aA9XXJbZQVmNWaCmvnyCvT9QytV2EvenGxc72luzgAFD1H6OsrN
 GgdPice1meXnHBr45uyirofqXSE5h6/t3yaCq98sKilXZAaAmMPmLfMjcrIJ4Nrsjg2geaxs58j
 QjgrRLNOn9OFLQjj+XfS0mAhNjxIccW0NTETiIIJED7wHMU61Hrm7dIEBv+FAQB/u+pLwUAxMZG
 8HgjMSZxtjc+w9WJqd+JCaiRZV24FCGDxj/akixGyL2hhU5aRa3lIoFswFwT39e/gKfED0/yn4s
 fKS2mi8UXWu8gr3o2ly0BM5Ayy1n2OI/uCWCxsTqDHJlZCTCS3yo5pLSjrnr5j1L1UqdBVj/+GG
 3SgJewrgd3u3UQnjpG5+rvDrULx6YIyrOAPsoAHtLH7tRKaVPpITj2J8GH4DeeltYaqmlIw1fhR
 QJg7pH9eEs5c8fIFeWrZvgS+EaVDiYdwFTY7WEC9JT2oLezTplV3YL7A==
X-Received: by 2002:a05:600c:5492:b0:49c:fa21:e73d with SMTP id
 5b1f17b1804b1-49cfa21e877mr35265405e9.19.1788524230416; 
 Fri, 04 Sep 2026 05:17:10 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf771e9absm67062145e9.9.2026.09.04.05.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:17:10 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:17:09 +0200
Message-ID: <20260904121709.403421-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902131640.379588-1-titouan.christophe@mind.be>
References: <20260902131640.379588-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 for 2025.02.x 00/15] package/clamav:
 update to upstream LTS
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

In reply of:
> As indicated on ClamAV End of Life policy webpage [1], the 1.0 series is the
> previous LTS (and therefore unmaintained). The ClamAV 1.4 series is the current
> LTS version, maintained for 3 years. The latest release being ClamAV 1.4.6.
> 
> However, there is a breaking build-system change in ClamAV 1.4.4 [2]:
>     "The minimum Rust version for ClamAV 1.4.4 is now 1.87.0."
> 
> Unfortunately, Buildroot LTS 2025.02.x is still on Rust v1.82, and therefore
> building ClamAV>=1.4.4 fails because of missing features for Rust.
> 
> Consequently, this series:
> - Bump ClamAV to the latest LTS version that can be built with Buildroot
>   2025.02.x, which is ClamAV 1.4.3
> - Backport security fixes from ClamAV 1.4.4, 1.4.5 and 1.4.6
> 
> [1] https://docs.clamav.net/faq/faq-eol.html
> [2] https://github.com/Cisco-Talos/clamav/releases/tag/clamav-1.4.4
> 

Applied to 2025.02.x. Thanks

> ---
> Changes v1-v2:
>   - Removed patch 03/16 from series v1 which didn't work properly
> ---
> 
> Titouan Christophe (15):
>   package/clamav: bump to v1.4.3
>   package/clamav: add patch for CVE-2026-20031
>   package/clamav: add patch for CVE-2026-20217
>   package/clamav: add patch for CVE-2026-20213
>   package/clamav: add patch for CVE-2026-20216
>   package/clamav: add patch for CVE-2026-20214
>   package/clamav: add patch for CVE-2026-20243
>   package/clamav: add patch for CVE-2026-20215
>   package/clamav: add patch for CVE-2026-20244
>   package/clamav: add hardening patch for TOCTOU issue in quarantine
>     actions
>   package/clamav: add patch for CVE-2026-20345
>   package/clamav: add patch for CVE-2026-20339
>   package/clamav: add patch for CVE-2026-20346
>   package/clamav: add patch for CVE-2026-20347
>   package/clamav: add patch for CVE-2026-20348
> 
>  ...-panic-when-scanning-some-html-files.patch |  240 +
>  ...ix-pespin-cleanup-bitmap-tracking-47.patch |   46 +
>  ...ack-triggered-rebuild-pe-overflow-49.patch |   90 +
>  ...e-installshield-extraction-limits-55.patch |  126 +
>  ...av-fix-fsg-section-loop-underflow-51.patch |   40 +
>  ...rser-robustness-and-scan-coverage-63.patch | 1503 +++
>  ...v-fix-7z-substream-count-overflow-53.patch |   40 +
>  ...8-fix-32-bit-dmg-mish-size-checks-65.patch |  136 +
>  ...rantine-actions-against-toctou-races.patch | 8117 +++++++++++++++++
>  ...-partition-name-conversion-index-103.patch |   37 +
>  ...in-rebuilt-section-size-overflow-101.patch |  224 +
>  ...guard-pdf-hex-string-newline-skip-98.patch |   36 +
>  ...-harden-mach-o-section-validation-96.patch |  149 +
>  ...xar-limits-against-inflated-toc-size.patch |  277 +
>  package/clamav/clamav.hash                    |    5 +-
>  package/clamav/clamav.mk                      |   42 +-
>  16 files changed, 11105 insertions(+), 3 deletions(-)
>  create mode 100644 package/clamav/0001-fix-possible-panic-when-scanning-some-html-files.patch
>  create mode 100644 package/clamav/0002-libclamav-fix-pespin-cleanup-bitmap-tracking-47.patch
>  create mode 100644 package/clamav/0003-libclamav-fix-aspack-triggered-rebuild-pe-overflow-49.patch
>  create mode 100644 package/clamav/0004-libclamav-enforce-installshield-extraction-limits-55.patch
>  create mode 100644 package/clamav/0005-libclamav-fix-fsg-section-loop-underflow-51.patch
>  create mode 100644 package/clamav/0006-fix-alz-parser-robustness-and-scan-coverage-63.patch
>  create mode 100644 package/clamav/0007-libclamav-fix-7z-substream-count-overflow-53.patch
>  create mode 100644 package/clamav/0008-fix-32-bit-dmg-mish-size-checks-65.patch
>  create mode 100644 package/clamav/0009-harden-quarantine-actions-against-toctou-races.patch
>  create mode 100644 package/clamav/0010-libclamav-fix-gpt-partition-name-conversion-index-103.patch
>  create mode 100644 package/clamav/0011-libclamav-fix-pespin-rebuilt-section-size-overflow-101.patch
>  create mode 100644 package/clamav/0012-libclamav-guard-pdf-hex-string-newline-skip-98.patch
>  create mode 100644 package/clamav/0013-libclamav-harden-mach-o-section-validation-96.patch
>  create mode 100644 package/clamav/0014-libclamav-enforce-xar-limits-against-inflated-toc-size.patch
> 
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
