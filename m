Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88308C982C1
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 06:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E767680816;
	Thu, 17 Sep 2026 06:37:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ccRBC6AoLAMi; Thu, 17 Sep 2026 06:37:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 78C78806E7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789627041;
	b=a8N3YZMa/BqcTm7qRnwRN3kQN56qLuofJ2A1g0R5y1gHDhHwgO0uUyxgnIdsFsYRWzuI
	 n9O10H7Hq7sw7jYIeqoYOlFZZFbOTa1w9DoeH2s00czw1kAAtP2T8lUXYFOwoAZpf7+2Q
	 7++CJF9kLpLIQt4ZeVIgBPSk+m98e7g6qv7Tt/amFJpn4bOjfhqEkJ41GjlcxzFT0MhVk
	 5UL3E8qyLBFNm9q/Y1V88d0P8oMDXudYxjR6isr25cCOI9PuZSBg+1TywhVUQYLDWxCzt
	 B7IEgXHj6iySNhwONyrH1iw9A8vDtZ5i5+n+sIzGETGCRYwIux68itmSYP2RwIVAcsA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789627041;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=tA0HB9bTHsX/GVDyeuDE5eK4xa26Vtsd6lv6jtb2K24=;
	b=BczX6e8CVDlGP5WNtrGAS9Ko6p+Zdjg6RErN6ha8XvQ1dckYdhKtE3I6UkCj3yuxtUII
	 /WarOwLWasmJiTTqqY0tjZMwMygcieyOAcjTO+X/JUGx1nayNNqsZtS7M/8mCHfErsKHK
	 98mRehpgxnbaKL04arZeXOOIT/A/XVGK0gIiFKYq4aQyxo0EuifZlBLC0863zkEC7bwi6
	 d3x6zXywn8q4mPRws1lEBlBQS+qGQtS3lkULMhK1VE12l2BuPV7UEev3FulESpIR8rrhX
	 EBSyvnAdTjPT1w1aiWLxTYMeXrXHd6mFoDy4a1zESjx4nKW8URNzJxp8YM6QK/IioMQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789627041;
	bh=tA0HB9bTHsX/GVDyeuDE5eK4xa26Vtsd6lv6jtb2K24=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FrftXdW4Mqv9fLfoA7EJiwEVjBTiQmii9mhkBjeWq4LNqMon+deckr7ilIVUoORW9
	 pJCCjeE3dNXMsxo0yC8U9um/hRhFzStVCcmtFXhE7P8dQCxWEjYJp9+w6aU+EFnB4w
	 zUlEv6tXZEg4Bqq6HPEfgpKJY03FiYNNaVuhsCDcXWpdA8BZQRrkVhX7pfuvN/VheG
	 q0RlYf/rVzvzvSxc79es/0kzPO2AeyIBw2bqdcc1OVGC+wfRxUo56Ilar1iXbQDyRf
	 qbeWN/D8ELHvASxGlrGbMlzM/ie0RRoQeua20HCtpZKjuw2kisbwSyY2jOhbildsc1
	 QN/taTrG263Qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78C78806E7;
	Thu, 17 Sep 2026 06:37:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CEF342D
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 06:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EB356062C
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 06:37:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x86kh33rA1KW for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 06:37:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9EE236061B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789627038;
 b=WEZvEAU6/ks72N6QypXiabsWupJ0WiCN+bE5y9NuKBuPa5gjMx0m5r2ZGwvCHQKR0nZc
 fDbC5K3/gmzVrNk2hGbAuI4jcmULklIi79bdA+Klw2FX4UUaYKT+sAmmPNFjk9bIbjIoQ
 GaCQuOOz+zAhe6FG9nM7yIP7TXV80BU2LV3dh4mg8353HZONTac7R1615xX/OCr+blPHr
 2L4lnYgFpWcOjDCF6NYWQ+IJojpSun1AVZeXRpdG5+vTXT1GFvqMfUteXXNXb+nX0KTkw
 hbzU+018lcmq3hZOYD+mXUmDxLmxls+o+AJDZ83rTRrlxIyIyFSs2OR1mfAtSUbwyfQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789627038;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=BbBkjLBFu4ZowuF/QTamEBQsW7iOcfm7JOvuqBdCFn4=;
 b=ilYUavhZfH1zMCay+JAaq6ZL2n+a6KPZXYCLiBG54L8YGoWiNDyvVMeSIylp7rOhyBa1
 0l9bWydP5GpfeCzjuDMCSe++LOvJbwsw02eDJyToC5dCPpvNi00Hz5gWDjPQJeEY0aSYs
 yUPFL6H3FNrIbDGtbCpjEaTBTk/+Qqh6Eut79wuNwQoB4pEht6t/T8guRnsQw3BV9WHgE
 GBFECucazFtmwpkHHpVtTJdddjoqEfpIPKmz1lc6jgKats/FwySk+CEsKQZ6pvlNnBETX
 BLKrbbFVW5HcCYRPcqovvY0tsmNtjYoGmFyVt7Ny2lhjayLBAkModfmNuTg+TR5/pqQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=cx0CEpqa; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9EE236061B
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 06:37:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 361971A0912
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 06:37:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 094D35FAA3;
 Thu, 17 Sep 2026 06:37:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D1DD811C7A1AE; 
 Thu, 17 Sep 2026 08:37:13 +0200 (CEST)
Date: Thu, 17 Sep 2026 08:37:12 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Gregory Dymarek <gregd72002@gmail.com>
Message-ID: <aquKZTaCLuEQfmEZ@windsurf>
References: <20260917000152.3060291-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917000152.3060291-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/sofia-sip: needs OpenSSL
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Sep 17, 2026 at 02:01:52AM +0200, Bernd Kuhls wrote:
> Buildroot commit bb254e2304274dc308e3d8699e92ea77e4189fb7 bumped the
> package to version 1.13.18 which includes upstream commit
> https://github.com/freeswitch/sofia-sip/commit/8081a1a6d05f174cb902664f73182c32fd2eee0f
> that added the unconditional usage of OpenSSL.
> 
> Tested with both LibreSSL and OpenSSL, the latter with all suboptions
> disabled.
> 
> Fixes:
> https://autobuild.buildroot.net/results/afe/afe7b327f12db86e4dc31ecc25b576bff5c4a0bb/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks! However, could you submit a bug report
upstream? Indeed, it is not normal for the build to blow up: the lack
of OpenSSL should be detected at the configure.ac level. This bug
report will also allow to check whether making OpenSSL a mandatory
dependency is really a conscious decision from the upstream
maintainers.

Thanks a lot!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
