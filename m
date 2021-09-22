Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6333C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 19:46:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EAF861038
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 19:46:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5EAF861038
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27FE640121;
	Wed, 22 Sep 2021 19:46:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kbi2o5bbeFed; Wed, 22 Sep 2021 19:46:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB504401FD;
	Wed, 22 Sep 2021 19:46:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D0311BF321
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 19:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98418401FD
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 19:46:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7hRm8jjDh3At for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 19:46:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5110D40121
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 19:46:19 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id dj4so14437479edb.5
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 12:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ULZt1C/r36UgRVwPzj/CVic8aukyrAYDDTQxlaCCzcg=;
 b=fCjSC2dGW7VwB7Hg0lV0+wdYqcfzaAljQ55Y2ueRONMYdpTZsK4O8g4fIC/ByBPf+w
 g7xclls9ZURdKYS7O6OVDCMXvNRGNqkAlC0lxpkA0P+9wUYRdUH1fLhTdVJIDHjwS8t0
 iKQRR2L4S4LDmIXuJriZS/n1PRU2VT2Iw7SdfEW8Mde1ZWrzGV5UmDsHRe6SzJXWM+0A
 60T2FEBySPSlwlpyU+9wgjilhn9COCkgi+AakL5trMTzGnjCWJOErUdl6mx3eKPQ5CmX
 U4jVGUNviD23Axo+ZA6tDfwpNu+SV2xJU4uWj1IemQVAvR1ZXba/pva33YN74tLojptq
 JxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ULZt1C/r36UgRVwPzj/CVic8aukyrAYDDTQxlaCCzcg=;
 b=zy7QubOlaOF/2KXeHAxuDt6Y4C2UjadHJfuQ/DNH+fjnFjUaLlrqmWRZG2TnAlw6jZ
 N7hm2tpcvUqYmeOL+p1NO1QxeOA7ItWgOoEBIVRlNDR2h27shhpjCGCpLVRva5+wWfag
 GUgVFwS899MDJhQ2UAXu6+Bx4YtH0zMA+Oezzw4VrUDJj9zFpxL4B53C8Y/delr0YmNF
 BhlDJeHbcgu79P61P0iq663QeaNjnjoWHnLJOC1chzZLaxgatWMhDaIXrrs9wpyd7pnF
 Q23vmjDk5wxBZnuFRrc65nN2GXIJ4mPNPvx7RDzbT4j2c4Ebdd+VYSrSMvsetyDxA2nf
 U25A==
X-Gm-Message-State: AOAM531HKbLpV5kAFO8V5oVu3Pgt/GOdWO6cARs5vp1AYAKtP9Op8Yve
 v1zlwL/KTb2B4MbOygvrnyr1qg==
X-Google-Smtp-Source: ABdhPJyBnOh/w5LsmqL8gofvcc7CXZyXd33TtFKtcbLYZsuw+fUnrpp50yzCDC/xdbM/mJBleR7CvA==
X-Received: by 2002:a17:906:95d7:: with SMTP id
 n23mr947519ejy.479.1632339977499; 
 Wed, 22 Sep 2021 12:46:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id t19sm1465036ejb.115.2021.09.22.12.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 12:46:16 -0700 (PDT)
Message-ID: <a9d2b72c-1b58-839c-9bc2-7a91a1edd435@mind.be>
Date: Wed, 22 Sep 2021 21:46:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Petr Vorel <petr.vorel@gmail.com>, buildroot@buildroot.org
References: <20210921210438.41808-1-petr.vorel@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210921210438.41808-1-petr.vorel@gmail.com>
Subject: Re: [Buildroot] [RFC PATCH v3 0/2] use python3 explicitly
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 David Laight <David.Laight@ACULAB.COM>, Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 21/09/2021 23:04, Petr Vorel wrote:
> Hi,
> 
> changes v2->v3:
> * remove __future__ from utils/getdeveloperlib.py (previously in 3rd
> commit [1]; noted by Romain [2])
> 
> changes v1->v2:
> * 3 more commits
> * remove also python2 compatibility imports
> 
> Kind regards,
> Petr
> 
> [1] https://lore.kernel.org/buildroot/20210915194839.22122-4-petr.vorel@gmail.com/
> [2] https://lore.kernel.org/buildroot/41cb0bdf-845d-ab94-0322-c4d1393f40b8@gmail.com/
> 
> Petr Vorel (2):
>    support: utils: use python3 explicitly
>    utils/scanpypi: remove python2 compatibility imports

  Both applied to master, thanks.

  I found that also utils/diffconfig was still using pyhon, so I sent a patch to 
fix that one as well. I checked in the kernel, they made the same change there.

  Regards,
  Arnout

> 
>   support/scripts/cve.py                                 | 2 +-
>   support/scripts/graph-build-time                       | 2 +-
>   support/scripts/graph-depends                          | 2 +-
>   support/scripts/pycompile.py                           | 4 +---
>   support/scripts/size-stats                             | 2 +-
>   support/testing/tests/package/sample_gst1_python.py    | 2 +-
>   support/testing/tests/package/sample_python_gobject.py | 2 +-
>   utils/check-package                                    | 3 +--
>   utils/genrandconfig                                    | 4 +---
>   utils/get-developers                                   | 2 +-
>   utils/getdeveloperlib.py                               | 1 -
>   utils/scanpypi                                         | 2 --
>   utils/size-stats-compare                               | 2 +-
>   13 files changed, 11 insertions(+), 19 deletions(-)
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
