Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E03AC02197
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 13:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F19041168;
	Sat, 14 Sep 2024 13:23:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jgBfWDggt_Tp; Sat, 14 Sep 2024 13:23:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A12D440639
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A12D440639;
	Sat, 14 Sep 2024 13:23:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C60EA1BF3F9
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B18A9406E2
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uTBLpFlqGqfr for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 13:23:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67D73406ED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67D73406ED
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 13:23:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 53D1E82B58; Sat, 14 Sep 2024 13:23:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 15:12:01 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 0436dd22fc4ca1c6083d2dbc5eb2bbfbf32c68a5
X-Git-Newrev: 4009842cba631b1061bcdea799e0802c40ea549c
X-Patchwork-Hint: ignore
Message-Id: <20240914132311.53D1E82B58@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/qt6/qt6base:
 backport fix for CVE-2023-51714
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

commit: https://git.buildroot.net/buildroot/commit/?id=4009842cba631b1061bcdea799e0802c40ea549c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

This commit backports upstream patches that are needed to fix
CVE-2023-51714. The second one is the actual CVE fix, the first one is
needed to only backporting the second patch in a reasonable way.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../qt6base/0010-HPack-fix-a-Yoda-Condition.patch  | 43 +++++++++++++++++++
 ...Pack-fix-incorrect-integer-overflow-check.patch | 48 ++++++++++++++++++++++
 package/qt6/qt6base/qt6base.mk                     |  2 +
 3 files changed, 93 insertions(+)

diff --git a/package/qt6/qt6base/0010-HPack-fix-a-Yoda-Condition.patch b/package/qt6/qt6base/0010-HPack-fix-a-Yoda-Condition.patch
new file mode 100644
index 0000000000..ca9c740df0
--- /dev/null
+++ b/package/qt6/qt6base/0010-HPack-fix-a-Yoda-Condition.patch
@@ -0,0 +1,43 @@
+From fc5e607b78dc6dc2a17e3586d2085e9d25412785 Mon Sep 17 00:00:00 2001
+From: Marc Mutz <marc.mutz@qt.io>
+Date: Tue, 12 Dec 2023 20:51:56 +0100
+Subject: [PATCH] HPack: fix a Yoda Condition
+
+Putting the variable on the LHS of a relational operation makes the
+expression easier to read. In this case, we find that the whole
+expression is nonsensical as an overflow protection, because if
+name.size() + value.size() overflows, the result will exactly _not_
+be > max() - 32, because UB will have happened.
+
+To be fixed in a follow-up commit.
+
+As a drive-by, add parentheses around the RHS.
+
+Pick-to: 6.7 6.6 6.5 6.2 5.15
+Change-Id: I35ce598884c37c51b74756b3bd2734b9aad63c09
+Reviewed-by: Allan Sandfeld Jensen <allan.jensen@qt.io>
+
+Upstream: https://github.com/qt/qtbase/commit/658607a34ead214fbacbc2cca44915655c318ea9
+[Thomas: needed to backport fix for
+https://security-tracker.debian.org/tracker/CVE-2023-51714]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/network/access/http2/hpacktable.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/network/access/http2/hpacktable.cpp b/src/network/access/http2/hpacktable.cpp
+index 0b69ee86a9b..34da5594e2b 100644
+--- a/src/network/access/http2/hpacktable.cpp
++++ b/src/network/access/http2/hpacktable.cpp
+@@ -27,7 +27,7 @@ HeaderSize entry_size(QByteArrayView name, QByteArrayView value)
+     // 32 octets of overhead."
+ 
+     const unsigned sum = unsigned(name.size() + value.size());
+-    if (std::numeric_limits<unsigned>::max() - 32 < sum)
++    if (sum > (std::numeric_limits<unsigned>::max() - 32))
+         return HeaderSize();
+     return HeaderSize(true, quint32(sum + 32));
+ }
+-- 
+2.46.0
+
diff --git a/package/qt6/qt6base/0011-HPack-fix-incorrect-integer-overflow-check.patch b/package/qt6/qt6base/0011-HPack-fix-incorrect-integer-overflow-check.patch
new file mode 100644
index 0000000000..a7b7c20b64
--- /dev/null
+++ b/package/qt6/qt6base/0011-HPack-fix-incorrect-integer-overflow-check.patch
@@ -0,0 +1,48 @@
+From 01348087ee851f1781a27e7ce8a1ed0bda5441fe Mon Sep 17 00:00:00 2001
+From: Marc Mutz <marc.mutz@qt.io>
+Date: Tue, 12 Dec 2023 22:08:07 +0100
+Subject: [PATCH] HPack: fix incorrect integer overflow check
+
+This code never worked:
+
+For the comparison with max() - 32 to trigger, on 32-bit platforms (or
+Qt 5) signed interger overflow would have had to happen in the
+addition of the two sizes. The compiler can therefore remove the
+overflow check as dead code.
+
+On Qt 6 and 64-bit platforms, the signed integer addition would be
+very unlikely to overflow, but the following truncation to uint32
+would yield the correct result only in a narrow 32-value window just
+below UINT_MAX, if even that.
+
+Fix by using the proper tool, qAddOverflow.
+
+Pick-to: 6.7 6.6 6.5 6.2 5.15
+Change-Id: I7599f2e75ff7f488077b0c60b81022591005661c
+Reviewed-by: Allan Sandfeld Jensen <allan.jensen@qt.io>
+
+Fixes: https://security-tracker.debian.org/tracker/CVE-2023-51714
+Upstream: https://github.com/qt/qtbase/commit/ee5da1f2eaf8932aeca02ffea6e4c618585e29e3
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/network/access/http2/hpacktable.cpp | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/network/access/http2/hpacktable.cpp b/src/network/access/http2/hpacktable.cpp
+index 34da5594e2b..f20ec92d4c5 100644
+--- a/src/network/access/http2/hpacktable.cpp
++++ b/src/network/access/http2/hpacktable.cpp
+@@ -26,7 +26,9 @@ HeaderSize entry_size(QByteArrayView name, QByteArrayView value)
+     // for counting the number of references to the name and value would have
+     // 32 octets of overhead."
+ 
+-    const unsigned sum = unsigned(name.size() + value.size());
++    size_t sum;
++    if (qAddOverflow(size_t(name.size()), size_t(value.size()), &sum))
++        return HeaderSize();
+     if (sum > (std::numeric_limits<unsigned>::max() - 32))
+         return HeaderSize();
+     return HeaderSize(true, quint32(sum + 32));
+-- 
+2.46.0
+
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 9d21aefbfb..0bb9a197ec 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -17,6 +17,8 @@ QT6BASE_IGNORE_CVES += CVE-2023-32762
 QT6BASE_IGNORE_CVES += CVE-2023-32763
 # 0009-QXmlStreamReader-Raise-error-on-unexpected-tokens.patch
 QT6BASE_IGNORE_CVES += CVE-2023-38197
+# 0011-HPack-fix-incorrect-integer-overflow-check.patch
+QT6BASE_IGNORE_CVES += CVE-2023-38197
 
 QT6BASE_CMAKE_BACKEND = ninja
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
