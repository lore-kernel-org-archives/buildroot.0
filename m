Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01733EB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 20:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 565B541920;
	Fri, 14 Jul 2023 20:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 565B541920
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SMgGn50K2K8J; Fri, 14 Jul 2023 20:35:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58A404191C;
	Fri, 14 Jul 2023 20:35:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58A404191C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 493091BF3EF
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 20:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20EA283437
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 20:35:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20EA283437
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m06xk_VtBMHi for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 20:35:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B0BB83422
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B0BB83422
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 20:35:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0896.dip0.t-ipconnect.de [91.58.8.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 51D17A4C00F8
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 22:35:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41480)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qKPVi-0007Uv-2c
 for buildroot@buildroot.org; Fri, 14 Jul 2023 22:35:30 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 14 Jul 2023 22:35:30 +0200
Message-Id: <20230714203530.782783-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689366931;
 bh=NaFAIZuKwdEUQhHQULjSo0D5Qn1RcJ6+OpxwNVMZkZs=;
 h=From:To:Subject:Date:From;
 b=tWeify6UumKrEwyYVKX/vO3tTZqrjWOaS+obWhBBf3nlEpAoFyWCD96PppLasFFb/
 HCuYtG9z2ucjH3LL82PSI5uGj8Il1aXvCAmjy841UkHYPjSVhsyIprBLX+zOU5VPa+
 nVdIG1pJSuQVvheYWLsrYpewrvrv8WBohgWZdcZqvCuK+qYRNfap5vTIkMtJkFh3Uv
 ZTrHwIMVUcPf20zRuVtFQ9ZPcovstg64aLiUIOp3EOWhnnVgylPa67huwOEMmz1lEs
 tmPkxQ37l97rQoLXWM0zC2i/d9uVUzw8q5STQ0uozqKrQ64l41dShOysTU7bUHlmXb
 3JxxLoxy9YL1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=tWeify6U
Subject: [Buildroot] [PATCH 1/1] package/libssh: fix build with Thumb
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

/home/buildroot/autobuild/instance-3/output-1/build/libssh-0.10.5/src/bignum.c:
 In function 'ssh_make_bignum_string':
/home/buildroot/autobuild/instance-3/output-1/build/libssh-0.10.5/src/bignum.c:64:1:
 sorry, unimplemented: '-fstack-check=specific' for Thumb-1

Fixes:
http://autobuild.buildroot.net/results/82c/82c8e3bb755bc8732a81f05a72f04a96ecc08b4e/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libssh/libssh.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 3be6c6adaf..e770d2b924 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -17,6 +17,10 @@ LIBSSH_CONF_OPTS = \
 	-DWITH_STACK_PROTECTOR=OFF \
 	-DWITH_EXAMPLES=OFF
 
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+LIBSSH_CONF_OPTS += -DWITH_STACK_CLASH_PROTECTION=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSSH_SERVER),y)
 LIBSSH_CONF_OPTS += -DWITH_SERVER=ON
 else
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
