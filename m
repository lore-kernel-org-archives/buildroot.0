Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2ADAE77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 16:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E62D80572;
	Mon,  6 Jan 2025 16:00:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VPyEsfu_u8GO; Mon,  6 Jan 2025 16:00:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70AF98056C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70AF98056C;
	Mon,  6 Jan 2025 16:00:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A17C669
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 16:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DF484055E
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 16:00:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k-ia3f5uVNxZ for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 16:00:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 02B8340569
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02B8340569
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02B8340569
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 16:00:36 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -463279142; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 06 Jan 2025 16:00:30 +0000 (UTC)
Message-ID: <f08d3efa-3c45-4b7f-a776-50ec4865463f@korsgaard.com>
Date: Mon, 6 Jan 2025 17:00:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20241023213643.915658-1-ju.o@free.fr>
 <20241229225244.0922292a@windsurf>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241229225244.0922292a@windsurf>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=nkLBPBYzRPNYWKvqXME6N46wCGBWWKzRe3oO0cltO2oVgajStzcnVkwVHPBcabHpfF2OdQ13XjVCPdc3R0FKsM99gU7HWJZRUQII6qcXaBiTEmeXYVLjNJlom1jUK78MlJ4N6/1z8N6jDJI14NEqJ1zX9MUdnTNYrkIAIn7kt/MQwguZ8X0VGKMT3mrvK3A0a5knbkICFTRuFFe43Q5k/KTf9tIRuGie7pyl71zKE+UwpJ0gzIxm8n5f9Kh0ysBjk6Ljd5cJFy2LekNEew7HGeRRkyVRfp3cg5fxvmbJ53BukcJtApwt1TbDlr42b1C7VvUEyhR2B8wpKBeVxa0T0w==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=d/IvvT7GTlL1CEL0O7MipLNS3VIsPvN+wJWdK/8tBb0=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=nkLBPBYz
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add dpdk runtime test
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

On 12/29/24 22:52, Thomas Petazzoni via buildroot wrote:
> On Wed, 23 Oct 2024 23:36:43 +0200
> Julien Olivain <ju.o@free.fr> wrote:
> 
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
>> ---
>> Patch tested in:
>> https://gitlab.com/jolivain/buildroot/-/jobs/8169488724
>> ---
>>   DEVELOPERS                                 |  1 +
>>   support/testing/tests/package/test_dpdk.py | 46 ++++++++++++++++++++++
>>   2 files changed, 47 insertions(+)
>>   create mode 100644 support/testing/tests/package/test_dpdk.py
> 
> Applied to master, thanks.

Committed to 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
