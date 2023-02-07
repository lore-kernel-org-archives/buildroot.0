Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871B4C636D4
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 16:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 322E340A59;
	Tue,  7 Feb 2023 16:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 322E340A59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uls1RuIHA0YU; Tue,  7 Feb 2023 16:27:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DD2340168;
	Tue,  7 Feb 2023 16:27:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DD2340168
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7CFDB1BF5F8
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 16:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 575F440168
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 16:27:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 575F440168
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D6l96IWLWg5X for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 16:27:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CE8340120
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3CE8340120
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 16:27:40 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id z11so119277wrl.8
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 08:27:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cf/yl1UBTWBoWA4mPAF6bBSgkTvFM3MLfjWk1xUhmIk=;
 b=CXTmVH9ThEGtCeyc1ghMct7vf2ANPOyBq2qXvFPhaRSlBFrpaYYUiClqwBpnapJvri
 idNThI7vSxBYbiDT7/qQ+I1GuW57GcsbNFrCBeIqKexKO0qUkVavs2HJ0chpPTIjGBbO
 i/59y+Taq7wQe/drA+3kDzwkDBqYavclHToBpmSqR06q8HU8aqlMa98krVBDBFYt7xEk
 HshXdyZcETQ45oCQHmyHFSoN7974HStomsdXF0tBZxBeyWP4mT/EMNNyHBDdOf8J4u5d
 ickWuitgAUC9jxrma+WIP49RTParVAp7RcPoY9ICiyJfgk60AAl3dWT0kOKqHQDps5Aa
 Znnw==
X-Gm-Message-State: AO0yUKXAcbaiLS8OTRYvV1laR1OGpEKgL1iu881QUn52wXicUQ5/bu29
 cPhPR3TYXEjob+qypzxaJ5Lx98pq8Sw+COfS
X-Google-Smtp-Source: AK7set8CYEbUbVKPcMPNbf7e5hmqPHSvYDiucIVA9J6eohRVLU/xjOJQA4y6e9p0Vm2uTSRhJqgd9w==
X-Received: by 2002:adf:e749:0:b0:2c3:e5f5:9faa with SMTP id
 c9-20020adfe749000000b002c3e5f59faamr3440190wrn.58.1675787257852; 
 Tue, 07 Feb 2023 08:27:37 -0800 (PST)
Received: from [192.168.16.188] (cpe1150018.bra.be.verixi.net. [85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a5d5002000000b002c3be6ae0b1sm11562788wrt.65.2023.02.07.08.27.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 08:27:37 -0800 (PST)
Message-ID: <2d7b1709-7fd8-292d-8fc8-871bcb3c2047@mind.be>
Date: Tue, 7 Feb 2023 17:27:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230131050319.2821287-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230131050319.2821287-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cf/yl1UBTWBoWA4mPAF6bBSgkTvFM3MLfjWk1xUhmIk=;
 b=PEI9nT1omA+sE4Hr5JQq2c+MhkVjuBpQsQHJcUyP3d1qBtKQOLKv2UGAmcxod9qPzp
 Ea80iBljSAEngPSPmuDFfQiWwkc9ZEMZNWmlBi3SNeue5T1dEk/Cpx74tnqhHnAKOzvF
 eOidUgGERP0yjNg1J9hZEndgM7I2VqFTPeyhUtw/SMh1IzdLrNeJ9CZhlrZL12pnjewL
 zqwhPbqnQi02KeZEQCGHSmqN/D4KvAZR51jAqebSIsgnqh+XllBzoI/ur+jOUQOrTr93
 QiOZB8U+daCINr/JbXTR9mg3yM+tTcPaJI6xsn5wZkXM8dXuYBCZMRLBh0tqvmDxv5SW
 oHQw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PEI9nT1o
Subject: Re: [Buildroot] [PATCH 1/1] package/{rust,
 rust-bin}: bump to version 1.67.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Sebastian WEYER <sebastian.weyer@smile.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 31/01/2023 06:03, James Hilliard wrote:
> Link to Rust 1.67.0 announcement: https://blog.rust-lang.org/2023/01/26/Rust-1.67.0.html
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks. Thank you Sebastian for testing!

  Regards,
  Arnout

> ---
>   package/rust-bin/rust-bin.hash | 252 ++++++++++++++++-----------------
>   package/rust-bin/rust-bin.mk   |   2 +-
>   package/rust/rust.hash         |   6 +-
>   package/rust/rust.mk           |   2 +-
>   4 files changed, 131 insertions(+), 131 deletions(-)
> 
[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
