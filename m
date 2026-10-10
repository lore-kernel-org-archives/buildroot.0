Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5336BCA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 15:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D5CE8109F;
	Sat, 10 Oct 2026 15:00:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MgCwD-nujcFR; Sat, 10 Oct 2026 15:00:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 11C32810C6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791644422;
	b=JJb6IK2gXBIj0TmsB7N9sZIBnjhM1sRkZrMrOFbMANOdkdUDqS0XPX0Kea2yiQZlr40u
	 ftWOa9msLtCdOEjZR1qOeifd6w4YOPgMZp1jBUYcVA5fGsQm6qxZbSqtV9hgMY2uygLoX
	 Te992kT3NS7Cf8fEiI7WwB3tz3jVAH8V61znqM07h8XzaAQS6g8Qnny/5sqQb110hca/1
	 om63vMy3gh+SHmc1L93UPtpIo86JVGdozqzUl2H8VWqBlq/N9X4z3GEXFXvEterVXdSpS
	 HPMESnDeTbTidZygkTGrRa+/gqJnkklmi/dWD7Bl78G/PX/xM1mdqTOxA4/BfFnUoYA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791644422;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=iF7/sSucMtpBfq9+Db3RToMXzqVoL8NZJaWjly2fHfE=;
	b=dw+a2M4J+e8q0R08BS0Z36xWT02DRbxQc7gOMtI+h6puykCqwc6wK7GcRGudf9wPyllw
	 Bbyi3wNUw2vIohW+flDzI+j7j/kWRh9sFR+DDu9kgmZqiinrribmpKhd1ccYyP23VBYsD
	 M3er8NCQay149V8NytKqqzz2kJWJWtF11wk5uqUfMjO8j4XyMZ26WUJTQnuZM9xbS9Yj1
	 JMBFRKpIYeyLwWtqxFmys7O/5C3lPqjICqNt/2CeEO/cIbpb3HDIF6/OwhbK8pOFXusRm
	 nzqJt6O0xx//MjlNFDy9AqClJxax0HQ1nfjU0CtR7hgfv4PLP2eT1eSFv+y+Pq0nCug==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791644422;
	bh=iF7/sSucMtpBfq9+Db3RToMXzqVoL8NZJaWjly2fHfE=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HoSd+ncL5L5ADfca9H2wnKek33hepKzfV4gYuBNai4qiedqOlWT7iLpgYzM6oqzpn
	 7cceXcPg0XlberJNtvGW736i2Ed3gk8zOlTwwPfADIeL6QIzjafV/3cdpxJSnKshlZ
	 pu7cxM60S9+vPKfxZBZMjbJyFIYSCnyx4Pio6Y01AW7Tw95k983rS1OgKnRjuPnayJ
	 ENBPd7O0W2fFeqfTM0KuyEGqlTbD2rJU3iRpFDbInP1zET7Y0DITC4sG4QXTLh8h5G
	 YGPsp46lr3wktPYQCT1RfehCGi1luqHaR5R7PnyZwooIFmLB4uoCP8ZE3ATYI/yH8Y
	 7Eq9TlgygyRMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11C32810C6;
	Sat, 10 Oct 2026 15:00:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A194317
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C47340079
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:00:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nJ2dqQSgpe_4 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 15:00:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A6D5940004
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791644419;
 b=F/ww/2e0FyLtbSb4+6XwfvBhkYA5KLfW6wO7jr3tW08b7t0t3BFeyiG0nHjOI8mHFaj3
 5A2eg/9VZ87MHJXv2esmEmonUOHkJ1zzMJDLqJis/yEjE5evIEZbkJv75IZXzQj3oJS4Z
 GQG37QMaEpzl2pGXLp//D72PnKBEiYvd7vsmrtSzrP7kQeWzSSyWAouSFhUPT+fHMc+kj
 15XKOtAJ5RRRz3+T6XPYe7DiURCBEodV+NoGdQ1l/UZH85qvpkTgmG7hEO4pk4RRHbw8S
 uxjANpDUoa5/d062TR05cfbZqTJL1hlhxX+eXzG1cs6xJNXc+seLV+j5Ndr2YE0ZLTQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791644419;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=4c5enqNUABJBvLL7eY+diAH6GuYYV9RRYgpOZULxAh8=;
 b=MEr8qeYCZfUo4FQJm3MhCsP4f46rDIv4xTJdowezT6yxRucWTWV8XtfIJRwab9urYIla
 GTkAqX+i2yt308ApNELxH2VAS2mFAc+0brFVm6GmNfk6Zr9BivPRRszH3kIjmioN7ChYz
 zl8NB5p447qK2Bv74cuLVLVgXt/b8iVupafHNOFoLt/z6qdf5ub+B5MYihpA+hgYFfYTZ
 ydOMwQQkasT44ujWcm6tyzEbwCgcoD8JTK581e/8oplsGumBn2wBmkC8jTNLAgK/irjD0
 id5diGxUOE+uhoVPEpJHTLj0kKUD2J3hxsi+zwDgKg7Ax/h2puItL8hP2ZLhNFxzSvA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b=nnBT45Hd; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=nnBT45Hd
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6D5940004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:00:18 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=nnBT45HdSiPKR/a8yR+OWBDk0mXZxFdKy1vuZIZfV2np9qSScloFIAwmaWT6RPj4y9OFJuCnFrdTElLo2IfDe6qZ5ZC+YhKeZXPxtt32Ueo31RVWfuFEMP9u7YmHKm2EVFK6V8Un8Y2Czpglq0GgYg6NfJSKv8UCFiu1p8WSvSb/CZ8qsqUSQOMhfjKs5VJ8DAa3OVDDXmjzd+hkXsbCx1xHBXwdHDEmLa6TYEt12D/+8zR2dYVden3/FxysU7UIfSTUyzU4pUTu42uYg3oG+di/pkqTIzoMXfrKiiSJPJx0Af1htXrHWrgvNCp/MrZxb8LJnOY2QFZd+GhHu4KZ6g==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=wUkLwOgOhcVZUo9/ZcSfuS0qyD8XgSoDGu1Q9nQgbsw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1270133511; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 10 Oct 2026 15:00:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xFYYX-00000001n8s-3f8G;
 Sat, 10 Oct 2026 17:00:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>
In-Reply-To: <20261003193315.440847-1-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Sat, 3 Oct 2026 21:33:15 +0200")
References: <20261003193315.440847-1-ju.o@free.fr>
Date: Sat, 10 Oct 2026 17:00:13 +0200
Message-ID: <877bjpppmq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/fwts: bump to version 26.09.00
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

 > See release announce:
 > https://lists.ubuntu.com/archives/fwts-devel/2026-September/014232.html

 > Release notes:
 > https://github.com/fwts/fwts/releases/tag/V26.09.00

 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 > Patch tested with commands:

 > utils/docker-run support/testing/run-tests \
 >     -d dl -o output_folder \
 >     tests.package.test_fwts

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
