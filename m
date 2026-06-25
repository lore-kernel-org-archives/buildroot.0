Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A39CCDB479
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 15:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 689646104C;
	Thu, 25 Jun 2026 15:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j5vmvTpaJgFR; Thu, 25 Jun 2026 15:42:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A589E6103A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782402152;
	bh=bAPppcriA4oySnxXfwgOAFPmkL4bf0SK6nHKLqZrFZU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DlfoEVGrJgNWUqDern3NTkXR4MqU1corDLU0kSQdOTnf6+rQhc/XTbHm2b5+W3+U4
	 h5famp1nssdWhzZNk3OG+J6yIJDOphtvNMkGy2EKj3AcfdxoFIDx+8lC6+82TZ4TLY
	 gf6mZ33BU8lLENhSeR/2UXwC+7nA3Bc+8uoGpRGTNL89xBbFsx/Aq9h79fVt7ATPxl
	 pdBS9Zrr0mjTSlkjryUTYX4O10mF7uJx5cAxuebulo7STHerAmoOnelwcQbeifiwVH
	 NF/q345CDhAb2alYEQ12IfMbCWUXC/n/zzlNdDV032EmXvYGznSt7k/LDeES0JebiW
	 3Cs7YK4d1wcGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A589E6103A;
	Thu, 25 Jun 2026 15:42:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 51F872C7
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 15:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 476D440DBA
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 15:42:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id co74zumMOMs9 for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 15:42:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5810440DB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5810440DB9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5810440DB9
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 15:42:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 3975C5FFA3;
 Thu, 25 Jun 2026 17:42:27 +0200 (CEST)
Received: from 2a0d:e487:119f:5231:6cab:f084:5c2d:94e1
 via 2a0d:e487:119f:5231:6cab:f084:5c2d:94e1 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 25 Jun 2026 17:42:27 +0200
MIME-Version: 1.0
Date: Thu, 25 Jun 2026 17:42:27 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260622185602.1397198-1-giulio.benetti@benettiengineering.com>
References: <20260622185602.1397198-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.16
Message-ID: <ee69282061052ca261881fc0951c545a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1782402148;
 bh=kF4xrjQqkQQAB9FuN14UxTDdUy26iMR6HZ29d9/Z4Og=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vMXAEg1e4mbD9Qlo0MwW5X1XbPmQf9l54wdtIUyjXayQnRPldihX61SUat/NZEePu
 j2Epo7OTr+5GQJewyGRqFgCtbS8pgHXPajUDgBKzEntSHC5uoBhIT7r0E9hNSrOzFZ
 wz8W7SythDV9VwQL9QY1J3s+83sp5NRKAA101BhAMVj+s4HLUqXtjTNPBwpBdALdR0
 GlhaTWHa7IAOXFHeJlf412RGhb/eXykZMVLLp5oJnrnZUUaBFDLp2ve+IvZrp+4rIH
 TycoZUSfMERyPVGqUWNM3poVimu4UisefKoc7PzVzlGlvvp8gkjOhPQ9uTeaMM3ZQg
 jBxzh2BmujFgg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vMXAEg1e
Subject: Re: [Buildroot] [PATCH v2] package/bind: security bump version to
 9.20.24
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 22/06/2026 20:56, Giulio Benetti wrote:
> Release notes:
> https://ftp.isc.org/isc/bind9/9.20.24/doc/arm/html/notes.html
> 
> Changelog:
> https://ftp.isc.org/isc/bind9/9.20.24/doc/arm/html/changelog.html
> 
> Fixes CVE-2026-3593.
> 
> NOTE: Libraries libcap, liburcu are now mandatory.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
