Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2D1C4167B
	for <buildroot@archiver.kernel.org>; Mon, 11 Dec 2023 08:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4963541608;
	Mon, 11 Dec 2023 08:43:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4963541608
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DatZLqOY3t7T; Mon, 11 Dec 2023 08:43:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EAB941600;
	Mon, 11 Dec 2023 08:43:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EAB941600
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B46BD1BF3DD
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 08:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CD7C607F0
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 08:43:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CD7C607F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4XpaYrb6iwh6 for <buildroot@lists.busybox.net>;
 Mon, 11 Dec 2023 08:43:54 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 96FB3607E1
 for <buildroot@buildroot.org>; Mon, 11 Dec 2023 08:43:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96FB3607E1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 956E31BF20E;
 Mon, 11 Dec 2023 08:43:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rCbtG-0038tq-2g;
 Mon, 11 Dec 2023 09:43:50 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
References: <87y1e7sq4u.fsf@48ers.dk> <87fs09oemm.fsf@48ers.dk>
 <12337986.O9o76ZdvQC@kilian-aisec>
Date: Mon, 11 Dec 2023 09:43:50 +0100
In-Reply-To: <12337986.O9o76ZdvQC@kilian-aisec> (Kilian Zinnecker's message of
 "Mon, 11 Dec 2023 00:53:11 +0100")
Message-ID: <874jgpnn7d.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] Talos security vulnerabilities TALOS-2023-1844 /
 TALOS-2023-1845
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

>>>>> "Kilian" == Kilian Zinnecker <kilian.zinnecker@mail.de> writes:

Hello,

 > Hello Peter, all,
 > as far as I see it, most package within buildroot have hash files. So, would it
 > make sense, that we use the new feature and actually add hash files, if a board
 > uses a custom versions of the kernel, uboot, etc.? If so, it would not be very
 > convenient to add all the hash files manually. I started writing a script,
 > which goes through all defconfigs an tries to identify, whether the defconfig
 > uses a custom kernel, uboot, or ATF. If so, and if there exists a
 > BR2_GLOBAL_PATCH_DIR in the defconfig, the script runs your "add-custom-hashes"
 > script, which then adds the hash files. My script is far from perfect. But I
 > wanted to ask for an opinion, before I continue putting more effort into it.
 > Running the script for all defconfigs would take quite some time and probably
 > use a huge amount of disk space. See a patch containing the script below. (I
 > don't advocate for really adding the script to buildroot, the patch is just a
 > way to share the script.)

It is all a question about our threat model. The hashes protect against
getting different sources than we were expecting, but adding hashes for
custom package versions also brings some overhead.

As I see it, we basically have:

Downloads from a non-HTTPS/non-TLS location: Vulnerable to man in the
middle attacks, we should add a .hash to protect against that,
E.G. see commit cdc9b8a3a75c4c

For downloads from a HTTPS/TLS location we don't have a (realistic)
man-in-middle risk, but the server owner could change the file. We
should add a hash to protect against that / be able to detect that,
E.G. see commit cf2dcaa1ecede

Among the HTTPS/TLS downloads, a (big) subset of those refer to git
hashes, meaning that the site owner cannot (realisticly) change the
content of the files. I would argue that the risk is so low that it is
not worth the extra overhead to add hashes for those.

I believe this is the situation today in Buildroot, so if we agree on
that threat model / these mitigations then there is nothing more to do
(unless something slipped through the cracks).

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
