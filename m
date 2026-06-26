Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368BBC43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 13:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3725082203;
	Fri, 26 Jun 2026 13:05:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y5yM4ZEGV4b1; Fri, 26 Jun 2026 13:05:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDA23821EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782479125;
	bh=SHLiCTbFfxdM5bAggis4Y9RM3hHjurZFRcRzdzdMpCw=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XfjY3FInla6VVnqjCKwk/wBaWlD1/VObWpANqki8OwLLFL5nlZVt/uTE+252hNIZq
	 Hy1Sk1RSZ+xhMPeI7zPvPjqUY78hhFtUvrsPoAx2q48rgqER75j+IzbcrOoNwdWiNm
	 W/QD0LksF6djbk+uiD9WOkPd+WEMnDqw/awnYdBVAy+5t7UWmA9dtPiJMhCD2s0/dw
	 g3TqiQHH7s8/GmgJ9Aq+t0i9lpLQjlLcQhJwvjOrT8OiMgD+G8bMhiPIY9XW21ocdG
	 y8GNC/DYqwiswP4SfRzhhDQQiJvGmUzLzvc/NlrjX6vgcO5rmCsQdRa3SNDzH4XOgG
	 44xfdpnk/NyVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDA23821EC;
	Fri, 26 Jun 2026 13:05:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 334303A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 13:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2900040707
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 13:05:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lSFZPx6hO-h1 for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 13:05:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9DE6740702
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DE6740702
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DE6740702
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 13:05:22 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -439168716; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 26 Jun 2026 13:05:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wd6F7-0000000HQr3-0UhR;
 Fri, 26 Jun 2026 15:05:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale <thomas.perale@mind.be>, fiona.klute@gmx.de
Cc: buildroot@buildroot.org,  Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260626124913.296693-1-thomas.perale@mind.be> (Thomas Perale's
 message of "Fri, 26 Jun 2026 14:49:12 +0200")
References: <20260626093225.4121915-1-peter@korsgaard.com>
 <20260626124913.296693-1-thomas.perale@mind.be>
Date: Fri, 26 Jun 2026 15:05:13 +0200
Message-ID: <875x355u5y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=g3dQvGRZJK3r/evcJLHgXhlxljezgg+vK2gtwN/75y5YMn/a4SV5ZTU9m0M8UEeB8ineVE/RSM9OS3yOpV+Jp/K4c4PBDFIE8+6Iu4KsLQRfXHK77Ex3pC5sx/YwlLU35J+214dzNn/1OYMnuwUWVKn5T5I3i64l5pLqNMA30WwZt5ASxKN/wk0HaCDwYrPqrfVlurCI229M9P1zLZmYTCYBRM0Ost86PhsDooOUs//pYYY8kn8J0fBnQW9gRxofcsmPiyeVX+ZDSlGax2J6lD0A6TM0aZDG3nKROFUZfc+ymFegfkDlAyClhS+0ZWz6L376E3P/MYPeiaCCO5XUTw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=OmRYWWPIu+1bYlaxLNZkv/ORW4yKQWZ2fMYsLqtmtMM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=g3dQvGRZ
Subject: Re: [Buildroot] [PATCH-2025.02.x] package/libglib2: backport
 security fixes for CVE-2025-14087
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

>>>>> "Thomas" == Thomas Perale <thomas.perale@mind.be> writes:

 > Hi Peter,
 > Thanks for the patch. I think there are a couple of others vulnerability that
 > still affects libglib2. I can look at backports next week but everytime I look
 > at libglib2 there is always something that bother me. I think some of those
 > questions also applies to master branch so maybe you can give me guidance.

I'll try. I am also not a big libglib2 user, I just got tired of seeing
the vulnerability showing up each time.


 > - The `2.82.0` subdirectory, if I run the 'libglib2-patch' or
 >   'libglib2-bootstrap-patch' the patch present in that directory is not applied

Presumably this was forgotten when Fiona bumped to 2.82.5. Fiona?


> - libglib2 & libglib2-bootstrap. If we apply a patch to
 >   libglib2, shouldn't it be applied as well on libglib2-bootstrap since it's used
 >   to build gobject-introspection ?

I guess so. Fiona?

> - The shared CPE between libglib2 & libglib2-bootstrap. If we don't apply the
 >   same set of patch to libglib2-bootstrap then we should drop the CPE
 >   for libglib2-bootstrap so it doesn't appear in security tracker with the same
 >   CVEs as libglib2.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
