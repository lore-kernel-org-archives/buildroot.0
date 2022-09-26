Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1C4C6FA83
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 13:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47E1282572;
	Mon, 26 Sep 2022 13:12:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47E1282572
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kaefj9uLc3db; Mon, 26 Sep 2022 13:12:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57E418246F;
	Mon, 26 Sep 2022 13:12:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57E418246F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 891171BF345
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 13:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63B2260F72
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 13:12:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63B2260F72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x6Dh7MVu0TKh for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 13:11:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC67C60672
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC67C60672
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 13:11:58 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id z6so10192346wrq.1
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 06:11:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=n2U59qBIb2oK2yK6vZ3lj9RJ5Jsj12r65ZAXVfOKh7s=;
 b=z7HRt8rUVP5yEU9O7+j/y9YSR9fHy2Gc/y656zmNTjrH+c2KFJNxQk2vUQ8hMYMfLD
 zFjcxf7J4A2yZ8MOS/rFPXnK3NxNkA7GwqlQPHRrypHIIDcmGrWYg/67kTwu/GnDqTEZ
 A7pTdneAMI8QdOY1o8+0Z62sHkUOzcA4CYHkyun1UgTvRrWZtRlF3drvBypHLASvWfIi
 JPfCo/tyfSMX/g9N6ppuuLlGnKz7uS160BD6b3ngX1MEFehWaw9alCjP1nLhqUSHIma5
 +HKTVkUc0CWnc+rBHdjtWDIB4WzG5mlSZE3+R9yzL/MOZL7jcGREqPYha8Q1z0oOYqcg
 06CQ==
X-Gm-Message-State: ACrzQf1awnhELZR3rtw5/mLS2nB8TGOFWinS4Wb3scEcoGcRwbfDvaOt
 ZJTfaAIoD6H10/iuunPDoEvn5putSkasuudt29w=
X-Google-Smtp-Source: AMsMyM7IMNtxsLfI/Z2VWypF2LLY4yPOpngsmGe/3uAJibrgS3frYoVWqkjBzPlgHW2DSBJgZBAPoTgS90w17NiTuTM=
X-Received: by 2002:a05:6000:1547:b0:22b:5c7:a241 with SMTP id
 7-20020a056000154700b0022b05c7a241mr13425625wry.207.1664197916985; Mon, 26
 Sep 2022 06:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220809075704.86472-1-ardeleanalex@gmail.com>
 <20220925102714.163869b8@windsurf>
 <CA+U=DsrMnh-60tcZKk7r41h5kyuGR5Cni7S5D6pTA0UpR4oE7Q@mail.gmail.com>
 <CA+U=DspSC9f3P-m3DnBRnKb9-F4UtY7BynBTgytPsORZ3TY0cA@mail.gmail.com>
 <20220925204113.2c1f4d86@windsurf>
In-Reply-To: <20220925204113.2c1f4d86@windsurf>
From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Mon, 26 Sep 2022 16:11:45 +0300
Message-ID: <CA+U=DsoOaKjrY9Apsj7q9N6PNPMHRau4X0c97BHXJjriAO+nyw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=n2U59qBIb2oK2yK6vZ3lj9RJ5Jsj12r65ZAXVfOKh7s=;
 b=H/jfnQUFISIqGodXfsakwVgb+f4d7sk8ErSQMNqYeeZmaOE0ZtPC1ZG6B6gNIsLyRp
 Lvn7WtExAjdbCv03mHYWYNzucq5OD5qFjRlckgSq1kPj15MrBERG3oSsgVo+4pALYIfL
 41Y0nWBLxo0JDBO4oBDhUNsiSHZzdM1HhZsEwUuiI9dkOS9jmYW2tFoplih7xdQyyhK5
 woj+KE2qfhvkh7cNZFlV+yKQR8+/R0gz/BHCGl4b8/TOMTYvSs9DK2v8diS6Reyb+5w4
 L1Pp01KRHrQhG2iBEolR4n2Vi7ErlmNsal3NgtK15A1OK1RcBJp8mf1pC6iF5Qlrmk/z
 BocQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=H/jfnQUF
Subject: Re: [Buildroot] [PATCH 00/13] package/nodejs: rework cross-building
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
Cc: fontaine.fabrice@gmail.com, aduskett@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Sep 25, 2022 at 9:41 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Alexandru,
>
> On Sun, 25 Sep 2022 19:15:56 +0300
> Alexandru Ardelean <ardeleanalex@gmail.com> wrote:
>
> > /home/aardelean/work/upstream/buildroot/output/host/bin/qemu-arm: not
> > found
> > Return code is 127
>
> Could you try again with the latest master? Yann just pushed the patch
> I submitted a few hours ago to fix this. You need to make sure you have
> at least commit:
>
>   https://gitlab.com/buildroot.org/buildroot/-/commit/a88ba1548a50d5599e0156d66063dd71545f910b
>

[ So, as I mentioned earlier, this message was in my Draft folder for a bit ]

Tested succesfully with master at this hash
https://gitlab.com/buildroot.org/buildroot/-/commit/a8a65d0951e4c93fbba8041ce8e7db1ba8809edc

Tested on ARM64 & ARM (RPi4), but with external ARM toolchain (to save
some time).
I believe that ARM{64} BR toolchains should work just the same.

Thanks
Alexandru

Alexandru

> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
