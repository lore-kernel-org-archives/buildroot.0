Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E862C02181
	for <buildroot@archiver.kernel.org>; Wed, 22 Jan 2025 15:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BD2584B9E;
	Wed, 22 Jan 2025 15:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gC67LTqlS9Sn; Wed, 22 Jan 2025 15:18:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFDF184BBC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFDF184BBC;
	Wed, 22 Jan 2025 15:18:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A962959
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 15:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4F3860687
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 15:18:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XSwiENf1yC4I for <buildroot@buildroot.org>;
 Wed, 22 Jan 2025 15:18:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC201607D7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC201607D7
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 15:18:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CADA58602C; Wed, 22 Jan 2025 15:18:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Jan 2025 16:02:02 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 50cd11d4efc577ac68b554ea8c1e4a4882c80ea4
X-Git-Newrev: ade4f4b4e5e5257d7fca57863a7ef293c62bb343
X-Patchwork-Hint: ignore
Message-Id: <20250122151820.CADA58602C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/rsync: security
 bump to version 3.4.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ade4f4b4e5e5257d7fca57863a7ef293c62bb343
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Release note:
https://download.samba.org/pub/rsync/NEWS#3.4.0

Fixes the following vulnerabilities:

CVE-2024-12084: Heap Buffer Overflow in Rsync due to Improper Checksum
Length Handling

Description: A heap-based buffer overflow flaw was found in the rsync
daemon. This issue is due to improper handling of attacker-controlled
checksum lengths (s2length) in the code. When MAX_DIGEST_LEN exceeds the
fixed SUM_LENGTH (16 bytes), an attacker can write out of bounds in the
sum2 buffer.

CVE-2024-12085: Info Leak via Uninitialized Stack Contents

Description: A flaw was found in the rsync daemon which could be triggered
when rsync compares file checksums. This flaw allows an attacker to
manipulate the checksum length (s2length) to cause a comparison between a
checksum and uninitialized memory and leak one byte of uninitialized stack
data at a time.

CVE-2024-12086: Rsync Server Leaks Arbitrary Client Files

Description: A flaw was found in rsync. It could allow a server to
enumerate the contents of an arbitrary file from the client's machine. This
issue occurs when files are being copied from a client to a server. During
this process, the rsync server will send checksums of local data to the
client to compare with in order to determine what data needs to be sent to
the server. By sending specially constructed checksum values for arbitrary
files, an attacker may be able to reconstruct the data of those files
byte-by-byte based on the responses from the client.

CVE-2024-12087: Path Traversal Vulnerability in Rsync

Description: A path traversal vulnerability exists in rsync. It stems from
behavior enabled by the `--inc-recursive` option, a default-enabled option
for many client options and can be enabled by the server even if not
explicitly enabled by the client. When using the `--inc-recursive` option,
a lack of proper symlink verification coupled with deduplication checks
occurring on a per-file-list basis could allow a server to write files
outside of the client's intended destination directory. A malicious server
could write malicious files to arbitrary locations named after valid
directories/paths on the client.

CVE-2024-12088: --safe-links Option Bypass Leads to Path Traversal

Description: A flaw was found in rsync. When using the `--safe-links`
option, rsync fails to properly verify if a symbolic link destination
contains another symbolic link within it. This results in a path traversal
vulnerability, which may lead to arbitrary file write outside the desired
directory.

CVE-2024-12747: Race Condition in Rsync Handling Symbolic Links

Description: A flaw was found in rsync. This vulnerability arises from a
race condition during rsync's handling of symbolic links. Rsync's default
behavior when encountering symbolic links is to skip them. If an attacker
replaced a regular file with a symbolic link at the right time, it was
possible to bypass the default behavior and traverse symbolic links.
Depending on the privileges of the rsync process, an attacker could leak
sensitive information, potentially leading to privilege escalation.

For more details, see the advisory:
https://www.openwall.com/lists/oss-security/2025/01/14/3

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Julien: add link to release note]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 017d74c943a03c7b36ef7d71886b29b27d817c12)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsync/rsync.hash | 4 ++--
 package/rsync/rsync.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rsync/rsync.hash b/package/rsync/rsync.hash
index edeca9c4df..336d785153 100644
--- a/package/rsync/rsync.hash
+++ b/package/rsync/rsync.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://rsync.samba.org/ftp/rsync/src/rsync-3.3.0.tar.gz.asc
-sha256  7399e9a6708c32d678a72a63219e96f23be0be2336e50fd1348498d07041df90  rsync-3.3.0.tar.gz
+# https://rsync.samba.org/ftp/rsync/src/rsync-3.4.0.tar.gz.asc
+sha256  8e942f95a44226a012fe822faffa6c7fc38c34047add3a0c941e9bc8b8b93aa4  rsync-3.4.0.tar.gz
 # Locally calculated
 sha256  85c19ea50a224c2d0067a69c083584e5717b40b76610ec1218f91385775067dd  COPYING
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 188c87e1d4..4613778a7f 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYNC_VERSION = 3.3.0
+RSYNC_VERSION = 3.4.0
 RSYNC_SITE = https://rsync.samba.org/ftp/rsync/src
 RSYNC_LICENSE = GPL-3.0+ with exceptions
 RSYNC_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
