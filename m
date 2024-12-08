Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FABE77173
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 14:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B40F605C8;
	Sun,  8 Dec 2024 14:49:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bm5Ej0O7CDbH; Sun,  8 Dec 2024 14:49:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2D6960619
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2D6960619;
	Sun,  8 Dec 2024 14:49:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DA006F
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E83580FF2
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:49:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w-8QmjFGMb_K for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 14:49:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CF1EF80FD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF1EF80FD8
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF1EF80FD8
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:49:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73A69C0004;
 Sun,  8 Dec 2024 14:49:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tKIb8-00Bdqg-2N;
 Sun, 08 Dec 2024 15:49:26 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Cc: Titouan Christophe <titouanchristophe@gmail.com>
References: <20241206074342.1532295-1-peter@korsgaard.com>
 <87zfl73joh.fsf@dell.be.48ers.dk>
Date: Sun, 08 Dec 2024 15:49:26 +0100
In-Reply-To: <87zfl73joh.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sat, 07 Dec 2024 10:51:26 +0100")
Message-ID: <87o71m1b7t.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/mosquitto: revert an upstream
 change in 2.0.20 breaking nonthread builds
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
 >> Fixes:
 >> http://autobuild.buildroot.net/results/1998881e9ab9ff396e6fd47b0d7c1298ccb25266/
 >> http://autobuild.buildroot.net/results/0cb8e2dcee51007ee09506fa143e52cefbde5335/

 >> And many more.

 >> A change in mosquitto 2.0.20 to fix builds on NetBSD broke WITH_THREADING=no
 >> builds as it unconditionally calls pthread functions.  The issue has been
 >> reported upstream for ~1 month, but so far no fix so revert the NetBSD
 >> change for now instead to fix the build.

 >> https://www.eclipse.org/lists/mosquitto-dev/msg03003.html
 >> https://github.com/eclipse-mosquitto/mosquitto/issues/3183

 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Committed, thanks.

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
