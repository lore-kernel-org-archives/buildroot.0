Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D2D0C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:26:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9500360EFF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9500360EFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32DEE80ED2;
	Tue, 26 Oct 2021 19:26:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w5J4IkAHwOZL; Tue, 26 Oct 2021 19:26:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8340C80EE8;
	Tue, 26 Oct 2021 19:26:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 768641BF3CD
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 642B060657
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:26:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fWWrkogRZA0j for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 19:26:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D7D8160A3B
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 19:26:01 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id u13so710167edy.10
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 12:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=88N4mSdVs3Fx8XMtjMqxjf23udsz6P9JGB3T0AL8GVg=;
 b=RhBOkokRN2t17hW3PmMBqNHKD3+zKFd9FNK/PsSlndngb+1admV9bWeJ11REfj6Waf
 igwKT0IRfJaCl1mjUO6e8so+KJKvEKeY4qPhnAN4TB8IE7/F3cfsjhRJB2GWx2E/psbr
 9+pBWhKX7m8Ogj6iWiF1tAwNkEadycVKNSpV4z6b5RZG9mHhiLC9ygBB1txbQuXGp9HC
 xgLlmAAUh2irGSuRE58TkwUVzlt6Au100VNzt99Q08RyTJUzYllr+tKsbSTnw4Os7YID
 jCBxAx5d4jd9a4949qc5R7npo6ENY5peTkvfjOE9Xj4or5v6wTqz0TVmKs1VP4PoimjZ
 vkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=88N4mSdVs3Fx8XMtjMqxjf23udsz6P9JGB3T0AL8GVg=;
 b=p7aIN4Bo1/11TRCBV8VUwQkEbmpn/56rPzJ+ogQlbUXd0AYa31Lrp4TdjKz9feHtc0
 nRKtarBiJKCCStejclInPljCBQpyHxtgf8CyKFdREUZVDa6wwYbIfN1f/PNnILYdr3yW
 rCe+gy5lAHacSjviqlwV0xi4188LOHSKi7Bvk+13Q0n3A+1Tp5j5UwQzPMKuAGezfpgK
 fNKntMK8g5Ez+3xniPkCuAaF9scblbA/q2o1BjzLn9IpNeD4VhOk+6dcgtTh+sCjgFcP
 gXeOWBEoCSNB9NbqSi8VHEZpjWkLIz/ixJfWlCGWynxSt5JfP+eO8srk1hvCGhIqpSc9
 sJTQ==
X-Gm-Message-State: AOAM533p8NkTufBzMEjPpppm50Iqf/A/W/6oWwP0FMpPiIi0WjPnTg7+
 V1M6fazT0F/XIFNVnohtlKBBklUhQPeZjg==
X-Google-Smtp-Source: ABdhPJw33vR3wwMyQIHAx/a4O+qNDQbZs5OjI7yr4H1o3+ocWSOn1Gqv4Bnj7szsKnWCyAkj/0kZAw==
X-Received: by 2002:a17:906:38db:: with SMTP id
 r27mr32137635ejd.338.1635276359889; 
 Tue, 26 Oct 2021 12:25:59 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id x22sm11494880edv.14.2021.10.26.12.25.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 12:25:59 -0700 (PDT)
Message-ID: <dae8536a-421b-046d-9103-b6ee28d73231@mind.be>
Date: Tue, 26 Oct 2021 21:25:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20211024234715.2138507-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211024234715.2138507-1-james.hilliard1@gmail.com>
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
 Lionel Flandrin <lionel@svkt.org>, Matt Weber <matthew.weber@collins.com>,
 Norbert Lange <nolange79@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi James,

On 25/10/2021 01:47, James Hilliard wrote:
> Drop python2 support.
> 
> Remove python3-markupsafe host build as python2 host builds for
> markupsafe are not supported, python3 host builds are moved to
> python-markupsafe.
> 
> Remove python3-jinja2 host build as python2 host builds for
> jinja2 are not supported, python3 host builds are moved to
> python-jinja2.
> 
> Propagate reverse python3 dependency.

  That turns out to be difficult...

  There is one dependency you missed: host-python-mako depends on 
host-python-markupsafe. Since the latter is python3-only, that means that 
host-python-mako also becomes python3-only.

  And host-python-mako has a bunch of reverse dependencies:

- gnuradio: we need to add a depends on !BR2_PACKAGE_PYTHON;
- jailhouse: the helper scripts are currently marked as python2-only, so they 
just become unavailable. But maybe they already do support python3.
- piglit: already python3-only;
- sdbusplus: already python3-only;
- uhd: we need to add a depends on !BR2_PACKAGE_PYTHON.

  Alternatively, we could patch python-mako to avoid the dependency on 
host-python-markupsafe.


  And then there's a similar problem for python-jinja2. Fortunately in that 
case, it's just systemd that is affected, but it means that systemd is not 
supported with python2. And that is a really tricky dependency to add, because 
you really don't want that selecting BR2_PACKAGE_PYTHON suddenly causes the init 
system to change. So we'd have to revert that dependency and instead make 
python2 depend on !BR2_PACKAGE_SYSTEMD. Fortunately there's no longer anything 
that select BR2_PACKAGE_PYTHON, so nothing to propagate...


  Final alternatives: get rid of python2 with more expedience. Getting rid of it 
completely would be nice of course. An in-between solution would be to no longer 
support host-python modules, i.e. even if you build python2, all 
host-python-modules are still built for python3 instead. It's also a big one, 
probably some stuff will break, but the autobuilders will find out.


  Regards,
  Arnout


[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
