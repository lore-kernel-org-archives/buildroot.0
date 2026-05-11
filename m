Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D43CD3427
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 10:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B96841330;
	Mon, 11 May 2026 10:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QLn3iJXRRvgu; Mon, 11 May 2026 10:01:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6957D40DE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778493705;
	bh=uahQkbEjXAdBcL9vGSIqCir6YSTtb1HsG7A0myAM7SM=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mYWaqmxom4VTNxyNmmb+zPmXM6LfsHczKArS7Fc56h0nmSnqAokdn4sVnWssJj0zL
	 ogrOY4ZqlRkOHPhFEqJdrJaIyetoUQSRsqn1KTfHqwvqEw9UfEthgbFYdEFNa0rTo3
	 H2k0wJfrQI7csXMoE80srQonVrjrsstIJhMDmOpo3xlaEyRv+ZUZLIweR1dLB0R5Ud
	 aPRSMXB/3U91WdAu09FhZ+3li4eK4sxOBVh5Lbf0Wzf/JSzOPHMCFjyAK7yTz0J0Wj
	 8t4E/fBYcH4aH2IlG86YYLR639Jolko2KEcpCwA5/JdTT5BK5jWpp1aXAploGUFQdQ
	 ZPVOiBmMXIfXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6957D40DE8;
	Mon, 11 May 2026 10:01:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F5B8223
 for <buildroot@buildroot.org>; Mon, 11 May 2026 10:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74DA340DE8
 for <buildroot@buildroot.org>; Mon, 11 May 2026 10:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r6rSgpfyBR1a for <buildroot@buildroot.org>;
 Mon, 11 May 2026 10:01:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5D21740A7A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D21740A7A
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D21740A7A
 for <buildroot@buildroot.org>; Mon, 11 May 2026 10:01:42 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 901624967; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 11 May 2026 10:01:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wMNS8-00000009Cdf-0GQ2;
 Mon, 11 May 2026 12:01:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260511062425.1243680-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Mon, 11 May 2026 08:24:25 +0200")
References: <20260511062425.1243680-1-bernd@kuhls.net>
Date: Mon, 11 May 2026 12:01:32 +0200
Message-ID: <878q9qp8n7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=EwYYj5PqTNo6G10ByMgjHo6wOU7AUG+/Ay3AC+wabCYZTNPyikGCcbeN5Co44kQuVRy1w/UPxiep+l7krplQvOqUqaEgSBA1wZnqZ9epGU8zRepX9FIHeuuus9ByQp3iXrCTvkOJnc1ehss4fgjvrNheyJ2qEJuJEjc50lrfRTX+tJxbVZaAwDBnJioKhadVk0kBBE8Xl0yd5vbzAB2ScRS9+xQdGZKAkrloyk4CVjVJYMXedOZBRtWslkuQ/lVW1NSZxDIEUk3HdsCXbkpXnB1fjlHHjCQG2BcC7+ex4bmk7540sQ01MuG6jthxoLwyS966rc1j2H/vWD+SJtJg7w==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=QUFbdWojWcCRHtMrkeXEfpazNUzEifWcG+JpNJK0BlE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=EwYYj5Pq
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: security bump version
 to 3.14.5
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

 > https://www.python.org/downloads/release/python-3145/
 > https://docs.python.org/release/3.14.5/whatsnew/changelog.html

 > This release includes various security fixes:

 > gh-148178: Hardened _remote_debugging by validating remote debug offset
 >  tables before using them to size memory reads or interpret remote
 >  layouts.
 > gh-149254: Update Android and iOS installer to use OpenSSL 3.0.20.
 > gh-149017: Update bundled libexpat to version 2.8.0.
 > gh-90309: Base64-encode values when embedding cookies to JavaScript
 >  using the http.cookies.BaseCookie.js_output() method to avoid injection
 >  and escaping.
 > gh-148395: Fix a dangling input pointer in lzma.LZMADecompressor,
 >  bz2.BZ2Decompressor, and internal zlib._ZlibDecompressor when memory
 >  allocation fails with MemoryError, which could let a subsequent
 >  decompress() call read or write through a stale pointer to the already-
 > released caller buffer.
 > gh-148169: A bypass in webbrowser allowed URLs prefixed with %action to
 >  pass the dash-prefix safety check.
 > gh-146333: Fix quadratic backtracking in configparser.RawConfigParser
 >  option parsing regexes (OPTCRE and OPTCRE_NV). A crafted configuration
 >  line with many whitespace characters could cause excessive CPU usage.
 > gh-146211: Reject CR/LF characters in tunnel request headers for the
 >  HTTPConnection.set_tunnel() method.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
