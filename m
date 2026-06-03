Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A65CD6E57
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 18:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E987E61ADA;
	Wed,  3 Jun 2026 18:45:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tBRvoq3eqVqV; Wed,  3 Jun 2026 18:45:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5429861528
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780512306;
	bh=oAnYILF3JU8sJpuaSGAvvvjC/KZ5R+EjYrWciYICG/M=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I9Rbf4u2wOXNMF780DWDfZaWEJY7fnfwHqLEoO3+05xbkEQS0QRUEUkb3qSMqCMLb
	 22Pt98xYY1CVsJFJd1KX7ZHkGshxahBXRfKJxeryV8VFoRUe+z9mSXjOld9dIqL9WI
	 +brk/6njywL1lecyeRMYRgc6pjI8ZhLYNu3SrRnWEKfbGXknFd5NKNwIflVrkXRv2s
	 3x7E9e6d5xjpWoSHEY4F8+wAUXs6UcPl1O3qkAuuaY8ojtXjMFt0F+OnqSmySC/QIc
	 6R/vMR05dZh5ZrphDrFT0+o/4Kuxq0QKyTM7URDHQhWu1T0ANlTtL/6pqe++ngc+De
	 tHF83UqgxR9Iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5429861528;
	Wed,  3 Jun 2026 18:45:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FE97192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81C0D422FC
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KSfzYXmCQF1k for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 18:45:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7853042289
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7853042289
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7853042289
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:45:02 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 150677620; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Jun 2026 18:44:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wUqaH-0000000CfJ3-1fRr;
 Wed, 03 Jun 2026 20:44:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>,  Gilles Talis
 <gilles.talis@gmail.com>
In-Reply-To: <20260602124023.287483-1-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Tue, 2 Jun 2026 14:40:23 +0200")
References: <20260602124023.287483-1-thomas.perale@mind.be>
Date: Wed, 03 Jun 2026 20:44:57 +0200
Message-ID: <87se73o446.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=C3GCzICgHeqHhRZzKaRHGjruVChlAcVCwnXc+5L8DsHURZciu642dBaHHiFBWLcAZpuYdmqK/Bct5GN2nFixOk284XXMCgld5U5Btgrh+io2tAjywZ4uHVxF5RubApQp9HwUCTirUoIsDDl5OgV7t5m/kN/8MtflaaKacHuZtnGo6k4PFUNyb+gR2ChA7QslasfCMV4r+AmP92hz2xteGdfJgF2uCgu2u6pWS3psNKb9PdtJuDEfZyuwqWcxtGa9CwSmhSyh9IWDVtIV3ViLMprVqppoPIDThjsx8BFAVZybRGA46MDBN//qUKMwljmZWDF9p1jF/x/usxnaNR2FRA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=IccAHG1aTs8I6V+TQgLRb8zvoU5UyBDDYW53+ZE7904=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=C3GCzICg
Subject: Re: [Buildroot] [PATCH] package/faad2: update CPE
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

>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:

 > The CPE audiocoding:freeware_advanced_audio_decoder_2 hasn't received
 > any new CVEs since 2018 while faad2_project:faad2 received 9 new cves
 > [1].

 > See the full history in [2].

 > [1] https://nvd.nist.gov/vuln/detail/CVE-2023-38857
 > [2] https://security-tracker.debian.org/tracker/source-package/faad2

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>
 > ---
 >  package/faad2/faad2.mk | 3 +--
 >  1 file changed, 1 insertion(+), 2 deletions(-)

 > diff --git a/package/faad2/faad2.mk b/package/faad2/faad2.mk
 > index 62c469e3ef..3027d44f00 100644
 > --- a/package/faad2/faad2.mk
 > +++ b/package/faad2/faad2.mk
 > @@ -8,8 +8,7 @@ FAAD2_VERSION = 2.11.2
 >  FAAD2_SITE = $(call github,knik0,faad2,$(FAAD2_VERSION))
 >  FAAD2_LICENSE = GPL-2.0
 >  FAAD2_LICENSE_FILES = COPYING
 > -FAAD2_CPE_ID_VENDOR = audiocoding
 > -FAAD2_CPE_ID_PRODUCT = freeware_advanced_audio_decoder_2
 > +FAAD2_CPE_ID_VENDOR = faad2_project

check-package complains:

package/faad2/faad2.mk:11: 'faad2_project' is the default value for FAAD2_CPE_ID_VENDOR (https://nightly.buildroot.org/#cpe-id)

So I have instead added FAAD2_CPE_ID_VALID = YES and committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
