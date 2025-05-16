Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC84CC3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 09:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3692961299;
	Fri, 16 May 2025 09:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KAui3RGnBvDk; Fri, 16 May 2025 09:19:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4440860B6E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4440860B6E;
	Fri, 16 May 2025 09:19:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CFDD61AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 09:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C140560B51
 for <buildroot@buildroot.org>; Fri, 16 May 2025 09:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r3h-xd9zQhao for <buildroot@buildroot.org>;
 Fri, 16 May 2025 09:19:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9022860B4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9022860B4F
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9022860B4F
 for <buildroot@buildroot.org>; Fri, 16 May 2025 09:19:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8BA264329A;
 Fri, 16 May 2025 09:19:41 +0000 (UTC)
Date: Fri, 16 May 2025 11:19:40 +0200
To: Cherniaev Andrei <dungeonlords789@naver.com>
Cc: buildroot@buildroot.org
Message-ID: <20250516111940.55844cfd@windsurf>
In-Reply-To: <20250515144241.3082079-1-dungeonlords789@naver.com>
References: <20250515144241.3082079-1-dungeonlords789@naver.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvfeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepughunhhgvghonhhlohhrughsjeekleesnhgrvhgvrhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747387181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2OotBGxS3lp8X6astqwSuQrYUWnCXJf9D5L+lJIGhTM=;
 b=Y8BNf/phMv83k61CInRZ9yZHujF+hndoXOEgm+X3kKTu0fv3bnfm3+rI0TblTN+YcKRobi
 LC/WH/4mfV4AR8c2mwPkYMIb2j0wm4KrTirQ6gwYJ/kcQXvOvO1JmmWywEwUU4IB4F3QQ2
 eXxg7JPcXef06vGDz+mtDWiQUm3EGCYSoelcDPOJdSy6FSehrilSg/SjhriIfk0WxQ+qqI
 TmHojyhHNyBWKgB7DFeO7ZZdnCUycvN49ij1+T1CL43x2S6XQQTiKS8EeE7c91vDacRFZG
 Rw+T+9jGqy8Wa4AQRERGalLwU3wk4NXcGTMuFoeKj6GljSUqg5kt8E5/3Ivr1Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y8BNf/ph
Subject: Re: [Buildroot] [PATCH] boot/grub2/readme.txt: fix script
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

Hello,

On Thu, 15 May 2025 23:42:40 +0900
Cherniaev Andrei <dungeonlords789@naver.com> wrote:

> Fix regression of commit 552ba600eef0884bb7bf7f09a67cd66747d1efa8 Without `--show` loop_dev variable will be empty so script never works... Sorry, it was my mistake...

Thanks for your patch!

However, it lacks your Signed-off-by line, so we cannot merge it. Also,
could you wrap your commit message, and avoid "personal comments" like
"Sorry it was my mistake" ? Could you send a v2 with those issues fixed?

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
