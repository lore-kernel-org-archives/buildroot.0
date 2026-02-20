Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05388C53216
	for <buildroot@archiver.kernel.org>; Fri, 20 Feb 2026 06:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EF0B60FB5;
	Fri, 20 Feb 2026 06:51:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1onpJdNP5lQa; Fri, 20 Feb 2026 06:51:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71B2160842
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771570307;
	bh=UqxP8vqbS3i6rGtvt5UKh3LAoFDrH0PlI7PVSLsV25A=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hHsgGCepA4o39zIXOlLcVMMYHWn4/T6/cGzRdlyzBsnlBZqS475yzLAU6LOdmVUW3
	 gMVfEO/Np1CENtGqKTIXSOnK90JnI4sfHLh9PvCl3vgnk/GHB0KAOSj2syZornJMuA
	 mx/8i7bQvENDZZZBn/BL2pU4AyxlkNfZIbqpfERXO6kGz1zz8rG9w7OfjlDsFyE+XB
	 R+W1R+Bn5PCoDyI9MK2mX37adQL5YFaRkk1rL1asBm2UkacM70g+g/EcqtUW8/kBL1
	 6uCQCKzHUJQsoTr0hSbgBM81HqiZnqQ/88236mZBYRvdQUoUGcYlNELUeVVChlCboW
	 QdpcWP7Xx8uyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71B2160842;
	Fri, 20 Feb 2026 06:51:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AF5E183
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 06:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C93340080
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 06:51:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 355LMue5OKZo for <buildroot@buildroot.org>;
 Fri, 20 Feb 2026 06:51:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0DC9840052
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DC9840052
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0DC9840052
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 06:51:43 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1891831280; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 20 Feb 2026 06:51:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vtKMT-0000000Emgo-2Z9h;
 Fri, 20 Feb 2026 07:51:37 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260219195646.1090143-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Thu, 19 Feb 2026 20:56:46 +0100")
References: <20260219195646.1090143-1-bernd@kuhls.net>
Date: Fri, 20 Feb 2026 07:51:37 +0100
Message-ID: <874inbj4au.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=dt7DOuHkN+lNYIBF8KrCBDSpI8KLzwkFR5+OBooGxupuXkw/ONSxOBOUrLCMA/l/4H2HlpfCSYVYoK9OU/jlYHiZxEzbxED6aMjKTfP/z+aT5T7EDAa0r3mlC2BzLDQfcsjyDMYfXR3CzE//lg/SVEezI9WIvZRwnsaxphK/2HWIopuwGrodKZzeCahtnqTfXB7zuoSp4UGiULlD81FdyHoQSSDQpWdU0QvLthjdGa4qTx2NnQ3C06gpLaB14HKMNrw5CNcJWwH0u0clrbKoPIRGm7XZCgd0AdVMW/jG4QhuqD/rhK491jAieTIqbMKrgyG+/mOQfIG3ZYRyedBIuQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=0hSDCuvZwXK5kS5dSMa9v1/j9Ju8LZRzMq7DX5qhqm4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=dt7DOuHk
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{10,
 15}.x / 6.{1, 6, 12, 18, 19}.x series
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

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 >  linux/{6.19.2 => 6.19.3}                     |  0
 >  linux/Config.in                              |  2 +-
 >  linux/before-6.17/linux.hash                 | 10 +++++-----
 >  linux/from-6.17/linux.hash                   |  4 ++--
 >  package/linux-headers/{5.10.250 => 5.10.251} |  0
 >  package/linux-headers/{5.15.200 => 5.15.201} |  0
 >  package/linux-headers/{6.1.163 => 6.1.164}   |  0
 >  package/linux-headers/{6.12.73 => 6.12.74}   |  0
 >  package/linux-headers/{6.18.12 => 6.18.13}   |  0
 >  package/linux-headers/{6.19.2 => 6.19.3}     |  0
 >  package/linux-headers/Config.in.host         | 14 +++++++-------
 >  11 files changed, 15 insertions(+), 15 deletions(-)
 >  rename linux/{6.19.2 => 6.19.3} (100%)
 >  rename package/linux-headers/{5.10.250 => 5.10.251} (100%)
 >  rename package/linux-headers/{5.15.200 => 5.15.201} (100%)
 >  rename package/linux-headers/{6.1.163 => 6.1.164} (100%)
 >  rename package/linux-headers/{6.12.73 => 6.12.74} (100%)
 >  rename package/linux-headers/{6.18.12 => 6.18.13} (100%)
 >  rename package/linux-headers/{6.19.2 => 6.19.3} (100%)

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
