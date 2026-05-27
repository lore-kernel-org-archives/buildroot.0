Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056BCCD4F54
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 22:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 855E14267B;
	Wed, 27 May 2026 22:56:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AjhUC_8rniUk; Wed, 27 May 2026 22:56:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77DDF42678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779922601;
	bh=IVlfijnhcwV+600y5xkK9RwM52++rhx9IJWDuRKT9oA=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j7COODyb8hXuh71cUd1i8MEQi67DhGvD3cpxRBCRN00Y8TqckLWmTrz7p1RAb3OZa
	 62vvTl2JAMgoqmUzzJr7D+uGlNRhG/jDDQOejW032yWHgjbDKDRFIlRNxCpr30KRsh
	 SA9vlLETlWWn5ozvAo0kbQHrAWj3lZEZjfNHO4VOQYaDoyUcE2VYetJRTKxTXqEdTH
	 +h3FPtZlW2ZPave8K7RrBv+Lvc28gAr4xp8TXDJw0dNEWU5CLnhhCK5xCHuG1kQZ91
	 n8f0NoFQlNKNfee7LctG0mMNc4Ux3fUXxZj/Ow1PCKyH3gNt8STlRdJhvGvuTHID1c
	 y3Kd29K1qsk8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77DDF42678;
	Wed, 27 May 2026 22:56:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 88E9428A
 for <buildroot@buildroot.org>; Wed, 27 May 2026 22:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 673ED42667
 for <buildroot@buildroot.org>; Wed, 27 May 2026 22:56:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c4goWrfravSF for <buildroot@buildroot.org>;
 Wed, 27 May 2026 22:56:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C76D24267A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C76D24267A
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C76D24267A
 for <buildroot@buildroot.org>; Wed, 27 May 2026 22:56:37 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -608745044; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 27 May 2026 22:56:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wSNAv-000000014dP-35uf;
 Thu, 28 May 2026 00:56:33 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>,  Romain Naour
 <romain.naour@gmail.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260527122510.674604-1-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Wed, 27 May 2026 14:25:10 +0200")
References: <20260527122510.674604-1-thomas.perale@mind.be>
Date: Thu, 28 May 2026 00:56:33 +0200
Message-ID: <87y0h4lavy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=IPQucG6Awdu3NFktQmAnLO7YRh0SgoIL/6nwkHgzu7Gg9qObYyeWs541G1wu89ySaWEbiB5iKj4e2Oaad1/QgJ5vLdwrWbfyaMLvq5ErBwqZYAMS777iM/czN8rUFi1x86PkGt4iKJMi3aj1RlvIKCPtYGbUumR3C1Wp30+VKrw03iCtmatytqVTVGamIVo3TqP0L54Ew4Suaz3JKb195G/H4iSN/VQOR55QRe3z3G+B5ZdFmnUneLqLOp0qPcoGTXrcEHIvpf+oetr8A+jIKWlA1m9nGIBAwLpVEBL5q19Jc9d1nHIGwPmSdoJuWB7BlR5ZJzDnIPFcTpTJ9qOs0A==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=Gj4KKFR6Oo/e1Uohr0vLpyGKnCajjAXa8qHR8X/z7gQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=IPQucG6A
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/{glibc,
 localedef}: security bump to version glibc-2.41-137-gb676adadb
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

>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:

 > Fixes the following vulnerabilities:
 > - CVE-2026-4046:
 >     The iconv() function in the GNU C Library versions 2.43 and earlier
 >     may crash due to an assertion failure when converting inputs from the
 >     IBM1390 or IBM1399 character sets, which may be used to remotely crash
 >     an application.    This vulnerability can be trivially mitigated by
 >     removing the IBM1390 and IBM1399 character sets from systems that do
 >     not need them.

 > For more information, see:
 >   - https://www.cve.org/CVERecord?id=CVE-2026-4046
 >   - glibc-2.41-135-g61737f43b1f0d9f64a6f16649625476b70f9f4d3

 > - CVE-2026-4437:
 >     Calling gethostbyaddr or gethostbyaddr_r with a configured
 >     nsswitch.conf that specifies the library's DNS backend in the GNU C
 >     Library version 2.34 to version 2.43 could, with a crafted response
 >     from the configured DNS server, result in a violation of the DNS
 >     specification that causes the application to treat a non-answer
 >     section of the DNS response as a valid answer.

 > For more information, see:
 >   - https://www.cve.org/CVERecord?id=CVE-2026-4437
 >   - glibc-2.41-131-gdbd8335c8ce8af11226ee1514d7a020b15c63345

 > - CVE-2026-4438:
 >     Calling gethostbyaddr or gethostbyaddr_r with a configured
 >     nsswitch.conf that specifies the library's DNS backend in the GNU C
 >     library version 2.34 to version 2.43 could result in an invalid DNS
 >     hostname being returned to the caller in violation of the DNS
 >     specification.

 > For more information, see:
 >   - https://www.cve.org/CVERecord?id=CVE-2026-4438
 >   - glibc-2.41-132-g502861645bb1baf650d58e2ddd6b230bc26676c9

 >> git shortlog 2.41-123-gfb4db64a0..glibc-2.41-137-gb676adadb

 > Carlos O'Donell (2):
 >       resolv: Count records correctly (CVE-2026-4437)
 >       resolv: Check hostname for validity (CVE-2026-4438)

 > DJ Delorie (1):
 >       include: isolate __O_CLOEXEC flag for sys/mount.h and fcntl.h

 > Florian Weimer (8):
 >       Switch currency symbol for the bg_BG locale to euro
 >       nss: Introduce dedicated struct nss_database_for_fork type
 >       Linux: In getlogin_r, use utmp fallback only for specific errors
 >       nss: Missing checks in __nss_configure_lookup, __nss_database_get (bug 28940)
 >       iconvdata: Fix invalid pointer arithmetic in ANSI_X3.110 module
 >       posix: Run tst-wordexp-reuse-mem test
 >       Use pending character state in IBM1390, IBM1399 character sets (CVE-2026-4046)
 >       Linux: Only define OPEN_TREE_* macros in <sys/mount.h> if undefined (bug 33921)

 > Michael Jeanson (1):
 >       tests: fix tst-rseq with Linux 7.0

 > Xi Ruoyao (1):
 >       elf: parse /proc/self/maps as the last resort to find the gap for tst-link-map-contiguous-ldso

 > Yury Khrustalev (1):
 >       posix: Fix invalid flags test for p{write,read}v2

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Acked-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
