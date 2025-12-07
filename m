Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841A3D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 17:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22EDF81E7F;
	Sun,  7 Dec 2025 17:01:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bH76wE8kGvUM; Sun,  7 Dec 2025 17:01:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C5B082205
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765126903;
	bh=6EsL8Q294usWPWknu+VVtXSNqfoas5igN6g5nrxw+7Y=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dBJyjxjy0TJ/pBOZzdpXm3yw1JlF4uzEgU6AR9DfaqUxmc689of1LXHXErSNleGcw
	 slHjLTCo1oPCNkEpcjV5gSrehtasUTCH3IePhlRMUf/s8H8bkg+QP/A1pQXquF8wCr
	 OdcYLvqiKha6/HJhdv0isq6L/oUmaFXRipcxxm1pCXzE0EZt0F/joTTIeVHCFp6Un6
	 Ki5hMN5vxyOzCVVD4IJ7uINkH7Dk8akdNJhPjaw0pFmh6V9/JtLAObnF2IVJI16tjF
	 K4+HzKLv1xhZL29+NkiOjAqU/ex3C8hszcclqOTM/br/ntJajQGqQPeNSfoqdR3kEY
	 RFOUcsQp3Jrow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C5B082205;
	Sun,  7 Dec 2025 17:01:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A1F0E7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57CA0821A1
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mCnoeyoKIwLG for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 17:01:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4E12781E9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E12781E9C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E12781E9C
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:01:41 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -159083065; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 07 Dec 2025 17:01:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vSI8Z-00000004Z26-3bBi;
 Sun, 07 Dec 2025 18:01:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>, francois.perrad@gadz.org
Cc: buildroot@buildroot.org
In-Reply-To: <20251206213818.2301716-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 6 Dec 2025 22:38:18 +0100")
References: <20251206213818.2301716-1-bernd@kuhls.net>
User-Agent: Gnus/5.13 (Gnus v5.13)
Date: Sun, 07 Dec 2025 18:01:31 +0100
Message-ID: <87jyyy9qfo.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=QE6nthfRIdRCaJ3iOeV1ODK00POvQYieXjpgZnGbr0W4wckH8QkOnqbcBUkcJ2kFxSI+vo6R/KoQUuEocAuDhGXcLxJlnktYzGWR8/SJI3ONQttOWuiWZPet4DfwgBPDXTF4+oBu2pPXyAemRPwYhPVbm3D4jukn//awwSaUnrij0ee3GOXWXHn5/4v3QK7JFRzb28UxpZDzKTl+zZ2ruh/rLmZGGoklheVHHWxjjmMYtY0yRYrUfEqvVbPGLpggo9XKkq6C5ebriW/a2/4dK269edr1RKNiL8gCm3mrmYDQDxAPkWVnoYPZCVq3qQx1TCUw7aP767PPj0atD8VF3w==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=vyfC8hNSXci4R/H4EOsko9S+oo67EX6Ujyy5fbvwJl0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=QE6nthfR
Subject: Re: [Buildroot] [PATCH 1/1] package/ficl: update SITE
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

 > Upstream moved the tarball to another folder:
 > https://sourceforge.net/p/ficl/news/2025/07/ficl4-is-retiring/
 > and also retired the package.

 > This patch just fixes the download problem.
 > CC'ing Francois to ask whether the package should be removed until a new
 > version 3.x is released.

 > Fixes:
 > https://autobuild.buildroot.net/results/125/125fa1c0a3b37b4d09389a49640b90121838c665/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

Francois, should we drop ficl?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
