Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FE2C4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 20:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4CA641EA8;
	Sat, 13 Jan 2024 20:11:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4CA641EA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FPD1mXpk_2Vn; Sat, 13 Jan 2024 20:11:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1462B41EA6;
	Sat, 13 Jan 2024 20:11:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1462B41EA6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E61D51BF83A
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDED0402BC
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:11:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDED0402BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AdW4W4j_Ib8P for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 20:11:16 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 62CED4026F
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 20:11:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62CED4026F
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD65140002;
 Sat, 13 Jan 2024 20:11:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rOkLX-00DMmw-3D;
 Sat, 13 Jan 2024 21:11:12 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240106133919.1586012-1-fontaine.fabrice@gmail.com>
Date: Sat, 13 Jan 2024 21:11:11 +0100
In-Reply-To: <20240106133919.1586012-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 6 Jan 2024 14:39:19 +0100")
Message-ID: <87ttnhro2o.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/nushell: fix sparc64 build
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure on sparc64 raised since bump to version
 > 0.85 in commit 470f0fb1ec0bd2ba03340f2aea34891ca8d7739d:

 > error[E0308]: mismatched types
 --> /home/autobuild/autobuild/instance-7/output-1/build/nushell-0.85.0/VENDOR/uucore/src/lib/features/fs.rs:121:16
 >     |
 > 111 |     pub fn number_of_links(&self) -> u64 {
 >     |                                      --- expected `u64` because of return type
 > ...
 > 121 |         return self.0.st_nlink;
 >     |                ^^^^^^^^^^^^^^^ expected `u64`, found `u32`
 >     |
 > help: you can convert a `u32` to a `u64`
 >     |
 > 121 |         return self.0.st_nlink.into();
 >     |                               +++++++

 > For more information about this error, try `rustc --explain E0308`.
 > error: could not compile `uucore` (lib) due to previous error

 > Fixes:
 >  - http://autobuild.buildroot.org/results/f9f0287a8e39c65895014ca513ed25071f020add

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
