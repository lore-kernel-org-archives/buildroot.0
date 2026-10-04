Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C40CCA5FEF
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 460E180DB3;
	Sun,  4 Oct 2026 16:11:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZbiacVY4yi_r; Sun,  4 Oct 2026 16:11:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8979080DA9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791130288;
	b=M9GoT3+lD6XDMiduDEqU2asgDSGWP8m4VoXfbyCZbEmAL9OvFHxiAlG9h5cvl+vAmqyG
	 jdH5+z4IIgPadxAjCCU4wDh4M+ASoFP/WuADT8RZOifscL5T5vtdmJaPgJW5FtapOIhs2
	 jMHZQOAK4nuBu+RMQUKdeYBTU35Me/pKQK4xdbx6s8PJPc80nRR3hp9eK+a68OMokZ348
	 qCSKnyW1niv0VDxFzd7SdeE702iSUVfCieJq5xIrB9kLrNyi9YvTXTKFV58yLD8TR0jsm
	 gTtL/twN40cMPSobyi0I44dYBNbsn9quhNwr6zpnIpTDjsX7nZywc14Tnmj7kYMQx0w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791130288;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:In-Reply-To:References:User-Agent:Date:Message-ID:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=V+188RWbIf9BepWb45YhSZM7YaX49+tgJ9zTBotE/nY=;
	b=GISxxwHqeeOQK4m5IEoGQ6nGdeYMhHD0AJVEYXzJtIkVGCMfARsHtZzHma2z917jJVbt
	 T7fsZlvEkmD3FQm386LqCC6W4K30ClY+x95rUPb59kMAxAmNcVKD7gqDiE75SCOcoU8VN
	 tf9fBt7yzEPPfVPe1q4fxf4eB3bB2TjiA0NIU5Xht3raDVuQKd7KbuyD1BNuCSstFUnP3
	 bJG34Y0uAxzXayrdatio4oGjWwuyK53gHq8KCa5supZqoQ2cuhiBUzebBJB+tB+dJlaDS
	 9oHcoG/NLIpZYvQVGmy9j16Vm6SL8Y7e7y5A2H9GpJsXlAp+3qaLZUls7bnWj23GeBA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791130288;
	bh=V+188RWbIf9BepWb45YhSZM7YaX49+tgJ9zTBotE/nY=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JuOtswpDhu+lLRbnTOg53lKcJBdPjOIK8JH1xScQTsKIxJp97pnwOpkw2iSMCktpL
	 3/xG5ETyStb2DJVI0AY0oKZ/f+Mf1zD3gXW0ffc8fbP9JqzgQCURfnTdSPDD5k6fyb
	 BIRLeLebP6vfyYyAEw82PWtCkqrxktLe7JXvCsIvZ1C1H5D/HzQg1Iz01OcClkbG8n
	 KJJD7G5AbqiJk8WgAcjt1g6Ids/uB/wfSSoXclub9wj8L4thwiBrScJoHhNPWDJr0/
	 oH9PK2Iyfa6LiE9oBBj3w07gm7JJMDeyeYJNOvKHusjJe7BhAx/uU0hkCIZMi3w6ae
	 sNmazavhfWudA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8979080DA9;
	Sun,  4 Oct 2026 16:11:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 50E982E0
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 367DA40068
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:11:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PIYMDSxggrRW for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:11:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org A059D40049
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791130286;
 b=mgT5N+4ez19YO5lx/Enzyc27/8YVrPJTmxTRL8bU6jdK6im7o0avVe5f8P14Exc4PPij
 DbYIZ/3NjkmlBgmv2/TQVtYggfEhOIoURipZhhVmz214QqunXlxGYpXP1xhaBSb3kMFU2
 J0ocKmSdrV39wgr44MyMKJgi1lt2xRAzLXpmCT41fpm5y8dYCu909cNENeTTMkHd5xOwr
 0jFMSCq4cVwoMu67C8Jy+RYDsI2njsntOY137/8bWRrUmAN2AwCn/vrKcjaJNYTSeg5UT
 SBIjIby+WUd4KfAlRr2BGE8uxDaAoXhbpeoKCFH84AcZ0jCQQpsXyPfmZhDGj74RAIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791130286;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
 References:User-Agent:Date:Message-ID:MIME-Version:Content-Type;
 bh=7AWUban5sIawCjYjnofwKX86wFsonN6DvfQGR+kWv/U=;
 b=omWZRVnR609H6OPS0YoHQe88mTwfF8Wt5IgVgifSjwI45qvUGG7we2uC7jC+SKawOTVo
 haHo1z3B6cXUhqxZ1cok+ZsRB4E2byHRqm8h3gbbXFnKqHqwimZWBD/UBOCVs2ecTMcSC
 Qi+LbnTMjnkGmAtaKwvGYx+aQKzU50Zz36eMrtFZdfl5aXSKE7y/Tx6cTsZ8+PXUaqFSm
 L41+6haQyI3TcZ1qbxOQIVokbmhk3i/PsklXBpB203AeyROLZlYp/Hiu4I9ULEVOkitfh
 DXdDptLq+d2NCAQfDYZ/6xbuB0wxYcBEeXiW/O8Vzkl7Oa3QjbqCmT7EWRsefHtdZ5Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=tkos.co.il; 
 dkim=pass header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=FzNEWQ5d; 
 arc=none smtp.remote-ip=84.110.109.230
Received-SPF: Permerror (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
Received: from mail.tkos.co.il (unknown [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A059D40049
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:11:25 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id BFB51440846;
 Sun,  4 Oct 2026 19:10:22 +0300 (IDT)
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: James Hilliard <james.hilliard1@gmail.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <asJ4XGMDm4jGCL4k@windsurf> (Thomas Petazzoni via buildroot's
 message of "Sun, 4 Oct 2026 18:01:37 +0200")
References: <20261003210833.735937-9-james.hilliard1@gmail.com>
 <asJ4XGMDm4jGCL4k@windsurf>
User-Agent: mu4e 1.14.2; emacs 30.2
Date: Sun, 04 Oct 2026 19:11:21 +0300
Message-ID: <875wzh5tue.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-librt: bump to version
 0.16.0
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Tomas,

On Sun, Oct 04 2026, Thomas Petazzoni via buildroot wrote:
> On Sat, Oct 03, 2026 at 03:07:59PM -0600, James Hilliard wrote:
>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> Applied to master, thanks!

Not in master as of commit b12c9294ff536 ("package/python-urwid: bump to
version 4.2.4").

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
