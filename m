Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE6CEEB58D
	for <buildroot@archiver.kernel.org>; Thu, 12 Sep 2024 10:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14E5E40B73;
	Thu, 12 Sep 2024 10:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lp2Bg2HmuFvd; Thu, 12 Sep 2024 10:44:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC24941803
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC24941803;
	Thu, 12 Sep 2024 10:44:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 957571BF2A1
 for <buildroot@lists.busybox.net>; Thu, 12 Sep 2024 10:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91D4F81C58
 for <buildroot@lists.busybox.net>; Thu, 12 Sep 2024 10:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rg8Z7TnWcG2I for <buildroot@lists.busybox.net>;
 Thu, 12 Sep 2024 10:44:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3AA0781C0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AA0781C0A
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3AA0781C0A
 for <buildroot@buildroot.org>; Thu, 12 Sep 2024 10:44:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92B811BF208;
 Thu, 12 Sep 2024 10:44:42 +0000 (UTC)
Date: Thu, 12 Sep 2024 12:44:41 +0200
To: Michael Trimarchi <michael@amarulasolutions.com>
Message-ID: <20240912124441.1893644c@windsurf>
In-Reply-To: <20240903085745.2594893-1-michael@amarulasolutions.com>
References: <20240903085745.2594893-1-michael@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726137882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F0RB0krvX6k9vkAv+5ZV4ulVlVVzSuJBbd9Q/v9m3Jg=;
 b=Qg/Vlm4zqoSgC6FdqZxLrQKBtyJtpRJdWDhpg6aw5MfmCCUNwvxiYFGOu69niicxtY51iW
 OfUaurjln59zTA21koVZqKMqzNv6W1bqXzuZ7lhifxhBfJAIIqwVkPqtXIi92Pnzv29UxT
 sxQ+5Uj/86ZnlPFlqDdur5jDOFnSCGHwDACIpjOaTzATirhA/rZBX7IzyulRzitsCfcqzJ
 O82g3cuiuA0Umw9GoN/m+YW4/kNR8eTpe19k4J7SbDnugk3RAbFmlnz7n83ViKCVgQWfZx
 Htvn7JFJmIDLLj52GQ/K9wGMC4FeBM/31TcLB08iE2ld2+22aCaMgn9g7wolpA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Qg/Vlm4z
Subject: Re: [Buildroot] [PATCH V2 1/2] scripts/cve: Avoid to do a complete
 clone of cve git repository
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
Cc: linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Michael,

On Tue,  3 Sep 2024 10:57:44 +0200
Michael Trimarchi <michael@amarulasolutions.com> wrote:

> Just a simple clone and pull with --depth 1 should be enough to parse the
> cve and generate the pkg-stats report.
> 
> From a full clone and a depth-1 clone, and the size delta is 2.9GiB vs. 2.2GiB.
> The download size does change: from 983.55MiB down to 270.78MiB.
> it's a net time win too: 2m17s vs 1min7s (on a 100Mbps link).
> 
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> ---
> V1->V2:
>     - Add statistics from Yann E. Morin
>     - Use git pull --depth 1 for update the repo

I am sorry, but I had to revert this commit... as it doesn't work:

Updating from https://github.com/fkie-cad/nvd-json-data-feeds/
Traceback (most recent call last):
  File "/home/buildroot/buildroot-stats/./support/scripts/pkg-stats", line 1346, in <module>
    __main__()
  File "/home/buildroot/buildroot-stats/./support/scripts/pkg-stats", line 1335, in __main__
    check_package_cves(args.nvd_path, packages)
  File "/home/buildroot/buildroot-stats/./support/scripts/pkg-stats", line 660, in check_package_cves
    for cve in cvecheck.CVE.read_nvd_dir(nvd_path):
  File "/home/buildroot/buildroot-stats/support/scripts/cve.py", line 105, in read_nvd_dir
    CVE.download_nvd(nvd_git_dir)
  File "/home/buildroot/buildroot-stats/support/scripts/cve.py", line 74, in download_nvd
    subprocess.check_call(
  File "/usr/lib/python3.11/subprocess.py", line 413, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['git', 'pull', '--depth', '1']' returned non-zero exit status 128.

if I go to the machine in question:

buildroot@buildroot:~/nvd/git$ git pull --depth 1
remote: Enumerating objects: 164, done.
remote: Counting objects: 100% (140/140), done.
remote: Compressing objects: 100% (27/27), done.
remote: Total 63 (delta 54), reused 44 (delta 36), pack-reused 0 (from 0)
Unpacking objects: 100% (63/63), 18.15 KiB | 26.00 KiB/s, done.
From https://github.com/fkie-cad/nvd-json-data-feeds
 + 51b091a6a4...7b69235976 main       -> origin/main  (forced update)
hint: You have divergent branches and need to specify how to reconcile them.
hint: You can do so by running one of the following commands sometime before
hint: your next pull:
hint: 
hint:   git config pull.rebase false  # merge
hint:   git config pull.rebase true   # rebase
hint:   git config pull.ff only       # fast-forward only
hint: 
hint: You can replace "git config" with "git config --global" to set a default
hint: preference for all repositories. You can also pass --rebase, --no-rebase,
hint: or --ff-only on the command line to override the configured default per
hint: invocation.
fatal: Need to specify how to reconcile divergent branches.

I had already done a git reset --hard, and see if it was just a
one-time issue, but nope. So there's something that doesn't work here.

In case that matters, this machine has:

$ git --version
git version 2.39.2

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
