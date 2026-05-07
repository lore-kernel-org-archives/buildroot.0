Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FC5CD3442
	for <buildroot@archiver.kernel.org>; Thu,  7 May 2026 19:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2579A83CA0;
	Thu,  7 May 2026 19:48:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tU2IZBwcMS6T; Thu,  7 May 2026 19:48:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68DF983BEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778183288;
	bh=QTFmwVFgRgwB5u2T+dTAcOnRltUSLtDyilDLodT5Hfs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lEZElv7U9xOhB75GJyZvNgSaZuRemcUMJNg7ny6mX9Y4gGFvzgoObck8rEzCtFH0X
	 AGBOfqRytdxDMLOmTzChk07ItuhEy76N2oaqMZDPc3WuwZsnRzmWYIzQYrKnOT1sVd
	 MnqY3iTvpuE0Lt8RibkXG01yMieZ1y0WnBXL9pZBR659fqDmfHXLYy5Eh4Xv8Z1qa5
	 9+0enQA3hy8LTp7eeXTa/NvsXmL4N58IeXE0F5wDyRDP0dw7sIyqsiComFrzS8dkM0
	 07ekdiskpM4JyvJHyLWrm05V3B0H3ub8Py46TGFE794/+Z/bTPGr/hTvI7Y332KPHP
	 ZjuOpg3TcBWBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68DF983BEB;
	Thu,  7 May 2026 19:48:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C680C280
 for <buildroot@buildroot.org>; Thu,  7 May 2026 19:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B86C141211
 for <buildroot@buildroot.org>; Thu,  7 May 2026 19:48:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pwUtXx2OVbxz for <buildroot@buildroot.org>;
 Thu,  7 May 2026 19:48:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0D6774120E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D6774120E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D6774120E
 for <buildroot@buildroot.org>; Thu,  7 May 2026 19:48:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4E47013F8A9;
 Thu,  7 May 2026 21:48:02 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 07 May 2026 21:48:02 +0200
MIME-Version: 1.0
Date: Thu, 07 May 2026 21:48:02 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260507170528.3967644-1-bernd@kuhls.net>
References: <20260507170528.3967644-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <8704f9ef8885954f94fb9de3b7d2b955@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778183283;
 bh=Z+QoV1yG3gQQ686ObL0dYlBMbWRHjdkBcyOMFrlJ9kA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aq6X/PBMKNJPVzd8IXTKwEYRP3eukzqmFZu/xn9pA8xN7kPYSdrPwg6RQSvZoX/j4
 YzWRE8L+zx06XIIJbVHOdb6UU2wVuHKsPju5izXAPFPLR6+qfZNBmRejsu3T0UIQLa
 tgJQ5g6ERB3xdeHG43+pQTiPy3N5gkYRykL++aZZ4yILw5Vrqt3pVJrIukn92QgIfk
 5ftV7IF/IYNSKiAq2pQfMEmsiVsZuNxGYr/s62wMRIjZAi8eeEzvmfikvQjtvdKiUR
 7IL1bTTo0In4XAm5PwffLGuUlpPvv1u8aQTk+goPtEbqXZ8SEWY8zXNGF5m9EIbfni
 1yWxiLkJoK3rQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aq6X/PBM
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{12,
 18}.x / 7.0.x series
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

On 07/05/2026 19:05, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
