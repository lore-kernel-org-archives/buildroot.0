Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFD6C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 15:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A650404A9;
	Sun, 24 Mar 2024 15:09:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LQsvaswS8GNv; Sun, 24 Mar 2024 15:09:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D041405EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D041405EE;
	Sun, 24 Mar 2024 15:09:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 33F181BF4DD
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E0BB8197D
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:09:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HXaW4lw7Ny4s for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 15:09:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 09C718188D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09C718188D
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09C718188D
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:09:32 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2d24a727f78so40532871fa.0
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 08:09:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711292971; x=1711897771;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rjKUcQYCj+GcvxCRzQCldUaQ2iXkEF9J9/L5a8u0i5I=;
 b=YLwkZw1XGJYn5BOLgiFpz5cOmGTmv3L0L91lZ0VYAUnfN4fP/LCm6ql4c3NgGzcr8t
 iHU7OERh45Lfklip2eqyo5o7lDJFg4uxCd62d+X6nk6UKG0A9yHP7AExAf9RW1YIoLyy
 VDqvU4mpacpiPwWhoRPTGd68AK51tD2jNOb2NpJVQ1TA7sJwoK87GrCouiqRM3CIjWjG
 yhgd2U2nUctnRNre+xbxmso7W7oBC6g3qckMt2OuxDq1dVektKptXZd7R39W54KbsiDW
 rlOG6omZbdkAGumqhJs0zxrbTDkwxOUoU3h2qcgUCSu5nOnAgYnMqV6iQHHLzGJTLWRA
 J6KA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWklrFj6jrabu9p/Hk55x3Up1MMTqjZf9f4hGESjhw/TqJpUH2a2zRxYSzRxT2B2nHD4u/6IHOPEkapvkKfXhzWkpTP0QcooA==
X-Gm-Message-State: AOJu0Ywv+ffYH3fRSVU0jxMGUFv5BGG0LRkgQZE4kUqFNTjZ9acm1Xpf
 N5mHlGsruiAMh9W/1oxk+cjhNlhwqYXRNdrJ3BrEpZcvfGR1TTc1gAHD5AEcy2g=
X-Google-Smtp-Source: AGHT+IHavIBfD9dSi6MKftERVmP24MmsWr8aieqpj+0F3AyVbpzviXsXaKy9qCgQDrtFBocxbNiOJg==
X-Received: by 2002:a2e:a698:0:b0:2d4:6a6a:22bf with SMTP id
 q24-20020a2ea698000000b002d46a6a22bfmr2664476lje.23.1711292970796; 
 Sun, 24 Mar 2024 08:09:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 x18-20020adfffd2000000b0034181bea3b0sm7035705wrs.3.2024.03.24.08.09.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 08:09:30 -0700 (PDT)
Message-ID: <3631d298-ce21-42c1-beb3-924251b34be7@mind.be>
Date: Sun, 24 Mar 2024 16:09:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Akhilesh Nema <nemaakhilesh@gmail.com>, buildroot@buildroot.org
References: <20240324051151.1425508-1-nemaakhilesh@gmail.com>
In-Reply-To: <20240324051151.1425508-1-nemaakhilesh@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711292971; x=1711897771; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rjKUcQYCj+GcvxCRzQCldUaQ2iXkEF9J9/L5a8u0i5I=;
 b=D4EKiyx/XiHBuMOaf95VlOR7WQPh0bRDRByax755W8d+Ay/bJXukcip/NpWWQ8390Y
 eMBCylbKofZeB0CGPp3jxfmMGqdkwFWL8lmvFrAGb+3eERJcyMIS9Ve2hm+3+IUgMDh2
 MUZ/tBNHX4EuRYRZ/LZgk+hsR9kjmvHJeTpv73mdIhZqxkR7c8GO1FntElhZRwORdVhL
 JKWIbP48qTA3stngx/z+9Xd9+38hRbu4YqW7sn6ijnc5/w+qW+NEvLvgh01D0/tci/0K
 ME7QW3akr1N2CeVTzL052YOic5Wx5XWntgpsyVCTcXFF4sFvWW0k3N5tNg4xGzNSBt0Y
 qZfA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=D4EKiyx/
Subject: Re: [Buildroot] [PATCH 1/1] package/msmtp: bump version to 1.8.25
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/03/2024 06:11, Akhilesh Nema wrote:
> Release notes - https://marlam.de/msmtp/news/msmtp-1-8-25/
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
> ---
> $ cat msmtp.config
> BR2_PACKAGE_MSMTP=y
> 
> $ ./utils/test-pkg -k -c msmtp.config  -p msmtp
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
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/msmtp/msmtp.hash | 4 ++--
>   package/msmtp/msmtp.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/msmtp/msmtp.hash b/package/msmtp/msmtp.hash
> index c5fe9d9176..ba4ef02746 100644
> --- a/package/msmtp/msmtp.hash
> +++ b/package/msmtp/msmtp.hash
> @@ -1,7 +1,7 @@
>   # Locally calculated after checking signature
> -# https://marlam.de/msmtp/releases/msmtp-1.8.24.tar.xz.sig
> +# https://marlam.de/msmtp/releases/msmtp-1.8.25.tar.xz.sig
>   # with key 2F61B4828BBA779AECB3F32703A2A4AB1E32FD34
> -sha256  bd6644b1aaab17d61b86647993e3efad860b23c54283b00ddc579c1f5110aa59  msmtp-1.8.24.tar.xz
> +sha256  2dfe1dbbb397d26fe0b0b6b2e9cd2efdf9d72dd42d18e70d7f363ada2652d738  msmtp-1.8.25.tar.xz
>   
>   # Hash for license file:
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
> index 93c923a123..b964970bfa 100644
> --- a/package/msmtp/msmtp.mk
> +++ b/package/msmtp/msmtp.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MSMTP_VERSION = 1.8.24
> +MSMTP_VERSION = 1.8.25
>   MSMTP_SITE = https://marlam.de/msmtp/releases
>   MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.xz
>   MSMTP_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
