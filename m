Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D556BEF06E3
	for <buildroot@archiver.kernel.org>; Sun,  8 Feb 2026 17:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2C374047B;
	Sun,  8 Feb 2026 17:36:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cq12EaEycukm; Sun,  8 Feb 2026 17:36:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75A2040445
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770572204;
	bh=3CkQFn6Yr11XURWQ09moqOf7Bqw5S7DJKIGSE31bA+E=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=JuKxFcHetqDg3QGwW1lbk3RAux01BZ0EFn1uAlIERAtG1zjnGMtVJkwhKbkz5ITTN
	 ByIpa4u0AdgnIFVl0ac6iOtChz379wT//+AFy9fuVa1Ma7O9oeK9Ls6yYJJQ/++9zs
	 Gs4DwmXQuWJuTl6WMWNN/I3xysIYno5YHF9mcrZso8F2OGNeOdacSK804TUreZOfst
	 4ZDwyJuqFPc8EiuP7PxMTDEqPYBOfxBT127ckYBlqZ/Z2NduISn+OZHSe91YevHyjq
	 vfiHpLmCa/sySAutSZSJpak3UVg6xSbN2U0JtvWQtA8wC4Ry4+MjGTGoGwoK3PenhE
	 axw1+yLa/9g+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75A2040445;
	Sun,  8 Feb 2026 17:36:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 54E59219
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 17:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39F5740323
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 17:36:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YJ0qAcqFh4bg for <buildroot@buildroot.org>;
 Sun,  8 Feb 2026 17:36:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 382DA40070
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 382DA40070
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 382DA40070
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 17:36:41 +0000 (UTC)
Received: from localhost.localdomain (unknown [82.65.104.223])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 97F80780371;
 Sun,  8 Feb 2026 18:36:36 +0100 (CET)
To: buildroot@buildroot.org
Cc: Romain Naour <rnaour@gmail.com>,
	Vincent Jardin <vjardin@free.fr>
Date: Sun,  8 Feb 2026 18:36:25 +0100
Message-ID: <20260208173627.881651-1-vjardin@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770572199;
 bh=vnLWEBk7H4q1vJqMqsuuadpK9gDrOLKjsho5xulrwcw=;
 h=From:To:Cc:Subject:Date:From;
 b=c/HDvjx1WPlOqjiN2N8xwflobfgU5Y2EPQSnNwvKVHH5rUrpj4l84fhFMLw/yDIkP
 TonUg3kTBfSPmEKxqP7PCwN6guDufzGv6+3Mq0bcOmuGe55Ixa+m/bKCYUPHZYiruI
 YVeEEkb75uLfj2wOFw1spF5bKE1AHIA5UMYwtPuDUpibI5q8kAIA6awZR7UrBqoeDD
 oPIkQKQwhxkPfUzqKA98w2o8tDBdTypkTXSJheOuo4jgVWiTGXgcBKWUgMsfr/xOWB
 frhNrG/gQqPqWdzPRy89ZRGVziwslRq+h94niMWjKwfA+tNrUiLxJUH2/k2Zcw7hXV
 xgZ4ntuiTnskA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=c/HDvjx1
Subject: [Buildroot] [PATCH v2 0/2] new packages: rpmsg-utils and
 rpmsg-echo-test
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

Add two new packages from the OpenAMP system reference examples [1]:
rpmsg-utils and rpmsg-echo-test.

Both packages share the same upstream repository and download tarball
(via _DL_SUBDIR = openamp-system-reference), but build from separate
subdirectories (examples/linux/rpmsg-utils and
examples/linux/rpmsg-echo-test respectively) and install distinct
binaries.

As Romain noted, the runtime test setup would require a remoteproc
running in QEMU together with a baremetal/RTOS firmware on the remote
core, which is complex to achieve at this stage. Keeping both as
regular packages for now is the simplest path; a runtime test can be
added later once the QEMU + remoteproc infrastructure will be in place.

[1] https://github.com/OpenAMP/openamp-system-reference

Changes v1 -> v2:
  - split into a 2-patch series: rpmsg-utils (new, patch 1/2) and
    rpmsg-echo-test (patch 2/2)
  - both packages share the same source tarball using _DL_SUBDIR
  - fix rpmsg-utils hash filename to match the auto-derived
    download name

Vincent Jardin (2):
  package/rpmsg-utils: new package
  package/rpmsg-echo-test: new package

 DEVELOPERS                                   |  2 +
 package/Config.in                            |  2 +
 package/rpmsg-echo-test/Config.in            | 17 ++++++++
 package/rpmsg-echo-test/rpmsg-echo-test.hash |  3 ++
 package/rpmsg-echo-test/rpmsg-echo-test.mk   | 36 ++++++++++++++++
 package/rpmsg-utils/Config.in                | 17 ++++++++
 package/rpmsg-utils/rpmsg-utils.hash         |  4 ++
 package/rpmsg-utils/rpmsg-utils.mk           | 45 ++++++++++++++++++++
 8 files changed, 126 insertions(+)
 create mode 100644 package/rpmsg-echo-test/Config.in
 create mode 100644 package/rpmsg-echo-test/rpmsg-echo-test.hash
 create mode 100644 package/rpmsg-echo-test/rpmsg-echo-test.mk
 create mode 100644 package/rpmsg-utils/Config.in
 create mode 100644 package/rpmsg-utils/rpmsg-utils.hash
 create mode 100644 package/rpmsg-utils/rpmsg-utils.mk

-- 
2.43.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
