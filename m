Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6460E7FDDB
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 21:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 077A640A54;
	Mon,  2 Feb 2026 21:03:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iJNqAYqVRhGD; Mon,  2 Feb 2026 21:03:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CD74409A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770066231;
	bh=u5NGoeRw/z0HgzlZ8cL+NQBvIa92Z/eXsHcvv4yg3F0=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hb+jD+XAuVpzAfv1Fx0L6hoAFHSmo32yj2j4kGv95rb2uoZEHFTDKFKI+HbV2Ra4y
	 3BSeoxqrG1F9uWFQ7NxlwWKX/UPJ8V5RqVMPoD0Wiq/SKELiUyXwkmYXzVvwXvFa9P
	 8qIWgYuI7xa0UVSOdsIhWRfP/5+vXZS7kCzwlWToFL06AFGUJQ///GOwfEU6B8KbZS
	 DheuldK4hRdtJXk5asBP+HBUh3yKhs1BWsB6N01RbCJIHQj7w53wEEOUbVn7/M1fkA
	 W6BchG6o6Aa2J21w2Mwm329Or8GyFrC9L3DWiB9U3T5K2I/plE5Mv9iBb7R6b2uU32
	 VEJAV5Bb5dFsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CD74409A6;
	Mon,  2 Feb 2026 21:03:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2513AF4
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04041402D1
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:03:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nEGz3Xonl0WH for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 21:03:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BF2A3400A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF2A3400A7
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BF2A3400A7
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:03:48 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 953560803; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 21:03:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vn15C-00000007dYH-1dvN;
 Mon, 02 Feb 2026 22:03:42 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Marcin Bis <marcin@bis.org.pl>
In-Reply-To: <20260110193254.4079274-2-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 10 Jan 2026 20:32:54 +0100")
References: <20260110193254.4079274-1-bernd@kuhls.net>
 <20260110193254.4079274-2-bernd@kuhls.net>
Date: Mon, 02 Feb 2026 22:03:42 +0100
Message-ID: <871pj2vowh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=UsrA5itEVaCoRbYOkGOvZ6suLBZjm/Yq0FJmTlisv96yhNaKmfe6Yk1/vDm+zcl8h4aKFLfFChroy4Jssk9YCdPnVluNhr5V5Rp0BntzVQ4kASspHOFvOqLLv/+FekB2sp6Qf6NObDTiAhIA3ZSh/LXxv7DUVdAZ8ztI0Wtsh47vJN0sgapEpEC7f5B/XBGF+8CozpfnK5O8CNsWT5Ro+8nUN/GRz+zDpb18NPGnkax1gMgBoZxvdBUFr+TgvJn24ibq3P2Iv+UBgoPegn9m7NTJ88rxczscCaKgxSaFLEVtNpZD3751AzV/ZZgKT+wMf/aS58aCCTPWmSV/dF6Kmw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=Cqb2hOcdfFRsxS6djGeHoYr3SFaE9oCiiOWNiOHsu5c=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=UsrA5itE
Subject: Re: [Buildroot] [PATCH 2/2] package/ell: bump version to 0.81
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

 > https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ChangeLog?h=0.81
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
