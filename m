Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33038107BCD0
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 17:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6C0B40A78;
	Fri, 13 Mar 2026 17:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1XKkJtc8t9xd; Fri, 13 Mar 2026 17:14:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 090FD40C00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773422070;
	bh=hpVOAIh3p5Rqa4pTEYjuyI5MzRdjrbquW88Bo6PM/lg=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D1KXSccm02YtzrT/di4wmV6Dno144zSR8ym3YhevAsSIo/bNJ822pNJpdht0xPKf6
	 jVGWw8IL6bxe7fs2ZxegT8IQQ+4RAYVGyZuz/LCWl1HCw0JBN2En8Qilr2Q8xAdS+4
	 +2rG3LFHL8sZer6mPJi3Rqyb/yG96TJBbpVLI0TocnjeI2Kbiz3sOkNSLalTWJVmt4
	 0YAj0WtkRhs0EGIIOTDMSjx2UnktnulwuC4y8ZiPOJi2w6BiClqqJv9SnptYK1+gZD
	 im8X2x5MQpAo6xEmQHvsIzdqLjs205r+NJTpXOAZUHJZDQweFzOtLZRP/AE2t3ecNq
	 wDlZInedb0CYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 090FD40C00;
	Fri, 13 Mar 2026 17:14:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AD72786
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 17:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17ECD60C23
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 17:14:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PGcGrO_6q-l4 for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 17:14:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 60BEF60C1C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60BEF60C1C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 60BEF60C1C
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 17:14:26 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2115094213; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 13 Mar 2026 17:14:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1w165d-00000001nDy-150i;
 Fri, 13 Mar 2026 18:14:21 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Christian Stewart <christian@aperture.us>,  Julien Olivain
 <ju.o@free.fr>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  James
 Hilliard <james.hilliard1@gmail.com>,  Thomas Perale
 <thomas.perale@mind.be>
In-Reply-To: <4529c7b6d321750cc0d99e8e02c4758f@free.fr> (Julien Olivain via
 buildroot's message of "Thu, 12 Mar 2026 20:44:37 +0100")
References: <20260312075722.86111-1-christian@aperture.us>
 <4529c7b6d321750cc0d99e8e02c4758f@free.fr>
Date: Fri, 13 Mar 2026 18:14:21 +0100
Message-ID: <875x6zirde.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ozP5PcVQBvFCLZGL+AfjqfOTcA79wHHSPqgVAW29iqQsio0BkUpBZoDuLtZkmK+2iAj72d8Uiq8AUvykLRmtRXMokRF21ZlMg+laO2Z42UcCRXC/yHsYeGreBDpYSb6jr1pFje3BpTG6JoldDW1FWzUx5v5oEIclN4pJ+QmWVkPYe0hnkatwPFcMHawoH8jXR8e3PqFBrZYVCza1tRP3OB5mSLPcrGAJcXJSx0O2tcpqvGVh/V01tCj/Q+nxIlYJzegiW20K8F3/uKAOd/sW5hiqBFZ0l5pV5dcvvxcxHrb81xsp5SjzyOBrvZTbw/SxbtTW5Xcwq7rQuHoZoKJa4g==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=A0qtZKVNV1C7/mkk2FxZrPzCYIzAL1UJn1IKYb+Vo7Y=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=ozP5PcVQ
Subject: Re: [Buildroot] [PATCH v2 1/1] package/go: security bump to version
 1.26.1
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

>>>>> "Julien" == Julien Olivain via buildroot <buildroot@buildroot.org> writes:

 > On 12/03/2026 08:57, Christian Stewart via buildroot wrote:
 >> Building Go 1.26 and later requires Go 1.24.6 or later for bootstrap.
 >> To support this we use Go version 1.25.8 as the version for
 >> go-bootstrap-stage5 and have the build for Go 1.26.1 depend on
 >> go-bootstrap-stage5.
 >> Go version 1.25.8 is the latest Go version we can build using
 >> go-bootstrap-stage4.
 >> The package build for go-bootstrap-stage5 is effectively identical
 >> to
 >> go-bootstrap-stage4 with only the Go version and stage number changed.
 >> Go 1.28 is expected to require a minor release of Go 1.26 for
 >> bootstrap.
 >> Fixes the following security vulnerabilities:
 >> - CVE-2026-25679: net/url: reject IPv6 literal not at start of host
 >> - CVE-2026-27142: html/template: URLs in meta attribute actions not
 >> escaped
 >> - CVE-2026-27137: crypto/x509: incorrect enforcement of email
 >> constraints
 >> - CVE-2026-27138: crypto/x509: panic in name constraint checking:
 >> certificates
 >> - CVE-2026-27139: os: FileInfo can escape from a Root
 >> For full release notes, see:
 >> https://go.dev/doc/devel/release#go1.26.0
 >> Signed-off-by: Christian Stewart <christian@aperture.us>

 > Applied to master, thanks.

NIT: It would have been better to first bump to 1.25.8 (which includes
the same security fixes) and then afterwards add the feature bump from
1.25.x to 1.26.x so the security fix could be backported.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
