Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC40CD5BD1
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 21:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCD56811DB;
	Mon,  1 Jun 2026 21:05:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5VmpalEmLIly; Mon,  1 Jun 2026 21:05:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBC2C811D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780347904;
	bh=OLSrsyRXcecpdN5x1SGqawslmXnOhQylVkkcY2D1yeI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kdTHEgol2CjuhblSWJXJMQ+1LJD+/sTwC+TIE89yj2FBMp1MzrR93E4ZSwCh+ChBi
	 dBpxvJEPaA2EKTi+nUtTA2y9tg1NOcZJXFTn4GjiudEUSameLlcivi1gRHBydFPAa0
	 meuV09Di+K7te8itD0458QH6vWKtTYC/BrsEsKVozmeDpMDKuS72wf+6tRLlqCydxC
	 SJ2M/smMn4aGsq7GrAN33EugqQCgQ3f5+EmF0EG6hgF5Kn1rzf6ZM1NXJsphUAdYYi
	 USCUcVbZKhvtmw7tBC4abaNSs8pmfWkM5m5VUEV9flrXCBJmP/tJe0MVs+fu++Vi2x
	 w6R4qUDok1clg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBC2C811D5;
	Mon,  1 Jun 2026 21:05:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A6148F4
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 21:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 979DF40A63
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 21:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VMlLpCRDCmF4 for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 21:05:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 433A940A54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 433A940A54
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 433A940A54
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 21:05:00 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-490b09e4cccso2748215e9.0
 for <buildroot@buildroot.org>; Mon, 01 Jun 2026 14:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780347898; x=1780952698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Q6KyWDC5Ka7Fd0QpovBRmUuNuKB/0M0za4Qrs44EXlo=;
 b=IFnSKfRxevVuRxhgAmxH+xFEqSJI7I4C1gcx3xkulEpzUYzg8N2Ci1lU/yEHVn9HUi
 tWKd3iVAs8yVdaslbVA3H4i1pHd4iJ0zhyhmjSYTUNu3j0NlnX20dXbycCd0O4aSaPsu
 dx0Jm1QAO97YNXBUhFNCWzV1YAH7oJ5/t13wdEQnzrfryJIEne3t8fQhtjS+5mym0oY8
 Aay2mKIa2BW/cN0KjeCccOz7mAqYXumQoRzBrH1y4YMtqRCJquC8LIK1yL5Wj6af5rum
 cUb9u3qsei11apfLaCWDdqNL1XKvZbrHQ0IhRBDVauIIytmvmWJkEd4CBpeNL8Lhm4xq
 82Hw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+cgFySTEp98DQeDyOLAcAfqlP8WbZpzpCqIOVQNL+8muOQIIAdKfnOMF3Yt4vWY5RnByLbsHB5osw=@buildroot.org
X-Gm-Message-State: AOJu0YxqV4GKsKsHzP64h24qVp2dHapoUEdeaM9Op9j2Wqku1DxvCPdZ
 +FnDzcWsrrif4OnFleLtk6jiAu+zn5h5evO8CWARpGHblOgVAKIfXI7JTiklVcNWiJk=
X-Gm-Gg: Acq92OFcjZ2CRBpXJh84yz3t8amFxGEPkrc+zwbEUwwEGS83RyoVrFPwn5mvopnNs7j
 B4LC74z+kaeUBbLFQQ5i/pCY3sOzBGgqV85sqjn08z/8TZbEKIWY4rBbnTGSm1oqrab5nIkQrcM
 c+WZApNcMh5wl8E59IgUFi3NQFrFxF9eS9IHO83DcJ9TExkUXLWLPwWbiZ3/HNWh6SX0d8biJvq
 vPr1upniU8sd8yVsam+tDRWZ6i3N3xCGlL4SkSg2Ek4iRIUysNFTK6Y+cNhyScOBSxbGI3ZWK8R
 9oYris9IwpEGkGCU82be8aLrgElAcV9VRme7pIqJRghz3dG7N0Bs4Ui5eFRdS8bcYtUBkXjqUJW
 G4I/qRHEm6oFL/TqVNpvON0MF2ULbxIv8XYaaeVa7LfNny9LAbfYe8nXbwbnU6j5r5PHVEPbYtR
 3bAzfKY3OyRKu9fVlzNh9+b83igOJQItP/eXFvLuUWSZJu9Kj4BpBi1ZNBlA==
X-Received: by 2002:a05:600c:4e92:b0:48a:7aad:4425 with SMTP id
 5b1f17b1804b1-490a2901aefmr241642465e9.3.1780347898153; 
 Mon, 01 Jun 2026 14:04:58 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0e3431bsm15944225e9.12.2026.06.01.14.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2026 14:04:57 -0700 (PDT)
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  1 Jun 2026 23:04:57 +0200
Message-ID: <20260601210457.16137-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <59f5a749-6fb6-4459-a54d-2390beb532b8@rnout.be>
References: <59f5a749-6fb6-4459-a54d-2390beb532b8@rnout.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780347898; x=1780952698; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q6KyWDC5Ka7Fd0QpovBRmUuNuKB/0M0za4Qrs44EXlo=;
 b=SRl22Zw6kSdLpyHJGt828Wtw6+x7EHnQy+SFsODCAhmYKTAMVEO4/yHe1Lbn+2AaFV
 W/4OI0UrMYopfKIyMk0HlqMPEVpriMQDVR14bBgceeXv5xvKITP+W1KLP8ZFCcuzvpUk
 U/NjCRk27Ladn3DFYvopRTEhc5rN4rpJ85dOuD3t4Cb0/hHzxpEOcMTgUwbkTxF6NLIE
 AWoWdufSnksXIw34260Mod349SyMW/y0QtwO1sZFGFfdtGL0EJXhoZFLN7mJvNlJFjXi
 z0yQWUwNXJc+nEMBQiohEt3O61z1kEGAdlUV1hqr/V3YhqehUV+TKgOkmyTbtppM8ECM
 34lg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SRl22Zw6
Subject: Re: [Buildroot] [PATCH 1/5] package/busybox: re-introduce
 IGNORE_CVES for CVE-2023-42366
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

In reply of:
>  Hi Thomas,
> 
> On 29/05/2026 18:18, Thomas Perale via buildroot wrote:
> > The patch `0008-awk.c-fix-CVE-2023-42366-bug-15874.patch` was introduced
> > in [1]. The IGNORE_CVES entry was removed while the patch is still
> > present in [2].
> 
>  I was going to apply but it generates conflicts since we bumped busybox to 1.38.0 on Saturday (though that patch was already pending a couple of weeks).
> 
>  Could you re-check which of the exclusions still apply?

The patch number 3 and 1 still applies and the rest are part of 1.38. The 1
needs a renaming though.

Will resend this series to target 2025.02.x and another one that target master.

PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
