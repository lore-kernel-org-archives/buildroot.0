Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636EFC4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 15:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D37604086F;
	Sun, 13 Nov 2022 15:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D37604086F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gvGwoOnTrelb; Sun, 13 Nov 2022 15:10:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7D5340890;
	Sun, 13 Nov 2022 15:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7D5340890
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1FB6D1BF2FE
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 15:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0163881757
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 15:10:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0163881757
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DjU0RTkhARf2 for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 15:10:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB3BD81756
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB3BD81756
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 15:10:54 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 63BAD1C0004;
 Sun, 13 Nov 2022 15:10:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ouEdH-005O5c-GD; Sun, 13 Nov 2022 16:10:51 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20221026125836.3910730-1-thomas.petazzoni@bootlin.com>
Date: Sun, 13 Nov 2022 16:10:51 +0100
In-Reply-To: <20221026125836.3910730-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Wed, 26 Oct 2022 14:58:35
 +0200")
Message-ID: <87wn7yq490.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/musl: fixup the dynamic loader
 symlink
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
Cc: hello.skyclo@gmail.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > The musl Makefile installs the dynamic loader as a symlink to libc.so
 > with the following rule:

 > $(DESTDIR)$(LDSO_PATHNAME): $(DESTDIR)$(libdir)/libc.so
 >         $(INSTALL) -D -l $(libdir)/libc.so $@ || true

 > While it works, the drawback is that ld-musl-<arch>.so ends up being a
 > symlink to /lib/libc.so. While it works on the target, it means we
 > have a broken symlink in $(STAGING_DIR) and $(TARGET_DIR) as
 > /lib/libc.so doesn't make sense on the build machine. This generally
 > doesn't cause any problem *except* when we tell Qemu to use
 > $(STAGING_DIR) as the library directory when running target programs
 > through the Qemu user emulation mode. This is for example node inside
 > the NodeJS build. Due to this broken symlink, Qemu can't find libc.so
 > that is pointed to be the dynamic loader symlink causing this build
 > error:

 > qemu-arm: Could not open '/lib/ld-musl-armhf.so.1': No such file or directory

 > Since this is not really a bug in the musl build system, we address
 > this issue by overriding the symlink to be a relative path. The
 > dynamic loader is always installed in /lib, and libc.so is also always
 > installed in /lib because we pass libdir=/lib when configuring
 > musl. So we can simply have a ld-musl* -> libc.so symbolic link. We
 > use ld-musl* as a wildcard so that we don't need to have extra logic
 > to determine the exact name of the dynamic loader symlink, and simply
 > override the one that exists.

 > Fixes:

 >   http://autobuild.buildroot.net/results/9ff23f2e3c97e9af410617de3e7376f9d45a7d63/
 >   https://bugs.busybox.net/show_bug.cgi?id=15061

 > Cc: hello.skyclo@gmail.com
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
