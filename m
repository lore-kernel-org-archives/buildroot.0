Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10444C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 12:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D98B182382;
	Tue,  6 Feb 2024 12:57:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P-N4X2tITE0o; Tue,  6 Feb 2024 12:57:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40ED982390
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40ED982390;
	Tue,  6 Feb 2024 12:57:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 158CA1BF33B
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B2368228C
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:57:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nRLydGECIUym for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 12:57:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BF389822A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF389822A2
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF389822A2
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 12:57:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 93BC9C0007;
 Tue,  6 Feb 2024 12:57:35 +0000 (UTC)
Date: Tue, 6 Feb 2024 13:57:35 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206135735.60c628e8@windsurf>
In-Reply-To: <20240110042454.1040891-1-james.hilliard1@gmail.com>
References: <20240110042454.1040891-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707224255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dSiQjHDFwLNLAGVNyLe34b8V2p38N7dsKGbKpHUGuqc=;
 b=VYIXXt8kCSkf9g9GEEoTl2i0EBO1zv2HW6skfHnE1uz+zu8xm+pveKVidsffl3oLbENPRK
 XZ3Unaljho5LaE3C+vry95C6Y9LV5RfO8761VWsc/fdQDJVlyb4dr4Swq9EdgbvgdDejc/
 kQaY1Q/xSHBjHsHVoThCLzT0S7nflTnlNM0stNE6DsHqolwaaNnpscFpU7VBlh61FCO2Ah
 L60/WpDaKuCs2Otg2EOmTgH8xs255kPfejfLjRADBZR5/ZwATxd6gx6kLiSITG5Dk0wfWc
 3tJzoDGYeKHI0DiFX5aeXnx5tYrWWY3/lv4pds2fU3qGwjH2a86PE+H6RzobyA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VYIXXt8k
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pexpect: bump to version
 4.9.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Jan 2024 21:24:54 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pexpect/python-pexpect.hash | 4 ++--
>  package/python-pexpect/python-pexpect.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
