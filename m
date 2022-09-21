Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0286ECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 21:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EDF440498;
	Wed, 21 Sep 2022 21:05:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EDF440498
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7BUgig9NG5Oh; Wed, 21 Sep 2022 21:05:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A80D4059C;
	Wed, 21 Sep 2022 21:05:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A80D4059C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E6BB91BF25B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 21:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEB2B817B0
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 21:05:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEB2B817B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k2oAk1jAJFPO for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 21:05:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5576880A89
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5576880A89
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 21:05:00 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id e17so10642230edc.5
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 14:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=kaJzGT9fc996N4EUErrIvBHeLM+0D96QtkL3nnIpkRo=;
 b=tcuI9xpB9BB4H2/3UCuz9EwMXE5WI6hXm7alwLuhWT3NQGELtjfm2cEgEBYEoeC2Sd
 Vtto3SiOd1TKmAGGr7wM5Ij40LQcpLF2g5I+gJmH7A7e0BqW0phlvBclj+ZmkTIQp1RR
 /dZ6BFGLdKu0tUeWXGy7C04UHg9DpbzzLQhRZd8G9UFx05ko8MmdtMEuPSnqcs9hQmlP
 lbmJLJMIFEQZdt77KpAIum99P14j0F6j00AkCfbNfcxCNJuckHkauqhtsE+/VC6OQ3yM
 mUi+5FsJIbGQgzwJClXFAbjyqGXYWHVrWhToads8m4IbmGHiSafreMQPi3TnV9Zaylb1
 3YaQ==
X-Gm-Message-State: ACrzQf2zO7zfRx+0DVejSnskbMr98EpBtmdJs4juS+ZHah/eZ5Ezov/X
 xWXHHwRSV+29N+WzcTvteyeGEbpdulNKVg==
X-Google-Smtp-Source: AMsMyM4KS1JJHhAIt55lDh4o4jiAAjyXpC3CERa+yqBbIiaFmUNq7+4sKiiEQ59ASJPSNoGJuMJaug==
X-Received: by 2002:a05:6402:28ca:b0:43b:5235:f325 with SMTP id
 ef10-20020a05640228ca00b0043b5235f325mr22208edb.320.1663794298286; 
 Wed, 21 Sep 2022 14:04:58 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com.
 [209.85.218.53]) by smtp.gmail.com with ESMTPSA id
 24-20020a508e18000000b0044f0c01196esm2433975edw.65.2022.09.21.14.04.57
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 14:04:57 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id bj12so16422707ejb.13
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 14:04:57 -0700 (PDT)
X-Received: by 2002:a17:906:da85:b0:741:40a7:d08d with SMTP id
 xh5-20020a170906da8500b0074140a7d08dmr131885ejb.263.1663794297319; Wed, 21
 Sep 2022 14:04:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220921205815.1082192-1-giulio.benetti@benettiengineering.com>
 <20220921205815.1082192-2-giulio.benetti@benettiengineering.com>
In-Reply-To: <20220921205815.1082192-2-giulio.benetti@benettiengineering.com>
Date: Wed, 21 Sep 2022 14:04:46 -0700
X-Gmail-Original-Message-ID: <CA+h8R2oJOq0RcPnX+0W-HC6omsF9JivDAAiCVdTarwWZFpfMpQ@mail.gmail.com>
Message-ID: <CA+h8R2oJOq0RcPnX+0W-HC6omsF9JivDAAiCVdTarwWZFpfMpQ@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=kaJzGT9fc996N4EUErrIvBHeLM+0D96QtkL3nnIpkRo=;
 b=U+z99FtDQ0eqJFxuHt28SFJsgeAJ7uq9psdltLtCTb1dHa3Xa66I6bbHgndRHZ3jY9
 7GvAw/tm0EQdm6+dj7Drb65KbO8y5xdw4iwX2PuPr75ZU7tZooxK8VRTXLVP7BzGpaIm
 bVm8jBXblDw6kS4ClYoLSnZMxEQFKZ168FZonGszgg3Ijs3flbrLdQAVhz7p1N35NXmx
 31yZkjlQMxVHZwVvXqsmtFGaxwbcIou2fdnFWEtJYV7IZRlKY85e0JYdA+KW1GGuIlht
 01woOWWEdy1bdm0IcJRtxO3buT6meyweTRkkAWNTsQiORtUAC+YOr0SZt5GxUTHqvaeJ
 ViNQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=U+z99FtD
Subject: Re: [Buildroot] [PATCH 1/1] package/rtl8821au: move upstream and
 fix missing linux options
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============5475889279659286934=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5475889279659286934==
Content-Type: multipart/alternative; boundary="000000000000124a6f05e9364cf2"

--000000000000124a6f05e9364cf2
Content-Type: text/plain; charset="UTF-8"

Hi all,

On Wed, Sep 21, 2022, 1:58 PM Giulio Benetti <
giulio.benetti@benettiengineering.com> wrote:

> This package builds to fail with Linux > 5.15 and abperiasamy's
> rtl8812AU_8821AU_linux repository is not maintained since 2 years and
> there is not a fork where all pending patches have been upstreamed, so
> let's switch to lwfinger's rtl8812au repository that is well maintained
> with Linux up to version 5.18 supported. While switching let's drop all
> local patches. Also add me as maintainer for this package in DEVELOPERS
> file.
>

We have been using this fork in SkiffOS for over a year now, works fine.

https://github.com/skiffos/buildroot/commit/1ace9158ec1000099b2f474cc01ffb019ac046fb

Reviewed-by: Christian Stewart<christian@paral.in>

--000000000000124a6f05e9364cf2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi all,<br><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Sep 21, 2022, 1:58 PM Giulio Benetti =
&lt;<a href=3D"mailto:giulio.benetti@benettiengineering.com">giulio.benetti=
@benettiengineering.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">This package builds to fail with Linux &gt; 5.15 and abperiasamy&#39;s<=
br>
rtl8812AU_8821AU_linux repository is not maintained since 2 years and<br>
there is not a fork where all pending patches have been upstreamed, so<br>
let&#39;s switch to lwfinger&#39;s rtl8812au repository that is well mainta=
ined<br>
with Linux up to version 5.18 supported. While switching let&#39;s drop all=
<br>
local patches. Also add me as maintainer for this package in DEVELOPERS<br>
file.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">We have been using this fork in SkiffOS for over a year now, works fin=
e.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><a href=3D"https://gi=
thub.com/skiffos/buildroot/commit/1ace9158ec1000099b2f474cc01ffb019ac046fb"=
>https://github.com/skiffos/buildroot/commit/1ace9158ec1000099b2f474cc01ffb=
019ac046fb</a><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">Revie=
wed-by: Christian Stewart&lt;<a href=3D"mailto:christian@paral.in">christia=
n@paral.in</a>&gt;</div><div dir=3D"auto"><br></div></div>

--000000000000124a6f05e9364cf2--

--===============5475889279659286934==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5475889279659286934==--
