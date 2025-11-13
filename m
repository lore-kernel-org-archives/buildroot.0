Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E0FCD5BAE
	for <buildroot@archiver.kernel.org>; Thu, 13 Nov 2025 09:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78F1B407D2;
	Thu, 13 Nov 2025 09:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id di7cz9fhA11x; Thu, 13 Nov 2025 09:46:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 055FC40667
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 055FC40667;
	Thu, 13 Nov 2025 09:46:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F30E3158
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFC1B404BE
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:46:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g4iUYX_x0u71 for <buildroot@buildroot.org>;
 Thu, 13 Nov 2025 09:46:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CCC8B404E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCC8B404E9
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCC8B404E9
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:46:38 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1583217342; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 13 Nov 2025 09:46:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vJTuS-002BNR-0R;
 Thu, 13 Nov 2025 10:46:32 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>, Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org,  Simon Dawson <spdawson@gmail.com>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  Carsten Schoenert
 <c.schoenert@gmail.com>,  Lionel Orry <lionel.orry@gmail.com>,  Fabrice
 Fontaine <fontaine.fabrice@gmail.com>
References: <20251106204522.3273683-1-bernd@kuhls.net>
 <20251106204522.3273683-10-bernd@kuhls.net>
Date: Thu, 13 Nov 2025 10:46:32 +0100
In-Reply-To: <20251106204522.3273683-10-bernd@kuhls.net> (Bernd Kuhls's
 message of "Thu, 6 Nov 2025 21:45:16 +0100")
Message-ID: <87zf8qnu2v.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=I9TAvYGxb/dAZIv7v/R4y1xhXv97AHXbI7zuQCTSHS5Fo4ziD9Fh70F6LrE66Rq40ok9nwtH6+I5Yy7leL0IgHFx/YICp6D8XaNlIbzLXY6w181OaLxB7u9tDebu5kckz1zd8yKIMQiuUGobBfzeZdPn61zzmxIX/R0NzEkctwVyfQFK3G+MqskdtnL1SMm3W8vggZrXTWTMU3HBOR6ZZu99oMRIQAWEE0ZzX1cixoGZTjv9i5q0q2AG0DUNrlBqF8Queu85bwON8p6rkQNeE3UE5DDTX/bPeGFd+wKFTpvNxYCVArmXsuC0tZIvuFDMKrvGEAROY1cpsUf5q1GYtQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=A4klYLaz3/cG1i51knJ8XsbhEJagOouNFIe9+MA1wLw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=I9TAvYGx
Subject: Re: [Buildroot] [PATCH v3 09/14] package/expect: remove package
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

 > Package is unmaintained and causes build errors with gcc >= 14.x:
 > https://sourceforge.net/p/expect/bugs/107

 > Fixes:
 > https://autobuild.buildroot.net/results/425/425dadaa4a75eae9331351172839402a197749a5/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Nema, I know you wanted to keep it but I still haven't seen any bugfixes
for the autobuilder issues:

https://autobuild.buildroot.net/?reason=expect-5.45.4

It can always be readded if a developer steps up.

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
