Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D40C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 17:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC92D40352;
	Sat,  4 Nov 2023 17:41:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC92D40352
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ULyVWcGt031a; Sat,  4 Nov 2023 17:41:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAD9640167;
	Sat,  4 Nov 2023 17:41:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAD9640167
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 66B981BF21A
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4968A40167
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:41:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4968A40167
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mj80cRdIhStR for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 17:41:47 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B622B4014D
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 17:41:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B622B4014D
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8684240002;
 Sat,  4 Nov 2023 17:41:43 +0000 (UTC)
Date: Sat, 4 Nov 2023 18:41:42 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231104184142.24723c2d@windsurf>
In-Reply-To: <20231104155857.110364-1-fontaine.fabrice@gmail.com>
References: <20231104155857.110364-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699119704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tDjtQGEW3I63G4XhVNu+S+6Urm4xJsgofJNA2Bch9L4=;
 b=CnECxmnwlrXy3y6WOlS0A8bvId0iiBbCv5nzL7j/51otbk55POw5B/8ssUKmKFT7LUNbh0
 BHiT41bYR1O4OZTeSWvXlk0rHvuoI8YdfW9TJayKN7RCNMdGJFlcQbLsWOIfPeetbTGbdK
 AcEQSnwO/E1HPm6Xe8m5eNvWdDZM7d5Fir/U/iElvnpvAxTCvu3jbACFAe5zi2Jo+Lkw87
 LUcHqjZgnAN09f15MrDdMqzc8ghDI1F7AjbywFree5DkTFyhO2EKl/fVmuKb3ypHXUTNUl
 IhqEcSPX36wto1yAMK3m94ihqKAiqt8cbclZdNt1V7dN6YL+fQktaXPOzhz0Xw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CnECxmnw
Subject: Re: [Buildroot] [PATCH 1/1] package/ltrace: fix musl build
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

On Sat,  4 Nov 2023 16:58:57 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following musl build failure raised since commit
> bf9583a50276f52edbc37d9f85df5f2cc7fdb5dc:
> 
> checking host system type... mips-buildroot-linux-musl
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a3a5c46e8562d3f091a9b4b205322168fbf9d16b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks for solving this issue.

> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Upstream: unsent yet

Doesn't that defeat the purpose of the Upstream: flag entirely? Isn't
the idea precisely to strongly encourage (not to say "require") that
patches be sent upstream?

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
