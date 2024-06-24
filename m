Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C23C2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 13:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C43A8144E;
	Mon, 24 Jun 2024 13:42:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GG5S03aZT1sL; Mon, 24 Jun 2024 13:42:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85CD58144F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85CD58144F;
	Mon, 24 Jun 2024 13:42:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A4B461BF479
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 13:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CC218144E
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 13:41:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wp3hJCQxIiwA for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 13:41:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8740D81449
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8740D81449
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8740D81449
 for <buildroot@busybox.net>; Mon, 24 Jun 2024 13:41:57 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4248ff53f04so7751405e9.0
 for <buildroot@busybox.net>; Mon, 24 Jun 2024 06:41:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719236516; x=1719841316;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cvn5MhLQCnfFi5oBwr5KLUdwzR9gaa4WugUET5M6UxQ=;
 b=Z6FVW5iyFbBprOsoehu6RtxATTL8PDkCObNIy/H1bbEhiH18Lx7fyO/xkrhApjyRkw
 lgoHcVVWoUS/qc5fR7i61e0kIXtrNBx0QBLYjCIxQVudIBmIbhkUYiQiDNqIwQA63A5o
 xdYBjpP7e4yJHOnqwnN2979tNaXAy5s3UmOifLPm6syDu5tUf6hLq3MV0jMchBDyncEK
 vmZ120XWIXeviS6Y0J9jv6GpZCkPylTMPhU6yXRaECrjaMZ8zrMohzPs/WDg9oiHo8F4
 c9hOkfgFAN1REGGqSZHfpCQ3nw/SWhG+NJIqIadHiZ3QQNdzizYsz6uTumbe+kOxkRtW
 1hyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUoZy9iFmNRSi+MDZ8NAAwVFXoqqwCU+FlaCK2snP+OU8WdUE0ERNzgU4+xN3rP8BZQFzaFAhQMPgIhTBEkPkR3TFp7fk=
X-Gm-Message-State: AOJu0YyT8jtTA4oJ8BbPbUsOAJ6+iunxlbrVvKv2+tNADfF1pEiDbOHL
 n32QeTlI7W0TC8UTBqWsNTmKLegdjybAOf/f2v+nN4pdFzxhqTsmXx/O1yOhNrsq7b+jP7tJNwU
 b
X-Google-Smtp-Source: AGHT+IEHgkD14N7Lje5SxHQ9G3g8THEhXMcYxYPYa7FiTTvF0+VMvOr/TtE8S3u1VAsWA4oU0wCReA==
X-Received: by 2002:a5d:4106:0:b0:360:83cd:ea2d with SMTP id
 ffacd0b85a97d-366e7a1b31fmr3874881f8f.24.1719236515615; 
 Mon, 24 Jun 2024 06:41:55 -0700 (PDT)
Received: from [10.1.0.155] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36638d9bb1fsm10132031f8f.49.2024.06.24.06.41.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 06:41:55 -0700 (PDT)
Message-ID: <3c9f622a-18c8-4331-a594-4a8b39639d93@mind.be>
Date: Mon, 24 Jun 2024 15:41:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Seiderer <ps.report@gmx.net>, buildroot@busybox.net
References: <20240612135727.11811-1-ps.report@gmx.net>
Content-Language: en-GB
In-Reply-To: <20240612135727.11811-1-ps.report@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719236516; x=1719841316; darn=busybox.net;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cvn5MhLQCnfFi5oBwr5KLUdwzR9gaa4WugUET5M6UxQ=;
 b=SBqjTQHJzdGGAWrI0pN67yYwXMu64zulrk05ATTmtlGWvgai5nQvCnSUMKCf3f5wIa
 1gqQEb6RtCbBGNiObeN8nmNnpHAHVvCM5rjx1ncL5wUaImFapxMTy8EqhviCXrsaTqbZ
 TJLpv1Qc5Ep/DAa2DRmZ59D/3nlyWRTMzeBZo5cJKSmEp+baicefnCu07Ccs6i/mE1oh
 EiGaHuDfZ2Yn8GcEhpsNm4Bu8AVTpVzvxfXzSAKQYol6ZT/Ht0rdR6SefHwK+H7EOLOP
 JSOPd8gNyk/qHpKTw35qRip53HrkY6cPufSE2sCRydfBM1CcXLYrALLoGcrjeBt2PW9+
 uSVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SBqjTQHJ
Subject: Re: [Buildroot] [PATCH v2 1/5] package/xz: bump version to 5.4.7
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



On 12/06/2024 15:57, Peter Seiderer via buildroot wrote:
> - add key hint for download signature check
> - update COPYING hash due to [1] (change of home page URL)
> 
> For details see [2].

  I've added a statement here to make clear this is not affected by the backdoor.

  Peter, this is for 2024.02.x and 2024.05.x.


> [1] https://github.com/tukaani-project/xz/commit/c5c091332c6953a0ce940cb355ea9e99491429fc
> 
> [2] https://github.com/tukaani-project/xz/releases/tag/v5.4.7
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changelog v1 -> v2:
>    - new patch, bump old stable version
> ---
>   package/xz/xz.hash | 8 +++++---
>   package/xz/xz.mk   | 2 +-
>   2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/package/xz/xz.hash b/package/xz/xz.hash
> index e8025a8065..ff070f6775 100644
> --- a/package/xz/xz.hash
> +++ b/package/xz/xz.hash
> @@ -1,9 +1,11 @@
>   # Locally calculated after checking pgp signature
> -# https://github.com/tukaani-project/xz/releases/download/v5.4.6/xz-5.4.6.tar.bz2.sig
> -sha256  913851b274e8e1d31781ec949f1c23e8dbcf0ecf6e73a2436dc21769dd3e6f49  xz-5.4.6.tar.bz2
> +# https://github.com/tukaani-project/xz/releases/download/v5.4.7/xz-5.4.7.tar.bz2.sig
> +# using key 3690C240CE51B4670D30AD1C38EE757D69184620 Lasse Collin <lasse.collin@tukaani.org>
> +
> +sha256  9976ed9cd0764e962d852d7d519ee1c3a7f87aca3b86e5d021a45650ba3ecb41  xz-5.4.7.tar.bz2
>   
>   # Hash for license files
> -sha256  29a1e305b2e34eefe5d4602d00cde1d528b71c5d9f2eec5106972cf6ddb6f73f  COPYING
> +sha256  72d7ef9c98be319fd34ce88b45203b36d5936f9c49e82bf3198ffee5e0c7d87e  COPYING
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
>   sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING.GPLv3
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPLv2.1
> diff --git a/package/xz/xz.mk b/package/xz/xz.mk
> index 40fa59ca7c..d5dceb0eae 100644
> --- a/package/xz/xz.mk
> +++ b/package/xz/xz.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -XZ_VERSION = 5.4.6
> +XZ_VERSION = 5.4.7
>   XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
>   XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
>   XZ_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
