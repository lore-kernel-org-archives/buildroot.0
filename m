Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84B3C4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 19:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1993F41D8D;
	Sat, 13 Jan 2024 19:56:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1993F41D8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UXVm_oCof3ik; Sat, 13 Jan 2024 19:56:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 769AE41D7B;
	Sat, 13 Jan 2024 19:56:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 769AE41D7B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 934BA1BF397
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 19:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79B8060ED5
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 19:56:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79B8060ED5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i4g6va2e2chn for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 19:56:33 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39C2860A6B
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 19:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39C2860A6B
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD269E0005;
 Sat, 13 Jan 2024 19:56:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rOk7J-00DLvM-0a;
 Sat, 13 Jan 2024 20:56:29 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240106095524.0610E81D7B@busybox.osuosl.org>
 <87ply5wtzf.fsf@48ers.dk> <20240113184532.3d393158@windsurf>
Date: Sat, 13 Jan 2024 20:56:29 +0100
In-Reply-To: <20240113184532.3d393158@windsurf> (Thomas Petazzoni's message of
 "Sat, 13 Jan 2024 18:45:32 +0100")
Message-ID: <877ckdt3bm.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [git commit] package/avahi: fix libavahi-client
 handling
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
Cc: fontaine.fabrice@gmail.com,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello Peter,
 > On Sat, 13 Jan 2024 08:52:20 +0100
 > Peter Korsgaard <peter@korsgaard.com> wrote:

 >> Does this change really make sense in the context of Buildroot? Libavahi
 >> is a library to talk to the avahi daemon, so not very useful without the
 >> daemon.

 > True. To be honest, I didn't put too much thinking when applying
 > Fabrice's patch: the daemon was not strictly needed when building the
 > library, dropping the dependency made sense, so I applied. If there is
 > a runtime dependency on the daemon, then indeed maybe we should keep
 > the dependency. No strong feeling about it, and I certainly wouldn't
 > feel offended if the commit was reverted.

It is at least my understanding that libavahi doesn't make much sense
without the daemon, unless I am missing something. Fabrice?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
