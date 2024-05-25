Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D173C25B78
	for <buildroot@archiver.kernel.org>; Sat, 25 May 2024 16:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5E08605DB;
	Sat, 25 May 2024 16:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pRXoGbqDPzCq; Sat, 25 May 2024 16:47:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3136605DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3136605DF;
	Sat, 25 May 2024 16:47:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D7FF81D072F
 for <buildroot@lists.busybox.net>; Sat, 25 May 2024 16:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C432F4032D
 for <buildroot@lists.busybox.net>; Sat, 25 May 2024 16:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YcbCqIKnJsOl for <buildroot@lists.busybox.net>;
 Sat, 25 May 2024 16:47:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0F01240324
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F01240324
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F01240324
 for <buildroot@buildroot.org>; Sat, 25 May 2024 16:47:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C908360004;
 Sat, 25 May 2024 16:47:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sAuY6-001pmt-0W;
 Sat, 25 May 2024 18:47:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20240525072733.102766-1-dario.binacchi@amarulasolutions.com>
Date: Sat, 25 May 2024 18:47:14 +0200
In-Reply-To: <20240525072733.102766-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Sat, 25 May 2024 09:27:33 +0200")
Message-ID: <87msodhm99.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] configs/at91sam9x5ek_dev_defconfig: fix
 Linux compilation error
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:

 > This patch adapts the Linux commit 790756c7e0229 ("ARM: 8933/1: replace
 > Sun/Solaris style flag on section directive") to fix compilation errors.

 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 > ---
 >  ...ce-Sun-Solaris-style-flag-on-section.patch | 71 +++++++++++++++++++
 >  configs/at91sam9x5ek_dev_defconfig            |  1 +
 >  2 files changed, 72 insertions(+)
 >  create mode 100644 board/atmel/at91sam9x5ek_dev/patches/linux/0001-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch

 > diff --git a/board/atmel/at91sam9x5ek_dev/patches/linux/0001-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch b/board/atmel/at91sam9x5ek_dev/patches/linux/0001-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch
 > new file mode 100644
 > index 000000000000..8bc5919b0411
 > --- /dev/null
 > +++ b/board/atmel/at91sam9x5ek_dev/patches/linux/0001-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch
 > @@ -0,0 +1,71 @@
 > +From 25d046fbe70400c709cb00855d7f18c6000d1325 Mon Sep 17 00:00:00 2001
 > +From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 > +Date: Fri, 24 May 2024 19:10:07 +0200
 > +Subject: [PATCH] ARM: 8933/1: replace Sun/Solaris style flag on section
 > + directive
 > +
 > +The patch is an adaptation of Linux commit 790756c7e0229 ("ARM: 8933/1:
 > +replace Sun/Solaris style flag on section directive").
 > +
 > +Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 > +Upstream: N/A [Buildroot specific]

How about instead directly taking the backport of this to the 4.19.y
stable tree, E.G.:

commit 762d2dcd9e233e3025f8627ea65f23e568045edb
Author: Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon Nov 4 19:31:45 2019 +0100

    ARM: 8933/1: replace Sun/Solaris style flag on section directive

    [ Upstream commit 790756c7e0229dedc83bf058ac69633045b1000e ]

    It looks like a section directive was using "Solaris style" to declare
    the section flags. Replace this with the GNU style so that Clang's
    integrated assembler can assemble this directive.

    The modified instances were identified via:
    $ ag \.section | grep #

    Link: https://ftp.gnu.org/old-gnu/Manuals/gas-2.9.1/html_chapter/as_7.html#SEC119
    Link: https://github.com/ClangBuiltLinux/linux/issues/744
    Link: https://bugs.llvm.org/show_bug.cgi?id=43759
    Link: https://reviews.llvm.org/D69296

    Acked-by: Nicolas Pitre <nico@fluxnic.net>
    Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
    Reviewed-by: Stefan Agner <stefan@agner.ch>
    Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
    Suggested-by: Fangrui Song <maskray@google.com>
    Suggested-by: Jian Cai <jiancai@google.com>
    Suggested-by: Peter Smith <peter.smith@linaro.org>
    Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
    Signed-off-by: Sasha Levin <sashal@kernel.org>

Doesn't that directly apply without any further adoptions?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
