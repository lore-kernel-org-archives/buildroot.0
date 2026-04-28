Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B028FF886C
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 08:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AC6C40A35;
	Tue, 28 Apr 2026 08:41:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GsKYV_aZnrS4; Tue, 28 Apr 2026 08:41:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE86A40A0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777365693;
	bh=SNuwzM58ObOXFGDdQ/UWyBFex/Uiv//GNZdVp5gaZCo=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=ThwBqS7+O35Pj9UwVCRo1PXEuy5UXLfiwX+bjtr0er1JEbOU9YZpr2zmMxiFzS/tX
	 uHdJKvOLqqhCz2E2fUf4kuXKTgEUqWiiKUzlvVhArHtkxBCmgCjz1RBAJdCwSTY190
	 HlruPkrhMRneXJ6DrjgjcVKArTxs6YmW0Q1Y0DM2TzkPnc7ub9ZSuKvAwBspcykQ/b
	 mBrvZQvJpGOqgKrcehsodjPjn6a95Dd1Jv1XLgAHlbgKW3Z/22lwgCYE5tehX0srQr
	 u6vjUHLcZPS4MQM2TSWqsltAQ/tauJS9LOP09LbIaARkYha1rNU6319Fv49622RVYw
	 JN1FnihTAqaNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE86A40A0B;
	Tue, 28 Apr 2026 08:41:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B0B731B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 08:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 968FA83794
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 08:41:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CshMjBjFcArj for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 08:41:32 +0000 (UTC)
X-Greylist: delayed 333 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 28 Apr 2026 08:41:31 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9B68D837A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B68D837A1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B68D837A1
 for <buildroot@busybox.net>; Tue, 28 Apr 2026 08:41:31 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 74E112C84162;
 Tue, 28 Apr 2026 10:35:56 +0200 (CEST)
Message-ID: <f3ae04ca-1d03-4979-8469-4eb7d683d053@bubu1.eu>
Date: Tue, 28 Apr 2026 10:35:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Francois Perrad <francois.perrad@gadz.org>, buildroot@busybox.net
References: <20260427110007.71226-1-francois.perrad@gadz.org>
Content-Language: en-US
In-Reply-To: <20260427110007.71226-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1777365356; bh=ZT4EgzAWOXFhOTeZ3C0VeiTho5yOkX/b3dnM4+8/JOw=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=aYaAyI2IQmTPX+1+9uFiJ481b4vODglqa95x8t0Nvn9eHETO9cFLn0hipOu25G8+p
 S6vLpW9nrO1zHpDCScKYsV10S1kX4fApIu4tz9SZd0KroQ+0AQphVl1JeDaF0Vra0C
 6pnukZabHNvmy+xOenDD5wbXMXByMtfvThGfgPqtf3esEXdtRrLEhHOTca/mA0b2Tb
 cGJn2QblnievT+huNabXTnbkR0AipM/EXPMzlq0MGolZHJIjVAgOqmT6v1WMQmHFs9
 LmYN44lxSUT5Q1Woa5/asFc2FK+6ck4+fUeC9P50f5Op9+8lyqgKumvD83A/ThNMoM
 VVPTb6qhl4iUQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=aYaAyI2I
Subject: Re: [Buildroot] [PATCH] package/htop: bump to version 3.5.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Francois,

On 4/27/26 13:00, Francois Perrad via buildroot wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
I added a link to the upstream changelog.
With that applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
