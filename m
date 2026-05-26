Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F48CD5BB1
	for <buildroot@archiver.kernel.org>; Tue, 26 May 2026 18:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEC9580CCC;
	Tue, 26 May 2026 18:19:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q-QHddUSDCBh; Tue, 26 May 2026 18:19:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC3EE80C80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779819570;
	bh=y0mA1CgvKOugKYyy8qL9O3iGjyxVSM7e/7wr5wbmHTo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lGPqVtqJJzrFqTAohinQzgu3/B516r7ASVfh6qGIA4y8NBlZqY7AXkViknTpnPhqy
	 1OguMG/ztzZ3qPMHZfV9qvUdzd/9z/cPRi1rNeImwbaxzyyBMM7iBsDByQOInsOqa+
	 Ak7M+kEgp5G7ZC5V/m4HIIC+jNKLKy+julOOwpA3uVEHl+A+Bcl0gRymzXH1dxY2+l
	 zQHfH3teE2uXa/jannd7eDFTt9RZIrTf/xyWr006BJETuQmUV6ctBZX+aXFlPx3Tma
	 U+Lz92wwmDD5G4G7LM+oGLAzW70PcvLT6hi+9zYhnqK0/xrFwAbjiit4oWBjTrSO4v
	 QLKW0RFCKeWew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC3EE80C80;
	Tue, 26 May 2026 18:19:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C6A2A21F
 for <buildroot@buildroot.org>; Tue, 26 May 2026 18:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3B4D401E5
 for <buildroot@buildroot.org>; Tue, 26 May 2026 18:19:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P9IP-Asla1TY for <buildroot@buildroot.org>;
 Tue, 26 May 2026 18:19:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E914240159
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E914240159
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E914240159
 for <buildroot@buildroot.org>; Tue, 26 May 2026 18:19:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id C18292003B4;
 Tue, 26 May 2026 20:19:23 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 26 May 2026 20:19:23 +0200
MIME-Version: 1.0
Date: Tue, 26 May 2026 20:19:23 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260526175149.1414751-1-bernd@kuhls.net>
References: <20260526175149.1414751-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <5657fce1ccd2a08adc0e7f00ffc0296a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779819564;
 bh=6MINwMWxtKobd67XXirx4CDnqU+jCrVWQsHfYV1+n+E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nooBsxjjg5kItZw41jtWLq5+iOlBsz5nRwNO6l77eCg6tKGZJ860OMVEZFexSCl8q
 A9oFEWxxnjEBLFqOP5YuWwSI0QmawrjJxzrR1ZsJD8yRhaoKWgnYI+NAQ8ViuAsilg
 RrlIjV0yObJcWIGGBzmgvg5+J2crDhZsKfKQz1kjj4EGmCFXIl7M6II1Jz+GG6duhd
 k22FRl8kc1fW5/rgXWHxLFJAASoO2r4kBhsTRKFPebVcAI2Idxq8CjkWeUWVsf0mAG
 UKjfCCwjCCnxad70foWnRmAgY1fbEdHYYikgZmwTDJXEqEveVNSKXUUhUrmLhVZQI7
 40008QNB4AxGg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nooBsxjj
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: security bump version
 to 4.24.3
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 26/05/2026 19:51, Bernd Kuhls wrote:
> https://www.samba.org/samba/history/samba-4.24.3.html
> 
> Fixes CVE-2026-4408, CVE-2026-4480, CVE-2026-2340, CVE-2026-3012,
> CVE-2026-3238 and CVE-2026-1933.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
