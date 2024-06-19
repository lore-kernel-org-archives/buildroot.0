Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5A4C27C79
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 18:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D2AD40025;
	Wed, 19 Jun 2024 18:35:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3HlohSg0ETV4; Wed, 19 Jun 2024 18:34:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25F3E40531
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25F3E40531;
	Wed, 19 Jun 2024 18:34:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 35EE11BF83C
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 18:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E93040633
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 18:34:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MKfNRwzzIAPm for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 18:34:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1C5F440547
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C5F440547
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C5F440547
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 18:34:55 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42249a4f9e4so857525e9.2
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 11:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718822093; x=1719426893;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ANU5x5n/tm0vXEw72jBbSxY9H2bagZ7pJm/RQE5SuIY=;
 b=ttbh2hRm9v1lwYqbzuE+Njz5AlFGu0hV4qdKzHbGQWdMSXj/Wph7UNzqmTes+nuhRz
 o6cX0fBJl26ZqvvUcQd2y3S7g899PA7sKdAMhXMVqFidwYt5tq5dnSGo9Cn7TNLphIt2
 SLto0OVvjY3r3hiFqj6ImIrtuuXAuuMcpHxb83nWtLk6prMLCJjnD+271N9WXARzoZL3
 KyFJpCtCGv8PTz83qOicHFRbFFpWK2UbyJ9XrPddxUjssZ/StzPsu7y/IvkvKzKQ6g5J
 HfnKTz88N5vHhjTB1s5o4/pJxL/aX+rF5l29P/k/js1NcGxJ8V2uDehiFsO+MtqBSqvo
 2lQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoSkHPnwNuT7xI4vreHAkCKRi0A1qDf5axA9cZFV7WZ/QBfl23l0GJVurzSws7m7lwfJu7kVi3JiUi2JlSJyoMhnaZATaLYg==
X-Gm-Message-State: AOJu0YzB8zEr+onjs0UBq1jpNzjWlnL6iAJeZrmwBL9cY7AhNhRXqDvg
 o+8ob3OybvDCsyUY9yOgTZfkejF7cRUpP+kNBktx+CFXtTejE18GWTjxoWeigNI=
X-Google-Smtp-Source: AGHT+IELp4DNixANCrP1GvbyOf+lpbcckY3mlWf0gpAKH+679GBQet/81Y5fAbzPRjoJ0gv4e6Wq2Q==
X-Received: by 2002:a7b:cd17:0:b0:424:72ea:c4b with SMTP id
 5b1f17b1804b1-4247518649cmr23571835e9.24.1718822093341; 
 Wed, 19 Jun 2024 11:34:53 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f602efc4sm240479375e9.15.2024.06.19.11.34.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 11:34:52 -0700 (PDT)
Message-ID: <3ce1eba6-5137-42ed-840b-b6fab9bebb3e@mind.be>
Date: Wed, 19 Jun 2024 20:34:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Knight <james.d.knight@live.com>, buildroot@buildroot.org
References: <CALAjcgXZKYjpsFV1E7Ry-0N5NEGV01hebSb8tEgoAtHvkfvCOA@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CALAjcgXZKYjpsFV1E7Ry-0N5NEGV01hebSb8tEgoAtHvkfvCOA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1718822093; x=1719426893; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ANU5x5n/tm0vXEw72jBbSxY9H2bagZ7pJm/RQE5SuIY=;
 b=Jwn3XpR8sXo39w717bUw0oOtYXcJaYg556BWloxKlSHXmE5Wmm6/0KJKZtBWmJ/udt
 R9HnVtsmJLof7Tq3JByajSs1Aqcfnowmqy9j5YBjHZYBXEaDQ6qwNTugGPBTFi+Xk5/w
 m0K/885waFpYaI2rqAXIS+1Pl/9LQU78XXmdWk/N1/LKZg7GNhkNpHOVdGy2QziMGAGd
 2c9oqYaar0nwfrjqwiMA47vJtg6N20uJX6/9MsiULQIzrumgpxawWG+KBQQyHiMAaiDv
 46U+YyT4Jw9d9dd9giGXgmqE1Wj/2btRKVZQZxVIGLTCrrkGQnLk0K31uZBu9ElUYvA4
 oynw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Jwn3XpR8
Subject: Re: [Buildroot] inquiry | configuring for a specific linux lts
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



On 14/06/2024 20:35, James Knight wrote:
> Trying to figure out the best way with Buildroot to target a specific
> Linux LTS branch for images. At this time, using a setup that has an
> external toolchain build (v6.6.x Linux headers) and inside each
> project configurations a `BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE`
> option is specified to a value of (for example) `6.6.32`. As Buildroot
> evolves, it may update its own configuration and Linux hashes to a
> more recent version (e.g. v6.6.33). In turn, when updating the
> Buildroot version to use, there is a need to update all configurations
> to use the most recent LTS version.
> 
> I am looking for a capability somewhat provided by the existing
> `BR2_LINUX_KERNEL_LATEST_VERSION` option, but targeting a specific LTS
> version. For example:
> 
>      BR2_LINUX_KERNEL_LATEST_VERSION
>      BR2_LINUX_KERNEL_LATEST_LTS_0606_VERSION
>      BR2_LINUX_KERNEL_LATEST_LTS_0601_VERSION
>      BR2_LINUX_KERNEL_LATEST_LTS_0516_VERSION

  You probably meant 5.15 here :-)

>      ...
> 
> Then these configurations can use whatever the latest LTS version of a
> configured major-minor without updating.

  I agree with this approach, and I pushed my colleague Marleen to do exactly 
that for TF-A:

config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_8_VERSION

  (Note that I'd make it LTS_6_6 and not LTS_0606, because upstream is also 6.6 
and not 6.06, but that's nitpicking).

  And the idea is that the in-tree defconfigs also use this LTS option - this 
means that our defconfigs get security updates "for free", but on the other hand 
they won't have been runtime tested with the exact same kernel version.


> I imagine this may not be implemented since these additional
> configuration options may be a bit too much to maintain.

  Since upstream is going to fade out LTS maintenance to just 3 years, it's not 
going to be that bad on the longer term. By 2027 there should be just 3 active 
LTS branches.

  Also it's super easy to script updates to the LTS versions.


> Assuming such
> an approach is not desired, I wonder if it may be possible to support
> a `BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE` option where users can
> define a value such as `6.6.` (or `6.6.x` or whatever) and have
> Buildroot use whatever the most recent version it "supports" (e.g. has
> a hash reference).

  Maintaining the hashes is actually most of the work, the Config.in symbols 
themselves don't need to be modified.


  Regards,
  Arnout

> For now, it seems the tasks needed to handle an updated Buildroot
> framework with a custom Linux version is to first have projects
> track/patch the hash version of Linux any time a custom version is
> set; and update both the version and patch-hash in a board
> configuration when wanting to update.
> 
> If I am overlooking another way to approach this, please let me know.
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
