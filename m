Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F804CA5FCE
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 11:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AEE4405F6;
	Mon,  5 Oct 2026 11:20:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1UqeRcK1Iw_G; Mon,  5 Oct 2026 11:20:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DCB4F405F3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791199225;
	b=KJu1NWyTkQamVHmqjfSLf2Pbz4thbEcQKNOjPyjUPsLWgx25shoOfRMcGrWBnWZfvS4U
	 VnU5gR3sTMoEXK2ef6AcodXLCMxjutXaCfd9SgLMu6XR6tJICxSIGJ3UMAhzAzcgJ2rvt
	 iGZ3f4mfrq9pSe+r+iE7IUkaHid9YQ+ANSAGWux7TR3xIaIYPwt61Y5nt7r1jeeyia7cw
	 F2/X7D0n9I3LtNKbyiX4SWKnVX5CJLxw9jGyvByRD3S4J4VH6hopF+s3YpOQ5vxzxLqpX
	 KGYuhP5l2kB0FjX0kQSJ7eCAPYRvmHH4iVmGbItM1m1Ysn2R4WKL8gKIcPb75tFm7dw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791199225;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=4yNPXjxfozFBIoq+1lcmkqrN+lurNcVQ3/0VkdsBcwA=;
	b=fpo4XDeRNC/piEuVNUwdow+2GyYLDfkhEq2R8W8qLjtUciAgr/macAzFg+WaWYAGbTep
	 ml3lhgOuUWpcZwzZwNTqisDmvYpjhpRQvLn/LiYxahHzr+q+7OrAWEih8JV28T2OjZVI8
	 Z40L/4JgQ8/uskTh0Adm/j2En9qnlKE5CdoioX53jA0xFet0OUDdp4hW7bntugeAHgAY6
	 wD6TB6Og/2r/E69dPdOodjy5PqbZRJSH4qlKrIQG1lR/se3WKyRq56p036GBZWB3ldUry
	 UNs4Wri9qJqkAF2umvy0AaCPtvWtkGZexMG9TehAOLrza/QoGV1ATKOpUHhApmLUptQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791199224;
	bh=4yNPXjxfozFBIoq+1lcmkqrN+lurNcVQ3/0VkdsBcwA=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hl7ejbNobCsR9VdFGxvpPfw5yC1rrG8EaP5nEO/8zS56v7piZdAU+NjuPpSczR7yf
	 hVWogF0u/4ZeGHF7aWHWcYb8Ue0cAqetA0fnu4Qe1v82eZOmsyNwB+OaXWbGwlRJcZ
	 azTIZD56gbWBd2yhtlfn6YxI5H77Du124nc9kfaOjNcmBIyM1TO4LrlZENoigSsPzq
	 r32zXyjSOM2ODzfXy8yVNH/bfEDlDMhOYAd6r55TYf9b+q39Bqfhnwhls05yVDeof2
	 fJQrcnWBWPPyxlqsE7bpkKcwIwqEgNMPP7AsJxhS58AZ14afoVwYX1qDztL5nGAvqb
	 nI8H5xnlu8cgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCB4F405F3;
	Mon,  5 Oct 2026 11:20:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EF96282
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 11:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 050C660611
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 11:12:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W2fjHh2Rs4QJ for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 11:12:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B1DE860606
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791198728;
 b=A1FZaKTOmZwmBgAjx9zgjKtS0MtbsqCbXJ0CbdjKULlk3Ezb/buf5/onTYPL6K6aMPsT
 gnBPyq9ZVoH3nzL+c1g7+loYhVuOav9X7DwG87bPbyjyydS95Ox4uqRlpLWXuC+hyB3b5
 3KfryBP3KXfNab3+l495BmHQZKtbReG+srE7lr+z2Eo6tGGnrWq2r8YLSSlovyF/gD7Rl
 A+S8NYlRKiFh84nBuqadDplnmT+b+Evmm4YdE07Trq6NYCUmxCHuVl+yXmqYeKz4DUetX
 Ud+HmGvdWcyOF9R98fHNTBX51rHmU3pJpBYpxOhJtG4RwBnf1ELoYb/IrIbWtkm7IOg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791198728;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=j0Hng30ot7gQexKpg+vXB7AEo+MHQ90C3i1hoJ7IUHE=;
 b=bjGNf5/Kn21fiZcz5ptNXhQHXzubKJWci4fVuCwZ6IEbhHJ9LIm3MYGpeziklkGAuRP4
 h0V+tVBjNSrmh8aU6F8tq/cE53Y57ThwcdqigAbrkS4+AnLA90xxQ8u2wokYaZWP1u/ax
 PxaDpzsJdINhzpYVXsKAm5Xg+tkilCcWjopyJ6TPVGKZEShpfv6bElBkVxr+PEJPK1oTq
 h1aDoFGHNsxfezW1fPnDTrc03AGVnnpdHmV2I/NVWmURv4RYJQQSHDoPUlpWI6/mt9h3t
 P+MahClJ3gLyaBfYC4i1MEDDB0J8+7HuyAC0A/xzHummijcqWVic6jyS6C6kadOH0bw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=Rgrlf+SQ; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Rgrlf+SQ
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B1DE860606
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 11:12:05 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=Rgrlf+SQjeXCrrmFDfhhRz54yV0EhghAMk5KcrKFKbi806RbBepcuaQi5x2PFI6zUAYnD70YPIvT5L5/hdz2k4RNeWyYjCsO96EsQl9yunJ104V/68F3PWcdzLF67+iKjzM7jo6ONohCBZxOWVYgSSJRNBT+3Jg0sK18faFa8Xq6xa2hBaWCIc/oeX+NYMFHkcT8Gh0YmPMyiHaZBfbh2/s3HkSf4bxqCRLDHceietofaBFvIwbSEibAwonWiSl3CVs/MXDHTkl+of80E1GQUjweanNePiSXh8d3Ui8stSGAFI2kPvkyz9zMtfWUifcX7Ps0u84UCSzliFfTce5vLQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=+2U7mafqgCdlrQNv91VFiVY5EVybyfUlAXbrg82jIN8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2140608217; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 05 Oct 2026 11:12:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xDgbu-0000000DgdP-3fyJ;
 Mon, 05 Oct 2026 13:11:58 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261004080211.2996307-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 4 Oct 2026 10:02:11 +0200")
References: <20261004080211.2996307-1-bernd@kuhls.net>
Date: Mon, 05 Oct 2026 13:11:58 +0200
Message-ID: <874if0flkx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.412
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > https://github.com/vcrhonek/hwdata/releases/tag/v0.412
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
