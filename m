Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEA4CA5FCB
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25C6960BEB;
	Thu,  1 Oct 2026 14:22:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QqW0gL4O4kLB; Thu,  1 Oct 2026 14:22:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 006FE60B26
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864566;
	b=UVmMoLH6b/+fgH0Oey9AEtHK8Ftm8KaSy+qfKbSFroAmuQu7aBF4GXshclD8hQkI6X3K
	 VFYhiZH8QO83RcuPCJ3mg1lBVyiITUJECgbuF5J4tGKnBW6lHqYIVkay34h0AVh1UH1wh
	 ETrw0XGj6EGK7DMlv54EUOpZNID7ffxzISdmFt0gnUgTobhbgF8YUdg58wT6TRGzznNew
	 oMwKCtiAwGKs0XUXVlsUhpn3xhkP7h8ebhzDIXRiZXzvRplj0Jq7NDMbrUYeDA9OQz9Ef
	 B+hd4SYBJpeRqDa0Sap47oWHXyZWJeggY0buOtFG1QwoHuCch7BKLQtKhC9EjVWweyA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864566;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=JTjIAGx/Sxvkvfw4t9rVqQ1LLJNTv/o44ca2MiNnnHI=;
	b=UXUsXrnfFrHphBqsUfer+bKsMhoQUEPM2hVCjNsw9nFCMJ9s+Yd8aINgHCaUU8xYpeAf
	 Ut33+IWhnlK+Ri0WGhIrUO8qAfovCuFO/JBRSwpzTnJPJytcrJjMb7R38NWJ577QwCovn
	 2f3pujei797mWA0klTipRGCU/vGuloNVp/+gzSXypJ4zUWgwOiZgORBRlTWYla8fv3j+F
	 u1O5jY9H4q33OZaKbNLE+WLAZwPvR1C+tkIELhbbXBl/4Ejcx89ADZ+V5FvHv+rU3tq5f
	 5vC/CbFIZS83w7dKxCCG84TmE8EUvS65s/k0vcbAoScBtngeQWftUTxvRteoYEU61Bg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864566;
	bh=JTjIAGx/Sxvkvfw4t9rVqQ1LLJNTv/o44ca2MiNnnHI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VEo7MyJrpYq5w60s71FeR+hPlRwfW4/Zfx3Epn0i0VpOemHKrKJBRoYcG+z9DXiIK
	 tCXS9ese//HRz3LEJZqx5NDahJLlERJe7cj2melzv5EvSkYTdFDUI6xDYHBt3ovgGI
	 MzPmVQGMwdF6x1/su2lYXetgEdmUtAvr5zBfLwutidh0s5yTWexHb93KagWg7M9epQ
	 VCVo4I5nrANtQlB8lL37VtQ88c+ikXKiWoQYuPSzBSEc+YWfQQxRRXTypBltNv0B1j
	 CUPSf2QWm88QrvL6UaPUEkw56EWBs2T3gRuqruPdUwry71ANXZuTHwdacM8uMq2SK6
	 YzFek+Lh9gNcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 006FE60B26;
	Thu,  1 Oct 2026 14:22:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FF30D22
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91AC340528
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cju4tVnwx3MJ for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D15154052A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864560;
 b=fyfEgniukNknQsWXvowAiCbR0MzQWRQuTZkdfp1CFPnBU43vEN1vhyMJqJUsp0sRfUOu
 UVCzKuhcp5jxu6FSwdOqIeREIoj9sS1GabeNmET52N7dpG6wCEZrsFgqSixZaz54axoia
 rZOssqhsk7W1AmvzlTb2JaJwqk+G+gUAXCc8jYl1/UHHXjnoWwcleZlydnC8rjZlMwepQ
 fXOyPtOgExKalz3US3RJ9hOnFMmsAJ6xHYbFiKw0y5n5uXYNDRO3UTagpDdf7bZ++qDlO
 ruYlghBxKMfn7nlxv00eWS6sdErIq7XKPldsktf/lw6Jxkp1yoQoa/0eo7toiygxPug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864560;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=3nYsRI23jPC+OLNWS7xPegQC1iRrYnuogFK59Ues1j8=;
 b=tH9FLh7I6v3/TA9jgQVTNrturCvdrVN5Y7ryXzRiVoFXg39txYqiR5h4l9CiXhCdvIB1
 lSJUZOMRMVVteYOVAa4IEsEsqGrJtsjzlXuPSOrvOuFnN/JDqXjdlu6wneCGCyDTNiXmP
 WpJ6er5wdnpCUayl12QCXaJJd+2Y2jBvY+deu9vKJYDqlVJswOiu3fD/OjZDN6Bq0a15Z
 Inlib1VBkyTArnyp2Zuy1DhY6/SzYuI0uSaqV4+mwXLSZ3g1lE/nhiTpgW+iOkV4XrgKG
 0gKEiYKVffhFipMa9cEbQoxXO0f7jcFbNrHRTzeYRnk5ZMwvy7Ce2e5lDJHXxFJ7N0g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D15154052A
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 254229843E; Thu,  1 Oct 2026 14:21:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 16:28:50 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: aa6bb24b7214a630199babbae4c000736bc75651
X-Git-Newrev: d6abe0e90650b92e9d22a3d21986f697f3b29f2a
X-Patchwork-Hint: ignore
Message-Id: <20261001142127.254229843E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/wireshark:
 security bump to v4.4.13
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7066878700239759997=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7066878700239759997==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d6abe0e90650b92e9d22a3d21986f697f3b29f2a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For more information on the version bump, see:
  - https://www.wireshark.org/docs/relnotes/wireshark-4.4.13.html
  - https://www.wireshark.org/docs/relnotes/wireshark-4.4.12.html
  - https://www.wireshark.org/docs/relnotes/wireshark-4.4.11.html
  - https://www.wireshark.org/docs/relnotes/wireshark-4.4.10.html

Fixes the following vulnerabilities:

- CVE-2025-11626:
    MONGO dissector infinite loop in Wireshark 4.4.0 to 4.4.9 and 4.2.0 to
    4.2.13 allows denial of service

    https://www.cve.org/CVERecord?id=CVE-2025-11626

- CVE-2025-13499:
    Kafka dissector crash in Wireshark 4.6.0 and 4.4.0 to 4.4.10 allows
    denial of service

    https://www.cve.org/CVERecord?id=CVE-2025-13499

- CVE-2025-13946:
    MEGACO dissector infinite loop in Wireshark 4.6.0 to 4.6.1 and 4.4.0
    to 4.4.11 allows denial of service

    https://www.cve.org/CVERecord?id=CVE-2025-13946

- CVE-2026-0959:
    IEEE 802.11 protocol dissector crash in Wireshark 4.6.0 to 4.6.2 and
    4.4.0 to 4.4.12 allows denial of service

    https://www.cve.org/CVERecord?id=CVE-2026-0959

- CVE-2026-0960:
    HTTP3 protocol dissector infinite loop in Wireshark 4.6.0 to 4.6.2
    allows denial of service

    https://www.cve.org/CVERecord?id=CVE-2026-0960

- CVE-2026-0961:
    BLF file parser crash in Wireshark 4.6.0 to 4.6.2 and 4.4.0 to 4.4.12
    allows denial of service

    https://www.cve.org/CVERecord?id=CVE-2026-0961

- CVE-2026-0962:
    SOME/IP-SD protocol dissector crash in Wireshark 4.6.0 to 4.6.2 and
    4.4.0 to 4.4.12 allows denial of service

    https://www.cve.org/CVERecord?id=CVE-2026-0962

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2aaeb10bce055d63ea0855914a8fbac4f6390611)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 88eb7ef494..87d5781eed 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.9.txt
-sha1  dc91c68b03b389645fa6dade92960863d74bca1d  wireshark-4.4.9.tar.xz
-sha256  60551dc787f41e87aeaa1e9c33304f9008037e3baf9fa11aef9c2d584cc0b54b  wireshark-4.4.9.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.13.txt
+sha1  2e85bc1231775283d3e1593ce700566e0dc4efb9  wireshark-4.4.13.tar.xz
+sha256  cdaaf455954b45990651ba334ddcc691ee446fcfb332e78d27b0a8451f22dc0f  wireshark-4.4.13.tar.xz
 
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 9ccd8f9a9e..196ac63271 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.4.9
+WIRESHARK_VERSION = 4.4.13
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license

--===============7066878700239759997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7066878700239759997==--
