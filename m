Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4DBC98324
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 19:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4CDE412A3;
	Thu, 24 Sep 2026 19:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LD308uyfW4Ac; Thu, 24 Sep 2026 19:00:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C3DF4411F9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276411;
	b=pVyphmt02E+tkqzpBJfeATAdM7Whm+0yAButRUuPt3k1g7QXLICnp7vigTbn4XGxLQxO
	 4OaQBH0NS6nBXGY5TIgrGzXyaCNPpsLADz+hQFoTREGKpy2We1viXtc7ldFTA002HJ7dg
	 hhQc0oofcoAJv9hfMCiN7YFxbjSlT63jrpr2les54N+NdcL+JeSJ/nywpuvU1wg2PUgog
	 90X/u+sPjTNaI5XEds+JDbJtdjcehNA6MA75UYaSgrbBqM3RB3uK4rmokblCy88RLypLF
	 9dXS6WfWp/WnAYiB2ps8wM2Q2rvrAuxHqIE5gO1kCP6OWg1DN/igTAxQ/dqyTKza4gg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276411;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=eRa3J7GTEbpxxDEDDSYTr+0WmmfbKnZcqTKUsWYJt5g=;
	b=r+0Ql5ZvVkw8lS0nFJOcRZxZXpv98jD8nTjJMX+pIswruywz7A+Xrv/5Z5fd/dL0Y7xj
	 Ot7ayBlxFS8nM1fvS0iapTIqZXfuIvT7A+BbKujSAXB29LqkNmZw9hTOgaUWkr7trdo9l
	 sX1AZfbYSl2M5QAG04rHUoXpfZ015zPXYnd/NLMuRDPIZOZaGcB/t8cZAUnZrsoOgKlQs
	 tDl1Th0jS8r0aAA0FtGWDbAzJdOzzW4o5J/k7MEigdKAupukkFHlxuorIFbaIPOsNUo+h
	 VAPmmJVNJ+lZtx5A7ALgfk5e7II5SXRuvN9XvypJJv8FSj57mqsUvJzaQXkZvBtcC3g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276411;
	bh=eRa3J7GTEbpxxDEDDSYTr+0WmmfbKnZcqTKUsWYJt5g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MO6+u2Ei914x4krkgKSGhBz/VCz3290pDy77CztiNwfOvGliZ4iFv4APnDJzIF1HG
	 zQrckP+SMMO4aRjLh6EFtL2NItjUTiAAKREitEarNXvdbtZKqyROeJXMYmJbuJQyfS
	 fx/1q5i61wOgtfw1/zksnnh0pVKUuzVcB/+iqRSD8wSzVO5t/wmSfhQtLFRzsFSaiD
	 H0LW1JetE1uukWWLbqiYFEUnSLLkTUZG5hfUiPOFirY0r49FmkFQIS43iyDk57T67w
	 566NJ8XYxGOQnqlba7y64ZkXheTzS0eogaG/8F2Qmhh+s2vfnr3ommodyH9Hz9bh3G
	 tsCo1v4+StqHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3DF4411F9;
	Thu, 24 Sep 2026 19:00:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 732FD332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58449404C3
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cPI1SAawuGHk for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 65EF2404D3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276214;
 b=aHlYeo/jGLt2iJ0RJJ/z+xnmsaWSky7BxXXpoWa+afU0jWTlArS8WQgMx0/imtU5322c
 6EtLmObRlB+SfMUf7YGTnodiB8RJpUsqD5Hy2nmQnJUE3SM0MdWnC89rBNRnlsG7269Lm
 BtAMKME1yqDVBFEDpGHVWGWP58Go9Al9Gy+N/SUg8CjgQhrTOwKtdoczNbeunYBTkelpm
 HRPUwRagcq3ZOA3dT43JdbSkg2wS9t7GK392SWfKGbY0Fqh2NMOK0LzWdinsu3azVwUgA
 ReRZB5Wed5f9+LAXXTutiW/pR1qKSoKJF1pN63CjuwLxdJXg57r+jkoVCRAlWxBVdrQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276214;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=R56Bj80IixyudJqh3mAKeuSy7kMXURIPvq093BjKOwo=;
 b=BRtYHPdiXjXeWefoY2g/SAj70z/RYpfV320e/vov73vABulwrblLSI4ExNBB/MUUdh51
 hxr9gjgkvvGAlN85ZWl//zQAZgDCcIO8BgKF32Nw26NbL87nf2PdSHOulSMZ92JGhkRWK
 A2RHxn8iXeLXKQt1BcZbeVsP8HM1+HE/o8S848rIkXYxmOk2NvtBL360vaEuX3h8w9APt
 HTd9YK1XM2hlTM+7UOVF0oY9jGItBnfDfi+WTUCV6T07plMXadfYG6FO3jZdDNG9QpU6L
 BGkLDvBPg/qzJc3RKpoH9hydzYmb5clKUCEunvkBBVjylhMK+MiQvKlKoJqBhCOBkCQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65EF2404D3
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0909E9828F; Thu, 24 Sep 2026 18:55:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:36:27 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 96ebd145061f0b83e3deb7c99545ddbfae34b97f
X-Git-Newrev: 0d1e5de8f9355df320bc918f70b33dd6de7307f7
X-Patchwork-Hint: ignore
Message-Id: <20260924185544.0909E9828F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/boost: remove
 dependencies on Boost.DateTime
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
Content-Type: multipart/mixed; boundary="===============5456724553043205269=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5456724553043205269==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0d1e5de8f9355df320bc918f70b33dd6de7307f7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Boost.DateTime is header-only since 1.77.0
The Boost Release Notes[0] didn't mention it but it was introduced in
the documentation of DateTime in this commit: [1]

This was bumped in buildroot in d39d8f7cee9b4634e6f490020204f63fae419e8e

So analog to the "header-only" move of Boost.System we have now to
gradually phase out the dependencies on this library. Ideally before
the stub is removed as it now happened for Boost.System in 1.89.0.

[0] https://www.boost.org/releases/1.77.0/
[1] https://github.com/boostorg/date_time/commit/33dc6136f193a100c753c819694d6d11e9ab4123

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a235a33cfea320907e330023c1c6ec1645a4374a)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/boost/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index a9ab4836b5..7b78345798 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -95,6 +95,9 @@ config BR2_PACKAGE_BOOST_DATE_TIME
 	  A set of date-time libraries based on generic programming
 	  concepts.
 
+	  This library is header only since boost 1.77.0. Building a
+	  stub library is still supported for backward compatibility.
+
 config BR2_PACKAGE_BOOST_EXCEPTION
 	bool "boost-exception"
 	help
@@ -200,7 +203,6 @@ config BR2_PACKAGE_BOOST_LOG
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	select BR2_PACKAGE_BOOST_ATOMIC
-	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_REGEX
 	select BR2_PACKAGE_BOOST_THREAD
@@ -359,7 +361,6 @@ config BR2_PACKAGE_BOOST_WAVE
 	depends on !BR2_m68k_cf
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
-	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	help

--===============5456724553043205269==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5456724553043205269==--
