Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FBED2E9C5
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 15:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ADDC80DDE;
	Mon, 11 Nov 2024 15:28:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kv2QdIwLUhRs; Mon, 11 Nov 2024 15:28:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B61CB80E5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B61CB80E5E;
	Mon, 11 Nov 2024 15:28:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 32F7AD8F
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 15:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21375606A5
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 15:28:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZpAGDfxRWC3y for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 15:28:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0995B6064A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0995B6064A
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0995B6064A
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 15:28:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EBBCC40003;
 Mon, 11 Nov 2024 15:28:10 +0000 (UTC)
Date: Mon, 11 Nov 2024 16:28:09 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20241111162809.03a02ac0@windsurf>
In-Reply-To: <20241108184356.2519527-1-ju.o@free.fr>
References: <20241108184356.2519527-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1731338891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nvpE9TAdGWge7pF8t36TFPcNc77L7N2pyepnA/t0POA=;
 b=XE0Y8OKzQnHJKCQb2w6hnAT8de5VwVI2cwN+0uHUKTPfRBS2XP4bEx2rkajPU+Fvj9Nqt5
 gNIf7GFsLTE3bSVKLrzIocYykwdcHA6DVvWTtyjnYuEqYUekYdT7b+OPlD+Qa6XTfkCDtT
 pWlA0h/Vhmp9zs98VgGMrBI/SAjDf+dlPN8ts5lwOiWV1vCz2yHdL4mknoujDFkxq5n8eY
 4tVKr+efgawydBCVQWfgivCddhi51ArnAC90t1Xif8mqN3teNG1DKyeSEglLzyass2BS02
 PjJslVgiDFpjf+oG5WHQ1jeFhZfY/EM8yGR3htqb5mU+44cfrrpHJDogrwVC0w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XE0Y8OKz
Subject: Re: [Buildroot] [PATCH 1/1] package/uhubctl: bump to version 2.6.0
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

On Fri,  8 Nov 2024 19:43:56 +0100
Julien Olivain <ju.o@free.fr> wrote:

> For the release note, see:
> https://github.com/mvp/uhubctl/releases/tag/v2.6.0
> 
> This commit also updates the LICENSE hash, due to a year update. See:
> https://github.com/mvp/uhubctl/commit/4deae1731c337d087e554999bd3dc74199387c1f
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/pipelines/1534030118
> ---
>  package/uhubctl/uhubctl.hash | 4 ++--
>  package/uhubctl/uhubctl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
