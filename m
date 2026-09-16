Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46583C982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 20:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFE1080E60;
	Wed, 16 Sep 2026 20:45:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7qwJ_gjskqs2; Wed, 16 Sep 2026 20:45:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3462580E52
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789591514;
	b=QgrhBVcOQvGgvJfetXecAHiA6Cy7rwA//J9KGK0PCifW3j5sqiLZMqKHw3Yq89GkXIie
	 gKnhjZDWcO48sTOdvcAouXpitPLRhjxQvW6p3l/Do8OYQ2IQ5hFgORE4svIj0D/EXn/3Y
	 yPuG+3ZudNrZ0SzUPcnsuqT1TjT4CN1pu8YaE48IQxhrQ8Nv5BsETuDW7gUhy43uRpB0i
	 Gps6EjUe1xOz/sbFsPQARD9U8wymbmDFUnduHgeUlnrFqEBTJssP8DEQTuyi9MkLicidA
	 b4LpnGNbpab7tCcgRHxhJcGlZ9rBRatuF1qwwYq8Rr4dk53UydyOZGGmpqLc17+C7pQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789591514;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=USrFJs0WJUepo2IPUbqL1cdCzOgBz8ngRsxRFUMQ6ZE=;
	b=g2qO1o2+wbpOvRT0l5XDQ8uwAh1HsaapMjKc9z5oIg61tUTxVwKjs2oyhRfttjj6IeMi
	 O2/4D8i6gKzqxBA3x2+sKAeqgjkBV9F5TBiLgdq2jSOdoPEwN3Wb40ECvGzYOhW/S9NBq
	 iOG3+yFr2UgU3Tj23rkKjpFRCEgRMw1tKFs7E5k7NLsCp2TbRXD0E/+aspau/Y5AgCGrT
	 XGRwRWLkwlDbJd4YSL8ViAvYMvkQWAuH/jw3PExV9c/v5OG8k/0woPjIKRQr65Ol9SdWs
	 7A571npsAfjNF5DSZg3awc4YHxzKBxjKJOiS9kibQBQnclwbB+iMiDWgI2jTNZNNrZw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789591514;
	bh=USrFJs0WJUepo2IPUbqL1cdCzOgBz8ngRsxRFUMQ6ZE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eSjU3Y7fWLx6VXO2yJhj3YebEhNiwiwD+sZkM2o00nK/rGmXLx1vf1LjxTaRyXUgz
	 qxg65vAyFCY3x6yo9wwWGjjI9KHhswbzoYrcxt4KSKEbxNoHxogmnyomgc/EkbXjdW
	 hR7rmUsMC/LRnsjqQwpYq4FoaPITfVDRbU9XOsEeumxvq5q3KkiFxyo0J803HERfcv
	 /rHVHLAre5HIzW4bvTjmIaZgodOwxtLcOmaS1FbVgvyNKR70Q/KFhDzLTo2D9kc8Z9
	 8B5Wdbj9A7stxdS4xG8wp85Y/3gXnt0Po3sq/4/AAJkSIG/fz4ZgmS+HPSNt0CDviE
	 9VJ6+vPnZHfbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3462580E52;
	Wed, 16 Sep 2026 20:45:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 511F413D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42CCE80E52
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v5E665v510KK for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 20:45:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6D7C180C0D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789591511;
 b=adFbjvHcCo6rH5RoNVxU9RbJnAnIWq1YVmT3u+MmtY1H0NZD9CZWAhhCHS9lakdzi3sQ
 9wMuEp9y2onFYXLcuQ9MChFDUBClLXMgXVBdqvwpctkFq+0crTHBO4bYatXrHZbEdY366
 7a3thVJXh53uheQDggwq5ZAk+Yq8YtHvW4EheEVWJ/6BkAWmP9yXI8SMMEY98+g9izqNk
 fuyp5HhHTVlagTRz2kUfVlnlGsw5RTM8NYxoV/f310FPTElDCO6J+Vwkk8AHxO1BYJ9Tv
 CG0rKsc4ZeDU2iMJY+OCZyYcHdJN288mF7Vdc5vFC4iDhvbfihxbvtGDQL7ypfylIIA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789591511;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=NTH0UeXFeJofiYdszDJYvYxpFpv/ndzzRc3lnLISlmc=;
 b=a5mU3aVLqW4AA8aN2ef/U7zjtWGaefK90utw+JbwPz3aw5ubrZBA3Z6p6RNWthoR7ffN
 e3vpNYuguO5zkVZSXViu8hWGtDJqxJ3eNTLyf0D3wL8Zufba452DmxH+HnfsW0s3/bqL/
 26/w6gbQNjZKoH3sQGcJipj1xDY+QNHSn2Syr+Fhmrcbz6k/KCfIOuDETqnpD9V7phoxM
 GrLPFDSr/0z0LV8wxA8TxbDAUnthINErAGeVfoBVqkgCXdV6zL2xQCuEAJJOqRjLSFW38
 W/58s4ily9pNOilIjrr4ZryK/jOMNNgoena/vKcS0vjgk+1xAx74XwklKc5uiXRlmVA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Ljyj3sMA; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D7C180C0D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:45:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 10359C5CD6B
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:45:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C826A60337;
 Wed, 16 Sep 2026 20:45:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CA7B411C7B00D; 
 Wed, 16 Sep 2026 22:45:03 +0200 (CEST)
Date: Wed, 16 Sep 2026 22:45:02 +0200
To: Fengwei Tan <tfx2001@outlook.com>
Cc: buildroot@buildroot.org
Message-ID: <aqr_y5P79p8wODDd@windsurf>
References: <SY8P300MB0041A241A227D8AC8B1C8488B5BD2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SY8P300MB0041A241A227D8AC8B1C8488B5BD2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] support/testing: add FLAT stack size
 test case
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

On Sat, Sep 12, 2026 at 05:24:12PM +0800, Fengwei Tan wrote:
> Add an infrastructure test case to verify that the per-package
> <PKG>_FLAT_STACKSIZE variable correctly configures the stack size in the
> generated FLAT binary header.
> 
> Signed-off-by: Fengwei Tan <tfx2001@outlook.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
