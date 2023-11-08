Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0C5C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 20:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B633607C1;
	Wed,  8 Nov 2023 20:27:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B633607C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nWa7tI4qwqOl; Wed,  8 Nov 2023 20:27:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6AE860A91;
	Wed,  8 Nov 2023 20:27:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6AE860A91
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B4C6B1BF282
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 20:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99C64401CA
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 20:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99C64401CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id av7tBCq8JMek for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 20:27:43 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A7AA4013B
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 20:27:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A7AA4013B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C3D540008;
 Wed,  8 Nov 2023 20:27:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r0p9H-001Dvt-1H;
 Wed, 08 Nov 2023 21:27:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
References: <20231103182745.903344-1-adam.duskett@amarulasolutions.com>
 <20231103213125.GB2875@scaer>
 <CAHDQB6OVYYoG+y7JjcUFs5js_Kqe48z69BskS8MOCV62kpc4LQ@mail.gmail.com>
Date: Wed, 08 Nov 2023 21:27:39 +0100
In-Reply-To: <CAHDQB6OVYYoG+y7JjcUFs5js_Kqe48z69BskS8MOCV62kpc4LQ@mail.gmail.com>
 (Adam Duskett's message of "Sun, 5 Nov 2023 10:07:17 -0700")
Message-ID: <878r78q9c4.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 0/3] Add tainting support
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Adam" == Adam Duskett <adam.duskett@amarulasolutions.com> writes:

 > Yes, but to your original points
 > https://patchwork.ozlabs.org/project/buildroot/list/?series=64340, this is
 > not
 > an acceptable solution to put  "NODEJS_SRC_LICENSE += , vendored
 > dependencies licenses probably not listed"

 > in the makefile, because there are several valid instances where you may be
 > able to guarantee the integrity of

 > the licenses and provide hashsums for each of them. Hence, the ability to
 > disable the taint check.

In that case you would probably make individual packages for those to
have the download/license/hash stuff integrated?

As is this seems very vague and not something that will be tested by the
autobuilders, so I prefer Yann's simple npm license addition.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
