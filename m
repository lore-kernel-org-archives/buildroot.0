Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC395ECD983
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 16:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D27A60B13;
	Thu,  5 Feb 2026 16:29:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XdnQ5RooFa1M; Thu,  5 Feb 2026 16:29:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6982160B4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770308975;
	bh=tvGcf56xQcBFyTjf70E9uwvPfYfkjv44uwq2sRnzYV8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pDr9MYqk26yhTcOYhw0IMR+iVEiPuTe6030xWY4hbmrNum6I8v7O3nFbMPOREdQg6
	 qqeowKXtJZVaQApEgUj+e9q3sRcDYBhhrWyABYWKnoriZsMk9YbylgS68OajDaCPpQ
	 tC5M3YcV/dTUIRDNtNMIiBVgCMkk9IhVFYen7Z82kacaOfTag6guvVd678J6vfXzsO
	 AB09dlQRP++95WjeRJLcXlZkHAqg4jE9PYy7GMgfBbZyC4Aktm7cqKzoUP1TjljBPd
	 2mxm4HcEIsLvvKxOS8eaf7+AqoTBSFD8C279KSHxynsFTKQZTV+yGcFwISiSt6tv4/
	 6QWaKfr+KEQZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6982160B4C;
	Thu,  5 Feb 2026 16:29:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0094117A
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 16:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4EA880EC0
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 16:29:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZgVddjxS7z9T for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 16:29:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9FF5580EB0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FF5580EB0
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FF5580EB0
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 16:29:32 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 934110814; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 05 Feb 2026 16:29:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vo2EQ-0000000EPCX-14Ak;
 Thu, 05 Feb 2026 17:29:26 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org,  Adrian Perez de Castro <aperez@igalia.com>
In-Reply-To: <20260204164512.243312-1-thomas@devoogdt.com> (Thomas Devoogdt's
 message of "Wed, 4 Feb 2026 17:45:11 +0100")
References: <20260204164512.243312-1-thomas@devoogdt.com>
Date: Thu, 05 Feb 2026 17:29:26 +0100
Message-ID: <874invp315.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=E+NXuPWeZf+H7PWI8MrYr1WsYo1JcJOuvSlsSDhEUsXvXT7vjgsymNSwhX5K8RMhPP4Irq5sn48hashALQ/NSZ8If9ZDuu2g5lEniwHUFQIZvXUUHHFW9cbg48gFtf3h8hkduM0DHHtyhkAB6SigUryKhrDE656r0r4iYl2jUg57cO1tbIOkZl2iKPPGeaQ/ZyBXohhKgX4DVJ3poIehU6/7dMuQCrtLeughbyLT/HvJFRt0hstN9HnLalPdgNqvfRi6sL38J2/iMGM+X8EYit5gFtDCb8kyL17R2iQ+fRRUqFiT9BxshOb5+uJwraWuyh5409IOWbMJMVSjOURuOg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=DKJwhD5oPPrqdVc8vx2JKE7Dr5/RgfgWZ8fP5y6Os+k=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=E+NXuPWe
Subject: Re: [Buildroot] [PATCH v1] package/webkitgtk: security bump to
 version 2.50.4
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

>>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:

 > News:
 >  - https://webkitgtk.org/2025/11/19/webkitgtk2.50.2-released.html
 >  - https://webkitgtk.org/2025/12/04/webkitgtk2.50.3-released.html
 >  - https://webkitgtk.org/2025/12/16/webkitgtk2.50.4-released.html

 > Security advisory:
 >  - https://webkitgtk.org/security/WSA-2025-0008.html
 >  - https://webkitgtk.org/security/WSA-2025-0009.html
 >  - https://webkitgtk.org/security/WSA-2025-0010.html

 > Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
