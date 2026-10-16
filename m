Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5224CCCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1048681546;
	Fri, 16 Oct 2026 15:02:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 246uWFXx-jIq; Fri, 16 Oct 2026 15:02:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 444F681516
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792162941;
	b=MhPeUzKBBUBLfJL1waeFPmfENscXx8GZ9HJMklaLXtLBrGV6ZkR4g0pz/vWImbBaDbdc
	 W0FF3NNOxtsTU7Fc50g3jBAjh74as14uTNfu+YKMECc5GcKalFW73TwZEepULO7ay/Tna
	 zG19bJc6H+mexIgMPL2fAKHCKEwL092qE0XLDOBj+vG5W6coFV54HuPvT3cWFityuo/xj
	 ZsstixKb7UAH04YFIQ9MNQco58hdC02AW+zjhvDwafbf8x67w5AFJ0wqxBQvNfZcB3DPt
	 ttexM1vAWlqV9qb6M9Hi6YcivZXfMUh8i42Ucq7l6Kfgx4db37p+pu8HNNrRIHU4yAg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792162941;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=EjaNVER1qWQln57jcYmkAEIF4tX0kV/aQ1ar+KjONDo=;
	b=aFHsWksYq5YEZJkfel1DX0KNmVMirp1qbNu75wzr+ei4TqrTD903Zmct72Us1G+4l9eK
	 Zzaj185A6a5z/MeKWqdNfCGIm4c722CsqN0nzncj5d9PiKw4W2yfdbC8RveitlSjS7UDB
	 tXXsrupdkG1rnMSowWO+iBnBELEX09rWKqYU/cO/geWR/RX8aZciSMFVEJT2Gx2w+wW4v
	 TWy5kq0rQ6DAW3tpAOkRPdl8SjIVF3tT2wIt/TLK9PM5NsSZAQE7ZolMQhiK762d6CITp
	 7pzYTgDpcxRHz+HAidMmjd3go84ZIbhQros6BcDcQbt5XRluYjprfcxJE8FUNkUk10w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792162941;
	bh=EjaNVER1qWQln57jcYmkAEIF4tX0kV/aQ1ar+KjONDo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fZgErhnozzAn/hTGLsVuR0cLKQK9s+mcpELKH/Got0m6GtGZCkMC0xu9KEvGmzBVy
	 gx2oKB0Hii5cNm+IkzwtYrpcY3I0Da58eDBHw6RXd6DcF66kLbLmGp1IWzXlGFCCYz
	 UkBYt8IsdUmdJe8XDe0gWLqbjzkjRjV9JeWSNzKAd45opnuUdTNmSBvkp+nMAHIzIh
	 1CK3Kyo6qY+S3f/qhNdUBZBLS18Td3uUIoNXCQQypq2emxVHdfG8odKxRWGxUtR5Of
	 jU59nJblqLAKGx3xeznTfMGkPHWv2Q7yZ1NtveaWz8GW6IsFS8kfwBDDSueXIC4+wZ
	 XxBrlrDyb3ScA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 444F681516;
	Fri, 16 Oct 2026 15:02:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CDA37AD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A80940A28
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zjRkirJje-yQ for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:02:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7C4DE40A32
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792162939;
 b=T9VEr38POxgawZQaoYHStfUIHcUmd5I07uC92knwwKeqNWu0HRnOXSxVFCAfy1nzQLSb
 hgcQA+mD6G6A5d83T5khrO4QiIx94SS7r0TvJe+QzwyxRa+hJBuo1aJ869UTI2x4P7VSZ
 KI+S/BtWTYYlaEwMMXnvozJOBh/WV+HdhezMCmjfL2poBRUN+oo1n+CgJvG1LBMDP/RT8
 ueZAHN7koBDWaln8IhP/heSYDzuKTJyluoN/B6cyg/TSbCJj+WcSTjbZMFgBy7+yv/kYB
 Qx3QwGOOvEZLLGHf33ZZkbKfpqIqJ2wKdm9nA1fBrRkYJ0CufSji7kN+TlIEWw69BTQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792162939;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=l5kzGF4MTtaAHwkdcUQ5d8PjZz70fxQb5K5qF+Nv3vI=;
 b=i+EY4gD5Y3cNLFh31vPNmNUKV382RwT3klBWYsZfIn+LjvaT4PpV0OM+QK5rU0SQI5cd
 huVaTKPfHdTIkhpFk0eyle1BhPxeyEfm21wBITDGTLHnIOPb3ysqe5Xq/uWL4bYo7fgeZ
 CXUF4JATH/lm36JXLzeU7SXTjHCUAxaxv0nqOGyN+bLM/0/u1x5xhVPtSllvU7M7dwAIM
 fNEKyZLqN9vKfFYCnn7AfnPykapTkWW6Q1cbnabHGPGvcUgW6o6scUTrQOeNUdBfybwvu
 xNg2cqsOITMrW+5OoCo14tLSXqwJiM/fFRzvytI/kUgv8vVG3wTEXL8E/43bMhOSAxA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=OpKv741S; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::533"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C4DE40A32
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:19 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6b1aa4d71e7so3406197a12.0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792162937; x=1792767737;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=l5kzGF4MTtaAHwkdcUQ5d8PjZz70fxQb5K5qF+Nv3vI=;
 b=LIaNJ+7qaqJjUBN6Hzo5+gvjO6PCGEkDtsyp+KlQ2sl/x+u0kMunI3kkfhaLWkAvIU
 S5nqZsERfSj9PO+6cPg6LA80W9KLWLBAPYRP9tFqNlYk+WuiTY6/K1NNa4KdKIUTy/hF
 8FVMuDk/orEd+XM7pjcZW1tsrdEUEg/UuvM7znEdsmdlsZ3fBm9idmWOH3bDjwZdxAu4
 6phIexdXHNJNmC3eZMO2RF/tZRKwflh5pNEtIr6k+Xfan6rIn4etXKXvq4syi7OKN/Nv
 wa+vKKPpSdT9tMSuetrVA6E8t1BANXY99mEt/Jzc/lDCuxGhcpARrCqc9LTAa0MRer6A
 1EBg==
X-Gm-Message-State: AFq9FYIKCOsXcqUCdBAJ0uy6SqydVxjmMP3d5BlrRlH9oYK5cDV46yUa
 9Q+AYEd94s5T9tnsPDywRjyTYX8ozWYp8xb4RlMD9Mgs88ExacyPt0mI9MEtgBK49LXqDdnObBF
 TX60djO4=
X-Gm-Gg: AYBFou1K+PTj4+Odd9bguhXKwuvlbTzNPm8w22e1I3uVnSEcD6ZsBlTGVRhhJMGemtP
 APHFbPNfO8haUvAmYMzOpbVBF/h4l4C4CqyXoIkFhWsAgZGiC9vDIhZUOkClJC9lkyiu/bIl+xT
 nDYkJcEwpZwW56ke/xy9LZBl0i4epLAElBmj1CM/423b0FSAMuOZ52VZ6YdA6Mj7CzCtRCOjMao
 B8+olzXvmbtIjLmYRj4cMW0ok/LQvNxOjci7hkmcLLCQ85YXi5uFGDh7LVD8/+h3I4mBk3/7XIV
 kOXjAnGmdQAbYiSITwMsxaLCw/VITANK7K2n++0GHuY70gIaT+mSMXJlRrG9zUrWlbY2uFlGd1p
 kPXuVM4CxLyLcMWh2QjwQ1tAjHdR+qjaOcRbxBMOCQhcY34EQVG5o7gr0uckHEturroryWwVAcr
 1Q7bflojCtkk0GeKmnML/jVRkq/zys40HxaHt8zn0GhU8XC4FSlz3oSvJDojylDgLqbZNFIPZPY
 ltWUinueD5natViEvKOJIk6B9sBn7QyJ+jBWfDJsaStr/chCcR/
X-Received: by 2002:a05:6402:2354:b0:6b1:bcde:9f32 with SMTP id
 4fb4d7f45d1cf-6b1bcdea1d6mr13153637a12.7.1792162937231; 
 Fri, 16 Oct 2026 08:02:17 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4f8bb6sm5954163f8f.34.2026.10.16.08.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:02:16 -0700 (PDT)
To: buildroot@buildroot.org,
 =?iso-8859-1?q?S=E9bastien_Guillaume?= <sebastien.guillaume@vendeeconcept.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:02:13 +0200
Message-ID: <20261016150216.60418-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612121516.1634-7-sebastien.guillaume@vendeeconcept.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 06/11] package/nano: add CPE
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
> Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/nano/nano.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/nano/nano.mk b/package/nano/nano.mk
> index a1b94c90d8..4fca0db80e 100644
> --- a/package/nano/nano.mk
> +++ b/package/nano/nano.mk
> @@ -12,6 +12,8 @@ NANO_LICENSE = GPL-3.0+
>  NANO_LICENSE_FILES = COPYING
>  NANO_DEPENDENCIES = ncurses
>  
> +NANO_CPE_ID_VENDOR = gnu
> +
>  ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
>  NANO_CONF_ENV += ac_cv_prog_NCURSESW_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
>  else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
