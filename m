Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96A4E7FDD8
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 21:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 727A86067D;
	Mon,  2 Feb 2026 21:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gUzmJheSHi1J; Mon,  2 Feb 2026 21:21:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BA166072B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770067315;
	bh=5Y7PFmuB9LxszPcdAM8onwP1AMXM8Xtyd/jO0RxKo9M=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RM1ITpfHUuCqnK5ievmh5b56/Ae9HMYjHE3ZAZEH11D75yGzQaKa6qmDzTuyFfURM
	 uobUFUDR3L9/BD7+qk4LeNPvFrtn7xpwHeuc3j79gCpGDgOdQDALxxCpz1s+yT4s7h
	 NDcKS1ncBs6lBpMfbddTH4lu8WMSQsxPGj0SUu+hvH4G/38qVguzXEqdeF1hq3lidU
	 Kbu/jcTN4q+jW8yE0fOHcJUon+UU07cKd/dKQ2z2r+wul+tun9gSKpYdoRkRsIJh39
	 n60pavwYabRwRQTatpmff7HKtw8bsxj6pHwq7vZiCzpWxequbftvxMSzR+bjyywgxu
	 cpiSnTCyfiNPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BA166072B;
	Mon,  2 Feb 2026 21:21:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AFA8F5
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFB58826C0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:21:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5LapbH0BL388 for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 21:21:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BFAE2826A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFAE2826A8
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BFAE2826A8
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:21:51 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 630988471; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 21:21:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vn1Mi-00000007eq0-3ZtR;
 Mon, 02 Feb 2026 22:21:48 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20260202104139.42125-1-thomas.perale@mind.be> (Thomas Perale via
 buildroot's message of "Mon, 2 Feb 2026 11:41:37 +0100")
References: <20260202104139.42125-1-thomas.perale@mind.be>
Date: Mon, 02 Feb 2026 22:21:48 +0100
Message-ID: <87ikceu9hv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=RrCVO38aiwWyKPCg9o7PVHko2HyKD0LEcMbrLHCxWk4NBJ1uUhw81VwK0vTnfUXo9ZTpsIVwXuz1cM13pmX1GfVnfoszXKFs8WGgl3/fBtwuLUt+Uc+y+iQpS3Ic9nfSYJK6mUbta3rlEdeTeNo0NtcrQ73yDpg5O9nOh+tsokndeVjIb4jjue2OjIhdfqqQ8To4uN6trfLcwlqX8O6Zx+/YAahGCiiyko0QiADZnNGPs7YZcRds3xKtjJ1DqxUhGHpBqIig5NaQayMpVbCqB1QORjJUjHT6JC+RkweN5U7y1UPBJ4N6dztIyPxykRIfmRlG/n375akvRFn7g6XAAA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=aYMlmIyXzi9C6bMX8R29SBerGLVGoDDq19TdceN2HQ4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=RrCVO38a
Subject: Re: [Buildroot] [PATCH] package/busybox: add patch for
 CVE-2025-46394
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

 > Fixes the following vulnerability:
 > - CVE-2025-46394

 > In tar in BusyBox through 1.37.0, a TAR archive can have filenames
 > hidden from a listing through the use of terminal escape sequences.

 > For more informations, see:
 >   - https://nvd.nist.gov//vuln/detail/CVE-2025-46394
 >   - https://git.busybox.net/busybox/commit/?id=f5e1bf966b19ea1821f00a8c9ecd7774598689b4
 >   - https://patchwork.yoctoproject.org/project/oe-core/patch/20250928221332.1308547-1-peter.marko@siemens.com/#31415
 >   - https://lists.busybox.net/pipermail/busybox/2025-October/091743.html

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>
 > ---
 >  ...archive-sanitize-filenames-on-output.patch | 58 +++++++++++++++++++
 >  ...-tests-fix-test-after-cve-2025-46394.patch | 33 +++++++++++

I guess the testsuite patch is not strictly needed, but it also does not
really hurt - So committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
