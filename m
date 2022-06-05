Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26C9C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 06:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47A65845E0;
	Sun,  5 Jun 2022 06:05:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fpvcz5OHVGmZ; Sun,  5 Jun 2022 06:05:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B7B683FF5;
	Sun,  5 Jun 2022 06:05:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D84EB1BF410
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 06:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D44C5419DB
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 06:05:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k-AAYbLm4aAQ for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 06:05:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF90A419D8
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 06:05:12 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id F325BC6CACF3;
 Sun,  5 Jun 2022 08:05:09 +0200 (CEST)
MIME-Version: 1.0
Date: Sun, 05 Jun 2022 06:05:09 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Nicolas Carrier <nicolas.carrier@orolia.com>
In-Reply-To: <mailman.2413.1654341347.130377.buildroot@buildroot.org>
References: <mailman.2413.1654341347.130377.buildroot@buildroot.org>
Message-ID: <190f6507af24e5ee5e8797fbfaa3b7e3@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.6 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] ulog compilation issue with buildroot 2022.02.2
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
Cc: Herve Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tim Hammer <Tim.Hammer@orolia.com>, Buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Nicolas,

On 2022-06-04 11:15, Nicolas Carrier <nicolas.carrier@orolia.com> wrote:

> Shoot, apparently, I failed when testing yesterday.
> The ulog build issue is present on master too, contrary to what I said 
> earlier.
> 
> So now, we have no clue at all :/

Alchemy is missing the correct library path for the Buildroot staging 
directory.

This is the environment when alchemy is called from Buildroot:

ALCHEMY_TARGET_ENV = \
	$(TARGET_MAKE_ENV) \
	ALCHEMY_HOME=$(ALCHEMY_HOME) \
	ALCHEMY_WORKSPACE_DIR="$(@D)" \
	ALCHEMY_TARGET_OUT=alchemy-out \
	PKGCONFIG_BIN=$(PKG_CONFIG_HOST_BINARY) \
	TARGET_OS=linux \
	TARGET_OS_FLAVOUR=buildroot \
	TARGET_CROSS="$(TARGET_CROSS)" \
	TARGET_ARCH=xxx \
	TARGET_GLOBAL_CXXFLAGS="$(TARGET_CXXFLAGS)" \
	TARGET_GLOBAL_LDFLAGS="$(TARGET_LDFLAGS)" \
	                       ^ LDFLAGS are usually empty
	TARGET_GLOBAL_FFLAGS="$(TARGET_FCFLAGS)" \
	TARGET_GLOBAL_FCFLAGS="$(TARGET_FCFLAGS)"

Alchemy adds more settings to LDFLAGS, this is the final content:

+ TARGET_GLOBAL_LDFLAGS = -O2 -Wl,-O1 
-Lalchemy-out/staging/lib/arm-linux-gnueabihf -Lalchemy-out/staging/lib 
-Lalchemy-out/staging/usr/lib/arm-linux-gnueabihf 
-Lalchemy-out/staging/usr/lib 
-Wl,-rpath-link=alchemy-out/staging/lib/arm-linux-gnueabihf 
-Wl,-rpath-link=alchemy-out/staging/lib 
-Wl,-rpath-link=alchemy-out/staging/usr/lib/arm-linux-gnueabihf 
-Wl,-rpath-link=alchemy-out/staging/usr/lib

Adding the Buildroot staging library path to LDFLAGS makes the build 
succeed:

	...
	TARGET_GLOBAL_LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib" \
	...

This is just a workaround; ideally Buildroot should establish itself as 
a toolchain 'flavour'. Unfortunately, alchemy is not very well 
documented :-[

Kind regards,
Andreas


> On Fri, 2022-06-03 at 12:51 +0200, Nicolas Carrier wrote:
>> And I redid the test with the working config (that is, without the 
>> SYSTEMD line) and this time
>> there
>> are only:
>> 
>> output/host/opt/ext-toolchain/arm-linux-gnueabihf/libc/usr/lib/libpthread.so: 
>> ASCII text
>> output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libpthread.so:????? 
>> ASCII text
>> 
>> But their content is the same:
>> 
>> /* GNU ld script
>> ?? Use the shared library, but some functions are only in
>> ?? the static library, so try that secondarily.? */
>> OUTPUT_FORMAT(elf32-littlearm)
>> GROUP ( /lib/libpthread.so.0 /usr/lib/libpthread_nonshared.a )
>> 
>> 
>> On Fri, 2022-06-03 at 12:44 +0200, Nicolas Carrier wrote:
>> > Great, at least, I'm not alone :)
>> >
>> > One other thing to notice is that there libpthread.so ascii files in the output directory, the
>> > content of which doesn't seem correct:
>> >
>> > output/build/ulog-0389d243352255f6182326dccdae3d56dadc078f/alchemy-
>> > out/staging/lib/libpthread.so:
>> > ASCII text
>> > output/host/opt/ext-toolchain/arm-linux-gnueabihf/libc/usr/lib/libpthread.so:???????????????????
>> > ASCII text
>> > output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libpthread.so:????????????????????????
>> > ASCII text
>> >
>> > They all contain:
>> >
>> > /* GNU ld script
>> > ?? Use the shared library, but some functions are only in
>> > ?? the static library, so try that secondarily.? */
>> > OUTPUT_FORMAT(elf32-littlearm)
>> > GROUP ( /lib/libpthread.so.0 /usr/lib/libpthread_nonshared.a )
>> >
>> >
>> > On Fri, 2022-06-03 at 11:47 +0200, Thomas Petazzoni wrote:
>> > > CAUTION: This email originated from outside of the organization.
>> > > Do not click links or open attachments unless you recognize the sender and know the content is
>> > > safe.
>> > >
>> > > On Fri, 03 Jun 2022 11:09:48 +0200
>> > > Nicolas Carrier <nicolas.carrier@orolia.com> wrote:
>> > >
>> > > > Hello,
>> > > > I tested this morning against the master of buildroot (with an ubuntu 20.04) and the issue
>> > > > doesn't
>> > > > appear anymore.
>> > > > So there must be some change "recently" merged, which solves the issue.
>> > > >
>> > > > An idea anyone?
>> > >
>> > > Not yet an idea, but I confirm that I was able to reproduce on
>> > > 2022.02.2 (just so you know that your e-mail and issue have been seen!)
>> > >
>> > > Thomas
>> > > --
>> > > Thomas Petazzoni, co-owner and CEO, Bootlin
>> > > Embedded Linux and Kernel engineering and training
>> > > https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
