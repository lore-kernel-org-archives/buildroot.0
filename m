Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BAFE77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 21:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4441380492;
	Wed,  8 Jan 2025 21:37:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M51JsEmpxFET; Wed,  8 Jan 2025 21:37:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A9D180493
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A9D180493;
	Wed,  8 Jan 2025 21:37:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 513901FF7
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DF9E40260
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:37:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ERnVXRDWBcfi for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 21:37:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9274340146
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9274340146
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9274340146
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:37:26 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -436523377; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jan 2025 21:37:21 +0000 (UTC)
Message-ID: <250c0879-722b-4739-bca9-a5f4c7d6ec0e@korsgaard.com>
Date: Wed, 8 Jan 2025 22:37:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
References: <20250103201747.3749714-1-thomas.petazzoni@bootlin.com>
 <211624fb7afbbb83eb709499c2f37802@free.fr>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <211624fb7afbbb83eb709499c2f37802@free.fr>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=cToHR+2A82d10M9l0GBVOvwYAuJ5Yvzng7A3IbrUDsquEZdwG+/GSCB0PB0T9hOXwVvTq1lbxHvR/+uKpjLQbfpVLqtR7VRJJAckcJkrzFmbJNZ+/kpNrRSmkxJP5stxJuZfRZjoUkDfoWKV3/UyXTVNP6Q9pVNAJJaVuMyFj+d5gW8nmMUt1/QRsMdO5zJUvHCqbTecnyk+vTxZxQ83KhWlWo6l4+EMYUvx3Gka9hIE/qXJh8aT3Mfxw4TMQ+cvp/y/oAgj+b6iIV5j5ssPCtpaAi0ILINk1xGQPVV4Elnoru4xn/oM5LFNFPV8rv7YFnclYQ5wVj6HZDC6zP4Aiw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=uDrxh/mD0mLVY5VE6ufl2RwcohIOnK6CKAlJzWttYFc=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=cToHR+2A
Subject: Re: [Buildroot] [PATCH 1/2] package/pixman: backport patch to fix
 inlining issue
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

On 1/3/25 22:43, Julien Olivain wrote:
> On 03/01/2025 21:17, Thomas Petazzoni wrote:
>> pixman fails to build with -Og or -O3 due to forced inlining
>> statements:
>>
>> pixman-combine-float.c:370:5: error: inlining failed in call to 
>> 'always_inline' 'combine_soft_light_c': function not considered for 
>> inlining
>>
>> The first occurence in the autobuilders is on May 12, 2024, but the
>> problem already existed before as we haven't updated pixman in a long
>> time. Therefore, the issue started occurring because we started
>> testing more random configurations.
>>
>> Fixes:
>>
>> https://autobuild.buildroot.org/ 
>> results/2f3df7961b3181d9eef79893439ae7ebbe4415ad/
>>
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
