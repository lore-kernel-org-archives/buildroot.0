Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAE0CD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 18:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B37E61B3E;
	Wed,  3 Jun 2026 18:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r5BGjUjaLOgO; Wed,  3 Jun 2026 18:54:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A0EF61B22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780512844;
	bh=rDiu88wjI0qw2HKn19Bx02TDF4k0QNAlwBb8bKCwdTk=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ERc+PVn5qNKcFFLTgaYxa2YeiffWFOQ2mJKLiIL9F9NwgeGMhhgS/I/am8YZEP3hi
	 jlRun+Unw7f+wEq24RjIFBx2VYOcFBOUqmnb4SLP/gyEvZ77HAMeeD4mWEdpqf8Jel
	 rRgzSgdVAKvHG5wh2kynapEosx+pmhGKyY7gt3HV5jfFFnffMO4nsgpICRggdHNR+N
	 pv8PXEYfN2cobRCZDlskabnCERL6ZgoCLs0X9L3gyI/Zkxx4579+VJwtAxuxSKUveS
	 9Xmc/nwyV5ItrHNZKaE93BUvDL7QfvkKcUFsN7zdJKhW+BSRTixsfyUEVRxxmfAUhe
	 vCGwhHjMI3ihA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A0EF61B22;
	Wed,  3 Jun 2026 18:54:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 37218192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CED942302
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:54:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kurYpEoX2ITm for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 18:54:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1F8A74011C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F8A74011C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F8A74011C
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:54:02 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1380006576; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Jun 2026 18:53:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wUqiy-0000000CgjX-0TRI;
 Wed, 03 Jun 2026 20:53:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260602190048.2035264-2-bernd@kuhls.net> (Bernd Kuhls's message
 of "Tue, 2 Jun 2026 21:00:48 +0200")
References: <20260602190048.2035264-1-bernd@kuhls.net>
 <20260602190048.2035264-2-bernd@kuhls.net>
Date: Wed, 03 Jun 2026 20:53:56 +0200
Message-ID: <87h5njmp4r.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=gweD2D3gDfcLHAqlCHwORM1wHH/mvdEs/zz2V0GE7XfWkNkdoZlCJIHlfaGrI2cEjFQhxrZOwPLXXVCXXw8hA4VYMaUcNcH9KcCbiIntEPgrtsxaxiKDV3rBYCZSpv9LlOtbUMEth1g+N7hBL1d/7iyKcEZ9iGhBsg5Zo0B1YhKWo7Y+z88wmWGf71LomAa1VRh/NR1rnjiEvG29uK1GbyHwGCiKBwiKts1+GsPRdB0pVCeRn9mG5pX42tBTs45nxndmXHlpGG3esWzzYqVi+LddKOspH6aqL9z0U1ZyFfTGB9kGD5eFhmR8JciQfwkC9IBVcWC+3Vs1rqTALQPikg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=Sz+q3PE4FRrZk8m0kFBscpYzs3fDT3FOPcxfLEq2SuQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=gweD2D3g
Subject: Re: [Buildroot] [PATCH/next 2/2] package/intel-vpl-gpu-rt: bump
 version to 26.2.1
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

 > https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.2.1
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
