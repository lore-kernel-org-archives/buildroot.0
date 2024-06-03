Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C63C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 15:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3790181384;
	Mon,  3 Jun 2024 15:17:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fo1fT1Ix3yU3; Mon,  3 Jun 2024 15:17:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C2D382070
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C2D382070;
	Mon,  3 Jun 2024 15:17:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 38AB01BF228
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 15:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C547820AE
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 15:17:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SpLSbosf-dCL for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 15:17:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 94B5C81384
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94B5C81384
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94B5C81384
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 15:17:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C513240006;
 Mon,  3 Jun 2024 15:17:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sE9Qt-003JKs-1G;
 Mon, 03 Jun 2024 17:17:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240412222459.1630158-1-ju.o@free.fr>
 <20240509174640.757b565d@windsurf>
Date: Mon, 03 Jun 2024 17:17:11 +0200
In-Reply-To: <20240509174640.757b565d@windsurf> (Thomas Petazzoni via
 buildroot's message of "Thu, 9 May 2024 17:46:40 +0200")
Message-ID: <87ttiahx8o.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] package/lvm2: enable device-mapper in
 Kernel config
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Sat, 13 Apr 2024 00:24:58 +0200
 > Julien Olivain <ju.o@free.fr> wrote:

 >> LVM2 has a hard dependency on the device-mapper presence in the Kernel.
 >> This commit enables those mandatory Kernel configuration by defining
 >> the _LINUX_CONFIG_FIXUPS macro. This will make sure the final system
 >> image will end up in a working configuration.
 >> 
 >> This was suggested by Arnout in [1].
 >> 
 >> [1] https://lists.buildroot.org/pipermail/buildroot/2024-April/688776.html
 >> 
 >> Suggested-by: Arnout Vandecappelle <arnout@mind.be>
 >> Signed-off-by: Julien Olivain <ju.o@free.fr>
 >> ---
 >> package/lvm2/lvm2.mk | 5 +++++
 >> 1 file changed, 5 insertions(+)

 > Both applied, thanks!

Committed both to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
