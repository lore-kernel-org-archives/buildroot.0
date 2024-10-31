Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FFCD6B6A7
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 12:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34CDF81498;
	Thu, 31 Oct 2024 12:45:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P9D044jGDhEq; Thu, 31 Oct 2024 12:45:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 352B881494
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 352B881494;
	Thu, 31 Oct 2024 12:45:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F6F6494E
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E71D8148F
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:45:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aeebKJAHDbqe for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 12:45:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CFBE781494
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFBE781494
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFBE781494
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:45:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C7920FF806;
 Thu, 31 Oct 2024 12:45:49 +0000 (UTC)
Date: Thu, 31 Oct 2024 13:45:48 +0100
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>, Martin Bark <martin@barkynet.com>,
 Daniel Price <daniel.price@gmail.com>
Message-ID: <20241031134548.340c69ac@windsurf>
In-Reply-To: <20241030161313.2987580-1-buildroot@bubu1.eu>
References: <20241030161313.2987580-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730378750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=86a/TuzAnmEOpOerJ8TbXKzBOGpLIIYcApTN8hiBMqg=;
 b=a/iKtXIL99WlyiyYdit6zt1gEqbMz2PMOZeQ3W3DNFnOxYDLSGwy0TOXsEHvbliFdg/+aL
 2gy0Msyz7YY/lOoYRrCUE5U1/nv5xE5oJ/j0qvwoTC/jR/xw49zJs4m0kI3VrFbRm7Sq6U
 Zp4nbk9Z1rnhgM/9c5tp4x01gvLQ1DMpL61A/yoRAJYruWgt3AzhksQbvdopYqtDlniY9z
 0xHKxlmtmRHakLtwTTV5oN8y6GgvqtQbPpP66bU5Qz4lRlx66Fx7GiXA/ws/+ILMulIkzY
 ibQ0W2zD8IRvh8fhNDl69EeUVfjiAC8lSgW7UO8Jt2U+jlhQHqkyyXOv9Tno6g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=a/iKtXIL
Subject: Re: [Buildroot] [PATCH] package/nodejs: bump to version 22.11.0
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

On Wed, 30 Oct 2024 17:13:12 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> This marks the transitioning of the 22.x releases
> of nodejs into LTS. [1]
> 
> LICENSE hash changed due to
> * various new bundled components[2,3,4]
> * removed bundled components [5,6]
> 
> All new components fall under MIT or Apache license which are already
> mentioned in the license field.
> 
> All node package tests have been run sucessfully after the update.
> 
> [1] https://nodejs.org/en/blog/release/v22.11.0
> [2] https://github.com/nodejs/node/commit/77936c3d2482ded2cb868f20f177433081b6dca8
> [3] https://github.com/nodejs/node/commit/92439fc160c19281faacfdf084ba718b79dd537f
> [4] https://github.com/nodejs/node/commit/da6c61def82190fd07cbdd9bb946644273eddf96
> [5] https://github.com/nodejs/node/commit/8e4fd2842bd6d2640dd0477323fe911c991265d7
> [6] https://github.com/nodejs/node/commit/20a8c96c412bb2c2dd74a5739cfb61919f1ec787
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/nodejs/nodejs.hash | 12 ++++++------
>  package/nodejs/nodejs.mk   |  2 +-
>  2 files changed, 7 insertions(+), 7 deletions(-)

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
