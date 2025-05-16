Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E2FC3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 09:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BD44612A9;
	Fri, 16 May 2025 09:32:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cTxi3wRXsRiV; Fri, 16 May 2025 09:32:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E3ED6129D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E3ED6129D;
	Fri, 16 May 2025 09:32:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 372CF1AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 09:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C9314086A
 for <buildroot@buildroot.org>; Fri, 16 May 2025 09:32:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K655l0JGeOcE for <buildroot@buildroot.org>;
 Fri, 16 May 2025 09:32:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 233B0407A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 233B0407A4
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 233B0407A4
 for <buildroot@buildroot.org>; Fri, 16 May 2025 09:32:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E273B4315F;
 Fri, 16 May 2025 09:32:43 +0000 (UTC)
Date: Fri, 16 May 2025 11:32:43 +0200
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org
Message-ID: <20250516113243.10a00601@windsurf>
In-Reply-To: <20250429101607.864604-3-adam.duskett@amarulasolutions.com>
References: <20250429101607.864604-1-adam.duskett@amarulasolutions.com>
 <20250429101607.864604-3-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvgedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjedvjedvgfffveetieffudegieevleeigfffteefhefhtefhueelfeekjefgfedvnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprggurghmrdguuhhskhgvthhtsegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsu
 hhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747387964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7/EG1VOSCkJ2Ilk73qzVwaAX0VSA76FbGzIrgaqiU9w=;
 b=Jr4w2Zm+G8n0wGo+BqHMeUotOD2HdEwZ3Oifaww6L7g789mvbFIH8lYnrmb+MjNZGb+U0e
 YwwCWW7yOyEXXpYRS9+4jZauHE9728ygh0eHMriqVYBSciV1VcQaJ3Hlzfh1ro0ZMVsFFn
 4+Go9yQ8NVAQukSKFrd3+J6iNBp6yzojC1LO11XWBnKBK7GGbJUUr1l6ZG7W4Z+txakqJe
 cAyuDis6FDDtI/DF5BjUVaDn619S7kGh0ND4C6KbdjUlAFLKiUQ+bn4CgE1NBbFGpw32KA
 4pvWEFRMVv7ae1hL8XlkSg/UYFzBlvjXgJyi+1osaCXg52l43bWOaBAXEcgbVg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Jr4w2Zm+
Subject: Re: [Buildroot] [PATCH v2 3/3] package/mender-update-modules:
 enable docker, rpm, and script modules
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

Hello Adam,

On Tue, 29 Apr 2025 12:16:07 +0200
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
> index b789a0a00c..4ea0bce6c3 100644
> --- a/package/mender-update-modules/Config.in
> +++ b/package/mender-update-modules/Config.in
> @@ -78,6 +78,23 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_DIRTY
>  
>  	  https://github.com/mendersoftware/mender-update-modules/tree/master/dirty
>  
> +config BR2_PACKAGE_MENDER_UPDATE_MODULES_DOCKER
> +	bool "docker"
> +	depends on BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_DOCKER

Docker needing Xorg7, doesn't that seem odd?

Are you sure you tested this? BR2_PACKAGE_DOCKER is "a system tray dock
for X", nothing to do with docker engine, which is
BR2_PACKAGE_DOCKER_ENGINE. So I'm not sure how this can have worked.
Maybe you also had docker-engine in your system by chance? But surely
the Xorg7 dependency there should have triggered some questions on your
side on why the heck does Docker needs Xorg7?

The rest looks good to me!

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
