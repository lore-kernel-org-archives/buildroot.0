Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D318ACD37B5
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 10:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BF2584166;
	Mon, 11 May 2026 10:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YNUKgpmCKD7h; Mon, 11 May 2026 10:19:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6664C84173
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778494798;
	bh=vhUsWmAXDEkDypKZM2xwSFHCwI7Q0UpJJezZCLLdbo8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WCu4TJUTDyT/ggUZqr5/9Pby/OLRB7DUhRJCGU3ghGzW48CgVsYhH/T2eEZEYzSQB
	 999FZqvGItsZfqXpCrt5PqyenzbYD3YntYygUShCSUGQIGFFlJCYMEh5dGnF59ljfH
	 6AJrDmlYX6UAB3/GJF/vYNEvN2DeNk2l9wYYBkECfDeLWyFeSvIqPuM+0QoBEQfSD4
	 11AqWbYQqaGOe+OfMXx4waHNO7cXFXsRd0iVytlLi0Vr2F91QQ++8EeM3/M4akQhHu
	 ehOBvNHpx/O9g67uKO2uf7jsf+t5tBj/W16gBr6JpqPT0oSOUu/IrXmaB/YD74vkPq
	 EyQylyNX4gnoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6664C84173;
	Mon, 11 May 2026 10:19:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 56D83173
 for <buildroot@buildroot.org>; Mon, 11 May 2026 10:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40BDE84173
 for <buildroot@buildroot.org>; Mon, 11 May 2026 10:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eavWyx6fQzxB for <buildroot@buildroot.org>;
 Mon, 11 May 2026 10:19:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1BD7384166
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BD7384166
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BD7384166
 for <buildroot@buildroot.org>; Mon, 11 May 2026 10:19:54 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -766776553; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 11 May 2026 10:19:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wMNjp-00000009DIi-0gMN;
 Mon, 11 May 2026 12:19:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Romain Naour <romain.naour@gmail.com>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260509181924.1370490-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 9 May 2026 20:19:24 +0200")
References: <20260509181924.1370490-1-bernd@kuhls.net>
Date: Mon, 11 May 2026 12:19:49 +0200
Message-ID: <874ikep7sq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=lYgY0O1pFLfaT+uGqEGtTrUpocSy6QPunlC47IKkoOFzwRf0SWa+2CFHWv0h3GP8CnB5rUbKVk44JeLTUAS6AA0zOgf2fNguhcjIt28p5VFPS2+JDDXEDDCReOn9mG5XzdXC8Ge0DTRwLWeLqFlHIwNUhZ/cYlNjVjEL8IM/8kOXFVStzXM/C9HYDH6e2BJXXD+EUc7ZUnV9fU1g60ZrK4j4eNQwUdzzTXfAor4zuvbGJ/phfW5op+7gS8bf3x1/2a5fhN9Pk00YGZ0W1+IdOaacB/FUt9LPCujdpUeFmUD2V8Ua8HNqM4LjaSxKLMzNFd46iCZdIBxpHC4FgEQyMw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=09fDhtQkSLHW5M5HdoRJ9o1XFODY1SOQijpM8ngjELc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=lYgY0O1p
Subject: Re: [Buildroot] [PATCH 1/1] package/{glibc,
 localedef}: security bump to version 2.43-27-g4070d808b
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Fixes the following security issues:
 > CVE-2026-5450: scanf %mc off-by-one heap buffer overflow
 > https://sourceware.org/git/?p=glibc.git;a=blob;f=advisories/GLIBC-SA-2026-0009;h=3c297fdc8018d26dfa3b1b269b8fdc2d4ab07e81;hb=HEAD

 > CVE-2026-5928: Potential buffer under-read in ungetwc
 > https://sourceware.org/git/?p=glibc.git;a=blob;f=advisories/GLIBC-SA-2026-0010;h=ae9953fb717886b93ea55fdede14450a0d4835f4;hb=HEAD

 > git shortlog 2.43-22-g8362e8ce1..2.43-27-g4070d808b

 > DJ Delorie (1):
 >       include: isolate __O_CLOEXEC flag for sys/mount.h and fcntl.h

 > Florian Weimer (1):
 >       Linux: Only define OPEN_TREE_* macros in <sys/mount.h> if undefined (bug 33921)

 > H.J. Lu (1):
 >       abilist.awk: Handle weak unversioned defined symbols

 > Rocket Ma (2):
 >       libio: Fix ungetwc operating on byte stream [BZ #33998]
 >       stdio-common: Fix buffer overflow in scanf %mc [BZ #34008]

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 >  package/glibc/glibc.hash       | 2 +-
 >  package/glibc/glibc.mk         | 5 ++++-
 >  package/localedef/localedef.mk | 2 +-
 >  3 files changed, 6 insertions(+), 3 deletions(-)

 > diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
 > index c9215dac6f..a6e6874e1f 100644
 > --- a/package/glibc/glibc.hash
 > +++ b/package/glibc/glibc.hash
 > @@ -1,5 +1,5 @@
 >  # Locally calculated (fetched from git)
 > -sha256  c5d012c0417d1a8d72e72ea2cd917422fa04f9ab525f418c537cad5cd9042803  glibc-2.43-22-g8362e8ce10b24068bacc19552c128dd10e082fd9-git4.tar.gz
 > +sha256  668f890b45fd8d32bb73783ad3b75fe1f396c5c3aa3c3832e616b4c3f0c6066b  glibc-2.43-27-g4070d808bea1c077eb7e7d52b52b91cae98205d5-git4.tar.gz
 
 >  # Hashes for license files
 >  sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
 > diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
 > index 0a44015818..09ac89f336 100644
 > --- a/package/glibc/glibc.mk
 > +++ b/package/glibc/glibc.mk
 > @@ -7,7 +7,7 @@
 >  # Generate version string using:
 >  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 >  # When updating the version, please also update localedef
 > -GLIBC_VERSION = 2.43-22-g8362e8ce10b24068bacc19552c128dd10e082fd9
 > +GLIBC_VERSION = 2.43-27-g4070d808bea1c077eb7e7d52b52b91cae98205d5
 >  GLIBC_SITE = https://sourceware.org/git/glibc.git
 >  GLIBC_SITE_METHOD = git
 
 > @@ -40,6 +40,9 @@ GLIBC_IGNORE_CVES += CVE-2026-4438
 >  # Fixed by glibc-2.43-22-g8362e8ce10b24068bacc19552c128dd10e082fd9
 >  GLIBC_IGNORE_CVES += CVE-2026-4046
 
 > +# Fixed by glibc-2.43-27-g4070d808bea1c077eb7e7d52b52b91cae98205d5
 > +GLIBC_IGNORE_CVES += CVE-2026-5450 CVE-2026-5928

We normally use the specific git hash fixing the issue, so it should
really be:

# Fixed by glibc-2.43-26-g2890b35cd361df2517525bf2c5f8c63f6f0d4a20
GLIBC_IGNORE_CVES += CVE-2026-5928

# Fixed by glibc-2.43-27-g4070d808bea1c077eb7e7d52b52b91cae98205d5
GLIBC_IGNORE_CVES += CVE-2026-5450

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
