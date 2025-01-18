Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFA4C02185
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 11:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3721984D5A;
	Sat, 18 Jan 2025 11:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mXsdrEYV9Ylx; Sat, 18 Jan 2025 11:35:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 165F884D5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 165F884D5B;
	Sat, 18 Jan 2025 11:35:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A3D269
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 11:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A73F429C1
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 11:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7hd4zAYBGsVJ for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 11:35:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AFE87429A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFE87429A9
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AFE87429A9
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 11:35:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 83E8720007;
 Sat, 18 Jan 2025 11:35:11 +0000 (UTC)
Date: Sat, 18 Jan 2025 12:34:45 +0100
MIME-Version: 1.0
Message-Id: <20250118-fix_uemacs-v1-1-bb5334af45bd@bootlin.com>
X-B4-Tracking: v=1; b=H4sIANSRi2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQ0ML3bTMivjS1NzE5GJdS+PkpMRkg0QzIyNLJaCGgqJUoCzYsOjY2lo
 AVGSgwlwAAAA=
X-Change-ID: 20250118-fix_uemacs-93cbac0a6229
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1737200111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=16+8qsdyi8LR/1DAYUX2zssm5wyKzBWT4ChP27ng/BA=;
 b=GAASlmEHnB+xa0j+92EZLcPW6GZUNJrHBzteNmsPbtErqf744d+i2WjG2qUPViTKnJzbNp
 Lsm89ru/7/u2lnZQpZuK+T3854iqtWGbs6op+8t5+u0cH5guf7iJrye+BLRNQwVzOPNhUo
 DVoIxWK8PKkgig5NpVJpu7pVC2wgWYuT5+Xvx1CAXPM2J+8V672FxZLexqrpgKyB9Zwf0j
 Xq6IjsT5BcdLeb9Nb5HbJuynyERHa0vOFogjKhT24IEo+4Mj3a70Uq1E5RmwhK8aJfkKmF
 ozjr8kpc+YIeV0UnDNGXATYRHfbCocaQ96sSvJkZTX2a9N5CpfkAhNYXXRLnmg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GAASlmEH
Subject: [Buildroot] [PATCH] package/uemacs: fix call to cuserid
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
From: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cuserid is deprecated and breaks the compilation on some new toolchains.
This patch fixes this issue.

Fixes:
    #81

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 package/uemacs/02-Replace-cuserid.patch | 34 +++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/uemacs/02-Replace-cuserid.patch b/package/uemacs/02-Replace-cuserid.patch
new file mode 100644
index 0000000000000000000000000000000000000000..0e7eaf371f14a5e2bf2e0f38f08771bad4782c8d
--- /dev/null
+++ b/package/uemacs/02-Replace-cuserid.patch
@@ -0,0 +1,34 @@
+From 289ccf8f0e77ae4f240eca988eb3a6ac19afbae9 Mon Sep 17 00:00:00 2001
+From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
+Date: Fri, 17 Jan 2025 22:10:41 +0100
+Subject: [PATCH] Replace cuserid
+
+cuserid has been removed from some toolchains and is no longer in the
+POSIX standard since 1990. getlogin has been in the standard since 2001.
+
+This commit uncomments the call to getlogin and thus replaces cuserid
+with getlogin.
+
+Upstream: https://github.com/torvalds/uemacs/pull/46
+Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
+---
+ pklock.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/pklock.c b/pklock.c
+index dc30b76..5f4865b 100644
+--- a/pklock.c
++++ b/pklock.c
+@@ -80,8 +80,7 @@ char *dolock(char *fname)
+ 	}
+ 	if ((n = read(fd, locker, MAXNAME)) < 1) {
+ 		lseek(fd, 0, SEEK_SET);
+-/*		strcpy(locker, getlogin()); */
+-		cuserid(locker);
++		strcpy(locker, getlogin());
+ 		strcat(locker + strlen(locker), "@");
+ 		gethostname(locker + strlen(locker), 64);
+ 		write(fd, locker, strlen(locker));
+-- 
+2.48.1
+

---
base-commit: 027c9ce67ca21409faed9f9add7222cb3e5ba4d4
change-id: 20250118-fix_uemacs-93cbac0a6229

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
