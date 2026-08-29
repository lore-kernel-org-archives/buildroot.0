Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7F4C61DD6
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 20:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3979605EC;
	Sat, 29 Aug 2026 20:07:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0CkBiU2uqzyn; Sat, 29 Aug 2026 20:07:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788034042;
	bh=7xdnX0z5zfAa5W3UhQQoPY5/2KO1GDkRZ0mIHaLidFQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M48zABz+bg2gEHejydUxC6u3V0DMzUD/3O/QvzSqGGU77ll7t5AMTaDhk6MimRFJc
	 RtxugdNEAUZ8I7HOAq2mh+LhN/YdmCC8zL9uUBsOsnb/bQTu99UuWLlVUI3oub6tN0
	 nZbs0hQOxTMUW6i+B5DSFv2u6J8XdhemTphhUxIzOIsfmye6drAVrL9jh78VZTVvli
	 /cMHg18mZaXbvI1UOjqR54k0IrRUcDt1nGjHUORwY9usyV10jdb99SZVUWvHiuren+
	 iP8511ypSY6bcfmHDL3Bp7FVlL6g7EYsc+mGUKQvdhG6+esyD319Pe2TlbVRx6CIT4
	 9jmhVir90KGFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B8D1605E9;
	Sat, 29 Aug 2026 20:07:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CC64B355
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 20:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA0DC4006F
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 20:07:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2RD-kIpcrN9K for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 20:07:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=SFs1nmOZ
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F8FD40059
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 20:07:17 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=SFs1nmOZ6kinyrZSI/thDiIj9I3aFR5KhlsT85rSgYU4nEWr+VKKrwsf2dRXRL0JH9/Oq0d1gZR3Q0968M5ZiXWu7S+lN6eKcaGurJAVU5CyAeHNk0h/7C7YqnMzQRzwJzjob6hMILyhb4o5uHuJKvSoHDRS4V5dRRd9hxhCC9tC4gutcEYFSKDaxr21O1SN1yq6AbaeSTbySAze5fv9WPYpnG7iNVyhgNOiHbPPC5koiz9avTd5tEmmHq71HIiNb/HUUFAlzGTDm86ArRwGvxomrjQ91GbRFPHio5L299dLlZ0vECi2h61r7p9dH5JBhdAGWtDEcYWPF5U7+rvmHw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=fxyhE63nWe7h64v9eGWxdX8/9ntxwhlc8KFVDQ6G+/g=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1230405736
 for <buildroot@buildroot.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 29 Aug 2026 20:07:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x0PKc-000000007KH-0bO6
 for buildroot@buildroot.org; Sat, 29 Aug 2026 22:07:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 29 Aug 2026 22:07:14 +0200
Message-ID: <87h5kcsnbh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2026.08-rc3 released
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

Buildroot 2026.08-rc2 is released - Go download it at:

https://buildroot.net/downloads/buildroot-2026.08-rc3.tar.gz

or

https://buildroot.net/downloads/buildroot-2026.08-rc3.tar.xz

Or get it from Git:

https://gitlab.com/buildroot.org/buildroot.git (2026.08-rc3 tag)

Another week, another release candidate. For details, see the CHANGES
file:

https://gitlab.com/buildroot.org/buildroot/-/blob/2026.08-rc3/CHANGES

Please give it a spin and report any problems to the mailing list or
bug tracker. Many thanks to the people contributing to this release:

git shortlog -sn 2026.08-rc2..

    17  Thomas Petazzoni
    13  Bernd Kuhls
     5  Julien Olivain
     5  Romain Naour
     4  Thomas Perale
     3  Peter Korsgaard
     2  Neal Frager
     2  Titouan Christophe
     2  Waldemar Brodkorb
     1  Adam Ford
     1  Thomas Devoogdt
     1  Thomas Perale via buildroot

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
