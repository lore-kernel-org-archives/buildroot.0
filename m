Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38F8C4829A
	for <buildroot@archiver.kernel.org>; Sat, 10 Feb 2024 09:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46F7C4090D;
	Sat, 10 Feb 2024 09:32:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RrB9soNvkKEN; Sat, 10 Feb 2024 09:32:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 539204090E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 539204090E;
	Sat, 10 Feb 2024 09:32:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C3B861BF25B
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 09:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACE1C405F9
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 09:32:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w_NuECxFROH7 for <buildroot@lists.busybox.net>;
 Sat, 10 Feb 2024 09:32:21 +0000 (UTC)
X-Greylist: delayed 7880 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 10 Feb 2024 09:32:21 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8705D4016D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8705D4016D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.70.40.130;
 helo=mail-40130.protonmail.ch; envelope-from=cjts@protonmail.ch;
 receiver=<UNKNOWN> 
Received: from mail-40130.protonmail.ch (mail-40130.protonmail.ch
 [185.70.40.130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8705D4016D
 for <buildroot@buildroot.org>; Sat, 10 Feb 2024 09:32:21 +0000 (UTC)
Date: Sat, 10 Feb 2024 09:32:00 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <OMSrLj3kDtDll4-Ofu6yacSybx-Zy5Se_kfLtX3og4wFi256KTFvnNxCoo-zWkklZQfERwk_odXaL8S0LS0PJqKDqCzi_KF3bIX6kdWZwOI=@protonmail.ch>
Feedback-ID: 6739919:user:proton
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=protonmail.ch; 
 s=protonmail3; t=1707557538; x=1707816738;
 bh=3u0xeEH/EQWhoqiMfjewio3NUcs+ijK2slzSmFi+Pdw=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=hLWSKKEVZd3MkFBFp8kqvdpjlSNN4Lhn3zM8Yc+dXc/lUKy5Jtqkka6WOMb1zUaSN
 k0aF828Wp6M9cN9b1qlPBxZA/9L/za8veMAtArAGzdsxIhhLR9Q9SqIb5+mGQWEAPG
 XzAwELjeotklfvhs0O+u2HcGihPOCoEGdVpf65hNR0hqLxP74C2v5HF+4rbgIYlKsx
 1j2D01uSGXec2S5HjWMvvUeTqygzt996Gt0YlQLyLIBx5SulZ2oA0TDoUag/LgP+1h
 oDsUzzpVygnPGJuKWkkjtdusKlk2mqWiXs08olEPV0+CZd0ACU5H9yda7+/CNWrsfA
 20Mch5WI760XA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=protonmail.ch
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=protonmail.ch header.i=@protonmail.ch
 header.a=rsa-sha256 header.s=protonmail3 header.b=hLWSKKEV
Subject: [Buildroot] Unable to build host python3.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: cjts via buildroot <buildroot@buildroot.org>
Reply-To: cjts <cjts@protonmail.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi

I checked out the master branch at  8ab4a0a348b255a074d16b640e8a372fe94596dc and tried to build a defconfig (x86_64) with HOST_PYTHON3 enabled.

The install part fails thus:
ost/lib/python3.12/lib-dynload/_tkinter.cpython-312-x86_64-linux-gnu.so
/usr/bin/install -c -m 644 ./Lib/shutil.py /mnt/vmtmp/buildroot/output/host/lib/python3.12
/usr/bin/install -c -m 644 ./Lib/signal.py /mnt/vmtmp/buildroot/output/host/lib/python3.12
/usr/bin/install: cannot stat 'Modules/_tkinter.cpython-312-x86_64-linux-gnu.so': No such file or directory


I looked at the makefile.pre.in but I cannot see why tkinter is being included. 

Cheers

CJ
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
