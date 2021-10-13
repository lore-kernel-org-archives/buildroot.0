Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D5EC433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:25:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C117B61165
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:25:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C117B61165
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 783CC60BA7;
	Wed, 13 Oct 2021 18:25:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VQlDYfQ7WIxd; Wed, 13 Oct 2021 18:25:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8055760AE5;
	Wed, 13 Oct 2021 18:25:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 563161BF38C
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 433FA60AE5
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:25:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4kGPfbwtdWSu for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 18:25:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C67760ADF
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 18:25:13 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id ec8so13893159edb.6
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 11:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=n2fJb3luy3aDnCS8DYAKbvZKupzZvNicxLhVUA0JcOg=;
 b=iBJBm3l/CpGXogynbAdJPNUFwHlI+3uOYrazqqNSblNsE6cIggbgxI2c517exEOrsX
 uNgVUdxuUtlQE7im1YrdD1obe7JIfPBadQL8KvtZxnVCcd3cCYLhrWwTTvPhn9udNNWm
 jTyPrcUjKVAnSBFYQs2ijnUyLVIE5oPvIUvYwBUYK2BKW9chF2ggoOOMgEluldOwsakz
 nSx4qF6/RD+lpoezaajhUAF8RKog6M0szjJHK2KU5MwE1cESMCBpX3jEHJoxIxndi8U/
 nV69VTRL4Hmbt73hjhJWoh6xFjv7UQ4hGhiXEYUgOe3KRJUNvL4yUtlpeG8JUCzA9uLj
 Sk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=n2fJb3luy3aDnCS8DYAKbvZKupzZvNicxLhVUA0JcOg=;
 b=BOVQvFI/MNdUJTaU9RBy8kbBeT7a4ccdSKorEiPFJIdehXn+xV5AqW8Li72sdMvGJL
 b59gyN3TA27Qf+ei/OQ5gL+hbRSJHE2MgmAbBHwBDHPCt6O+GXeRLWo5dpvCibO2NUdR
 x4pMEmr/pMrLW5AT45c50jkJfN42oQgZhigye4xyFDLe1bB7Zpvkm/7UYChr9svka4SK
 hbrO+0cflheLng9Y+1G836FGsDyLVZOACrbrY4DNuwsssMznuNAZ9CzhG1MEHwwgnwSp
 V4OJjn3JBqstp8ckspwbGo3n1u/QrxvvpzPe7Dfvpi6bRZK04Zo20jjytxqBVYSKDde2
 pkTw==
X-Gm-Message-State: AOAM532IQB8x06XQ2NIRx+WfPugWsaTPt6dIDsCARSkTFWgpp/+Ryosi
 OLAyYSd27gid1ZPjDfbuk4I9b3JMnw7HSThB
X-Google-Smtp-Source: ABdhPJzEtAtnKUYu+2lIRm2MypuMUZU31oT7wZjJALfZgvM7EBS0H45lQwDfpG9OSgT0quyHCqYCtQ==
X-Received: by 2002:a17:906:fc11:: with SMTP id
 ov17mr930344ejb.249.1634149511637; 
 Wed, 13 Oct 2021 11:25:11 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id lb20sm235400ejc.40.2021.10.13.11.25.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 11:25:11 -0700 (PDT)
Message-ID: <aade73ad-1f6d-0549-3a58-366eec69372b@mind.be>
Date: Wed, 13 Oct 2021 20:25:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Alexander Dahl <post@lespocky.de>, buildroot@buildroot.org
References: <20211006052717.7328-1-post@lespocky.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211006052717.7328-1-post@lespocky.de>
Subject: Re: [Buildroot] [PATCH 0/3] package/dfu-util: new version 0.11
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



On 06/10/2021 07:27, Alexander Dahl wrote:
> Hei hei,
> 
> some housekeeping before and bumping dfu-util to 0.11.
> 
> Greets
> Alex
> 
> Alexander Dahl (3):
>    package/dfu-util: Update help text
>    package/dfu-util: Fix licenses
>    package/dfu-util: bump version to 0.11


  Series applied to master, thanks.

  Regards,
  Arnout

> 
>   package/dfu-util/Config.in      | 7 ++++---
>   package/dfu-util/Config.in.host | 7 ++++---
>   package/dfu-util/dfu-util.hash  | 6 +++---
>   package/dfu-util/dfu-util.mk    | 4 ++--
>   4 files changed, 13 insertions(+), 11 deletions(-)
> 
> 
> base-commit: 280f7793b209156f0601f36916790f01cd1d33b7
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
