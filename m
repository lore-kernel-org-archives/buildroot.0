Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20FEC76196
	for <buildroot@archiver.kernel.org>; Mon,  3 Apr 2023 14:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CF104096A;
	Mon,  3 Apr 2023 14:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CF104096A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EMpN7Pr1Drk4; Mon,  3 Apr 2023 14:46:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BA26409AE;
	Mon,  3 Apr 2023 14:46:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BA26409AE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 82FAB1BF99D
 for <buildroot@lists.busybox.net>; Mon,  3 Apr 2023 14:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67FCF81DF6
 for <buildroot@lists.busybox.net>; Mon,  3 Apr 2023 14:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67FCF81DF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CJ9pc4UV5kdW for <buildroot@lists.busybox.net>;
 Mon,  3 Apr 2023 14:46:49 +0000 (UTC)
X-Greylist: delayed 00:05:38 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A520881DF3
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A520881DF3
 for <buildroot@buildroot.org>; Mon,  3 Apr 2023 14:46:49 +0000 (UTC)
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
 by mail.xes-mad.com (Postfix) with ESMTP id 5E49C20824;
 Mon,  3 Apr 2023 09:41:11 -0500 (CDT)
From: Vincent Fazio <vfazio@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  3 Apr 2023 09:41:04 -0500
Message-Id: <20230403144105.419341-2-vfazio@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403144105.419341-1-vfazio@gmail.com>
References: <20230403144105.419341-1-vfazio@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/3] utils/checkpackagelib: check for
 Upstream trailers
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Implement a check-package check for an Upstream: trailer in patches
being applied to packages per a mailing list discussion [0].

No strict formatting checks are implemented for the contents within the
trailer as the needed level of detail will vary patch-to-patch.

Tested with: `./utils/docker-run python3 -m pytest utils/checkpackagelib`

[0] https://lists.buildroot.org/pipermail/buildroot/2023-March/666016.html

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
Changes v1 -> v2:
  - Minor updates commit message body
  - Fix unit tests
---
 utils/checkpackagelib/lib_patch.py      | 18 ++++++++++++++++++
 utils/checkpackagelib/test_lib_patch.py | 22 ++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/utils/checkpackagelib/lib_patch.py b/utils/checkpackagelib/lib_patch.py
index caee36158f..1909d3acd0 100644
--- a/utils/checkpackagelib/lib_patch.py
+++ b/utils/checkpackagelib/lib_patch.py
@@ -61,3 +61,21 @@ class Sob(_CheckFunction):
             return ["{}:0: missing Signed-off-by in the header "
                     "({}#_format_and_licensing_of_the_package_patches)"
                     .format(self.filename, self.url_to_manual)]
+
+class Upstream(_CheckFunction):
+    UPSTREAM_ENTRY = re.compile(r"^Upstream: .*$")
+
+    def before(self):
+        self.found = False
+
+    def check_line(self, lineno, text):
+        if self.found:
+            return
+        if self.UPSTREAM_ENTRY.search(text):
+            self.found = True
+
+    def after(self):
+        if not self.found:
+            return ["{}:0: missing Upstream in the header "
+                    "({}#_additional_patch_documentation)"
+                    .format(self.filename, self.url_to_manual)]
diff --git a/utils/checkpackagelib/test_lib_patch.py b/utils/checkpackagelib/test_lib_patch.py
index 3b6fadf38c..f7487ef329 100644
--- a/utils/checkpackagelib/test_lib_patch.py
+++ b/utils/checkpackagelib/test_lib_patch.py
@@ -94,3 +94,25 @@ Sob = [
 def test_Sob(testname, filename, string, expected):
     warnings = util.check_file(m.Sob, filename, string)
     assert warnings == expected
+
+
+Upstream = [
+    ('good',
+     'patch',
+     'Upstream: https://some/amazing/patch/submission\n',
+     []),
+    ('empty',
+     'patch',
+     '',
+     [['patch:0: missing Upstream in the header (url#_additional_patch_documentation)']]),
+    ('bad',
+     'patch',
+     'Subject: [PATCH 24/105] text\n',
+     [['patch:0: missing Upstream in the header (url#_additional_patch_documentation)']]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', Upstream)
+def test_Upstream(testname, filename, string, expected):
+    warnings = util.check_file(m.Upstream, filename, string)
+    assert warnings == expected
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
