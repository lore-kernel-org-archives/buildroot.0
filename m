Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D443C61DD3
	for <buildroot@archiver.kernel.org>; Thu,  3 Sep 2026 22:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9107F60B85;
	Thu,  3 Sep 2026 22:03:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CINjLkSMuW0s; Thu,  3 Sep 2026 22:03:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8CE1860B6D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788473001;
	b=gAvqhLErhI1XkMayjD2BV81cqDRiW7t9lrE+O0eDWvRdVxL16wgGoMuTEn41xNzt1rXN
	 DvjxOzFMfnSGBQQM7dKIvH68Cs6m6VSfDPgmmN9noPYMEJVlmlwiqzQ8ot1t+tGLyTINO
	 M8uYhofDhak2UI0bMCWFhFA/SuRqI+Bq0NedSt5r967eiW9JCowtZcvr3bWH9pqhTdnmN
	 /zHcTo7TwkluvwXpWNrKJH2k1+xkt1FTyRFoPWAKHQC/JFv/Yv5LQbptf5iyMN4Y1Npjz
	 Y8H/IQJ2v+qWiFGkv8IeXSLKa0Q+c6o6rczY7DbKya/zoNHKq66YrFlCT/n3dypYXXw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788473001;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Egn01eDeuH8X1UNH+nTdWi9fDwJWhBaws+SRZStljM0=;
	b=G14eiL/NWMjH7XDpyhIAyB68lp1/oxHdErjH5aymykbdEdbtduymnXm3tu8DgLvAf88r
	 7fwq7hGHb0v5H2nTCMpcxkfrvdox5sXA7AibrI+41WuVYFo7wxuZZlfPkBnGkOzGeExWb
	 1YBnsH1ufTmGVJrqKFZv+yYNRVi0StOeAaPOQhYBnv8N+1Fpv2LvsZ+EP4I1WXiNlykpt
	 ph9lWJb1neNkI3H2oxbtdQNjOgNNCq0r1ym20k7E1UCY7SeIg0EoKDAG0r2wmk5Nkl765
	 vMzqWaPv1zox8L3hI3Se90TermNWDzVCFIqWxLQbWdpv+7B3LKQglUO7KohN6KSgfpQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788473001;
	bh=Egn01eDeuH8X1UNH+nTdWi9fDwJWhBaws+SRZStljM0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IkhFWj/yeB5NbV93qJ2cchRC+Vlza31iDl2f78Dk0W5oMrwb0QUgESjTOu6y5H0ij
	 FeBmsYbkFqW9L0bpXtoSreuFVCkP0wxfqMA6o9z3HpZxVyexuyynhqLQeUuWZbGyog
	 nIdgGQ//+3ItUgbmWWxDwCJBkq2TN2m+l+1Q2AouocMkpaGdjKucgRaW5x83QQiG0m
	 ZLuXXxvckZF0dtYF1GYI4xeO2WE7l5NuK2LuBKymBTX5KWGq8sjQhpKOOPowsle3ib
	 z5nwk+sbqIf4heTMo8dvN51sY/SUmnratzRRCbMErXqVG1rXvUKI7YKyHuE6VmbPev
	 Xq+UsErEOemvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CE1860B6D;
	Thu,  3 Sep 2026 22:03:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3589E265
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 22:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2708060816
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 22:03:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SRPJK7qlh7HL for <buildroot@buildroot.org>;
 Thu,  3 Sep 2026 22:03:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 329FC60B4F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788472999;
 b=crBQYzFRXYQs8OcFEVwTS1XRsyIbqCCIflMq8TyC3RNoEzObuOK+9/j0tYVp/L6XAXIn
 Rjpblz/0eALKfBRLxq3xepRbb5DEbTSTOo+qCVdVHBJOrqN3KBQdIFt4ObO/qZ+59ge6K
 gwRF6V11f+HDbTpM0nO/KkDNfAhnRUGyxAtl4AZfax8+k7O91KzuevRmuZuWB0sKBfklF
 /ZmnmgXbkQpiYU4VH3wgu+kyh3kszFYCNjKF0PZNfIBLPcb5Zxe8VvxCltWXJwtQN5YCY
 w7PtidFy+/6BoU58eXBdf69ltdGHRUmj0rZhrwLQFn897tEQylPCv84WFsdAgioP7zQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788472999;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=U0NmP4FOMUEQd+QKUS06RblxuVhQkKk2jach7SmGPV0=;
 b=hioUpQpa1BMVpdbamGzzavK/l7t6nax1+VTgj+TbH9h8AOgvexamQ7+mRObP0c0lvpbr
 0Mwyj5FPqNxJWIcMKSvvGKyBhgYdYgvmYwVz0nVz0616f0Ob9kkMBp3LRPeRZZ5yNSOO0
 6orQb683T2j5ACeQ6LVk2MnatjrrMdcpwvz+O9tdc9Ncr23+Kv7x8ybxqzPx9RoEdbgIS
 Ki3Cb7XN3M7YZnDa/DjmbYCnvHmnLoQd6pzWcv2CKKNv4pu8vzB+xwZVoJopHhKqAEqbG
 W2ZjBbIAhFNAQCdrp9Chs3eDy9dkW0ESjDke6XZ/Xxha2986iZk1SKwkqQJws23YGiQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=GjcZ8Qnb; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 329FC60B4F
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 22:03:16 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mg6dy-1wNxx723uI-00oRcr; Fri, 04
 Sep 2026 00:03:07 +0200
Message-ID: <ee8ea917-def0-448c-9555-a5baf2c654a9@gmx.de>
Date: Fri, 4 Sep 2026 00:03:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
References: <apBarq7is6OL_UQu@windsurf>
 <20260827173328.8765-1-thomas.perale@mind.be> <apCa75D8DdbyTwPo@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <apCa75D8DdbyTwPo@windsurf>
X-Provags-ID: V03:K1:D3KFWDigJD/p5WzpDRmHuJa9byEz0Y1mezFyegsjj5ZAiwbMMmi
 k+fR0hyXb0w2pXXvYa9L04ZUg7ML/r5T7uzQcKyzo7oxpKDoNDlfZ3MPAViSWEtaav1GqRx
 GZmSTkEe2HMRoiRRAV9NckjMFtVfATt+QfNkBv2Ujc13mOjvzzYmBXK1f0aunlX1A5O56i4
 xC/TTMlxN+O4JgZ/1+0AA==
UI-OutboundReport: notjunk:1;M01:P0:ir/PpnxHl0M=;11NDyi1tGOSj3ZF23Yv6SSPPrzZ
 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
 Ec+Oq8yUxrJ3usyjp/33LO
Subject: Re: [Buildroot] [PATCH] utils/genrandconfig: always use
 BR2_BACKUP_SITE in the autobuilders
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 27.08.26 um 22:17 schrieb Thomas Petazzoni via buildroot:
> On Thu, Aug 27, 2026 at 07:33:28PM +0200, Thomas Perale wrote:
>> What I'm afraid of with the HTTP header solution proposed is that it's gonna be
>> burried in logs that would be quickly forgotten about. The current solution
>> while generating a lot of false positive manage to catch some real stale
>> locations publicly.
> 
> True, but it's also generating a lot of noise.
> 
> To be honest, I am not 100% sure my proposal is the best solution, but
> if we're aiming to reduce the number of build failures, dropping false
> positives is important.
I haven't looked into how the autobuilder reports are generated, would 
it be practical to separate download errors from build errors? That way 
download errors would still be visible, without messing up build statistics.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
