Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA9AE92FE0
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 21:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 664154057E;
	Mon, 29 Dec 2025 21:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J4fPtPJr567z; Mon, 29 Dec 2025 21:22:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F735406A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767043322;
	bh=f7c9XKy3fY6G9Vn8HJNgN0S1U+QqNaJiL94IQxawm9g=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Z2bbJ2DijpqEqHcTRE74U0JAZ5zNXEacfCMMs28P0ggNbHmwnOKWmRGtyc8K3ND2D
	 C/7Og36nQWT2ognnYR/j6HpY83yh2gIRyw0nG5annnO7C5aXcEpz25okVFybb+QtJ4
	 As2q54UpLuAvGqzLf4OSRYYG/G3ylj7m1uf09dHjDe5EwCF5Tu31l6OfJIGxrW0L+T
	 xaIZ79rEHeVmqaCcMFkol4IqPFRuSBCrDGvxijteIgmNFsjIcEDID5sjVoeCt9vQbz
	 PpYyF7m97mnHuPP99rgmY6Xfx4/nG/epQpyDOGbkGr8ODJTbE5Ke/dWCjYHxY0dVRw
	 1i3ogC9k2O7Sw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F735406A0;
	Mon, 29 Dec 2025 21:22:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C047177
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E19360AF4
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vs7DhzhTImNQ for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 21:21:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BC93860AE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC93860AE5
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC93860AE5
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:21:58 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47a8195e515so58275995e9.0
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 13:21:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767043316; x=1767648116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9/pxrI428UW5KdmLADWva+sDgfT1O7FAc8xSHkpQLlo=;
 b=fU7BLrzj1d2nZ4RuR8C/g5K5MYC80w7xphp5DovLuOcFDsWLFTw/+YXErXJbjx7K9V
 8XNz2xhbFXVyDkOK1AsncvWZ5Q2WTaNze8N1uSeGENutd6skTOyuk+G91modKnnvGAwh
 6vpkVN2PpGfgRh41noPhoI/MXqUNeFvcX2VTqJX3lCieYm1FsyjWJA7C4mEcNSDdOD6f
 IU2FTQtpZC+tr/JviOfM5LC6nNT6i/+vMnLiB4wAGxv2WZs3Cr9XJcCnzuOHv63HEguS
 iSiswDtQ2vIY0Ud/+U69TmjzRhtd1rpLV6LGYhl9LagWtxWWFfVnhjh0dUuNDBIXXMnr
 gKfQ==
X-Gm-Message-State: AOJu0YxsOvRzL5v8KmwbyyIhFfYmUsSaSgKI8eIsVy5tJHODw1FOpD46
 GSZx2Oz00QfwLaBLYidqxguEC1rvE+jvMTE3qNMsUF62jmK4g/8GHQHh/RtqeuMZn0evPpyqhuB
 d+BOymzE=
X-Gm-Gg: AY/fxX6f/0NAeOfE4kTHWrYFEzw5EFfoqoX6Yg+bXOj12lFWBFSZRi9smM1u0YOqeML
 khyABqmPOm2kc8eCDXMfI7onaELP0roeZlHaTVmu2d1pOwpptsC0NxzutJPIfMD6/Tuutk52icJ
 r36HJot7XbbDMyX3HhAUAK6nOxXbgTB5PFwrRM4IcO4Olo13aCjk6xg/uASUfEeBv7aCluGip8i
 rtUMF7/Ir8EJdjRNOQtrIcno4/L1rYQnCw24efn25cRs9NrEzVirk+qHkpPLQs5mr8OeBSaiYh+
 zg4ruUoWHmdEyVfiJm7lsxyWV2gj5qZUF8gtoER/SgevbFiqUebnpB/ImoM0lrTAKz/BH+jKEjY
 f0N8oPsq/Jeml0tNRYmg28FI4mCDoL8KF0fcdZ0VtouaWujnsXRZQce3cIv5mOUeZsMNP7AlkMk
 yBy9Q=
X-Google-Smtp-Source: AGHT+IHf9yHmYsPi86n6FyyKpdhvtDi30l3S7THoQfzro1JAI6cyRkwddpHUZQpbOHI5wGMSvOCZWA==
X-Received: by 2002:a05:600c:4e90:b0:45d:f81d:eae7 with SMTP id
 5b1f17b1804b1-47d19593896mr366610675e9.28.1767043316123; 
 Mon, 29 Dec 2025 13:21:56 -0800 (PST)
Received: from arch ([79.132.229.12]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193cbe58sm556813195e9.9.2025.12.29.13.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 13:21:54 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 22:21:36 +0100
Message-ID: <20251229212149.167902-4-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229212149.167902-1-thomas.perale@mind.be>
References: <20251229212149.167902-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767043316; x=1767648116; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9/pxrI428UW5KdmLADWva+sDgfT1O7FAc8xSHkpQLlo=;
 b=Cw7otyhBmxKjWIMvNOOaBc4npSwcke7uFzZtpXTQ2rY1gq96u5mT4OmXBOMhO+pJnV
 Q3cRaeBtXeMRt24czpjiTMnDPWMqYWzMOq+zy1zlG8fSRfxPYVORi+NpCpJZFo/OAW21
 q1ww9ZBec+ecor5ALR6DKu8unKHda4Qm08XyX+SB7XZUkG7MIo8wpOBxVTkjrDcWzXGy
 9OOwGERGj76UJ7o70MpWiZnAYnReU8hP0y4VvWfcheCGhi0I2XrwjGGXIXp5sQ2axoHV
 gomb6vYuywAOsVtZTwxR6JoCI9VRYHj4aEvGBZCytb4EZvRZ6SNNnlB50fOq0MI5Z2zE
 7VEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Cw7otyhB
Subject: [Buildroot] [PATCH 03/15] package/patch: add CVE trailer in patches
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Bernd Kuhls <bernd@kuhls.net>, Olivier Singla <olivier.singla@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Danomi Manchego <danomimanchego123@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patches header as well
as the `Upstream` trailer.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../patch/0001-Fix-segfault-with-mangled-rename-patch.patch | 4 ++--
 ...x-arbitrary-command-execution-in-ed-style-patches-.patch | 4 ++--
 ...0004-Invoke-ed-directly-instead-of-using-the-shell.patch | 6 ++++--
 ...t-follow-symlinks-unless--follow-symlinks-is-given.patch | 5 +++--
 4 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/package/patch/0001-Fix-segfault-with-mangled-rename-patch.patch b/package/patch/0001-Fix-segfault-with-mangled-rename-patch.patch
index 19a67573c4..1b8d954025 100644
--- a/package/patch/0001-Fix-segfault-with-mangled-rename-patch.patch
+++ b/package/patch/0001-Fix-segfault-with-mangled-rename-patch.patch
@@ -7,10 +7,10 @@ http://savannah.gnu.org/bugs/?53132
 * src/pch.c (intuit_diff_type): Ensure that two filenames are specified
 for renames and copies (fix the existing check).
 
+CVE: CVE-2018-6951
+Upstream: https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=f290f48a621867084884bfff87f8093c15195e6a
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 ---
-Patch status: upstream commit f290f48a6218
-
  src/pch.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
diff --git a/package/patch/0003-Fix-arbitrary-command-execution-in-ed-style-patches-.patch b/package/patch/0003-Fix-arbitrary-command-execution-in-ed-style-patches-.patch
index b44bdd0fac..18497c153b 100644
--- a/package/patch/0003-Fix-arbitrary-command-execution-in-ed-style-patches-.patch
+++ b/package/patch/0003-Fix-arbitrary-command-execution-in-ed-style-patches-.patch
@@ -10,11 +10,11 @@ instead of rejecting them and carrying on.
 * tests/ed-style: New test case.
 * tests/Makefile.am (TESTS): Add test case.
 
+CVE: CVE-2018-1000156
+Upstream: https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=123eaff0d5d1aebe128295959435b9ca5909c26d
 [baruch: drop test hunks to avoid autoreconf]
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 ---
-Upstream status: commit 123eaff0d5d1
-
  src/pch.c         | 91 ++++++++++++++++++++++++++++++++++++++++---------------
  tests/Makefile.am |  1 +
  tests/ed-style    | 41 +++++++++++++++++++++++++
diff --git a/package/patch/0004-Invoke-ed-directly-instead-of-using-the-shell.patch b/package/patch/0004-Invoke-ed-directly-instead-of-using-the-shell.patch
index ae64d58b93..7ede9300e4 100644
--- a/package/patch/0004-Invoke-ed-directly-instead-of-using-the-shell.patch
+++ b/package/patch/0004-Invoke-ed-directly-instead-of-using-the-shell.patch
@@ -5,8 +5,10 @@ Subject: Invoke ed directly instead of using the shell
 
 * src/pch.c (do_ed_script): Invoke ed directly instead of using a shell
 command to avoid quoting vulnerabilities.
-[Retrieved from:
-https://git.savannah.gnu.org/cgit/patch.git/commit/?id=3fcd042d26d70856e826a42b5f93dc4854d80bf0]
+
+CVE: CVE-2018-20969
+CVE: CVE-2019-13638
+Upstream: https://git.savannah.gnu.org/cgit/patch.git/commit/?id=3fcd042d26d70856e826a42b5f93dc4854d80bf0
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  src/pch.c | 6 ++----
diff --git a/package/patch/0005-Don-t-follow-symlinks-unless--follow-symlinks-is-given.patch b/package/patch/0005-Don-t-follow-symlinks-unless--follow-symlinks-is-given.patch
index e07ae0c670..c0e63081e2 100644
--- a/package/patch/0005-Don-t-follow-symlinks-unless--follow-symlinks-is-given.patch
+++ b/package/patch/0005-Don-t-follow-symlinks-unless--follow-symlinks-is-given.patch
@@ -9,8 +9,9 @@ the O_NOFOLLOW flag to avoid following symlinks.  So far, we were only doing
 that consistently for input files.
 * src/util.c (create_backup): When creating empty backup files, (re)create them
 with O_CREAT | O_EXCL to avoid following symlinks in that case as well.
-[Retrieved from:
-https://git.savannah.gnu.org/cgit/patch.git/commit/?id=dce4683cbbe107a95f1f0d45fabc304acfb5d71a]
+
+CVE: CVE-2019-13636
+Upstream: https://git.savannah.gnu.org/cgit/patch.git/commit/?id=dce4683cbbe107a95f1f0d45fabc304acfb5d71a
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  src/inp.c  | 12 ++++++++++--
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
