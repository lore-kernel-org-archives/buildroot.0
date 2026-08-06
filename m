Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A0EC55838
	for <buildroot@archiver.kernel.org>; Thu,  6 Aug 2026 07:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 169DE40759;
	Thu,  6 Aug 2026 07:03:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I_LKNa_ier78; Thu,  6 Aug 2026 07:03:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BC7840742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785999829;
	bh=2QbCJCRpmEgcDtm5pTRK3MPLKYycXWGY0oo7yBe1doM=;
	h=Date:Cc:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eGXQajPSFB+bKzqY99h67y8e+H/7l1wj3LMfkdcdisP/4b9Yl77lK3KqUMxy02Hxu
	 PinI+2fbP1E/IBf3z5G6oFoqiNsfcjuJdFTkCOIgxLPWQTFdZVwD66l4lIIW/IDwUv
	 bKFpvi4RGYTjNJkbetOlvuIT51SB5zeso2FZ7VuJvor3KdeN05wesl8xMy3qseQss3
	 gqAzHkN+gdePvTvLVPurD9MilOnt+yQWpih8wCoCUoOZOD3WkPzZeeB4lmo1JeV4v6
	 E3gbk3LOHEiYavoxSJknorI/ATnbEGJoZQZgDEsp4dCLGKKr1qnUjEN6kvz4KVpWzZ
	 CzvwlV6BEAF9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BC7840742;
	Thu,  6 Aug 2026 07:03:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E74E6218
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 07:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD4566069B
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 07:03:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gVO7WWBkDAOW for <buildroot@buildroot.org>;
 Thu,  6 Aug 2026 07:03:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BF2CB60614
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF2CB60614
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF2CB60614
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 07:03:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E9E074E41104
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 07:03:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A6706603F0
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 07:03:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8513211C35AA4; 
 Thu,  6 Aug 2026 09:03:37 +0200 (CEST)
Mime-Version: 1.0
Date: Thu, 06 Aug 2026 09:03:36 +0200
Message-Id: <DKHO3H1Q1N6T.29NZAN0BSG3NL@bootlin.com>
Cc: <buildroot@buildroot.org>, =?utf-8?q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.21.0
References: <20260805-heaptrack-v2-1-64633668959e@bootlin.com>
 <anOHDIfbjB7GXMti@windsurf>
In-Reply-To: <anOHDIfbjB7GXMti@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1785999820; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=vAFXMKjytAdW/mBTOBEijvodLREtBvo6FKnEAk6UVog=;
 b=d8DPCRFDXhM9wjhlfWTOkoT7a5GVL63eyWzTfV/nbQOdvGNz5Pe6zWsMjGuZQ8WZS7R94i
 TdQjb2ny2zIk3iS/u/WP4fAjuNBZVcDtemL4oYeY4SNbFN/Jj9Gcc1Qx9L8d3cVzof3PJF
 RDOEIuF9GbpJMBSKNXojXDC7+KUCVkmu/bTkhgSnmnahytXEAf5RF7nNAHvO9jE7PjAF2A
 lvjZr+5Q+0/cDsH5Su9xgkgAQ7MbpkyKxMaVzQRreY4vg/MRXzO2kc2jDa1V252IiFYjDq
 TP/+9RluHkxOxbX7AqS1ndyDJTUJszvxGwHFngdWbGoFR3fJjsCMQMzqSJSA2Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=d8DPCRFD
Subject: Re: [Buildroot] [PATCH v2] package/heaptrack: new package
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On Wed Aug 5, 2026 at 8:55 PM CEST, Thomas Petazzoni wrote:
> Hello,
>
> Thanks for this v2. I noticed one incorrect thing (but I didn't do a
> very thorough review).
>
> On Wed, Aug 05, 2026 at 06:08:47PM +0200, Luca Ceresoli wrote:
>> +HEAPTRACK_DEPENDENCIES = host-pkgconf linux boost libunwind zlib elfutils
>                                          ^^^^^ linux should not be part of the dependencies

Ouch! I removed the BR2_LINUX_KERNEL depends, but forgot about removing
this one.

I queued a fix for v3.

Thanks.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
