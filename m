Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3544BC83F2C
	for <buildroot@archiver.kernel.org>; Sun,  3 Sep 2023 16:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD0E081440;
	Sun,  3 Sep 2023 16:36:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD0E081440
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TJnByMjYSfXV; Sun,  3 Sep 2023 16:36:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 045A98141B;
	Sun,  3 Sep 2023 16:36:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 045A98141B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 332DD1BF381
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 16:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C40060A4F
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 16:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C40060A4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8mo4g5tT_Fjg for <buildroot@lists.busybox.net>;
 Sun,  3 Sep 2023 16:36:36 +0000 (UTC)
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE253608B7
 for <buildroot@buildroot.org>; Sun,  3 Sep 2023 16:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE253608B7
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1a1fa977667so682657fac.1
 for <buildroot@buildroot.org>; Sun, 03 Sep 2023 09:36:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693758994; x=1694363794;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RSw/n/CMV4IGlg5a/UMbjYIqC6N9AK7dZrc0ksrZpas=;
 b=W4qBvyXBlFON8o34lP8P4WOZghlWNit+4VrzZqoBdABazVZJqZHSTXNoqOIEouNNIw
 AmES8IRJJOKdaE4Rv9QbRCup0fY0wQfqK02iPC3D7ed5IF+0f9LtTg9oKaTClHl7BdXD
 5eY5/ijZPrOMUXIqDr0znOJF72NaKdC2mCWTm441aGLa3oxOtgsZiNQnTMJwn/TO2EC0
 1AUdbE0gSU+Wp22q3Nc3f9JmErVoL+n4GOJp7rPM/PYGfJBI4pe0Wym9Sp5BXUp3Q0Aq
 EkyeACYC5F7EX/DSzmI8OC6TxuyeECZSuau8G1MRJ4HOWbUGdrNZ843qTcSBAmbhzP6r
 kgMg==
X-Gm-Message-State: AOJu0YyFZFAHbcTrJeyA/2ZRWV1xEN1yPCuS4tyIwGRnXYAk6DtkBmzO
 kVKQIsKJfWZbt+glBd4udRmwbW4ghB0=
X-Google-Smtp-Source: AGHT+IFyrZxTuLMz2tlWETyZliJSzbE9mEy+5zSnGaTRUeG4PSJiyzMVRB3VXHN8UUMR0OePcslknw==
X-Received: by 2002:a05:6870:55a5:b0:1d0:f064:acbb with SMTP id
 n37-20020a05687055a500b001d0f064acbbmr10478742oao.19.1693758994550; 
 Sun, 03 Sep 2023 09:36:34 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:7980:8b6b:3897:d6c:e635:bd4e])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a9d7348000000b006b753685cc5sm3789487otk.79.2023.09.03.09.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 09:36:33 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Sep 2023 13:35:07 -0300
Message-Id: <20230903163509.614740-2-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230903163509.614740-1-ricardo.martincoski@gmail.com>
References: <20230903163509.614740-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693758994; x=1694363794; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RSw/n/CMV4IGlg5a/UMbjYIqC6N9AK7dZrc0ksrZpas=;
 b=Z41ZPEdvpbsmU6ay/7/EGV8m2xN3UcXlQH2Fm5rh1J+8dSsvag6BrUE2HDietCRbKu
 ZDbAyLgBFD5UtXIpHNHYybZ1wcsaArXUiW7fsE+LloAb9CI98WHeTo7g63cEMNJxsQbd
 zEXTprGMSVQxA8ia/naow/8BrvNYkvnF/eeAj/IRyZp07O0nRhUKxbeMajcZ3i0FuFyR
 8CPcECBoMrbK4vNMxtyVm87So00q8mZteU8jW3EFpx6utO7YXhrjsqoASo18YWRpFVZD
 tgHugSyVjlysq8KkxiLS+GhHAHJzda1QXNt1RLF/HGkym3LE2Zn+BzQ/evmxsiY54e8I
 fD1Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Z41ZPEdv
Subject: [Buildroot] [next v3 1/3] utils/check-package: factor-out
 check_disabled()
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
Cc: James Knight <james.d.knight@live.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently source files analysed by check-package can use a special
comment to hint the script to completely ignore a CheckFunction for the
next line of the source file:

    # check-package Indent

Currently the logic that implements this is at the main check-package
script. But the main package script is not covered by unit tests.

In preparation to support not only
'ignore this CheckFunction for the next source line'
but also
'use special rules for this CheckFunction when testing this file'
move the logic that parses such special comments into the base class
_CheckFunction.

At same time, create unit tests that exercise such code.

Cc: James Knight <james.d.knight@live.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v1 -> v3:
  - new patch, implementing a code improvement detected while reviewing
    v1 of this series

https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/990306862
---
 utils/check-package                |  2 +-
 utils/checkpackagelib/base.py      |  5 +++
 utils/checkpackagelib/test_base.py | 49 ++++++++++++++++++++++++++++++
 utils/checkpackagelib/test_util.py |  5 ++-
 4 files changed, 59 insertions(+), 2 deletions(-)
 create mode 100644 utils/checkpackagelib/test_base.py

diff --git a/utils/check-package b/utils/check-package
index 105902303e..23d250d4a1 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -237,7 +237,7 @@ def check_file_using_lib(fname):
         for lineno, text in enumerate(f):
             nlines += 1
             for name, cf in objects:
-                if cf.disable.search(lastline):
+                if cf.check_disabled(lastline):
                     continue
                 line_sts = cf.check_line(lineno + 1, text)
                 warn, fail = print_warnings(line_sts, name in xfail)
diff --git a/utils/checkpackagelib/base.py b/utils/checkpackagelib/base.py
index f666e4110b..15a304acf3 100644
--- a/utils/checkpackagelib/base.py
+++ b/utils/checkpackagelib/base.py
@@ -8,6 +8,11 @@ class _CheckFunction(object):
         self.url_to_manual = url_to_manual
         self.disable = re.compile(r"^\s*# check-package .*\b{}\b".format(self.__class__.__name__))
 
+    def check_disabled(self, line_before):
+        if self.disable.search(line_before):
+            return True
+        return False
+
     def before(self):
         pass
 
diff --git a/utils/checkpackagelib/test_base.py b/utils/checkpackagelib/test_base.py
new file mode 100644
index 0000000000..ef266d542c
--- /dev/null
+++ b/utils/checkpackagelib/test_base.py
@@ -0,0 +1,49 @@
+import pytest
+import checkpackagelib.test_util as util
+import checkpackagelib.base as m
+
+
+IgnoreNextLine = [
+    ('without comment to ignore a given CheckFunction',
+     'any',
+     'content to test\n'
+     '# commented content to test\n'
+     'content to test\n'
+     'content to test\n'
+     'content to test\n',
+     [1, 2, 3, 4, 5]),  # set of line numbers for all lines not ignored while testing
+    ('ignore next line',
+     'any',
+     'content to test\n'
+     '# check-package CheckFunctionUnderTest\n'
+     'content to ignore\n'
+     'content to test\n'
+     'content to test\n',
+     [1, 2, 4, 5]),
+    ('comment to ignore one CheckFunction does not affect another one',
+     'any',
+     'content to test\n'
+     '# check-package AnotherCheckFunction\n'
+     'content to test\n'
+     'content to test\n'
+     'content to test\n',
+     [1, 2, 3, 4, 5]),
+    ('ignore 2 CheckFunctions for next line',
+     'any',
+     '# check-package CheckFunctionUnderTest, AnotherCheckFunction\n'
+     'content to ignore\n'
+     '# check-package AnotherCheckFunction, CheckFunctionUnderTest\n'
+     'content to ignore\n'
+     'content to test\n',
+     [1, 3, 5]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', IgnoreNextLine)
+def test_IgnoreNextLine(testname, filename, string, expected):
+    class CheckFunctionUnderTest(m._CheckFunction):
+        def check_line(self, lineno, text):
+            return lineno
+
+    warnings = util.check_file(CheckFunctionUnderTest, filename, string)
+    assert warnings == expected
diff --git a/utils/checkpackagelib/test_util.py b/utils/checkpackagelib/test_util.py
index 23f2995e27..b06e218498 100644
--- a/utils/checkpackagelib/test_util.py
+++ b/utils/checkpackagelib/test_util.py
@@ -2,7 +2,10 @@ def check_file(check_function, filename, string):
     obj = check_function(filename, 'url')
     result = []
     result.append(obj.before())
+    lastline = ""
     for i, line in enumerate(string.splitlines(True)):
-        result.append(obj.check_line(i + 1, line))
+        if not obj.check_disabled(lastline):
+            result.append(obj.check_line(i + 1, line))
+        lastline = line
     result.append(obj.after())
     return [r for r in result if r is not None]
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
