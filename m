Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AAEDCD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 08:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5633642E32;
	Sat, 30 May 2026 08:53:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mydDAKXS0J92; Sat, 30 May 2026 08:53:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88E7242E2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780131228;
	bh=Os/NrMmvVaPfOdRd0UdIVnalX1ThJHShPi0phP7oAZw=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L0gPy/dMxgumJ/4lYO0+TjSM4z95WbloUK6Ial6tqXkQasM7yODBawIYqpGAVGX+g
	 cSwzlXX1hPnYf1t3gIVgAfFT4x1ldXeyNsdix8tFNz8BUfAlemyGnRiEwPYyZwTh/T
	 OAVYXZZ3OA+zgJHRekSwrvp5U8YU+dVWCcZgifKHK8tZ3L1BhpT2FlJJPfg3Vhc2kn
	 JOv3BzqoLkmmQRFq4RKf8P8+w8y6lJoXfaijuSaBATTv7DlfL3AnMjSpNaoLhxy99h
	 EqP/WLe54sbLV3o7GMiScDNtHJrmEl9lVBeYvLG5XA8EGsWsyQ4VOjNJ6JFbUvcRIw
	 wBs4QN95Kn1xQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88E7242E2E;
	Sat, 30 May 2026 08:53:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D923D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2EF46F493
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:53:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q4mP32hDC-vc for <buildroot@buildroot.org>;
 Sat, 30 May 2026 08:53:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D966860BF3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D966860BF3
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D966860BF3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:53:45 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2067020044; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 30 May 2026 08:53:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wTFRt-00000004j2U-2OKl;
 Sat, 30 May 2026 10:53:41 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>,  Daniel Price
 <daniel.price@gmail.com>,  Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,  Danomi Manchego
 <danomimanchego123@gmail.com>,  Titouan Christophe
 <titouan.christophe@mind.be>,  Olivier Schonken
 <olivier.schonken@gmail.com>
In-Reply-To: <20260529094514.178266-1-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Fri, 29 May 2026 11:45:08 +0200")
References: <20260529094514.178266-1-thomas.perale@mind.be>
Date: Sat, 30 May 2026 10:53:41 +0200
Message-ID: <87jysl8ei2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ksBqnYtljxoB7UwARpt5dyRWHP72C9+S8vwTeu2B9iuHR6Xbf4e2PLFNlAcShxhucXw2xfN8QyGZjld0pGRMt3wolY8z8m02yTJnU2OH5t0Wir+PU509EXZKYlSRDA1E3WPQ2NlyXeT2npChZ4yxRcy54V1wNw6tSvVoiVrcGNcU++R3fcPGk5tWAB2OjKGMIDkrN74dh5JV/YUFFEYPY5oTkBJZTd624tEcn7zsQBzb+DHd6NPBuMSUBFGONJgPraedoHHrAid+LK4EhpLgzUtkpeWjlFSTY8AakJsnfhMXW0AC8Ea5t7IqTQuS4ZThEElkMonUfhPWiygpusHH5g==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=cMW9bSBLjFQDaX1REFTcY4k+J3XjOp55gnjimCudA/U=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=ksBqnYtl
Subject: Re: [Buildroot] [PATCH] pacakge/jq: update CPE vendor
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

 > The CPE "cpe:2.3:a:jqlang:jq:*:*:*:*:*:*:*:*" is valid for this package.
 > See the GHSA [1] and the associated CVE [2].

 > [1] https://github.com/jqlang/jq/security/advisories/GHSA-rmpv-jgvr-wpr9
 > [2] https://nvd.nist.gov/vuln/detail/CVE-2026-44777

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>

NIT: You are adding the vendor, not really updating it. Committed after
fixing that (and the package typo), thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
