Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604CFD0E3F7
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 19:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2641260B70;
	Thu, 24 Oct 2024 19:32:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aQIJaS0qsJLc; Thu, 24 Oct 2024 19:32:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF0FE60BA2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF0FE60BA2;
	Thu, 24 Oct 2024 19:32:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 04EE259B4
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 19:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9E5C4055E
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 19:32:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rb9sHNkgK8iG for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 19:32:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AB897400B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB897400B5
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB897400B5
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 19:32:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C50D5E0004;
 Thu, 24 Oct 2024 19:32:44 +0000 (UTC)
Date: Thu, 24 Oct 2024 21:32:43 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <20241024213243.36ef7292@windsurf>
In-Reply-To: <Zxo7X1XBQ/c7ow3w@waldemar-brodkorb.de>
References: <Zxo7X1XBQ/c7ow3w@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729798365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x/81uW4Nw4GMAMZ7t6vMebUZoruCTYDKrVxuxndvX/E=;
 b=NjQMGHFfhZR47cMz4eCLLSxa7kwD5cN+ECYMPO1CaIcAdrX/7tGCSmEoYqKGsfMUGKKarc
 ZYPZjAqSuBE/rVEhAR7somNmB4/4+HmfT6cIKTUvOjDk3GrmDoFPDvjqX0TDF0pe8puWE2
 ZtoHUA1E7YYWefCmII/inrt8z2lqFmUk9w+rWX25/5Gc0oD4S5XHC1deT926CO6YxgX2r/
 1NKXpWRLHliDHR1YQYeglMykJ6pRSaL3PBvYNkDy7QHckvgQoY0O4MIXV+mDo0B3u6KPn6
 5e097BYPl6ILiIkHQWRcdrAAf/pg2LnFkCnrXSQfLn5uTotkKyo4CnFQFeoDwQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NjQMGHFf
Subject: Re: [Buildroot] [PATCH] package/bind: update to 9.18.31
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

On Thu, 24 Oct 2024 14:19:43 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> See here for a changelog:
> https://downloads.isc.org/isc/bind9/9.18.31/doc/arm/html/notes.html#notes-for-bind-9-18-31
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/bind/bind.hash | 4 ++--
>  package/bind/bind.mk   | 2 +-
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
