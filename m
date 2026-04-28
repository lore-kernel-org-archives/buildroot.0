Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B57FF885A
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 20:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DE4F40A02;
	Tue, 28 Apr 2026 20:50:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ncRT70Q-rPZ; Tue, 28 Apr 2026 20:50:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E65BB409F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777409421;
	bh=7Z1Dqy55l5XwA244AlRoMz6336Z+PzR6eCGadE+Z0zg=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=e1hVBx21I2415W/ZRTr08dUKG6Of5+dL+TYX0RIh8x9m9Sq74vZUWk+J2hZTQiv5g
	 1E+gwJQ7hfkHylK6oOBFcZ/UVJVQL5EtPOdKHh81OSzSzg9OXVZ/QIzWlEgIL1Xc61
	 9T5euylZ5r4qLHujQxRvcJ9K2A3yUSh2TUis577JAdV4+AR1KmBgou/foFZNtl8tSM
	 9fOzRua4TqXWTlBIl0J2MEF9l03EI03c26exa3MmV8TKJYYdMQJpCykVKnZFoEcnH8
	 wJtmMyeTwllPFAbdcpAsLGNEZfj1E6+t8xtVKuCpbtm9j8arfqgCg7RmFiEyUVx0mt
	 AzxA8bMpzorFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E65BB409F1;
	Tue, 28 Apr 2026 20:50:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A0C2523D
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 20:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9269C60BEC
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 20:50:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qYWiZ3JP1Wn7 for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 20:50:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 286A56090B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 286A56090B
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 286A56090B
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 20:50:17 +0000 (UTC)
Received: from [10.42.0.16] (ip-109-41-114-206.web.vodafone.de
 [109.41.114.206])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id BFCDF2C84162;
 Tue, 28 Apr 2026 22:50:14 +0200 (CEST)
Message-ID: <e3da29ae-507b-4148-8796-887e8408f941@bubu1.eu>
Date: Tue, 28 Apr 2026 22:50:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260421185527.2664360-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260421185527.2664360-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1777409415; bh=vcQzbatjoqde30nHY0k5LZLPPul13aLQna7MwV8cjyY=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=DczERY+Zef6q2M+IOlWrdGotuZISeGZhIF9Ud3rzYsZEsH4DlDNDv2b7wx1OHeeb9
 gPw1zBU58YYLyeVJt8Dha6SGz5hPhiFHYXNEsWgqje4/tBpndaEK0MxS/PmqGJ8lSz
 BBU6SNLLyny2W0s+ebT+KQepBmWcSlLwc7fITgve7RZFFdBncJSYj9w2XfNyiUHNkv
 L8F3WfIVAwPF7K4qu6NCoqjF1VSqBcqh0AF2tUt/T3TI0SP/sWpd3CYBgxhTODtVH1
 QEoRYTF18MTIG/zBDa/uhmFVeyFYgHctgznqiGLFXCi2wfkp0G5ssoCf4mPe1Fs2nV
 CipCyZTlv5ZVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=DczERY+Z
Subject: Re: [Buildroot] [PATCH 1/1] package/nginx: security bump version to
 1.30.0
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

Hi Bernd,

On 4/21/26 20:55, Bernd Kuhls wrote:
> https://nginx.org/en/CHANGES-1.30
> 
> Fixes the following CVEs:
> 
> 1.29.7: CVE-2026-27654, CVE-2026-27784, CVE-2026-32647, CVE-2026-27651,
> CVE-2026-28753 & CVE-2026-28755
> 
> 1.29.5: CVE-2026-1642

I think all of these are fixed by 1.28.2 and 1.28.3 as well. For 
backporting to stable versions, we'll need to split this into the 
security bump to 1.28.3 and then going to 1.30 from there.

Can you send a new series doing that?
> 
> Updated license hash due to copyright year bump:
> https://github.com/nginx/nginx/commit/7fa941a55e211ebd57f512fbfb24d59dbb97940d
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
