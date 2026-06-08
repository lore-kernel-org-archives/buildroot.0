Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197F7CD6E79
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 22:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEEC661BC2;
	Mon,  8 Jun 2026 22:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TV_JW5phOfiQ; Mon,  8 Jun 2026 22:14:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDC5861C8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780956876;
	bh=2ggf9dBIn/fcB5bay9bfmgdvUG/YW+EKhJYUJBRiorw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=m6o++x7We/al3aLiaYn8NxppguKXiFUv9W5LSeW0fN2BKsraH507v2q5aFQmcofL3
	 061Zgg8wBC5UIxyEoHl3SF+rz+4fXb71K59RMKODpvg61ZVvqTYEoqG+SGxjt8qtno
	 3FIH64HYYTN0xXx5SfHWpqa/ZNV17JSwRESlsZxHBq7kCyCYMTHLG4pBL0LM7KPerG
	 692fK6gs0vBZQVoWmatyKBBgw0tQt16l6cqeChSuvqsL4RqO3Z5AGLuuBJU5vJojE2
	 xdkMp9wTdWQE0AeFm1FZVTOUE14N1dQo7jFvuJmAsTgk3jWDnRjZg/l3oFUVyWH2CR
	 5R0BLiNgz2ZXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDC5861C8E;
	Mon,  8 Jun 2026 22:14:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E51762C1
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 22:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB97242AF4
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 22:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FgTiIxhvGarz for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 22:14:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0D9E742AF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D9E742AF0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D9E742AF0
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 22:14:32 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-490b1bbcf3aso39974495e9.1
 for <buildroot@buildroot.org>; Mon, 08 Jun 2026 15:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780956871; x=1781561671;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+/5mQSlDjrX+1lfYCGZhYeUTQUKIlWB22tNRyaHDskw=;
 b=E8ejkwZqSaBeJIyylbzv9DRW/rMpLTm5v21WFqfUIV8Hjm1GxJURhEQk8Q3Kz6ftZD
 lMkahTRynbdoI3l/fjJo7Fv7VR9Mrc5S3gezE+peQJF8ISRGQ746UAq1qBxoKBnaSVCI
 zK4TfbKE0iXAjZE3TftDHgltQ7YEapofXclFUgl+Yel12wZKez2MwVkPJlChSSUppbuD
 5ynY5rbgP1Iw0Lh9Op67b8uwM0DZavDVS2wqY97QohryUwg4ehhA87fvEYj1ePXOhssK
 l06VM3WS8sEkNjoU2d5N551h7/ElutmfvYwAAuTvGh0WOPpWFrlM+t6SibUfo/QlN8BC
 Jncw==
X-Gm-Message-State: AOJu0YybzFdO2OP5rr+9dsU7u/8BIgWkzAZUd9ZS+Yi1NEVyzvxt0TkD
 NlqU9q6PniEjZdiL/rcsMEkq7nn7Xu39Ji4U3ypsM2hxS4/0U8QDksVPXJDA0rAOPCB5PHloH7w
 TjJ7T
X-Gm-Gg: Acq92OEzHkj7xsxEPhPArn8xsXSdyd488cC0R3pTdPtNVMmEna8iXTsTecsY2m1hgno
 KzFWEPBZOAkJFM2lFFb2EmpJ0Dg8Yx5fUrYlbH/YbAtdI+TZJXiuUIvgFdXcvAH8X/KcdaCknpA
 PVAQj8eW/bES780WNZ3kGez3ITTI+ED2y8LEBGoI81qDOKRiBx1nPGaV5OWHQtBcJa5VKdXrLjf
 dNhkvdfs98Av+TX9JqJnMzLERY+ElEY7n70CUag5y+rKkqbtDhPWWbND7sPkkTT6l0B59lYdkYk
 /LpUFzhKZdngXIanRyBg7C9EhjrVqWcvsQAfSNdeTJ/J9K4+Bf2za0wDVNmG9wYrMgMKYM1WAi8
 knNuXk2B/BtV1WjIU4ogvj5MY3jzX8gd/Mrkvb9gKhKmTTb/x4GuWRI52QluRT43iBvctL/Q8UC
 RVjDNRZcUy4cy/oNk33r9c1RKaF7nUFDDTFA2tMY7ITPOoEjg=
X-Received: by 2002:a05:600c:154c:b0:490:b6a4:9f43 with SMTP id
 5b1f17b1804b1-490c25ad8famr261506875e9.7.1780956870787; 
 Mon, 08 Jun 2026 15:14:30 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2f5612sm53788826f8f.15.2026.06.08.15.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2026 15:14:30 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin@orange.com>
Date: Tue,  9 Jun 2026 00:14:15 +0200
Message-ID: <20260608221416.919015-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780956871; x=1781561671; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+/5mQSlDjrX+1lfYCGZhYeUTQUKIlWB22tNRyaHDskw=;
 b=U/o2rRyWsHJV3jj1+pBe2O3d++2yFLM8uuf4TpQ0sXAb8sDvjNmb57tlkmmmksgZHB
 YCxmqgbsMZRva0mtePhwn30HZSP5GIoUrIMybhEoCYqlSWPbH/tuzpHTGBx+6yXWtIN3
 f1u2BAGz1UwK85vGVzecpz1umaIarWi1Af8tfpl8cn49MAI8RKJSf/Q+A7KjuRHH8j1E
 msEhBqaSvhD1Qc9uSzo17iChzEzEOWjass4DLFdaLthUi80vvmDA/ARSNHENJdL4KMWB
 InylhXh6MAcGtjERIqIGV+e09NlCDcQhBHJqvtY9prR50Nx570rQJNI9OXxT0u5SSisW
 8SFg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=U/o2rRyW
Subject: [Buildroot] [PATCH 1/2] utils/checkpackagelib: add new check
 MissingCVEPatch
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When manually patching a vulnerability in a Buildroot package, it is a
common practice to mark the corresponding CVE as ignored for that package.
This is done by appending the CVE identifier to <PKG>_IGNORE_CVES, and
adding a comment above to reference the patch that contains the fix.

However, as packages get bumped and their patches are added, removed or
rebased; it happens that IGNORE_CVES get outdated. One important issue is
marking a CVE as ignored, while the corresponding patch is not in Buildroot.

To detect such cases, add a new checker to checkpackagelib that finds
occurences of:

    # 000x-some-patch.patch
    PKG_IGNORE_CVES += CVE-XXXX-YYYY

where the file 000x-some-patch.patch does not exist.

Assisted-by: Claude:claude-opus-4.8
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 utils/checkpackagelib/lib_mk.py      | 35 ++++++++++++++++++++
 utils/checkpackagelib/test_lib_mk.py | 49 ++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 5d48e8929c..9c19e5acc5 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -6,6 +6,7 @@
 
 import os
 import re
+from pathlib import Path
 
 from checkpackagelib.base import _CheckFunction
 from checkpackagelib.lib import ConsecutiveEmptyLines  # noqa: F401
@@ -117,6 +118,40 @@ class Indent(_CheckFunction):
                         text]
 
 
+class MissingCVEPatch(_CheckFunction):
+    PATCH_COMMENT = re.compile(r"^#\s*(\S+\.patch)\s*$")
+    IGNORE_CVES = re.compile(r"^[A-Z0-9_]+_IGNORE_CVES\s*\+?=")
+
+    def before(self):
+        self.pending_patch = None
+        self.package_dir = Path(self.filename).parent
+
+    def check_line(self, lineno, text):
+        m = self.PATCH_COMMENT.match(text.rstrip())
+        if m:
+            self.pending_patch = (lineno, m.group(1), text)
+            return
+
+        # other comments do not break the association between the patch
+        # comment and the following _IGNORE_CVES assignment
+        if text.lstrip().startswith("#"):
+            return
+
+        if self.IGNORE_CVES.search(text):
+            if self.pending_patch is None:
+                return
+            patch_lineno, patch_name, patch_text = self.pending_patch
+            self.pending_patch = None
+
+            if not (self.package_dir / patch_name).is_file():
+                return ["{}:{}: patch file '{}' mentioned for ignored CVEs is missing"
+                        .format(self.filename, patch_lineno, patch_name),
+                        patch_text]
+            return
+
+        self.pending_patch = None
+
+
 class OverriddenVariable(_CheckFunction):
     CONCATENATING = re.compile(r"^([A-Z0-9_]+)\s*(\+|:|)=\s*\$\(\1\)")
     END_CONDITIONAL = re.compile(r"^\s*({})".format("|".join(end_conditional)))
diff --git a/utils/checkpackagelib/test_lib_mk.py b/utils/checkpackagelib/test_lib_mk.py
index 3f97c25b2d..d9f9eb8492 100644
--- a/utils/checkpackagelib/test_lib_mk.py
+++ b/utils/checkpackagelib/test_lib_mk.py
@@ -197,6 +197,55 @@ def test_Indent(testname, filename, string, expected):
     assert warnings == expected
 
 
+MissingCVEPatch = [
+    ('patch present',
+     ['0001-some-fix.patch'],
+     '# 0001-some-fix.patch\n'
+     'FOO_IGNORE_CVES += CVE-2000-1234\n',
+     []),
+    ('patch missing',
+     [],
+     '# 0001-some-fix.patch\n'
+     'FOO_IGNORE_CVES += CVE-2000-1234\n',
+     [['{}:1: patch file \'0001-some-fix.patch\' mentioned for ignored CVEs is missing',
+       '# 0001-some-fix.patch\n']]),
+    ('patch in version subdir',
+     ['1.0/0001-some-fix.patch'],
+     '# 0001-some-fix.patch\n'
+     'FOO_IGNORE_CVES += CVE-2000-1234\n',
+     []),
+    ('comments between patch and ignore',
+     [],
+     '# 0001-some-fix.patch\n'
+     '# this entry is not stale\n'
+     'FOO_IGNORE_CVES += CVE-2000-1234\n',
+     [['{}:1: patch file \'0001-some-fix.patch\' mentioned for ignored CVEs is missing',
+       '# 0001-some-fix.patch\n']]),
+    ('comment not followed by ignore',
+     [],
+     '# 0001-some-fix.patch\n'
+     'FOO_DEPENDENCIES = host-foo\n'
+     'FOO_IGNORE_CVES += CVE-2000-1234\n',
+     []),
+    ('ignore without patch comment',
+     [],
+     'FOO_IGNORE_CVES += CVE-2000-1234\n',
+     []),
+    ]
+
+
+@pytest.mark.parametrize('testname,patches,string,expected', MissingCVEPatch)
+def test_MissingCVEPatch(testname, patches, string, expected, tmp_path):
+    filename = str(tmp_path / 'foo.mk')
+    for patch in patches:
+        patch_path = tmp_path / patch
+        patch_path.parent.mkdir(parents=True, exist_ok=True)
+        patch_path.write_text('')
+    warnings = util.check_file(m.MissingCVEPatch, filename, string)
+    expected = [[w[0].format(filename)] + w[1:] for w in expected]
+    assert warnings == expected
+
+
 OverriddenVariable = [
     ('simple assignment',
      'any.mk',
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
