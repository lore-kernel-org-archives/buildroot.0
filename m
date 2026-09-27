Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A22C98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DC22605CF;
	Sun, 27 Sep 2026 10:52:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P_sf3zwguSis; Sun, 27 Sep 2026 10:52:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 32BB9605EB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506357;
	b=TSnkqlp2mFegC5YvKhPLbMHm8R8AkRHpiPfnunok1hPAUS6mNt2lGAgX8RVC55dRVlkh
	 UA6MrnpJOOPVBHlv/YyHwaCygzb17WiYrw63JkOB1/x/7WzR25OOYpfzHHmQtERr1xpYX
	 qPmn/KFBg/IcPUOYUVoBaTifEkR43NN2DfYvIOzGu/82De//1fpL0GikTxwtcPzuECn6y
	 FWEPlwmiSfWIOoO+el1Lji+sFtCb5qITRe7THZTx8eZ3wlhLzRNPd5gGg+/BtOr6XHTY+
	 5j3mNBbC8F3FvTaEGOHvMJRkBvBSptBcJN2mDjUMRdVKu83didM5jZ8My4c0PLGXjXg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506357;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=H/xtggbnyvqt+j8kx+1NGF6WljtvwDjU9lMiE5c7JtA=;
	b=jpfZ9qVeQJkbUM0c1qM8J9IScA3XK87p7CTI5NJFNx46PBVc/Wftrh9UloqaqQsOXWQG
	 zTSOFS+RViAYd1trORissro+GsfulHpPrZOXUzhMMB8iu9OtF9+FwPOOvz2zTgrltd/QG
	 EKdKZZMcNjIfKapNW6+NBVM75bYTDugD24OIvoybzrss1p8u1EBs5dL4kTyJzn8GcP6cQ
	 zWsOQczRPpvXxuepcvmXzlnrAT3nVgUDjiLqmyF7sEvirSwKlSmMHCeTQ9eP2A2cMRFan
	 y3g1CV9M/GDe+DziUQd45MmvPaSY5UVAosC5iPBcZT0dz1sijV6EvNgu6mD5kprKszA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=ZikFJJAY;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506357;
	bh=H/xtggbnyvqt+j8kx+1NGF6WljtvwDjU9lMiE5c7JtA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CxKtNKqiuefJ02aSDwkM9mWDS2mAV9ClkywFXsRprV4SMq66OveWAat1dNZD59hpG
	 S1enpSTgvL45as4pTk9J6H+ZB3kYLOlVr3hDguy26mSKBvfOgV+LXVzgeJOczRlhVw
	 YCYYURUAD/D4ZXIIi6GqT0DhRciVxsV4vEEbLg4JNqpV/VPQHpofEcWxS7+pKBnXuL
	 01a4FHqO2pmh6lcGBYH5bBkik1/x7mCGH0SaMuWFPWXS3/cXTYQIrL3QaX2dEAdGtE
	 jLMedjfirHkrOZWAvqEMmsXZ7Nh0y7eUGIIu6sJAst56kwONkss4wwXz+eH9XbLXbN
	 esoACy+SGMP2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32BB9605EB;
	Sun, 27 Sep 2026 10:52:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 056E5335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFCD3605EB
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:52:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id skbbB462YFRm for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:52:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7E155605CF
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506354;
 b=QyaG9DcFgJVr0oXTactHwRUhynFTPMOmUs+apVrOFoyzv/f7yoSfqP1q5zusjzgA683V
 6Zs6BwPW9ibqHJsG7+OmDBp1l0Wsi0GT7OdBsY6fS1qXhJAdyF+FuRIYZTW8ehg2V/uCT
 i9lfBfKzvD5KTiQGuj2wPcu1l2HSMdGcnaZ25aqyYhI8QUkartbZW3AxXS552GQGQGWj/
 0dWvEkxWNuuh9uriSRmohw7qetKZhcUokp4wUdZx13tI8AkE7vCr+DgGun1gKxCgcSdho
 zldOfgF6mvkp9NO9mc6FwdGxQZestDMYBkNrKxhs4K8EZEPevpwrroE7s70SDfGtjNg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506354;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Wi/SqCb6ilf9B271PpGQT4JuX9X5SNliz8hIFsDZkOU=;
 b=hXs1My208mmfoPXfve4WNiX4DYvG8K2B0i4LgmhASe0+gce6eXjCDEyGbhVxlt4oMzGM
 z+aQ2dv2eWCYRBAWKx46svedwmQqK830/ouzOjh4D9+gCw8HfinNBlsLnNzu6tg//vQhu
 K8O3yxG8d+FiiT+R9DOk3IfJenevUT1MktHCC7xfoLLUaISmWBbKmfWdAljRm4EjsoELN
 IoRa5M855O55E57eFCD68O0Hp0/+2CM0rTwpu9cVZV+L1sDRs3qMafBBL2RVDfJQS+g88
 QpxsjFzDZWUyY8hwdx4HBd44l9EeRldtz1gWGennk3A187NEPGFp9SUAek7aGLasGCQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ZikFJJAY; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ZikFJJAY
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E155605CF
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505851;
 bh=Wi/SqCb6ilf9B271PpGQT4JuX9X5SNliz8hIFsDZkOU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ZikFJJAYS1NwekIgo3jZg2B3wpbKC8QMKL9mbUPoFLYH1ArM0xCBaANwRfLSxkyjG
 uwVrZN9xt7zJgx8D8eQpqV/21Yaf8vQTNt7kZUTf1/jaHSKpQnirw4FtgwiWE5EEXp
 Zy610kxYUnj/B3Q695cWHBgha2gNfCoqAHDLbaWwJzpKRIW8/VLwUWzfM+tTaH7UCL
 bnTob9F4XST2GY1Wt+FlGeqQWI0vjIW0H7F+cecn/KqWfBs+Bwh9VIoA2zo91oMplZ
 oIJscNcZWIkZjsS18oqpaPEHfw4ZRckG3aCWPkR5rhij1iGAfiIAMnZVNx31eKuzxD
 lpgbUO52jUg/w==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 uG529hfxnIUxNxepc+zy00uP1Puh3Mukavu63/6MpE/da8pT8Cg0quiTaPMtOqyz0CJ7F+gMUBQ
 orAnYWRDjOfIHnP7/qSPrDR/QloeUOG2gkSRsn/sT+Ect5wwUz0pYB9NHTlrinmoPJf5+ToNZyH
 f7Hp7a1sIZ4RKePyjQG8F2Qhcw/TGb4ZdfrJX4KIWvlLy0z62acBA3vpy1nNpF9VqM062LrdwP3
 F/UkUBQO3z4D0Opdn462hS47TpJONXmbCHw3NwzXfHu9+hCqiU2Jw+NmOxcaQzBawbfS+sJSzvA
 6XgDy8LkvhEKXOA/mVNiXkV8irgCYEkeBbSE4jQRDOQ8DLyREElivQzpDVL3ZRCjk2uEJhbFiGJ
 3herKVadG+YRG1LfV6rQTOkmQL7XPnCy/X9torAxyGqB0DwWcPOoELzCdT9pV18zSfISSnNstBH
 Nz39YkxNwmgOjQ2B7pm1LeYrlXeje87pHx/9DFDUM2/fNIPA9Ed/L01V0dXQ+VqPW2tCt+osVUk
 61et3FOkhXS3eHmDowTrYChHsG0I+nIoFDfPOn8jp2J9FafLa31eC2Sl0hkaRILzhvR7M9xWGHG
 G4Ebfx2AEZHSJzehJ9JwQv5XErokPFgxmiQo0tkAXAKStYT5apWCkHYmXsj3Y5yoBTaXd3HkU0T
 BSvR/6fbBQdRpm6yuz05c
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 793E3A4C4FA6;
 Sun, 27 Sep 2026 12:44:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLY-0000000007a-3H9o;
 Sun, 27 Sep 2026 10:43:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:41:57 +0200
Message-ID: <20260927104301.1801638-20-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v6 19/82] package/boost: update C++ version
 dependencies
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
Cc: Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Michael Nosthoff <buildroot@heine.tech>

1.84: Atomic, Chrono, Filesystem, Log, Random, Stacktrace, Test and
      Thread require C++11
1.85: Boost.System requires C++11
1.86: Boost.Graph requires C++14
1.88: Boost.JSON dropped support for GCC versions older than 5

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/boost/Config.in            | 90 +++++++++++++++++++++++++++++-
 package/log4cxx/Config.in          |  5 ++
 package/python-libconfig/Config.in |  5 +-
 package/resiprocate/Config.in      |  4 ++
 package/zmqpp/Config.in            |  5 +-
 5 files changed, 103 insertions(+), 6 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 93ba15df50..dede9b946e 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -19,9 +19,13 @@ if BR2_PACKAGE_BOOST
 config BR2_PACKAGE_BOOST_ATOMIC
 	bool "boost-atomic"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	help
 	  C++11-style atomic<>.
 
+comment "boost-atomic needs a toolchain w/ C++11, gcc>=4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 config BR2_PACKAGE_BOOST_CHARCONV
 	bool "boost-charconv"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
@@ -33,9 +37,13 @@ comment "boost-charconv needs a toolchain w/ C++11, gcc>=4.9"
 
 config BR2_PACKAGE_BOOST_CHRONO
 	bool "boost-chrono"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	help
 	  Useful time utilities. C++11.
 
+comment "boost-chrono needs a toolchain w/ C++11, gcc>=4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 config BR2_PACKAGE_BOOST_COBALT
 	bool "boost-cobalt"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
@@ -55,7 +63,6 @@ comment "boost-cobalt needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
-
 config BR2_PACKAGE_BOOST_CONTAINER
 	bool "boost-container"
 	help
@@ -92,6 +99,7 @@ config BR2_PACKAGE_BOOST_CONTRACT
 	bool "boost-contract"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_condattr_setclock
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread -> atomic
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # boost-thread
 	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  Contract programming for C++.
@@ -99,6 +107,11 @@ config BR2_PACKAGE_BOOST_CONTRACT
 comment "boost-contract needs a toolchain w/ NPTL"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
+comment "boost-contract needs a toolchain w/ C++11, gcc>=4.8"
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 config BR2_PACKAGE_BOOST_COROUTINE
 	bool "boost-coroutine"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
@@ -163,15 +176,20 @@ comment "boost-fiber needs a toolchain not affected by GCC bug 64735"
 config BR2_PACKAGE_BOOST_FILESYSTEM
 	bool "boost-filesystem"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	select BR2_PACKAGE_BOOST_ATOMIC
 	help
 	  The Boost Filesystem Library provides portable facilities to
 	  query and manipulate paths, files, and directories.
 
+comment "boost-filesystem needs a toolchain w/ C++11, gcc>=4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 config BR2_PACKAGE_BOOST_GRAPH
 	bool "boost-graph"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
 	select BR2_PACKAGE_BOOST_MATH
 	select BR2_PACKAGE_BOOST_REGEX
 	select BR2_PACKAGE_BOOST_SERIALIZATION
@@ -180,14 +198,22 @@ config BR2_PACKAGE_BOOST_GRAPH
 	  The BGL graph interface and graph components are generic, in
 	  the same sense as the the Standard Template Library (STL).
 
+comment "boost-graph needs a toolchain w/ C++14, gcc>=5.0"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5
+
 config BR2_PACKAGE_BOOST_GRAPH_PARALLEL
 	bool "boost-graph_parallel"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # boost-graph
 	help
 	  The PBGL graph interface and graph components are generic, in
 	  the same sense as the the Standard Template Library (STL).
 
+comment "boost-graph_parallel needs a toolchain w/ C++14, gcc>=5.0"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5
+
 config BR2_PACKAGE_BOOST_IOSTREAMS
 	bool "boost-iostreams"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # boost-random
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_BOOST_RANDOM
@@ -196,8 +222,12 @@ config BR2_PACKAGE_BOOST_IOSTREAMS
 	  Boost.IOStreams provides a framework for defining streams,
 	  stream buffers and i/o filters.
 
+comment "boost-iostreams needs a toolchain w/ C++11, gcc>=4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 config BR2_PACKAGE_BOOST_JSON
 	bool "boost-json"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++11
 	select BR2_PACKAGE_BOOST_CONTAINER
 	help
 	  Boost.JSON is a portable C++ library which provides containers
@@ -206,6 +236,9 @@ config BR2_PACKAGE_BOOST_JSON
 
 	  To use the library "header-only" this option is not needed.
 
+comment "boost-json needs a toolchain w/ C++11, gcc>=5.0"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5
+
 config BR2_PACKAGE_BOOST_LOCALE
 	bool "boost-locale"
 	# When boost-locale is enabled with icu support, Boost no
@@ -231,6 +264,9 @@ comment "boost-locale needs a toolchain w/ dynamic library"
 	depends on BR2_PACKAGE_ICU
 	depends on BR2_STATIC_LIBS
 
+comment "boost-locale needs a toolchain w/ C++11, gcc>=4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 comment "boost-locale needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
@@ -240,6 +276,7 @@ config BR2_PACKAGE_BOOST_LOG
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	select BR2_PACKAGE_BOOST_ATOMIC
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_REGEX
@@ -252,6 +289,11 @@ comment "boost-log needs a toolchain w/ NPTL"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
+comment "boost-log needs a toolchain w/ C++11, gcc>=4.8"
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 comment "boost-log needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
@@ -304,7 +346,7 @@ config BR2_PACKAGE_BOOST_PROCESS
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
 	select BR2_PACKAGE_BOOST_CONTAINER
 	select BR2_PACKAGE_BOOST_CONTEXT
-    select BR2_PACKAGE_BOOST_DATE_TIME
+	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	help
 	  Library to create processes in a portable way.
@@ -330,6 +372,7 @@ config BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 config BR2_PACKAGE_BOOST_PYTHON
 	bool "boost-python"
 	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # boost-graph
 	select BR2_PACKAGE_BOOST_GRAPH
 	help
 	  The Boost Python Library is a framework for interfacing Python
@@ -337,11 +380,19 @@ config BR2_PACKAGE_BOOST_PYTHON
 	  classes functions and objects to Python, and vice-versa,
 	  using no special tools -- just your C++ compiler.
 
+comment "boost-python needs a toolchain w/ C++14, gcc>=5.0"
+	depends on BR2_PACKAGE_PYTHON3
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5
+
 config BR2_PACKAGE_BOOST_RANDOM
 	bool "boost-random"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	help
 	  A complete system for random number generation.
 
+comment "boost-random needs a toolchain w/ C++11, gcc>=4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 config BR2_PACKAGE_BOOST_REGEX
 	bool "boost-regex"
 	help
@@ -356,32 +407,47 @@ config BR2_PACKAGE_BOOST_SERIALIZATION
 config BR2_PACKAGE_BOOST_STACKTRACE
 	bool "boost-stacktrace"
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	help
 	  Gather, store, copy and print backtraces.
 
 comment "boost-stacktrace needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 
+comment "boost-stacktrace needs a toolchain w/ C++11, gcc>=4.8"
+	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 config BR2_PACKAGE_BOOST_SYSTEM
 	bool "boost-system"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	help
 	  Extensible Error Reporting.
 
 	  This library is now header only. Building a stub library
 	  is still supported for backward compatibility.
 
+comment "boost-system needs a toolchain w/ C++11, gcc>=4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 config BR2_PACKAGE_BOOST_TEST
 	bool "boost-test"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	select BR2_PACKAGE_BOOST_EXCEPTION
 	help
 	  Support for simple program testing, full unit testing, and for
 	  program execution monitoring.
 
+comment "boost-test needs a toolchain w/ C++11, gcc>=4.8"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 config BR2_PACKAGE_BOOST_THREAD
 	bool "boost-thread"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::current_exception
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	select BR2_PACKAGE_BOOST_ATOMIC
 	select BR2_PACKAGE_BOOST_CHRONO
 	select BR2_PACKAGE_BOOST_CONTAINER
@@ -390,6 +456,11 @@ config BR2_PACKAGE_BOOST_THREAD
 	help
 	  Portable C++ multi-threading. C++11, C++14.
 
+comment "boost-thread needs a toolchain w/ C++11, gcc>=4.8"
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::current_exception
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 comment "boost-thread needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
@@ -403,10 +474,16 @@ config BR2_PACKAGE_BOOST_TYPE_ERASURE
 	bool "boost-type_erasure"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # boost-thread
 	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  Runtime polymorphism based on concepts.
 
+comment "boost-type_erasure needs a toolchain w/ C++11, gcc>=4.8"
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 comment "boost-type_erasure needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
@@ -430,6 +507,7 @@ config BR2_PACKAGE_BOOST_WAVE
 	depends on !BR2_m68k_cf
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # boost-filesystem
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_SERIALIZATION
 	select BR2_PACKAGE_BOOST_THREAD
@@ -439,7 +517,15 @@ config BR2_PACKAGE_BOOST_WAVE
 	  preprocessor functionality packed behind an easy to use
 	  iterator interface.
 
+comment "boost-wave needs a toolchain w/ C++11, gcc>=4.8"
+	depends on !BR2_m68k_cf
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 comment "boost-wave needs a toolchain not affected by GCC bug 64735"
+	depends on !BR2_m68k_cf
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 endif
diff --git a/package/log4cxx/Config.in b/package/log4cxx/Config.in
index 8305217a48..4eddc1a227 100644
--- a/package/log4cxx/Config.in
+++ b/package/log4cxx/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_LOG4CXX
 	depends on BR2_USE_WCHAR # mbsinit
 	depends on BR2_USE_MMU # apr
 	depends on BR2_USE_WCHAR || BR2_TOOLCHAIN_GCC_AT_LEAST_7 # boost
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # boost
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS || BR2_TOOLCHAIN_GCC_AT_LEAST_7 # boost-thread
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 || BR2_TOOLCHAIN_GCC_AT_LEAST_7 # boost-thread
 	select BR2_PACKAGE_APR
@@ -30,6 +31,10 @@ comment "log4cxx needs a toolchain w/ wchar or gcc >= 7"
 	depends on !(BR2_USE_WCHAR || BR2_TOOLCHAIN_GCC_AT_LEAST_7)
 	depends on BR2_USE_MMU
 
+comment "log4cxx needs a toolchain w/ gcc >= 4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_USE_MMU
+
 comment "log4cxx needs a toolchain not affected by GCC bug 64735"
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/python-libconfig/Config.in b/package/python-libconfig/Config.in
index 00688719ee..f0d56602ac 100644
--- a/package/python-libconfig/Config.in
+++ b/package/python-libconfig/Config.in
@@ -1,6 +1,6 @@
-comment "python-libconfig needs a glibc or uClibc toolchain w/ C++, threads"
+comment "python-libconfig needs a glibc or uClibc toolchain w/ C++, threads, gcc>=5.0"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_TOOLCHAIN_USES_MUSL
+		BR2_TOOLCHAIN_USES_MUSL || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 config BR2_PACKAGE_PYTHON_LIBCONFIG
 	bool "python-libconfig"
@@ -8,6 +8,7 @@ config BR2_PACKAGE_PYTHON_LIBCONFIG
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# error: invalid use of incomplete type 'struct _IO_FILE'
 	depends on !BR2_TOOLCHAIN_USES_MUSL
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # boost-python -> boost-graph
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_PYTHON
 	select BR2_PACKAGE_LIBCONFIG
diff --git a/package/resiprocate/Config.in b/package/resiprocate/Config.in
index ba68ad8e59..584f8d9e86 100644
--- a/package/resiprocate/Config.in
+++ b/package/resiprocate/Config.in
@@ -32,6 +32,7 @@ config BR2_PACKAGE_RESIPROCATE_DTLS_SUPPORT
 
 config BR2_PACKAGE_RESIPROCATE_REND
 	bool "resiprocate-rend"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # boost-system
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_OPENSSL
@@ -40,4 +41,7 @@ config BR2_PACKAGE_RESIPROCATE_REND
 	  Rend is tool that is was created specifically to load test
 	  gtSIP based presence servers.
 
+comment "resiprocate-rend needs a toolchain w/ C++11, gcc>=4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 endif # BR2_PACKAGE_RESIPROCATE
diff --git a/package/zmqpp/Config.in b/package/zmqpp/Config.in
index 8c08b9d862..a913e71b89 100644
--- a/package/zmqpp/Config.in
+++ b/package/zmqpp/Config.in
@@ -21,15 +21,16 @@ config BR2_PACKAGE_ZMQPP_CLIENT
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
 	depends on BR2_USE_WCHAR # boost
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # boost
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	help
 	  Build and install the zmqpp client, a command line tool that
 	  can be used to listen or send to zeromq sockets.
 
-comment "zmqpp client needs a toolchain w/ dynamic library, threads, wchar"
+comment "zmqpp client needs a toolchain w/ dynamic library, threads, wchar, gcc>=4.8"
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_USE_WCHAR
+		|| !BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 endif
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
