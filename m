Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69ACC3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 17:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A10BF41779;
	Fri, 16 May 2025 17:59:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y2ZUuqxHtmyM; Fri, 16 May 2025 17:59:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCB5D41754
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCB5D41754;
	Fri, 16 May 2025 17:59:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 320DE185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23A1383C42
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2E-0gQ6tb1yC for <buildroot@buildroot.org>;
 Fri, 16 May 2025 17:59:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 336A083CA8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 336A083CA8
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 336A083CA8
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1075A1C0E0E; Fri, 16 May 2025 19:59:29 +0200 (CEST)
Message-ID: <af35f5fb-e99f-4233-a556-7b4aac3766a1@rnout.be>
Date: Fri, 16 May 2025 15:47:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Baruch Siach <baruch@tkos.co.il>,
 Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Cc: Lance Fredrickson <lancethepants@gmail.com>, Bernd Kuhls <bernd@kuhls.net>
References: <20250415141711.1940219-1-lancethepants@gmail.com>
 <1e53f695-653e-4506-82fe-3ed97d468b46@rnout.be> <87ecwowyx9.fsf@tarshish>
Content-Language: en-GB, fr-BE
In-Reply-To: <87ecwowyx9.fsf@tarshish>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747418370; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=cRs7jYeTYgrhpkFBFBnuDjAnEOWo2zc10QhBbr93esg=;
 b=N3YG1DG/GpViyM0u2oT08h5ncyiTL6eEstqvt8tiHtcT5c0emzhPE+VSmUCZPpG/ypa9jL
 zq+3D78WnQUP8Gkmgav5vOjoFVn+SDp81YafR4jH/koUj0CbvkoXHipHXT6KJAM1n8VQDt
 RZQy7MbTWHCmjMjf4p4GYZTspPXQiZsM3dYR5erQBjlZAj/29y+6jqXay7ohft5XmKPtOZ
 RinemlAWItuCwMlumsfhnWoWvwD92SfgDlk2aiF0RvFEpmGFnCRbHPGBxqyn4j1N/1gSdM
 7az8IzeLlBQJKOt8pyiXGrIbHfa8rn8JvywhYSwSPvNIVdijyO+bQguihBPy+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=N3YG1DG/
Subject: Re: [Buildroot] [PATCH] package/dnsmasq: bump version to 2.91
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/05/2025 13:57, Baruch Siach wrote:
> Hi Arnout,
> 
> On Fri, May 16 2025, Arnout Vandecappelle via buildroot wrote:
>> On 15/04/2025 16:17, Lance Fredrickson wrote:
>>> From: Lance Fredrickson <lancethepants@gmail.com>
>>> Changelog: https://thekelleys.org.uk/dnsmasq/CHANGELOG
>>> Release notes:
>>> https://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2025q1/018079.html
>>> Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
>>
>>   Applied to 2025.02.x, thanks.
> 
> For some reason, this and all your other commits to stable branches are
> signed off by Thomas Perale. Is that intended?

  Yes, Thomas is the actual committer but he doesn't have push access to the git 
repo. So for the time being I'm doing the push, and therefore also sending the 
mails (because it's often a few days later by the time I do the push, and it 
would be weird to receive the mails if it's not upstream yet.)

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
