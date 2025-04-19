Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B40C369C9
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 13:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AC4F406ED;
	Sat, 19 Apr 2025 13:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ibztZx_Uh_hD; Sat, 19 Apr 2025 13:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42C0640675
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42C0640675;
	Sat, 19 Apr 2025 13:29:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B28F22F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 13:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44DFC405C4
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 13:29:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CX4JWjOeOXg2 for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 13:29:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4E667400EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E667400EC
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E667400EC
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 13:29:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC76041BC0;
 Sat, 19 Apr 2025 13:29:42 +0000 (UTC)
Date: Sat, 19 Apr 2025 15:29:41 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20250419152941.1e8aa7ec@windsurf>
In-Reply-To: <93d4543023f52ff3bb54b6b9198bb9c2@free.fr>
References: <20250418214143.2790625-1-thomas.petazzoni@bootlin.com>
 <93d4543023f52ff3bb54b6b9198bb9c2@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeehudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffekiefhieeihfefffelieeutefhudelvefhueehteeggfdvueffgfeggedtkeeknecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegsv
 ghrnhgusehkuhhhlhhsrdhnvght
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745069383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PJzJ9vSiLvdHT2uFoZY0xPuL3WU0hKcyX38vPe2whaU=;
 b=jsUSSyk5vY6cfdphzTOjE4raeNtLmni/BZ2vYfuNm8iwS8KPi32M84+VqnL6beJjqObTRq
 mxroeCCRULq+jZwdoA+VNNs+u04QwowzuZUHS+MokopJbBMBoCsggED9fcCFIuXHyd7TLS
 HwwpYplwePvqO6vJexzXnnxOHBiELgbRl46ABvClsZehXulj+MYTiFU017Uovpj0U5T6US
 CiGoXhS2PM4qYSeU1NESHJMFtN4jvsjkSlAT0zzMPxofJ55O0RN3MdrWWZ2tmCliRKLCBu
 zJHsmWI6xIgQ+BVGzJV4Xguud8PlzhXB7ha4/0/N8yR1JdER9dU62EiwsUYgog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jsUSSyk5
Subject: Re: [Buildroot] [PATCH] package/libcap: add patch to fix build on
 ARC, OpenRISC, Microblaze
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

On Sat, 19 Apr 2025 13:19:29 +0200
Julien Olivain <ju.o@free.fr> wrote:

> I also tested with "test-pkg -a" and it seems the xtensa architecture
> has the same problem. See:
> https://gitlab.com/jolivain/buildroot/-/pipelines/1776425781
> https://gitlab.com/jolivain/buildroot/-/jobs/9770003981
> 
> I believe a followup patch will be needed. Could you have
> a look please?

Thanks for the report! I have reported this upstream, and will wait for
their feedback (they were very responsive on the
ARC/OpenRISC/Microblaze report).

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
