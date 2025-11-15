Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7FECEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 20:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5480841582;
	Mon, 17 Nov 2025 20:08:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vtZteIxpwMSr; Mon, 17 Nov 2025 20:08:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0877B41560
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0877B41560;
	Mon, 17 Nov 2025 20:08:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5866E1BA
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 635DB83DFC
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AMtSzmc0Yiox for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 20:07:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83D4E83DE0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83D4E83DE0
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8186081E81; Mon, 17 Nov 2025 20:07:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Nov 2025 17:38:03 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 33c6d0ff40e39c5b0b41e17fa685c6e26b0a1e71
X-Git-Newrev: f44bc9776ea46c959a82d8161a1504cd18470955
X-Patchwork-Hint: ignore
Message-Id: <20251117200753.8186081E81@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] support/scripts/cve.py:
 fix CPE matching
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f44bc9776ea46c959a82d8161a1504cd18470955
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Given the following criteria: `cpe:2.3:a:oneidentitty:syslog-ng:*:*:*:*:-:*:*:*`.
The former `cpe_matches` implementation would match with the following
CPE: `cpe:2.3:a:oneidentitty:syslog-ng:4.71:*:*:*:premium:*:*:*`.

The 'hyphen' ('-') meaning is "Not Attributed" (NA) a criteria with no
attributed software edition shouldn't match with a CPE with an attributed
software edition:

https://csrc.nist.gov/pubs/ir/7695/final

This patch also create a distinct 'CPE' object that aggregate the
function specifics to CPEs like it's done for 'CVE'.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 35f376d88e302cdf6acb0c11a70011760135a7fd)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/scripts/cve.py    | 130 ++++++++++++++++++++++++++++++++++++----------
 support/scripts/pkg-stats |   2 +-
 2 files changed, 104 insertions(+), 28 deletions(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 5ff67585e2..25481a6367 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -39,22 +39,98 @@ ops = {
 }
 
 
-# Check if two CPE IDs match each other
-def cpe_matches(cpe1, cpe2):
-    cpe1_elems = cpe1.split(":")
-    cpe2_elems = cpe2.split(":")
+class CPE:
+    DISJOINT = 0
+    SUBSET = 1
+    SUPERSET = 2
+    EQUAL = 3
 
-    remains = filter(lambda x: x[0] not in ["*", "-"] and x[1] not in ["*", "-"] and x[0] != x[1],
-                     zip(cpe1_elems, cpe2_elems))
-    return len(list(remains)) == 0
+    ANY = '*'
+    NA = '-'
 
+    @staticmethod
+    def compareAttribute(left, right):
+        """
+        This static method compare two single attributes part of two CPE.
+
+        This is an implementation of table 6-2 of [1].
+
+        Attribute that are empty will be matched to the '*' (ANY) attribute.
+        According to [2] section 6.1.2.1.1 the empty attribute is inherited
+        from CPE22 and now bind to ANY.
 
-def cpe_product(cpe):
-    return cpe.split(':')[4]
+        The hyphen '-' bind to the NA attribute (see [2]).
 
+        [1] https://nvlpubs.nist.gov/nistpubs/Legacy/IR/nistir7696.pdf
+        [2] https://nvlpubs.nist.gov/nistpubs/Legacy/IR/nistir7695.pdf
+        """
+        if left == '':
+            left = CPE.ANY
+
+        if right == '':
+            right = CPE.ANY
+
+        if left == right:
+            # 1 6 9 - equals
+            return CPE.EQUAL
+        elif left == CPE.ANY:
+            # 2 3 4 - superset
+            return CPE.SUPERSET
+        elif left == CPE.NA and right == CPE.ANY:
+            # 5 - subset
+            return CPE.SUBSET
+        elif left == CPE.NA:
+            # 12 16 - disjoint
+            return CPE.DISJOINT
+        elif right == CPE.ANY:
+            # 13 15 - subset
+            return CPE.SUBSET
+        return CPE.DISJOINT
+
+    def matches(self, target) -> bool:
+        """
+        As an example let's take the example of CVE-2023-... for syslog-ng.
+        One of the node as the following CPE criteria matched with the Buildroot CPE:
+
+        cpe:2.3:a:oneidentitty:syslog-ng:*:*:*:*:-:*:*:*
+        cpe:2.3:a:oneidentitty:syslog-ng:4.71:*:*:*:*:*:*:*
+
+        vendor: EQUAL (3)
+        product: EQUAL (3)
+        version: SUPERSET (2)
+        update: EQUAL (3)
+        edition: EQUAL (3)
+        language: EQUAL (3)
+        sw_edition: SUBSET (1)
+        ...
+
+        This operation results in the two CPE matching.
+        """
+        if not isinstance(target, CPE):
+            target = CPE(target)
 
-def cpe_version(cpe):
-    return cpe.split(':')[5]
+        for selfAttribute, targetAttribute in zip(self.parts, target.parts):
+            if CPE.compareAttribute(selfAttribute, targetAttribute) == CPE.DISJOINT:
+                return False
+
+        return True
+
+    def __str__(self):
+        return self.cpe
+
+    def __init__(self, cpe):
+        self.cpe = cpe
+        self.parts = cpe.split(':')
+        self.vendor = self.parts[3]
+        self.product = self.parts[4]
+        self.version = self.parts[5]
+        self.update = self.parts[6]
+        self.edition = self.parts[7]
+        self.language = self.parts[8]
+        self.sw_edition = self.parts[9]
+        self.target_sw = self.parts[10]
+        self.target_hw = self.parts[11]
+        self.other = self.parts[12]
 
 
 class CVE:
@@ -127,8 +203,9 @@ class CVE:
         for cpe in node.get('cpeMatch', ()):
             if not cpe['vulnerable']:
                 return
-            product = cpe_product(cpe['criteria'])
-            version = cpe_version(cpe['criteria'])
+            cpeId = CPE(cpe['criteria'])
+            product = cpeId.product
+            version = cpeId.version
             # ignore when product is '-', which means N/A
             if product == '-':
                 return
@@ -160,7 +237,7 @@ class CVE:
                     v_end = cpe['versionEndExcluding']
 
             yield {
-                'id': cpe['criteria'],
+                'id': cpeId,
                 'v_start': v_start,
                 'op_start': op_start,
                 'v_end': v_end,
@@ -181,30 +258,29 @@ class CVE:
     @property
     def affected_products(self):
         """The set of CPE products referred by this CVE definition"""
-        return set(cpe_product(p['id']) for p in self.each_cpe())
+        return set(p['id'].product for p in self.each_cpe())
 
     def affects(self, name, version, cpeid=None):
         """
         True if the Buildroot Package object passed as argument is affected
         by this CVE.
         """
-
-        pkg_version = distutils.version.LooseVersion(version)
+        if cpeid is None:
+            # if we don't have a cpeid, build one based on name and version
+            cpeid = CPE("cpe:2.3:*:*:%s:%s:*:*:*:*:*:*:*" % (name, version))
+        elif not isinstance(cpeid, CPE):
+            cpeid = CPE(cpeid)
+
+        # Always prefer the package version of the CPE ID.
+        pkg_version = distutils.version.LooseVersion(cpeid.version)
         if not hasattr(pkg_version, "version"):
             print("Cannot parse package '%s' version '%s'" % (name, version), file=sys.stderr)
             pkg_version = None
 
-        # if we don't have a cpeid, build one based on name and version
-        if not cpeid:
-            cpeid = "cpe:2.3:*:*:%s:%s:*:*:*:*:*:*:*" % (name, version)
-        # if we have a cpeid, use its version instead of the package
-        # version, as they might be different due to
-        # <pkg>_CPE_ID_VERSION
-        else:
-            pkg_version = distutils.version.LooseVersion(cpe_version(cpeid))
-
         for cpe in self.each_cpe():
-            if not cpe_matches(cpe['id'], cpeid):
+            if not cpe['id'].matches(cpeid):
+                # If the node CPE id is not a subset of the target package we
+                # don't check for affect
                 continue
             if not cpe['v_start'] and not cpe['v_end']:
                 return self.CVE_AFFECTS
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 8710dda795..ec46d373d5 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -670,7 +670,7 @@ def check_package_cves(nvd_path, packages):
             pkg.status['cve'] = ("na", "no version information available")
             continue
         if pkg.cpeid:
-            cpe_product = cvecheck.cpe_product(pkg.cpeid)
+            cpe_product = cvecheck.CPE(pkg.cpeid).product
             cpe_product_pkgs[cpe_product].append(pkg)
         else:
             cpe_product_pkgs[pkg.name].append(pkg)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
