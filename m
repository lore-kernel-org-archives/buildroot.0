Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B18C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 13:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7773D417F4;
	Fri, 12 Jul 2024 13:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EvwlhxH8qViH; Fri, 12 Jul 2024 13:06:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D5AE417F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D5AE417F7;
	Fri, 12 Jul 2024 13:06:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0E5281BF861
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EECE040438
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:06:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uCnCRepdBEEF for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 13:06:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AF08640240
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF08640240
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AF08640240
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 13:06:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AEA8F20008;
 Fri, 12 Jul 2024 13:06:16 +0000 (UTC)
Date: Fri, 12 Jul 2024 15:06:15 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240712150615.198dfd70@windsurf>
In-Reply-To: <20240207170959.2672846-2-buildroot@bubu1.eu>
References: <20240207170959.2672846-1-buildroot@bubu1.eu>
 <20240207170959.2672846-2-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720789576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DCw2bIw8LzgZBoGe8ljbb9VjnnBWfFCDMyCjzEwv5AM=;
 b=AsxFra16JJli+3fgPnhUshAO57pjwKhXnw0fZ1iheuVdBgi9clqqKmha8iNzIREGTXH3q/
 DAo+ht7ExfhPNXb5kwDZF8vMyncLPPNITNsDZ2TtpAemx/dUt9T5opC1QIPpQV3Df8Qjvv
 DnvwHEYOUeV66daQftBUCbE11kYMu5ZAoAXp1gYzfFAKGAorz6R4sEAmXYl4MmQcoU45DJ
 Vk4Jz86iLwNUygmBIbCOqlx4kB3wQeMimlAgKZkGF3DM5nRX7f87+wQh3W8seqAZ13ouB/
 GrK3ZdAeThorKizf17+f5gNLEfFyVJPYxy4Un4USEwgVITU/yaW5m67TXZ4OQg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AsxFra16
Subject: Re: [Buildroot] [PATCH 2/4] support/testing: add new
 python-ruamel-yaml runtime test
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
Cc: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  7 Feb 2024 18:09:54 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  .../package/sample_python_ruamel_yaml.py      | 27 +++++++++++++++++++
>  .../tests/package/test_python_ruamel_yaml.py  | 12 +++++++++
>  2 files changed, 39 insertions(+)
>  create mode 100644 support/testing/tests/package/sample_python_ruamel_yaml.py
>  create mode 100644 support/testing/tests/package/test_python_ruamel_yaml.py

You had forgotten to add an entry in the DEVELOPERS file for those two
new files, so I did that and applied. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
