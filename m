Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD32C19F32
	for <buildroot@archiver.kernel.org>; Thu, 27 Feb 2025 17:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7208840526;
	Thu, 27 Feb 2025 17:26:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qdlrhoudp-N4; Thu, 27 Feb 2025 17:26:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39CE8404D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39CE8404D9;
	Thu, 27 Feb 2025 17:26:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B92E68
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 17:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F37A640526
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 17:26:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vLAVsfhuwAbN for <buildroot@buildroot.org>;
 Thu, 27 Feb 2025 17:26:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C862B404B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C862B404B0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C862B404B0
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 17:26:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E71EB42E80;
 Thu, 27 Feb 2025 17:26:31 +0000 (UTC)
Date: Thu, 27 Feb 2025 18:26:29 +0100
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20250227182629.01faf186@windsurf>
In-Reply-To: <SA1PR12MB561598FDC7DDED2E1FC57054F0CD2@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <SA1PR12MB561598FDC7DDED2E1FC57054F0CD2@SA1PR12MB5615.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekkedtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdtleemsgdtgeejmegrkeekieemheegsggtmehfgedtieemjeehsggsmeeivgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdtleemsgdtgeejmegrkeekieemheegsggtmehfgedtieemjeehsggsmeeivgejpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepnhgvrghlrdhfrhgrghgvrhesrghmugdrtghomhdprhgtphhtthhopegrrhhnohhuthesmhhinhgurdgsvgdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgur
 hhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1740677192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3JtA1/cf0EvUh3PNLeEGoErzxkt9qRLm2AYPLOuIVTc=;
 b=eDXwWRBTpYKN/wGBcwJWWK6+jMjUD1GJINgVu3jzBq3uSjQuNE+n0mpi91I3Po0HQD9g9E
 GKzv6sDYVHKOWzvd/k28TTHSKZ2NM6lm5Xqj3cf/Wg2U6oI3uvAqdjcCqy/TZXAmc8q/1q
 scj4zjSixSnuUR16KkQNdey3OATIGQCSdWD/ddx4cqFHeUGqczN/XuJnZbqjPp+KKOPYA/
 xUd9sJUokTSv1kKagWuVTZBrdX6UvKOYwCXjU7h0ZJkAUrJl+jzIA4Ub3jr6Wmi1zBujTz
 fTr+mWXl3o106XE2p+e/BbTlwhPP4NnFGd6TwT5efDGmjjV1qqU7bZ54OoQuOQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eDXwWRBT
Subject: Re: [Buildroot] toolchain-bare-metal-buildroot
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, 27 Feb 2025 12:58:34 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> I am continuing the work on the toolchain-bare-metal-buildroot, and I have
> encountered a snag where I am hoping you can come up with a brilliant idea
> to resolve.
> 
> In addition to needing multiple bare-metal toolchains, the versal gen2 products
> need the riscv32 toolchain to have "--with-arch=rv32imc" included in the
> configuration.  Just using the riscv32 tuple is not sufficient.
> 
> Since the architecture tuples come as a list, do you have any ideas for
> how we can handle architectures that have many options beyond just the
> tuple, such as ARM and RISC-V?  Any additional variables we make will
> also need to be a list.
> 
> Do you have any ideas for a clean way to handle this?  Perhaps arch
> specific configs that we can apply in the config loop should the tuple
> match the corresponding option?

I really don't have a good suggestion here unfortunately. This is
another area where a kconfig-based configuration system is showing its
limits IMO.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
