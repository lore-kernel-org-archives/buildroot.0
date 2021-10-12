Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27CB0C433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:40:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E125261050
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:40:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E125261050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD074607D1;
	Tue, 12 Oct 2021 20:40:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0EYZqPfJCKz8; Tue, 12 Oct 2021 20:40:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FA7F607F6;
	Tue, 12 Oct 2021 20:40:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF6EE1BF5A0
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEA78606C0
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:37:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pkw8lhmcJEDr for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 20:37:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04A766062A
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 20:37:41 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id w19so1172769edd.2
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 13:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=VaVa4zY+jJKbKIoT7YWJwleZonu/fIzjfmyc+a0gpEc=;
 b=WsuFXoS1xnz8MEf4MW0k/Kk0YchqRxNxGZvf7636cmiyp4JN82aX1ycvQQ5YLLhtHl
 alo/+zrNmUFTpObfVFdUHbefun8OqWEuAE6A9GmDjk3N5hsG7y1Bar16bbsPirY/I1Gh
 LvYNnnSONYApnBCD+b7ceKEDZ1dIlulI1dPfr/kQJ5Rg02R4XKvxt7S3nBnCVYrP8xD8
 t3jfd8QKK+1SGSqF58O9XbQT38BzafDsTGvCevLklxx6UqUatHK5BbUcS4K33Fn+Li6o
 98SMJ3NvikUnlwB4LeFHg1/tafYtAG+O4oXLmJgoLp6RSoan5g1gPzHWzI2yzZwzykRL
 dI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VaVa4zY+jJKbKIoT7YWJwleZonu/fIzjfmyc+a0gpEc=;
 b=XmoHoj147UW4qrwfYxPzjA7wURAGN8KOSDefajjiInKxehJqBPLEnFKmcXdltDBFOx
 PM8K7gV1LskLDXuYV431bDq9yGionimeUDUpSLG3Occi5hruibBQ0dShuXSEIo1qz0BH
 t5XMRDXb2CiUbcXvblr2nftZNjK7LUkggoV1gVT4UpxgQJUzIRItmlJL7wcgSOhhIZsn
 uLCpqBSavjge2IUePw6PuvPmoXOSnnVDOfT4DfZX6lsibyQg2KOsKSO40if4pUP7xfko
 FMF7FJsRaxQwriL9HcBhmE0MxPEdIslC/DACsGRAFsPTp/iWf9qec3FM/K3713FZenPF
 mISw==
X-Gm-Message-State: AOAM532ztx0HSftt5emubReYT+icuoRqdy5cvsJx5LN4aIk9MI1kCHYm
 hpyZxJyNrtv/ufOae7PbawdcWmUW8mwA8et4
X-Google-Smtp-Source: ABdhPJx6JoqjEy2cQxV795eWp5m1TycWOtkGFj3UUURf0m8qn1x9v6ZBMxfjP8IOlLLBlIbLi60kNA==
X-Received: by 2002:a05:6402:4308:: with SMTP id
 m8mr2879555edc.188.1634071060227; 
 Tue, 12 Oct 2021 13:37:40 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id p10sm5430830ejf.45.2021.10.12.13.37.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 13:37:39 -0700 (PDT)
Message-ID: <edd7b38a-07ab-23a0-9c60-517ac6f8785c@mind.be>
Date: Tue, 12 Oct 2021 22:37:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>,
 buildroot@buildroot.org
References: <20211005085452.12410-1-nicolas.cavallari@green-communications.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211005085452.12410-1-nicolas.cavallari@green-communications.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/libgit2: bump version to 1.3.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/10/2021 10:54, Nicolas Cavallari wrote:
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libgit2/libgit2.hash | 2 +-
>   package/libgit2/libgit2.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
> index 5522f5fe45..07b1a260a4 100644
> --- a/package/libgit2/libgit2.hash
> +++ b/package/libgit2/libgit2.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  701a5086a968a46f25e631941b99fc23e4755ca2c56f59371ce1d94b9a0cc643  libgit2-1.2.0.tar.gz
> +sha256  192eeff84596ff09efb6b01835a066f2df7cd7985e0991c79595688e6b36444e  libgit2-1.3.0.tar.gz
>   sha256  8b7e4f54f8bf210c8fe010a49571a1ee57463ef020cc43f051d4d3fbb74942af  COPYING
> diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
> index 4c715302d1..6cc0f1ea74 100644
> --- a/package/libgit2/libgit2.mk
> +++ b/package/libgit2/libgit2.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBGIT2_VERSION = 1.2.0
> +LIBGIT2_VERSION = 1.3.0
>   LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
>   LIBGIT2_LICENSE = GPL-2.0 with linking exception, MIT (sha1), wildmatch license (wildmatch)
>   LIBGIT2_LICENSE_FILES = COPYING
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
