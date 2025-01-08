Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6156E77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 20:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADE5B80D6B;
	Wed,  8 Jan 2025 20:36:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j5gyEJv9WrdD; Wed,  8 Jan 2025 20:36:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D04D880DEE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D04D880DEE;
	Wed,  8 Jan 2025 20:36:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DD281EB8
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 20:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B2646083A
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 20:36:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 98W8Zt6tedyi for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 20:36:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 69C9D6086D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69C9D6086D
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 69C9D6086D
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 20:36:21 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -173400979; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jan 2025 20:36:17 +0000 (UTC)
Message-ID: <5f16395c-c4b3-4c30-b63b-4fafd0189c93@korsgaard.com>
Date: Wed, 8 Jan 2025 21:36:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
References: <20241229123751.639378-1-thomas.petazzoni@bootlin.com>
 <20241229123751.639378-3-thomas.petazzoni@bootlin.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241229123751.639378-3-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Cf9sKmeAm7Ag86h17bic1cpT9/Du3RwPGVoU+12WSt7SoqVQgWXRcm5xzn1tvDgZi2Cj4a2StJSQdPcosDoUv6OnOsm9wc345eNv7gYoueMG1D9WvI4Ks6WgEaIpm0xtZWjNDfFdMWfdOp+FZ9D0aXGNhrPow6iyud12ugT18rm5aAzKJqlOS0nfI761AgJdwvci1sR2bx9Nz+k4JAhy0urvk07o9CvyQ2okhwr/snJ/VszVlhpQLGwlSpwo6aH81UNQ3CWmEtVh4QW58jE0oqUkiysa2pIWD3qHNSaayqNY8hvr0/YgqmUO1P3i7e1roC/njS0hYHWOXqKfP+EloQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=vntYaYhJN5eWD30wB+0xLYXs4AhU9AshwP/38NqkN9o=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Cf9sKmeA
Subject: Re: [Buildroot] [PATCH 2/4] linux: select host-uboot-tools on nios2
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

On 12/29/24 13:37, Thomas Petazzoni wrote:
> In the latest kernel, U-Boot images are always generated when building
> a kernel for NIOS2. Note that we build the kernel with:
> 
>    make all
>    make <selected-image>
> 
> so the selected image through Buildroot options doesn't matter: a
> U-Boot image is always generated.
> 
> Therefore, in order to fix autobuilder issues, make sure
> host-uboot-tools are always selected when building the latest kernel
> version. We do not select it in general as custom versions may be
> different.
> 
> Fixes:
> 
>    http://autobuild.buildroot.net/results/1d4c249887bdd78dab40152ad3a4fcef16458a1a/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
