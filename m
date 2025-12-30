Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D13EE4992
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 18:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E880810DB;
	Tue, 30 Dec 2025 18:17:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tEclPWKkrdwE; Tue, 30 Dec 2025 18:17:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 355D480F8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767118647;
	bh=/EKOG5g3M/UaTyGSCT8T3V/rDAkDK7KlgxRSVdyb/R0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=epZmK+TbpFbAeaxR/vx86mA279PfVNxYPysmeRBe/gmFcqEMlJLnOEE6vT2urn6pH
	 WNORBo4y2HgbjUtbYzLTAvF/t7vtk8wYxyi/0qg++1d8xIfxjWx9Zr34XhVOMuBhr+
	 diY7T+sBNfpo0mrdqxzW6EtI2gwxpXLYMl7U4CLrtN2C36xpXAkrm7dyMvBhytdhOl
	 L6vf18dtRj6Jbf/MT3KAOAzyoBdgtJ7IHzMPWFrVA1xrVZlKR93pLVDEqyNWtztZev
	 pCnLOXQ1I2Oszh+zfXDuNawLa76sQ/5rlk/z7sJ4URAbeIZjFz8CMuSSUHHvkPpNgA
	 JlXmXQp9so/KA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 355D480F8C;
	Tue, 30 Dec 2025 18:17:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 82952277
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69B5B403F3
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:17:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Um8PND5m745 for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 18:17:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 442544019B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 442544019B
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 442544019B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:17:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D663EC1D73F;
 Tue, 30 Dec 2025 18:16:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5CE476072C;
 Tue, 30 Dec 2025 18:17:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BD016113B05B3; Tue, 30 Dec 2025 19:17:21 +0100 (CET)
Date: Tue, 30 Dec 2025 19:17:21 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Andreas Ziegler <br025@umbiko.net>, Angelo
 Compagnucci <angelo.compagnucci@gmail.com>, Fabrice Fontaine
 <fontaine.fabrice@gmail.com>, Mahyar Koshkouei
 <mahyar.koshkouei@gmail.com>, Matt Flax <flatmax@flatmax.org>, Romain Naour
 <romain.naour@gmail.com>, Simon Dawson <spdawson@gmail.com>, Woodrow
 Douglass <wdouglass@carnegierobotics.com>
Message-ID: <20251230191721.01e90a78@windsurf>
In-Reply-To: <20251230114545.2236640-1-bernd@kuhls.net>
References: <20251230114545.2236640-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767118642; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=DsuON0kjcdEeFN4IoVuu2/IX8myazkWbcJmz7lVwApQ=;
 b=TtXblC4QAPa92wgVD5LBsZScNZELfZVtxkwBFcURBZJAwTr6voJfvwT01g1Pk3Xb9g3J3C
 yNtjaDoHDBEuya/e865Ggccwl0vtHk3rvV6tjLqrm0RVOXn9cqv6U3NwvXTz6uQIVzWQij
 CI7UVvjcb19YXVMp/SK/InfejCtl5L1D3WTBcK0wEGQ3w8eQWf2xWOdrKz/0QXgB9vxHSH
 Qb0d7LZs4q4YNQelq85tcSdiRuEXBtMiYakvWQxjFrPst7+3mmxkxBeSgeCh35DWPRr6Ty
 shyJCM+J92PRJiD+J1vr52LD5tzqxBXHtqQSGmCv70O4X5A9QMClwv9YdZJrUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=TtXblC4Q
Subject: Re: [Buildroot] [PATCH v9 00/19] Remove packages
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, 30 Dec 2025 12:45:21 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Bernd Kuhls (19):
>   package/openpowerlink: remove package
>   package/opentracing-cpp: remove package
>   package/qjson: remove package
>   package/sconeserver: remove package
>   package/taskd: remove package
>   package/racehound: remove package
>   package/musepack: remove package
>   package/libcuefile: remove package
>   package/python-aioredis: remove package
>   package/cppdb: remove package
>   package/ffmpeg: remove optional dependency to opencv3
>   package/freeswitch: remove optional dependency to opencv3
>   package/gtkiostream: remove optional dependency to opencv3
>   package/mjpg-streamer: remove optional dependency to opencv3
>   package/vlc: remove optional dependency to opencv3
>   package/opencv3: remove package
>   package/ogre: remove dependency to libfreeimage
>   package/cegui: remove dependency to libfreeimage
>   package/libfreeimage: remove package

Thanks, whole series applied, with a few fixes/tweaks, which I reported
by replying individually to each patch.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
