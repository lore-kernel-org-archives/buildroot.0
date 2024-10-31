Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38082D767F7
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 18:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E46EB40288;
	Thu, 31 Oct 2024 18:10:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GCnqDmE7HFAE; Thu, 31 Oct 2024 18:10:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEEEA402F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEEEA402F3;
	Thu, 31 Oct 2024 18:10:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DA2BD5E4F
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC96E8186B
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:10:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D8e7VTGcI4VP for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 18:10:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AD6D381332
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD6D381332
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD6D381332
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:10:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA2EFE0002;
 Thu, 31 Oct 2024 18:10:45 +0000 (UTC)
Date: Thu, 31 Oct 2024 19:10:45 +0100
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
Message-ID: <20241031191045.4df790d1@windsurf>
In-Reply-To: <20241030133332.505377-2-wsa+renesas@sang-engineering.com>
References: <20241030133332.505377-2-wsa+renesas@sang-engineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730398246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KrqB3xkjRgVh48j/OBf4U/MSg1QZIOVw30uNBbKoZak=;
 b=UgYo5tnfgXHXVn3bLLLtuBUWue1SDimTdUgxsimq1aPUljtVXf8yLxeGK/WSEhhulGNmHV
 69WjoS0IY7gwkXEZDI3bLUv0tS3C1cPmMBx3JGRf93+xkMDdIcDcV8gnpce+BZWQqceIxQ
 s7Sp+eC6/9MNf+WYQ9yaHS47F+cIdPSunC6C+KFe0XauEwMqfFPzDr9uW37eJS7naYbCL1
 ywjpYtQEe94OJJlESmU2Nz3UxqBjQlfnFILy8QPLzTiALErzkNg5i7r6mQ/vLCmlGQ101Y
 vSZTvdljfj6Lo3P2l3DJJAZD7CwSlLwaH/+mMVkoWFhhVX4dslDt6qmbort+4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UgYo5tnf
Subject: Re: [Buildroot] [PATCH] package/i2c-tools: bump to version 4.4
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

On Wed, 30 Oct 2024 15:33:32 +0200
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> Drop upstream patch.
> 
> Update README hash for text changes that are not related to license.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

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
