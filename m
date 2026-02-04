Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615CCE95363
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 09:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C8B560B48;
	Wed,  4 Feb 2026 09:49:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AjDFUOCTLimX; Wed,  4 Feb 2026 09:49:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A95560A55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770198549;
	bh=bbIeaNMGhy5Si+pKKyJvD9l5/7otf7Twi8s2ezelsic=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TCbGYY6MGo/r63PTgr/+c4Lw5ON0JSqm0WWTlvvjEz8X9qH9tI22VRJcC/+SfUCqs
	 /BPp5wEofeFjQCrcTWsiSpirC/e+K2M68gMWgkmgazgmx0bhEPOaPxxyhhBvrLCrdP
	 bsqHptIelrxSZ/Coh4DtAzONWfTmrGw6oFNi+a5Fqd1MfbrIMJSW6suMwKK11sHq4S
	 fZMZxBFCPT3TLN+rzmlH1xHXuGH6wDN6T3SHLUJJ6iBbJgfAlxh+EYOOfLVX8a7tKt
	 EcVJIbrEn40ts7d5Le+ZewQdNAaYANUed2EhIouCMn7409wgSr9lehMzVv9SKHSKOV
	 6s2SfBuw6rKmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A95560A55;
	Wed,  4 Feb 2026 09:49:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 80743173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D39683BFD
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:49:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aEyVzHXWGFie for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 09:49:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3573083BFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3573083BFC
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3573083BFC
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:49:06 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1948995141; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 04 Feb 2026 09:49:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vnZVP-00000009WOa-1WK0;
 Wed, 04 Feb 2026 10:49:03 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260204092207.3009275-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Wed, 4 Feb 2026 10:22:06 +0100")
References: <87ldhahxqv.fsf@dell.be.48ers.dk>
 <20260204092207.3009275-1-giulio.benetti@benettiengineering.com>
Date: Wed, 04 Feb 2026 10:49:03 +0100
Message-ID: <87qzr07sa8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=fEuTI3x48tdxPdbh0t8Gpj/aGrXLSktFhod80LTWfgBAGxWsCE3tOrcsT0A4xL51T2DTbVGfcxHw2HDKuckitwWPuZoFszxrnzxiUEmXdmmvYTubLCD722UqbRpBEqVzO3ukbh89bDc8zNDv4iYgvIPgnOiJsHpbbAytH3NxBsqkxSk42RYIHXMjp3f4vMUsQ45reVEqQk1cBkMImfZgFKEHnnv7LKto9BVdfAkj2dejY9FPVqFsooRv4xDYH4WYfk/y1zZpWFAtA+F4FKUOOl7hqwYbOrYhXoiW2t7a8/VFxz+PYOc7q82KHtX/npB8KSII+VQZz9JcbzPRe3s2DQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=kVYCsUcvEiSQ11Fcz7gyVs1qNzuk0Fpwkgj/jc/m/+0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=fEuTI3x4
Subject: Re: [Buildroot] [PATCH] package/bind: security bump version to
 9.18.44
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

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Release notes:
 > https://ftp.isc.org/isc/bind9/9.18.44/doc/arm/html/notes.html

 > Changelog:
 > https://ftp.isc.org/isc/bind9/9.18.44/doc/arm/html/changelog.html

 > Fixes CVE-2025-13878.

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
