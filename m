Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B155BC3DA5D
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 20:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7491F40E96;
	Wed, 17 Jul 2024 20:45:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aANOcJnF83ro; Wed, 17 Jul 2024 20:45:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36A0440E89
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36A0440E89;
	Wed, 17 Jul 2024 20:45:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B82111BF846
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 20:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4CAA40284
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 20:45:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aY9E1NnVUHix for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 20:45:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6B1D14027D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B1D14027D
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6B1D14027D
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 20:45:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 878E5C0004;
 Wed, 17 Jul 2024 20:45:36 +0000 (UTC)
Date: Wed, 17 Jul 2024 22:45:35 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240717224535.7e928ce7@windsurf>
In-Reply-To: <Zpffdv/lWI4det+1@waldemar-brodkorb.de>
References: <Zpffdv/lWI4det+1@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721249136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e38CRclzwbfPBPUaXnqtQuD4oJzGtCpwf1ZmZPDJynY=;
 b=gIF0ZQ8CMbk11CXLdL6klAWkAg7sbZ4Ybygn85oYlAj5nlUGLjKdMUGTj+Ah+4I5WHI0Zl
 IsxCj8BuwvThNtfRZ1y2BmYjbifENDfDAsMr+ZmolOgDO2xeL4LY/8nrldzgCy8OlaOHRm
 L4jPfcNA3rlaIHQmX4zQnTGXcsQLbfE5ZIYiWbpLWVPmwqi4wO5RQy/3NinDJtp0FxP2/w
 UVThKqLOQkzME9FBgilv6er1sgQSvrNnrDKu3wj0wdAS8HALabx4MyQ06AQs7yJyiNAljr
 qjyLLhJX38y5h7uVMemOIVeF2/T3p/cfpgshkVg6LMszwZjF3O/Isjf3z/Xlnw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gIF0ZQ8C
Subject: Re: [Buildroot] [PATCH] package/uclibc: add patch for libucontext
 usage
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

On Wed, 17 Jul 2024 17:12:54 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> *ucontext functions are only implemented for a subset of
> uClibc supported architectures. To allow the external library
> libucontext to be used this small patch is required.
> Tested for riscv64.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  .../0001-allow-to-use-sys-ucontext.h.patch    | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/uclibc/0001-allow-to-use-sys-ucontext.h.patch

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
