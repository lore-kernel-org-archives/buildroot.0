Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32AAC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 21:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C63C060645;
	Tue, 23 Jul 2024 21:06:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pQrTb7D4s27N; Tue, 23 Jul 2024 21:06:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3B6C607A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3B6C607A5;
	Tue, 23 Jul 2024 21:06:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 58BDD1BF2F9
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 21:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 451C74038B
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 21:06:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ra-w7sGyT_5y for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 21:06:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DDACE4035C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDACE4035C
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DDACE4035C
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 21:06:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5F0520007;
 Tue, 23 Jul 2024 21:06:21 +0000 (UTC)
Date: Tue, 23 Jul 2024 23:06:20 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240723230620.245d46ef@windsurf>
In-Reply-To: <20240723205543.674164-1-fontaine.fabrice@gmail.com>
References: <20240723205543.674164-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721768782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=42+8LlHH/B+Kw2rcdmf2AWyCrcMXIcyulqHSMcAVu1A=;
 b=JS/aVs68Qgh7RdjsFa/QhmbqoeZJHfZySy6BbGeRFnVUtxh+CoaPiMqIj0soFeXOQDumP7
 735EQazvyjH0IAPnjAbi6JxN7q+/bK6/UqKbj0OM+TXKGtWL83Z+Bg7yZRR+gP3QvMhmBt
 kyrOFJcKbS55VSjZNK5N4te7AmB9XqroHJZP8H6JaEcHcS6h2MmgHHn/yWrYLHgTwMkeIF
 1OzWz19flbaka3ZA69VBR1nMghuHOtcvuXRQGeqnGqLTIiIGOlVlxoh2W7ARd6jGtCJcdW
 fIYWzj1Nu8BK/kWajihUZiLl21c+/9tLx4bTnOccs4GPmrm+pB4I75FrEoNd2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JS/aVs68
Subject: Re: [Buildroot] [PATCH 1/1] package/xz: fix largefile option
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

On Tue, 23 Jul 2024 22:55:43 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix typo in --enable-largefile added by commit
> 25254458bde6befcbf93b746d994f94665741c42
> 
> Fixes: 25254458bde6befcbf93b746d994f94665741c42
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/xz/xz.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
