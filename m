Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F52C54731
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 16:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C77EE405F6;
	Tue, 27 Aug 2024 16:33:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HM_DGt1PaU-p; Tue, 27 Aug 2024 16:33:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67FD3405FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67FD3405FD;
	Tue, 27 Aug 2024 16:33:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 590B31BF4E5
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45579405FD
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:33:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QhTRRN9Iubad for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 16:33:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EBC08405F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBC08405F6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EBC08405F6
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 16:33:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F2E920002;
 Tue, 27 Aug 2024 16:33:01 +0000 (UTC)
Date: Tue, 27 Aug 2024 18:33:00 +0200
To: Vincent Jardin <vjardin@free.fr>
Message-ID: <20240827183300.593192bb@windsurf>
In-Reply-To: <20240826131924.7702-2-vjardin@free.fr>
References: <7kble6ezjwutfk3f6niiignnxgmq5rxhsvplayvlkj5ahczg7i@dyco5ij36lrp>
 <20240826131924.7702-1-vjardin@free.fr>
 <20240826131924.7702-2-vjardin@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724776381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Td1jaC1fUdx5VzS3eARV7/fJdN3JCrwDQF6ElvfLkNg=;
 b=JUqLLI1PmN9Cchitl7Km781T2FMlWJ/BUYvofqrByZKDzfiuTbypebv1y1TSff/NZkY0bF
 YjQieMnL7bfR4Vt1AV3axrrQ5bWmCJTKyYTFrhBFHWchZY0FMlFHfsGiQMQnNFixOtvnZ2
 4D8lm4UJBEXUSmproUHYBu0TJmzEmGYU4MPW3RIhSm0NhOat3yfr862gxa4qJjzE1HGUgX
 v2btw3iVb+5l4+68A2KvGoPX2IdTQxAbjEtrukFsAcSHsE7Lzn/gmJFXY5y82zMEBDVA9q
 JdsM7EwDf4+fU9uGFFFy8goVZHmn02S0EQEzky16ohQnDOPyunXCua0n3RgJoQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JUqLLI1P
Subject: Re: [Buildroot] [PATCH v4 1/1] package/frr: update to 9.1.1
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
Cc: Vadim Kochan <vadim4j@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon, 26 Aug 2024 15:19:24 +0200
Vincent Jardin <vjardin@free.fr> wrote:

> Update to the latest 9.x version. Protobuf is now mandatory.
> 
> Thanks to the suggestions from Thomas Petazzoni: Since there is
> a dependency on BR2_PACKAGE_PROTOBUF_C, the dependencies of protobuf_c
> should be imported into FRR's Config.in and the comment should be
> aligned accordingly.
> Note that in order to enable FRR, the following must be enabled
> to support C++:
>  BR2_TOOLCHAIN_BUILDROOT_CXX=y
>  BR2_PACKAGE_FRR=y

This paragraph wasn't really needed, as it's just stating the
"obvious". In addition, it is not true that
BR2_TOOLCHAIN_BUILDROOT_CXX=y is needed. Indeed, this option only
exists if you use an internal/Buildroot toolchain. If you use an
external toolchain, the option name is different. So I simply dropped
this paragraph.

> COPYING hash updated:
> The COPYING file has evolved to expose more details: the respective
> licenses are now listed, except for the GPLv3 license. The GPLv3
> license is only required when FRR is compiled with the GCC plugin
> that extends printf type checks. This plugin should not be enabled
> for production code.
> For more information, see FRR's workflow.rst document.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> frr/Config.in: enable CXX
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Here you had some left-over from squashing patches I suppose?

I fixed up those minor details, and applied the patch to our next
branch. Thanks a lot for having persisted through 4 iterations!

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
