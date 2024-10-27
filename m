Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B10D10C15
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 10:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A72BD4028F;
	Sun, 27 Oct 2024 10:07:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ytf88uuMxljx; Sun, 27 Oct 2024 10:07:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 546BF4029B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 546BF4029B;
	Sun, 27 Oct 2024 10:07:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 427B9971
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 10:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2ED4A80C37
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 10:06:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4FKkaJJmczF1 for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 10:06:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 02C4E80C30
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02C4E80C30
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02C4E80C30
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 10:06:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id E67E020039F;
 Sun, 27 Oct 2024 11:06:46 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:45002])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 27 Oct 2024 11:06:46 +0100
MIME-Version: 1.0
Date: Sun, 27 Oct 2024 11:06:46 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 buildroot@buildroot.org, Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Marek Belisko
 <marek.belisko@open-nandra.com>, "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
In-Reply-To: <20241026181808.4cae0be9@windsurf>
References: <20240916151206.947484-1-adam.duskett@amarulasolutions.com>
 <20240916151206.947484-14-adam.duskett@amarulasolutions.com>
 <20241026181808.4cae0be9@windsurf>
User-Agent: Webmail Free/1.6.9
Message-ID: <f9d70f87165b70be92829d43e9addca2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730023613;
 bh=80YycEGX5kgig1LqcdsWdtA7UjZDqNKZBwrXyPjdr8k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SxHVt8PHGSfdy7Y6Z9u8A+PlXGa7sUi1EKdohaTLxMQiePuY43H04lkoZYPq4FWcx
 NG2zVE3I9U5zmtxJ95xU+Tm1cFuvAl4pt9dFh1VM9UpjdrwdKpQMbfJNYzef7xPn9A
 CS2rFIlYiR7nOJyRR4dEo2OwJXQO6qUd6IxiIUFAstKPMdNxkXO18nYiHs+irXFHxu
 h3sVIBYK7DsoBh5BySrULx9RS3CEvG5ODzSRDCjX9EdKs3HZhdJ7geUGkJaKV3YtcQ
 zgPG0uuImuFhYLo9lxJf3M/zfrYVWFCsmmdtlkm2gCUJxCpDkvLbPNkh2bYnKiosjU
 oxcT++LsE1MgA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SxHVt8PH
Subject: Re: [Buildroot] [PATCH 13/13] package/audit: bump version to 4.0.2
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, Adam, all,

On 26/10/2024 18:18, Thomas Petazzoni wrote:
> Hello Adam,
> 
> Cc Julien for runtime test, Cc Fiona for init script.
> 
> On Mon, 16 Sep 2024 17:12:06 +0200
> Adam Duskett <adam.duskett@amarulasolutions.com> wrote:
> 

[...]

>> Tested with qemu_x86_64_defconfig and running checking if audit is 
>> running
>> properly.
> 
> Would be nice to have an audit test case in support/testing :-)

Thanks for suggesting a new runtime test! I added this one on
my list.

While I quickly tried to draft something, I've hit the following
issue. Compiling with a (aarch64) Bootlin external toolchain, the
build failed with:

     libaudit.c: In function 'audit_rule_fieldpair_data':
     libaudit.c:1911:22: error: 'AUDIT_SADDR_FAM' undeclared (first use 
in this function); did you mean 'AUDIT_ADD_RULE'?
      1911 |                 case AUDIT_SADDR_FAM:
           |                      ^~~~~~~~~~~~~~~
           |                      AUDIT_ADD_RULE

This build failure is not happening with audit v3.1.2.

This is because the toolchain I used included Kernel headers 4.20.
This AUDIT_SADDR_FAM support was added in Kernel v5.3. See [1].

Also, audit v4.0 removed some definitions in [2]. This commit
claim to raise the Kernel header requirement to 5.0. Unless I missed
something, it seems there is a small discrepancy here (v5.0 ~ v5.3).
There is possibly a bug in the audit code (which should have kept
this definition). The audit code indeed claim kernel >= 5.0, see [3].

Anyways, whatever the exact kernel version is needed, I believe audit
needs a new "depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_x".

Adam, could you have a look at this?

Best regards,

Julien.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=bf361231c295d92a28ca283ea713f56e93e55796
[2] 
https://github.com/linux-audit/audit-userspace/commit/7e417fd78ae89eef8c512d4f1ded29d58b36f11b
[3] 
https://github.com/linux-audit/audit-userspace/blob/v4.0.2/README.md#build-time-dependencies-for-tar-file
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
