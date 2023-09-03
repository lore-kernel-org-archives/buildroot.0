Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE36C71153
	for <buildroot@archiver.kernel.org>; Sun,  3 Sep 2023 16:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A856F81DF3;
	Sun,  3 Sep 2023 16:09:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A856F81DF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c425-PG0m5He; Sun,  3 Sep 2023 16:09:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D76FA81DEA;
	Sun,  3 Sep 2023 16:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D76FA81DEA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACE3A1BF2EF
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 16:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FC6C81DEA
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 16:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FC6C81DEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Au4yceYJN45n for <buildroot@lists.busybox.net>;
 Sun,  3 Sep 2023 16:09:16 +0000 (UTC)
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3901C81D7C
 for <buildroot@buildroot.org>; Sun,  3 Sep 2023 16:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3901C81D7C
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6bd04558784so647432a34.3
 for <buildroot@buildroot.org>; Sun, 03 Sep 2023 09:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693757355; x=1694362155;
 h=content-transfer-encoding:mime-version:subject:references
 :message-id:cc:to:from:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=pDiFGZN44awBxwCzGflfDEX1Z8OQoprzgbu+q3T2lO8=;
 b=H0BaSGIfXXHV/KJvo2r818sdZczEd2yhm7uGgUyNqNlzMs17tO9ZCuBgtMtbzt1l5Y
 pKh9JHfIJy6y3C+VrSgCaF0ipA7sehg07/V//tmDGvE+/nPIg5VjpP7v8tlIXj0artEc
 GINZdZhXZqq02IkijoxO47EllkCX94eYhXbE3v3/jsO3bARixPJ7/BhL7q6AUYq4ZZb0
 OaDwFcLpXjQ2pbJcnTPM/BA9nGvOizyWA87Yb2vVR971QB37iibrFcBklAj2fdKJMpQ4
 avsfwRCxnEeFyGI0v/FN2mcBMpoY+z3UyAT1YWrGC2OCd6uQc095VZGR9zZStQTyfsPd
 4rLQ==
X-Gm-Message-State: AOJu0YwbHBX6GWWFF1cVbycWv8JA9Kx/3i7GGSRh30nX2gaGXKwGL1Bk
 TPKtDKqaEnfVdSL7FtACTRM=
X-Google-Smtp-Source: AGHT+IE9J8SVtQvl9oy4KIAIgO2BoUy8MApR325kzrVaEMpU9g3llf+R1aP/4HfTfLP1ArIQl/4gig==
X-Received: by 2002:a9d:4e8f:0:b0:6bd:c865:a618 with SMTP id
 v15-20020a9d4e8f000000b006bdc865a618mr9358494otk.13.1693757355173; 
 Sun, 03 Sep 2023 09:09:15 -0700 (PDT)
Received: from gmail.com ([2804:14c:7980:8b6b:3897:d6c:e635:bd4e])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a05683001c300b006b9b0a08fdasm3790879ota.59.2023.09.03.09.09.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 03 Sep 2023 09:09:14 -0700 (PDT)
Date: Sun, 03 Sep 2023 13:09:13 -0300
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: thomas.petazzoni@bootlin.com, 
 james.d.knight@live.com
Message-ID: <64f4afa94b245_809f62afed029a71c18861@xultri.mail>
References: <20230827002727.24097d99@windsurf>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="--==_mimepart_64f4afa6f211a_809f62afed029a71c187e";
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693757355; x=1694362155; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:subject:references
 :message-id:cc:to:from:date:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pDiFGZN44awBxwCzGflfDEX1Z8OQoprzgbu+q3T2lO8=;
 b=BPdXjOz/DJGbA+IdxhEwt0U2bZ5XhlMhwv0QSjw8Vbpkxyk6+CH+TTY7+siuejxyWF
 4y6Ywb8ugJkUXmwNWFPewHiQBV0eJNC6ObyufeXrNnVNN+1E9svLNg3NK5/8VLF6S4Ih
 uSgurlmOmUIuxeY+L63p6dpL2PPrKdB3TcbyiGDXv3pCUBJlo68c9aRbIFU9++eBf8/F
 XW2Gjln7IF52FhAyTZ2n9yN/MeK3lb5aHUblR5aCLS25z3YpGG6Fujth0NAqJMqx26SX
 CKmPh/4hjD88R5qzZvPzWvePR7XzeNswv7MNWVZhK6Bzx9e+2MuuH1cY0P7qk4ypJ8Zt
 MkoQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=BPdXjOz/
Subject: Re: [Buildroot] [PATCH 0/4] support ignore-indent for check-package
 configs
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
Cc: buildroot@buildroot.org
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


----==_mimepart_64f4afa6f211a_809f62afed029a71c187e
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

On Sat, Aug 26, 2023 at 07:27 PM, Thomas Petazzoni via buildroot wrote:

> Hello Ricardo,
> 
> Since you're the main maintainer of the check-package logic, I really
> would like to have your opinion about the approach taken in this patch
> series. I think the feature makes sense, but I don't know if the
> implementation is really in line with the philosophy of the existing
> code. If you could give your opinion, it would be very useful.

Sure.
Sorry the long delay.

> On Sat, 29 Apr 2023 14:12:01 -0400
> James Knight <james.d.knight@live.com> wrote:
> 
>> The following series brings support for having a linter hint in
>> configuration files to avoid having `check-package` warn about bad
>> indentations for container-like configurations.
>> 
>> Buildroot ignores indentations for the root package configurations as
>> well as kodi/x11r7 packages. These configurations reference other
>> configurations, which makes it somewhat preferred to indent packages
>> under a menu option. For example:
>> 
>>     menu "<category>"
>>         source "package/<ref>/Config.in"
>>         ...
>>     endmenu
>> 
>> To prevent `check-package` from triggering a warning, an internal list
>> inside `lib_config.py` is maintained. This is less than ideal since (1)
>> it requires adjusting the library script if future "category"
>> configurations are added/removed, and (2) does not provide a way for
>> br2-external trees to utilize the same exceptions. For example, if a
>> br2-external tree manages a `Config.in` with pending upstream packages:
>> 
>>     menu "Target packages (Queued upstream)"
>>         source "$BR2_EXTERNAL_BAR_42_PATH/newpkg1/Config.in"
>>         source "$BR2_EXTERNAL_BAR_42_PATH/newpkg2/Config.in"
>>     endmenu
>> 
>> Utilizing Buildroot's `check-package` call on this file will generate an
>> indentation warning.
>> 
>> What this series brings is the ability to add a `ignore-indent` flag
>> into configuration scripts to avoid `check-package` from generating
>> errors for select files. Continuing with the above example, adding the
>> flag as follows will no longer generate an indentation error:
>> 
>>     # noqa: ignore-indent
>>     menu "Target packages (Queued upstream)"
>>         source "$BR2_EXTERNAL_BAR_42_PATH/newpkg1/Config.in"
>>         source "$BR2_EXTERNAL_BAR_42_PATH/newpkg2/Config.in"
>>     endmenu
>> 
>> This change allows dropping the internal list of configuration
>> exceptions (for package/Config.in, package/Config.in.host, kodi and
>> x11r7), to instead use the `ignore-indent` flag in the respective files.

This is a great idea.
I have a few implementation comments that I will provide in patches 2
and 3.

While reviewing the series I also came across an improvement in the code
that I hope can make easier to add such support.
I will sent a patch shortly with this improvement.

As a tip for further development in check-package (to catch for instance
any issue while splitting patches, like it occurred in patch 1 and is
already fixed in 'next' branch) I usually use below commands while
developing patches:

$ utils/docker-run utils/check-package -vv --include-only Indent package/example1/Config.in
$ utils/docker-run python3 -m pytest -vv utils/checkpackagelib/
$ utils/docker-run support/testing/run-tests -s -o o -d d -k tests.utils

together to the more obvious one:

$ utils/docker-run make check-package

utils/docker-run is not really needed. I use it only to provide
reproducible environment without effort of installing dependencies.

Regards,
Ricardo
----==_mimepart_64f4afa6f211a_809f62afed029a71c187e
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

----==_mimepart_64f4afa6f211a_809f62afed029a71c187e--
