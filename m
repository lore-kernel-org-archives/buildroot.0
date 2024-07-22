Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB87C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 13:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FBE84023E;
	Mon, 22 Jul 2024 13:12:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KgEMjTMJm_-A; Mon, 22 Jul 2024 13:12:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD8F840238
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD8F840238;
	Mon, 22 Jul 2024 13:12:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 749E01BF2A3
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 13:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FC64605D4
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 13:11:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id klukfkSh4tNY for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 13:11:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2B9EB605A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B9EB605A9
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B9EB605A9
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 13:11:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 36DE31BF207;
 Mon, 22 Jul 2024 13:11:55 +0000 (UTC)
Date: Mon, 22 Jul 2024 15:11:54 +0200
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Message-ID: <20240722151154.0bb0fbf5@windsurf>
In-Reply-To: <20240712-pytest-qemu-prompt-detection-v2-1-273b85382796@collins.com>
References: <20240712-pytest-qemu-prompt-detection-v2-1-273b85382796@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721653915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uvdb6gahhC9mwwAiKHdahn34BwdIfmA9JJZuX0sCPjQ=;
 b=gVMl+vj0iVy0Yc2R7J9sj10jJyZFONniTbSu1G3BYXg6wPRAdmiVtviKbcEDoJ9nAC9TuW
 IhYWg6zvOQekuX/+zkQjjxWH8uYXLR3EY6tNH+ELZvnw0f/7k5vTvd9MJU93sTWmpV7j0g
 TXxN2gIt8MFzp20u4VEudDbbn0QtMV4Zd7+JIecRaMN3fQydPu1OqJ5dM1jZCzWX8FXFdp
 IsZ/toVVzU11qtTnlUbz51ZlJU8dCw1ymMD5ztTEG2v5SQVRJZkZkZVIlCCTrLJ6b8nioa
 DgtM/6bUm08eHifTSTACnjNjedXeX5G/TjHZctEa5COL+fTeYlYcsOwBHAw7pA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gVMl+vj0
Subject: Re: [Buildroot] [PATCH v2] support/testing/infra/emulator.py: fix
 qemu prompt detection
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Julien Olivain <ju.o@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 12 Jul 2024 19:31:04 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> From: Brandon Maier via buildroot <buildroot@buildroot.org>
> 
> The qemu.run() method can break when a command happens to output the
> string "# " to stdout. This is because qemu.run() detects when a command
> has completed by searching for the shell prompt, which by default is
> "# ". It then captures everything before the "# " as the commands
> output, causing the rest of output to be lost.
> 
> Instead use the pexpect libraries REPLWrapper to handle running
> commands. It has hooks to set a custom prompt and avoid some other
> pitfalls of wrapping a shell.
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
> I tested this against a couple tests and test_bash.py which Yann noticed
> is special in Julian patch series. I am running a full test run but
> that will take awhile, so sending this in the meantime for review.

It seems like this change has broken one test:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/7391792869

Traceback (most recent call last):
  File "/builds/buildroot.org/buildroot/support/testing/tests/init/test_none.py", line 26, in test_run
    out, exit_code = self.emulator.run("sh -c 'echo $PPID'")
  File "/builds/buildroot.org/buildroot/support/testing/infra/emulator.py", line 153, in run
    output = self.repl.run_command(cmd, timeout=timeout)
AttributeError: 'NoneType' object has no attribute 'run_command'

Could you have a look perhaps?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
