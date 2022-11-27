Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4054EC4321E
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 13:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBB42410BD;
	Sun, 27 Nov 2022 13:08:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBB42410BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ly7qHT5cvBv; Sun, 27 Nov 2022 13:08:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86FAB410BE;
	Sun, 27 Nov 2022 13:08:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86FAB410BE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 269431BF42C
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E8544099F
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E8544099F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2zw6UxtoO7tp for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 13:08:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7BFC4098A
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7BFC4098A
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 13:08:07 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id c129so9058631oia.0
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 05:08:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rBRMadNFAJQZBi6uC9EFFKI9wHDhRLKABQ7RU8KdhxU=;
 b=VXGih6I0R2eGs7jwxomqmqgX5oLQdzcZGjSsysujsNyd+hz0U275MmnJuzUwQDq+VW
 Wu+ZrlUCEjn2XwElh+mishSVttFsDRBfzXH0vV30I1pz8VYIFrI3xVwZZ6SI/Qe4JC8O
 uh/sC64YnLmwCM8I+st+R/Phl2HlEz7B0I/I87eylm9d2C+wp/PC/Aqjb5AhKjXktLf+
 WFq+xnjjeuemhL1DTAVLiu8IGYrdTJ+1H/TW9k7k9MFw/PjeZYXUtogFqJE7xuPc/m2L
 BPyzVZB8Z94ZrUhoplOkgB2giWGbGI2B2Caxl5qQ3GRB/DZt493x1rSb/pV7Xz7YUpvB
 gAKg==
X-Gm-Message-State: ANoB5pkWNE66IkdLYpy6DDYih2x0aooiWTNFZnC5m4CoNSz124JUiJ3B
 UBa9SGVHgNhS5W6dCxMgGmeGYf6Y0So=
X-Google-Smtp-Source: AA0mqf6ph562pb/cDstWFD8h/EtGeWSTtUWI57Nm52sMlmr7BfLlpYSIGbi9mZlUvYcd36cx+I2jWA==
X-Received: by 2002:a54:401a:0:b0:35a:f075:6791 with SMTP id
 x26-20020a54401a000000b0035af0756791mr13134379oie.20.1669554486877; 
 Sun, 27 Nov 2022 05:08:06 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:9b54:d73e:4d8c:458c])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a9d6519000000b0066a9ba5094fsm3655102otl.1.2022.11.27.05.08.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 05:08:05 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 10:07:18 -0300
Message-Id: <20221127130739.1862398-5-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
References: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rBRMadNFAJQZBi6uC9EFFKI9wHDhRLKABQ7RU8KdhxU=;
 b=YlAzORdnGg9ezS0yuKlZmkgAZRbPBpLt2QtPhd8DbfOeVStk3tOwp22Woe2yLpdsho
 zWtTeWjBPeNhnp4huW6BSmZ8e5dvEKVRC8yZFcITxlveePHh/ERt9mVJAsrarp63f1Gw
 oCxYfidpYNu3ua4zReIoC73VIh+mx6u1QSY9HR3za5uaGanCQquJOe7vG3Q8eNKGe/z0
 JmM3tTQTxwbOTdsDzuEW//U9sjyq0i49QPHZi5oO3GpxJMPQBSzUX4sV9J1262qAquGU
 IwmyV7TYyMd+DCFrMKeXujiYZNkwq4W1OTg0wo9HJpZ/aUwiMJIqug2x5UehWBq+w6cC
 0pVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YlAzORdn
Subject: [Buildroot] [next 04/25] utils/checkpackagelib: warn about
 redefined config
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Warn the developer in the case the same config is declared more than
once in the same Config.in file.
But take into account the conditional code that lets the config be
visible and warn only when it is declared more than once in the same
conditions.
For instance, do not warn for:
 if BR2_PACKAGE_BUSYBOX
 config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 endif
 if !BR2_PACKAGE_BUSYBOX # kconfig doesn't support else
 config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 endif

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Applying only this patch on current master, check-package returns:

Config.in.legacy:2597: config BR2_PACKAGE_MEDIAART_BACKEND_GDK_PIXBUF redeclared (previous line: 2589)
---
 utils/checkpackagelib/lib_config.py      | 38 ++++++++++++
 utils/checkpackagelib/test_lib_config.py | 78 ++++++++++++++++++++++++
 2 files changed, 116 insertions(+)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index b05831f2c3..f26ca0d898 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -233,3 +233,41 @@ class Indent(_CheckFunction):
                 return ["{}:{}: should not be indented"
                         .format(self.filename, lineno),
                         text]
+
+
+class RedefinedConfig(_CheckFunction):
+    CONFIG = re.compile(r"^\s*(menu|)config\s+(BR2_\w+)\b")
+    IF = re.compile(r"^\s*if\s+([^#]*)\b")
+    ENDIF = re.compile(r"^\s*endif\b")
+
+    def before(self):
+        self.configs = {}
+        self.conditional = []
+
+    def check_line(self, lineno, text):
+        if _empty_or_comment(text) or _part_of_help_text(text):
+            return
+
+        m = self.IF.search(text)
+        if m is not None:
+            condition = m.group(1)
+            self.conditional.append(condition)
+            return
+
+        m = self.ENDIF.search(text)
+        if m is not None:
+            self.conditional.pop()
+            return
+
+        m = self.CONFIG.search(text)
+        if m is None:
+            return
+        config = m.group(2)
+
+        key = (config, ' AND '.join(self.conditional))
+        if key in self.configs.keys():
+            previous_line = self.configs[key]
+            return ["{}:{}: config {} redeclared (previous line: {})"
+                    .format(self.filename, lineno, config, previous_line),
+                    text]
+        self.configs[key] = lineno
diff --git a/utils/checkpackagelib/test_lib_config.py b/utils/checkpackagelib/test_lib_config.py
index 91a549adf2..474d17105e 100644
--- a/utils/checkpackagelib/test_lib_config.py
+++ b/utils/checkpackagelib/test_lib_config.py
@@ -385,3 +385,81 @@ Indent = [
 def test_Indent(testname, filename, string, expected):
     warnings = util.check_file(m.Indent, filename, string)
     assert warnings == expected
+
+
+RedefinedConfig = [
+    ('no redefinition',
+     'any',
+     'config BR2_PACKAGE_FOO\n'
+     'bool "foo"\n'
+     'config BR2_PACKAGE_FOO_BAR\n'
+     'bool "foo"\n',
+     []),
+    ('no conditional',
+     'any',
+     'config BR2_PACKAGE_FOO\n'
+     'bool "foo"\n'
+     'config BR2_PACKAGE_BAR\n'
+     'bool "bar"\n'
+     'config BR2_PACKAGE_FOO\n'
+     'bool "foo"\n',
+     [['any:5: config BR2_PACKAGE_FOO redeclared (previous line: 1)',
+       'config BR2_PACKAGE_FOO\n']]),
+    ('three times',
+     'any',
+     'config BR2_PACKAGE_FOO\n'
+     'bool "foo"\n'
+     'config BR2_PACKAGE_FOO\n'
+     'bool "foo"\n'
+     'config BR2_PACKAGE_FOO\n'
+     'bool "foo"\n',
+     [['any:3: config BR2_PACKAGE_FOO redeclared (previous line: 1)',
+       'config BR2_PACKAGE_FOO\n'],
+      ['any:5: config BR2_PACKAGE_FOO redeclared (previous line: 1)',
+       'config BR2_PACKAGE_FOO\n']]),
+    ('same conditional',
+     'any',
+     'if BR2_PACKAGE_BAZ\n'
+     'config BR2_PACKAGE_FOO\n'
+     'bool "foo"\n'
+     'config BR2_PACKAGE_BAR\n'
+     'bool "bar"\n'
+     'config BR2_PACKAGE_FOO\n'
+     'bool "foo"\n'
+     'endif\n',
+     [['any:6: config BR2_PACKAGE_FOO redeclared (previous line: 2)',
+       'config BR2_PACKAGE_FOO\n']]),
+    ('equivalent conditional',
+     'any',
+     'if BR2_PACKAGE_BAZ\n'
+     'config BR2_PACKAGE_FOO\n'
+     'bool "foo"\n'
+     'endif\n'
+     'config BR2_PACKAGE_FOO\n'
+     'bool "foo"\n'
+     'if BR2_PACKAGE_BAZ\n'
+     'config BR2_PACKAGE_FOO\n'
+     'bool "foo"\n'
+     'endif\n',
+     [['any:8: config BR2_PACKAGE_FOO redeclared (previous line: 2)',
+       'config BR2_PACKAGE_FOO\n']]),
+    ('not equivalent conditional',
+     'any',
+     'if BR2_PACKAGE_BAZ\n'
+     'config BR2_PACKAGE_FOO\n'
+     'bool "foo"\n'
+     'endif\n'
+     'config BR2_PACKAGE_FOO\n'
+     'bool "foo"\n'
+     'if !BR2_PACKAGE_BAZ\n'
+     'config BR2_PACKAGE_FOO\n'
+     'bool "foo"\n'
+     'endif\n',
+     []),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', RedefinedConfig)
+def test_RedefinedConfig(testname, filename, string, expected):
+    warnings = util.check_file(m.RedefinedConfig, filename, string)
+    assert warnings == expected
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
