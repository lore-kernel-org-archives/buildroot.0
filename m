Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36ACFD3ABF5
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 20:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 023A960702;
	Mon, 11 Nov 2024 20:28:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ygydOP-tKgDy; Mon, 11 Nov 2024 20:28:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2449160706
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2449160706;
	Mon, 11 Nov 2024 20:28:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A84866C
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9710F80E23
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v1hrT3mMTQJO for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 20:28:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 711FA80E34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 711FA80E34
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 711FA80E34
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:28:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 603E21C0002;
 Mon, 11 Nov 2024 20:27:57 +0000 (UTC)
Date: Mon, 11 Nov 2024 21:27:56 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20241111212756.38c876df@windsurf>
In-Reply-To: <20241110214146.741778-1-ju.o@free.fr>
References: <20241110214146.741778-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1731356877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZwEdHwxvbin5eOPVrMstkB+LAzg3fricaqQzmJLICHc=;
 b=gDG9DTKM/2u8FVCvN9aE6WO+SyhxyDSNg3gYqIauG0FMdgF7aRjPw6XREsjiuXHGuRMr4w
 BlEl18ortQ1WXxoiAjtFo6jCNdt3wf87Wrxklr6XlLus5YSNEvSuntK62kqrZ8owihrL6j
 wipIHQOfWRKexqnkfi+jBeYB9DqaRV7aWZ4MDm2/lw4f8uggAcEUxbjaQXASbvNEQJyMFS
 tSp/+RSj0gq2ZGPKIj+wrT+lwqkfLW2/lrattMivPI8FRyNfQSxydM2IdPV8PD7aRonU/j
 If6bql0JzjRC04rtd9Bu0oBW8HPOYHM1VgKamFyWE9xLkMP5BAqPPR8FjSvC1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gDG9DTKM
Subject: Re: [Buildroot] [PATCH 1/1] package/blake3: bump version to 1.5.4
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

On Sun, 10 Nov 2024 22:41:46 +0100
Julien Olivain <ju.o@free.fr> wrote:

> For change log since 1.5.1, see: [1] [2] [3].
> 
> Also, v1.5.2 added the new license "Apache-2.0 with (LLVM)
> exceptions". The initial LICENSE file was split in three
> different files (one file per license). See [4] [5].
> This commit updates _LICENSE, _LICENSE_FILES and the hash
> file accordingly.
> 
> [1] https://github.com/BLAKE3-team/BLAKE3/releases/tag/1.5.2
> [2] https://github.com/BLAKE3-team/BLAKE3/releases/tag/1.5.3
> [3] https://github.com/BLAKE3-team/BLAKE3/releases/tag/1.5.4
> [4] https://github.com/BLAKE3-team/BLAKE3/commit/bb8761256a6a6144f330907b74c80f0ed0ecab4a
> [5] https://github.com/BLAKE3-team/BLAKE3/commit/0b2c630cc5c59ac76a184cdc9540092a97d33e7f
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/blake3/blake3.hash | 6 ++++--
>  package/blake3/blake3.mk   | 6 +++---
>  2 files changed, 7 insertions(+), 5 deletions(-)

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
