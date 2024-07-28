Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D2BC3DA64
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 14:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50ACC402D7;
	Sun, 28 Jul 2024 14:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UFjOcRjL9cH5; Sun, 28 Jul 2024 14:19:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09940402E1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09940402E1;
	Sun, 28 Jul 2024 14:19:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1CF111BF5B5
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 14:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 183A1606D5
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 14:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jiPISLHbDDQb for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 14:19:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AF789605F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF789605F4
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF789605F4
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 14:19:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0CEF240004;
 Sun, 28 Jul 2024 14:19:45 +0000 (UTC)
Date: Sun, 28 Jul 2024 16:19:44 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240728161944.7ef214e3@windsurf>
In-Reply-To: <c5c3fd836f9f7f503c31ebf1d555453d@free.fr>
References: <20240719173723.546583-1-ju.o@free.fr>
 <20240722151314.6abebd25@windsurf>
 <c5c3fd836f9f7f503c31ebf1d555453d@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722176385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tDAH7SlSYkJQXJ92QwDZ7y9lCPKX3wlhZg7Hb7541mc=;
 b=ZVVV8PY+QiH52Vy4mb5WaIrHH27jw7qwVKMmLuX/TG9VMfqZoCglquhPVVnX0LLCNX0BYL
 Mn+MIX8vxyhw9etOL8CKQNhAoROdu+KTvg5eHYH4lLnoSmABEzbukhogdLQFlnFJkslQTm
 JsWo1iKOmTGaatYU6rekRk/SepW74LnzMKk6VtCM7MNVGkPzPKY6PCAnTNkBcm2ZtnKkdX
 Hr0PwgYCOXe/L5j3/ZZadpNGVeaOKf9eS5xnLxn1Js16nMbnJC4WS2PGEbQEVZTmLttYZB
 W3YY4LXTJFrsGftG0v2PkMOR9mhKOyUn75O2l4mtAisCqAZLtpZudAMrWLjNNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZVVV8PY+
Subject: Re: [Buildroot] [PATCH 1/1] package/kexec: bump to version 2.0.29
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Julien,

On Sun, 28 Jul 2024 15:09:38 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Unfortunately, I cannot reproduce this issue.
> 
> I tested many configurations:
> - at the runtime test failure (commit 6282b4ec),
> - before the kexec-2.0.29 bump (commit acdcc4c~1),
> - at the kexec-2.0.29 bump (commit acdcc4c),
> 
> I did those test on idle host and loaded host, inside the Docker image
> and outside (on Fedora 40). I never set a timeout_multiplier.
> 
> In all cases, the test succeed (in idle host cases) or sometimes
> failed with a clean timeout (on highly loaded host).
> 
> My guess right now is that this execution happened on a very loaded
> runner. The failed job reports 27 minutes of build/execution. As a
> reference, this test succeed in ~6 mins on my idle laptop.

Thanks for having investigated this!

> This slow execution might trigger an actual kexec-tools or kernel
> bug/corner case.
> 
> To better debug those tricky situations, I would suggest to add few
> extra info in the runtime test run log. Namely, the number of cpus of
> the runner, the system load at the time of the test startup, and the
> value of the timeout_multiplier used for the execution. Something
> like adding in support/testing/infra/emulator.py, in boot() :
> 
>      self.logfile.write(f"> host cpu count: {os.cpu_count()}\n")  
>      ldavg = os.getloadavg()
>      ldavg_str = f"{ldavg[0]:.2f}, {ldavg[1]:.2f}, {ldavg[2]:.2f}"
>      self.logfile.write(f"> host loadavg: {ldavg_str}\n")
>      self.logfile.write(f"> timeout multiplier:   
> {self.timeout_multiplier}\n")
> 
> just before the line:
> 
>      self.logfile.write("> starting qemu with '%s'\n" % "   
> ".join(qemu_cmd))
> 
> What do you think?  If you agree, I can send a patch for this.

Makes sense to me, so feel free to send a patch for this.

> Before continuing debugging, I would like to see other executions
> in the CI.

From what I can see, the previous runs of our test cases in the CI did
not encountered any issue with the Kexec test, so it could indeed be a
spurious issue.

Did you know that you can also run the runtime test cases in Gitlab CI
on your side? You need a Gitlab account of course, then fork the
Buildroot repo in your Gitlab account, and push a branch to your Gitlab
Buildroot repo that has a name like this:
whateveryouwant-tests.package.test_kexec.TestKexec and tada, it will
run the kexec test in Gitlab CI. This is documented at "22.7.3. Runtime
tests and Gitlab CI"
in https://buildroot.org/downloads/manual/manual.html.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
