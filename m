Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5C2CD98E2
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 14:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A08B6F79E;
	Wed, 17 Jun 2026 14:37:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iGTa8U0JrV8l; Wed, 17 Jun 2026 14:37:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2B8960C14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781707024;
	bh=q1i0/ybc9CklK5mpdeU1HeuswYMLBUXQau3XuGi44Bk=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=jA3ZP2L/uxeOWsq2RjXdsypZez0S4lf7wKoE9kvzQi4xlBwU4yNeDHZtaLJki/4Xq
	 fzJnzM2bsBRqS01kLrHuYxc1R6k+MLg8JADBHERazSQqWm4Bl3wzwl8YIpjdq4hpIK
	 ygM+v6gZC5bnFRv/9st2FqhzViuqDjlUoW2oB3QyQ/VYyFgZ2fcXfpZBod/vC4Ipaq
	 wJjXOg3x92Zr4VwCUxbaybAwY5bLvpJpoXn3iQATAZeWi2ZNRRl1X/3vW4wchjK4pB
	 OTj950/oqLmiuSaNWbCTzNOyNZ1KrL7uUDFgZjSOjJJHXwC0NcgQuobFw4g5pRZNZD
	 1eIYhPvxoJGHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2B8960C14;
	Wed, 17 Jun 2026 14:37:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C9431D8
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 14:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBE1860C0E
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 14:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xHSc1ErZvBPz for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 14:37:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8C08160BD6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C08160BD6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C08160BD6
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 14:37:01 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQv8n-1wnwQn3Kjv-00Ox4v; Wed, 17
 Jun 2026 16:36:58 +0200
Message-ID: <ce73525a-8120-4334-9054-48bcc6aded13@gmx.de>
Date: Wed, 17 Jun 2026 16:36:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
References: <20260604155431.886607-1-fiona.klute@gmx.de>
 <c728372b-fcb0-4c06-a8dc-db5dbe102114@bubu1.eu>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <c728372b-fcb0-4c06-a8dc-db5dbe102114@bubu1.eu>
X-Provags-ID: V03:K1:LGVzx0ovTa9z+0sadMITqT4Nt7HkwFFG1vLx65B8A8M373iktug
 iuDuaO3KKGZtOHmbe5nX7u9EqK8zIGC2M/DyVYPlC9JKC4B2mzbiwKFG7vysefwxjlCD282
 4DKiieRCoFezql7+K6JsjiAyTtdaihcAn0Zi3+OzUJ7MFHgS5sjX6EEUSjD+Wt2hsJL/FSX
 rVYdqnOX/NwosPtYzUl+Q==
UI-OutboundReport: notjunk:1;M01:P0:M7pemSKGu04=;FhBwONEbN2yGvgHinyVHU6IBUiI
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1781707019; x=1782311819; i=fiona.klute@gmx.de;
 bh=S1W8CvAbEBaeA579x7Ss/nKYInLFRiQ878ftDA67eK8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=pPxN3VXqBmjiMgDpeCXW1ycdipmiFfqZODV3+dN2mh+ZepqSOyBiOgh3dD6wnNN+
 lz+d/OQgpsvP7Fyld2OH2L04eHC/D+hhGvrYziLDH8v9AwOdDXQGyjAfE0+RcgcFo
 fDDL5F9dogZOZ09w4RgzWc0AH8LWoeQVfjmgeVpI2ACvLsO2l3qo63tmJS+E4unXq
 Y2EF6lCjQWe4kEemV4PSc91dDu4AAuXn1RL49jfn4BsobA7TVdbZ1TirylnNX+/hS
 IfiphVjnKijGl4zZVfeEA2Moih48N5WR5RoN9pd9oEmt6uTxRA7vLvnq51sUpcZ0z
 ucshtxY07cv9nCc1Vw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=pPxN3VXq
Subject: Re: [Buildroot] [PATCH next 1/2] package/iwd: install upstream
 main.conf
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

Am 17.06.26 um 15:19 schrieb Marcus Hoffmann:
> Hi Fiona,
> 
> On 6/4/26 17:54, Fiona Klute via buildroot wrote:
>> Note this changes EnableNetworkConfiguration from true to false
>> according to the upstream default, users who want a standalone iwd
>> setup which handles DHCP will need to adjust the config. 
> 
> Could you add a short note to the manual for that in "Migrating to 
> 2026.08"?
Sure, I've just sent the patch with you in CC.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
