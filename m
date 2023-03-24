Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EE6C6FD1C
	for <buildroot@archiver.kernel.org>; Fri, 24 Mar 2023 10:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF3AE812F5;
	Fri, 24 Mar 2023 10:15:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF3AE812F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U8w9VOgIoc8s; Fri, 24 Mar 2023 10:15:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50C968142C;
	Fri, 24 Mar 2023 10:15:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50C968142C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F1FEE1BF314
 for <buildroot@lists.busybox.net>; Fri, 24 Mar 2023 10:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA0FD41F2D
 for <buildroot@lists.busybox.net>; Fri, 24 Mar 2023 10:15:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA0FD41F2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 27yzVqcsVUCm for <buildroot@lists.busybox.net>;
 Fri, 24 Mar 2023 10:15:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54A6741F2C
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54A6741F2C
 for <buildroot@buildroot.org>; Fri, 24 Mar 2023 10:15:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1520D60012;
 Fri, 24 Mar 2023 10:15:28 +0000 (UTC)
Date: Fri, 24 Mar 2023 11:15:28 +0100
To: unixmania@gmail.com
Message-ID: <20230324111528.6fed9de7@windsurf>
In-Reply-To: <20230322231511.551442-1-unixmania@gmail.com>
References: <20230322231511.551442-1-unixmania@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679652929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DW1lYFI4Wk+LIVnip6YsByATFqTaS8D45XQ0vh/Gvc8=;
 b=WjGnY8OUsrymHDgaNICjOxaBo2LdcnHfB4pZp+e6QbvbUgjS3hN335/TL3Cuw8Dapu8iXb
 vZqK9VMYiGSWEnJH3vgC8KwooEAgh6h6Md0+z28JcX8Po1AwpobNAC8kL5sroPC+NQ4ILh
 y7S5U5BXB9ms/Ee7t/JcxRemm8GxYu42/yTrkcDbqqkQ61oNxzVyv5xYhk9rUsBFVYKQ9V
 V4hXFmJhakYFN974Oe4Cu0Sb4TwhSIzA6kxkI8vHo1R5NTmP9FmofboCMYVdAngc/H/Dbw
 niYMTOEebBVYWf18KJtLe3vcYcGcBZCp4iPObI7slP7Uq6E8IxgBYRaY6HdLAQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WjGnY8OU
Subject: Re: [Buildroot] [PATCH] package/qemu: allow building only the guest
 agent
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 22 Mar 2023 20:15:11 -0300
unixmania@gmail.com wrote:

> -	select BR2_PACKAGE_QEMU_TOOLS if !BR2_PACKAGE_QEMU_SYSTEM && !BR2_PACKAGE_QEMU_LINUX_USER

Is the build working OK if neither the tools, nor qemu-system, nor
qemu-user nor qemu-qa are enabled?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
