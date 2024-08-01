Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B68C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 22:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E630B81EF8;
	Thu,  1 Aug 2024 22:27:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ScMxZp260v_4; Thu,  1 Aug 2024 22:27:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFD4681F35
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFD4681F35;
	Thu,  1 Aug 2024 22:27:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C61B51BF3D4
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 22:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B36166066D
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 22:27:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oUlR6SQgP7Qn for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 22:27:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com;
 envelope-from=kris@embeddedts.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6BA336061D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BA336061D
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6BA336061D
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 22:27:08 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-70d316f0060so1808426b3a.1
 for <buildroot@buildroot.org>; Thu, 01 Aug 2024 15:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722551227; x=1723156027;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:reply-to:subject:message-id:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FTRCnAurrDXnK+xnmR93Djx1la5k815qT0sguxyWGlw=;
 b=cl+8qYNrA5psC11kmz1w5PbrbcNAyPAVEX+bCefVXzXjkhecbXlHha6+/ccpfgdCm5
 mXPiBTCjRz1oSSQWAg39T67g9tPyWrY1I2t+NoTLizqa39ajITIUacSmUrBbF9GbZV4g
 ooOqjDDPDB7ByfnLeT3abzRL7s4wRJp9oMiQd4BDwYTRn365zspkHgWoUa8OiACGWx4w
 XCSa/fzHLWVOnWKzP6j6tKNVCOsVYmAIj9KPUjefs7Uixb3dgl9Sh23sXV+bbcoPXpvj
 zG+bLU/ESYdJddJF9djfa6g+gGU+5Wetlw0/bwH5UnhQ8mS+Hcc1bgGndNkrjq2O77lK
 xfNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+uwG9LGMW1xNuSLjmYR9K/ZxDAEVjS1RyLT3UdpVBxonIvXyxAMrp75/rneKAV+y3rzNyvmduhISFRxUIgxanX2pvFgtk3Q==
X-Gm-Message-State: AOJu0Yy6AKiFCLkyHTpa0AWPpWarcC0lfVl44YCW25l29TIUr21lrpZO
 PmlgF2Pf+YAKHBLm+v2Dn4z91vsK9dbih1fS6wKqMAP3oc2HACP4F4JJiHdiVJw=
X-Google-Smtp-Source: AGHT+IHZnyuDefff2hH4DUuVp/odnr2v0+NssDlRmLOvK0Xx2xiTvpfZ5FvbtgxB5/iC9/JlYOKJcA==
X-Received: by 2002:a05:6a00:9150:b0:70e:cee8:264a with SMTP id
 d2e1a72fcca58-71065de1a9bmr4406219b3a.1.1722551227368; 
 Thu, 01 Aug 2024 15:27:07 -0700 (PDT)
Received: from [10.10.10.151] ([174.25.79.17])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7106ec06136sm320812b3a.18.2024.08.01.15.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 15:27:07 -0700 (PDT)
X-Google-Original-From: Kris Bahnsen <kris@embeddedTS.com>
Message-ID: <6b3b8dd5f1a4229c813d29b449a655cfcc74ab29.camel@embeddedTS.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Kris Bahnsen via
 buildroot <buildroot@buildroot.org>
Date: Thu, 01 Aug 2024 15:27:05 -0700
In-Reply-To: <20240801233818.41e20f0f@windsurf>
References: <20240731235548.1792330-1-kris@embeddedTS.com>
 <20240801233818.41e20f0f@windsurf>
Organization: embeddedTS
User-Agent: Evolution 3.38.3-1+deb11u2 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embeddedts.com; s=google; t=1722551227; x=1723156027; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:reply-to:subject:message-id:from
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FTRCnAurrDXnK+xnmR93Djx1la5k815qT0sguxyWGlw=;
 b=KphTxHtQuuyq3+RpFEAHYGTRGFhnniQQGIwnWr2cBEj9V2MCAIA5RocsJpWSjE9Oxk
 a8RQw0nKeOGCOPz2owMdORWEq3vdbekStq1jgWMVBu4siTYMfrb/CcrsWfuFZ7Ml1F8C
 ZaDQzyRRXKSHZ5IwN/c6VNV10P/WJA5hLziYo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=embeddedts.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=embeddedts.com header.i=@embeddedts.com
 header.a=rsa-sha256 header.s=google header.b=KphTxHtQ
Subject: Re: [Buildroot] [PATCH 1/1] package/wilc-driver: bump to
 linux4microchip-2024.04
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
From: Kris Bahnsen via buildroot <buildroot@buildroot.org>
Reply-To: kris@embeddedTS.com
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Alexis =?ISO-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 2024-08-01 at 23:38 +0200, Thomas Petazzoni wrote:
> Hello Kris,
> 
> On Wed, 31 Jul 2024 23:55:48 +0000
> Kris Bahnsen via buildroot <buildroot@buildroot.org> wrote:
> 
> > Latest update from Microchip's kernel.
> > 
> > Removes Buildroot patches and instead incorporates these directly
> > to a community branch of the repo. Also adds a check in wilc-
> > driver.mk
> > to use the new linux4microchip-2024.04-community tag when
> > BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4 is true.
> 
> Could you clarify why the code in linux4microchip-2024.04-community
> doesn't work on older kernels?

The driver has a chaotic history. It used to be maintained as an
external driver as well as in-kernel for Atmel/Microchip's kernel fork.

At some point in history, they deprecated the external module and only
maintained it in their kernel fork. This is where we decided to take
what was in their kernel and modify it enough to load as an external
module.

There are two major tag bases in our wilc3000-external-module.git,
linux4microchip-2021.10 and linux4microchip-2024.04. These match the
same named tags in the Microchip WILC3000 driver source in the
Microchip kernel fork, https://github.com/linux4sam/linux-at91

Finally, the reason why linux4microchip-2024.04-community won't work on
older kernels is because Microchip used to have kernel version checks
in that codebase (it was a copy of the externally maintained driver
they had). And between linux4microchip-2021.10 and linux4microchip-
2024.04 in their kernel, all of those checks were removed along with
added updates and changes.

Further complicating things, individual parts of the driver history
have been rebased away. And the driver they maintain in that kernel is
meant to be compatible with both WILC1000 and WILC3000. That is, the
shared driver is maintained in the same folder where the upstream
kernel only supports the WILC1000, so they do a lot of merging and
rebasing over time.

Part of that rebased history has their changes to remove kernel version
checks for backwards compatibility mixed in with changes they make to
improve the driver.

It would require significant effort to keep their latest driver changes
as well as kernel version checks for compatibility in place. That is
time that I am not greenlit to spend on it.

Instead, the compromise was a split in kernel version compatibility.
For this driver version, we will maintain patches on top of it to keep
it compiling in forward kernels as well as do our best to apply feature
changes from Microchip alongside that.

If there ever is another significant set of changes from Microchip, we
will likely re-do this split.

> 
> > We investigated the potential to use backports to make maintenance
> > easier as I mentioned, however it did not work out as we had
> > expected.
> 
> Not sure what "backports" you're referring to here. Backporting what
> from what, to what?


https://backports.wiki.kernel.org/index.php/Main_Page

As I mentioned, the backports project only targets kernel 6.1 as the
most recent kernel version it will backport to. And I believe it would
still have the same issue of needing to select an appropriate kernel
version to target.

> 
> > I'm not sure if I did the kernel dependency check in the most
> > elegant
> > way. If there is a preferred way to handle that, please let me know
> > and
> > I'll happily make a revision.
> 
> The version dependency check is annoying, which is why I'm asking
> above
> if we could get away with it, which would be the best solution.
> 
> > -WILC_DRIVER_VERSION = linux4microchip-2021.10-1
> > +# Set up driver version based on kernel headers
> > +# See the project's README for more information on this
> > +ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4),y)
> > +WILC_DRIVER_VERSION = linux4microchip-2024.04-community
> > +else
> > +WILC_DRIVER_VERSION = linux4microchip-2021.10-1-upto-linux-6.6
> > +endif
> 
> Unfortunately, we cannot use the kernel headers version. Some people
> use external toolchains that have possibly a bit old kernel headers,
> but they may be running a very up-to-date kernel. So the only option
> I
> believe is to do like AUFS in linux/Config.ext.in, with an explicit
> choice.

That is a good point that I had not considered.

Aside from selecting the driver version like AUFS, the only other thing
I can think of would be rather than a hard cutoff point we could
maintain the older linux4microchip-2021.10 release by patching kernel
version checks in as time goes on. That doesn't give me the warm
fuzzies though because there may be lurking bugs in that older driver
version that will be kept limped along. I would rather have the cutoff
and try to keep things moving forward.

If you are okay with the choice selection, I can work on a second
version of this patch for that. Or if you have any other ideas sparked
by the additional detail on the history of the driver, please let me
know.

> 
> But that's also going to break badly with autobuilder testing. So
> really, if we can use a single version for all kernel versions, it
> would be much, much, much better.
> 
> Thanks!
> 
> Thomas


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
