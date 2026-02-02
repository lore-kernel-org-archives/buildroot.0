Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14599E7DF13
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 17:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AFD240C03;
	Mon,  2 Feb 2026 17:24:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a-imG1pXchIw; Mon,  2 Feb 2026 17:24:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 511D54083C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770053091;
	bh=ZH9wztZ0j6Z/cr/7NsmLboRGPQtWuDUQDotYNKVpKU4=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AKyqUnW+YmH0uZNrSd/wNKkYHPOfgpJMFkCA+KiWBm+JWZbBSU3WNdaq3DlDSu6Zx
	 3ojk1miXJv6P2FUBaxNazLaVF/w3rynKz0i7ifVCt0L1ah0heQ0S5KyQHhQS9mDJuR
	 qMepyDbZDXOG3GMG7Y4gJnPbkZ2d6CKmPnha4tw+OyToeg0MroS4Y7i6b5MEXxIcJe
	 wlJqRv/xu7bDLnL1emrUVzr4jksWXiOR8ANfav12guPyKbvFp5xenG+1NXUtzafpna
	 NSIysiLcGYSqYOm3FSLb//NwaPH2s6ENkVGdp0VYrmtcfo+g3LWN3FiBZHLZiCclOO
	 Zf8GvWfBD/Efg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 511D54083C;
	Mon,  2 Feb 2026 17:24:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9626C23E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FB0A4082C
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:24:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ey0ydaAZgvIH for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 17:24:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BC35640815
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC35640815
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC35640815
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:24:46 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1278527076; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 17:24:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmxfC-00000007GDr-2c1z;
 Mon, 02 Feb 2026 18:24:38 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour via buildroot <buildroot@buildroot.org>
Cc: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20260202111927.136104-1-romain.naour@smile.fr> (Romain Naour via
 buildroot's message of "Mon, 2 Feb 2026 12:19:27 +0100")
References: <20260202111927.136104-1-romain.naour@smile.fr>
Date: Mon, 02 Feb 2026 18:24:38 +0100
Message-ID: <87ecn3xdm1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=lO2Au118uKNnO01IxdAx1HO8Y6Y/oGD2Beojo/OwKmbokNeMHOp7ICyd/24QS8DkSqhUapLnqpXCqVe8n65hzaqMqdEangpVbg2uJ/o66L1Q3yTv/y8VsVQCkL4o317lRHf4y8TRzOqFeAvPQY0E4tivlevNQLi5ceZgqBPdP6B6NtSE8gXxZgbEKENv/ay/O4ObwazKxWXd9ZkPHoCKQ4lDNokgygvRz5scjPjp27KYGz60LjkY5asb5r9077QTK5AH+d4NW3YlYBzG2i9i07ocrXcwuSfIwSHvQwqEYRDluP3tQV9pCxZ5epKGvF8LgjRkgJmgKI02jnkr5wG/Qg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=fkNwD/uDrTCo62bfd2Ou4wETl2Q9zQVjSJZrMhwUx60=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=lO2Au118
Subject: Re: [Buildroot] [PATCH] package/avocado: bump version to 113.0
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

>>>>> "Romain" == Romain Naour via buildroot <buildroot@buildroot.org> writes:

 > Our avocado version is old and requires fixes introduced in 112.0 to
 > support python 3.14 [1].

 > [1] https://github.com/avocado-framework/avocado/commit/c1de44fabc047f149d6a9f742adecd8ed5cf939d

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/12944797019

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
