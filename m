Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1C2E784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68E7C406C2;
	Sun, 28 Dec 2025 22:20:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ocTrX10RL6Uo; Sun, 28 Dec 2025 22:20:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 749314067A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766960428;
	bh=T6qizP5/hoU75YDT6dnO9Fk/N/7jptXM4fQTAtAG8T8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lQrxwoJ2FK+Y9KvnVFEgIi3xitnBFIVvf34mhrnK0ku23ITTvC9ft0nIzx/tr/1EX
	 XDX7K8eyHoO7EQ4pYyrd/S8Ol+P65LWTNN3j/U8JaluMbZqy0ich6gkD9GOGKLdfFh
	 lcCIBPL8hTO2Pfun65tfviR4U8TPm25jWW3uC21nm2ItRkT8IyWevON9ZkVmLIgb8a
	 qVVlI8Y9D6BR+D7icdPPTj5fbBHuWK0EN3+lEW/FFDVMfAai+FusT46Q6ZOkYBSPX7
	 8EgK0NgHrQfUACoeJsLi7LRQiZUKfBugtJPnrXTNXdFJua8SmfCPVkC3aoVLWsMno5
	 OIhlvozyr30jQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 749314067A;
	Sun, 28 Dec 2025 22:20:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1974CD8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 003754016B
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:20:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VxOugFuiovsz for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:20:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E94C040055
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E94C040055
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E94C040055
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:20:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D51124E41E38;
 Sun, 28 Dec 2025 22:20:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9BCBC60725;
 Sun, 28 Dec 2025 22:20:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5448811979398; Sun, 28 Dec 2025 23:20:22 +0100 (CET)
Date: Sun, 28 Dec 2025 23:20:21 +0100
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>, Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20251228232021.4d4e70c9@windsurf>
In-Reply-To: <20251221180810.3770181-1-ju.o@free.fr>
References: <20251221180810.3770181-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766960423; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=j8bgLOumygQtyLiddm5vv4syAVkVr+UeEmjwnGw0mz8=;
 b=LHM8f1B13rI1Bv6WkUi/zyF50B1+6NbK4c9IIdMan6qkfw99XsahrikjNfJrxQ+WS7NjHw
 cBDqPGqbH7lAEQlz0Jvt8mftFJReNWbumSf23iBQFCDpvEWqmkCc+IP87lk2DgQEUQkneh
 YRFZgcT5o/1VwWDsiaiSlte6D3Y96UuL6LPgU3WxBz+uN4iouUaQwT322r5OMgtg1vEvXT
 9I/spzfLx7prnaj9FnfOMtIBf3WLiWYsogW/CZYVDY0F8KHVx2DoQFmp387tZ7P85r44VH
 mL7Pq5olL/0WdU9bXmX3W4qOMuZNPjaqyhXt4uTmI1DOHAkuNcvnFfRAqwFw2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=LHM8f1B1
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: ltp-testsuite: replace
 runltp by kirk
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 21 Dec 2025 19:08:10 +0100
Julien Olivain via buildroot <buildroot@buildroot.org> wrote:

> The run log of this ltp-testsuite test shows:
> 
>     INFO: runltp script is deprecated, try kirk
>     https://github.com/linux-test-project/kirk
> 
> This commit updates this test to replace this deprecated runltp
> shell script with the newer kirk Python script.
> 
> The logic of this runtime test remains the same: it runs a small number
> of 'read' system call tests, and checks there is no failures and at
> least one test succeed.
> 
> Cc: Petr Vorel <petr.vorel@gmail.com>
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/12510635102
> ---
>  .../tests/package/test_ltp_testsuite.py       | 33 +++++++++++--------
>  1 file changed, 20 insertions(+), 13 deletions(-)

Thanks, I've applied. However, it's a bit of a pity that now Python 3
is needed on the target to run LTP.

One option would as suggested by Petr to use kirk in its intended mode,
with kirk running on the host, and connected over SSH to the target to
run tests.

On the other hand, it was a lot more simple/convenient to be able to
just run a simple shell script on the target to run the test suite.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
