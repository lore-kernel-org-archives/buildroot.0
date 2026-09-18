Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AECFC982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 19:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7237360ED5;
	Fri, 18 Sep 2026 19:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oYsMpGTIgtlc; Fri, 18 Sep 2026 19:51:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 27CF060E9C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789761073;
	b=FBsGaAtoDobU4ux+VupXuIK3R5BIrkFSHXTPMZ+aeJv26qKOEbq8QfLoxYzJuYt6W4fD
	 zIqGdYvdiyCzDno/RiHyC31+w8Zzak9j1kWFjsa62/9l9vYlSuVKcbf6xK+ACq5YA8XiE
	 Pyz2yr321a7jogiHgVcgC5h6UlXd9iidjaH8zEIJgj7ZUHcXxOIpnXFnWviIB9kYOGvMk
	 K3nUhXCBpQuoh5fw1QrrxXydB1SMJ6dn6lV3F9kNqa6LpXpLbcqltUvusw+m47+9lU7Ni
	 Nykw3U5ZVcTS+3FG8laUfYdoMOeNrfISPdB817UqJQnF3+VGBTzjQb7DYw1A4z3dlLA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789761073;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=nQcebcwUNIksPc9Ibbp7cPVqOotgSwWNFnji8KJ37sM=;
	b=JCFslvCeub9s3oDVqvhBBGkJNl42JzQPpi9tz/UvgY10/mNGg0ipe6xGDJ53B326RxeM
	 XJ0jqVWy/hJsFxN1FpPvPax8M8v9x988KlFDBGCdglQ8JwpkYT7Ln6tkn09FNd6G3nEgO
	 5fvYd7Y+M/Ie+uu2Br7Gz+gYta36cEvfXI3UxCLUN7ut1VEMTVjyoI8eNRrNN9VIgsgGV
	 l8nL8Uxii2hsdmxmqqK+uAd+X/2FKzAo6+4EEjlKWXYx8tTex116ZUx/Lo7eJ/zIuOzce
	 LyRDTbwjxg/IsqcdIWxQPjLBFT4ZznkNBNHbIcRbcj6d2FLXkw+tQNq6CM0ScMQROsQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789761073;
	bh=nQcebcwUNIksPc9Ibbp7cPVqOotgSwWNFnji8KJ37sM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BD7LUkzHrcwb1bi0GTzDVACgpo+zCBNG/LFzCdXpWj5fQ7D6HhxKZuK8D4584AUB/
	 fyzVQ3EOagjrd/ZyCzpFS/ia3FO+lm7cnM6o+yfy0MaqA6x4zJA2rz50Bp0pqM9Ay2
	 mb0VOHhi9Dozw8lD1SuhtpcuRP2MCRCld1uUGKCN1/MsNC2oweZsitVcvCCV7gyDZA
	 eDMVstEJbVs3f7PPGK5yIw2KGwJI55CqBloRLTFDYCXwzb9zzS6VqZJ2t7KBrn7dL1
	 hCHrm/qlwakPUZwXLL2gVhNV7OERxsu8ws5sGsm+PigU4nnyaEg7u2fkIqZnQgZ4Ty
	 zF3b5rIJCkWOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27CF060E9C;
	Fri, 18 Sep 2026 19:51:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AA7FD3B9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D4BF40C8E
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:51:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id onwOxgmE8XTo for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 19:51:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E08C640C8D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789761070;
 b=a9fYlxPfMmeCyJBnwaSa+F9BkV6a3kMI1LQOyy8n5StBNoXRzVee+uDj97vcXPa/IxUc
 HmvyMRi/fInjn8ST55WZnDLHaM68uJgGUpW4WcSi9fJ0yku+7KEVeeHuG5ZEh1GR5lwmi
 Lwy+KlbpjZhFMpPE05ZrQ0oB0Tq/2/20KMgf/EnhH8wfzRrjqMZr3mZshyt6HTtQM3l17
 8W3SLuPMxR6Xx2X/FFMWQzRdWpsPXrTQA9prQdrlDzcRQ+7ga3ZLJrT//HzReIMffVC5e
 m30OKlbzaYASZ/oOGep/17dSxPXDyp19AJ9iehUoy7CEPsKHRqk2Wwv3i8UFVT82xwA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789761070;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=fykrDGdwIrIptl7YkhvKeAihEnMQgHgSUHaannxF95w=;
 b=rtqcvruRSAvC+Ii2p1j7uBc/LzVACDjPGGcG42sErMkH0qLgej6ZCevIRZUU8XWJQKYI
 UI7jnmJf8NkRGu7GjwYypGUHXujWumv8SIYUvT04hGoWJKw3vu3azBGW31/1qYTagwQhY
 CNVNQ/HxaFUu5Jp8Ks8TXS/5l8qb4edEQXffM56/40+6hSKeqy3n2PU1AXqtMzO5iOnMd
 5YdP3s7wNuS6eKDoVXU4cYI5cn8hhlunVItcBkeUR1f17hByLlE0yhUL+PZiif+vCkSiK
 fUxwKG/OSBIn7mWbKmLD6v3YulFA4eTB02oWAKb+vyQl500cax509n4P5vE+SyKzUqQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=r9W7O6jR; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E08C640C8D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:51:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 7A4D74E4087E;
 Fri, 18 Sep 2026 19:51:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3589560649;
 Fri, 18 Sep 2026 19:51:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C437410329075; 
 Fri, 18 Sep 2026 21:51:00 +0200 (CEST)
Date: Fri, 18 Sep 2026 21:50:59 +0200
To: yegorslists@googlemail.com
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, 
 Will Newton <will.newton@gmail.com>
Message-ID: <aq2VV4mwPo83xmnL@windsurf>
References: <20260901114951.2675876-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260901114951.2675876-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/libmicrohttpd: ignore
 CVE-2025-59777 and CVE-2025-62689
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

Hello Yegor,

On Tue, Sep 01, 2026 at 01:49:51PM +0200, yegorslists--- via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Both CVEs affect the experimental WebSocket helper library
> (src/microhttpd_ws, installed as libmicrohttpd_ws.so), as stated in the
> originating JPCERT/CC advisory JVN76719218:
> 
>   "The vulnerability exists in libmicrohttpd_ws.so, which is generated
>    when building with the --enable-experimental option."
> 
> That directory is guarded by AM_CONDITIONAL([HAVE_EXPERIMENTAL]) in
> src/Makefile.am, and --enable-experimental defaults to "no". Buildroot
> never passes it, so no Buildroot version has ever built the vulnerable
> code. Upstream removed the module outright in commit
> ff13abc1c1d7d2b30d69d5c0bd4a237e1801c50b ("remove broken experimental
> code", 13651 deletions), first released in 1.0.3.
> 
> An ignore is needed rather than a version bump, because the NVD entries
> for both CVEs share a single CPE match criteria that encodes the affected
> range as
> 
>   cpe:2.3:a:gnu:libmicrohttpd:*:*:*:*:*:*:*:*, versionEndExcluding 2025-09-16
> 
> i.e. the author date of the fix commit instead of a version number. Since
> support/scripts/cve.py compares versions using LooseVersion, every 1.0.x
> version evaluates as smaller than "2025-09-16" and is reported as
> affected, no matter how far the package gets bumped.

Thanks a lot, but this is not the right fix I'm afraid. The right fix
is to send an e-mail to NVD at cpe_dictionary@nist.gov to ask them to
update the CVE entry. They are responsive. You just need to explain
very clearly which commit fixed the vulnerability, in which release it
was integrated, and they will fix the CVE description.

Once this is done, we can potentially accept as a temporary measure to
add those IGNORE_CVES entry.

The way I see this is like patches: if you don't "upstream" the fix of
the CVE metadata, then we will have to keep those IGNORE_CVES entries
forever, which is not desirable.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
