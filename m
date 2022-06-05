Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28B7C43334
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 11:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EC8161170;
	Sun,  5 Jun 2022 11:46:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 10Jtsc945QwL; Sun,  5 Jun 2022 11:46:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5836260C0E;
	Sun,  5 Jun 2022 11:46:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C42601BF310
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 11:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B295A4034B
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 11:46:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0nBT76jDBLyG for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 11:46:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB27940148
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 11:46:46 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id A9EE3C6CADF2;
 Sun,  5 Jun 2022 13:46:43 +0200 (CEST)
MIME-Version: 1.0
Date: Sun, 05 Jun 2022 11:46:43 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20220605090620.63a7375c@windsurf>
References: <mailman.2413.1654341347.130377.buildroot@buildroot.org>
 <190f6507af24e5ee5e8797fbfaa3b7e3@umbiko.net>
 <20220605090620.63a7375c@windsurf>
Message-ID: <d6a1f4d7ec93800f240b7457984040b9@umbiko.net>
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
Cc: Herve Codina <herve.codina@bootlin.com>, Tim Hammer <Tim.Hammer@orolia.com>,
 Buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 2022-06-05 07:06, Thomas Petazzoni wrote:
> Hello Andreas,
> 
> On Sun, 05 Jun 2022 06:05:09 +0000
> Andreas Ziegler <br015@umbiko.net> wrote:
> 
>> This is the environment when alchemy is called from Buildroot:
>> 
>> ALCHEMY_TARGET_ENV = \
>> 	$(TARGET_MAKE_ENV) \
>> 	ALCHEMY_HOME=$(ALCHEMY_HOME) \
>> 	ALCHEMY_WORKSPACE_DIR="$(@D)" \
>> 	ALCHEMY_TARGET_OUT=alchemy-out \
>> 	PKGCONFIG_BIN=$(PKG_CONFIG_HOST_BINARY) \
>> 	TARGET_OS=linux \
>> 	TARGET_OS_FLAVOUR=buildroot \
>> 	TARGET_CROSS="$(TARGET_CROSS)" \
>> 	TARGET_ARCH=xxx \
>> 	TARGET_GLOBAL_CXXFLAGS="$(TARGET_CXXFLAGS)" \
>> 	TARGET_GLOBAL_LDFLAGS="$(TARGET_LDFLAGS)" \
>> 	                       ^ LDFLAGS are usually empty
>> 	TARGET_GLOBAL_FFLAGS="$(TARGET_FCFLAGS)" \
>> 	TARGET_GLOBAL_FCFLAGS="$(TARGET_FCFLAGS)"
>> 
>> Alchemy adds more settings to LDFLAGS, this is the final content:
>> 
>> + TARGET_GLOBAL_LDFLAGS = -O2 -Wl,-O1
>> -Lalchemy-out/staging/lib/arm-linux-gnueabihf 
>> -Lalchemy-out/staging/lib
>> -Lalchemy-out/staging/usr/lib/arm-linux-gnueabihf
>> -Lalchemy-out/staging/usr/lib
>> -Wl,-rpath-link=alchemy-out/staging/lib/arm-linux-gnueabihf
>> -Wl,-rpath-link=alchemy-out/staging/lib
>> -Wl,-rpath-link=alchemy-out/staging/usr/lib/arm-linux-gnueabihf
>> -Wl,-rpath-link=alchemy-out/staging/usr/lib
>> 
>> Adding the Buildroot staging library path to LDFLAGS makes the build
>> succeed:
>> 
>> 	...
>> 	TARGET_GLOBAL_LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib" \
> 
> Thanks for your investigation!
> 
> -L$(STAGING_DIR)/usr/lib should normally not be needed, because
> $(STAGING_DIR)/usr/lib is in the default search path of the
> cross-compiler, as the compiler has $(STAGING_DIR)/usr as its sysroot.
> 
> So from a cross-compiler perspective, -L$(STAGING_DIR)/usr/lib should
> normally not be needed, and that's why it's not in $(TARGET_LDFLAGS).

And sysroot is detected by alchemy:

+ TARGET_TOOLCHAIN_SYSROOT = 
/home/data/test/autobuild/host/arm-buildroot-linux-gnueabihf/sysroot

> Also, there is a curious thing in the report from Nicolas: the error
> happens when systemd is enabled, but doesn't happen when systemd is
> disabled.

I can confirm this. Adding BR2_INIT_SYSTEMD=y breaks the build (using 
make clean && make ulog).

Kind regards,
Andreas

> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
