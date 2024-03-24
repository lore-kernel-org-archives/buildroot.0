Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55474C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 15:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12FCD405F1;
	Sun, 24 Mar 2024 15:10:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0u408pC6_Gpw; Sun, 24 Mar 2024 15:10:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C338A4062B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C338A4062B;
	Sun, 24 Mar 2024 15:10:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE6DF1BF4DD
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8F97606EA
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8GgwZr-bing9 for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 15:09:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 91958605BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91958605BB
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 91958605BB
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:09:57 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-341b01dbebbso2387183f8f.0
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 08:09:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711292995; x=1711897795;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iGOJ2g5nFiJyCm7XTKrpywnBAR7MUALDBfScknnlPM4=;
 b=hhgMcloBxZ8XuZNOVgjxQLYeUMXWC0AAME5OJJhSyMRxXtP+Yaju1JG84j8fPwWKHo
 bQEiHZIBQc0R9ErqM5q7vGLJ+3M7kVZxoSYMv9zVX4V8FYSNB4ZChe60lMdguUZKNPB+
 tROhf6jOk+z71ybkOqcWSlIBoJ0xzs4D3AAmB/se3iAZYjfFcVL2w+WCahs236kKGAmQ
 ft0RwJJ9bbK63SkejNgGCcGyBTL7atBLlc7ZAstpS6F3uhCkTwJZNfvo/7LvParMbywy
 izCvUjrpwpmL8U9NPb7/C2sK2lLtIuNIQYe4BNHSX1xfnOc/+iPWz1hfYcCTnvOtTO/z
 ICgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2dFR0NeHf3d3Kg4/6StyAFgdlNC6bEGQ3OAJ5z6hjO8ZqU4iHD/FDNjVJDhOGL/tq947WSE7WUk9lvF4waW4mWfi3uWlhEQ==
X-Gm-Message-State: AOJu0YwmNlYKAeOUQj6KKnRuBWfsuroz9kiEQpDNVIvTiD78YUa+iNPC
 iz0ZbbydKYEBE9+fLf7E5OlQmgBxvOLFAuzVZprooJLJ8CFASBJKA6GOgdkYOC2UwL72bFL8H77
 1
X-Google-Smtp-Source: AGHT+IH8EilQ5WQE9nSsOldRZKzfXzzOCSrRoT9xJ87+Bkx7j0amgMOTAQQ8glkUsQYSKR8Ug1EY7g==
X-Received: by 2002:a05:6000:e81:b0:33e:bb67:9596 with SMTP id
 dz1-20020a0560000e8100b0033ebb679596mr3655849wrb.64.1711292995490; 
 Sun, 24 Mar 2024 08:09:55 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 x18-20020adfffd2000000b0034181bea3b0sm7035705wrs.3.2024.03.24.08.09.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 08:09:55 -0700 (PDT)
Message-ID: <5694e756-efc9-4db0-ac7d-83ebc7f346c0@mind.be>
Date: Sun, 24 Mar 2024 16:09:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Akhilesh Nema <nemaakhilesh@gmail.com>, buildroot@buildroot.org
References: <20240324025059.1253709-1-nemaakhilesh@gmail.com>
In-Reply-To: <20240324025059.1253709-1-nemaakhilesh@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711292995; x=1711897795; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iGOJ2g5nFiJyCm7XTKrpywnBAR7MUALDBfScknnlPM4=;
 b=QpbjtsPsqeyoeDegYB31r8n2BPLEzgnC3MUAH328v7QarFuuqg6W5IncRmUmfehZ3D
 wXw2omlvzu8VcTx/097w2aMru3DYuHGyzmdB7Dba5C9aRK2XBrlocfQxlgwbE/OoSnYX
 zpEQ1uPCYjokHVb5R8u6MlWlOv3EDYrp5DQtLzGEFXx9SLxxSF4uEm9ko7CNMKyyvU1l
 at6ShwOXTOnh0HD3xvzLU/qzPncLgoHbEuP/I8iVmtvqQv/HAInArvXFhN8jbnz5PlGX
 aSocRs/SQBhN8RIq0ZmS4SUystAN5RD6StxNPw0gCrOMdFLfj+aXo1o8xNIPwVKkRaI5
 cQJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QpbjtsPs
Subject: Re: [Buildroot] [PATCH 1/1] package/strace: bump to version 6.8
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



On 24/03/2024 03:50, Akhilesh Nema wrote:
> Changelog - https://github.com/strace/strace/releases/tag/v6.8
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> 
> ./utils/test-pkg -k -c strace.config -p strace
>                      bootlin-armv5-uclibc [1/6]: OK
>                       bootlin-armv7-glibc [2/6]: OK
>                     bootlin-armv7m-uclibc [3/6]: OK
>                       bootlin-x86-64-musl [4/6]: OK
>                        br-arm-full-static [5/6]: OK
>                               arm-aarch64 [6/6]: OK
> 6 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> 
> $ utils/docker-run make check-package
> 398423 lines processed
> 0 warnings generated
> 
> $ ./support/testing/run-tests -k -d dl/ -o testsuite tests.package.test_strace.TestStrace
> 17:35:09 TestStrace                               Starting
> 17:35:09 TestStrace                               Building
> 17:36:36 TestStrace                               Building done
> 17:36:41 TestStrace                               Cleaning up
> .
> ----------------------------------------------------------------------
> Ran 1 test in 92.282s
> 
> OK
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
> ---
>   package/strace/strace.hash | 4 ++--
>   package/strace/strace.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/strace/strace.hash b/package/strace/strace.hash
> index a35d2b0be6..68b9cc5f93 100644
> --- a/package/strace/strace.hash
> +++ b/package/strace/strace.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
> -# https://strace.io/files/6.7/strace-6.7.tar.xz.asc
> -sha256  2090201e1a3ff32846f4fe421c1163b15f440bb38e31355d09f82d3949922af7  strace-6.7.tar.xz
> +# https://strace.io/files/6.8/strace-6.8.tar.xz.asc
> +sha256  ba6950a96824cdf93a584fa04f0a733896d2a6bc5f0ad9ffe505d9b41e970149  strace-6.8.tar.xz
>   sha256  1988d0e1aa101d68855e8c4f940aacf2531051b82f6b608eb026c5fad1f33df1  COPYING
>   sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
> diff --git a/package/strace/strace.mk b/package/strace/strace.mk
> index ddcdfabb29..908aed6653 100644
> --- a/package/strace/strace.mk
> +++ b/package/strace/strace.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -STRACE_VERSION = 6.7
> +STRACE_VERSION = 6.8
>   STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
>   STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
>   STRACE_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
