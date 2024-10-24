Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE804D0E3F3
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 19:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87ABF60AF1;
	Thu, 24 Oct 2024 19:32:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id asj13KrEqGO6; Thu, 24 Oct 2024 19:32:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E60260AE7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E60260AE7;
	Thu, 24 Oct 2024 19:32:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0497C59B4
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 19:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B54260AF6
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 19:32:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IkFLVLM40NFe for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 19:32:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9C4A060A89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C4A060A89
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C4A060A89
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 19:32:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4CBD2C0003;
 Thu, 24 Oct 2024 19:32:32 +0000 (UTC)
Date: Thu, 24 Oct 2024 21:32:31 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <20241024213231.188c8607@windsurf>
In-Reply-To: <Zxo0h8WN+wUQwWpx@waldemar-brodkorb.de>
References: <Zxo0h8WN+wUQwWpx@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729798352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0vnI8oEhUlSg7CBcRzRfWRFlHMmn59VTmNBVvh4ZGj0=;
 b=NQRTyMK18gDxWVCc5835YS0pl0umbea/A0wxjN+mqmUzylwT4dMc9ekfPZWxISxaG6wraU
 xZz7uXfx4jIesYExcWpK3dHhgUZkhH0enE47UN1V6yCV2T9+swOXFJw0n4Zz/0k4HEzUo1
 iG7JbUshN1wI7PtQq0XQQ/8KXsOjR0WhsNtEJtkNOtxXrEpbrcgVr5inxfHr+AuzsQd+LV
 qJSBpVAW9CoxGL4XCF+cpxhiOW7WX58d+F9TPkRz8Jq8I8meWynI/OZb/QuDVPa1AD0BcX
 0sIjMPpwgCZHIxnY8X6IfJv7qrbr4T+DGT1UvbUniVOs3etDw5XXS284KyMtMw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NQRTyMK1
Subject: Re: [Buildroot] [PATCH] package/libjwt: update to 1.17.2
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

On Thu, 24 Oct 2024 13:50:31 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/libjwt/libjwt.hash | 2 +-
>  package/libjwt/libjwt.mk   | 2 +-
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
