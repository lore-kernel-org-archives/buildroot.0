Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990E4C5DF8C
	for <buildroot@archiver.kernel.org>; Sun, 23 Aug 2026 20:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6135980B6D;
	Sun, 23 Aug 2026 20:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id edBGU545xY8a; Sun, 23 Aug 2026 20:01:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787515273;
	bh=VuAc6KpLKtxWaRfsefYEsPESvtTaPWKBvxs2g92dL1A=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CBW6B83/DUzNc2ZRk0AuBArYrF2F/fjJ5cqL2wGQ6qU+Pso9Fnq0DOI5yM5/F4Z8Q
	 DvBZf08qxlEl9kMfpK7xS1tQz+zqFedt3z7fEYBMx73DJATxQJR9YsHq07LD5icSjJ
	 Shy7IrsaVz5FWfh7ETPv/9HJYVeJv4aVgUYSuTsDeIs9AH2bgNbKIqpdH0OZ1xq8na
	 3wMcP5NAkhd8V5mR4LVY41NYrAjsdBsWcMGdPNKsSEZ8HJToyR2aFeVmT4NpCKPKAm
	 c+00n7w6Nun/qmUXlCRQlwazPMOCxWW5g+3Dk5YmHB9N0dFmcchADayn3k8qIpr0pT
	 5hKVKgEXKhPwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8822A80B84;
	Sun, 23 Aug 2026 20:01:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CF1242FD
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 20:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B551A60613
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 20:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DD7GERv_JZaW for <buildroot@buildroot.org>;
 Sun, 23 Aug 2026 20:01:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=dXk7KEsn
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A7B026060A
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 20:01:11 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=dXk7KEsnrAEDJBl/C33ZcbqLfv/KCA96F8VApKfxVOrLwvA26zaKl/il/cPWriTsyT04gs+arYI6OuMZ83j19RBzSxpTCKXCXS7QC69ZlkkCz5DVk59E+gOnWerUQCAFNtZ4TfaxCulwCODnkvpaZCY2WJrtYx3nVdyhoYpZCVuXpnjkhYF353akCwWlipkIlTdq2zIt5pZ8uTISN75A/V/esIFEGUkwtASiSHDdKgkb3Zmq2TZfxvhhw064b7dRM9kPvm9VAv3ovEtxPonPscjVE/wbTws68LX+Gb3MUOuWLePz2FaR4llHlrRPNsdYf+612vW02XJNBM8kxK+vyg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=eaxg9vMXcYn8y/8h2dzHUp6fme4bfj1tYOkSIkyyTKM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -98822492; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 23 Aug 2026 20:01:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wyENO-0000000AOAk-1YCE;
 Sun, 23 Aug 2026 22:01:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260823092642.1284862-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 23 Aug 2026 11:26:42 +0200")
References: <20260823092642.1284862-1-bernd@kuhls.net>
Date: Sun, 23 Aug 2026 22:01:06 +0200
Message-ID: <87se44bo8t.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/clamav: requires DES in openssl
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

 > Buildroot commit 8b1d8dd25d39df120700666942278b1a99fef416 bumped the
 > package from 1.4.3 to 1.5.1 which includes upstream commit
 > https://github.com/Cisco-Talos/clamav/commit/8d485b9bfd26a91301592b99590a7eb2069dd905
 > that adds the usage of the OpenSSL crate from rust.

 > This crate depends on DES and causes build errors when missing:

 > /home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../i686-buildroot-linux-gnu/bin/ld:
 >  ../libclamav/libclamav.so.12.1.0: undefined reference to `EVP_des_ede3_cfb8'
 > /home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../i686-buildroot-linux-gnu/bin/ld:
 >  ../libclamav/libclamav.so.12.1.0: undefined reference to `EVP_des_ede3_cbc'
 > /home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../i686-buildroot-linux-gnu/bin/ld:
 >  ../libclamav/libclamav.so.12.1.0: undefined reference to `EVP_des_ede3_cfb64'
 > /home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../i686-buildroot-linux-gnu/bin/ld:
 >  ../libclamav/libclamav.so.12.1.0: undefined reference to `EVP_des_ede3_ecb'
 > /home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../i686-buildroot-linux-gnu/bin/ld:
 >  ../libclamav/libclamav.so.12.1.0: undefined reference to `EVP_des_ecb'
 > /home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../i686-buildroot-linux-gnu/bin/ld:
 >  ../libclamav/libclamav.so.12.1.0: undefined reference to `EVP_des_ede3'
 > /home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../i686-buildroot-linux-gnu/bin/ld:
 >  ../libclamav/libclamav.so.12.1.0: undefined reference to `EVP_des_ede3_ofb'
 > /home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../i686-buildroot-linux-gnu/bin/ld:
 >  ../libclamav/libclamav.so.12.1.0: undefined reference to `EVP_des_cbc'

 > Fixes:
 > https://autobuild.buildroot.net/results/b93/b9359c5c177f3e4bcef991cde3c2dcf412dee5de/
 > https://autobuild.buildroot.net/results/300/300721a882f3410528878db730aaff1aa6822986/
 > https://autobuild.buildroot.net/results/a16/a163a9229c04f638a46e6250dc135c475e5d1576/
 > https://autobuild.buildroot.net/results/7e8/7e88cba9974f6f5acd125b69b95b7269d8128886/

 > A backport to LTS branches should be considered.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
