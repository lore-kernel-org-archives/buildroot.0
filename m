Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8948EC7115C
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 13:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AC8160B4B;
	Thu, 19 Jun 2025 13:48:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pG_W_lWMjm2Z; Thu, 19 Jun 2025 13:48:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44E3C60B5C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44E3C60B5C;
	Thu, 19 Jun 2025 13:48:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B1734E2
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 13:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C697605F0
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 13:48:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QhJb4PR-EZWT for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 13:48:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30C3260B4B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30C3260B4B
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 13:48:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2261483F7F; Thu, 19 Jun 2025 13:48:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Jun 2025 14:40:32 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 06c5664b1833248c76181f0f1489d309c0ce2465
X-Git-Newrev: a9fd428c61818af415eae87e4d0d6ef908a08f25
X-Patchwork-Hint: ignore
Message-Id: <20250619134846.2261483F7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/jq: security
 patch for CVE-2025-48060
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

commit: https://git.buildroot.net/buildroot/commit/?id=a9fd428c61818af415eae87e4d0d6ef908a08f25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Security patch have been fetched from the Nixpkgs [1].

Fixes the following CVE:
- CVE-2025-48060: jq is a command-line JSON processor. In versions up to
 and including 1.7.1, a heap-buffer-overflow is present in function
  in the jq_fuzz_execute harness from oss-fuzz. This
 crash happens on file jv.c, line 1456 . As of
 time of publication, no patched versions are available.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-48060

[1] https://github.com/LordGrimmauld/nixpkgs/blob/df21c79bfbb4d5ea50a49231bb8f91ab7afa051d/pkgs/by-name/jq/jq/0005-Fix-heap-buffer-overflow-when-formatting-an-empty-st.patch

Signed-off-by: Yuce Kurum <yuce.kurum@mind.be>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/jq/0003-CVE-2025-48060.patch | 49 ++++++++++++++++++++++++++++++++++++
 package/jq/jq.mk                     |  3 +++
 2 files changed, 52 insertions(+)

diff --git a/package/jq/0003-CVE-2025-48060.patch b/package/jq/0003-CVE-2025-48060.patch
new file mode 100644
index 0000000000..c13f13d063
--- /dev/null
+++ b/package/jq/0003-CVE-2025-48060.patch
@@ -0,0 +1,49 @@
+From d73a79035e1d24011a3363d52bf36b4eaea67aa6 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Sat, 31 May 2025 11:46:40 +0900
+Subject: [PATCH] Fix heap buffer overflow when formatting an empty string
+
+The `jv_string_empty` did not properly null-terminate the string data,
+which could lead to a heap buffer overflow. The test case of
+GHSA-p7rr-28xf-3m5w (`0[""*0]`) was fixed by the commit dc849e9bb74a,
+but another case (`0[[]|implode]`) was still vulnerable. This commit
+ensures string data is properly null-terminated, and fixes CVE-2025-48060.
+
+CVE: CVE-2025-48060
+Upstream: https://github.com/LordGrimmauld/nixpkgs/blob/df21c79bfbb4d5ea50a49231bb8f91ab7afa051d/pkgs/by-name/jq/jq/0005-Fix-heap-buffer-overflow-when-formatting-an-empty-st.patch
+Signed-off-by: Yuce Kurum <yuce.kurum@mind.be>
+---
+ src/jv.c      | 1 +
+ tests/jq.test | 4 ++++
+ 2 files changed, 5 insertions(+)
+
+diff --git a/src/jv.c b/src/jv.c
+index 6e8cdd3..3303286 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -1121,6 +1121,7 @@ static jv jvp_string_empty_new(uint32_t length) {
+   jvp_string* s = jvp_string_alloc(length);
+   s->length_hashed = 0;
+   memset(s->data, 0, length);
++  s->data[length] = 0;
+   jv r = {JVP_FLAGS_STRING, 0, 0, 0, {&s->refcnt}};
+   return r;
+ }
+diff --git a/tests/jq.test b/tests/jq.test
+index 10b20e3..680706b 100644
+--- a/tests/jq.test
++++ b/tests/jq.test
+@@ -2042,6 +2042,10 @@ map(try implode catch .)
+ [123,["a"],[nan]]
+ ["implode input must be an array","string (\"a\") can't be imploded, unicode codepoint needs to be numeric","number (null) can't be imploded, unicode codepoint needs to be numeric"]
+ 
++try 0[implode] catch .
++[]
++"Cannot index number with string \"\""
++
+ # walk
+ walk(.)
+ {"x":0}
+-- 
+2.49.0
+
diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index dbd69f0b16..e21e4376ea 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -17,6 +17,9 @@ JQ_IGNORE_CVES += CVE-2024-23337
 # 0002-CVE-2024-53427.patch
 JQ_IGNORE_CVES += CVE-2024-53427
 
+# 0003-CVE-2025-48060.patch
+JQ_IGNORE_CVES += CVE-2025-48060
+
 # uses c99 specific features
 JQ_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
 HOST_JQ_CONF_ENV += CFLAGS="$(HOST_CFLAGS) -std=c99"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
