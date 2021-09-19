Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NUMERIC_HTTP_ADDR,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2,WEIRD_PORT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D34AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:11:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E496761244
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:11:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E496761244
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B6028402C;
	Sun, 19 Sep 2021 12:11:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jdXit-Rl_zbE; Sun, 19 Sep 2021 12:11:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC19D8401B;
	Sun, 19 Sep 2021 12:11:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F26B71BF2F3
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEF57606C6
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:10:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y2xrYurCBU07 for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 12:10:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B3BFD606AF
 for <buildroot@uclibc.org>; Sun, 19 Sep 2021 12:10:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 70C5C60003;
 Sun, 19 Sep 2021 12:10:54 +0000 (UTC)
Date: Sun, 19 Sep 2021 14:10:53 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "buildroot@uclibc.org" <buildroot@uclibc.org>
Message-ID: <20210919141053.3afc7389@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: [Buildroot] Issue with capture of emulator output in runtime test
 infra
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hello,

I've been working on some additional test cases in support/testing/,
and stumbled across an issue in the infrastructure, which I thought I
should report before forgetting about it.

The run() method of the Emulator() class captures the output of the
command executed inside the emulated system:

    def run(self, cmd, timeout=-1):
        self.qemu.sendline(cmd)
        if timeout != -1:
            timeout *= self.timeout_multiplier
        self.qemu.expect("# ", timeout=timeout)
        # Remove double carriage return from qemu stdout so str.splitlines()
        # works as expected.
        output = self.qemu.before.replace("\r\r", "\r").splitlines()[1:]

        self.qemu.sendline("echo $?")
        self.qemu.expect("# ")
        exit_code = self.qemu.before.splitlines()[2]
        exit_code = int(exit_code)

As can be seen from the [1:], we remove the first line, because it
contains the command that was executed.

The problem is that when the command is long, for some reason due to
how the emulation works, it gets wrapped on two lines, like this:

# curl -s -o /dev/null -w "%{http_code}\n" -X POST -H "Content-Type: application
/json" -d '{"email": "test", "name": "test"}' http://127.0.0.1:5000
200

(The wrapping above does not come from my e-mail client, it is really
wrapped after "application" and before "/json" in the output).

Due to this, our Emulator.run() logic strips out the "# curl ..." line,
but the output array looks like this:

output[0] = /json" -d '{"email": "test", "name": "test"}' http://127.0.0.1:5000
output[1] = 200

While we would have expected output[] to contain just a single element,
"200", which is really the only output of the command. For now, I've
worked around this by looking at output[-1] in my test case, which is
good enough because I only care about one line of output.

However, I'm not really sure how to fix this in the Emulator.run() core
itself. Perhaps we should not be using the -serial stdio (which
requires interacting on stdin/stdout), but instead use a separate
telnet port (but then there's always the issue of which port to use) ?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
