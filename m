Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B094CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01226608DC;
	Fri, 16 Oct 2026 13:08:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k3X2ZbKhzhSV; Fri, 16 Oct 2026 13:08:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0E9D56064B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156124;
	b=a8o7A2f5sVbOngrkXHRVQhhF7g05GAInDERlcEl0t3c/tnMtsHH9OrqbtBUZ2PZcXDkn
	 TT0FwoqjhBG3U8szkY8OA7YGyEVW63hKiZgB9ZL6DEmzY7zsvBFZ+K8NLYR9SgK6PYGEj
	 /axdpP1GndyGdA4THpn37Db/w704OYeJqhqDGfa5C0Gstg/5rdicQ2WWWxhCEu9GWr0YP
	 w7z0nS0jLjoGa9NQRbjRlSm5Vvw/XEWpQc8wBR556O+HhUttvTndwQy32tm1cKaD1junF
	 O5nVzEgXBmP2Ck1YAPkmy99iTEDd7czZr5pz6jTSnBGV5dw2UXJ5P8tRhhwCph1tV3w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156124;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=IDNT5rlGUTrkA/E+LZw9UGZcWn28izmMmskDwDmC6dU=;
	b=ZK+w5iwivqysksV3QhJCw8hP/FTP8E4BBr7GjQ6sVDdLSleDfC/Ply7bxQCVAKbawutR
	 H5yC/BqJKcjOSSG2FGz2HI8gHl2Trj237eJxwiDu9ewhUJ06C0zPsF8Twlsq3zEfBYFjN
	 z0ur1nteOpGG4EZ77/+aGEkIAbfsp+vyIDKYGUxTJC+zo6WyafzEz44wn7dLWY9Ow5Qrn
	 mYEou3H8fzDbydR/MiCscc8R81sNdpjSx1Q4QRl6kgDn6HOgufhD5+lZ/ske9atly4KnA
	 tRxKchzUzpTRvihd/HDMbg9wLg/WddkSH66ZfZlQkThiypkOGkiazZB37dMA1cJZvzw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156124;
	bh=IDNT5rlGUTrkA/E+LZw9UGZcWn28izmMmskDwDmC6dU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WuWbVFldoG4+pYpbHiRQTKEsI9tGsfZ6yqQ1X/RoI4XLZteinrFSXmre/hYf46Q6r
	 tN3fo+sa7Sx69pb8yLTrUTlo3yZG32o4F5SziqBG+zlNHOgjszbXN5SDKKj67P+8DX
	 ShjCOqyY4jW2RsibdVYwNzItRcFwAxBfME/4DAyJaPRp1M8JWYXdkTw/7EhYyZK7H4
	 p51c92wkbAfS/Rr8qpSOPdmKwDIn4xnoXbGrD5pVLgzyGHuJoXb00JzUeB4zd7B7le
	 wzphtxWz1kvGRNMlxzy8OTYv7k05lJVYftw24TVCqwyQbPzr57pXdfltihZMAmzsQe
	 ubbjDB8/BsE1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E9D56064B;
	Fri, 16 Oct 2026 13:08:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E2A2151A
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00757814EE
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y2-afXvTcpAp for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E1E11814AB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156106;
 b=DT+fvHgCAdn2nZ+fQ/vQjrDFeAhoEi6fUSL0+V9gYXoFCk1x9Cyhv/GioELCVLBY7xF3
 S+9HM7UmrOYkZF1MtMUDt7HVaE4wh4c0iMJOLUkDWvIDSqx6FSK4SSzdjp/Clr30BXL1W
 S300cPcu+OpXkHlH8S7+TjHxg8btZ2SUMe8voQYrQs+lNPBGfqs6YPmXWa+zYIOtbVSgh
 HLIrVDHFgdGpcO92xCD1LTGydF2MYicd/xbyW0AyaQeYYJbGDnyOwcglYz68FDujX4ovK
 v2LaI/vM8fNzAZMF/wy0qlnOKMr5b/qwpxiv6ZK4SSSrIUloDZ2nk2gQ1rXsWxrBp8g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156106;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LxAvuJqtjhxPb1l2fUK3WWkg1z95zF1c3xJ0loT2nIw=;
 b=nIuAK8Xkmx61VFl4xm5LvQc9fpt3NRjTMoAF9+6mBqJbp3qsGzs/6zq0N7RIgOn+sSi9
 2gt+1bIQ20TEfbJk4eZRI1dv+WnPHyuFg0/EbKeZc46LbaHS/I1U7p0eVVWxB+YqaPTji
 3MM4uD/8QXzGYBzKSCEY3cu5Gm5qlkUwoQXW4hBCsiZy3PLRVLAJpB8WOgjfYi+HRSf6+
 bw40papDkgk6ebOk5Wb3lrri9bMcEau+JZIHb8TKw0kclYT6afKrj4YddeztBgpwsIf6O
 G/toa1BBcQ6PPCTw1Ul7WINc+2qz5Xx5ofTd5JwTK7OVGZK4l+slMptqeTbRab2GaTQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1E11814AB
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D2E00960D8; Fri, 16 Oct 2026 13:07:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0c731cc26cd5f50d10504fe91c6440960325a686
X-Git-Newrev: 5f3438b20e6fd369781beccb78e4346890ae2503
X-Patchwork-Hint: ignore
Message-Id: <20261016130705.D2E00960D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/wolfssl: security
 bump to v5.9.4
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
Content-Type: multipart/mixed; boundary="===============1149046136872089925=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1149046136872089925==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5f3438b20e6fd369781beccb78e4346890ae2503
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

See the release note:

- https://github.com/wolfSSL/wolfssl/releases/tag/v5.9.4-stable

This fixes the following vulnerabilities:

- CVE-2026-15442: https://www.cve.org/CVERecord?id=CVE-2026-15442
- CVE-2026-89102: https://www.cve.org/CVERecord?id=CVE-2026-89102
- CVE-2026-89133: https://www.cve.org/CVERecord?id=CVE-2026-89133
- CVE-2026-89134: https://www.cve.org/CVERecord?id=CVE-2026-89134
- CVE-2026-89135: https://www.cve.org/CVERecord?id=CVE-2026-89135
- CVE-2026-89136: https://www.cve.org/CVERecord?id=CVE-2026-89136
- CVE-2026-93302: https://www.cve.org/CVERecord?id=CVE-2026-93302
- CVE-2026-93304: https://www.cve.org/CVERecord?id=CVE-2026-93304
- CVE-2026-94417: https://www.cve.org/CVERecord?id=CVE-2026-94417
- CVE-2026-94418: https://www.cve.org/CVERecord?id=CVE-2026-94418
- CVE-2026-94419: https://www.cve.org/CVERecord?id=CVE-2026-94419

This commit also updates the LICENSING hash, after an exception
was added in upstream commit:
https://github.com/wolfSSL/wolfssl/commit/94c657013d63124c7d8bf79b29997f614e21673d

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Julien: fix LICENSING hash]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7de1ed77454587fd17077bb724629a0106b06888)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/wolfssl/wolfssl.hash | 4 ++--
 package/wolfssl/wolfssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index c259734875..7098c9637c 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,6 +1,6 @@
 # Locally computed:
-sha256  2f4ef3d4fd387a9b3191d36a6316d69116c46ff69bb9583b6c82b36d7b8ca114  wolfssl-5.9.2.tar.gz
+sha256  7256bfc89b183a75183806c7debfa203443873b0b4a562e1b80d68e01b45ac57  wolfssl-5.9.4.tar.gz
 
 # Hash for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
-sha256  84f8096dc7f70cdb6075ccf3722a44654361063eaf3e1ce7885c9875b8465a63  LICENSING
+sha256  d4952a47f020a56e6ee267e0937b5ba0580b148bc5355216dffaf33d5671b960  LICENSING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index 779fd2cabf..20244c4e83 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 5.9.2
+WOLFSSL_VERSION = 5.9.4
 WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION)-stable)
 WOLFSSL_INSTALL_STAGING = YES
 

--===============1149046136872089925==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1149046136872089925==--
