Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2A8C98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C43940EF8;
	Thu, 24 Sep 2026 18:58:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qJo8p_6ijIy5; Thu, 24 Sep 2026 18:58:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6690140EE9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276286;
	b=E17dqAYyUXtyxQHH2urEGKky3PxbaacN8q4rfsrebA+3RbFVnRHrrFfQh1sC9/Fi8imH
	 7q9YoHpgCeliwWr/6fNXaR/Zx0iQh9nAL20BH6XDYEWCF4j+UveZjsVEfs/5yR64s4Wup
	 qekXpZmFLcwgzUWzfXmnRcqv12Z24I2BBlf10yuaZ2WVO6wjbocm04x8oG/UP60mdgRbm
	 W7wywGTHi012GLKtKGympWuFXPibmlislWOAj850FSQRlzMaMVlvHXM2q/mXJ9/aEzkE2
	 F/WSLIsRTB6hKYsDK0cCsvDAAM1gHbQ4q4yPwWtjlKspgUaJz097kKp52E6NKrQiXTg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276286;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=EBQiNV060NTs39iext58Nk4GekzIT0gdyEZLHuaKBwY=;
	b=Qc5sCqO0jDBTnqDt5JUGsumpb9OHvzW4kROE5T62cojULkzgT8KvTtc5DkBgN1BfCGY1
	 DMXatqyNLhib+e2Z25zCDOgOvrUmDh717LP1ww/MKue6lPiMxsb/+T/ZkzWDKTziThqNn
	 C/7M5Tfp5tUdXOOUWjKdXKBnkOC/YaegEu8XdaNMt6blu7tepkuB00LQPt1N0HvM+M154
	 GmYQUjwoeZ9s3k93/2r9MNg9pXWszvFj6BVLSk2PiqqVyEa0slW00Ze+Pv0u+runA+hhB
	 KvKzCz/m2KYHeSiaOH4oke5sA4mbEqscNXpQ0KbB8RJrhaFi5mfh9f2rvAbPtVqEbMA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276286;
	bh=EBQiNV060NTs39iext58Nk4GekzIT0gdyEZLHuaKBwY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=A9vFIe+UuGWRYr07QW4cOxGbs3proHkbqgtuI/L0kf2PXSLPBcypluKSaJ55QMddC
	 UiLmU4IFiK+n33hym2pOhk3c1SJUrPeAhTmjFHzr8EKsn5dq7HLFCh3VRxH1z4uVGK
	 //0dBWzgQY/RsKhzGBSG+lgZ4PTN8OdYV/ehxPS+ieo/yg2XfSiRlGlZKfKMnJdaai
	 Qq9QUsMWi+Bdp7xbMQsMqaf4+WbveG9Oumxckg2iXI0Ar1SprCVDu6qDXEz+Tcezl7
	 nNz2YRJS6eDc4P20AbEbHhdfj6chNcGy/Utm+ihaQl6l0dSEOJp8nBpJxXB7K32yL9
	 04MvayrIDHd6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6690140EE9;
	Thu, 24 Sep 2026 18:58:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9EFAB328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9006F40ACE
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QoMy3UL96UUU for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EC6AD40ADB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276205;
 b=dCwPwjeWexlYRaPSOoWco+UIcsnlutqUN0DMbPWnjLyhyRbtQfZ3Ess+PtKMJIM4p7O/
 BfTm23NXBpGjiDqKkCz2YOImvIt6lwhOgfIR4a4FaTvfMKYMOZ3Uqm0X4qeFZsc4tDj6V
 uijn4I5DUYlwDQv4760BkvzOAaek3DrK1Eimf4t8Pu9cYAazDmIK+ozAjBEMkdYLN0ofx
 n+uYKaA8HQEwvcwOimBSGPTPgxo/VkvB1lCgeXp21XRyoXe5BDm/rGJ5/4FnADnnpvYJ/
 WJbxy/8AYqd5thOU7tkOnxAHRAZ+/XsOLSsObyGMGAjgvojDTmbTIA21MvfVX9lS1BQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276205;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=iNRbaQMvC+vIciDdmAoI/DtcCUJ9hD0MZXK/qWA0ZO8=;
 b=E8OvtoJJpTGTzK5iM88ajlVVOffPpYoiH2k7fN5uIWJ0BMtLjMFVZUqsqC7ocQDqPPHe
 pO0vznf8QtIF5FRd+EPkNciH2XTpYOaIycsYB/BNkBB8FDPs+Unt52kMBmlWpGCF7iHZl
 zrpti8sqTg+QeWkVGYTLjpqnXio/xJQv9GtHWtQZdDlOHSGPoXudy8pK43J1PzOCrlZss
 GTXLIpiqNK2pq4opB5j7cIwSPsnNkaZfJoYIF91MVPpul1oEyGCMy2peZJWPDcRlhhS07
 JvwM30KlRNO845PwO1GI1YNSEnBaR5UnZ7+LCqYw42h0LcjRVFgdOiXxyvNXtsxhmMw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC6AD40ADB
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9020898323; Thu, 24 Sep 2026 18:55:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:33:08 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 022aa807334b5b14ef0df19a7ae442e048605c74
X-Git-Newrev: 686c5972e8aa7e7e919322f35737b1426fa80c63
X-Patchwork-Hint: ignore
Message-Id: <20260924185534.9020898323@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/gnuradio: fix
 dependencies of BR2_PACKAGE_GNURADIO_PYTHON
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2386265014534585660=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2386265014534585660==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/686c5972e8aa7e7e919322f35737b1426fa80c63
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

BR2_PACKAGE_GNURADIO_PYTHON selects BR2_PACKAGE_PYTHON_NUMPY, so it
should inherit its dependencies, but BR2_TOOLCHAIN_GCC_AT_LEAST_9 was
forgotten in commit 8b3993178d0ffae312d7dd0df70d30d1d3d88873, when
python-numpy got this gcc >= 9 dependency added.

Note that the existing BR2_HOST_GCC_AT_LEAST_9 dependency is correct:
it is there because gnuradio needs host-python-numpy at build time.

Fixes: 8b3993178d0ffae312d7dd0df70d30d1d3d88873 ("package/python-numpy: needs gcc >= 9")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c6986e6d2e284604bcac43bf9dfd79f3d028ef6d)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/gnuradio/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index d9ad650672..157f187c4a 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -80,6 +80,7 @@ config BR2_PACKAGE_GNURADIO_PYTHON
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	depends on BR2_HOST_GCC_AT_LEAST_9 # host-python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
 	select BR2_PACKAGE_BOOST_PYTHON
 	select BR2_PACKAGE_PYTHON_NUMPY # runtime
 	select BR2_PACKAGE_PYTHON_PYBIND
@@ -87,8 +88,8 @@ config BR2_PACKAGE_GNURADIO_PYTHON
 	help
 	  Enable python component
 
-comment "python support needs a glibc or musl toolchain w/ host gcc >= 9"
-	depends on !BR2_HOST_GCC_AT_LEAST_9 || \
+comment "python support needs a glibc or musl toolchain w/ gcc >= 9, host gcc >= 9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_9 || !BR2_HOST_GCC_AT_LEAST_9 || \
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
 
 config BR2_PACKAGE_GNURADIO_UTILS

--===============2386265014534585660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2386265014534585660==--
