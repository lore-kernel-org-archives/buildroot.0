Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6B4FA3758
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 20:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4360F813EE;
	Fri,  2 Jan 2026 20:53:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hkrkwo27JyA3; Fri,  2 Jan 2026 20:53:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3254A81570
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767387213;
	bh=UZsGY4QJjZEjRnLG3Sbo40O12WoliGgcfamgHnARDVE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i4g4YCyzydEls52g0FHSoaML4/EpkZ2tN/xoavQlmp8R7lAxK2yXNaLg7RBSZ3zNH
	 xzel5XkLhnJA8hJOfwCd9/hq66V2KwFqiArlPD0fNOdiXL1ZoPONt4rKZOF/nfjHX0
	 Sf184WrJ1/q807taJws26LQrmES8KPOi0Gpmr+fOe+mAug5bj0PR/6nKkS9xP2hf7v
	 tLB0F1ekR40kcxOI2xnKmPpg6ZHf4m3XXN3+MZDZtzL/5If0TOGzBq4sBASlxy9GVR
	 CAAi7Cp2wFbrex6/7f7wU372Psp1nm0PHIB1otLi98dC9nTgCa6xstuIAJEsT4uHRQ
	 HvLXaXO01nVpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3254A81570;
	Fri,  2 Jan 2026 20:53:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CEB219D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0433B40888
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9f8TGm2iHbkI for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 20:53:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D50B54068F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D50B54068F
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D50B54068F
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:53:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id F083BC1C3BC;
 Fri,  2 Jan 2026 20:53:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BBD09606C7;
 Fri,  2 Jan 2026 20:53:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A3D95113B023E; Fri,  2 Jan 2026 21:53:25 +0100 (CET)
Date: Fri, 2 Jan 2026 21:53:24 +0100
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, buildroot@tudorholton.com,
 thomas.devoogdt@barco.com
Message-ID: <20260102215324.66394a52@windsurf>
In-Reply-To: <20260102185130.1183951-1-thomas@devoogdt.com>
References: <20260101150828.20c47d75@windsurf>
 <20260102185130.1183951-1-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767387207; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=UhijC053tI3HyZaevHTMUR7/QlYm2hk5Pnyzr9OHa+U=;
 b=wLQmmWWK71RrQjcWhQ/oWpMYf8MO4YKMnFxi6HHmLp3SqvV2Xo++fnU4y7ZoEZl+vshnUu
 AA0sOlLyYXyPsgsa8KbAXW4QJhCEgdxGl7gHRW/QzK4DXCAoz6ueGqS2mTVFohrmLUar4U
 3+UDRc1v7E9l6YlvcMQgIm/ErqcDHOB87uvIw51qeNWqia02WupJM0X7Ceuoy5t7dvZKgK
 rFG/JXgPngSCnaexQ+5ZoF3kbK8U8BH3kLoPlCfqxRa31YenYSVEo415LHYtRJLQldHjM+
 VKLWpEyS54aUp0hgeVNVL9fThsNkelfzzt97E2bVvsbJR5TBjwJUU+Orxzygzg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=wLQmmWWK
Subject: Re: [Buildroot] [PATCH v1]
 support/testing/tests/package/test_openjdk: drop the X11 dependency
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

On Fri,  2 Jan 2026 19:51:30 +0100
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> Commit 3dd73c3 "package/openjdk: allow compiling without X11 support",
> dropped the need for X11, so drop it from TestOpenJdk.
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> ---
> $ ./support/testing/run-tests -o /home/thomas/br-test/ tests.package.test_openjdk.TestOpenJdk.test_run
> 09:49:46 TestOpenJdk                              Starting
> 09:49:48 TestOpenJdk                              Building
> 10:36:12 TestOpenJdk                              Building done
> ['Hello, World']
> ['Test: Get JNI Version passed', 'Test: Read Native String Constant passed', 'Test: Write Java String to Native Library passed', 'Test: Write Java Char Array to Native Library passed', 'Test: Write String Member to Native Library passed', 'Test: Set String Member from Native Library passed', 'Test: Execeute Java Function from Native Library passed', 'Test: Instantiate Java Class passed', 'Test: Call Native Library to Set System Time passed']
> 10:36:50 TestOpenJdk                              Cleaning up
> .
> ----------------------------------------------------------------------
> Ran 1 test in 2850.304s

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
