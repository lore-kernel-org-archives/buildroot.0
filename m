Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C90FF44844
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 12:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D50D182F57;
	Fri, 10 Apr 2026 12:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vdkVOLT68zHG; Fri, 10 Apr 2026 12:04:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1463580F86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775822680;
	bh=oAblIAFUg1Afso3dkRLI9XvcNZSuEoLnkapz5xM89Sk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Fmlh4LD24rT+hEJFVIvXzJJpMUiW7C45nrLGSoWM9C6Ac+koKS2BDtcRDl4qP0AL0
	 WqxVIzOut+bYTtpwvs4JvfViZqh/90qaiKSaZ0qephfsNX53BIZwMCNSj/+35gYB8D
	 SVV1qas8nhMSnXOu9SUnJK9vUIUdqY+OgJcB1zE8zeKmGpU++vAAdjyX0BigC21OfK
	 K9Mvjx+XsmwRPvSMCva9y00H/jaKeoj1jZKJL/pefQu3lst5lN7V7A/qkc748tRXc/
	 HrpMSzFeaha4g+NhCO1jhmPAxouvN219HTjZfkR1jtFYeSySwuvEBcluuEY+vz1ykg
	 is/5MBIywwcTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1463580F86;
	Fri, 10 Apr 2026 12:04:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8869E237
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 12:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6EF40409C7
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 12:04:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uVh_TQeHAPiz for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 12:04:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 13F2D4074C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13F2D4074C
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13F2D4074C
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 12:04:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id E2AEB20039E;
 Fri, 10 Apr 2026 14:04:30 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Apr 2026 14:04:30 +0200
MIME-Version: 1.0
Date: Fri, 10 Apr 2026 14:04:30 +0200
To: Christian Stewart <christian@aperture.us>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20260410043308.42434-1-christian@aperture.us>
References: <20260410043308.42434-1-christian@aperture.us>
User-Agent: Webmail Free/1.6.14
Message-ID: <bb84af0a2992f6515979f5dd0a8fe31a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775822675;
 bh=h7avOUkL4NOw4TwgW9ilMbZT62dcKlc1MicXmC91Hzk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aqc7tOkD8xtC/tNiFn51eeMAXfCIPp5AxYYP/NeoQsecuoPu/H6ko1IHYGbU5Mui8
 yWeb+TUCN6BZlA/yXugc9H6v2PBXOz+u7Jz+YA/0V6pJGtYpEyL07Zxll+3OJr+rmK
 bnBNsARZ9KoCuwho9dsfdm5xVe0/Ka/MatRvlrXgPmEcc8reQRHEhJm+HDyDBSxQAf
 W9DkfFDULsmCfQYArae2iRsEMouu4ZwwgBeWyVhFhQ1C9dLaX+jrqgUPpHaIVWZlSZ
 Rssh4+ZOgSELke1he3zZ0NXO/qeUW0CSt6tfDI/alO4v/nW39EBQu0h4CTJoQXl6EP
 FRVzNbUx17HoA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aqc7tOkD
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: bump to version 1.26.2
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

On 10/04/2026 06:33, Christian Stewart via buildroot wrote:
> go1.26.2 (released 2026-04-07) includes security fixes to the go 
> command, the
> compiler, and the archive/tar, crypto/tls, crypto/x509, html/template, 
> and os
> packages, as well as bug fixes to the go command, the go fix command, 
> the
> compiler, the linker, the runtime, and the net, net/http, and net/url 
> packages.
> 
> CVE-2026-32289: html/template: JS template literal context incorrectly 
> tracked
> CVE-2026-33810: crypto/x509: excluded DNS constraints not properly 
> applied to wildcard domains
> CVE-2026-27144: cmd/compile: no-op interface conversion bypasses 
> overlap checking
> CVE-2026-27143: cmd/compile: possible memory corruption after bound 
> check elimination
> CVE-2026-32288: archive/tar: unbounded allocation when parsing old 
> format GNU sparse map
> CVE-2026-32283: crypto/tls: multiple key update handshake messages can 
> cause connection to deadlock
> CVE-2026-27140: cmd/go: trust layer bypass when using cgo and SWIG
> CVE-2026-32280: crypto/x509: unexpected work during chain building
> CVE-2026-32281: crypto/x509: inefficient policy validation
> 
> https://go.dev/doc/devel/release#go1.26.2
> https://github.com/golang/go/issues?q=milestone%3AGo1.26.2+label%3ACherryPickApproved
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
