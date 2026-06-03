Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588F0CD6E4A
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 07:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 197746113E;
	Wed,  3 Jun 2026 07:46:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fCDjAawdttNe; Wed,  3 Jun 2026 07:46:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AEBF61147
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780472800;
	bh=dCeELvXeX0Vp7/YVFNSUwCMAWuZQwKFosgiQSyfC96Y=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ddXhplZNGgnx7ozsVWEvqoYUw78gijfjpfZseu1PTUOVqU7rbgBSj5hHF9E7KW+uQ
	 p65HIGdozA6mvNJ8yKe8hy7G3/ZvNDXouaPYn5EL8umTEAGXofcDhCyB69WB0y+sLk
	 lezKLDobVeuqwB969LU7p39p2FWdI80ETavAX81mYjObmriXDu6jzZYj68kZymY5ux
	 8PD2MfXI8WO/hCf5DcvGE3sPP6gwajSJB/XhhsYyILhjuX5mvpDp8RS6lX0MIE3lWI
	 WTzuY5liNRsyMHAs+EtzY0J0zvY+CNUrQyUMWB/fRH3U8UwOClM46tSUWvHSKcxuAC
	 DHgcnoXUJBqTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AEBF61147;
	Wed,  3 Jun 2026 07:46:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C47F192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 07:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2212D841C4
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 07:46:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xrFBQT2iJt7f for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 07:46:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 097558419E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 097558419E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 097558419E
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 07:46:36 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1316567400; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Jun 2026 07:46:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wUgJ5-0000000CGTt-0Ib0;
 Wed, 03 Jun 2026 09:46:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260602194447.794218-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Tue, 2 Jun 2026 21:44:47 +0200")
References: <20260602194447.794218-1-bernd@kuhls.net>
Date: Wed, 03 Jun 2026 09:46:30 +0200
Message-ID: <877bogqd61.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=iKrTQJfPkO11SglDSduldlZpcXIcF1j4wdd2dGTNF3wYk+mLfft3twudzMkjWRX5nNDIA7Pguzs9ISvEp4tTgWcqf0WOYMxH5W7WhvOeuz3Rhi61Ma6rkHOYSD9lBCfvKGhtEUfK9ic2oAODYJDbTJW/NGDqeVX3prdATVnV2aopRYgDyMhmslgW2gzEreb54fVVxNICYYC4a+2DwywjndRNUiMHB05N8jbhGWtQ4XMsPUVrsMPCOpnjsmlBXJAqb9x6uM6V0FiBrhbt+tQTmd82YCIEb/Tp8zO+s1XFkOAhQ4/I0UFexcmMiONbb59SmIIPbUsUhlcBGHBbo+AWqw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=YwI2HE+I+6YCZngvYFtqdoWC1iB1uorXMNEpHDF3fTE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=iKrTQJfP
Subject: Re: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server:
 security bump version to 21.1.23
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

 > https://lists.x.org/archives/xorg-announce/2026-June/003703.html
 > https://lists.x.org/archives/xorg-announce/2026-June/003702.html

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed after extending the commit message a bit to explain that there
are no CVEs assigned yet. Can you also send a patch for the
corresponding xwayland security bump?

https://lists.x.org/archives/xorg-announce/2026-June/003704.html

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
