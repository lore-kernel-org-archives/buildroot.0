Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABFE1C4321E
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 13:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 511F04019B;
	Sun, 27 Nov 2022 13:10:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 511F04019B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jl-3BmN5xDzo; Sun, 27 Nov 2022 13:10:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06E41400D0;
	Sun, 27 Nov 2022 13:10:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06E41400D0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 62E611BF42C
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F02260B2E
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F02260B2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zXqhggEPETYf for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 13:08:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49F9F60B23
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49F9F60B23
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 13:08:31 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 94-20020a9d0067000000b0066c8d13a33dso5359864ota.12
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 05:08:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/wOIY4GnwUhp8WEr1GSIiXWzjh1bvKr6ZT95sFLgOn8=;
 b=zsAriR9exJcDLQk7oOFfNfl+oM5VSqu+UyqwQiYA+/55ZEMxFiqBDFWmqD0YDbWO5L
 qRvIpJACWEjWP6IrDvqKTnsFhfQ3aPcFRoVmi2oG+PIuCe5TopWWFngSyrlYC2o0dPyY
 /IF86vXTozvTztV9m7GSLRNkKFtvzxtmsk7yJC+Jb9Ts4cTTz8j3L5VIpCAiEolUi0Zq
 GFq0PR4Og2Sj0UZ2XJJlKippCyz6InNhzT0Ivf+TfX4d+XQGG1DUxDzKDMhIVlEnT93h
 O7HxvfmPinqW2rB21bc/88JA6Qtt8MYQfQC9WcFOp4pk2WN+i2MUnrUclTdy+nyTmRcH
 mbhg==
X-Gm-Message-State: ANoB5pmIrerTUfSSDJiGGw1Z8BP0mQlVoFHsnhVz1oNMEqtGphy/4jT4
 /j6k1iT7AvN+LS7/F/r33+80hWCoVsg=
X-Google-Smtp-Source: AA0mqf6DRLoeuGMXK62KeV99syepvjbQmsf275y9oNvgjHykeiuevSRjUCRWlthD7jb1IkbmnJmF2A==
X-Received: by 2002:a05:6830:2002:b0:661:2aa:cf92 with SMTP id
 e2-20020a056830200200b0066102aacf92mr16218752otp.99.1669554510246; 
 Sun, 27 Nov 2022 05:08:30 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:9b54:d73e:4d8c:458c])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a9d6519000000b0066a9ba5094fsm3655102otl.1.2022.11.27.05.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 05:08:28 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 10:07:26 -0300
Message-Id: <20221127130739.1862398-13-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
References: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/wOIY4GnwUhp8WEr1GSIiXWzjh1bvKr6ZT95sFLgOn8=;
 b=dedlpusPI7F1CVPrnZGmyt1eng0Q366hQT8AW4MVc56gc7EKsk9l2/ccnPrs7iqaYx
 0q0nFSrc2QEjS90KM0Ni1KmepS/2GXZ5yz9WCyC1pL5y5LamDtw3WMj5g11IRGyycoKz
 2c7n91u9bYbyvfp9SExLLJlDGO4Nlxw/PqkzfP0X4cNmzcaXqa83StRaPE31Kfz9RrmC
 /0MWpIkB6p6o+8zWqW6R2kZ7/M52+5LabHGQJr8jpt7oo5coc1BkXOoub8U9IjstfY4m
 vH6qfhK5trtJBK1uno9FBfMh2Gus/mRnQIsXYbmwOWp9cmtAsRt4aCfIh1yYRokDyBji
 UZuA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dedlpusP
Subject: [Buildroot] [next 12/25] utils/checkpackagelib: warn about ifdef on
 .mk
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

There are two legitimate cases to prefer ifdef over ifeq in package
recipes: command-line overrides are allowed for busybox and uclibc
configs.

Except for that, all package in tree already use ifeq, so warn the
developer adding/changing a package to use ifeq instead of ifdef, in
order to keep consistence across packages.
file.mk:2: use ifeq ($(SYMBOL),y) instead of ifdef SYMBOL
file.mk:5: use ifneq ($(SYMBOL),y) instead of ifndef SYMBOL

The difference between ifeq and ifdef is that ifdef doesn't expand
recursively.

Add comments to busybox and uclibc packages to avoid a warning in such
special cases.

Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
NOTE 1:
I only state "all package in tree already use ifeq" because earlier in
the series other 3 (2 ifdef and 1 ifndef) uses were removed.

NOTE 2:
We have both
ifneq ($(BR2_ENABLE_LOCALE),y)
and
ifeq ($(BR2_ENABLE_LOCALE),)
in the tree.
I assume both do the same.
So I choose one for the check-package warning message, for no particular
reason.
package/dialog/dialog.mk:ifneq ($(BR2_ENABLE_LOCALE),y)
package/dosfstools/dosfstools.mk:ifneq ($(BR2_ENABLE_LOCALE),y)
package/dvb-apps/dvb-apps.mk:ifeq ($(BR2_ENABLE_LOCALE),)
package/gettext-gnu/gettext-gnu.mk:ifeq ($(BR2_ENABLE_LOCALE),)
package/guile/guile.mk:ifeq ($(BR2_ENABLE_LOCALE),)
package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk:ifeq ($(BR2_ENABLE_LOCALE),)
package/kodi/kodi.mk:ifeq ($(BR2_ENABLE_LOCALE),)
package/libcddb/libcddb.mk:ifeq ($(BR2_ENABLE_LOCALE),)
package/libcdio/libcdio.mk:ifeq ($(BR2_ENABLE_LOCALE),)
package/libglib2/libglib2.mk:ifneq ($(BR2_ENABLE_LOCALE),y)
package/libpsl/libpsl.mk:ifeq ($(BR2_ENABLE_LOCALE),)
package/lsof/lsof.mk:ifeq ($(BR2_ENABLE_LOCALE),)
package/sdl_sound/sdl_sound.mk:ifneq ($(BR2_ENABLE_LOCALE),y)
package/softether/softether.mk:ifeq ($(BR2_ENABLE_LOCALE),)
package/uclibc-ng-test/uclibc-ng-test.mk:ifeq ($(BR2_ENABLE_LOCALE),)

NOTE 3:
Applying only this patch on current master, check-package returns:
package/pugixml/pugixml.mk:32: use ifeq ($(SYMBOL),y) instead of ifdef SYMBOL
package/live555/live555.mk:42: use ifneq ($(SYMBOL),y) instead of ifndef SYMBOL
package/fwts/fwts.mk:18: use ifeq ($(SYMBOL),y) instead of ifdef SYMBOL
---
 package/busybox/busybox.mk           |  1 +
 package/uclibc/uclibc.mk             |  1 +
 utils/checkpackagelib/lib_mk.py      | 18 +++++++++++
 utils/checkpackagelib/test_lib_mk.py | 48 ++++++++++++++++++++++++++++
 4 files changed, 68 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 0f14bf999d..f8f9cb5616 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -110,6 +110,7 @@ BUSYBOX_MAKE_OPTS = \
 
 # specifying BUSYBOX_CONFIG_FILE on the command-line overrides the .config
 # setting.
+# check-package disable Ifdef
 ifndef BUSYBOX_CONFIG_FILE
 BUSYBOX_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG))
 endif
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 0ddf7dfa6d..125aa4cdcf 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -22,6 +22,7 @@ UCLIBC_DEPENDENCIES = host-gcc-initial linux-headers
 
 # specifying UCLIBC_CONFIG_FILE on the command-line overrides the .config
 # setting.
+# check-package disable Ifdef
 ifndef UCLIBC_CONFIG_FILE
 UCLIBC_CONFIG_FILE = $(call qstrip,$(BR2_UCLIBC_CONFIG))
 endif
diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index b50a19ac62..8adf844e9a 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -21,6 +21,24 @@ continue_conditional = ["elif", "else"]
 end_conditional = ["endif"]
 
 
+class Ifdef(_CheckFunction):
+    IFDEF = re.compile(r"^\s*(else\s+|)(ifdef|ifndef)\s")
+
+    def check_line(self, lineno, text):
+        m = self.IFDEF.search(text)
+        if m is None:
+            return
+        word = m.group(2)
+        if word == 'ifdef':
+            return ["{}:{}: use ifeq ($(SYMBOL),y) instead of ifdef SYMBOL"
+                    .format(self.filename, lineno),
+                    text]
+        else:
+            return ["{}:{}: use ifneq ($(SYMBOL),y) instead of ifndef SYMBOL"
+                    .format(self.filename, lineno),
+                    text]
+
+
 class Indent(_CheckFunction):
     COMMENT = re.compile(r"^\s*#")
     CONDITIONAL = re.compile(r"^\s*({})\s".format("|".join(start_conditional + end_conditional + continue_conditional)))
diff --git a/utils/checkpackagelib/test_lib_mk.py b/utils/checkpackagelib/test_lib_mk.py
index 49fa216fcd..80a1736b4e 100644
--- a/utils/checkpackagelib/test_lib_mk.py
+++ b/utils/checkpackagelib/test_lib_mk.py
@@ -3,6 +3,54 @@ import checkpackagelib.test_util as util
 import checkpackagelib.lib_mk as m
 
 
+Ifdef = [
+    ('ignore commented line',
+     'any',
+     '# ifdef\n',
+     []),
+    ('simple',
+     'any',
+     '\n'
+     'ifdef BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE\n'
+     'endif\n',
+     [['any:2: use ifeq ($(SYMBOL),y) instead of ifdef SYMBOL',
+       'ifdef BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE\n']]),
+    ('ignore indentation',
+     'any',
+     '  ifdef FOO\n'
+     '  endif\n'
+     '\tifdef BAR\n'
+     'endif\n',
+     [['any:1: use ifeq ($(SYMBOL),y) instead of ifdef SYMBOL',
+       '  ifdef FOO\n'],
+      ['any:3: use ifeq ($(SYMBOL),y) instead of ifdef SYMBOL',
+       '\tifdef BAR\n']]),
+    ('typo',
+     'any',
+     '\n'
+     'ifndef ($(BR2_ENABLE_LOCALE),y)\n'
+     'endif\n',
+     [['any:2: use ifneq ($(SYMBOL),y) instead of ifndef SYMBOL',
+       'ifndef ($(BR2_ENABLE_LOCALE),y)\n']]),
+    ('else ifdef',
+     'any',
+     'else ifdef  SYMBOL # comment\n',
+     [['any:1: use ifeq ($(SYMBOL),y) instead of ifdef SYMBOL',
+       'else ifdef  SYMBOL # comment\n']]),
+    ('else ifndef',
+     'any',
+     '\t else  ifndef\t($(SYMBOL),y) # comment\n',
+     [['any:1: use ifneq ($(SYMBOL),y) instead of ifndef SYMBOL',
+       '\t else  ifndef\t($(SYMBOL),y) # comment\n']]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', Ifdef)
+def test_Ifdef(testname, filename, string, expected):
+    warnings = util.check_file(m.Ifdef, filename, string)
+    assert warnings == expected
+
+
 Indent = [
     ('ignore comment at beginning of line',
      'any',
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
