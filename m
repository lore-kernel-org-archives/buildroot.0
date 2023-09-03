Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D147AC83F2D
	for <buildroot@archiver.kernel.org>; Sun,  3 Sep 2023 16:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77199819B4;
	Sun,  3 Sep 2023 16:37:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77199819B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4-9QxEzEmLcO; Sun,  3 Sep 2023 16:37:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69DEE81447;
	Sun,  3 Sep 2023 16:37:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69DEE81447
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B1D31BF381
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 16:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2526A40159
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 16:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2526A40159
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yChsR_cgyXzV for <buildroot@lists.busybox.net>;
 Sun,  3 Sep 2023 16:36:38 +0000 (UTC)
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07F98400E4
 for <buildroot@buildroot.org>; Sun,  3 Sep 2023 16:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07F98400E4
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6bf01bcb1aeso639593a34.3
 for <buildroot@buildroot.org>; Sun, 03 Sep 2023 09:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693758997; x=1694363797;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nEi36f/fQSGaHZmRogaydl6+Y3uVyLxNkwyMBTitbB8=;
 b=K1o/ZOos3+sYx1ECSlRc2w5PM8/HZeutJf8Wp5kPB8qVDwmnjjzeSyTw8y5S9TO6Bv
 yTSMXVgiX7a7c7+to5g+Yl4hw/GnTryWnGgFAB3QcWx0DBZnVdJYTg17BePjxnUVS3Wj
 Do1Wof4rX2H5AUUg+hPbKXLUXPSKnGpEYq3ffVR+zK1Zs5swibviCbYC7eHd8JdL3Ibs
 Uls2UWYiCPzPkv6NUetMelzIDw0FyvphqJsSXgnMovH7I16+Hd+ktVlEcxgNFK5v2Y36
 UlnANAUlxY61Apj/wFd2riLL3N8tsPeuE9Xw2owzwtZPSJCrDY4oRXyrxd0VSi7SoIM3
 QP+Q==
X-Gm-Message-State: AOJu0YxSCOCmfgIu9dXMWGiXe1FTPRNyPhu68Kui2S37OUP6+1deH0Q9
 bnY4fiumKh2XdM3UyY92oZSP8ihd43A=
X-Google-Smtp-Source: AGHT+IHl1+SbcDf39jbL95D6v4cZq1LEsSddavXSxQwSKZStCQobDCf7uflFEg86JZN+nutXz5PnRA==
X-Received: by 2002:a05:6830:11c2:b0:6be:fd1c:c228 with SMTP id
 v2-20020a05683011c200b006befd1cc228mr8702665otq.1.1693758997037; 
 Sun, 03 Sep 2023 09:36:37 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:7980:8b6b:3897:d6c:e635:bd4e])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a9d7348000000b006b753685cc5sm3789487otk.79.2023.09.03.09.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 09:36:36 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Sep 2023 13:35:08 -0300
Message-Id: <20230903163509.614740-3-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230903163509.614740-1-ricardo.martincoski@gmail.com>
References: <20230903163509.614740-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693758997; x=1694363797; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nEi36f/fQSGaHZmRogaydl6+Y3uVyLxNkwyMBTitbB8=;
 b=lxxBPKDHYXQt0sFH77IVF30EdtjznNunac3IdiMfktJ6TjwselPb+dkOg0aF/IrLjs
 CGJMHI901iFazlIUiDuHTtu/5q/hbFaS/DsnENhkRUswUKnEQs5kzXc2SRC0eULSUOW5
 7LsQ7sSPBXGDjDrwZtVbP5OIhGzi2qAR1AYiKSGEgM0cUlLIOTWiqp2LWhKgUjEBf6uw
 mYVcQy4b/E805hGPbIdnSo0ekprSh4zn5BIViwMYIm9uvQlwQvKlKyOvTCLEZiQCVn9J
 GuSvLJxnU1/z5PZ4UpvX8SpCGHQUzA4tmlS8Ho4Pa9gxQ20vywFMPEryiP0XWLxoSEXO
 vseg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=lxxBPKDH
Subject: [Buildroot] [next v3 2/3] utils/check-package: support inline flags
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

Extend that functionality to also support flags that will trigger
special behaviour.
For instance, by adding the line to a Config.in file:

    # check-package Indent_ignore-menu-indent-below

makes the CheckFunction named Indent to set a flag named
ignore-menu-indent-below and use it until the end of the source file
under test.

One example of use for this new special comment is Indent() from
lib_config.py, that currently keeps a list of 4 intree Config.in files
that have a special but legitimate indentation rule.
Instead of keeping the list inside the code, now a special comment can
be used in each of these 4 Config.in files.

A great side effect of this new type of special comment is that it can
also be used in source files from br2-external trees.

Concept reused from James Knight's work in [1] and [2].
[1] http://patchwork.ozlabs.org/project/buildroot/patch/SN4P221MB0682AE13FB1ACA5A755024F1A0689@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM/
[2] http://patchwork.ozlabs.org/project/buildroot/patch/SN4P221MB06823B0F7326D27ECD5E0FAEA0689@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM/

Cc: James Knight <james.d.knight@live.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v1 -> v3:
  - rewrite the code from scratch for patches 2/4 and 3/4, moving it to
    the base class
  - add unit tests

https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/990309342
---
 utils/checkpackagelib/base.py      | 20 ++++++--
 utils/checkpackagelib/test_base.py | 82 ++++++++++++++++++++++++++++++
 2 files changed, 99 insertions(+), 3 deletions(-)

diff --git a/utils/checkpackagelib/base.py b/utils/checkpackagelib/base.py
index 15a304acf3..d17b9d899f 100644
--- a/utils/checkpackagelib/base.py
+++ b/utils/checkpackagelib/base.py
@@ -3,14 +3,28 @@ import re
 
 
 class _CheckFunction(object):
+    flags = []
+
     def __init__(self, filename, url_to_manual):
         self.filename = filename
         self.url_to_manual = url_to_manual
-        self.disable = re.compile(r"^\s*# check-package .*\b{}\b".format(self.__class__.__name__))
+        if self.flags:
+            flags_pattern = '|_' + '|_'.join(self.flags)
+        else:
+            flags_pattern = ''
+        self.disable = re.compile(r"^\s*# check-package .*\b{}({})\b".format(self.__class__.__name__, flags_pattern))
+        self.enabled_flags = {f: False for f in self.flags}
 
     def check_disabled(self, line_before):
-        if self.disable.search(line_before):
-            return True
+        found = self.disable.findall(line_before)
+        if found:
+            # catch flags to be used by CheckFunction for a source file, for all lines below
+            flags_found = [f[1:] for f in found if (f != '' and f[0] == '_')]
+            for f in flags_found:
+                self.enabled_flags[f] = True
+
+            ignore_this_line = '' in found
+            return ignore_this_line
         return False
 
     def before(self):
diff --git a/utils/checkpackagelib/test_base.py b/utils/checkpackagelib/test_base.py
index ef266d542c..bbe9285466 100644
--- a/utils/checkpackagelib/test_base.py
+++ b/utils/checkpackagelib/test_base.py
@@ -47,3 +47,85 @@ def test_IgnoreNextLine(testname, filename, string, expected):
 
     warnings = util.check_file(CheckFunctionUnderTest, filename, string)
     assert warnings == expected
+
+
+SpecialCheckForThisFile = [
+    ('without special comment',
+     'any',
+     'content to test\n'
+     '# commented content to test\n'
+     'content to test\n'
+     'content to test\n'
+     'content to test\n',
+     [1, 2, 3, 4, 5]),  # set of line numbers for all lines not ignored while testing
+    ('ignore next line (CheckFunction with flags)',
+     'any',
+     'content to test\n'
+     '# check-package CheckFunctionUnderTest\n'
+     'content to ignore\n'
+     'content to test\n'
+     'content to test\n',
+     [1, 2, 4, 5]),
+    ('comment to ignore one CheckFunction does not affect another one (CheckFunction with flags)',
+     'any',
+     'content to test\n'
+     '# check-package AnotherCheckFunction\n'
+     'content to test\n'
+     'content to test\n'
+     'content to test\n',
+     [1, 2, 3, 4, 5]),
+    ('ignore 2 CheckFunctions for next line (CheckFunction with flags)',
+     'any',
+     '# check-package CheckFunctionUnderTest, AnotherCheckFunction\n'
+     'content to ignore\n'
+     '# check-package AnotherCheckFunction, CheckFunctionUnderTest\n'
+     'content to ignore\n'
+     'content to test\n',
+     [1, 3, 5]),
+    ('one flag',
+     'any',
+     'content to test using default code\n'
+     '# check-package CheckFunctionUnderTest_flag-2\n'
+     'content to test using flag-2\n'
+     'content to test using flag-2\n',
+     [1, 2, [3, [-2]], [4, [-2]]]),
+    ('flag and ignore next line in the same file',
+     'any',
+     'content to test using default code\n'
+     '# check-package CheckFunctionUnderTest\n'
+     'content to ignore\n'
+     '# check-package CheckFunctionUnderTest_flag-2\n'
+     'content to test using flag-2\n'
+     '# check-package CheckFunctionUnderTest\n'
+     'content to ignore\n'
+     'content to test using flag-2\n',
+     [1, 2, 4, [5, [-2]], [6, [-2]], [8, [-2]]]),
+    ('2 flags',
+     'any',
+     'content to test using default code\n'
+     '# check-package CheckFunctionUnderTest_flag-2\n'
+     'content to test using flag-2\n'
+     '# check-package CheckFunctionUnderTest_flag-1\n'
+     'content to test using flag-1 and flag-2\n'
+     'content to test using flag-1 and flag-2\n',
+     [1, 2, [3, [-2]], [4, [-2]], [5, [-1, -2]], [6, [-1, -2]]]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', SpecialCheckForThisFile)
+def test_SpecialCheckForThisFile(testname, filename, string, expected):
+    class CheckFunctionUnderTest(m._CheckFunction):
+        flags = ['flag-1', 'flag-2']
+
+        def check_line(self, lineno, text):
+            flags = []
+            if self.enabled_flags['flag-1']:
+                flags.append(-1)
+            if self.enabled_flags['flag-2']:
+                flags.append(-2)
+            if flags:
+                return [lineno, flags]
+            return lineno
+
+    warnings = util.check_file(CheckFunctionUnderTest, filename, string)
+    assert warnings == expected
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
