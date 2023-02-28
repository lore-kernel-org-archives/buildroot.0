Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126E7C64ED6
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 15:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF2E061181;
	Tue, 28 Feb 2023 15:34:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF2E061181
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sthUD9aC6RrY; Tue, 28 Feb 2023 15:34:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8CAA61177;
	Tue, 28 Feb 2023 15:34:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8CAA61177
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D21AE1BF94D
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 15:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8EEF813B7
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 15:34:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8EEF813B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qZF_bldiJLjZ for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 15:34:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6231D8137D
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6231D8137D
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 15:34:13 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A49B8240011;
 Tue, 28 Feb 2023 15:34:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pX1zU-009nTy-GF; Tue, 28 Feb 2023 16:34:08 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220614192445.2390329-1-ben.hutchings@mind.be>
 <20230207223932.696d9190@windsurf>
Date: Tue, 28 Feb 2023 16:34:08 +0100
In-Reply-To: <20230207223932.696d9190@windsurf> (Thomas Petazzoni via
 buildroot's message of "Tue, 7 Feb 2023 22:39:32 +0100")
Message-ID: <87pm9tkdn3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/wolfssl: Disable broken asm
 implementations on 32-bit Arm
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
Cc: Ben Hutchings <ben.hutchings@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Hello Ben,
 > On Tue, 14 Jun 2022 21:24:45 +0200
 > Ben Hutchings <ben.hutchings@mind.be> wrote:

 >> wolfSSL has ARMv8-A assembly implementations of some functions for
 >> both A64 and A32 ISAs.  However, some of the A32 versions use r11,
 >> which is usually not allowed:
 >> 
 >> wolfcrypt/src/port/arm/armv8-aes.c: In function 'wc_AesCbcEncrypt':
 >> wolfcrypt/src/port/arm/armv8-aes.c:3303:5: error: fp cannot be used in 'asm' here
 >> 3303 |     }
 >> |     ^
 >> 
 >> That can be fixed by adding the compiler flag -fomit-frame-pointer,
 >> but then there is another failure:
 >> 
 >> /tmp/ccV19DQV.s: Assembler messages:
 >> /tmp/ccV19DQV.s:248: Error: first transfer register must be even -- `ldrd r11,r10,[r14,#4*14]'
 >> make[3]: *** [Makefile:5858: wolfcrypt/src/port/arm/src_libwolfssl_la-armv8-chacha.lo] Error 1
 >> 
 >> This is definitely not a valid instruction in A32, which suggests that
 >> this code isn't being tested at all upstream.  So disable it here.
 >> 
 >> Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
 >> ---
 >> package/wolfssl/wolfssl.mk | 4 +---
 >> 1 file changed, 1 insertion(+), 3 deletions(-)

 > Thanks, I finally applied your patch, after adding a reference to the
 > autobuilder failure it is fixing. I also pushed two other patches to
 > fix other wolfssl build failures:

 >   https://gitlab.com/buildroot.org/buildroot/-/commit/36b8c9494b56b877fea62f17926f747c7c7bfb8d
 >   https://gitlab.com/buildroot.org/buildroot/-/commit/f79a9c775ff0a59027f274a237d98b5f8d31c022
 >   https://gitlab.com/buildroot.org/buildroot/-/commit/d8dc5315eb712eca0a5cbf793a6714a47ab6e57e

All 3 committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
