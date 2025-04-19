Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AF8C369C9
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 21:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC7C8406CA;
	Sat, 19 Apr 2025 21:42:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zsi94yMm-y_D; Sat, 19 Apr 2025 21:42:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21DD4406CC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21DD4406CC;
	Sat, 19 Apr 2025 21:42:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D7D7230
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6342A404D4
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:42:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LiXIcMkoTciO for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 21:42:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5C030400CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C030400CE
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C030400CE
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:42:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 61D9542E7E;
 Sat, 19 Apr 2025 21:42:21 +0000 (UTC)
Date: Sat, 19 Apr 2025 23:42:20 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20250419234220.7ab87d0a@windsurf>
In-Reply-To: <20250403192157.145639-1-ju.o@free.fr>
References: <20250403192157.145639-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeeiudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejkeffueegfeejleefkeefgfegudehveejffeggfdvuefgheejjeduueehtdelieenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhgihhtlhgrsgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745098941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hne366t86skDeH1gk1BcGAYqsFuF1eiOkJLeVw18GpE=;
 b=PDvcgeBuWaNkqTbpp61t/0ikYQntQInr//AjZ50vTCAjHGp7qWDK+zL+kzNk4LbF/AAqPc
 XRL6Q3iWnwHxZfC94GDJcrD1YnvRIVB6W6ow9HT/AHwiOdI2nVpcBGclWJM+Mv3+Olr2eb
 ttmGH3yA8cTmP8dTpZmrCXoD3A6yrlU+AlzQg+qvOQrCeqBeWD8+W3Dqp/YgkMQ+Cdnlta
 zHOnFHQMd9E/7b9UsjJBreY9IY0orQR1CUyahX/YPxrVsR/QqcTiUgT04E8ekD4RKveEV7
 5SSEqjgAP4t3yYGgLv1PcuJ1N16DRn5vlU4lrDCrIdI4Mk+BiFSzsLOPOEvq4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PDvcgeBu
Subject: Re: [Buildroot] [PATCH 1/1] package/tmux: bump to version 3.5a
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

On Thu,  3 Apr 2025 21:21:57 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log, see [1].
> 
> This commit adds the dependency to host-bison, which is needed since
> upstream commit [2], included since version 3.4. The optional dependency
> to jemalloc is also added, introduced since upstream commit [3],
> included since version 3.5.
> 
> [1] https://github.com/tmux/tmux/blob/3.5a/CHANGES
> [2] https://github.com/tmux/tmux/commit/00812c9053a0b1067f833925b726086a67d8528d
> [3] https://github.com/tmux/tmux/commit/3c2621b41b9e1466d2b06718a0a8514f5d10ded9
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/9619369240
> ---
>  package/tmux/tmux.hash |  2 +-
>  package/tmux/tmux.mk   | 11 +++++++++--
>  2 files changed, 10 insertions(+), 3 deletions(-)

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
