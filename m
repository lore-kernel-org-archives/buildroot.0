Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED40C83F26
	for <buildroot@archiver.kernel.org>; Wed, 30 Jul 2025 20:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46ECF614BD;
	Wed, 30 Jul 2025 20:49:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HswBo_XU3RCn; Wed, 30 Jul 2025 20:49:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A7D8614C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A7D8614C4;
	Wed, 30 Jul 2025 20:49:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 83D2C12E
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 20:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75F3C40FFE
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 20:49:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sy0NhXZHE00k for <buildroot@buildroot.org>;
 Wed, 30 Jul 2025 20:49:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::235;
 helo=relay15.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6838C400DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6838C400DA
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::235])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6838C400DA
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 20:49:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 47351442C6;
 Wed, 30 Jul 2025 20:49:41 +0000 (UTC)
Date: Wed, 30 Jul 2025 22:49:40 +0200
To: Fabien Lehoussel via buildroot <buildroot@buildroot.org>
Cc: Fabien Lehoussel <fabien.lehoussel@smile.fr>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>
Message-ID: <20250730224940.516d9707@windsurf>
In-Reply-To: <20250716100712.1244865-1-fabien.lehoussel@smile.fr>
References: <20250716100712.1244865-1-fabien.lehoussel@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -110
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelkeelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdlqddutddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegfeffteelveegleefgeeggfefkeffjeefffevieeuudeuhefhkeegueegjeevueenucffohhmrghinhepnhhishhtrdhgohhvpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepfhgrsghivghnrdhlvghho
 hhushhsvghlsehsmhhilhgvrdhfrhdprhgtphhtthhopehgihhulhhiohdrsggvnhgvthhtihessggvnhgvthhtihgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehgmhgrihhlrdgtohhm
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753908581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=otQksL68GK3DhTbCK4BA8jGhAWuQfEnd0+7OSwPZrVQ=;
 b=dPoVqgzvY1YP35PixXAJUU1nZk4+ZNMBTg2RrJpWnf6/9RKGFLdxFHlmwnXhvFJPGww5ms
 9eUiQNrCQd3OIVP48q/++IZFt4gk56U0OTABhhYW2iILdI6Fcej2B3ktyjCtyA14qL+wZr
 OHOORXeiGM3zdsY5S0CDl5dlYa7oarGVH24kwIwhDs4vNE35LzHb2QOTWkNZQJlLS/WRWb
 D1KqmZkswEHfcOLN9ObcOUZjqTj1edkXgwKKnMCEI9ioq7Fl//RH4PcQ/r+ndM5bQ2vaz/
 zPeaKeTPwdjCHYx7hjW3CiF+WiRu3af6PpRqpcwyeusRlNfaKh5jDOBVN5l1mg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dPoVqgzv
Subject: Re: [Buildroot] [PATCH 1/1] package/gcc/gcc-final.mx: fix CPE
 identification
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

Hello Fabien,

Your commit title said "gcc-final.mx" which is not correct, it's
"gcc-final.mk", but anyway we generally just give the package name, so:
"package/gcc/gcc-final: ..." was enough.

On Wed, 16 Jul 2025 12:07:11 +0200
Fabien Lehoussel via buildroot <buildroot@buildroot.org> wrote:

> Fix the CPE (Common Platform Enumeration) identification in the gcc-final package to ensure proper vulnerability tracking.

Commit messages should be wrapped to ~72-80 columns. Also, we like to
give a link to the NVD database showing that the CPE identifier being
added is indeed correct. So I've added:

https://nvd.nist.gov/products/cpe/search/results?keyword=cpe:2.3:a:gnu:gcc

and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
