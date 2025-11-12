Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F0DCCF9F8
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 11:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B025140A8B;
	Wed, 12 Nov 2025 11:06:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xfm2DK1mgkI0; Wed, 12 Nov 2025 11:06:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84A3340A7D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84A3340A7D;
	Wed, 12 Nov 2025 11:06:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2170724D
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 11:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 133D860DB0
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 11:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R8pg1Eb9C-FJ for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 11:06:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0784D607A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0784D607A1
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0784D607A1
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 11:06:51 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2014403935; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 12 Nov 2025 11:06:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1vJ8ga-00H0sK-21;
 Wed, 12 Nov 2025 12:06:48 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 12 Nov 2025 12:06:43 +0100
Message-Id: <20251112110644.4054902-3-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251112110644.4054902-1-peter@korsgaard.com>
References: <20251112110644.4054902-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Fe88uICUrV3NaUwNWu3v6S8r84fWt/+f4auv3hBWMn123q4U4tZDXiaUbsfe/8+nb30Z/EIlpEUXNzoFpDtdGw1FCGJd6UKk7Dr3SHkxjroVJuL3tzqd705giQy3TV5DejjHmRAW8vROujUX4H8ZwCKuNRcwC6TceAlqRtSXfKPb0U66n6FRCsAhMqPv128RPVswOOshyZwtEEybAt+ygrQs0dX6c3rvXYeF27f5g8tvae0xoa869RvUi8h6H4MQ5X/cLigU7L90lPak5H+dmIxsbtTvn08x5UETdzOsL3x9ZG+GEFxqtHRwEXAOCuyuUjTDnk48v3s9Hj1O8xQGKA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=CiB+aIIRJq0aE9po1iaDRhe5hOexav73aOJk6g+Ay/s=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=Fe88uICU
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 3/3] utils/check-package: add a check for
 'default n' in Config.in files
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Boolean Config.in symbols default to 'n', so we typically do not add such
redundant lines.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/checkpackagelib/lib_config.py      | 11 ++++++++
 utils/checkpackagelib/test_lib_config.py | 33 ++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index bf975d7a3b..202baa7f1b 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -242,6 +242,17 @@ class Indent(_CheckFunction):
                         text]
 
 
+class NoDefaultN(_CheckFunction):
+    DEFAULTN = re.compile(r"^\tdefault n$")
+
+    def check_line(self, lineno, text):
+        text_nocomments = text.split("#")[0].rstrip()
+        if self.DEFAULTN.match(text_nocomments):
+            return ["{}:{}: boolean symbols default to 'n', so 'default n' is redundant"
+                    .format(self.filename, lineno),
+                    text]
+
+
 class RedefinedConfig(_CheckFunction):
     CONFIG = re.compile(r"^\s*(menu|)config\s+(BR2_\w+)\b")
     IF = re.compile(r"^\s*if\s+([^#]*)\b")
diff --git a/utils/checkpackagelib/test_lib_config.py b/utils/checkpackagelib/test_lib_config.py
index 474d17105e..35614ef152 100644
--- a/utils/checkpackagelib/test_lib_config.py
+++ b/utils/checkpackagelib/test_lib_config.py
@@ -387,6 +387,39 @@ def test_Indent(testname, filename, string, expected):
     assert warnings == expected
 
 
+NoDefaultN = [
+    ('good example',
+     'any',
+     'config BR2_PACKAGE_FOO\n'
+     '\tdefault y\n',
+     []),
+    ('default n',
+     'any',
+     'config BR2_PACKAGE_FOO\n'
+     '\tdefault n\n',
+     [['any:2: boolean symbols default to \'n\', so \'default n\' is redundant',
+       '\tdefault n\n']]),
+    ('default n with comment',
+     'any',
+     'config BR2_PACKAGE_FOO\n'
+     '\tdefault n # this is a comment\n',
+     [['any:2: boolean symbols default to \'n\', so \'default n\' is redundant',
+       '\tdefault n # this is a comment\n']]),
+    ('default n with trailing whitespace',
+     'any',
+     'config BR2_PACKAGE_FOO\n'
+     '\tdefault n  \t\n',
+     [['any:2: boolean symbols default to \'n\', so \'default n\' is redundant',
+       '\tdefault n  \t\n']])
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', NoDefaultN)
+def test_NoDefaultN(testname, filename, string, expected):
+    warnings = util.check_file(m.NoDefaultN, filename, string)
+    assert warnings == expected
+
+
 RedefinedConfig = [
     ('no redefinition',
      'any',
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
