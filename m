Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CEFE83EF4
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 08:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36979407CB;
	Wed,  4 Feb 2026 08:57:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0AzLr2Jn07Pt; Wed,  4 Feb 2026 08:57:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0EA4407F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770195422;
	bh=mVaSo7cygUdUjh9fZP+X6+5Fuqxt9bbGDym6aPBa8iE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TeMuUFwLHo+i7E/LNbmBW8j01RezjQr8qhlUNmoAOYAIwqB+Vpbu11VfimI4O1U5Z
	 HqnvHywQyvJ7fcVWVYqgvjq2dMe4zHdTy6Zz5LrIJbSYZCIbbzqTsOYc2Ym/CtPppY
	 +xS3QX1oJGtq9I0ABAybCs2jdbQMvbBPKlR+kaO3tTahlii0PavdAldBtMQTtlnU4X
	 /CmOEHQlyHqnV/O3juphls3daZbEVc38t4qRrEMMFtECXWteTshUQpWt4z9TFqvP9i
	 Za3LjX+oKB3Bt+MrrTcac5fePAt3JzVHBEFThHG1dnsymTgcwT0DtsdifHIScTw7Hq
	 3COTO4dqHQ/QQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0EA4407F7;
	Wed,  4 Feb 2026 08:57:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F1B9D17A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 08:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBA1860A4F
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 08:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JBcO1aUMVcuJ for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 08:56:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F2A1660A89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2A1660A89
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F2A1660A89
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 08:56:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id CF4D04E423F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 08:56:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A391160745;
 Wed,  4 Feb 2026 08:56:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 39773119A865B; Wed,  4 Feb 2026 09:56:54 +0100 (CET)
Date: Wed, 4 Feb 2026 09:56:53 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>, 
 Thomas Perale <thomas.perale@mind.be>
Message-ID: <aYMJx0dgzwrcP_9O@windsurf>
References: <20260125114310.246433-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260125114310.246433-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770195415; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=IwiEmhuicDRRbqurvCIKntwKRLja9O8s7xMvAonYsgs=;
 b=xEXyBqIho2DEkG1xT4g+Ll2aaosBUilI4o/IYHSAqxcM/xS232GWCumIO9Smrxw08CXu99
 90auZV367BDhYnNR3FrlJuy153mxofAUXBbRYTB09+kJBBb+54JCw6hYNb9YTj9vneCqKQ
 lHIZGHTYDPxfT8KDQ1X44w4JaRaNsKdkzcRLrzirsToFafnQM3k7tsx4ZSWafKbCDQqTqa
 5XT0/Y888QJAIcdwL488DCQ9Jpkq1W5ES5cRblecQkKcojFVpjmUmuwJi4TVfFWwko05E8
 khpobvWrGR83NteAjw39V8jov5vdY1SB1vgB7xEmbjSKCBCezNhzYokGCFxgFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=xEXyBqIh
Subject: Re: [Buildroot] [PATCH 1/1] package/glibc: add CVE-2025-15281
 CVE-2026-0861 CVE-2026-0915 to _IGNORE_CVES
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

On Sun, Jan 25, 2026 at 12:43:10PM +0100, Julien Olivain via buildroot wrote:
> Commit [1] bumped glibc from 2.42-3-gbc13db739 to 2.42-51-gcbf39c26b
> to fix some CVEs, but forgot to add those CVEs to GLIBC_IGNORE_CVES.
> This was needed because the GLIBC_CPE_ID_VERSION used for CVE checks
> remains to the same value "2.42" which is marked as vulnerable to
> those CVEs.
> 
> This commit adds those _IGNORE_CVES with the corresponding upstream
> commit references, to make sure they will not be reported by the
> "make pkg-stats" command.
> 
> Fixes:
> - [1]
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/18de297a5ad3d1fc1b44f54ae69289ca10200ad5
> 
> Cc: Waldemar Brodkorb <wbx@openadk.org>
> Cc: Thomas Perale <thomas.perale@mind.be>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
