Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CECAFC433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 07:31:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 165D960E8C
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 07:31:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 165D960E8C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B137F400CC;
	Wed, 27 Oct 2021 07:31:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SB21I2Za3-_y; Wed, 27 Oct 2021 07:31:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC28B400E6;
	Wed, 27 Oct 2021 07:31:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 27B0A1BF580
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 07:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2388F606D9
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 07:31:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rlXO1zxslmU1 for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 07:31:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D9AE60676
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 07:31:22 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id r4so6773682edi.5
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 00:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=gHXutIuFdQy5mootwNmpxNjk8VVMwy1bekLUfWMH6ys=;
 b=dzXYyo5oVTH81Sfvd1+3qfORnZk+BWbn9gOOymfaI3TGgLMTQfeCMd3feV49NAmIWi
 aggupDKPtsctP96Qovff/L3v3vjXOcJTjzR3MkhSPgyVYYXTyASz++Ql+cw+AYhPNJLR
 oKdJPxWAuD8vC/RxzpHuvP+3z4bp+z6qssRNiMQ6OB+0jFF+Z8XXKwUhEN3IKrrWbDl5
 YWV9b1Br3kcwV2El++XCRrB+TySHFNPjfcBJWyUBAuVACstpPFUCEPs0eZbIsmjClq5w
 7hXjvE8QD1Z3SjJxziTjpbCXSY0fYIz0zBMttsjoXaG8LSCz3tklhz/OsuzX2kJ82Dql
 kIGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=gHXutIuFdQy5mootwNmpxNjk8VVMwy1bekLUfWMH6ys=;
 b=edsrVKwXbGYZUVfD8ZfADC9IdcL4/1W1Q2Bwq93+Z9NEW3rN/ZtEMG/HI27fViPRsn
 8deEPlkxZ1huUCeFg/LxWpccmXCKsOFD2wS60FcPeEbzdO0BJDePDJeIE3on8HZT2nJQ
 ID5BZSFsKH93lyIDjOv85BhTg3iSYjsC2KDBodProLuDfWQ3JsRoi883w4CHxJwz74ut
 3W27D010OnkZawOfrE68428q743/iUEom9x65HCBNWDUrYSe6rpywimroFiFo6dV+w+P
 AH6JVHp12PGuk/t+MZGkALdXrCB633vKxUt5tcQFhvAdcX9PX7+z3UKZJOb48An3CU6D
 NbYw==
X-Gm-Message-State: AOAM532en6ZX8LlrhDqErywiQZnweNrCNJFqq4X18zpQFYgvPvi4WIVj
 w2Af2nlbC1GPGdnzQATXYAn+zA==
X-Google-Smtp-Source: ABdhPJwlbXWD4NNbNp2EnGmEfncUyvdyXYNMKbzAIWNoJnOEmHkoBdax6oAz16fSvZC2m7J5e8Ng0A==
X-Received: by 2002:a50:e14c:: with SMTP id i12mr42676451edl.125.1635319881057; 
 Wed, 27 Oct 2021 00:31:21 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id t19sm10183001ejb.115.2021.10.27.00.31.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 00:31:20 -0700 (PDT)
Message-ID: <a800215e-2f7a-522c-2167-c1b045e0ff88@mind.be>
Date: Wed, 27 Oct 2021 09:31:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>
References: <20211024234715.2138507-1-james.hilliard1@gmail.com>
 <dae8536a-421b-046d-9103-b6ee28d73231@mind.be>
 <CADvTj4rVtzZMEOZLhJVQyq2fu4BEjhM6nPCrtw1dVcfHccu8zg@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADvTj4rVtzZMEOZLhJVQyq2fu4BEjhM6nPCrtw1dVcfHccu8zg@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH v2 1/2] package/python-markupsafe: bump to
 version 2.0.1
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
Cc: Grzegorz Blach <grzegorz@blach.pl>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>, Lionel Flandrin <lionel@svkt.org>,
 Matt Weber <matthew.weber@collins.com>, Norbert Lange <nolange79@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/10/2021 23:28, James Hilliard wrote:
> On Tue, Oct 26, 2021 at 1:26 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>    Hi James,
>>
>> On 25/10/2021 01:47, James Hilliard wrote:
>>> Drop python2 support.
>>>
>>> Remove python3-markupsafe host build as python2 host builds for
>>> markupsafe are not supported, python3 host builds are moved to
>>> python-markupsafe.
>>>
>>> Remove python3-jinja2 host build as python2 host builds for
>>> jinja2 are not supported, python3 host builds are moved to
>>> python-jinja2.
>>>
>>> Propagate reverse python3 dependency.
>>
>>    That turns out to be difficult...
>>
>>    There is one dependency you missed: host-python-mako depends on
>> host-python-markupsafe. Since the latter is python3-only, that means that
>> host-python-mako also becomes python3-only.
> 
> Ok, I'll propagate to that as well and consolidate it like with jinja2.
> 
>>
>>    And host-python-mako has a bunch of reverse dependencies:
>>
>> - gnuradio: we need to add a depends on !BR2_PACKAGE_PYTHON;
>> - jailhouse: the helper scripts are currently marked as python2-only, so they
>> just become unavailable. But maybe they already do support python3.
> 
> Yeah, seems they support both python2 and python3 now.
> 
>> - piglit: already python3-only;
>> - sdbusplus: already python3-only;
>> - uhd: we need to add a depends on !BR2_PACKAGE_PYTHON.
> 
> Hmm, seems the python API for that already depends on BR2_PACKAGE_PYTHON3.
> 
> Guess the host dependency just needs to be appropriately set.
> 
>>
>>    Alternatively, we could patch python-mako to avoid the dependency on
>> host-python-markupsafe.
>>
>>
>>    And then there's a similar problem for python-jinja2. Fortunately in that
>> case, it's just systemd that is affected, but it means that systemd is not
>> supported with python2. And that is a really tricky dependency to add, because
>> you really don't want that selecting BR2_PACKAGE_PYTHON suddenly causes the init
>> system to change. So we'd have to revert that dependency and instead make
>> python2 depend on !BR2_PACKAGE_SYSTEMD. Fortunately there's no longer anything
>> that select BR2_PACKAGE_PYTHON, so nothing to propagate...
> 
> Isn't it just a build dependency for systemd?

  Yes it's a build dependency. Same for the others I mentioned, BTW. However, 
when BR2_PACKAGE_PYTHON is selected, all host-python-modules are built for 
python2, not for python3. That's why the python3-foo packages are introduced.


  Regards,
  Arnout


> Unconditionally using
> the host python3
> only version should be fine I think.
> 
>>
>>
>>    Final alternatives: get rid of python2 with more expedience. Getting rid of it
>> completely would be nice of course. An in-between solution would be to no longer
>> support host-python modules, i.e. even if you build python2, all
>> host-python-modules are still built for python3 instead. It's also a big one,
>> probably some stuff will break, but the autobuilders will find out.
>>
>>
>>    Regards,
>>    Arnout
>>
>>
>> [snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
