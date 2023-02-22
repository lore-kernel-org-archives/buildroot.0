Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E00C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 14:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA419414F8;
	Wed, 22 Feb 2023 14:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA419414F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ljaeYFiUAneJ; Wed, 22 Feb 2023 14:52:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34ACC41193;
	Wed, 22 Feb 2023 14:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34ACC41193
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 557451BF589
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 14:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F06A607C7
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 14:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F06A607C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fILjlYAkrlA6 for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 14:51:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FDB4607A3
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9FDB4607A3
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 14:51:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 694C91BF209;
 Wed, 22 Feb 2023 14:51:53 +0000 (UTC)
Date: Wed, 22 Feb 2023 15:51:52 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230222155152.336584d6@windsurf>
In-Reply-To: <20230222111059.887398-1-fontaine.fabrice@gmail.com>
References: <20230222111059.887398-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677077513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1zplJGG998VvZjKApSN82eqPV0eYkbuE5zJBHed1auY=;
 b=OiOEYAFrZ7SC8P4XbobJV6F7ZmM/DlCAakkATz4qmptJdPzmD3wtyCq95p7ZCZonQyP0jN
 rcpLPc5N+G0cZl6LyLOQVpF90nI2aHULstN/R61Vhs/BLSTxap+6zmH2VOekvbaoKdsW9n
 EGF3iK40vLVb6sep6DOa5hFGJlxa3I4VmDMOGfMAzng5VPrk7RnyzHchQnORLdJDUVvcCB
 wZXowD/Rp2aA+HPs95fj7ajLlnjDhT/EbCGT121Hnp3Bleasv8JjkCTnQFW2HycU8IOE2v
 X6txjyqb0x1m2ZQHWgNhXkfoqvDYMoZBk8VOX2Ztshm4ZgCD8rmAV1Z5Bw81cQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OiOEYAFr
Subject: Re: [Buildroot] [PATCH 1/1] package/freerdp: fix libressl build
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 22 Feb 2023 12:10:59 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with libressl raised since bump to
> version 2.10.0 in commit 03bab7117d232c9dcd784a74eefc0e48ea51ee53:
> 
> /home/thomas/autobuild/instance-3/output-1/build/freerdp-2.10.0/libfreerdp/crypto/crypto.c: In function 'crypto_cert_get_signature_alg':
> /home/thomas/autobuild/instance-3/output-1/build/freerdp-2.10.0/libfreerdp/crypto/crypto.c:980:8: error: 'NID_sha3_224' undeclared (first use in this function)
>    case NID_sha3_224:
>         ^~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e96848576ac292799636abe7485c37aa54196a2c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...e-sha3-and-shake-hashes-for-libressl.patch | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/freerdp/0004-Fix-8702-Disable-sha3-and-shake-hashes-for-libressl.patch

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
