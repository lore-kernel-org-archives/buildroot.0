Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8E2CD3430
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 08:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14A444070D;
	Tue,  5 May 2026 08:16:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QghyRVw1JgRR; Tue,  5 May 2026 08:16:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EC18406E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777969007;
	bh=4u2FCrTYumEWYKrGB4IA2KIoJ78EXIjX75dJno/GFEU=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=XjagKNx0vg4DO5DOTTNZc4jBGFiEDRLPBl3MoH3VajhlToslvlAI3sS8DBafj3IJU
	 ET6FGOsXJ5RzeQ2A+kc1DqKCpCerGAiEtAo+WXNoFTmIE+4S+QTU0Nl2vPjPIfsPmM
	 f4UeZCxcGz3bahLr50P5Hvcpd8O4lrBDq/LAbT5uzyhV0KLvBDyfTij8mB0eTrYxnz
	 I2Zr38N41yKeHsC0VOv1PPsn5XySNp7J6c5943/vznAbTSoCRX1c+rI239E8SxTJBU
	 TchXPwSah6U0CCF6unzKapgrqT2sq7hzz4n5JfujuiUv1PW95sAN0wF/Mx8ylwoifI
	 urbVjKDXT5tdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EC18406E5;
	Tue,  5 May 2026 08:16:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A3DFF2A8
 for <buildroot@buildroot.org>; Tue,  5 May 2026 08:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94E7640227
 for <buildroot@buildroot.org>; Tue,  5 May 2026 08:16:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ugj-wwN2fB-z for <buildroot@buildroot.org>;
 Tue,  5 May 2026 08:16:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B400340218
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B400340218
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B400340218
 for <buildroot@buildroot.org>; Tue,  5 May 2026 08:16:44 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 144C02C88D23;
 Tue, 05 May 2026 10:16:42 +0200 (CEST)
Message-ID: <f21b6832-c54f-49da-9348-d48699728897@bubu1.eu>
Date: Tue, 5 May 2026 10:16:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
References: <20260503232504.3712616-1-fiona.klute@gmx.de>
Content-Language: en-US
In-Reply-To: <20260503232504.3712616-1-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1777969002; bh=pp3E75spaXL5qDCufQ5pT561iiGpHmIXk4cd9st+C60=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=TO7AH5jGN47MUtuehibt2x1Ib29azbJWp8FgPaUZi703K25gWqDTmEiGt2PvHoexG
 agRb2EKqrhhYmR8HOnqbWVCDECa5Xk5ZdOVOoECtYVAckmRl4aCi1ToeouJnD+ZPqr
 r3pF/MGyOjS1L4RWkwKCIfS0oz/ZTjb+5OHhdNEFx4h1+VZYRn4U2/vBZ4vrcMzgHG
 gNmUha8LCWwCqrThJi3V4yOtyGblh2rk0OEkdboBg52H534HnmYM7SmKyT5ugLpiZK
 ckf93lBP4cbY9uyTPZxrD4eIHxk0j3gTCTMSItGuGGyfNUzL+VENPL2DWiULIRED2y
 DHn8svqrTwyHw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=TO7AH5jG
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: explicitly configure
 PID file directory
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

On 5/4/26 01:25, Fiona Klute via buildroot wrote:
> OpenSSH checks during ./configure if the default location /var/run
> exists on the build host, and defaults to ${sysconfdir} if not
> (/etc/ssh in Buildroot), leading to confusing errors. This can break
> e.g. in a sandbox with its own mount namespace where there is no
> reason to create a /var.
> 
> Explicitly setting --with-pid-dir=/var/run overrides either default,
> and only logs a warning if /var/run does not exist.
> 
> [1] https://github.com/openssh/openssh-portable/blob/5fa60ae0d2ed3fc441f54c9349afbd63b6301929/configure.ac#L5568-L5576
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> ---
Applied to master as 
https://gitlab.com/buildroot.org/buildroot/-/commit/c09bec68f14f39e99b40eda89e538a6f4075fe98, 
thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
