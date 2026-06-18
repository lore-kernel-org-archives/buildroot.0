Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1BBCD98ED
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 22:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0148E6179F;
	Thu, 18 Jun 2026 22:37:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ERyxA63hLnMY; Thu, 18 Jun 2026 22:37:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF93D61791
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781822229;
	bh=s82MrsMVU978QHZ5pFy2ADtKijqFK8bl1fnFhVy2ew0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XxeOo9CZtngyWcT131SGPmfXvUhzcWL+Xsrid6m0e296MJSmjzx9HvMhvUm7GuJPd
	 p5pqoTkzB6UPt7FonFJfVcYZRecFC4RaS2B6FPoEZaJWnQkJYaEvIMYAFuwhS3fXeO
	 SOXd+Az7P783hck3C6P7i8Mkdg4rme57K6gwUTYcMVEKryZFEaxydKYa8sn+CkxlKq
	 onCcmaJsdK5g+E9y6WXd7290mMn4oh9Thj7C6Gh+fqvmsbQpmnVwoXvxqEwlLFE6Fh
	 8Y3+oXYz/5oGn8NDGZEx6OVeCo7YCRjCbSVvX74sJ8KPMo5X7C/78/+FPF94M786YV
	 4Ai/L7CtaY6pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF93D61791;
	Thu, 18 Jun 2026 22:37:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A4198367
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 22:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A39261791
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 22:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZZCGRQ4hwBCY for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 22:37:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AC9626178D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC9626178D
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC9626178D
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 22:37:07 +0000 (UTC)
Received: from [10.42.0.16] (ip-109-41-112-134.web.vodafone.de
 [109.41.112.134])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id A5F2D2C891C0;
 Fri, 19 Jun 2026 00:37:04 +0200 (CEST)
Message-ID: <1a082889-dd93-4289-a631-11c7e92a72d7@bubu1.eu>
Date: Fri, 19 Jun 2026 00:37:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Thomas Perale <thomas.perale@mind.be>
References: <20260617174208.3968183-1-james.hilliard1@gmail.com>
 <ajOHeaIobPebbK+f@yd-6wlzhs3> <9b0c655b-ff65-4841-9390-43515fb06d56@bubu1.eu>
 <ajQH75Zam4xELadz@yd-6wlzhs3>
Content-Language: en-US
In-Reply-To: <ajQH75Zam4xELadz@yd-6wlzhs3>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1781822225; bh=CQuLQNCRQUk9M5wWyZydXw6NkRrtHls1m+DqYneDHKc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=ZNV5KDGWy0LWagu9YpAgLIyX7xgtet5QKh4RCZMDBJVs53Yc0yn4mjmY7nW9RJYg7
 UqIPMFbsnrsOObwXYgat+6c3ERswQn7FPowkQx55qa4tel/LrPMUCYlSDdB34Xpldm
 3YzNJU+rBSR4h4kPrISpUmwlkM/As+2NuL1Mw099MrwnmRbf04DegXy/43P4+OElId
 4+Vsl/bz2CPXj4AWYeOEdSuP7dxBS5j8iEE+vzWQCCJEAYRP29x5H1wEllpt26p/0P
 Bx+hFwrXlCc+BnFquXWqafY2OqgYYvbLmHhYcLCoCFwxRw+OnWQSY7SyEYjzqYgWTU
 bOk/biVhQt1Gg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=ZNV5KDGW
Subject: Re: [Buildroot] minimum system/coreutils requirements
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann,

On 6/18/26 16:59, yann.morin@orange.com wrote:
[...]
> 
> In any case I was just pointing to a discrepancy betweeni how we handle
> various tools provided by coreutils... Whatever the eventual outcome, I
> don't care much, as long as it is homogeneous.

Got it, makes sense!
So I think at this point it's easiest to apply James' series with the 
check included and then I send a follow-up to remove all the coreutils 
checks and add a note to the docs that we require 8.26 for the upcoming 
version.

> 
> Regards,
> Yann E. MORIN.
> 


Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
