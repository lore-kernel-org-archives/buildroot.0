Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382C8C4321E
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 14:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB98060BA4;
	Sun,  4 Dec 2022 14:24:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB98060BA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nxM3Nn1U-7Ty; Sun,  4 Dec 2022 14:24:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3CFE60B5A;
	Sun,  4 Dec 2022 14:23:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3CFE60B5A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E0B341BF3A6
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 14:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA8F740871
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 14:23:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA8F740871
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PwFtbJz8D8j5 for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 14:23:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B2A54085D
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B2A54085D
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 14:23:56 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 s9-20020a05683004c900b0066e7414466bso5802676otd.12
 for <buildroot@buildroot.org>; Sun, 04 Dec 2022 06:23:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vBbFYhyagc63gBqg8+UwFtZCtft7scMxJImI7WRhG3g=;
 b=bvSuY3XdzHPjOSF+bs8eP3Sr/TFd2vMgapgZwTHdQdyaiF0bdrHsEyCGJ9LE/7y/Yj
 JLWqhrn7sxJm9/J3OqiNv221qUy77ZbtJw2lnWmQ87KSmSHDOIeRbjzRmklIUXei3bub
 3hzjBqxUxUJp0ou/KK+6t5pmqI3A1aEWhmIfmxg3VuHjWgbhSF4sPShe4TTB0ATxE9BD
 VwLJuO41AsAhX77BI6B5CerUwvHuk5RW5hakwPl6uV5bEK8N+76FXbq3nimIgfByY58t
 dWlhqCircg/bazvxaH8TXAYZL+EoJUQHpAfr3VlKuJtiQlPlzPxoLY0IZKkypcSCrCCZ
 qwZg==
X-Gm-Message-State: ANoB5pm4rf+tIak61/H1+XM/XKC+p795lbfLE3p4g9A8O23y0weD27sq
 2OHrZc8uyRDNe4Z+lJ5N/sc21fJPKVV+stFpJEX9soiMYeMsLg==
X-Google-Smtp-Source: AA0mqf791DXbhvhP6iZrcG04YIrnTbWahp9j1adEYhCehYodWSLS7yQmpa7kvLxrrHfDr0IYWQiKJriUikXDbU8ZVOs=
X-Received: by 2002:a9d:5c16:0:b0:66e:abbc:cfe4 with SMTP id
 o22-20020a9d5c16000000b0066eabbccfe4mr1575313otk.102.1670163835242; Sun, 04
 Dec 2022 06:23:55 -0800 (PST)
MIME-Version: 1.0
References: <CA+fTLhj4PubMRELghtEYVCW3Q3FvEjK=mL=fOxdGNE_Jia6aOw@mail.gmail.com>
In-Reply-To: <CA+fTLhj4PubMRELghtEYVCW3Q3FvEjK=mL=fOxdGNE_Jia6aOw@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 4 Dec 2022 10:23:43 -0400
Message-ID: <CADvTj4obUchFLqXjWxQydTHc1FJLNA3y90RZ=FOQsceFOSuhdw@mail.gmail.com>
To: Indrek Kruusa <indrek.kruusa@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vBbFYhyagc63gBqg8+UwFtZCtft7scMxJImI7WRhG3g=;
 b=FTqOEFz+quAc7hNlSofcNagaGpU4h3BlA/QwClCmCU2R1le34U7rPgTV4p209GfJPd
 zO7WFgtrrohJ8vPqWkRLdyk73ZaEIzIZyzML1vK0sSA0qzdlS9Gp0AyBGqXk33IrlYrQ
 BVXkLDbsYv81rdtRvK9VgF4ZjTUvgFsswSGUvoNl1adFLomvGfbH7tf9gvE/FJMfgV4h
 dyRxjQjA21+kB27IrDAIFtM7A7CNfIvj5aTLaAvolJKw0yUBKI+YwgfUtW8BpK+0XpRZ
 XFER8+EKRIUtmURrKOJC7R0ktN5iKZHekmWoXq0nrKnOeddWKNtU3y1m/mV+LPhMANyM
 KEsQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FTqOEFz+
Subject: Re: [Buildroot] python 3.10.8 pip module seems to be broken in rc3
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Dec 4, 2022 at 10:17 AM Indrek Kruusa <indrek.kruusa@gmail.com> wrote:
>
> Hi!
>
> I am unable to resolve this error with pip (installed by selecting python-pip ):
>
> # pip
> Traceback (most recent call last):
>   File "/usr/bin/pip", line 33, in <module>
>     sys.exit(load_entry_point('pip==21.2.4', 'console_scripts', 'pip')())
>   File "/usr/bin/pip", line 25, in importlib_load_entry_point
>     return next(matches).load()
>   File "/usr/lib/python3.10/importlib/metadata/__init__.py", line 171, in load
>   File "/usr/lib/python3.10/importlib/__init__.py", line 126, in import_module
>   File "<frozen importlib._bootstrap>", line 1050, in _gcd_import
>   File "<frozen importlib._bootstrap>", line 1027, in _find_and_load
>   File "<frozen importlib._bootstrap>", line 1006, in _find_and_load_unlocked
>   File "<frozen importlib._bootstrap>", line 688, in _load_unlocked
>   File "<frozen importlib._bootstrap_external>", line 883, in exec_module
>   File "<frozen importlib._bootstrap>", line 241, in _call_with_frames_removed
>   File "/usr/lib/python3.10/site-packages/pip/_internal/cli/main.py", line 9, in <module>
>   File "/usr/lib/python3.10/site-packages/pip/_internal/cli/autocompletion.py", line 10, in <module>
>   File "/usr/lib/python3.10/site-packages/pip/_internal/cli/main_parser.py", line 8, in <module>
>   File "/usr/lib/python3.10/site-packages/pip/_internal/cli/cmdoptions.py", line 23, in <module>
>   File "/usr/lib/python3.10/site-packages/pip/_internal/cli/parser.py", line 12, in <module>
>   File "/usr/lib/python3.10/site-packages/pip/_internal/configuration.py", line 21, in <module>
>   File "/usr/lib/python3.10/site-packages/pip/_internal/exceptions.py", line 7, in <module>
>   File "/usr/lib/python3.10/site-packages/pip/_vendor/pkg_resources/__init__.py", line 35, in <module>
>   File "/usr/lib/python3.10/plistlib.py", line 61, in <module>
> ModuleNotFoundError: No module named 'xml'

Maybe needs to select:
BR2_PACKAGE_PYTHON3_PYEXPAT

>
> Is this an known issue?

The python-pip package in general does not work properly on buildroot
since buildroot doesn't provide compilers and such on the target.

>
> Best regards,
> Indrek
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
