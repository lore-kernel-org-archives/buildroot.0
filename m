Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5EADC4320A
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 13:35:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4916660FA0
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 13:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4916660FA0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 012B840004;
	Mon,  2 Aug 2021 13:35:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AYdo8evRTFd6; Mon,  2 Aug 2021 13:35:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06FDB400C5;
	Mon,  2 Aug 2021 13:35:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 64DA21BF59F
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 13:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5510C8301F
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 13:35:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tWDB-20qNYLX for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 13:35:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 36C378267C
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 13:35:11 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id x90so24473598ede.8
 for <buildroot@buildroot.org>; Mon, 02 Aug 2021 06:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M+ZvXHvWtXAwMlUOLK3JSyAvhX2941nbWI5hHsh/744=;
 b=apndU0XmapwZOKmbt2KCa8n0g7yhF93z210lMuCQVcqeO71nFRF/97noS2uyYAtNAT
 9alc+ZpoU700G3iDO28OgY7S7lc5GKgmD2RtVnGSVYhH4SMW8L7IRWSbD9G9n4in0kjN
 pc21wQe44NSANTocXj4AqWcY4Ot1H8X4C2mNgqO20MXjw4yfgO4O+OTzL8upFE7Ql8ky
 O6pakcHCOUGXq5u2VZYLTZe9amuBXQ7KbD8bc1rkK7v6eibW5w3l5LSQNN6JWkrluxyS
 QQ2qRO6kZHJZbwXqnJAd1vk0tAiABSYYGPPv/qHfX7SvgFnJmEMyH+mIlV1iAmK6TahE
 hZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=M+ZvXHvWtXAwMlUOLK3JSyAvhX2941nbWI5hHsh/744=;
 b=qAHBqLFHJjJOy7nbf2PovOdziorSYyScwt61SQggnXCZSjSEtz0ps12Yk8xXGNzQ75
 HDgqvw49i920hn66WvYjT5T0mFxlEwOgc1mi3jW/LMXVMYjFmZZ6GcFQkHbPa5YTb8iW
 jOOs9LHujHi9DECp2jTM3AWf4o/pjs3QLvsAGtFMwYZo6F/eHoq+x4Knt8LadA2VYYyA
 hSLcIm48U7zCCebwTXm6PLPXoYw6HD0IEyzcHwxMxks0XRjjjeZc9GKWOVNFZD6KY9eg
 Zqg5CKb4xutbYhuKNLxibqgDibt27j0ZtjU0zadrUDKBved63sPUZHP1LxiR/u8GOB9O
 PTjQ==
X-Gm-Message-State: AOAM530V3J9cj5twFgf4gd0LrZ0T7nhkxvnDPe8oSXLVJA7GJc5skO0T
 +rhuvm+A8wSOku1niurq5bJHbx4dQC4tEcMTALs=
X-Google-Smtp-Source: ABdhPJyjaRHPo2GT7FIQtJAhPBq8cc6DY71CINRJbzItzxurhcUYV/Uv+NXXMNeZateu5ux9yo/dnQ==
X-Received: by 2002:a05:6402:2054:: with SMTP id
 bc20mr19704184edb.354.1627911310129; 
 Mon, 02 Aug 2021 06:35:10 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id v8sm3506227ejy.79.2021.08.02.06.35.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 06:35:09 -0700 (PDT)
To: Norbert Lange <nolange79@gmail.com>
References: <20210802123300.564709-1-arnout@mind.be>
 <CADYdroNf7PmpdHsfO_Hxz9ynWsLEcFVL9oX=+2nCMykuV3fNmw@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <72b42fa1-61a9-1217-cd2f-b8fc83f38f90@mind.be>
Date: Mon, 2 Aug 2021 15:35:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CADYdroNf7PmpdHsfO_Hxz9ynWsLEcFVL9oX=+2nCMykuV3fNmw@mail.gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH for-next] package/gtest: remove partial host
 package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 02/08/2021 15:09, Norbert Lange wrote:
> Am Mo., 2. Aug. 2021 um 14:33 Uhr schrieb Arnout Vandecappelle
> (Essensium/Mind) <arnout@mind.be>:
>>
>> gmock (which is part of the gtest package) has a host variant that is
>> not actually the full host package, but instead just installs a single
>> python script.
>>
>> This script, however, is no longer maintained and is not needed for most
>> practical uses of gmock. Even if it is used, its output is meant to be
>> hand-edited, so it shouldn't be used as part of the build flow.
>>
>> Therefore, remove the host-gtest package. A proper, full host package
>> may make sense (for building other host packages that use gtest), but
>> this single script really doesn't.
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> Cc: Norbert Lange <nolange79@gmail.com>
>> ---
>> Since we're so close to the 2021.08 release, this should probably be
>> delayed a little.
>> ---
>>  package/gtest/gtest.mk | 27 ---------------------------
>>  1 file changed, 27 deletions(-)
>>
>> diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
>> index 6447954e36..a9ac49957b 100644
>> --- a/package/gtest/gtest.mk
>> +++ b/package/gtest/gtest.mk
>> @@ -13,23 +13,6 @@ GTEST_LICENSE_FILES = LICENSE
>>  GTEST_CPE_ID_VENDOR = google
>>  GTEST_CPE_ID_PRODUCT = google_test
>>
>> -ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
>> -GTEST_DEPENDENCIES += host-gtest
>> -endif
>> -
>> -HOST_GTEST_LICENSE = Apache-2.0
>> -HOST_GTEST_LICENSE_FILES = googlemock/scripts/generator/LICENSE
>> -ifeq ($(BR2_PACKAGE_PYTHON3),y)
>> -HOST_GTEST_PYTHON_VERSION = $(PYTHON3_VERSION_MAJOR)
>> -HOST_GTEST_DEPENDENCIES += host-python3
>> -else
>> -HOST_GTEST_PYTHON_VERSION = $(PYTHON_VERSION_MAJOR)
>> -HOST_GTEST_DEPENDENCIES += host-python
>> -endif
>> -
>> -HOST_GTEST_GMOCK_PYTHONPATH = \
>> -       $(HOST_DIR)/lib/python$(HOST_GTEST_PYTHON_VERSION)/site-packages
>> -
>>  # While it is possible to build gtest as shared library, using this gtest shared
>>  # library requires to set some special configure option in the project using
>>  # gtest.
>> @@ -52,14 +35,4 @@ else
>>  GTEST_CONF_OPTS += -DBUILD_GMOCK=OFF
>>  endif
>>
>> -define HOST_GTEST_INSTALL_CMDS
>> -       $(INSTALL) -D -m 0755 $(@D)/googlemock/scripts/generator/gmock_gen.py \
>> -               $(HOST_DIR)/bin/gmock_gen
>> -       cp -rp $(@D)/googlemock/scripts/generator/cpp \
>> -               $(HOST_GTEST_GMOCK_PYTHONPATH)
>> -endef
>> -
>>  $(eval $(cmake-package))
> 
> add this here:
> $(eval $(host-cmake-package))
> 
> It works, and I see no particular reason not to allow the host package.

 We only allow host packages that are either a dependency of an in-tree package,
or have a Config.in.host entry. Otherwise, it's basically dead code.

 Regards,
 Arnout

> 
>> -# The host package does not build anything, just installs gmock_gen stuff, so
>> -# it does not need to be a host-cmake-package.
>> -$(eval $(host-generic-package))
>> --
>> 2.31.1
>>
> 
> With this change the patch is identical to my local version, and thus
> Reviewed-by: Norbert Lange <nolange79@gmail.com>
> 
> Norbert
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
