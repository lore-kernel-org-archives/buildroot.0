Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7F0C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 20:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FECF4056A;
	Mon,  8 Aug 2022 20:48:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FECF4056A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bCEgaLyXGe92; Mon,  8 Aug 2022 20:48:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CEDE40571;
	Mon,  8 Aug 2022 20:48:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CEDE40571
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 994DD1BF283
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73FA060671
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:48:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73FA060671
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vxSvcHG2gVsn for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 20:48:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E6E1600D4
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E6E1600D4
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 20:48:34 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id a7so18764514ejp.2
 for <buildroot@buildroot.org>; Mon, 08 Aug 2022 13:48:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Eb41fu3A77Y23G98J52oxdkM2Vah4SPTu6LrzGtwfk4=;
 b=pj7gX6W1BmjC+TtqSWC+EumqYD20Thg5qKR2qHhoQP+5hxfXBE47CY41Vhc8RVRxGO
 FfcVsUMEnyk/qfS/OLY/UVDkSLncim0rgtBOglgdcb5mHnkrLpqdPS6CZ/5m8jas2kvz
 lPlRokToxJrkEOCGSFuSe8t/M8je7suGInE0z7ltMpse8JBHiaios2VHf+wNEclf6maW
 6GqPUE2hk36MKGA2rrL9NHAm4Ec/5saW27WyDRGeDoA4d9T1B5wKuxSjWrGFmAY/eQT/
 YVm7gtZQDpJEvm3o7gfZqcjgPsCTcqIMDcIURQr/f7iTJ/ZGdMqrRCODfu7ksYDoHd9U
 0DsA==
X-Gm-Message-State: ACgBeo36m5uq741c8koiGt/3cjCmn8ggmMAnGY2zP68aFqMnvLgN5DGN
 e9CAzlMmz89shM8ucI84djiscg==
X-Google-Smtp-Source: AA6agR5aFpLEhGDxH5jDkIDZYx00RlZ0QeTn4Hy6reFC+WjNoBF1xilcTkbr7YO1ROZZsbZGyKk4CQ==
X-Received: by 2002:a17:906:84e1:b0:732:1ea0:8b43 with SMTP id
 zp1-20020a17090684e100b007321ea08b43mr415245ejb.343.1659991712575; 
 Mon, 08 Aug 2022 13:48:32 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 bx7-20020a0564020b4700b0043577da51f1sm5042106edb.81.2022.08.08.13.48.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 13:48:32 -0700 (PDT)
Message-ID: <ea0d3b02-e5e1-9f4d-0d3a-a498f5d184f0@mind.be>
Date: Mon, 8 Aug 2022 22:48:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: Federico Pellegrin <fede@evolware.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann <marcus.hoffmann@othermo.de>
References: <CAM6O0Zgc_jfn+m1ZhRByLQ4QDDAYpAOQv-9aDRgruSYKWV5wUA@mail.gmail.com>
 <20220808122020.0c1ec66a@windsurf>
 <CAM6O0ZjLizEsUWZr106T6+WowWdkqE7k_a1bCaPeAVbPScZ6Ag@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAM6O0ZjLizEsUWZr106T6+WowWdkqE7k_a1bCaPeAVbPScZ6Ag@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Eb41fu3A77Y23G98J52oxdkM2Vah4SPTu6LrzGtwfk4=;
 b=byoRKSVHrq3hfeJ65qgK51FuTrIGBEUAa3g4HYLZfvgSPjnhSUmAuN8AlaztFA5auI
 A1m6LOE1NoOVeQ/o9adBhIXGJKrgGAfUPFhxd9GnQ8JqiMOx3dA1GO2v5TLESpWTTmlH
 94xy5PXQfX5rUPNdrG4xteKADYkaIjnCMfmCrO1PoMKZRJ9K7uAw8mk/unc5+0CEGW1N
 jqYfaKuSl1X3auVDGhvbbp2E0482EHMbYrIwC1nWrv4iBsm+K0vp8ChPndpofkbsjrSy
 CHJ4LvUjW2UNEl+r0XJVfJjEDaOuMIIEpaKl3Fe5M4wonTJ3fBiXQ2ip2Yn3t0XhxtF8
 +iBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=byoRKSVH
Subject: Re: [Buildroot] Python pyc only and problem with scripts
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Federico, all,

  [Please don't top-post, but reply inline like I do below. Note that this 
requires configuring your mailer to quote replies properly.]


On 08/08/2022 15:19, Federico Pellegrin wrote:
> 
> Hi Thomas, Marcus,
> Many thanks for your feedback and ideas!
> 
> I've looked a bit more now after your feedback online and indeed found that 
> likely it's mostly rt-tests (or other packages with a similar behaviour, as 
> mentioned by Marcus) that may be wrong-doing.

  Well, rt-tests is certainly not the only package that does that - I've used 
other (proprietary) software that does similar things.


> Indeed according to: 
> https://docs.python.org/3/install/#alternate-installation-unix-the-prefix-scheme 
> <https://docs.python.org/3/install/#alternate-installation-unix-the-prefix-scheme> 
> my understanding would be that they should indeed go to |/prefix//bin and not 
> with the modules.|
> |This link 
> https://python-packaging.readthedocs.io/en/latest/command-line-scripts.html#the-scripts-keyword-argument 
> <https://python-packaging.readthedocs.io/en/latest/command-line-scripts.html#the-scripts-keyword-argument>  
> also somehow confirms it I believe as also setuptools assume the possibility to 
> deliver them.

  I believe the proper way to install is to have a small script in /usr/bin/ 
that simply imports the full script (relying on PYTHONPATH) and calls its main 
function.

> So after all if rt-tests (or similar) would follow that, Buildroot py->pyc 
> should be safe, assuming that those script will not be converted.

  Given that rt-tests is not alone, I think it would be good if we could fix the 
issue on Buildroot side.

  I think the problem can be diagnosed when we encounter a .py file that is 
executable - normally they shouldn't be. We could simply leave those alone 
instead of removing them. Alternatively, perhaps it's possible to replace them 
with a symlink to the pyc file - although that may break things in horrible ways 
as well.

  In either case, it's nice we have this rt-tests failure, because it means we 
can have a runtime test for it!

  Regards,
  Arnout


> |
> |
> |
> |I'll try to contact the rt-tests team and see what they think of this and come 
> back with a patch for Buildroot!
> |
> |
> |
> |Cheers,|
> |Federico
> |
> |
> |
> 
> Il giorno lun 8 ago 2022 alle ore 12:20 Thomas Petazzoni 
> <thomas.petazzoni@bootlin.com <mailto:thomas.petazzoni@bootlin.com>> ha scritto:
> 
>     Hello Federico,
> 
>     On Mon, 8 Aug 2022 09:40:02 +0200
>     Federico Pellegrin <fede@evolware.org <mailto:fede@evolware.org>> wrote:
> 
>      > I've found a minor problem related to the rt-tests package, but that maybe
>      > is slightly more generic and wanted to report and in case understand which
>      > approach would be best to fix it (and contribute a patch then if possible).
>      >
>      > The specific problem: rt-tests, besides a few compiled executables,
>      > installs also two tools which are written in Python, namely hwlatdetect and
>      > get_cyclictest_snapshot. These are Python scripts which get installed in
>      > the PYLIB and then a symbolic link is done from /usr/bin to them, so ie we
>      > have: /usr/bin/hwlatdetect ->
>      > /usr/lib/python3.10/site-packages//hwlatdetect.py
>      >
>      > Needless to say that once the pycompile.py script is run and original .py
>      > files are removed, of course in the "PYC only" setup (which is the
>      > default), then the link is broken and it will not work.
>      > Additionally that pyc files will not work for scripts like that, so just
>      > somehow fixing the link mentioned above would anyhow not work, as you need
>      > to execute them eventually by explicitly naming the interpreter.
>      >
>      > I could imagine that we could have some similar other cases when we are
>      > installing Python scripts directly executed in PYLIB and not modules. But
>      > I'm not sure that installing the scripts there is a good idea as well,
>      > comparing with other distros that doesn't seem to be the case.
>      > So maybe the problem is really in rt-tests after all and the location those
>      > scripts get installed and I may just fix it that way (and contact upstream)?
>      > Otherwise should it be more generic maybe could make sense to have a
>      > facility to list some files that should not be converted to PYC?
> 
>     Thanks for your bug report.
> 
>     My initial gut feeling would indeed be that it is strange to install
>     scripts in /usr/lib/python, and they should be installed in /usr/bin
>     instead, so that /usr/lib/python is only for Python modules that can be
>     byte-compiled. However, I am not an expert at all in terms of Python
>     best practices and latest standards.
> 
>     But from a Buildroot perspective, it really makes a lot of sense to be
>     able to do the byte-compilation at build-time (to save on startup time)
>     and drop the .py files (to save on filesystem footprint).
> 
>     For the rt-tests case, I would therefore suggest to move those scripts
>     to /usr/bin.
> 
>     Of course, if that problem shows up in more packages, then yes we could
>     think of a mechanism for packages to declare a number of py files that
>     should not be byte-compiled, and that should be preserved on the target.
> 
>     Best regards,
> 
>     Thomas
>     -- 
>     Thomas Petazzoni, co-owner and CEO, Bootlin
>     Embedded Linux and Kernel engineering and training
>     https://bootlin.com <https://bootlin.com>
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
