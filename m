Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53239CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D96F60E47;
	Fri, 16 Oct 2026 13:09:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eQ-Z7QtSZrOn; Fri, 16 Oct 2026 13:09:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F1AB760E90
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156166;
	b=CdoOJpKAh6D1N83oJaAsVExs3zBu7LmeWycp7ZzsDuAab1hE4NhdXqWxqtZnmFTk4Q8C
	 +eAMKrltXT8cdujRpY3R6S+D5+VyjhnG0cGnRd1vk/ZCcdDd0C5JM1BbVA4HQfsjQiOD3
	 1Pn5+Vyq4VCpOYV0A9BM8nY7WgqwBqv+j0KS0U8lf645OMCFRBqCa2dx7Z/05xNmLRkCt
	 n6KrWhEa0j0vtlF/Uife3ZsH4k9g2I79SV0R1QVs2eokGhd7vGUMyAMTqJGTu9hWhnB4q
	 LQKib0fV69ouRlZlCmEjrCyY19ZopxQhePJF+r05fp6DoKc3IHHPY8Rwo8AiOe36deQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156166;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=h40eq/79ei1Nj3QUYcupVeeWDNK65C0p6ZJm999r3GM=;
	b=akLG9B7yH+cKCgyaqm2hS5u/SOWrBSJtpu6MFua10M5zmYRaPkh5J4BY2hbEl8E3DMFx
	 CujqzX2A5iWmVFoggtOQCeZRuzmzl+iAkskeQezRxTGuGKs1BvdKa2YLX84UfyFpv6+36
	 2xwWPJDCfqqxUXgY/m/PnBPmL368s9skDI42mO7SiSD7S9aTNmRwFxR5os8K1lXjMic6I
	 6mm4kuaJbYt1Nr/YGn9p3B4oH9bETeQ79Va7r2ikVPxppUBlJU5EDLOR9rV9QIXlO4oZd
	 6GzQKLN77xw78s+Rel6r2Biypc1lsQQN0nxBMCRqfLzHHncCtEr73K0E2/yiA5P/jyA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156166;
	bh=h40eq/79ei1Nj3QUYcupVeeWDNK65C0p6ZJm999r3GM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LTJIQc3TDMdidfkNt7bZEuWsQBD2B83SBcRaiFovW/ugjzyI2JplPiS7cLtGp3xRZ
	 krhlYjCpcW43I1qKpAUcNBCZbPtgcQI0yvYQJcD//S/4i0cOe+feNaUxIFiM9SKQX1
	 RuwJGCSwUkkRId/znnyZc4G9LguiCiaiwEITE3u7bKNpCjwacG2VQu4e3wjPKcgfY8
	 fPKJnA9lbfkKFBr8m2npVid8JlwtZP7iOXHMU3GazPbZGZmXWY2UOhTqYbzGQS6zrF
	 ylE6iqEYo2it9FupMtoC9GnyqkcbFXzYrvt350z0755+I9I8a/dEQtPWyPDtfsHDXv
	 ApjwDIUWnncOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1AB760E90;
	Fri, 16 Oct 2026 13:09:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 13899F45
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC376814BE
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5xinFKfs1mxU for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 79B50814D3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156107;
 b=svj6khJJ4kzvw4Tjutm2QFhir7ogcxlLyJcV7mS5zQrZIDIO1ykQ1VCVGXo4Bgazt4rv
 gHBKqi1bviiMbylaINig5lPefZL5wNjSWFtX/dkWqdNiYy6uFdFGIOGhNxNdoRXZoTdfj
 bpE0dj8DJ7wPjsii3wy1Ttc/2uXIDaWfQUCsEWw2eEpxUIkT4NnNNpoMauNbwqMHRfKru
 dhlGqbDpiTNKqSDuzNx6BYAwcCJYWidx+opzutF6A3IlUYeqMP8ylp1jVWvbRI9diz3B7
 d/vRb4r3NFdDlCZcXHoT3WMEAbb1HstYFqDhbWRwoIZpVmn/yNP8dghFN/2cvZEV0Qg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156107;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=8qJIXjSQx4xCfkyVecdFjwJmrJIzLRMKCStSsFSbAB0=;
 b=mQ4ursdXUQjRJPaaO1Y2nASv0vyBr8Xc/YPJpgI6nxw/PiIgLOMKlqtHYjTNKa3TFzj/
 ir1PLFZx+Jf6ZrS2ZSYDIlOWlocr1ODHlNjirmOyCI8fY9AlOcyBxM54JYEViUAzD/9mU
 jrVhp5vjI/ZixnHP+4Wo2A7BcusvwqS10f+HVmC/TYkrJf3e8TZdOshrCREcupwKJbyQX
 srzT41uTeX8UdB5LlaGFhPJfQq0+3GQEGwCmLyPmRvPalRKftcQ4+kyhRrXlO8hiEgqSf
 Djc3ajT0fP2+Z2lMn8XIgO/sUu70+g0EgXXOZeTV08TaNKTI+L/ev+j7pmCsytHS/RA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79B50814D3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6ADD0960D7; Fri, 16 Oct 2026 13:07:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 922559fb5a152cf9cb6bfaffb0bfd0f2bed783e3
X-Git-Newrev: bf23e68a4c33840690bfb37a2484d52ead4756ba
X-Patchwork-Hint: ignore
Message-Id: <20261016130706.6ADD0960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/sqlitecpp:
 disable stack protection
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5721455476105487002=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5721455476105487002==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bf23e68a4c33840690bfb37a2484d52ead4756ba
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

SQLiteCpp has an internal setting for stack protection which defaults
to "on". Since Buildroot handles stack protection itself this is not
needed and more importantly it causes problems as the option enables
stack protection support even when the toolchain doesn't support it,
as can be reproduced using the following defconfig:

BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_BLEEDING_EDGE=y
BR2_PACKAGE_SQLITECPP=y

Fixes:
br-test-pkg/bootlin-x86-i686-musl
https://gitlab.com/heinemml/buildroot/-/jobs/16865965418

Oddly enough, there are no autobuilder failures recorded for this
issue.

Fixes: e74059b39ce2f ("package/sqlitecpp: new package")
Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 39235638d171f433b3790c6cf9226dec728cd105)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/sqlitecpp/sqlitecpp.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sqlitecpp/sqlitecpp.mk b/package/sqlitecpp/sqlitecpp.mk
index 1cf8281997..7e8c9672c1 100644
--- a/package/sqlitecpp/sqlitecpp.mk
+++ b/package/sqlitecpp/sqlitecpp.mk
@@ -14,6 +14,7 @@ SQLITECPP_INSTALL_STAGING = YES
 SQLITECPP_CONF_OPTS = \
 	-DSQLITECPP_INTERNAL_SQLITE=OFF \
 	-DSQLITECPP_RUN_CPPLINT=OFF \
-	-DSQLITECPP_RUN_CPPCHECK=OFF
+	-DSQLITECPP_RUN_CPPCHECK=OFF \
+	-DSQLITECPP_USE_STACK_PROTECTION=OFF
 
 $(eval $(cmake-package))

--===============5721455476105487002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5721455476105487002==--
