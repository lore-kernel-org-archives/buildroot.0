Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F271077604
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 18:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4F9E61057;
	Wed, 18 Mar 2026 18:41:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l4kCea0sUjeb; Wed, 18 Mar 2026 18:41:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10B7C60D5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773859284;
	bh=iTuBI4uVjArVPY/6U7JoTBTkzdDWpoZrxccJDeInPbo=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=rkX3kE1ynuDKXw0LFcnZkO+XiwtfdLbOU8yyFqlqDspItY4iMFokchVKQKxXRNIgJ
	 Tfx/0K2/6BEXRRm9hkJaygAw8JvMEOhHgJZbTUFyzNnRr2VjxcOIwfN/tsoPAtIex1
	 oNBtv04gm4My4Q+mEE7AX7MR4O+wN3jjmh7j9RTZFnHdfq4s5362ooPAlm40ZSwHe7
	 2+Xq8o2Z0oYcWFlfJf2il/Z1C+uG0BL4wEpDbAyqGEyOBPlf22ggvhCf4Rxcc++0mc
	 Q6k4NWgvEjtFc7Tn7GStmbk46OQ5SeDfhiQEjDOscKCVXtGkqnytfcXwdtNrQnF12r
	 X6QLfxvJyBORA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10B7C60D5C;
	Wed, 18 Mar 2026 18:41:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5589F1BD
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46FD660C22
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:41:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jfd5Zwrf0tbk for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 18:41:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.11.138.130;
 helo=gloria.sntech.de; envelope-from=heiko@sntech.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CCB7760C09
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCB7760C09
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CCB7760C09
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:41:17 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Etienne Carriere <etienne.carriere@foss.st.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, heiko@sntech.de,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Date: Wed, 18 Mar 2026 19:41:07 +0100
Message-ID: <20260318184110.2121178-1-heiko@sntech.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
 bh=TDpmR5+kx/VSqSbJHNL3rl9qmLUFWFrrgOp5Xi30cFU=; b=r9OLDi1I5dJLvtG4Nh7qIqQlBb
 0n4l9A4EG18YXepHx79XdCnueXbFb6lGFBtlKzCJInZbt+/sZrku6O+DBkxY5lpBksrBSOQ9lGc++
 58eW2pINIoMZzxp+9bjjrYdducsdksD2qpwqnmW1SQgLWd2QCrMiUmkqmiRHYNwbIn5wPU9VUe7DN
 qfMuTxjqCF76YEhunbgEJEXXTfIC/+mYVJ4BULyDAcdYXrxyaHNWmWXHDKLYaKCBh34lpTl/LOiET
 LOK7nQs4LB53Z629DMWP3CbW06fd7HOPelBksX9wUncyG2sRN00C5xAw/QZJokTOCcJ7SHB3O5UYI
 C5abK7tg==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=sntech.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256
 header.s=gloria202408 header.b=r9OLDi1I
Subject: [Buildroot] [PATCH v2 0/3] Set custom CPE_ID_VERSION when using
 custom sources
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
From: Heiko Stuebner via buildroot <buildroot@buildroot.org>
Reply-To: Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Heiko Stuebner <heiko.stuebner@cherry.de>

Linux, U-Boot, OP-TEE allow using custom sources that not directly declare
their base-version, but instead either will report "custom" or a
git/hg revision as their version.

When generating a cpe string using that, any tooling needing that, for
example CVE checkers using the show-info / sbom will report incorrect
results in that case.

So for these cases, allow declaring the software version that is hiding
in the sources that is used.

changes in v2:
- v1 didn't reach the mailinglist due to me not having subscribed yet
  but already some people directly in Cc
- Don't use 2 symbols when 1 is enough (no bool + string, just a string)

Heiko Stuebner (3):
  boot/optee-os: add option to override the CPE_ID_VERSION
  boot/uboot: add option to override the CPE_ID_VERSION
  linux: add option to override the CPE_ID_VERSION

 boot/optee-os/Config.in   | 11 +++++++++++
 boot/optee-os/optee-os.mk |  3 +++
 boot/uboot/Config.in      | 11 +++++++++++
 boot/uboot/uboot.mk       |  3 +++
 linux/Config.in           | 12 ++++++++++++
 linux/linux.mk            |  3 +++
 6 files changed, 43 insertions(+)

-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
