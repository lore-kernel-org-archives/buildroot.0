Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19709E65298
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 20:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94FF2606CE;
	Sun,  1 Feb 2026 20:35:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TL02JPEnJazA; Sun,  1 Feb 2026 20:35:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 419CF60669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769978103;
	bh=pRkKqpkHzxUOP1POoDrlEARVoACmQzWhvyfvlZhFWmQ=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LjNhJHXMoRu/mdRoVGL8rjDYp4DyTq9SlqsbQIqShjOKqWeot6EbIdzwm1gZQkb7F
	 xflwnP/lornpoNu8nezBzt4hLplT+1P29/+NpWSTZfjDipzhi1oMOAqiA3HEXHKRVG
	 RqFqX4mM5xhg5TJRXOAqv/inu6i2EGLK8cYXHBOMerE6Jk21j71Fp8FQxxCRL27xsK
	 5xW4tgkF63XmPwcPO6iQP1XEiLtKlgmyHZl7PrUFs8tektbXE6y5qv1GL6r8VfZYcU
	 ymM7AfBwVY/7QbTCHJt/mtdcJjcPV0Bh3F2nPKx8slUbMM0ONIPwkW105bdLNeP1Xb
	 svniHwzfLlzGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 419CF60669;
	Sun,  1 Feb 2026 20:35:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B3D861E0
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0780606A0
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:35:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id grS5VIb3PnFL for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 20:35:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 789B260650
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 789B260650
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 789B260650
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:35:00 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 64149449;
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 01 Feb 2026 20:34:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vme9o-00000005k1Y-2Fq1;
 Sun, 01 Feb 2026 21:34:56 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Lance Fredrickson <lancethepants@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260129214051.845563-1-lancethepants@gmail.com> (Lance
 Fredrickson's message of "Thu, 29 Jan 2026 14:40:49 -0700")
References: <20260129214051.845563-1-lancethepants@gmail.com>
Date: Sun, 01 Feb 2026 21:34:56 +0100
Message-ID: <87v7gg9p8v.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=dgQ17nG2Hd48LU2CHahz6zGUwLoMFk2SxqfqSEGYpVzz3vC3Myi8MNA8luOnLgi/ZEZgpsMA6Hg+gDBWZ52I/2ga3J2NfezFQ6pfhiqqsQfj+LkiK37uYKhJxWobihMUk2V9JMPHqw0k6E3fl35/5J25GvVB5JTduLh5WROhQMx+jr3jYHqwWWaJtJXzVw4O/I0qPnboZ6iOCXBs9aI8emvW3BF0OVPOECqZQb5/ENqpUG11xAJVRWZXAcGU/SnMpw80Spm9bPd3AXIGe1njS/pWW9MFfPPKcldxjYf7wIKm64CX4CyVzq/mHsvRsPDvvxjIT8LDg7p1oE+2mYyv3A==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=TV0X01R4EfqbxmGN3cDIV6wMZs/j4eT7QBDyTV6A9Kg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=dgQ17nG2
Subject: Re: [Buildroot] [PATCH] package/usb_modeswitch_data: bump to
 version 20251207
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

>>>>> "Lance" == Lance Fredrickson <lancethepants@gmail.com> writes:

 > From: lancethepants <lancethepants@gmail.com>

Please use your full name. Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
