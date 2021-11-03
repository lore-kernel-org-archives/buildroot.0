Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C32C433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 20:04:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C70CE60174
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 20:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C70CE60174
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yandex.ru
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6848140146;
	Wed,  3 Nov 2021 20:04:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LuqH4J8OnU8E; Wed,  3 Nov 2021 20:04:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A500E401C0;
	Wed,  3 Nov 2021 20:04:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0EA811BF3D6
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 20:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09F10401C0
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 20:04:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9dz-ury2lenx for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 20:04:38 +0000 (UTC)
X-Greylist: delayed 00:11:53 by SQLgrey-1.8.0
Received: from forward103o.mail.yandex.net (forward103o.mail.yandex.net
 [37.140.190.177])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC70340146
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 20:04:37 +0000 (UTC)
Received: from sas1-2c02ca35cfae.qloud-c.yandex.net
 (sas1-2c02ca35cfae.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:3992:0:640:2c02:ca35])
 by forward103o.mail.yandex.net (Yandex) with ESMTP id F392110A91AA
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 22:52:39 +0300 (MSK)
Received: from sas1-e20a8b944cac.qloud-c.yandex.net
 (sas1-e20a8b944cac.qloud-c.yandex.net [2a02:6b8:c14:6696:0:640:e20a:8b94])
 by sas1-2c02ca35cfae.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 72dmKw2cTt-qdDWSmtw; Wed, 03 Nov 2021 22:52:39 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1635969159; bh=7VCgTqznZoPkDkKSPk0F9s4PgynPe2nUXxBE/W7qUoM=;
 h=From:Subject:Date:Message-ID:To;
 b=TVPHW2qHMfHi9HWkdZeGdt4skYi8/yaxS3Tuf0nGLFFoHqG2w+Nr284D09ONiiYV1
 1BtIl1sRjjTwqCn67O7opYyB0fMQCZOYpkuMlsfEJOsMshHH7tBISQ3y1H/LuAfqWJ
 7B+M65gpghFXh2v4lAKu7az5Ll+HCIAFohddroPo=
Authentication-Results: sas1-2c02ca35cfae.qloud-c.yandex.net;
 dkim=pass header.i=@yandex.ru
Received: by sas1-e20a8b944cac.qloud-c.yandex.net (smtp/Yandex) with ESMTPS id
 3zIu4M3AUr-qdM05tcV; Wed, 03 Nov 2021 22:52:39 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
Message-ID: <3c3603ba-5719-fec9-9bb3-7b0f3967fc9f@yandex.ru>
Date: Wed, 3 Nov 2021 22:52:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
To: buildroot@buildroot.org
From: stsp <stsp2@yandex.ru>
Subject: [Buildroot] generic code with i7 bootlin toolchain?
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello.

I configured buildroot for
corei7 CPU to use the bootlin
tool-chain. As expected, nothing
worked, as I have the (very old)
AMD CPU.
Then I did the following:
BR2_TARGET_OPTIMIZATION="-march=x86-64 -mtune=generic"

make clean
and full rebuild.
After that I've got working
kernel and the user-space
starts booting, but still many
user-space apps or libs crash
with an illegal instruction exception.
I even checked that the toolchain-wrapper
generated by buildroot, has these
strings embedded, so my change
certainly had some effect. But
it was not enough.

So it looks like the
BR2_TARGET_OPTIMIZATION
is somehow applied not to all
built packages? Why can that be?
Is there any other way I can
utilize bootlin tool-chain for some
"generic" (non-SSE3/4) CPU?

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
