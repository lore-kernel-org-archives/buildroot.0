Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A6AE9411C
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 08:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57BAD4068D;
	Tue, 30 Dec 2025 08:19:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jMvM2gddHqAJ; Tue, 30 Dec 2025 08:19:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D9E7404C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767082770;
	bh=8xQUh4FbpczjS3h4uvWLJ08wmFLRkWpvx2eKidWZbV4=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=WDL10W2FPlWmMEXuq433n4YZH6q6z36j8RoSSihJsab9mQh5V8dnejpW15NRuGvOS
	 2qVl1U4pTFCLlWYu60XNpZFEXNS1M1QMCcHVzZhT9m4xO0TwqVNzE+/8D+OcWDmTPW
	 wL5jn+0Eqn3bgpKgvii7qHx1m5ofKP7mUtyyGs/fjGY8cQSMYg3h+UslOZsoKZuHoV
	 DHoPHVEybv7Yc3zC47cpN0LJVNyRBiE9ix8McyEJAan5PXPHDlJWHEs1vqopaeb7LM
	 HcdgnS6g0dAyzqN6b+L3IEt7Gc5P/67ZctlGxoccUnbN7nTEQAn4QU5uLma7pUOwj8
	 0U5NlWmJ6SgEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D9E7404C3;
	Tue, 30 Dec 2025 08:19:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E3E13D8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D572D4030B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kczD8iSI8zVh for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 08:19:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B6279402E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6279402E8
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6279402E8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:24 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4779ce2a624so74350385e9.2
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 00:19:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767082762; x=1767687562;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=M1f+zvj1tUiGx9/HOZGvB3q0bnxkBe3JxESS+zQiqcA=;
 b=EZaN+AAFQuwgFRgKLQdHfk2wKK57SIn32uK4sPrkqDsCzuhyjJ8r8yc4RIKVXyLs6h
 JRWIahvJHYos96pzz6VKRHGVjdOSHIQxd1McwLy4qrDZq+XcsftXPu5V91XNYW/sLgHC
 0vQVyxLIHTLsIGEt63AxtFIguZhYQEWLbjl5Yxleca2UVuvUG8xcBdPPQ+6vI3W7hNHU
 jUxpdolmbhpg4jmJLrkwnbzrN2EeG+C++D5v2FxvnI+QVmDdXwuz6/PpGmBiqsN0dwI/
 k6ggnMT5wrHFdhW1SV5j4G8k8WYMarV8xAIq4Eh3HBZqms1b42S8urrUQSmy8BG+DlO/
 orEw==
X-Gm-Message-State: AOJu0YyMOIMV7DU3CNgaq9n+Zid6GZP6tpBsuM//0welSWFa4aEN3ef2
 pVpLd0P5Aba4sioUEJctAXhv7xRnBqa2cH5VS1eLMA9njpHIOdVxbQSVIiBfuyyGRdj8S4cOFI6
 G9M9InUA=
X-Gm-Gg: AY/fxX532QbH3nj5TMW10GP8CeklXv492rOEQcsKMQxNKgbPxnA+PzvgQEM2RI+jeNt
 wLhwHtuYWJ6DlYfCufw1OqpG3w+MRkQSKD/fW8BKb/o6dY2xqO4yiisstFi34FZAzDaW5f0kkAz
 H307LxoHh7Hxn0xzPNFdgPvSC4EElEWhubwmKU3Mp9Tn8g35B0BGrAW26Xeq0NpHXFhAWXnqImb
 oIXAqbINrEjJQu3m4K6z1L95uV9wsU+oIYQtX5jWYItyqECqu21XID1RDOel5XOnKF4bzYl+/LN
 MXOiRHhZmSZZEDGAkwHwM7aKGv7fCFYLuXsUd0oLfvvMH1Qo7DOtbazSgnR8JDFHjgEuPxiceax
 /t0om75X3ujIPIiQYRChWteBhbeur3c2YNSlOBcd8neQbHs/kN3Q4lVRLg9r0gJqVIBGZyVpwvl
 BFlfo=
X-Google-Smtp-Source: AGHT+IH2TSF+FMu6L5/IYqkC1X/TC04ZvYkSuFEIrC64FUntFlz/nQ1AfGzBhY1jJ9l/gA/VGBKDhg==
X-Received: by 2002:a05:600c:a012:b0:47a:940a:c972 with SMTP id
 5b1f17b1804b1-47d1955b72emr406903305e9.4.1767082762341; 
 Tue, 30 Dec 2025 00:19:22 -0800 (PST)
Received: from arch ([79.132.229.12]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eab2ebfsm66328773f8f.40.2025.12.30.00.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 00:19:21 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 09:19:05 +0100
Message-ID: <20251230081917.18676-4-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230081917.18676-1-thomas.perale@mind.be>
References: <20251230081917.18676-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767082762; x=1767687562; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M1f+zvj1tUiGx9/HOZGvB3q0bnxkBe3JxESS+zQiqcA=;
 b=RHXWK5aU8ClWs5NKymSrjX7vSA5HezvYNGqJL5hrIVCgpC5gKB923Ro7yyh5rjWbpN
 dNI0JS5n33AYupVT3P21uMVTpyrUZp0a024OrGY7l5TgCu8TwLRqxo6iX82lZCWT37Hi
 xyD1ZLGiDWnmOqZMILAvPiINfDtCYtw3a0stbOpQXS8/J1yHmF9LWT/dnXCQJGBVdGUJ
 xMI3SsjBwgiAZUJnkdedJgQPAtw2/JRs2vLVIww91OGnHtjoyNshIcAGZLCoVIxoUBmi
 BEmcZGgoEEVfYWS4MZq5NfvQw2urLrkvYjMSX+XLbjOYGMVsTXNmK3TfKxEPGs1DgUJj
 rO1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RHXWK5aU
Subject: [Buildroot] [PATCH v2 03/15] package/patch: add CVE trailer in
 patches
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
 .checkpackageignore                                         | 4 ----
 .../patch/0001-Fix-segfault-with-mangled-rename-patch.patch | 4 ++--
 ...x-arbitrary-command-execution-in-ed-style-patches-.patch | 4 ++--
 ...0004-Invoke-ed-directly-instead-of-using-the-shell.patch | 6 ++++--
 ...t-follow-symlinks-unless--follow-symlinks-is-given.patch | 5 +++--
 5 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 94916ecc0f..1e255f80e1 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -798,11 +798,7 @@ package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch li
 package/owfs/S55owserver Shellcheck lib_sysv.Variables
 package/owfs/S60owfs Shellcheck lib_sysv.Variables
 package/owl-linux/0001-fix-for-linux-3.3.x.patch lib_patch.Upstream
-package/patch/0001-Fix-segfault-with-mangled-rename-patch.patch lib_patch.Upstream
 package/patch/0002-Allow-input-files-to-be-missing-for-ed-style-patches.patch lib_patch.Upstream
-package/patch/0003-Fix-arbitrary-command-execution-in-ed-style-patches-.patch lib_patch.Upstream
-package/patch/0004-Invoke-ed-directly-instead-of-using-the-shell.patch lib_patch.Upstream
-package/patch/0005-Don-t-follow-symlinks-unless--follow-symlinks-is-given.patch lib_patch.Upstream
 package/patchelf/0001-Add-option-to-make-the-rpath-relative-under-a-specif.patch lib_patch.Upstream
 package/paxtest/0001-genpaxtest-move-log-location.patch lib_patch.Upstream
 package/paxtest/0002-paxtest-page-alignment-ARM-and-NIOS2-arch.patch lib_patch.Upstream
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
