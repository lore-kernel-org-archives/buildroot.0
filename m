Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16011E98E0C
	for <buildroot@archiver.kernel.org>; Mon, 23 Feb 2026 08:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 567296076A;
	Mon, 23 Feb 2026 08:42:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YIgqbn6xD1sK; Mon, 23 Feb 2026 08:42:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 253456074A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771836139;
	bh=zAqbVqTzt2+Fr/f61gpej4Qjo/GeJQjK8CBEulcScPc=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S+sNkMRFrR4okSttZnghwA36WnZ+tS61/i56UZrTAb6nmXAYAQ5wWv93HJ7Kw/6+t
	 aXrLxIlaJBs1g4ZMOdxTcWhL+WDnfIVQvVCgIfHKaS2l33uPznM5aztdb0aHfjWeKV
	 lz357l9NEsfv43z6Gf8G/jtTbfO15aqOBGu9YF9joSOk9UYZviKk+QuyS62siJG2VH
	 SSdEWAkufvqBnnUuZlXqJC48lMvy2l4Cxht6uW+Qe1j2+HqJEZ/Nu+s8O+LVSzQ/lV
	 qGotFNvAf6da39qOavFz/6AxSJZTt3g0Ym0hhieJ83yyLP0SMIoeZyC+N9jJX1IYB+
	 Lw6p+3v2ql86g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 253456074A;
	Mon, 23 Feb 2026 08:42:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 56506237
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 08:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C2DA6074A
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 08:42:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E4teXMV3kwq7 for <buildroot@buildroot.org>;
 Mon, 23 Feb 2026 08:42:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F22176072D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F22176072D
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F22176072D
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 08:42:15 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -176253269; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 23 Feb 2026 08:42:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vuRW6-000000018x5-27zt;
 Mon, 23 Feb 2026 09:42:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Adrian Perez de Castro <aperez@igalia.com>
In-Reply-To: <20260218195812.2983207-2-bernd@kuhls.net> (Bernd Kuhls's message
 of "Wed, 18 Feb 2026 20:58:12 +0100")
References: <20260218195812.2983207-1-bernd@kuhls.net>
 <20260218195812.2983207-2-bernd@kuhls.net>
Date: Mon, 23 Feb 2026 09:42:10 +0100
Message-ID: <87wm03g8bh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Arc01iD9sqwU5jAwJSTX9Qk4oDg+lLQTHmVHtKrp51CNyG9WE/a1ovwUT7s+cmY6GZa5c7hjdD7aoISiJY0k5FDjQs2IRmSbYFn62z3CEEJSuz5NAoEoLsDx9h7cHPFcVcpfnZdMGzeHMmiBL6NalEQ13pdLRuOM04rOBx4+b/cIrHMg1yutREJQ/1QsHco/ro5MVYt2/Tx/6w4/mHz7NySSNxuMqf0L+2dBXmT2UtzAYUk5e+09xhpIADYpZZ4W70gczOgyLIL8iUZIu8C2/Czon1PX5+ZArwqSQK2Lo/EYmnGEjy9PoE+/YVt/hgkXPAhVk7Uu+9Cl8o6LFlzUcw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=KUmOynVNMF384lO3eenvuAiu3BKL8if4gYllXXpa3AU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=Arc01iD9
Subject: Re: [Buildroot] [PATCH 2/2] package/wpewebkit: security bump to
 version 2.50.5
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

 > From: Adrian Perez de Castro <aperez@igalia.com>
 > This updates WPE WebKit to the 2.50 stable series.
 > WPE WebKit 2.50 highlights and 2.50.[1-5] release notes:

 > - https://wpewebkit.org/release/wpewebkit-2.50.0.html
 > - https://wpewebkit.org/release/wpewebkit-2.50.1.html
 > - https://wpewebkit.org/release/wpewebkit-2.50.2.html
 > - https://wpewebkit.org/release/wpewebkit-2.50.3.html
 > - https://wpewebkit.org/release/wpewebkit-2.50.4.html
 > - https://wpewebkit.org/release/wpewebkit-2.50.5.html

 > Fixes the following security issues:

 > - From https://wpewebkit.org/security/WSA-2025-0007.html
 >   CVE-2025-43343

 > - From https://wpewebkit.org/security/WSA-2025-0006.html
 >   CVE-2025-43272, CVE-2025-43342, CVE-2025-43356, CVE-2025-43368

 > - From https://wpewebkit.org/security/WSA-2025-0005.html
 >   CVE-2025-31273, CVE-2025-31278, CVE-2025-43211, CVE-2025-43212,
 >   CVE-2025-43216, CVE-2025-43227, CVE-2025-43228, CVE-2025-43240,
 >   CVE-2025-43265, CVE-2025-6558

 > Removed patch 0001 which is included in this release.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
 > [Bernd: bumped to 2.50.5, removed two patches originally added by Adrian
 >  which were added to upstream version 2.50.2]
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
