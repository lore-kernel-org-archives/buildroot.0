Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 335A2C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 20:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEFE282F31;
	Thu, 28 Jul 2022 20:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEFE282F31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i3pRfeKp072t; Thu, 28 Jul 2022 20:52:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF461828DE;
	Thu, 28 Jul 2022 20:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF461828DE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 000D61BF37F
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC1E540354
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC1E540354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gPbtuTHaHMFc for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 20:51:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87430402F2
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 87430402F2
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 20:51:54 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B27101BF204;
 Thu, 28 Jul 2022 20:51:51 +0000 (UTC)
Date: Thu, 28 Jul 2022 22:51:49 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220728225149.51685312@windsurf>
In-Reply-To: <20220728081418.1697171-1-fontaine.fabrice@gmail.com>
References: <20220728081418.1697171-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659041512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OsoO5lsJ8batr66NM3VImH1FSzw6mSa8oNUmtKWrzpo=;
 b=dCTnDH7RfrZXXL+ipsjzII0G5k4G/VeAPlb4G8IQQxMKAj2A1rusmg2SgPqtQRkbX3anVH
 a3xCzXtZ0+pOI+otkcN1WHZpqFhzUHQpdWITYmLvd26DYCXMcO6dg1jpWIv8MupCGWVmW3
 82+OYEthNd9L+dNOhpBptI+93C1IKfp1iq8qpSPjsqfkhmjZGkBf//tdFm/HLWQTXrbA4i
 IuZu45hc7kxsZazZFyLjT0dmFYhcE45lhfr/F21e2pGyWItOr7+x6lQY/VAqdGzPPWPhm7
 mE5k5MPi7j0FeF/n3InzsUE0E9DvG/+SYJ9Z15QBa+48n2+b2KHVgFZThHEOHA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dCTnDH7R
Subject: Re: [Buildroot] [PATCH 1/1] package/earlyoom: fix build with kernel
 < 4.3
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 28 Jul 2022 10:14:18 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> PR_CAP_AMBIENT is only available since kernel 4.3 and
> https://github.com/torvalds/linux/commit/58319057b7847667f0c9585b9de0e8932b0fdb08
> resulting in the following build failure since bump to version 1.7 in
> commit 07b7f88668b1e51e3d17e14bd8795ef042df144e and
> https://github.com/rfjakob/earlyoom/commit/9edc5cfc9ad794ed59baec5e6ee8d1060456a315:
> 
> main.c: In function 'main':
> main.c:119:11: error: 'PR_CAP_AMBIENT' undeclared (first use in this function)
>      prctl(PR_CAP_AMBIENT, PR_CAP_AMBIENT_CLEAR_ALL, 0, 0, 0);
>            ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/5a0ad7e1f6de3c37e40c37d8f583fc699a457753
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...001-main.c-fix-build-with-kernel-4.3.patch | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/earlyoom/0001-main.c-fix-build-with-kernel-4.3.patch

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
