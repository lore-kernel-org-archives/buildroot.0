Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77739C61DBE
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 18:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B2BA80E34;
	Sat, 29 Aug 2026 18:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YjLmjs0pM-Bh; Sat, 29 Aug 2026 18:57:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788029879;
	bh=Q6KPcdTGzTv8ZvTvTi75Olh680PZ3qbhwP8utg0+0z0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lCumN2MN7l100vsambNRrRUysQBAoV8fa9wp4azmNO+ZjwY82jwp53oVm5Yaa7QPR
	 hD12AqbcJ0F/pHO6ZW2fWcI+8MLndQEI6E3PsXzFwJTBKM8sTIBtFhYEzARjiuJPDY
	 0Baw+8rl9ODnFRmEXOhPVkG8lkpEYu9K3WZ/nMcfPH5Fz64Q9HVfF7hDpn8izsKw8J
	 LtFfUGvVnhW21LQ4aJK25c8AlDI/r/4Ls5WTPQYIYpHTqplFv4EAs3axuJ+9KhX+z8
	 CVFOq5PqrqAUMcJkBvR/1pEG6aoiu1wYvEZp8Otm1yobRN3/F6etw2K8Y7C6bKdJtK
	 NKSniTXfGRddA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26F8D80E40;
	Sat, 29 Aug 2026 18:57:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E6FC814F
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 18:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD1294008C
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 18:57:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wn49g9bg8xvy for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 18:57:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=WNiXb1PW
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4B2B400A5
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 18:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788029873;
 bh=ujE0MEuzzdwqakFTpqosh4pO5Vwj0jueyZlbz+SdtBo=;
 h=From:To:Subject:Date:From;
 b=WNiXb1PWu8HqLRTYd8aX9eVVsyLB7tUDjAHtMTUUxHciIfnxs470zyTiL+eK6yBrS
 bU0WwhNl3H61HR2BRHNw9wa4FYSJnYEfLo6VKwSt+zfoLSaGqLaERxZOqJlk6bB/A4
 sk7ArsQwc7nBtEV8EYyaSyoNhsAvJd2gBApThIdbbMM9P6ymxoLT1hhhbbC01fmGkv
 akPwWVh2+0t/SalEoLh8kw/GKiLYw0A3Uip3To47rLeNenvI+b6WmLWkLxrqq91+jd
 N9q6fa4c9NAgi8qDtl5pViw+McTOMuXambT0cqiS1GPKdI2I9PZqDKqdP+SsepHfDL
 DQp96VvCdfTQA==
Received: from fli4l.lan.fli4l (p5b3a0f14.dip0.t-ipconnect.de [91.58.15.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 76F16A4C0887
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 20:57:53 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56962)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1x0OFV-000000006ug-2g46
 for buildroot@buildroot.org; Sat, 29 Aug 2026 18:57:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 29 Aug 2026 20:57:53 +0200
Message-ID: <20260829185753.1216210-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: security bump version
 to 1.11.3
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

https://github.com/signalwire/freeswitch/releases/tag/v1.11.3
"This is an important release containing critical security fixes and
 stability improvements. [...] We strongly encourage all users to
 upgrade to v1.11.3 as soon as possible."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed
https://gitlab.com/bkuhls/buildroot/-/commits/79fd49e43060ed28b61c58bcaea10f3a1b9999a3

with the exception of bootlin-aarch64-glibc-old:
https://gitlab.com/bkuhls/buildroot/-/jobs/16185704816

  ./.libs/libfreeswitch.so: undefined reference to `getentropy'

Freeswitch added the usage of getentropy in version 1.11.0:
https://github.com/signalwire/freeswitch/commit/7f9dd270b492907ddd063be18003e18719bdb80b

getentropy was added in glibc 2.25
https://sourceware.org/git/?p=glibc.git;a=blob;f=NEWS;h=ec15dde7613306cfa574149f61ea38ab3fbba76d;hb=db0242e3023436757bbc7c488a779e6e3343db04#l116

causing a build error with bootlin-aarch64-glibc-old which is based on
glibc 2.24. I found no way to disable freeswitch for this toolchain.

 package/freeswitch/freeswitch.hash | 4 ++--
 package/freeswitch/freeswitch.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index 1ae30ebc3a..eb7cfc32de 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,5 +1,5 @@
-# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.11.2.-release.tar.xz.sha256
-sha256  1a460e28a0309bf2e29397f0dc7cebecaa579c9f19efa9a301dfc6bf5015d17e  freeswitch-1.11.2.-release.tar.xz
+# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.11.3.-release.tar.xz.sha256
+sha256  4c93cbce869cf928bc9e8b3a48fe40337199b348ab668def77e3f739796a3852  freeswitch-1.11.3.-release.tar.xz
 # Locally computed
 sha256  75c933202f40939cdc3827fce20a1efdaa38291e2b5a65d234eb16e2cffda66a  COPYING
 sha256  c3e3388768dae8bf4edcc4108f95be815b8a05c0b0aef6e4c3d8df81affdfa34  docs/OPENH264_BINARY_LICENSE.txt
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 39af6214bf..e27c53650f 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.11.2
+FREESWITCH_VERSION = 1.11.3
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).-release.tar.xz
 FREESWITCH_SITE = https://files.freeswitch.org/freeswitch-releases
 # External modules need headers/libs from staging
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
