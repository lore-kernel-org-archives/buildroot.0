Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B95D10C06
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 20:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A393D60619;
	Sat, 26 Oct 2024 20:58:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IW0M4Xsvh9_W; Sat, 26 Oct 2024 20:58:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4F3A605DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4F3A605DB;
	Sat, 26 Oct 2024 20:58:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A02445C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80D9F40166
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:58:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rLRmmmtOCwTk for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 20:58:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 284F740003
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 284F740003
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 284F740003
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:58:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 443BAE0002;
 Sat, 26 Oct 2024 20:58:18 +0000 (UTC)
Date: Sat, 26 Oct 2024 22:58:17 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Philippe Proulx <eeppeliteloop@gmail.com>, Asaf
 Kahlon <asafka7@gmail.com>
Message-ID: <20241026225817.10970d54@windsurf>
In-Reply-To: <20241026203620.3617544-1-james.hilliard1@gmail.com>
References: <20241026203620.3617544-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729976298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8GqgJ2RYpwIyNc5b5njlprPyAc9CuD4HswutUtbhuyM=;
 b=GmpmpFM5Gx/w9GPP+R2O7aHHMY4fNCJyAY7mtk6snoqUWJ1XJK2L2Q2rpHk3Z+RvmfY5Y0
 /iXCCrnSHqi8sMUSyFoLJ5X3SgTzt8FO5+fRPN2nLpN9dbui2C7NHTkXDCqaLMqW7nozGM
 pyi1QEZLEv8xRnqhhMoP5qK+FVUCxEDqHoXpsxw/cQ+4f+DxMRV4YIUcsaGPODKvaJWXCf
 piRbkq+wAkJyKs+kk4KzuQiWaMwI1YVU4SRLEMeQuyAp3Sq2oxQf35P6qC4fNJ004O3xK/
 86ozwqGREDUy3DbEs8LvKZnq6wurRYvykKOYz24tO+AtOk7WRtzCXGtoafjhbg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GmpmpFM5
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ipython: bump to version
 8.29.0
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

On Sat, 26 Oct 2024 14:36:20 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-ipython/python-ipython.hash | 4 ++--
>  package/python-ipython/python-ipython.mk   | 4 ++--
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
