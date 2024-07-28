Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE916C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 13:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B4A740298;
	Sun, 28 Jul 2024 13:09:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8BfCgz223hVc; Sun, 28 Jul 2024 13:09:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 032FB402BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 032FB402BC;
	Sun, 28 Jul 2024 13:09:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5FB201BF40D
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 13:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DF6A60594
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 13:09:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LRTizEstJKpq for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 13:09:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DA65560586
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA65560586
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA65560586
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 13:09:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id F27225FFA3;
 Sun, 28 Jul 2024 15:09:38 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:49688])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 28 Jul 2024 15:09:38 +0200
MIME-Version: 1.0
Date: Sun, 28 Jul 2024 15:09:38 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20240722151314.6abebd25@windsurf>
References: <20240719173723.546583-1-ju.o@free.fr>
 <20240722151314.6abebd25@windsurf>
User-Agent: Webmail Free/1.6.7
Message-ID: <c5c3fd836f9f7f503c31ebf1d555453d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1722172180;
 bh=UPtHkN1e14VeRlXLaqXijaUuFlfevQzUeXzK4r9nHWg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fLABovO73IPI8WilMsFdeC4UYdiXa6Bcx69XPb2u99zPT90N0LarxQJh2GHr0aq0C
 mmOlfYB0692AE61XRCai8LqVawvAntFRMoobuD1ErYvxlRoS9jRxRtw99L+L52dlLT
 oyKps1BN34TUKEMoNC5Whp2jfQ+WGeJPPctJQvSFg+AyEmMaipw7ktJa5LcBX1om5t
 aPnnm8UUQjqF1MZLV6FJcS/ONSArmp7bl2dJ+KN/hqZbm3TQCEfVTZyR74/xYomcCD
 ViL9qiirElb+4TgZnB7UdogPGFznTfApT/ntXiwjesBIko9RFM9upr/vSwsyD2ZrqQ
 n5DoMqpxGG2xw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fLABovO7
Subject: Re: [Buildroot] [PATCH 1/1] package/kexec: bump to version 2.0.29
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

Hi Thomas,

On 22/07/2024 15:13, Thomas Petazzoni wrote:
> Hello Julien,
> 
> On Fri, 19 Jul 2024 19:37:23 +0200
> Julien Olivain <ju.o@free.fr> wrote:
> 
>> For release announce, see [1].
>> 
>> This commit removes the package patch, which is now included in this
>> new version.
>> 
>> The license hash also changed, due to a FSF address update. See [2].
>> This commit also adds a comment in the hash file about the pgp
>> signature check.
>> 
>> [1] https://lists.infradead.org/pipermail/kexec/2024-July/030452.html
>> [2] 
>> https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=f53bcef5063c70960b2b8eb8990722d5c9d1b99e
>> 
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
>> ---
>>  ...uilding-on-x86_64-with-binutils-2-41.patch | 94 
>> -------------------
>>  package/kexec/kexec.hash                      |  6 +-
>>  package/kexec/kexec.mk                        |  2 +-
>>  3 files changed, 5 insertions(+), 97 deletions(-)
>>  delete mode 100644 
>> package/kexec/0001-Fix-building-on-x86_64-with-binutils-2-41.patch
> 
> Not sure if it's related to this bump or not, but our kexec test case
> is failing:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/7391792961
> 
> Could you perhaps have a look?

Unfortunately, I cannot reproduce this issue.

I tested many configurations:
- at the runtime test failure (commit 6282b4ec),
- before the kexec-2.0.29 bump (commit acdcc4c~1),
- at the kexec-2.0.29 bump (commit acdcc4c),

I did those test on idle host and loaded host, inside the Docker image
and outside (on Fedora 40). I never set a timeout_multiplier.

In all cases, the test succeed (in idle host cases) or sometimes
failed with a clean timeout (on highly loaded host).

My guess right now is that this execution happened on a very loaded
runner. The failed job reports 27 minutes of build/execution. As a
reference, this test succeed in ~6 mins on my idle laptop.

This slow execution might trigger an actual kexec-tools or kernel
bug/corner case.

To better debug those tricky situations, I would suggest to add few
extra info in the runtime test run log. Namely, the number of cpus of
the runner, the system load at the time of the test startup, and the
value of the timeout_multiplier used for the execution. Something
like adding in support/testing/infra/emulator.py, in boot() :

     self.logfile.write(f"> host cpu count: {os.cpu_count()}\n")
     ldavg = os.getloadavg()
     ldavg_str = f"{ldavg[0]:.2f}, {ldavg[1]:.2f}, {ldavg[2]:.2f}"
     self.logfile.write(f"> host loadavg: {ldavg_str}\n")
     self.logfile.write(f"> timeout multiplier: 
{self.timeout_multiplier}\n")

just before the line:

     self.logfile.write("> starting qemu with '%s'\n" % " 
".join(qemu_cmd))

What do you think?  If you agree, I can send a patch for this.

Before continuing debugging, I would like to see other executions
in the CI.

My current ideas to improve this test are:
- check upstream kernel for kexec fixes / bumping the test kernel
   (I did not see anything obvious, right now),
- and/or add qemu emulator cpus,
- and/or add sleep/pause time (incl. the timeout_multiplier
   in the test.

I would like to avoid the using kexec -i/--no-checks option to skip
those memory integrity checks (even if I suspect a sha256 computation
might have taken a bit longer than expected leading to this incorrect
hash).

> Thanks!
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
