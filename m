Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC851C61DBE
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 18:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC9B560615;
	Sat, 29 Aug 2026 18:25:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jtm3zFUi4RLj; Sat, 29 Aug 2026 18:25:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788027946;
	bh=/IMarRLnYiHaBetHbm0nGBflovJdT2/v3Pe4uW2yOOM=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IortvHs9Z0RQpm5WTPj8qMf8MdpLA+2HCwMUQzEiMiNH0pFgyLStLfK17+8dBtRLs
	 XZI7uGZVUX2fel4sd61pNnt0Pz88njnTjCxcVeBcFhjIb9gh2sQ9wPqrYzD5qbT0iB
	 4aDmw291Q1h/gRW4Ah+k8tV1sbUmqcFjrTz8FYXFejFQnv15v3dnaOjlMN3dUyfO7p
	 uNNldjhqWkRbHVmIptrX+vXW7IVNXF/7frSaYM0zT3BAZxzfL7cA6nFPehjs9/86x5
	 mHMIpYjH5hbybcLE0nYPamJdW4nV2wE/5IHlDegamCpF1xzt3nmjwsWSf+cfNW7cwW
	 05hGBWODcvrsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92F1060607;
	Sat, 29 Aug 2026 18:25:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 62D1D23E
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 18:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48D4C80E7C
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 18:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mGcmxAnBBd6F for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 18:25:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=aal/B8cB
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46EA980E7B
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 18:25:43 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=aal/B8cBmxtQ5Ahl/NSTzs3Q1iaBnTjvJUXV4Rq4VNm5Qpu7T/b8mwtPhIb+QJV3IG5yu7hdyY2qmADanFNKlq0vNBMYNNfLnrKofd4VrvbXRgSwwFebt5mOOC3JD0WRfXISpWh96aKl1+2cOSDN111slNJgXIMudGs1d7XLUfXeKsOVnPdpG93BNWUPnUyznlaCwdOOQIEsKtWAZ8i5lYYXJCDPSpYafJfgfgQ9yTTZYJ3azpT1qnycKWg8Sin0ZrDtd+Ywfz9cewGhigXmJYNKW2rYC500KlOuj/NrOT8iYkw70ttNzp3EVvHGGBazFcUaj1Y0r6jx+uW4r8JAeg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=0ccLjnhFGIvHh7O+nDj1vS8TbS4m9Te6bqKWmjE8Gl8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1210217423; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 29 Aug 2026 18:25:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x0NkC-000000002RS-287T;
 Sat, 29 Aug 2026 20:25:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260829180930.105786-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 29 Aug 2026 20:09:30 +0200")
References: <20260829180930.105786-1-bernd@kuhls.net>
Date: Sat, 29 Aug 2026 20:25:32 +0200
Message-ID: <8733vwvl5v.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libheif: security bump version
 to 1.23.2
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

 > https://github.com/strukturag/libheif/releases/tag/v1.23.2
 > Fixes the following CVEs:

 > (CVE numbers will be added upstream when assigned.)

 > CVE-2026-XXXXX (GHSA-g89c-p67h-r497)
 >  Heap buffer overflow in scale_nearest_neighbor() via duplicate alpha
 >  planes from nested iden/auxl items. (critical)

 > (GHSA-2jg2-4ch7-h545)
 >  Out-of-bounds read and write in derived-item and pixel-plane handling.
 >  Through iden and auxl item chains, a crafted file could attach pixel
 >  planes whose size differs from the image geometry; crop, scale, and
 >  plane-extraction code then indexed those planes with the wrong size.
 >  A working code-execution exploit was confirmed. Plane sizes are now
 >  validated wherever they are consumed. (critical)

 > CVE-2026-XXXXX (GHSA-24wx-9w62-c96w)
 >  brotli/zlib decompression of mime metadata and unci image data had no
 >  effective output-size limit, so a decompression bomb could exhaust
 >  memory. Decompressed output is now bounded by the security limits.
 >  (high)

 > CVE-2026-XXXXX (GHSA-x8xm-cm2c-cfc8)
 >  Chains of derived-image references (grid, iovl, iden) bypassed decode
 >  caching and memory limits, causing CPU and memory amplification. (high)

 > CVE-2026-XXXXX (GHSA-xw34-mjcp-jqh8)
 >  Sequence sample-timing initialization could produce non-terminating
 >  decode loops and unbounded memory, bypassing max_sequence_frames.
 >  (high)

 > CVE-2026-XXXXX (GHSA-j264-xvrp-5v7q)
 >  Out-of-bounds write in the unci encoder when
 >  heif_context_add_image_tile() is given a tile whose planes do not match
 >  its declared size. (high)

 > CVE-2026-XXXXX (GHSA-p58j-h3vm-3fp5)
 >  Heap out-of-bounds read in the inline-mask region API when
 >  mask_data_len does not match the region geometry. (medium)

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
