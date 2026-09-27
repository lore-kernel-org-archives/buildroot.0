Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F01C98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31421407E7;
	Sun, 27 Sep 2026 10:27:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G31b7n83di2X; Sun, 27 Sep 2026 10:27:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 33203407CD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790504824;
	b=cCtO6pMZJWwhNrn+pVhzawbgtBCLzG4Fi45t7i5pd3kthZmsDyYMov1Y2I1jANpMxN9Z
	 LzynSetljLHDMJfxlfDm6OFqFw8orZWRsIlteRFYeKI5ryeJKK3yBmJYIIuqb40WR9vl3
	 uozB8h62KEbaMmXnaSBkMQJAufS6qaFz+w7IUuuq/xIlEdJsu2InGH9sccKKSjYMKcmnf
	 98tN7pBBDdwL0JtmIR31cl7GUCq8Ygcq9xjMS9NwGSJrutFht7zWGiQrn/sosdtue/oPv
	 doymOn8w34GfogyHsua7Z/ZHWaSIRupOvbINMwpPTnwGwJ4lDCIT0tda6vabu1Io7wA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790504824;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=o4ihiP9YegH4tGaUlyBFoE4HCp8OlrXKs//svHF4nag=;
	b=e5H8aEpBvWPbN+q8PLmscu6KyxL3wUZPgcqhwN4C/m7N2r9tLlq30jotWxeWtZz5z4Wx
	 dVivutcwffcgS9bUdd4w0NlbFfmbqZopFEibF7ksHm/y6q4B83aN5iymCE5AXoQtCZK05
	 xQWLumU+YIM8lB+2YjXmCU2DQj11WWBVpPFXQpTRnXHOQQnKqqSnBmPK/iLPwTZR5Utr5
	 yWVJ0IeNH1dWuKEFC1nFZd8Rptja9NuVclwKyet0p7rOwASy4c3hfzmoAtBl/L+HRlkIM
	 DiSoofPRZIEJzLTQPE3MqvBWrhba80MZYNnd2u1kHoykzM8A4/KbnrXaTWBxXqK6AWQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790504824;
	bh=o4ihiP9YegH4tGaUlyBFoE4HCp8OlrXKs//svHF4nag=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XRSslK3CB2Jgwjs8UFBqKUyJdubLgNX4Hi56678c87AtfsHJOgL+37mhRtqjb1Vpo
	 lE8kPLMhoRzQ5hQKg8ny6geL5QZrLdn1vLZqC/3UAqJLRA1W7aVG88lIQ7IgLpNeLE
	 +Fhgojlpwdkm4MykvuVjGMb+egIInQEGYHFf4QVTzc7+RLgiTxGq+p7oFfRTclhlhY
	 ybFsh7rxhajOHjW2wY0lORBxErGxYG8zhpFUCvPfYwpzxX2xuQWnTmCvsssQ0fYyQd
	 7rqchtw70Aq36cmozUb69rRBEPL/niVapAE8ifSieN1WLuWbJ6RRHrD2AL3OzyoPOU
	 6ILLQkFZrZ9pA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33203407CD;
	Sun, 27 Sep 2026 10:27:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EC145D1
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE581407CD
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:27:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OqiceboR4-7O for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:27:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 97FF3405A4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790504820;
 b=A0RH0YayEyCZNKKGLcsYL9p1sSHh7XtiXfEKGeUOLH4fhGqpcb0fJa9xDt57wUrymEkr
 gHD1mJSsH+c3HPOSzmShoIEWOlFLQqMppCSrEQEN3MLNACJ1A/K41LOW04UVLphIFalK6
 DypGZfeI3KDCXV+37F+nUGSc4l0gFukaLVXw4vExE6RCmLHo8ScqZa/Ipi/9Ww+cQIWbq
 G+hYQwPDbP6XZ5CziITXjXKMs2JmUdxF6PKO6SIEyUOMmTJ3yaxtjD/EN0FMbscE4N3es
 0rhlS9yoaoJKvrqrumm2VdRw9wiclIxZ6MrNVilrvvNNksSSpDo4gnnSfRUbAS4Bs0w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790504820;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=7HdjWJyAxI+Z9eSL8ru7Kv/ANY4cKYzBig0HQOCpV7w=;
 b=EaihutE/5bTj/5aUkCYgiO7xnsslktgdlV2+kwm9Ei8VuBqLy6HiF7XcasMeOrAAtwTW
 I1MeDbRvmiEtsQpEpl5EMh7yKjoeAcJXLiv204XZOTD16vh+NcrN8YbF34MwKWsR7grZm
 /Gk9nkZQqxfqNZoNh17ib1za2oSGJa0PAYn8QhGFrKrFa9O68Dn3PWESPBRW3TEFj1bq7
 UJnIzORjKcr9mWyQjAGEndDZu1SWhFPucOtFsZN2mwLrOMWF3yLgHNanCjaA1d9qOdT2X
 90Xqx5RCbdmH/SWNRepykabpJ/HuoQ1RCndU2eAOwjz5aXMloWhNpNsfIxrCZ/tqvdg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97FF3405A4
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:27:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B9C4291045; Sun, 27 Sep 2026 10:25:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:09:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 236fd61a83a2a6f4c666b6e53f79c27ccdd4591a
X-Git-Newrev: 633d368bae51b20081e31d5d8925705e62f806ef
X-Patchwork-Hint: ignore
Message-Id: <20260927102548.B9C4291045@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wireshark: security bump to v4.4.19
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0543880661428644519=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0543880661428644519==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/633d368bae51b20081e31d5d8925705e62f806ef
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes the following vulnerabilities:

- wnpa-sec-2026-93 · SCTP protocol dissector crash.
  https://www.wireshark.org/security/wnpa-sec-2026-93
  CVE-2026-95389.

- wnpa-sec-2026-96 · IEEE C37.118 Synchrophasor protocol dissector
  memory leak.
  https://www.wireshark.org/security/wnpa-sec-2026-96
  CVE-2026-95395.

- wnpa-sec-2026-97 · SPDY protocol dissector crash.
  https://www.wireshark.org/security/wnpa-sec-2026-97
  CVE-2026-95387.

- wnpa-sec-2026-98 · Microsoft Network Monitor file parser large loop.
  https://www.wireshark.org/security/wnpa-sec-2026-98
  CVE-2026-95394.

- wnpa-sec-2026-99 · CSN.1 protocol dissector crash.
  https://www.wireshark.org/security/wnpa-sec-2026-99
  CVE-2026-95393.

- wnpa-sec-2026-100 · MBIM protocol dissector crash. wsbuglink:21549,
  https://www.wireshark.org/security/wnpa-sec-2026-100
  CVE-2026-95392.

- wnpa-sec-2026-101 · Sharkd utility crash.
  https://www.wireshark.org/security/wnpa-sec-2026-101
  CVE-2026-95388.

- wnpa-sec-2026-102 · Frame protocol metadissector crash.
  https://www.wireshark.org/security/wnpa-sec-2026-102
  CVE-2026-96422.

- wnpa-sec-2026-103 · USB HID protocol dissector infinite loop and
  memory leak.
  https://www.wireshark.org/security/wnpa-sec-2026-103
  CVE-2026-96421.

- wnpa-sec-2026-104 · RF4CE protocol dissector crash.
  https://www.wireshark.org/security/wnpa-sec-2026-104
  CVE-2026-96417.

- wnpa-sec-2026-105 · Toshiba file parser crash.
  https://www.wireshark.org/security/wnpa-sec-2026-105
  CVE-2026-xxx.

- wnpa-sec-2026-106 · Profile import crash and possible code execution.
  https://www.wireshark.org/security/wnpa-sec-2026-106
  CVE-2026-96419.

- wnpa-sec-2026-107 · TIFF protocol dissector infinite loop.
  https://www.wireshark.org/security/wnpa-sec-2026-107
  CVE-2026-96418.

- wnpa-sec-2026-108 · X11 protocol dissector crash.
  https://www.wireshark.org/security/wnpa-sec-2026-108
  CVE-2026-96423.

- wnpa-sec-2026-109 · IEEE 802.11 protocol dissector crash.
  https://www.wireshark.org/security/wnpa-sec-2026-109
  CVE-2026-96416.

- wnpa-sec-2026-110 · Catapult DCT2000 protocol dissector crash.
  https://www.wireshark.org/security/wnpa-sec-2026-110
  CVE-2026-96415.

For more information on the version bump, see:
  - https://www.wireshark.org/docs/relnotes/wireshark-4.4.19.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 3d8fdb6131..b17f4bcf17 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.18.txt
-sha1  482fecbe21a876f53a26bf5beaa5b0ee0ad16e50  wireshark-4.4.18.tar.xz
-sha256  f77a7939983758383797fed0a34a491f785e541cca397a7a44e9cdd7c6f847c6  wireshark-4.4.18.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.19.txt
+sha1  46c2805407197048d90dc7eac9f0a4a19d13815a  wireshark-4.4.19.tar.xz
+sha256  0499dddc0aeea500bc65196714e1e01097742efbc479a2d67a9a8b5dd57d6d04  wireshark-4.4.19.tar.xz
 
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index c500a49336..a67b915b5b 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.4.18
+WIRESHARK_VERSION = 4.4.19
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license

--===============0543880661428644519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0543880661428644519==--
