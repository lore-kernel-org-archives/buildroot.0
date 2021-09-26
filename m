Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A7A9C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:50:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 113CA60EFF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 113CA60EFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E773860712;
	Sun, 26 Sep 2021 19:50:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sVWdyxTpgaBl; Sun, 26 Sep 2021 19:50:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 287E560596;
	Sun, 26 Sep 2021 19:49:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 768DB1BF383
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63E134020E
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:49:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zOkooa-vntqt for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:49:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 43E9C40227
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:49:51 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id g8so60004144edt.7
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 12:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=igbs1Cnvds5JKUDMTw7WpSyFl9YqespZ66SyYTBYwwU=;
 b=CnK5NMbXVSymYWM9Kxq/9287wljHc5EH4HSmAe5NhXDtjHQHu+YJyuTpNCP/YA7AEn
 CEIFuaXSI3rA1llG7C4m7hYihb0mGC+/nFLOz9javshCXYEevobvv0gb6+15O94omRx8
 xvntaKTGVtVa71apsRlf0QURprYjLMvAYcxS5vHmBJTgl6dEUGmf5cqVrqSn6TQ+ORAf
 5MvExBbz2X0Xu7MQkgPDUI/+ILJsVONJFbUURZ+M7aOSb7rXAXvAfcC5nUkpXn+d85rx
 eETOg8BnI3eWSbe5fb4GwmTyqJYDxrtw0KEs0XOI+xg/fgpii9G/KVplNNQh+IQZ7mK4
 Q9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=igbs1Cnvds5JKUDMTw7WpSyFl9YqespZ66SyYTBYwwU=;
 b=awdxI8D7DPmkZREFNKQJ4m6+/HIN+M/whFTcd6MA/wSvGVNmA0RfIlEoEtUmtOFkBx
 9S3DxzlVoNWwJDXnb8njGDXaMeL8tCufRpUuKJEj5T5sRbAXYJfoYi6QWEXqB59P6yVz
 7JgrU+29vvJfe6M0PefQjSuKnW/4fK5Ehw3/Em3rROJr+DgPAcsDeuPrIgZhVfcNAcAz
 x5D4nVMuR1J7FXEE5q0+c/PmQVMc6myA6X5y461k5jgaSm7SDMy8YyzU+8X5UcKGZaqm
 86HE0kIaepUDTIXGHW1xUJET85cA5A+TZG6g3PZCm70W0g+FDkYs190Yv3LZe4FWWXjN
 ZDWw==
X-Gm-Message-State: AOAM532Xyq4Qiah0U2EDkiJT6boexrbmmSIu072cLOR6+tb63Yh6vLtl
 EqRs4BYCcuDFzeNlzAhlqnAbYmIy9G2uew==
X-Google-Smtp-Source: ABdhPJy8jitGv1aeaDPVJgDGq1ZwVAOvwxNFG48AR/ZX1YmQ5ff9Ent7jrv2iSKfWBpV43KlO+DfDg==
X-Received: by 2002:a17:906:a08d:: with SMTP id
 q13mr23017652ejy.465.1632685789485; 
 Sun, 26 Sep 2021 12:49:49 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d15sm7660678ejo.4.2021.09.26.12.49.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 12:49:49 -0700 (PDT)
Message-ID: <458809e2-a345-3f44-dcbd-f675019b6e5a@mind.be>
Date: Sun, 26 Sep 2021 21:49:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210926083501.3514060-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210926083501.3514060-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/google-breakpad: fix build with
 glibc >= 2.33
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
Cc: Pascal Huerst <pascal.huerst@gmail.com>, Anisse Astier <anisse@astier.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/09/2021 10:35, Fabrice Fontaine wrote:
> Fix the following build failure with glibc >= 2.33:
> 
> src/client/linux/handler/exception_handler.cc: In function 'void google_breakpad::{anonymous}::InstallAlternateStackLocked()':
> src/client/linux/handler/exception_handler.cc:147:49: error: no matching function for call to 'max(int, long int)'
>    147 |   static const unsigned kSigStackSize = std::max(16384, SIGSTKSZ);
>        |                                         ~~~~~~~~^~~~~~~~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/61a89fa954db16a7b5b9fcee55c545e489f8d489
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../0004-Fix-for-non-constant-SIGSTKSZ.patch  | 34 +++++++++++++++++++
>   1 file changed, 34 insertions(+)
>   create mode 100644 package/google-breakpad/0004-Fix-for-non-constant-SIGSTKSZ.patch
> 
> diff --git a/package/google-breakpad/0004-Fix-for-non-constant-SIGSTKSZ.patch b/package/google-breakpad/0004-Fix-for-non-constant-SIGSTKSZ.patch
> new file mode 100644
> index 0000000000..4291216c61
> --- /dev/null
> +++ b/package/google-breakpad/0004-Fix-for-non-constant-SIGSTKSZ.patch
> @@ -0,0 +1,34 @@
> +From 4a332d01186b09a9d46390b845024d914d9149cb Mon Sep 17 00:00:00 2001
> +From: Michel Alexandre Salim <michel@michel-slm.name>
> +Date: Sun, 21 Mar 2021 13:17:00 -0700
> +Subject: [PATCH] Fix for non-constant SIGSTKSZ
> +
> +On glibc > 2.33, `SIGSTKSZ` might not be constant (in which case
> +it expands to a call to `sysconf` which returns a `long int`); see
> +http://sourceware-org.1504.n7.nabble.com/PATCH-sysconf-Add-SC-MINSIGSTKSZ-SC-SIGSTKSZ-BZ-20305-td650948.html
> +
> +Cast the two arguments to `max` to `unsigned`, which is the type of the variable
> +we're storing the result in anyway, so that it works both with the old-style constant
> +`SIGSTKSZ` and the new configurable one.
> +
> +Signed-off-by: Michel Alexandre Salim <michel@michel-slm.name>
> +Change-Id: I3d87048561a87c6b9fcdbb14b3d53dd45b0a00f0
> +
> +[Retrieved from:
> +https://chromium-review.googlesource.com/c/breakpad/breakpad/+/2776379]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> +
> +diff --git a/src/client/linux/handler/exception_handler.cc b/src/client/linux/handler/exception_handler.cc
> +index ca353c4..3788829 100644
> +--- a/src/client/linux/handler/exception_handler.cc
> ++++ b/src/client/linux/handler/exception_handler.cc
> +@@ -138,7 +138,7 @@
> +   // SIGSTKSZ may be too small to prevent the signal handlers from overrunning
> +   // the alternative stack. Ensure that the size of the alternative stack is
> +   // large enough.
> +-  static const unsigned kSigStackSize = std::max(16384, SIGSTKSZ);
> ++  static const unsigned kSigStackSize = std::max((unsigned) 16384, (unsigned) SIGSTKSZ);
> +
> +   // Only set an alternative stack if there isn't already one, or if the current
> +   // one is too small.
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
