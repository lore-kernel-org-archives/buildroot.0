Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CAFD10BFF
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 16:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92CD780C98;
	Sat, 26 Oct 2024 16:46:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kcjFq__dhjbq; Sat, 26 Oct 2024 16:46:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9475280CB3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9475280CB3;
	Sat, 26 Oct 2024 16:46:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9723A2318
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85AF4605DA
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:46:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WtWCmyXBAMNL for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 16:46:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 76892605E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76892605E1
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76892605E1
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:46:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 91F6320002;
 Sat, 26 Oct 2024 16:46:01 +0000 (UTC)
Date: Sat, 26 Oct 2024 18:46:00 +0200
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Cc: Brandon Maier <brandon.maier@collins.com>, Kalpesh Panchal
 <kalpesh.panchal2@collins.com>
Message-ID: <20241026184600.291039c3@windsurf>
In-Reply-To: <20231031230336.51110-1-brandon.maier@collins.com>
References: <20231031230336.51110-1-brandon.maier@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729961161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1tOuz5FnAWShtGRqYAonsjzHZPxbkUkbEGiUGBpY1YY=;
 b=VOalQWLVkxxgCrwZiGt1uXPE5oXoy5zSKcoiSv5EyJLePWqFc/9M/sAXjJLMV458MPoMy7
 w7oditzNwOpZQooXp/Bxo0dYsb9B8QDizlzSovBqYIHYIoAXXxR9yJOSEnlcepJDghRwCw
 4LmahVnD/fIPvRQsuHiKz6K6E+oavoNDgOBIx8IBWbu/wOtBZ7xYKuTBY/y6b41Wz9C+Cl
 emqlm9/DZJgXZWsv738qxTYKFHojUtEpKkdNe/vCGdGF72wrskBdQyrYnS1sN/34eA+9q0
 EzUiLb7kdOMaIeKq20LfkoJ//sPqKVAvI5skHTGhBbTPzuk7/NCGj6JAh35Qqg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VOalQWLV
Subject: Re: [Buildroot] [PATCH 1/1] aufs-util: fix build error for missing
 linux header
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

On Tue, 31 Oct 2023 23:03:36 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> From: Kalpesh Panchal <kalpesh.panchal2@collins.com>
> 
> added missing linux header path to fix below build error:
> 
> - $(LINUX_DIR)/include/uapi/linux/stddef.h:5:10:fatal error: linux/compiler_types.h: No such file or directory
> 
> Signed-off-by: Kalpesh Panchal <kalpesh.panchal2@collins.com>
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>

Could you document a bit more your commit log?

Which defconfig exhibits the issue?

Since when this problem started occurring?

We have no autobuilder issues for this, and you don't explain why this
used to work, but doesn't work anymore.

Could you do a bit more research, and provide a more
exhaustive/documented explanation?

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
