Return-Path: <SRS0=h7+E=OG=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D77EBC433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Sep 2021 20:46:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FF376105A
	for <buildroot@archiver.kernel.org>; Thu, 16 Sep 2021 20:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8FF376105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51A2E4070F;
	Thu, 16 Sep 2021 20:46:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XVuK6ozsQmP9; Thu, 16 Sep 2021 20:46:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4EBB840711;
	Thu, 16 Sep 2021 20:46:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 05D941BF2F1
 for <buildroot@lists.busybox.net>; Thu, 16 Sep 2021 20:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E88E8407DF
 for <buildroot@lists.busybox.net>; Thu, 16 Sep 2021 20:46:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8dzQLzgdxwmY for <buildroot@lists.busybox.net>;
 Thu, 16 Sep 2021 20:46:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D42C4074A
 for <buildroot@buildroot.org>; Thu, 16 Sep 2021 20:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631825167;
 bh=R+EOwP0KjR2CeYXYcX0oAP2UxiYGVApa8giRCef42+o=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=GV7VYoi6AjB4ORDem+p+IVbDVEbK3f2ll+KgOG+Zx3/azm0aLceGuLeKTi27GN3wh
 OKN4dzy8vA9Pyywbai0BiEwEJVzQNgFOxdJA9j6N3iqD2uNVJka/f4Tm4eYYCvJQUk
 P5vagJAZJw9bffqDukgx9RH2yu+Fruqv7V3yPYZ0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.40]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfHEJ-1n5ofM1QgF-00gqhC
 for <buildroot@buildroot.org>; Thu, 16 Sep 2021 22:46:07 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 16 Sep 2021 22:46:06 +0200
Message-Id: <20210916204606.26348-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:KcLKbFxVZOmOqOxSJwGQjvT/eePKy+d3CcuKA3YT8fyw8/BtdjG
 muII5EPMOmThojLtMWXVXE2IjTYz5Zef5ka1JSHfjsMPa1rabos7UcxAuTAJc//0VPVz1mY
 TeZjCBr1yTCxY/8hE8xGaRYrbaMSt3jRxrxsEoSaSsUhqqU/JtdpXcwByaerUIHzDrDEiRG
 zrdkgcts8HyqbEKjKbjnA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QkQUfbZiEOY=:B9c7y2XW+41FGPUKV2EdBP
 Dj1mqEoADcdhmwBwjlVfQPTZYn0z4X/RdB9B94vaqTxE/40zC5NrBMS7YuWMIW7eY+3DX6Lyd
 Z7pmHbhVYv54nEYZUazY9cwR9BFt7pwJqXo0Ua3begHRWK9K0FG3Kd0BfFQs5yfThxMy7PlO+
 kUxE/V2ErgCsQRgpW3hR9fc5AOLpOidSfSiFLPWOhOWb4AOEWF3lNFauHzHQNYySJG6YoylmT
 MMAsAfUzFbno0IpcbrXihTt0SY4ZxV5YedrAoMF5Ym9hfdfnFt0BPmVCGucYt/JEx6MQWPYgA
 GU7rk/CRmkOxOkEPIRcvERn4Xq5gB2Rb0khZ7+AX2y95QM6MzvuOefFA8N9ZKqVVEiLxHJGHS
 i+cZVE6PjMSVQPvOS4ZG+I98a7b9LMrqdCswvyrp842W8wKmEzAbKgF58GJyL+GmIDDJyLm/F
 vcm3Rm0z+6MnfVwBgzTjAUmoccAdzaQoor56K7zyp0yrZ1ySF8enoMdEdxYZF2J2o4Sqpa+4J
 3/tWO0Ae/L6/RI2IVvA/oPSCGdEXIE+YIXHXbm5R54vOvZzUVn2p45nLB+k42RiTqxJBcXb/O
 s5u2xgx496I9SWtHcbKwQ33h4iCtuUdT/CBI8EnNqqmeGT/JDNngxRCkGa38nzoQn/7KF+0pA
 xHHUJiiXWwUoL/0dBruA+0pPmNg2yyZ8myJ0NviOw5NvgIEov0a9Az61Ywtiy18vLJ8ysFwj9
 f5WRvupndcp7gppX2ZSm7NRnxDmf/yICUzgZK58q69S3RPELDgyilB3XDOq9dZfi52GYndqwt
 4w7ORYdXyjiu/Fh860c19GWOiDxQKK4pswIT/cJeFXgbpcf+teqo8EqUVzSsefC9+vUoqNaI/
 2ZJIWos9leZ0W6dPflnwXCgSrO3J9ZD11uIR5bjK08vN5OwRN547PegPF3CKihitFkf65iNt9
 lDwY8oP20SMOC0zvb4K2sD6+9m1pw2nwslMeQgohwyYcJ6mwXoQYOd0aa/cCIlYVktKd2OYvL
 TcyVcO2raRLWqbdjwUkBsnbykddPla563tEOXUqLBMq6yDo2avrZIerMMbanjBHS9koUSkmv8
 CnT5lwmYwjYvG4=
Subject: [Buildroot] [PATCH v1] package/bison: bump version to 3.8.1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

For details see [1] and [2].

[1] https://lists.gnu.org/archive/html/info-gnu/2021-09/msg00006.html
[2] https://fossies.org/linux/bison/ChangeLog

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/bison/bison.hash | 4 ++--
 package/bison/bison.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bison/bison.hash b/package/bison/bison.hash
index f4abe4c661..04b6ca03e4 100644
--- a/package/bison/bison.hash
+++ b/package/bison/bison.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature from
-# http://mirror.keystealth.org/gnu/bison/bison-3.7.6.tar.xz.sig
-sha256  67d68ce1e22192050525643fc0a7a22297576682bef6a5c51446903f5aeef3cf  bison-3.7.6.tar.xz
+# http://mirror.keystealth.org/gnu/bison/bison-3.8.1.tar.xz.sig
+sha256  31fc602488aad6bdecf0ccc556e0fc72fc57cdc595cf92398f020e0cf4980f15  bison-3.8.1.tar.xz
 # License files, locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index 26db307e20..8413233063 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BISON_VERSION = 3.7.6
+BISON_VERSION = 3.8.1
 BISON_SOURCE = bison-$(BISON_VERSION).tar.xz
 BISON_SITE = $(BR2_GNU_MIRROR)/bison
 BISON_LICENSE = GPL-3.0+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
