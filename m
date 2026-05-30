Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0FACD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 08:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD20842DFD;
	Sat, 30 May 2026 08:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YYzp07xGTtOP; Sat, 30 May 2026 08:45:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AB0542DDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780130705;
	bh=+MCQQtwXjmJlsFURw/SNWHTDHnXPAb7R/XuwQbAqbvQ=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RUCJHaoCbb49Oeiroxr8oHbqGicXReu7cCiML+KB5QP/8qpaAM5sUIk6T6escQEUp
	 6VWKxQM+U9YVOBrGzHa9Oh76go/x3XYKaVemUnPlOhm4q23GZeIAhx2WERATo0jLK7
	 88s26bqGQaUij2hnWJjWcD82T4r2k3KIJ7SoG2KTrq4EBJbLbsLtrKmO+Jav1yJe7L
	 cL7d6HJHnr8XEgjcATUls7SDoDOEozXNctCrKHQXiS4z2ozef1DD/JNPu3S5RMN1/o
	 2haa8Ka91pP5hkjvkEms0M4h0m6r1Txo83B42kJDCcRBtgnkD6wf+rz/Aq6RNN3gfo
	 rC4oqyW2OLqNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AB0542DDB;
	Sat, 30 May 2026 08:45:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AA0FEF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A80F85068
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nzp5eOkLL9HA for <buildroot@buildroot.org>;
 Sat, 30 May 2026 08:45:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1B7C885062
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B7C885062
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B7C885062
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:45:01 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2142708618; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 30 May 2026 08:44:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wTFJP-00000004iZe-15Gu;
 Sat, 30 May 2026 10:44:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260519182017.890742-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Tue, 19 May 2026 20:20:15 +0200")
References: <20260519182017.890742-1-bernd@kuhls.net>
Date: Sat, 30 May 2026 10:44:55 +0200
Message-ID: <87pl2d8ewo.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=LtHGG6k/ZJSL2KsmLMI7RWeDQ/h8JdXJgXPLyAEGUUxYSEbM+5NGOosg9PZl4ohJWkiLsAdc03kb+Ea+svd83wTwon2P2IC42XMU1xy3Zi/Sw6t/J8TMXW3lKnELQ+BCTpoCa+imTq0TJfjlKL+jr8Pan7tD5v7l2YbezB7mBFomfw7YiFjMLMNqsMN2inBaldyB1o+Ov8VAEGDtPF1/XIFZ8R53v69vHYZX5SMUzv0ND3dYbJmYdiMz+/4jDBbCCedvSCe+r54ahj1A0I6iAjUE2uDznchMbQOrPCxJDiOaJx4+AvYZUpoBndf2AvU2AwJVVdrJVVQV7OWG+kIIgQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=V58gyv2WZPLzUvoBjE0+OcwkPaGUc35fkWw5zd6TOSE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=LtHGG6k/
Subject: Re: [Buildroot] [PATCH v2 1/1] package/busybox: security bump
 version to 1.38.0
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

Hi,

 > https://www.busybox.net/news.html
 > Removed patches which are included in this release, renumbered remaining
 > patches.

 > Patch 0006 was removed because its fix is included in upstream commit
 > https://github.com/vda-linux/busybox_mirror/commit/9a8796436b9b0641e13480811902ea2ac57881d3

 > which also adds a new Kconfig option, disabled by default, to fix
 > CVE-2023-39810. To improve security we enable this option by default.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > v2:
 > - updated BUSYBOX_IGNORE_CVES comments (Fiona)
 > - added CONFIG_FEATURE_PATH_TRAVERSAL_PROTECTION to config files (Fiona)

Committed, thanks.

It is a bit unfortunate that there is no git tag corresponding to the
1.38.0 tarball (presumably Denys forgot to push), but I have verified
that the tarball corresponds to:

commit fc71374dfccd46448c62947269a35f1420d7ee28
Author: Denys Vlasenko <vda.linux@googlemail.com>
Date:   Wed May 13 04:20:15 2026 +0200

    Bump version to 1.38.0

    Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>

See the discussion on the busybox list:

https://lists.busybox.net/pipermail/busybox/2026-May/092326.html

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
