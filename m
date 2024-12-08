Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B944E77173
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 14:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C563403B2;
	Sun,  8 Dec 2024 14:48:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hUFQ_luo5gnp; Sun,  8 Dec 2024 14:48:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BEC3403B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BEC3403B9;
	Sun,  8 Dec 2024 14:48:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EC10C979
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5D1A80FD8
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:48:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i7qwwN8IgmK5 for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 14:48:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BD95080FEF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD95080FEF
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD95080FEF
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:48:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6605BE0003;
 Sun,  8 Dec 2024 14:48:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tKIaC-00BdmE-2k;
 Sun, 08 Dec 2024 15:48:28 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20241207150131.1055326-1-ju.o@free.fr>
Date: Sun, 08 Dec 2024 15:48:28 +0100
In-Reply-To: <20241207150131.1055326-1-ju.o@free.fr> (Julien Olivain's message
 of "Sat, 7 Dec 2024 16:01:31 +0100")
Message-ID: <87seqy1b9f.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: improve weston test
 reliablity
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

 > The weston runtime test is unreliable, depending on the execution speed
 > of its runner. Example of failure is [1], and success is [2]. This
 > commit improves the test in several ways, to make it more robust to
 > execution speed variations:

 > - The command started in background (weston, weston-simple-egl) are
 >   now started in a subshell. This suppresses the job control messages
 >   when they are stopped. Those messages could interfere with the parsing
 >   of the output;

 > - Wait time are moved outside the emulator;

 > - The kernel argument vt.global_cursor_default=0 is added, to make sure
 >   cursors are globally disabled, since the test use vkms display CRCs;

 > - The memory of the emulator is increased to 512M. This test uses cpio
 >   initramfs, and the filesystem size increased;

 > - The vkms driver emulates a "vsync" event, but can generate a warning
 >   when the system is too slow. This warning is printed on the console by
 >   the klogd daemon in its default configuration. This commit adds the
 >   overlay file /etc/default/klogd to limit only kernel emergency
 >   messages to be printed on the console. This change fixes the failure
 >   seen in [1] ;

 > - Some sleep time values were adjusted to run on a "performant" idle
 >   host. Those values are not suitable in all situations. In the
 >   meantime a generic retry mechanism is added in the test infra, this
 >   commit adds a retry logic inspired from the test_flutter runtime
 >   test.

 > Fixes: [1]

 > [1] https://gitlab.com/buildroot.org/buildroot/-/jobs/8562483474
 > [2] https://gitlab.com/buildroot.org/buildroot/-/jobs/8435236652

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed to 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
