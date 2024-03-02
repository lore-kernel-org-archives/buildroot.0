Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3798C54798
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 17:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 924CD403C4;
	Sat,  2 Mar 2024 17:07:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OUfwjmgZfdQK; Sat,  2 Mar 2024 17:07:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7292240629
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7292240629;
	Sat,  2 Mar 2024 17:07:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BC9E31BF34C
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 17:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA9A860A98
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 17:07:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LVbZLZCGwKyK for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 17:07:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 20C95608C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20C95608C5
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 20C95608C5
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 17:07:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7C1AE0003;
 Sat,  2 Mar 2024 17:07:16 +0000 (UTC)
Date: Sat, 2 Mar 2024 18:07:15 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20240302180715.39edcb20@windsurf>
In-Reply-To: <20240226205446.842600-3-adam.duskett@amarulasolutions.com>
References: <20240226205446.842600-1-adam.duskett@amarulasolutions.com>
 <20240226205446.842600-3-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1709399236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=utQ4ezPqzxnHgxNl2sgCbTu0Hwe9LU06gTpExX1W7GI=;
 b=Lh8cJBGD926V6zvJpFvf6f7vRnMpQOnQcwb0+YlVEkivxhtfQYQCGMlDKZ1aCKC0v3dQoT
 +X23JYvO694Ko8nxWbJumgBy9IiOJ2Bc6nN4jmzISl6fJWYBKIIF3fea6d5gfA2e0KRRqu
 L3iuOiBU9PCEJ10ECzxQhIhG4+g2aDRur8is60x//aS/VGsL6ypuu8Rq9oyBeB3NTzW6yX
 lcuC78EBEkD0Sh72j/GXVKFPa3PnIpHJwG1z4UORHNwwWVOVKS6gDMJpOZch5X6m0ARBto
 2nFUYJgMl7rBB9Y86EZ/gB5M3HI38q4hx2xFFP7WAtoKv5uFF+fVogvJwbvPww==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Lh8cJBGD
Subject: Re: [Buildroot] [PATCH 3/9] package/libselinux: bump version to 3.6
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adam,

On Mon, 26 Feb 2024 13:54:39 -0700
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> Remove upstreamed patches
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Thanks for this update.

However, could you clarify where patch 0002 has been upstreamed? I've
looked at the upstream code as of version 3.6, and it's still using
PYCEXT.

Also patch 0001 has not "really" been upstreamed, the issue has been
fixed in a different way, so I added to the commit log:

"""
Patch 0001-fix-musl-build.patch is no longer needed as the issue has
been fixed by upstream commit
d88597798fdb1a2b344ca47e48f2f80ad433fd95, which resolves the same
issue, in a different way.
"""

But unfortunately, I need additional details about why patch 0002 is no
longer needed.

Also, you missed updating .checkpackageignore, so this patch causes two
new "make check-package" warnings.

Thanks in advance for your feedback!

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
