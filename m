Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB078FD005A
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 10:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EB4E41C96;
	Sun,  1 Mar 2026 10:11:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bWdhc1Tsb5yi; Sun,  1 Mar 2026 10:11:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0126141550
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772359883;
	bh=/6nC8rCFBEKJxRdkCsW/2sQ0+WNmqVO15jln9asHgp8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LKu4VVATcDxpHsbTttqR8jlSd/AjnY+ZqlsNYohD9gerZv+1xv6Zee3N38ZlUA5kC
	 nE6FboVhgSpHYEvc8FjCi9Qjqur7OzPSAy/hU1gWh/Tq6XitqZdyXXtUVowbdtik0m
	 2yOL9uCSD6YnRlo+WeEHO8kmPqVq1cABpAAdQwEfhjtKX304pWXpGUHJ1UNmC0gZN9
	 jDlSCBpMmbbPfMh6M62B+klIrO2+8JUVZy5YgQSJJhoGaVcgGmhX9kdZcyZAmchnDV
	 wKEpglCdAiziRQ6FZAJDHaDpqQo5RyzLhg1cJ9UpWud8xQs623li/xtoi8/TT3Sqc8
	 gvwAtF2SiCk5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0126141550;
	Sun,  1 Mar 2026 10:11:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D1551231
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 10:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7246404C5
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 10:11:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_SVSII96QtM for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 10:11:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8F23B40309
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F23B40309
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F23B40309
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 10:11:19 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 836526534; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 01 Mar 2026 10:11:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vwdla-0000000AVWK-3STa;
 Sun, 01 Mar 2026 11:11:14 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org,  Ricardo Martincoski
 <ricardo.martincoski@datacom.com.br>,  Julien Olivain <ju.o@free.fr>,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>,
 guenther.harrasser@mobileye.com
In-Reply-To: <87pl5noo6y.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sun, 01 Mar 2026 11:10:13 +0100")
References: <20260227192112.3792145-1-fiona.klute@gmx.de>
 <871pi4prz5.fsf@dell.be.48ers.dk>
 <4de55993-a547-418b-83a5-b5e5549480fd@gmx.de>
 <87wlzwo6gc.fsf@dell.be.48ers.dk>
 <d5069f4c-565b-4111-8f11-67f31281f3f4@gmx.de>
 <87pl5noo6y.fsf@dell.be.48ers.dk>
Date: Sun, 01 Mar 2026 11:11:14 +0100
Message-ID: <87ldgboo59.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=AzzU0OGYSBfayv3JTR73pVtrg7EPRwnVomKduHTUfqp25VsFFuYtPna1W9AoGkq6weInw/6xYlUI+KbkYEfG0hoLxMzKdXpGiBp+OO0h0ZbCPbPIF3O+ZxlgrH3dFz1ygzzqAPiKocnbNqvYPUOhn6sqsCDFvDhqZOy7VSzEXzkRbZqdknNIKJlAU4oYN1RIncM5SkGANYPuI4dsWR3gZdD12AcKUK8VrjpjpuPFDalnyKNB4QxuIvoCRE/0EPvPFHQ6T1wTOsPX7euPpXKYlxVTWiTXpgC2hy0VRNq1qVOHRUy1uZngIyX7Xcd3Gy69GTTXWPojI4eCE5c9XWmqww==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=AykHKs151c1hdLVrpTUBi1ww6v6vrIWlgJJrKRWbmUU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=AzzU0OGY
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: transfer config in
 environment instead of class variables
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

Hi,

 > Another hacky workaround would be to monkey patch set_start_method() to
 > ignore the call from nose2, E.G.:

 > if multiprocessing.get_start_method() != 'fork':
 >    multiprocessing.set_start_method('fork')
 >    multiprocessing.set_start_method = = lambda *args: None

Ehh, without the 2nd '=' naturally ;)

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
