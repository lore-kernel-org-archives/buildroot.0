Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B16AC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 22:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7024408ED;
	Thu, 28 Jul 2022 22:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7024408ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MZskorSOCTgR; Thu, 28 Jul 2022 22:40:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 182A4402F2;
	Thu, 28 Jul 2022 22:40:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 182A4402F2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C1A6A1BF301
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 22:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99ED38378C
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 22:40:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99ED38378C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g9ndB9HCgrpA for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 22:40:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB24A8343E
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB24A8343E
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 22:40:36 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id i7so2463874qvr.8
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 15:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:message-id:in-reply-to:date:references
 :subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=VPUaC4pnSsoogkvpXaU0DRwVbmQrZ3MK3N9qokVXaig=;
 b=HoDeDfKJ2/Ecf4f+4WjSWpZXAyEoSS5ej95ayiSw+DBccul2/iZWfGawp1S0qyB+4N
 h7Q7Aq3Qcxo4g+cr91R15i83qCEmS1GEIP+5gi9/sC0t/Cbd7p0CXaQIMahoQe6JLUsg
 vlnFgsOB4z3DYdTU1lTgpXhbqaBM4/872LAKN/TdXPk5gZxKjcIH34f+4hph2kbx/frv
 ZmMOcxAUraTMWMK7SktGZKokU+ED17+phXYaV8ggUETXTjSm48nvOZnIS3QjinXnleJL
 6Od1VwCCdCyF51BLOWyp/A1K6V+T3//Djd+Mvcyewg4qUVPBq6aFbZbCcNHhyjAMiDV7
 3taA==
X-Gm-Message-State: ACgBeo3JfYK3fZ+FJWPhSOR6gJV4ClIEXChZFb3SYy4wo/HBBdQLgLsY
 +TLJdgV1mc5ssgG/q7RennYp4nBpk0ZCuw==
X-Google-Smtp-Source: AA6agR53S8VNahkpCjtMK9nYQ+CS4jdMtTqPDsxW+wBskfDKJWfdRuy8JKBpUxTKAqwsfPJaW8JAxw==
X-Received: by 2002:a05:6214:1c47:b0:474:8d1e:f432 with SMTP id
 if7-20020a0562141c4700b004748d1ef432mr1141268qvb.94.1659048035476; 
 Thu, 28 Jul 2022 15:40:35 -0700 (PDT)
Received: from adicarlo.nyc (cpe-67-245-152-80.nyc.res.rr.com. [67.245.152.80])
 by smtp.gmail.com with ESMTPSA id
 y194-20020a3764cb000000b006b61b34d2c2sm1354402qkb.42.2022.07.28.15.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 15:40:35 -0700 (PDT)
Received: from sopa (localhost [127.0.0.1])
 by adicarlo.nyc (Postfix) with ESMTP id 2EB73A98053;
 Thu, 28 Jul 2022 18:40:34 -0400 (EDT)
From: Adam Di Carlo <a.p.dicarlo@gmail.com>
To: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
References: <20220728185030.31A1E864E7@busybox.osuosl.org>
Date: Thu, 28 Jul 2022 18:40:34 -0400
In-Reply-To: <20220728185030.31A1E864E7@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Thu, 28 Jul 2022 21:03:33 +0200")
Message-ID: <87y1wc7tel.fsf@gw-ny.onshored.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:user-agent:message-id:in-reply-to:date:references
 :subject:cc:to:from:from:to:cc;
 bh=VPUaC4pnSsoogkvpXaU0DRwVbmQrZ3MK3N9qokVXaig=;
 b=lmtKI6qUKqqz+4fSh0ziuB4HY//lfkBuZDroivxDE44PtJVaaZr7BlZ1TocbFnnM+N
 veq+OWyS5gq1o/yQgcUnmGFosdYw9nyCNF9CS76dK02r3isnESm6XzFtV40cAiXtsAJn
 hDvyLSAZPlbEsX0s+RytBQkzS9Iznu6dQ2zxXos26cupX94GQjJZJjCpIj6jG9vCnYXy
 Rr+jfJs4YD0kkJ/7Ak/0hGnwqZyvZ842UaDxNIGOntoOR519uVMzODLaIdDZJZaA1dIV
 wA76y4ckObD1wOtaCtaCTSPHmyYSmA+bLvMEtJ1BirKRqX7WByuNb6tP+GW+sYES2RuW
 C3zw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lmtKI6qU
Subject: Re: [Buildroot] [git commit] package/pkg-autotools: use /run as
 runtime path
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

> Note that the configure script bundled with a package may be generated
> with an older version of Autotools, that may not yet support the
> --runstatedir option. This will give an "Unsupported arguments" warning
> and the option will be ignored.

Or, in some cases, will terminate the build:

> make readline-build
>>> readline 8.1.2 Configuring
[...]
configure: error: unrecognized option: `--runstatedir=/run'
Try `./configure --help' for more information
make: *** [package/pkg-generic.mk:283:

Obviously, this can be cleared up by running 'autoconf' before running
./configure but is that something that should be done universally?

-- 
...Adam Di Carlo...<a.p.dicarlo@gmail.com>............................
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
