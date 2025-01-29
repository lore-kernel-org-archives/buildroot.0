Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDA5C0218D
	for <buildroot@archiver.kernel.org>; Wed, 29 Jan 2025 20:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 528EC40301;
	Wed, 29 Jan 2025 20:55:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iB0dlRFwcrUB; Wed, 29 Jan 2025 20:54:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 106CE40304
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 106CE40304;
	Wed, 29 Jan 2025 20:54:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CC23E942
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 20:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B912560B56
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 20:54:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PmF0Wx4yx5ak for <buildroot@buildroot.org>;
 Wed, 29 Jan 2025 20:54:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3348660B26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3348660B26
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3348660B26
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 20:54:55 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 232156486; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 29 Jan 2025 20:54:53 +0000 (UTC)
Message-ID: <19377a96-ee6b-4cea-b72b-e40a5f8bc3a1@korsgaard.com>
Date: Wed, 29 Jan 2025 21:54:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250129194007.60839-1-christian@aperture.us>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20250129194007.60839-1-christian@aperture.us>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=pQwUv1nsDquOb2/Roc0H5nWa7E2pgE5r9s3oG8kH6Lqc5eiW6IBhW6KKaJtr5lM0nVUgIqrZIcSt/Keesc+AwLp4Tw8hKasZNAKSQyfvchO7J+O7PqToBCzHIkHfoXHKVue1W48rhm20lxW0B0mvII2t9PcncInTF7IwFchDhIp6BxHR2MB/zH6DLYrlrVCn9AlY9Y8h1NA1I9u0SULxy5SBjGj9TRR/UDrDmUaTsUt5ReEP5MK2m5qkot3WHQF3UH4TxtBeQrkpbVjCL5NmSzeqDMC5mhVYfe7Ocd0ROZ2HgQqTN7GqGoUYDSsJ2tXJlQT3ZFpibwkF0RowdZPuWQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=XuwfK/ng5aCDOWIO5kvlp+uTtdZexMWrq1KyMsJALgM=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=pQwUv1ns
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: bump to version 1.23.5
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 1/29/25 20:40, Christian Stewart wrote:
> go1.23.5 (released 2025-01-16) includes security fixes to the crypto/x509 and
> net/http packages, as well as bug fixes to the compiler, the runtime, and the
> net package.
> 
> https://go.dev/doc/devel/release#go1.23.5
> https://github.com/golang/go/issues?q=milestone%3AGo1.23.5+label%3ACherryPickApproved
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

Committed to master after marking it as a security bump, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
