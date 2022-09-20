Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA1CC54EE9
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 20:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65D6260F9D;
	Tue, 20 Sep 2022 20:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65D6260F9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CdZhZggHEWX3; Tue, 20 Sep 2022 20:39:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51D2160F2F;
	Tue, 20 Sep 2022 20:39:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51D2160F2F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D1271BF82C
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 20:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC4EF82605
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 20:39:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC4EF82605
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wWRJFToMdb0Q for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 20:39:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48AD682591
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48AD682591
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 20:39:37 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id bj12so8963636ejb.13
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 13:39:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=e4m/Am+qcXbYwj1m9KR9NQVAjLx/asyD+OfcLmGM0z4=;
 b=t21KGdvq4txxLoyOVSIwU556yQldPLZHjAAcknz2ys8wUG5eyGETxem8ORNQZwsH+d
 RyIhWqeL6C8M0hZ3WAD+aMQn9k352YEwh+QcXY9FOeI5qy0//ET8CT+Z+0H2r2mpd5aL
 +c57suVdbblyrRKagqity9fXF4MaMFyaAxLHiBR/rTva+7H/FmbimT+Q4DtC3jUL+w2h
 m1BrSh1hF/cYoeGiJlE1Xlk5d61QN5nqbsKfQEVgbdKdgO/j4/xs9jIWU/mKt9wX/Atd
 /QaV6kfmeDUXytQ8uKfEOek2S/1GD5Wocm9FSThf36yYJFNMXZ41jnm8UFrAt6bt/002
 5mJQ==
X-Gm-Message-State: ACrzQf3q1UzAAY9spLh6A/Y8fiXyt3JmGeMmB/yrcIe4/nsdVrBO/vTH
 oc2DdAC2knC2ysP8wK+KARl83lqCpaHYtg==
X-Google-Smtp-Source: AMsMyM6uex/BDP8KjLCmh3JLvlt50S7rImfjcdF5VkqOtM/p9QLuwBBLU+DRQ8pdFxsvt8f9qiDk8g==
X-Received: by 2002:a17:907:7f04:b0:77d:5bad:46d7 with SMTP id
 qf4-20020a1709077f0400b0077d5bad46d7mr17868465ejc.663.1663706375322; 
 Tue, 20 Sep 2022 13:39:35 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 si17-20020a170906ced100b00780819f9e61sm358964ejb.131.2022.09.20.13.39.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Sep 2022 13:39:34 -0700 (PDT)
Message-ID: <2ec945e7-22ab-36c9-9ccf-ef022bcfb0ef@mind.be>
Date: Tue, 20 Sep 2022 21:48:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, yann.morin@orange.com
References: <20220920064550.520645-1-thomas.petazzoni@bootlin.com>
 <20330_1663659985_63296FD1_20330_21_1_20220920074624.GC3551@tl-lnx-nyma7486>
 <20220920103524.41ad225a@windsurf>
 <30931_1663665105_632983D1_30931_112_8_20220920091143.GD3551@tl-lnx-nyma7486>
 <20220920111919.784ffa7e@windsurf>
 <29653_1663666853_63298AA5_29653_380_1_20220920094051.GE3551@tl-lnx-nyma7486>
 <20220920115459.2aca37f7@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220920115459.2aca37f7@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=e4m/Am+qcXbYwj1m9KR9NQVAjLx/asyD+OfcLmGM0z4=;
 b=V0EHlg5lGMehyjkDZGN/nknKCs26WKbtHySpR7YvZ1H1MO/vGiMJ3IPWrB9zr7HG3Y
 RlnOa6lXjPfJcQ3HQI/HckTOAzgx5OOAErex+UYqPdND8IXG0PJcZUgVYYRHmPz0tcs4
 guiVzBV4JnILDFoL7vz9aX2d9RnI9cbSsWrtt01ahkeo7DiBvAw15GZ+gwSL8lJTC/iF
 jjlQwXpRBkjC5QIWiWn1Fk8GmZDsmvbmi1B4Dtlgqh/M9ZJcFSUDlBVIU6YmID3Hx5/m
 7kCovydW6gYjOSLis6qk0d524BwnZ6kn6GcZUqQq4ESzEvL0FXpGpegdjt5GR3Y6GAM8
 tDKg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=V0EHlg5l
Subject: Re: [Buildroot] [PATCH] support/scripts/check-host-libs: add new
 check on host binaries/libs
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/09/2022 11:54, Thomas Petazzoni wrote:
> On Tue, 20 Sep 2022 11:40:51 +0200
> <yann.morin@orange.com> wrote:
> 
>> That's because in your script, 'file' reads in DB for every file, while
>> the above only loads the DB for each set of a lot of files at once.
> 
> Ah, yes, indeed.
> 
> Another possibility is to not use "file" and just look at the first 4
> bytes of the files to identify ELF files, because that's really what
> matters.

  I was thinking the same thing.

date +%s
find host/*bin host/lib* -type f |while read f; do
         mime=$(file -b --mime-type ${f})
         if test "${mime}" != "application/x-sharedlib" -a
                 "${mime}" != "application/x-executable" ; then
             continue
         fi
         printf '%s\n' "${f}"
done | wc -l
date +%s
1663702163
69
1663702230


date +%s
find host/*bin host/lib* -type f |while read f; do
         if printf '\x7f\x45\x4c\x46' | cmp -s -n 4 - ${f}; then
             printf '%s\n' "${f}"
         fi
done | wc -l
date +%s

1663702312
111
1663702338


For comparison, just iterating over all files:

date +%s
find host/*bin host/lib* -type f |while read f; do
     :
done | wc -l
date +%s

1663702472
0
1663702473


  So:

- cmp of just 4 bytes still takes 26 seconds, but that's a big improvement over 
the original 67 seconds. Still it seems to be a bit long for just 13000 files - 
that's only 500 files per second...

- cmp also finds object files (mime-type application/x-object), and Go happens 
to dump a lot of those in lib/go/debug. This may cause the subsequent readelf to 
take a lot of time again.


>> What is the policy on requiring a pyhon interpreter on the host for
>> mandatory Buildroot infra? In my experience, doing things in python
>> rather than in shell, does indeed speed up things quite substantially.
> 
> We have indeed dropped python on the host as a requirement for the
> build some time ago. Probably doesn't make sense to reintroduce this
> requirement "just" for this. Even though practically speaking, a lot of
> the tooling around Buildroot (pkg-stats, graphs, etc.) already relies
> on Python, and most people are very likely to have Python installed
> anyway.

  I hate to say this, but we do still have perl as a dependency... If you want, 
I can ask my colleague Hugo to whip something up. But I don't expect you 
actually want that :-) No, seriously, what he writes is really readable. Still 
perl though.


  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
