Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FEEC54E41
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CDB241B81;
	Thu, 29 Feb 2024 15:53:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HIzHlxPCXVPe; Thu, 29 Feb 2024 15:53:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D6C641BAF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D6C641BAF;
	Thu, 29 Feb 2024 15:53:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 029B41BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFA8260F21
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:31:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4vqAB4axRQmV for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:31:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BBCB3607F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBCB3607F3
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BBCB3607F3
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:31:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13D9A20005;
 Thu, 29 Feb 2024 15:31:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfiNG-004nNW-1H;
 Thu, 29 Feb 2024 16:31:06 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240118222310.62234-1-brandon.maier@collins.com>
 <20240205185616.13fb5202@windsurf>
Date: Thu, 29 Feb 2024 16:31:06 +0100
In-Reply-To: <20240205185616.13fb5202@windsurf> (Thomas Petazzoni via
 buildroot's message of "Mon, 5 Feb 2024 18:56:16 +0100")
Message-ID: <87y1b3fft1.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: fix build error on
 powerpc
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
Cc: Brandon Maier <brandon.maier@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Thu, 18 Jan 2024 22:23:01 +0000
 > Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

 >> Fixes the following error message introducted by OpenSSH v9.6p1.
 >> 
 >> sshkey.c: In function 'sshkey_set_filename':
 >> sshkey.c:3705:1: sorry, unimplemented: '-fzero-call-used-regs' not supported on this target
 >> 3705 | }
 >> 
 >> Fixes:
 >> http://autobuild.buildroot.org/results/ec7/ec780aed5b1c4fdf9b91f6e7be99e8d4c42efa58
 >> 
 >> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
 >> ---
 >> ...ction-of-broken-fzero-call-used-regs.patch | 57 +++++++++++++++++++
 >> package/openssh/openssh.mk                    |  3 +
 >> 2 files changed, 60 insertions(+)
 >> create mode 100644 package/openssh/0001-better-detection-of-broken-fzero-call-used-regs.patch

 > Applied to master, thanks.

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
