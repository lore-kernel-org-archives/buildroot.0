Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28870E6ADEB
	for <buildroot@archiver.kernel.org>; Sat, 23 Nov 2024 09:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEE97405C5;
	Sat, 23 Nov 2024 09:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FToYZeRnbEOu; Sat, 23 Nov 2024 09:52:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84AD540604
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84AD540604;
	Sat, 23 Nov 2024 09:52:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E3F11D8B
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 09:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C3814029F
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 09:52:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZBZ-OmiuV5-j for <buildroot@buildroot.org>;
 Sat, 23 Nov 2024 09:52:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2A61340124
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A61340124
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A61340124
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 09:52:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D1E91C0003;
 Sat, 23 Nov 2024 09:52:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tEmoD-00Bekl-2W;
 Sat, 23 Nov 2024 10:52:09 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org,  Vincent Jardin <vjardin@free.fr>
References: <20241122181014.96629-1-ju.o@free.fr>
Date: Sat, 23 Nov 2024 10:52:09 +0100
In-Reply-To: <20241122181014.96629-1-ju.o@free.fr> (Julien Olivain's message
 of "Fri, 22 Nov 2024 19:10:14 +0100")
Message-ID: <87cyimqnue.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/1] package/util-linux-libs: allowing
 building even on non-Y2038 compliant systems
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > Since the bump of util-linux to version 2.40.2 in Buildroot commit
 > f14929c657a7b1794dcd39ac469d2ad826465d98 ("package/util-linux: update
 > to 2.40.2"), the build will fail on systems that are not Y2038,
 > such as uClibc configurations.

 > In order to preserve the previous behavior, pass --disable-year2038.
 > See the gnulib documentation for details [1]. Contrary to what the
 > option name might suggest, it doesn't really disable Y2038 support,
 > but only the check that the system is Y2038 compliant. So even with
 > --disable-year2038, if the system is Y2038 compliant (uses a 64-bit
 > arch, uses the musl C library, or uses the glibc C library with
 > BR2_TIME_BITS_64=y), util-linux tools will be Y2038 compliant.

 > "--disable-year2038" was already added to util-linux in commit
 > 11ae90b00 "package/util-linux: allowing building even on non-Y2038
 > compliant systems".

 > Fixes:
 > https://autobuild.buildroot.org/results/630fc287deb1cf5a684f274058b918a5d7aef989

 > [1] https://www.gnu.org/software/gnulib/manual/html_node/Avoiding-the-year-2038-problem.html

 > Reviewed-by: Vincent Jardin <vjardin@free.fr>
 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 > Change v1 -> v2:
 > - Add comment near --disable-year2038 (comment from Vincent)

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
