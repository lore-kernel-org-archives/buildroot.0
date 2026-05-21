Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15A9CD5BAF
	for <buildroot@archiver.kernel.org>; Thu, 21 May 2026 21:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BF6B84D2A;
	Thu, 21 May 2026 21:37:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BA7nL6T8OU7A; Thu, 21 May 2026 21:37:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C42F84D28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779399449;
	bh=f0OdWhRchyyFkxN9Ba3OzT34s9wdPCQADOF2XPxzar8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=clt3n7f+PkvqNwrfRqp0CgkeWoCz/GT7SFRqvopnF/N8ZcErvcXptQ7S4gsFZQBRY
	 lIpScotbRaiywj0DhYmKBmPXfGSjF6WwUg0UAbOjxGm9J4DMAfNujJ8paNeixvE5qD
	 dPfWE1BbR/+003yFb5ZuqvonfNbybBYNMDpKrNI/5/Av+z3lsiDN5vaVyaRFan+Liq
	 eKqdRAmn1hmBU5zgIYY9MIcAT053h75uHbzj2Zoh/i6XRW33dGJc7BKid4rm8L7NLY
	 QwZHKqsl6nlCj33xYOiq17wu7+PbWrapkGOTgAqwdKG0frF2PMTLIVkCUNNxYjcugS
	 hxinu7hGzeytA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C42F84D28;
	Thu, 21 May 2026 21:37:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 58562265
 for <buildroot@buildroot.org>; Thu, 21 May 2026 21:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A70E42464
 for <buildroot@buildroot.org>; Thu, 21 May 2026 21:37:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wxhoLbMzCs50 for <buildroot@buildroot.org>;
 Thu, 21 May 2026 21:37:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EC64642463
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC64642463
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EC64642463
 for <buildroot@buildroot.org>; Thu, 21 May 2026 21:37:26 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -359686408
 for <buildroot@buildroot.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 21 May 2026 21:37:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wQB50-0000000CNgc-3biR
 for buildroot@buildroot.org; Thu, 21 May 2026 23:37:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 21 May 2026 23:37:22 +0200
Message-ID: <871pf4o359.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Qr+VjWoVjIXLsb04Ggwz80lus1gY5IhO6QVECA+Cf2wLQwqBNIbrEgll0lZXvgqicCC7KMxdVhCEsb6fkUJw7YS31qP5st0zFqFtNR70a8Qg6zjlCoEM0bx/WLmtseb+AJ9SDnpvskJbE1lKCapEHVkq0/UuhUVx2Axb7z+D6QV82/y+FuDu0NBdPer/1dP96h6JgMFI+LKSuUHvVBMLRBonER3dzFBi7nEk8KcSC2aEA/62MGQJOujgdAXrtTcC7hYM5KmgjDglBsRY7Y1cZAWH1GcHHvgcjLkfh0Qh4E3tgBAxWCMBqkxQHYYcUb9SXJy/d61ZA9D5P6kbuRy4JA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=4QKNZLQRg1vIqyWlu3BJNNfOHni4Czo9g8aCGB/Y3hk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=Qr+VjWoV
Subject: [Buildroot] Buildroot 2026.05-rc2 released
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

Hi,

Buildroot 2026.05-rc2 is released - Go download it at:

https://buildroot.net/downloads/buildroot-2026.05-rc2.tar.gz

or

https://buildroot.net/downloads/buildroot-2026.05-rc2.tar.xz

Or get it from Git:

https://gitlab.com/buildroot.org/buildroot.git (2026.05-rc2 tag)

Another week, another release candidate. For details, see the CHANGES
file:

https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05-rc2/CHANGES

Please give it a spin and report any problems to the mailing list or
bug tracker. Many thanks to the people contributing to this release:

git shortlog -sn 2026.05-rc1..

    16  Bernd Kuhls
     6  Giulio Benetti
     5  Julien Olivain
     4  Arnout Vandecappelle
     3  Thomas Perale
     2  James Hilliard
     2  Joseph Kogut
     2  Shubham Chakraborty
     1  Andreas Mohr
     1  Andreas Ziegler
     1  Dario Binacchi
     1  Dowan Gullient
     1  Florian Larysch
     1  John Ernberg
     1  Michael Nosthoff
     1  Peter Korsgaard
     1  Romain Naour

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
