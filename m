Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3142EC5321E
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 16:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E791660783;
	Mon, 26 Aug 2024 16:31:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 943otQtkCv-o; Mon, 26 Aug 2024 16:31:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D4DC6078D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D4DC6078D;
	Mon, 26 Aug 2024 16:31:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E9D341BF33F
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 16:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D669840315
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 16:31:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dcht6Yxe3cXr for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 16:31:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 65F2540313
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65F2540313
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 65F2540313
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 16:31:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D102C0006;
 Mon, 26 Aug 2024 16:31:24 +0000 (UTC)
Date: Mon, 26 Aug 2024 18:31:23 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240826183123.4fe30261@windsurf>
In-Reply-To: <Zsxt7Db6yjMX8x1x@waldemar-brodkorb.de>
References: <Zsxt7Db6yjMX8x1x@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724689884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GGkEIEnKcn0cgGwbkMsSIMoMpKU7JlX+4x/j9WBpFjE=;
 b=QxcLtdoDA5MAFniGgsMUB/ttw6V0vBhIRcG0PyADyxo692TuEm8lX2l+eNTZNVi9VypQlb
 tU+DtjaqTHEyMInay+gts1j4j1x6RlJSCaRKhf+1NVcpgzNNrUYleys6jxPK8BG5JrRTGe
 RnMZPi8hcahuCWfbnuLvA41qX8paXRqdTm0UFCFasc/icu0aRpqydlQfbkSm/EE37jQ6l7
 crUsa2M4P6xo2HLW2xHrKce9ypwlfPsCjDux4DG06kMB2nDd0A8B+W7aKtVkNZYrNSgncm
 aGakpUxelQsSoyQE4x6P06u0Vu4xwtNeqo7yc9lMmjf29Q7WfJElMwL/zThh7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QxcLtdoD
Subject: Re: [Buildroot] [PATCH] package/fbset: update download URL
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

On Mon, 26 Aug 2024 13:58:36 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Fixes:
> 
>  http://autobuild.buildroot.org/results/13e/13e28650fc58fc62c801a664d79616c6dd39a8ac
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/fbset/Config.in | 2 +-
>  package/fbset/fbset.mk  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
