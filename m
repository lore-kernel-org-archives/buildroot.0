Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442A4CCFA13
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 17:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2796E80AED;
	Wed, 29 Apr 2026 17:39:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bQF0uBD0OAce; Wed, 29 Apr 2026 17:39:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54B3E802BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777484388;
	bh=N3e3aA1H1VOyjOrkZw1x8/iNSAcXes+r0+IS3Hku4JY=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y504PlCNJDgDCc0iqRaUeZbFkUDTw44mZxSOf5EdSkEv6Pb2/55qQssipM/qbsFiA
	 J3Cg/Wvq18B4NuPtJ1SRVNz6mEjeDwSF5/Y6I8j0G6kd5gaPs4nl+VMLz7n7IFdzYX
	 bROBeBLGEnQo4P0D7W5qK6Rf4Qt/lZESAlHNrudDRwk62NYEWukebdT50KwXdwZ4HQ
	 umsJxfBRZjsZsdik76xP27aqTtPW0E2QMK5AbaBER/MmLRVFSicmt5fqpaHIMj0BWY
	 AudPSICv/XNHrsK5TF6thHaofFlw5B5wzzXpXFVhgB+Q3EAxxtlxHs6Q/WrdwMdaVz
	 QY0ODKlD6fkkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54B3E802BE;
	Wed, 29 Apr 2026 17:39:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 99E45192
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 17:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FAD5844FF
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 17:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h1KtQk1XRABP for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 17:39:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1BDDF8425A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BDDF8425A
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BDDF8425A
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 17:39:44 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1587918286; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 29 Apr 2026 17:39:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wI8sl-00000000Cjm-1yIv;
 Wed, 29 Apr 2026 19:39:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260429093339.3232096-1-fiona.klute@gmx.de> (Fiona Klute's
 message of "Wed, 29 Apr 2026 11:33:39 +0200")
References: <20260429093339.3232096-1-fiona.klute@gmx.de>
Date: Wed, 29 Apr 2026 19:39:31 +0200
Message-ID: <87se8dhdik.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=lhTlPIESryr/fSxwoKo+0+mWmkcR4xONXNU9keRq0PUrkmX5u3uciU+AwXqwSPJzuhDEpG9sYGj3dFsHrJenR0YT2ItgVgfeOGN3gQf63CJ5uPJKFvZOFZ0sjtoAUD3Dxlx9jAR72nk7vONOScfOpkXFkdo4pejAIVRWlGkFtne2kwi9GIU8Cynw7g6BiePgqjUUQ1L+9Zf1HvoO3sHT2oLvjvN7cBTkj5gKL2WpxAfbirlpdbTYZTc1QZeNRO+pNi6w9J/3ChCS2SEa8fF2vmg/+WrbjBuGlp3BYSMFUohkzUKpRpZOh3VQ+N71MmIV2SwVZjn+KTnGvaBQ4Tr3OQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=IKrq9UxJ7HuugpG2k3q0Iy32TjHfdOxY91/m1hJaot0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=lhTlPIES
Subject: Re: [Buildroot] [PATCH 1/1] package/ugetty: support building
 "proxycommand" binary for host
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

>>>>> "Fiona" == Fiona Klute <fiona.klute@gmx.de> writes:

 > The "proxycommand" binary is used with SSH clients to connect to
 > ugetty over serial. Building it as a host package makes it easy to use
 > with Buildroot builds including ugetty on the target, without needing
 > a separate install.

 > Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

..

 > diff --git a/package/ugetty/ugetty.mk b/package/ugetty/ugetty.mk
 > index 0e306a02c2..d8e8c85918 100644
 > --- a/package/ugetty/ugetty.mk
 > +++ b/package/ugetty/ugetty.mk
 > @@ -20,4 +20,14 @@ define UGETTY_INSTALL_TARGET_CMDS
 >  	ln -snf ugetty $(TARGET_DIR)/sbin/getty
 >  endef
 
 > +define HOST_UGETTY_BUILD_CMDS
 > +	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) bin/proxycommand
 > +endef
 > +
 > +define HOST_UGETTY_INSTALL_CMDS
 > +	$(INSTALL) -m 0755 $(@D)/bin/proxycommand \
 > +		$(HOST_DIR)/bin/proxycommand

It is handy to use install -D so the directory is created if not yet
present, so I changed that.

I see that I also forgot to do so for the target install, so I will send
a separate patch for that.

Committed with that changed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
