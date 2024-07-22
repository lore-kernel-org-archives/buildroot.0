Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8323BC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A9F440258;
	Mon, 22 Jul 2024 12:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xxzMVOzv8tL3; Mon, 22 Jul 2024 12:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA87040265
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA87040265;
	Mon, 22 Jul 2024 12:01:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 439B11BF28C
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CF4580E28
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:01:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DAg7zsiDIADF for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:01:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 95A1980B59
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95A1980B59
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95A1980B59
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:01:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DC498C0007;
 Mon, 22 Jul 2024 12:01:03 +0000 (UTC)
Date: Mon, 22 Jul 2024 14:01:02 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240722140102.79c1dad0@windsurf>
In-Reply-To: <Zp4yfLLt/l+SNXV/@waldemar-brodkorb.de>
References: <Zp4yfLLt/l+SNXV/@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721649664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NcOTDgUPYtnUmcDcFxRo1QDQjkDiRcDp78gKw1qEEnI=;
 b=XWo1Yo9J/YKJzoO9yMKZCszVGSqk5UN6LuQB7eJsADwjMCEALBIOLYfyehw9XLQe7hk75W
 WY2qnrk/FG2MwSPe0mBL1PRbOaRx45CUlvE37nSOLGmE93HeCKFRvpV6WZxDViIrvj+AwA
 lUPBq9rN9DMYES7Zc8pppi/5ZnbZEL4tL5V2OKxmLeoI6FREmCaO/cSR3X+T+cyM7KFtjH
 hNBw7A0QIu/G1MYd4ooL0+iDjzmtd7nY697Czizw11YakdAnSjTgdeG+XQxAJEYAchpNIt
 JsZ01PMCPpW8KlDzINUgdKaQSqmvNMBXmnOFIttHRrSBetLCZnQcbjUIWmyV8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XWo1Yo9J
Subject: Re: [Buildroot] [PATCH] package/ruby: update to 3.3.4
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 22 Jul 2024 12:20:44 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/ruby/ruby.hash | 4 ++--
>  package/ruby/ruby.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
