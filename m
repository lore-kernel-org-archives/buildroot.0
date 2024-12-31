Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE9BE77188
	for <buildroot@archiver.kernel.org>; Tue, 31 Dec 2024 11:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF20780A4C;
	Tue, 31 Dec 2024 11:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UssNOgrWDNHW; Tue, 31 Dec 2024 11:02:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEBB4809F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEBB4809F6;
	Tue, 31 Dec 2024 11:02:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 73141C8
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 11:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E034408D3
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 11:02:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TyLPsGGwUQFD for <buildroot@buildroot.org>;
 Tue, 31 Dec 2024 11:02:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0A465408CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A465408CE
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A465408CE
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 11:02:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 217C660005;
 Tue, 31 Dec 2024 11:02:36 +0000 (UTC)
Date: Tue, 31 Dec 2024 12:02:35 +0100
To: nvd <nvd@nist.gov>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <20241231120235.30949440@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735642957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VBUXmKmMp9Jcqd9RGCQokOC9Ara0jKkPlY/KdMH1nnM=;
 b=SWxRJDMuy9TIMFknaxz7ZhEzGUyp9Y+bMOiPK8jHL9sqM+OcYsy7kte2Mv5HvOfZJvpMZy
 /gjgJhTpBr7ECD4p6cw6yNDgvy8YET1WxYamR0wdpqY9XKkVo2vDq2R0iRgUGLrqYRIqc3
 XJOSMhygCD2SXGKbFGhF8pcaA8QiUVRX3nMZgEs8mjfDPBA3j3vraY2w+axKlkytm3IJfG
 eKKcWpvLXRDGhUryJGPHiw3ebLXtXfFVDwH12NaxL2Ft7IvknvvIwaq3HfexhUW6wKtmYp
 uDioWblTQLKH0YpgHf8mKH4sBxQtt1SBcknyP07EeETk8+UTj/IFQfrR05W3nQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SWxRJDMu
Subject: [Buildroot] CVE-2024-6232 version range fix
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

Dear NVD maintainers,

CVE-2024-6232 reported against Python is documented at
https://nvd.nist.gov/vuln/detail/CVE-2024-6232 as affecting
all versions of Python prior to 3.12.5.

However, the fix for this issue has been backported to maintained
versions of Python, which means some versions numerically before 3.12.5
are NOT affected.

Namely:

* https://github.com/python/cpython/commit/d449caf8a179e3b954268b3a88eb9170be3c8fbf
  is the fix that was backported to the 3.11.x branch of Python, and is
  part of Python 3.11.10, so every version 3.11.x >= 3.11.10 are not affected.

* https://github.com/python/cpython/commit/743acbe872485dc18df4d8ab2dc7895187f062c4
  is the fix that was backported to the 3.10.x branch of Python, and is
  part of Python 3.10.15, so every version 3.10.x >= 3.10.15 are not
  affected.

Would it be possible to adjust the CVE entry accordingly?

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
