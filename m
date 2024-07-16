Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E67DC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 22:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A10540C20;
	Tue, 16 Jul 2024 22:16:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WktEUG_wfHy9; Tue, 16 Jul 2024 22:16:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 003CE40C88
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 003CE40C88;
	Tue, 16 Jul 2024 22:16:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D5CF1BF372
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 22:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 573BF80E43
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 22:16:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RGnSHl5MZp9h for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 22:16:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3AC7C80DB5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AC7C80DB5
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3AC7C80DB5
 for <buildroot@busybox.net>; Tue, 16 Jul 2024 22:16:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F3941BF205;
 Tue, 16 Jul 2024 22:15:58 +0000 (UTC)
Date: Wed, 17 Jul 2024 00:15:57 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <20240717001557.1dc55579@windsurf>
In-Reply-To: <20240716183440.725816-1-francois.perrad@gadz.org>
References: <20240716183440.725816-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721168158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=41grGfd06UWhy6G5xR+8X2AWhh5XD8QSP8g7dBUtsSM=;
 b=Qg+5H8GnBq/tXdieAkTmvB+EvbKXhq3tuOoVaaaIafAUsJLG2UBfIdxkmK45CJH6yWZx++
 H5OvNnKPAcRgFrep+3gCLkW4sgvNO+AM3i/Jt/CdZiUr5h+1RhcsC6cnaGMRPHtFrLzM6p
 3nAZcrxWhVT03IkdINubBSq3HxJz4x1Z72reyNVPN+0SyZBItVmQGScUWIYVZE2cIueCel
 PudRdNvjbyzzeY+7c5wOjbuWtb3wyigf8t1rOFJl9GyqIjHwxsl8Ul2HPpK70mp5j0xMlq
 ObkJDn5y49+gW0JA89/YdN2Fk60ieHcWw/ANGAxEtoVlyLW90xNrxe0jZpEOwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Qg+5H8Gn
Subject: Re: [Buildroot] [PATCH] package/pango: bump to version 1.54.0
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 16 Jul 2024 20:34:40 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/pango/pango.hash | 4 ++--
>  package/pango/pango.mk   | 4 ++--
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
