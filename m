Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6FEC77B70
	for <buildroot@archiver.kernel.org>; Sat, 15 Apr 2023 17:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7AAA84471;
	Sat, 15 Apr 2023 17:53:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7AAA84471
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n2bsTr9IqrLz; Sat, 15 Apr 2023 17:53:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D47C83C65;
	Sat, 15 Apr 2023 17:53:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D47C83C65
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D2601C3E65
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 17:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4126B83C65
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 17:53:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4126B83C65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G5mshqz2e6_k for <buildroot@lists.busybox.net>;
 Sat, 15 Apr 2023 17:53:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8772B83C47
 for <buildroot@buildroot.org>; Sat, 15 Apr 2023 17:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8772B83C47
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F2CE841D1; Sat, 15 Apr 2023 17:53:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Apr 2023 19:36:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b00b40a05437e1042b25c097b977d5a26bdee1d
X-Git-Newrev: 32934b526b647fc30bb0041b7b9f18bd765f7567
X-Patchwork-Hint: ignore
Message-Id: <20230415175310.6F2CE841D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/checkpackagelib: check for Upstream
 trailers
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=32934b526b647fc30bb0041b7b9f18bd765f7567
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Implement a check-package check for an Upstream: trailer in patches
being applied to packages per a mailing list discussion [0].

No strict formatting checks are implemented for the contents within the
trailer as the needed level of detail will vary patch-to-patch.

Tested with: `./utils/docker-run python3 -m pytest utils/checkpackagelib`

[0] https://lists.buildroot.org/pipermail/buildroot/2023-March/666016.html

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
