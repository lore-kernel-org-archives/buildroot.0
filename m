Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4134EC4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 19:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B98C043718;
	Wed, 10 Jan 2024 19:34:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B98C043718
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZmSkIRx-ip7y; Wed, 10 Jan 2024 19:34:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9BB343731;
	Wed, 10 Jan 2024 19:34:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9BB343731
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B51CA1BF296
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 19:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B5DF42260
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 19:34:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B5DF42260
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BpyUdlIzLpVL for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 19:34:48 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6713142212
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 19:34:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6713142212
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B29B240002;
 Wed, 10 Jan 2024 19:34:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rNeLc-008k9U-1L;
 Wed, 10 Jan 2024 20:34:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20231227170759.2902227-1-thomas.petazzoni@bootlin.com>
Date: Wed, 10 Jan 2024 20:34:44 +0100
In-Reply-To: <20231227170759.2902227-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Wed, 27 Dec 2023 18:07:58 +0100")
Message-ID: <87il41asob.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] Config.in: rework
 BR2_DOWNLOAD_FORCE_CHECK_HASHES
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > BR2_DOWNLOAD_FORCE_CHECK_HASHES currently has the following
 > dependency:

 > 	depends on BR2_GLOBAL_PATCH_DIR != ""

 > However, strictly speaking checking all hashes does not necessarily
 > require using BR2_GLOBAL_PATCH_DIR, as long as you don't use custom
 > versions.

 > But more importantly:

 > - Having this dependency means that this options is hidden when people
 >   don't use BR2_GLOBAL_PATCH_DIR. Instead the option should always be
 >   made visible, encouraging people to turn it on.

 > - The Config.in comment was there to mitigate this previous argument,
 >   but this comment then shows up all the time when you have an empty
 >   global patch dir.

 > This seems over-complicated, and it sounds much easier to have the
 > option unconditionally available, and visible, and clarify in its help
 > text that in order to this to work fully with custom package versions,
 > BR2_GLOBAL_PATCH_DIR can be used to provide extra hash files.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
