Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A661D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F228826EA;
	Wed,  7 Jan 2026 17:54:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EBmYwtxYyryM; Wed,  7 Jan 2026 17:54:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80AA9821DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808492;
	bh=ujWkeWubDvMZyFbz0pHBzVQv+OxRrM4RzS6Yye8rcNY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=CQ9F59q3EtXzTR4qgRlAquEbeycvP7IjW17fi8AOriOsEIsK0BNLZt6kY7X6tm5KF
	 pKpaTqldBm9O05m7eU7jA/aV1wDHse1Yqp5pT12N+HpV6VJwqO7fhQg3DO95NdYGFX
	 7Cw45tyooiv6m4akg01lfjMmTxs/d2+7ZrDpsrG8so92l7rwUfc4dKFo052hkOmSab
	 iyezLMNdI/1XtqxOBbKqKsdHuHJfd3MTo9YU0WJm5aeW74uNTcuL1vyNp8O5EGTNA0
	 +1FPi7dhSlReP21Q2bu5sqNdNx/GsPhRTmXcTqt+1tKdsZV+wsFEBHme2nLazCeNUE
	 MiMdHGRt/uhfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80AA9821DB;
	Wed,  7 Jan 2026 17:54:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DCC029ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8C6F40160
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:54:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kklELSKabwUq for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:54:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CD9B540128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD9B540128
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD9B540128
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:54:50 +0000 (UTC)
Received: from postman.. (unknown [IPv6:2a01:e0a:2af:22b0:1db5:e71:2517:bbf7])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E1A4313F86E;
 Wed,  7 Jan 2026 18:54:47 +0100 (CET)
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Date: Wed,  7 Jan 2026 18:54:44 +0100
Message-ID: <20260107175446.2470125-1-vjardin@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767808489;
 bh=jbGjfURue8zudrkDUfIG6oUeNNm6O54lLLRdm9jnLtE=;
 h=From:To:Cc:Subject:Date:From;
 b=o3rQgX1FCKTZ2jokRb3G1cCGMIXysvNH7k+owL+FpOQhATw4/Dz9PSJ7jG5MZxthC
 NlIGWk08jYhN+a2jDBcitLFAJbLxG46vgvj0JcuOBPDVvbUsvOx1BQGeIkeormR4TP
 b/QVW+hEZftXFqfksTxH3MSL/mTp9LjxkQQ4WQCjfSvN9hvrx8HSrWQXsNmkM3MlTv
 9rQ5BB7H7Qkdfi7vBK1a0kDdobByIt7pCUDuJzFWsC9xxIo9BZQOcFnGFv9yjNMxva
 wRQUluc8MIeVn5CvJMmJlqrtMmciJrnn4dZRmIRuT2WmYcoT9d5A0NfcluR12onup5
 snQa2S0Ux1vmQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=o3rQgX1F
Subject: [Buildroot] [PATCH v1 0/2] Add python-libyang and python-sysrepo
 packages
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series adds Python bindings for libyang and sysrepo:

- python-libyang: Python CFFI bindings for the libyang YANG library,
  providing the 'libyang' Python module used by higher-level tooling.

- python-sysrepo: Python CFFI bindings for the sysrepo YANG datastore,
  providing the 'sysrepo' Python module. This patch also includes a
  fix for sysrepo build on riscv32.

Both packages include proper dependencies on Python3 with uClibc/kernel
headers constraints (Python3 requires kernel headers >= 5.1 on uClibc).

CI build verification:
https://gitlab.com/vjardin/buildroot/-/pipelines/2249634938

Vincent Jardin (2):
  package/python-libyang: new package
  package/python-sysrepo: new package

 DEVELOPERS                                 |  2 ++
 package/Config.in                          |  2 ++
 package/python-libyang/Config.in           | 23 +++++++++++++++++++
 package/python-libyang/python-libyang.hash |  5 +++++
 package/python-libyang/python-libyang.mk   | 21 +++++++++++++++++
 package/python-sysrepo/Config.in           | 26 ++++++++++++++++++++++
 package/python-sysrepo/python-sysrepo.hash |  5 +++++
 package/python-sysrepo/python-sysrepo.mk   | 18 +++++++++++++++
 package/sysrepo/sysrepo.mk                 |  7 ++++++
 9 files changed, 109 insertions(+)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
