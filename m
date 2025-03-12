Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BF8C28B28
	for <buildroot@archiver.kernel.org>; Wed, 12 Mar 2025 21:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D5C860B77;
	Wed, 12 Mar 2025 21:55:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CPQLYndAk2km; Wed, 12 Mar 2025 21:55:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D00F60BC6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D00F60BC6;
	Wed, 12 Mar 2025 21:55:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CF731E1
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 21:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C6E64063B
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 21:55:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6kW6K4jI0QWn for <buildroot@buildroot.org>;
 Wed, 12 Mar 2025 21:55:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B1A5B4062D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1A5B4062D
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1A5B4062D
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 21:55:29 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1564905149
 for <buildroot@buildroot.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 12 Mar 2025 21:55:25 +0000 (UTC)
Message-ID: <13604c3b-5b40-41f1-b25a-b83aa00cb6ae@korsgaard.com>
Date: Wed, 12 Mar 2025 22:55:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <3fcf016f-79cc-47f6-8b53-5ae85448dc20@gmail.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <3fcf016f-79cc-47f6-8b53-5ae85448dc20@gmail.com>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Jt8tkM/ZIUV9irvxFYDFGv3Q5iBcdkAztEsbZWs5W78UbqbMxJaeI4wSpDjeLOmwCxs+Pdnv5PnOyRKWexOnb783gsmbz2Co3nRUUJ4MKYODnV42WNYc2vZzZIL51bq44WlToWXNoOfWnxxgCRPdG6KXPFwPIL+ONVsNljpBy07lmq/x8qXTq0AJulp7FXXMM3bRuNqD+cz5KWXqKn1NgqAQQm7smV+tYneg+Y1paFZjPEtwPWCzba2njITEHpU8J1EwTM1V2DANHKyAE7g7PljAIBYmP/aF2NifRm3HQzoYDXrDTa3gEjNwqjEVFxSUo5QaT2BvQtgGUXt7DPIU0g==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=vOKtJ9Dev0kC1M4/FUvxMLtb0sD+47t0Em4Kd16al2U=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Jt8tkM/Z
Subject: Re: [Buildroot] Typo fixes
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

On 1/6/25 10:07, Yevhen Babiichuk (DustDFG) wrote:
>  From c9aaa2724ff49ce768787f76291cdd599e4ca10a Mon Sep 17 00:00:00 2001
> From: "Yevhen Babiichuk (DustDFG)" <dfgdust@gmail.com>
> Date: Mon, 6 Jan 2025 09:21:06 +0200
> Subject: [PATCH 1/2] Host packages: fix typos
> 
> All the host packages inside 'Host utilities' use 'host <name>' syntax 
> while
> 'odb' and 'sdbusplus' used misspelled 'host-<name>' syntax which was very
> noticeable in the list

The patch is somewhat white space corrupted and you shouldn't 
concatenate two patches together, but I fixed that up and applied - Thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
