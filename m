Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3A7D1BDC9
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 18:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CE498421C;
	Wed,  3 Dec 2025 18:33:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mBOwVaxxkor1; Wed,  3 Dec 2025 18:33:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E8098408E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764786826;
	bh=lk0yYQk4V04EiAEpWHGfP2kt61mM63SWUchugDB+N5U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WXmt8HQAJxnp0HAes9re3t+OvesLQpQVZcnJZHXpWdsvTd0H/vagIjfrWgB+bZgCB
	 RlSOzMqDXPcZIZ5ofZpe58E8BBLMNUcZGmRDvaiO6bvEt7GCEPoUkXl3GwF2Qnhg4i
	 zw9GzO4nJZjkj2KV3NJoKz6pVRjdRwJxtpcUQw6fn1Q0h394SDM33zmxSLoHggx4ON
	 Ar4hJ3mVKn5jtCR/i/ZZtT6ByzzQ/15SiyS1ZdpI4yOf+Ek5qehOZFH4Uc0prmotnP
	 Uonbpx2AuLfWOGenT4zk8V0UkyVpjEJnsJSszR409QIKMQCQwllizkidkfMWkTeqg9
	 /uZlo6iWlcWtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E8098408E;
	Wed,  3 Dec 2025 18:33:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AB050E4
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 18:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D4D340E41
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 18:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FgsAD0vOhdVb for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 18:33:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9A0F440E0C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A0F440E0C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A0F440E0C
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 18:33:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id EDB1CB005B5;
 Wed,  3 Dec 2025 19:33:31 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 03 Dec 2025 19:33:31 +0100
MIME-Version: 1.0
Date: Wed, 03 Dec 2025 19:33:31 +0100
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, yann.morin@orange.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
In-Reply-To: <20251202100516.1097984-1-neal.frager@amd.com>
References: <20251202100516.1097984-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <e0cea6e4b5ac6df05f59ca25b3d12a12@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764786821;
 bh=wwze97xtoY8mEvnArJ1C0we+uxmoY673hcTzbZV0EVA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ph6vzhKqJtIqQ9kyy3kETbqR5H1/kfX/Q9YARLlgheLaV1lt8/3sQNGn3fbA735gw
 io3Z3QzHFNE+DKYLw8bMbySr6UiQsweNTQH2xwSa0dH/PjPbVacoJsZdEXKMTfks4J
 LzI5cteNR6StlFgAl89dSVH+7fIXLMLt9qlTBkjvG2FIoJ/aP1zzc31v/7gfjmIxnQ
 iF9sjTJsevc2d8O2VI9B/mrwrAhyZqsI0nG5FYitO89ES8EfYogyUuOBRxVIO1ciw+
 8OsUPAiquI6ECrXeutpZr8mZc5rR6Re8IDrLA/db4HqMcGgp9sGBkg7t7x3qYtDKFb
 5h+FIhwH4uz1w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ph6vzhKq
Subject: Re: [Buildroot] [PATCH v1 1/3] boot/xilinx-embeddedsw: add versal2
 support
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 02/12/2025 11:05, Neal Frager via buildroot wrote:
> Add support for Xilinx versal2 devices which include two new 
> applications
> for the xilinx-embeddedsw package.
> 
> BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_PLM
> There is a new PLM (platform loader and manager) application for 
> versal2
> devices. The purpose of the PLM is to act as the bootloader for loading 
> the
> boot.pdi to configure the DDR memory and then loading 
> arm-trusted-firmware and
> u-boot on the Cortex-A78 core 0.
> 
> BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_ASUFW
> Included with versal2 devices is a risc-v based security accelerator 
> called
> the ASU (application security unit). The ASUFW is the open-source 
> application
> which runs on the ASU.
> 
> Versal2 devices simplified the boot process by getting rid of the 
> second
> microblaze core called the PSM (processor system manager). There is 
> thus no
> longer a need for a separate psmfw application like with the original 
> versal
> devices, as this functionality is now fully included in the new PLM for
> versal2.
> 
> For more information about the Xilinx Versal Gen2 series:
> https://www.amd.com/en/products/adaptive-socs-and-fpgas/versal/gen2/ai-edge-series.html
> https://www.amd.com/en/products/adaptive-socs-and-fpgas/versal/gen2/prime-series.html
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Series applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
