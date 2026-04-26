Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10008FF885E
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 15:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27EB9429CD;
	Sun, 26 Apr 2026 15:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E4aLE5wkkbsB; Sun, 26 Apr 2026 15:33:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5402F4292B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777217638;
	bh=+jds7/7Bh/2fxpD/pH0LhyxCkkT4XRH/PSYX0RZo40E=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=W1RBasnMwz9pQa8K4r/i3IweeJ21p4glm1+4I+vTIjmNbJbgVcvrGzcYNNMOab4+q
	 hxkNTAmUFfG6/ZaEGIF33kJE6ipCdNcPAbp5mGDwILNgkcKC8OYggzkpSDQ5x6Vnvz
	 4rzrs9yG190Ol4DtHqv/8E8xaep6CivIfyoNU2jTV4lOBL72LBwyUbdzciUDs4pZFS
	 VUum+wbKQ0UDlyVXYsb5wogShmU9BSgG0WbZ9K987DusIzkHPT4M22owuw1jRH4uz4
	 pAkF55vwFr/b3/a7xJm6g5GjfoWqRLurMMNK3jU6BVNOPttAlTD8CZjFTT680u9J7J
	 vL/hMmYuy5GBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5402F4292B;
	Sun, 26 Apr 2026 15:33:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EA21C231
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 15:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFC7D401FF
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 15:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TM0sGKaVrm6m for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 15:33:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 824F64018E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 824F64018E
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 824F64018E
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 15:33:55 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mlw3X-1vYrFb1teV-00fue5; Sun, 26
 Apr 2026 17:33:44 +0200
To: buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>,
	Fiona Klute <fiona.klute@gmx.de>
Date: Sun, 26 Apr 2026 17:33:28 +0200
Message-ID: <20260426153334.1026982-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:el96QMlKQQZXxwtwFjeXN8HZ3JCqMa0ugoYPIYOprN0BStyshUh
 vVAzxW0SjQRHPDTAMacqYwvPdHGYjECB2E4DCFNbbU51tV9FSY+gKhu3nPcxrjddm/HGiqm
 4YNNGBHE4PCIk5du7IR2qKlWrXVazIP3gC/iqbzu6nmhhVm/RSuAJ2GIDFJ3cS3jvwCsmYz
 UkEBF1MwbMT0JwNCxE3qA==
UI-OutboundReport: notjunk:1;M01:P0:DvmoJayOxps=;ouVcGc8c3a7q4x1lTS9/qZ+eht/
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1777217624; x=1777822424; i=fiona.klute@gmx.de;
 bh=v9iNXjGxHVjqtV7gPm6u3K2rYMye4CKPOX6HpkW9kus=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Af/XW2brCkGzaYi9vz2kCO5a1YKrSkN+3RWWO5Z0W9+pw4UDO6Yzxbs+Lol41nTF
 R5btCGTHmWVpUVKtYWfZWXYILdiIvCOguog7vboUICLRQdpapfglcKfRDYNp59Rkw
 ITYxcAjNmaihwUBEIT5NXSeQ4TjYxqTm5DSYZtNKRHSYoMu5DSQlwp9K1MOx5x8sB
 +P6o6+cRAmMVgURnlt5yDXYk8YRVsO2QuGOqmBU27gNEjOqM5KlCYC0Mfa5DLLNp4
 vhVWFVU4xohGEwzVgO3w0tB9cQzzNqEeYv8FNR0bkr6ZtP6GxLWmJJXCsN+M79zQt
 p/4McXjXQdyhUxG4NQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=Af/XW2br
Subject: [Buildroot] [PATCH v2 0/6] Bugfixes for pkg-stats
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi everyone,

this series is a collection of small bug fixes for
support/scripts/pkg-stats, fixing bugs I bumped into checking a fairly
simple build with it:

* Incorrect upstream URLs (most notably for the Linux kernel, and I
  had a wrong one for a package in an external tree due to an Emacs
  backup file), patch 1 + 3

* Entries for *missing* upstream URL would still be links with
  href="None", patch 2

* The "infrastructure" column would list "host-* (target)" when a
  package that supports a host build is actually built only for the
  target, patch 4

Patches 5 and 6 are small fixes for the script itself (don't
unnecessarily load whole package files, allow importing the script as
a module).

I see a bunch more things that should be fixed (notably virtual
packages reporting missing license/hash info when there simply is
none, and the package parsing process itself), this is what I had time
for.

One question for possible future improvements: Is the JSON output
format documented/defined anywhere, or simply "what the script
produces, subject to change"?

Best regards,
Fiona


Changes v1 -> v2:
* Avoid glob in patch 1
* Add patches 4-6

v1: https://patchwork.ozlabs.org/project/buildroot/list/?series=501442&state=*

Fiona Klute (6):
  support/scripts/pkg-stats: search only Config.in{,.host} for URL
  support/scripts/pkg-stats: format upstream URL info consistently in
    HTML
  linux/Config.in: add kernel.org URL as BR2_LINUX_KERNEL_LATEST_VERSION
    help
  support/scripts/pkg-stats: fix host/target infra filter
  support/scripts/pkg-stats: don't buffer whole file searching for infra
  support/scripts/pkg-stats: run main function only if called as script

 linux/Config.in           |  2 ++
 support/scripts/pkg-stats | 54 ++++++++++++++++++++++-----------------
 2 files changed, 32 insertions(+), 24 deletions(-)

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
