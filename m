Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDDAC25B76
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 15:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0473406D0;
	Mon,  3 Jun 2024 15:52:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 28Dqf0dp1dYE; Mon,  3 Jun 2024 15:52:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6409C406D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6409C406D4;
	Mon,  3 Jun 2024 15:52:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E08311BF228
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 15:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6A0A40B68
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 15:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NbINWMVxiDHW for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 15:52:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AB3F240ABE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB3F240ABE
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB3F240ABE
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 15:52:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E2873FF809;
 Mon,  3 Jun 2024 15:52:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sE9z2-003m8x-2b;
 Mon, 03 Jun 2024 17:52:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20240521213814.763832-1-ju.o@free.fr>
Date: Mon, 03 Jun 2024 17:52:28 +0200
In-Reply-To: <20240521213814.763832-1-ju.o@free.fr> (Julien Olivain's message
 of "Tue, 21 May 2024 23:38:14 +0200")
Message-ID: <874jaahvlv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] support/config-fragments: fix
 bootlin-x86-i686-musl
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > Commit a8be4a04ad "support/config-fragments: replace
 > br-i386-pentium-mmx-musl" replaced this old toolchain by
 > bootlin-x86-i686-musl.

 > When using test-pkg with all toolchains, bootlin-x86-i686-musl is always
 > failing. The issue can be reproduced with for example:

 >     utils/test-pkg -a -p busybox

 > The issue can also be reproduced with a simple config like:

 >     cat > .config <<EOF
 >     BR2_i386=y
 >     BR2_TOOLCHAIN_EXTERNAL=y
 >     BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 >     BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE=y
 >     BR2_PACKAGE_BUSYBOX=y
 >     EOF
 >     make olddefconfig
 >     make

 > Compilation fail with output:

 >     Cannot execute cross-compiler '/i586-linux-gcc'

 > This issue happen is because the toolchain can never be selected.

 > The config fragment [1] selects BR2_i386 alone.

 > The target architecture variant default to i586 if target
 > architecture is i386. See [2].

 > Finally, the generated toolchain options includes a depends on
 > BR2_i386 and !BR2_x86_i586, making the toolchain always ignored.
 > See [3].

 > This commit fixes the issue by adding BR2_x86_i686=y to the config
 > fragment.

 > [1] https://gitlab.com/buildroot.org/buildroot/-/blob/a8be4a04ade8e695c5c4d4a825253d69e80693f9/support/config-fragments/autobuild/bootlin-x86-i686-musl.config
 > [2] https://gitlab.com/buildroot.org/buildroot/-/blob/2024.02.2/arch/Config.in.x86?ref_type=tags#L38
 > [3] https://gitlab.com/buildroot.org/buildroot/-/blob/345ccb523e/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options#L5768-5770

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
