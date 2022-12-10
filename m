Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03485C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 10:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7441460B2A;
	Sat, 10 Dec 2022 10:02:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7441460B2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4viL4nyiYhYf; Sat, 10 Dec 2022 10:02:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1F4360ADA;
	Sat, 10 Dec 2022 10:02:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1F4360ADA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4CC301BF32D
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 10:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27ED860ADA
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 10:02:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27ED860ADA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PiTVbUWgKDQI for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 10:02:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E3AF607F5
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E3AF607F5
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 10:02:42 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id o12so7294325pjo.4
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 02:02:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s2caJFRal/K4s46roXXaUCiu4qa6HAsHUsfyskl16wA=;
 b=EfMW2xkj3hYajuTya2XoOz3A18qJoCm14HzfBspFs5HkVcqjN5pIkhF1HuPZUP64Ap
 KRfuzCUD0jVnD7xtWT2LO4bGyndtY5MJlq38l67bmpV/ohb+0dJac4KcbDgB9eeB63jO
 L5vVrIFUeIUZnI6uCv6xa+eqOHG5tH5fIV8SyjKWCcwwcfgCjE6jLQFs+SMy3eZ8kFZo
 ogBknFDEDbWXHsGSBV8PUM6tLQavBYrivCRbZ3ypxsm3fIPNeZRItxxN9Q5Iu3e8t/ff
 e8iIhC0q2Qfi36xVmnglDTK5Mu0A9WDkyu0ko74DW97my8c5CQu5jNBX6TjBZiwOMTay
 mHsg==
X-Gm-Message-State: ANoB5pmzX49VcbDqCD4sVyuVuyxotNGvfHVzhAtVV20nuEMsOeYf8h1P
 VzkQAOCObNiac2B5GUw0klppo2QyA4k=
X-Google-Smtp-Source: AA0mqf4y59IXPzIh/LsBOmMqfUOaKbrIgXPKhgTk5cw0L1N3oXd7B6ddZofsF5/8DS6M5tI6wY0nfw==
X-Received: by 2002:a17:90b:4cd2:b0:21a:2273:b85f with SMTP id
 nd18-20020a17090b4cd200b0021a2273b85fmr8230625pjb.18.1670666561837; 
 Sat, 10 Dec 2022 02:02:41 -0800 (PST)
Received: from [192.168.43.80] (subs09a-223-255-225-76.three.co.id.
 [223.255.225.76]) by smtp.gmail.com with ESMTPSA id
 e2-20020a17090a728200b00219bf165b5fsm2266976pjg.21.2022.12.10.02.02.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Dec 2022 02:02:41 -0800 (PST)
Message-ID: <07221b04-b25b-1f24-6ad2-872c66a086e7@gmail.com>
Date: Sat, 10 Dec 2022 17:02:37 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gwenhael Goavec-Merou <gwenj@trabucayre.com>
References: <1670597027-3905-1-git-send-email-gwenj@trabucayre.com>
 <20221209233009.6b003e99@windsurf>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20221209233009.6b003e99@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s2caJFRal/K4s46roXXaUCiu4qa6HAsHUsfyskl16wA=;
 b=GylDn9FmHH4NPqKYcQirat8Jx0n5yqRO5ueJfFiSThwKCoQvW6G1SMpxUPRITvNTPI
 /xFEx0glllenk1mLltmxGpqXJvsjKEFUHFhbeUg7Bg7WQTHtJ0U3pf5J+9anyGu6g60J
 YfjS8FzsdRGvx1kbVMnzIyaPAwCEKhQnT++Us5bKqP7IQsxEWYmBBeeLmvrTshmzfy9K
 I+b63MAYrAP50FT04ZywMi5/EM/yq0lj8uSNBDoy7XcfFLjGkLD6+9U9ni259l28Dvx9
 TcyaEWEOgCXAw0S7lhkXVJweC+EgkffAnNsi0jbJa2zzvzk5GCeal0nM8BiaKMXUiEph
 k4XA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GylDn9Fm
Subject: [Buildroot] Specific toolchain components version support (was Re:
 [PATCH v2] package/gnuradio: restrict gcc to >= 9.3.0)
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 12/10/22 05:30, Thomas Petazzoni via buildroot wrote:
> In any case, we need to patch out, because we can't express a
> dependency on >= 9.3.0 in Buildroot, we can only express a dependency
> on >= 9.x.
> 

If we go down to x.y requirement of toolchain components, we also need
to be able to select specific x.y (minor release) components version
when building the Buildroot toolchain. For example, someone targetting
Raspberry Pi 4 may require GCC 10.2.0, Binutils 2.35.2, and glibc 2.31
(these are versions used in Debian/Raspberry Pi OS 11). Linux kernel
headers are unaffected, since even custom tarball containing exact
kernel version can be specified.

Cc'ing Yann and Arnout to help sorting this out.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
