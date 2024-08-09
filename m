Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A084C52D7C
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 22:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FE7F80B7E;
	Fri,  9 Aug 2024 22:04:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l2yvPziXODgf; Fri,  9 Aug 2024 22:04:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09B1080C16
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09B1080C16;
	Fri,  9 Aug 2024 22:04:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CBD291BF286
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 22:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B95B74116E
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 22:04:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yEJmc__Tr9Kw for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 22:04:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F1A634038B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1A634038B
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F1A634038B
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 22:04:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 71A2DFF803;
 Fri,  9 Aug 2024 22:03:57 +0000 (UTC)
Date: Sat, 10 Aug 2024 00:03:56 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240810000356.7eaaa3f5@windsurf>
In-Reply-To: <ZrYHmDKI5LAwlA5a@waldemar-brodkorb.de>
References: <ZrYHmDKI5LAwlA5a@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723241037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tbAvTUqfrBi+iiSPMBDDAC6wPKCw6p0MP10cQo1sP7Q=;
 b=jWy+RZVgZicwxVZN6mJ313m/QQ0136OxFJs0K9nXnRsZ7KL+BJxFrW7JdG30hintobDLU/
 TY2FqQOnHSJBMRtB57ZlTrqJF+MsOMvPwKbUU4+YMwWeE89nIfR28nyRoIQKH+DfpCQdEu
 ISetw2CFQeZ0QlJ1HZBBsV88w0U8BiC2DKBmk2ZwPEZDAtJWqXdOHVFUBeb0enj/iw1yNg
 esfR05Shf+2w/XYJVMmBHrQ4FU6bY0faQKXUt7w+9I+7aLEChA6zGOe7K2TmHn5Yjr+gX6
 YMnLXK2Z7uHSHIY5eoJ+Rxl4tXKDdZjeMjRmO8tDjPHDcMfYGKVjT6zjDk7kVw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jWy+RZVg
Subject: Re: [Buildroot] [PATCH] package/ffmpeg: fix gcc 14.x compile issue
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 9 Aug 2024 14:12:08 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Fixes:
>  - http://autobuild.buildroot.net/results/a04/a040cbc991da14c68302062ce96121b1e55c690e
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...ay-dvd-Use-correct-pointer-types-on-.patch | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 package/ffmpeg/0006-avcodec-pcm-bluray-dvd-Use-correct-pointer-types-on-.patch

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
