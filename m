Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA59BE6526B
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 20:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40E3D60AF6;
	Sun,  1 Feb 2026 20:29:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lPP0KKSF5aZq; Sun,  1 Feb 2026 20:29:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 106E56064C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769977779;
	bh=9cU5dxPSHgiAihXkyS4yI4nJnkOCDDeA97BmqmF0Wi4=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YE86PffGSUvSWfn6FiraysP0ETWze3su6HP5/zToQRCpXK2gVD1Z51C0gTmpMcSkr
	 Odc8yJGYjM4BbqiOtRSh1UKfsApYj20NqUcqy5GHS7bZSNJF6kXyD7HI090gEW/iEB
	 hOEGYTNA+Wsp1wfhSJ1mzZL1U34oPU9aKy2gZM6XXI1mJMv3X+xMwwcc8PFu64SBMT
	 uB09Am9jjRbUfJY5IJgGFzkPH+Fb/9TKdjcqspBTUMUCLRenlGKizyeH7UyM9g/4xA
	 sxzSks90BF6Tzyn5fiayM6vcxiu4I1kDLjTNM3DPeFbK8DU4UDAjABUm7xFiDpMPE4
	 /YWAUBSO04bHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 106E56064C;
	Sun,  1 Feb 2026 20:29:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B1051E0
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B4D06064C
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:29:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 68JLAYFk7-UU for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 20:29:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 96AA560648
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96AA560648
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 96AA560648
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:29:35 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1819256093; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 01 Feb 2026 20:29:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vme4G-00000005jtK-2M5l;
 Sun, 01 Feb 2026 21:29:12 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Marcin Niestroj <m.niestroj@grinn-global.com>
In-Reply-To: <20260125104501.433268-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 25 Jan 2026 11:45:01 +0100")
References: <20260125104501.433268-1-bernd@kuhls.net>
Date: Sun, 01 Feb 2026 21:29:12 +0100
Message-ID: <87zf5s9pif.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=s8VEDlJTcevkD+mFj4Y/we71kox87U+Y816tLOFpG4E+XIwlnrJxVA89kzg/puH0RIJ8sKYGxtN/LiJSVBbrXI++Q/fk2bHgsQ6Hsg0QL+yMqNc/J1FLi2bmJNGnxVIoZmA0kXAnuXtnj4UUaqkOwmyGqxQ9uJsKlHgW5l55ddFLMx3OfkuiTTFWNqKGtzBYT9+5E/C5M4I52aTm+TNZ+ifEpH+S4hhAKoF7rfzjCmE/RSDNC4REXXvZ0u6hEGzrzol3ixxewBJnWsTS43B+owIHZGXOqp0ZPTIHWNQTLLCNOmO86b9Bn4QY6DBhplBBisUmHK80kAibItcoCzpaig==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=X0HidMIgJcOesqkU74g5/ljdhknauET68IJKD36X6/k=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=s8VEDlJT
Subject: Re: [Buildroot] [PATCH 1/1] package/netdata: needs C++
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

 > Buildroot commit 9cfcd906cff299ef83b48681e50bcef9df124ad4 bumped the
 > package from 1.33.1 to 1.37.1. Upstream changed the optional C++ support
 > into a mandatory dependency with commit
 > https://github.com/netdata/netdata/commit/b6d2a3662dfb683e9e95203ef3b21f8e31238b06
 > added to version 1.35.0 causing build errors with toolchains without
 > C++ support:

 >   GEN      netdatacli
 > /bin/sh: line 1: no: command not found
 > make[3]: *** [Makefile:5502: netdatacli] Error 127

 > Fixes:
 > https://autobuild.buildroot.org/results/7084a73d5727a86ca55eda3d1f01ea4d5b8ecf65/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
