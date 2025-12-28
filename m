Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7F3D3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 14:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E95A40625;
	Sun, 28 Dec 2025 14:34:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YA35zoDmYh4O; Sun, 28 Dec 2025 14:34:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 690A94061D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766932476;
	bh=x5+GelP2X+kZYjv2aDPWJ1AwFAEZV//q+5YAs2mMDNM=;
	h=In-Reply-To:References:Date:To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=WNzQlZjZARGfcqrIpJ3FhM9KyygFTk4bvVVxRJqU2pzo3nDGYwJNO1UGb739RIdd4
	 dvCGjlMTwh8R4S1o9GMIKkD/E3nPR2kAK20UvyTGzqaZnNHHW2qJfheP+R8Of9NZEk
	 agubdgUISanXpJ0OCNR7vmjwh8Lgs4DcYy2WNSGjkFJwFWVZ6G6pBPdGnrjvAA9EJF
	 9iqf6CvdnoGqf505plBBcBiAJyRlvkFXYk+C3/aBW9k4e80DFgPuMuJsgPNWSD1r5+
	 XVjk5NIdHqJjqQtTxLPYSeaZ7+DRnNbK5k+jskrEf6OTQHVfX6rCF7kinUiJAwWFup
	 ssm9L7dx5lXcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 690A94061D;
	Sun, 28 Dec 2025 14:34:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 28EAFB9
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 14:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2622D40628
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 14:34:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id giphysuY9z5V for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 14:34:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7C66A4061D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C66A4061D
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C66A4061D
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 14:34:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id DB7EE1814B9; Sun, 28 Dec 2025 15:34:29 +0100 (CET)
In-Reply-To: <20251228145724.309c6fc3@windsurf>
References: <20251209201851.1023802-1-buildroot@heine.tech>
 <20251228145724.309c6fc3@windsurf>
Date: Sun, 28 Dec 2025 15:34:29 +0100
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Message-ID: <9a786142-8290-8202-436a-e0a634f8945f@heine.tech>
User-Agent: SOGoMail 5.12.4
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1766932470; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=fBOX7enZUa1Is6DRq8A2QqoBt03JO1bHu33jzVfzUzQ=;
 b=nj+42+qTByt9fQ/zPLnKW6tyh9tPqQeFpXdvwgMEyiDLMjU0/6/sfOYu275dHwPRJyUXif
 dJxOopgyiZhkDaNXKP7zIvtq8f2REDSxInLDVNug3oApdCV1dcQvqJshR/XDqJewpZ69Wl
 WXN3vmubEPpCKP1fFDz4IfGGWStD0Ig=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=nj+42+qT
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH_1/4=5D_package/collectd=3A__fix_b?=
 =?utf-8?q?uild_with_grpc?=
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Michael Nosthoff via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Sunday, December 28, 2025 14:57 CET, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Michael,
> 
> On Tue,  9 Dec 2025 21:18:42 +0100
> Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:
> 
> > abseil and hence protobuf/grpc now need C++17.
> > 
> > Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> 
> Could you provide more details on which commit introduced this
> regression, and a defconfig that exhibits the build failure?
> 

the "breakage" is introduced in the series which this commit is part of when bumping grpc & abseil. So maybe the title could have been better. I just oriented on the title of the previous commit which bumped collectd to C++14 and is also named so in the collectd repo.

Regards,
Michael

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
