Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B88C48260
	for <buildroot@archiver.kernel.org>; Sat, 10 Feb 2024 21:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5D8A605EF;
	Sat, 10 Feb 2024 21:49:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mlhyJeV2YphZ; Sat, 10 Feb 2024 21:49:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96FB8605E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96FB8605E7;
	Sat, 10 Feb 2024 21:49:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 397131BF295
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 21:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E9DC8506E
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 21:25:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6lcS73sp2t9h for <buildroot@lists.busybox.net>;
 Sat, 10 Feb 2024 21:25:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 103728344C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 103728344C
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 103728344C
 for <buildroot@buildroot.org>; Sat, 10 Feb 2024 21:25:04 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-41097f9a9a4so4226625e9.2
 for <buildroot@buildroot.org>; Sat, 10 Feb 2024 13:25:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707600303; x=1708205103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aq+YIoscHR67hogbd/ZrxMpsiSVso7TAmae1U4Zbx64=;
 b=glSC8jipQ318ZD8/eoirJ3NvCGfbPgIPSDg3HO08ZBb1e3PrEAG6YqiiN7W4eV8YID
 o6Wpkq73y6MUlFgo2O7n+6rLV7jw8GEUC8f8bXn/dQ9TWqpElldyTVMN7BCTPy2Q4mV7
 lEFx5SS9VW8TQqLCXXLbtn0hv+3Wy3ZM0ui/BfvLGV3da1wExByplYzFCQlPUgxWmVSR
 l4AAWSGTHuNWA6aXm7atrCFt0fPN6dGGRgG6eHkJ3CKgrZTTrD/zgb2EsQqZARPWFPdT
 Mmv/zzPmqVgJxYdUONHFEAKIe6IJ7xPTh2RsK7AmQpczOoK0K7C6b0tf/5BZnyIlLGiC
 EQGA==
X-Gm-Message-State: AOJu0YwMPTUQuPXiCjeD9sP5zPoIqUgL8dEC+dXN2AdqpsavJ0UCxSIo
 GyT1C5fqBTz6SfbuyH4Pq8DHYexapE8waK/EnJbBArJgfLogsR9oBrs2pAW/
X-Google-Smtp-Source: AGHT+IGAW431OdxcF5XrwOM9AFfpGs37eEyH2vcM8J9z/DV+67rF8FW3VZ8qlWp/tATKdhO+8ID2mQ==
X-Received: by 2002:a5d:4441:0:b0:33b:61b3:4c1f with SMTP id
 x1-20020a5d4441000000b0033b61b34c1fmr2078205wrr.13.1707600302906; 
 Sat, 10 Feb 2024 13:25:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWGRyGCjhhNH8QyIXEQ+TjeMVWt/Ad/uBvgnjV41ef/Y+Xet5tYuXSRuTLYmBpX7e+Kw0QgluV3pWMiE+ov2yYqs5iH7oJbWzueWfllrpNxArCsuRDwEYK7xcPjD7KF5bOyzLEvrsM9Qv8=
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ba23-20020a0560001c1700b0033946c0f9e7sm2728962wrb.17.2024.02.10.13.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Feb 2024 13:25:02 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 10 Feb 2024 22:24:59 +0100
Message-ID: <f00daee9d337aee5d974e913406015830f53676b.1707600292.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707600292.git.yann.morin.1998@free.fr>
References: <cover.1707600292.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707600303; x=1708205103; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aq+YIoscHR67hogbd/ZrxMpsiSVso7TAmae1U4Zbx64=;
 b=Z00a3LK8oi62PmuxTSoW+4IZNWuVsgTfcjfZKS7XujvJltH40Ph6guHkcQZTj2tYCv
 HNvl5wi1WaXIYALWuvy3UTg+AsLKG3bU1D0Ivzg89/YN5QlPIUtS8FjoZmZ4BQoMHTNp
 eaGUk63aWSuHvXXjnF7QG4zu8D9qZQ3UyfaJJYcpheEKZMc45UWk6vK6/OiDL+hZwkk9
 Qq9UdACnCZXOj7U1SA+EkYWmYNnHhLqjapt8m5FXh3Qm42EypObqW2afgo2xmfjMAQ7u
 7sMyPEbhTM3ks54bvwQeh+HurXxV8RC2hDHicvH75jthTWWAatSFa0l1EUA/HUIlj1AG
 srcg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Z00a3LK8
Subject: [Buildroot] [PATCH 6/6 v2] utils/checkpackagelib: add check for CPE
 variables set to default values
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that we can specify that the default values for the CPE_ID variables
are valid, without having to actually set one (or more) to their
default, add a check-package check that validates that the CPE_ID
variables are indeed not set to their default.

It also validates that CPE_ID_VALID is not set when another CPE_ID
variable is set to a non-default value.

Add an anchor in the manual so that we can easily point to it.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 docs/manual/adding-packages-generic.adoc |  2 +-
 utils/checkpackagelib/lib_mk.py          | 73 ++++++++++++++++++++++++
 2 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-generic.adoc b/docs/manual/adding-packages-generic.adoc
index ce8608682f..9d365a10ca 100644
--- a/docs/manual/adding-packages-generic.adoc
+++ b/docs/manual/adding-packages-generic.adoc
@@ -511,7 +511,7 @@ LIBFOO_IGNORE_CVES += CVE-2020-12345
 LIBFOO_IGNORE_CVES += CVE-2020-54321
 ----------------------
 
-* +LIBFOO_CPE_ID_*+ variables is a set of variables that allows the
+* [[cpe-id]] +LIBFOO_CPE_ID_*+ variables is a set of variables that allows the
   package to define its https://nvd.nist.gov/products/cpe[CPE
   identifier]. The available variables are:
 +
diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index d340882971..ce2ab5157c 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -366,3 +366,76 @@ class VariableWithBraces(_CheckFunction):
             return ["{}:{}: use $() to delimit variables, not ${{}}"
                     .format(self.filename, lineno),
                     text]
+
+
+class CPEVariables(_CheckFunction):
+    """
+    Check that the values for the CPE variables are not the default.
+      - CPE_ID_* variables must not be set to their default
+      - CPE_ID_VALID must not be set if a non-default CPE_ID variable is set
+    """
+    def before(self):
+        pkg, _ = os.path.splitext(os.path.basename(self.filename))
+        self.CPE_fields_defaults = {
+            "VALID": "NO",
+            "PREFIX": "cpe:2.3:a",
+            "VENDOR": f"{pkg}_project",
+            "PRODUCT": pkg,
+            "VERSION": None,
+            "UPDATE": "*",
+        }
+        self.valid = None
+        self.non_defaults = 0
+        self.CPE_FIELDS_RE = re.compile(
+            r"^\s*(.+_CPE_ID_({}))\s*=\s*(.+)$"
+            .format("|".join(self.CPE_fields_defaults)),
+        )
+        self.VERSION_RE = re.compile(
+            rf"^(HOST_)?{pkg.upper().replace('-', '_')}_VERSION\s*=\s*(.+)$",
+        )
+        self.COMMENT_RE = re.compile(r"^\s*#.*")
+
+    def check_line(self, lineno, text):
+        text = self.COMMENT_RE.sub('', text.rstrip())
+
+        # WARNING! The VERSION_RE can _also_ match the same lines as CPE_FIELDS_RE,
+        # but not the other way around. So we must first check for CPE_FIELDS_RE,
+        # and if not matched, then and only then check for VERSION_RE.
+        match = self.CPE_FIELDS_RE.match(text)
+        if match:
+            var, field, val = match.groups()
+            return self._check_field(lineno, text, field, var, val)
+
+        match = self.VERSION_RE.match(text)
+        if match:
+            self.CPE_fields_defaults["VERSION"] = match.groups()[1]
+
+    def after(self):
+        # "VALID" counts in the non-defaults; so when "VALID" is present,
+        # 1 non-default means only "VALID" is present, so that's OK.
+        if self.valid and self.non_defaults > 1:
+            return ["{}:{}: 'YES' is implied when a non-default CPE_ID field is specified: {} ({}#cpe-id)".format(
+                        self.filename,
+                        self.valid["lineno"],
+                        self.valid["text"],
+                        self.url_to_manual,
+            )]
+
+    def _check_field(self, lineno, text, field, var, val):
+        if field == "VERSION" and self.CPE_fields_defaults[field] is None:
+            return ["{}:{}: expecting package version to be set before CPE_ID_VERSION".format(
+                self.filename,
+                lineno,
+            )]
+        if val == self.CPE_fields_defaults[field]:
+            return ["{}:{}: '{}' is the default value for {} ({}#cpe-id)".format(
+                self.filename,
+                lineno,
+                val,
+                var,
+                self.url_to_manual,
+            )]
+        else:
+            if field == "VALID":
+                self.valid = {"lineno": lineno, "text": text}
+            self.non_defaults += 1
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
