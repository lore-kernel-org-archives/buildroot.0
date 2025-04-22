Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38727C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 21:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBCDC40568;
	Tue, 22 Apr 2025 21:17:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VCCcJ6Yj-VtG; Tue, 22 Apr 2025 21:17:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 284B14053F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 284B14053F;
	Tue, 22 Apr 2025 21:17:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 525B11BC
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44057411A1
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:17:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vfz-tuL1EM7e for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 21:17:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 41160411A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41160411A7
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 41160411A7
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:17:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BA4DE43B7E;
 Tue, 22 Apr 2025 21:17:04 +0000 (UTC)
Date: Tue, 22 Apr 2025 23:17:03 +0200
To: Vladimir Oltean <olteanv@gmail.com>
Cc: buildroot@buildroot.org, Ioana Ciornei <ciorneiioana@gmail.com>, Brandon
 Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>, Julien
 Olivain <ju.o@free.fr>, Romain Naour <romain.naour@smile.fr>, Akhilesh Nema
 <nemaakhilesh@gmail.com>
Message-ID: <20250422231703.3704461b@windsurf>
In-Reply-To: <20250328180427.3434693-15-olteanv@gmail.com>
References: <20250328180427.3434693-1-olteanv@gmail.com>
 <20250328180427.3434693-15-olteanv@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopeholhhtvggrnhhvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegtihhorhhnvghii
 hhorghnrgesghhmrghilhdrtghomhdprhgtphhtthhopeeurhgrnhguohhnrdforghivghrsegtohhllhhinhhsrdgtohhmpdhrtghpthhtohepvhhjrghrughinhesfhhrvggvrdhfrhdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesshhmihhlvgdrfhhrpdhrtghpthhtohepnhgvmhgrrghkhhhilhgvshhhsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745356625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xN2ptsUqKJQxquGNsxxRFn6cHqNsP/H0VuG6ztr28gQ=;
 b=dAwWqB7x2BMAw+QhwCc1q7z3wBg7W65t2EynQS2O0vkGd9lWGvVLhW29rtmSer6mIEzHZb
 q6BhzzdwLsAmnJcBN3pKvcY8rPl87jmI53CBNlkShaCUtTpE2M1CuY9K2JMgRa9Rx/GsG/
 Km//zoiBz6g8vbu7pCkNZiB53mPojnXgbkek1XkfoWGE0FB5CjNG/WmRpeftEuJm5+N3O3
 fmxzjDjJhoKl9mqFplp/b5TeFbMMsNQPY3pfDC0hlxsyN7hKZtqBAVDQZVJAb9Zmz9YRLJ
 HB4DrbHo6DU2bKufYg2yNr2bOXyaOvPKdTfQD/bgRS5SKwyRZthqNtGlFKoX1g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dAwWqB7x
Subject: Re: [Buildroot] [PATCH v2 14/18] package/qoriq-mc-binary: new
 package
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

Hello Vladimir,

On Fri, 28 Mar 2025 20:04:22 +0200
Vladimir Oltean <olteanv@gmail.com> wrote:

> Add a package which deploys the NXP MC (Management Complex) firmware
> to the target. This is necessary for NXP DPAA2 SoCs (LS1088A, LS2080A,
> LS2088A, LX2160A).

[...]

Thanks for the patch, which I have applied, after doing one small
change, see below.

> +QORIQ_MC_BINARY_VERSION = 10.39.0
> +QORIQ_MC_BINARY_SITE = $(call github,nxp-qoriq,qoriq-mc-binary,mc_release_$(QORIQ_MC_BINARY_VERSION))
> +QORIQ_MC_BINARY_LICENSE = NXP Binary EULA
> +QORIQ_MC_BINARY_LICENSE_FILES = LICENSE
> +QORIQ_MC_BINARY_INSTALL_IMAGES = YES
> +ifeq ($(BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_INSTALL_PATH),)
> +QORIQ_MC_BINARY_INSTALL_TARGET = NO
> +endif

This condition would never be true, because
$(BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_INSTALL_PATH) is never empty. Even
when the Kconfig option is left empty,
$(BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_INSTALL_PATH) value is "", which
is why we have qstrip.

> +QORIQ_MC_BINARY_PLATFORM = $(call qstrip,$(BR2_QORIQ_MC_BINARY_PLATFORM))
> +QORIQ_MC_BINARY_SUBDIR = $(call qstrip,$(BR2_QORIQ_MC_BINARY_SUBDIR))
> +QORIQ_MC_BINARY_BIN = mc_$(QORIQ_MC_BINARY_PLATFORM)_$(QORIQ_MC_BINARY_VERSION).itb
> +QORIQ_MC_BINARY_INSTALL_PATH = $(call qstrip,$(BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_INSTALL_PATH))

So I moved this condition here, testing on QORIQ_MC_BINARY_INSTALL_PATH
instead, which achieves correct behavior.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
