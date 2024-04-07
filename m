Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD40CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 19:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C50340B04;
	Sun,  7 Apr 2024 19:48:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kYmwgH308k_C; Sun,  7 Apr 2024 19:48:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5880640B06
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5880640B06;
	Sun,  7 Apr 2024 19:48:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C10201BF473
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9B4E81D9F
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:47:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AT6Q6wPXAyjf for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 19:47:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AE07081D73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE07081D73
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE07081D73
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 19:47:57 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d094bc2244so39379451fa.1
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 12:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712519275; x=1713124075;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eCLiRaAlo6Qnj4e7lF4PaibeWaA4Vv8kBa0QLig/97Q=;
 b=WeFcdO3FRiWnjYNr6uWq61wA1418FFbu04gioRNpDB/zo1c86otLm2mJBDbyGkdz5Q
 ZeV/Q+OvKFyToDWdJrqmLcNv32PPoYOhnTB4pxBgHqTgT2pOTdAkmy/cUP1tEVqjNqax
 WC2y6vCvTvv3zcZSFlVk9tjM9V2bpoL1akttKY8j1S+MYc2OKgqD87dy4sVNHHFFG4zu
 +QxfSrNrsDckQBlrVRs38MMn2zUkpPMWR/D/i9mh1Cf5wkXmOUypBffIW1FR0DyuAATC
 whc9f09bhW3Ib3d7lkNDGXq415hnYzErIm1nz/irDf8jILgmza4iS31BwJUkRrHvGfjQ
 4wvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGKCW0SSuXLQCQe+C9sI7JCXeb0b9We+jb/h0UhiNq9EtLZqMvomz0qI8djO7C02K32Wd0U5i9E+80ifjCnmRB326IucOCow==
X-Gm-Message-State: AOJu0YzMIFqtqRvSv7MhbWJdpTU/9gzUP+ti9jMinXJsIL5fIiW0nByf
 0P3vxVyETUKBcJ4R05dmhozArMzZSWQhlOcT8jod/Vmt9ZrVedftL8ZP5j1idpY=
X-Google-Smtp-Source: AGHT+IHyVFaCfzRl5AufgT5mgWA5e0iK7/gm3fWzgC6YUNan5uz6ZCSq10dWSEfPha3qDf4/NxorYQ==
X-Received: by 2002:a2e:90d6:0:b0:2d8:729f:cf3a with SMTP id
 o22-20020a2e90d6000000b002d8729fcf3amr3765546ljg.32.1712519275390; 
 Sun, 07 Apr 2024 12:47:55 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 fc9-20020a05600c524900b004162a9f03a6sm13955601wmb.7.2024.04.07.12.47.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 12:47:55 -0700 (PDT)
Message-ID: <57a15643-6d3b-4c4c-8d90-44912c070221@mind.be>
Date: Sun, 7 Apr 2024 21:47:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240407184907.3245610-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240407184907.3245610-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712519275; x=1713124075; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eCLiRaAlo6Qnj4e7lF4PaibeWaA4Vv8kBa0QLig/97Q=;
 b=EYuG7zbYtwtWqo+eZzlL2y+uU0UUb1VCSzNMf57+BcFMMgcb46xpzirxdxwIgRZdBK
 3F6iRnjYsUQ3u3HdMTv7QIjMOljH8iDdZnlWdZpe18UPrmCzBA/qadTQJCvccIfT5oFd
 Z8mJkhFbTu9A6xXupCMElMsFeKNaReMUcz/bdQr/lEcapDw8ecK9OseBQA7ihbpB2ck2
 b5Fh7cVXRhPXns3JPUS2z8E6544FQEndMEBRpZurlxQbHdJnmMuESAQvRXQz4XifTdAC
 3jBmErB9Zhbr5/+1iJAa5QCXiP18MEy82jWW+3pIE55sBXJMa3zappxL0hukxENp0nBh
 z/yg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EYuG7zbY
Subject: Re: [Buildroot] [PATCH 1/1] package/oprofile: drop unrecognized
 option
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/04/2024 20:49, Fabrice Fontaine wrote:
> --enable-gui is unrecognized since bump to version 1.0.0 in commit
> 7f7dc71cc8545dacf23f9a25f33c184d15bed65c and
> https://github.com/wcohen/oprofile/commit/0c142c3a096d3e9ec42cc9b0ddad994fea60d135:
> 
> configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --disable-nls, --enable-gui
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/oprofile/oprofile.mk | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
> index 265d6ebd18..512fbf9ea1 100644
> --- a/package/oprofile/oprofile.mk
> +++ b/package/oprofile/oprofile.mk
> @@ -11,7 +11,6 @@ OPROFILE_LICENSE_FILES = COPYING
>   OPROFILE_CPE_ID_VENDOR = maynard_johnson
>   OPROFILE_CONF_OPTS = \
>   	--disable-account-check \
> -	--enable-gui=no \
>   	--with-kernel=$(STAGING_DIR)/usr
>   
>   OPROFILE_DEPENDENCIES = popt binutils host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
