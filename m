Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C04C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 07:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADDBB408E3;
	Sun, 18 May 2025 07:06:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pqJaGdUaWbOG; Sun, 18 May 2025 07:06:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFF3A4070F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFF3A4070F;
	Sun, 18 May 2025 07:06:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 202991BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 07:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 061CD40A1E
 for <buildroot@buildroot.org>; Sun, 18 May 2025 07:06:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ur6urAejKilW for <buildroot@buildroot.org>;
 Sun, 18 May 2025 07:06:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A7A2140A1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7A2140A1A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A7A2140A1A
 for <buildroot@buildroot.org>; Sun, 18 May 2025 07:06:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7FF744326B;
 Sun, 18 May 2025 07:06:13 +0000 (UTC)
Date: Sun, 18 May 2025 09:06:12 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: yegorslists--- via buildroot <buildroot@buildroot.org>
Message-ID: <20250518090612.1437b8e9@windsurf>
In-Reply-To: <CAGm1_ktd3Qwma-0c3fkuUX5SXMpbDfVo3CbT1eSoPq0T_Nw-4Q@mail.gmail.com>
References: <20250430055956.288191-1-yegorslists@googlemail.com>
 <20250517170313.74860009@windsurf>
 <CAGm1_ktd3Qwma-0c3fkuUX5SXMpbDfVo3CbT1eSoPq0T_Nw-4Q@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudejkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfevkeduudekheetheeutdejgfelleevleejjedvteevtdelffdvhfevjeegtdejnecuffhomhgrihhnpehtvggthhhshhhiphdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohephigvghhorhhslhhishhtshesghhoohhglhgvmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughro
 hhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747551973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yEZURaFIG/ACEtubmDCMVrka0Y/YGO/FITH/5ux/yfo=;
 b=TX7QRjwBEqQj26Jm98wu1aSUfSlJXxNzoDyTs3DthFU87SnsEw5ZqS2x5oeWDpih6/RIsD
 hXXLluSy2j3abrRwmKNjX18BDLLRWV1HkpzkR5mO6YeYefPX0mo8IqsX8dYIIyD+d9/s/w
 5b9fCvDYjE8j/1flilnNeUEsH3S2x1Vv8eNp0NsiNz0rcQ9pBnzhCt7EpMk7ARpZUb6P+e
 y0zjDaShBZ8hNiG1ryOJ5cJKi9qi0Fcs+hvSW4bjjPCNx7ktALrPCJWo1eC0asy/0I6V0s
 mvesakZypWtYsHhfNkTD251crH6Vj2ACsIlmQhKHkVaKNLqRSS6r+aRPnw/zbQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TX7QRjwB
Subject: Re: [Buildroot] [PATCH v2] package/lpac: new package
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

Hello Yegor,

On Sat, 17 May 2025 23:00:29 +0200
Yegor Yefremov <yegorslists@googlemail.com> wrote:

> You need this tool to manage eSIM profiles. See these blog posts [1],
> [2] for details.
> 
> [1] https://techship.com/blog/how-to-use-an-esim-in-linux-7/
> [2] https://techship.com/blog/esim-euicc-and-sgp-standards-enabling-iot-connectivity-2/

Thanks for the references, very useful!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
