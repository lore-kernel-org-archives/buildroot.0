Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38FF4EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 20:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D87C440465;
	Sat,  1 Jul 2023 20:47:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D87C440465
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vLyJhvVurjG3; Sat,  1 Jul 2023 20:47:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23A23405C5;
	Sat,  1 Jul 2023 20:47:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23A23405C5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A082A1BF2B7
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 20:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8621760AA4
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 20:47:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8621760AA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c1Pqn1vkc8Iu for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 20:47:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C23F60AF8
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C23F60AF8
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 20:47:48 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9CC3A60003;
 Sat,  1 Jul 2023 20:47:46 +0000 (UTC)
Date: Sat, 1 Jul 2023 22:47:45 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230701224745.2d8bdaf0@windsurf>
In-Reply-To: <20230612172926.1814129-1-bernd.kuhls@t-online.de>
References: <20230612172926.1814129-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688244467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eLg1jtTmKUFRMmpLRvaJxooqetKdhWZ8sCYqAVoxCF4=;
 b=BB2xDYmw2NbqTiaXKFDNoD+D7Pcikic7OZYInovJpZglltNAyu5wj++32xLF2XrRHiQO1Q
 tGPajs7Lg9krbwzoAxHGHdBhNYEqjOFTRLo7hPESb8TKKkIXXV6Db+z1uRq52+EazQUonZ
 leteyGb+/gouXDXhBUQ4WiLjaiISCKfVQXlc4aEni0c9kkW7ZV7lckFkgTFHPoTzQD8vjV
 lzKuZxQ4WJSWDlIs52FMatJNFSj+/4gcWOVagj1hN8bxRjTdbPtukkGLYK4S0bnVh/F9Gh
 iH2/XJBxXwLdCvV5FWqBnaidjy2Lz96/0LJEtxDDR9yy1q6M2M+tTN/vUnxp4Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BB2xDYmw
Subject: Re: [Buildroot] [PATCH 1/2] package/haproxy: fix build on aarch64
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 12 Jun 2023 19:29:25 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/07c/07ccb8c45c709a4b6ed32aafa33cd04e74174b11/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...mic.h-may-need-compiler.h-on-ARMv8.2.patch | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/haproxy/0001-BUILD-atomic-atomic.h-may-need-compiler.h-on-ARMv8.2.patch

Both applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
