Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E935CA6004
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 10:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 664B740653;
	Sat, 10 Oct 2026 10:23:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dj1DCXlEHjfx; Sat, 10 Oct 2026 10:23:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7FB20407A0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791627830;
	b=DviN1q0q3LeWRELM9nyl5GhXGdZngwmv6hVtJSsl6X0ckhZvnyZ32xfL49Acv59EzwxB
	 Jj+mGZkv+SYpmHdzPC9VxykMXRM9/0RHePgVc+DfwSvgWLYEiA9ADqMyW2JKB9v9lLi3k
	 Wha8cBYbAySc/pNxrJEujW0P04/GpRiIRY6+6pQ5cZxjoIpWO8EGe7eu5Q2SIezZSqOIB
	 WRHgDuLNyPfvk1Z6DVa5QOb565tcTD+E8SOvj3A2NpVwc6BxbRGRdi3nPAdxJqZT2x0NF
	 4Sf4JNyGTAawFYxeGGbDLfnzmDHt6s9hFZrPbyOhD4PupQ0GcUCNBKme9sRaouFbp5w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791627830;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=B1a0WC/LRDG5vQqT5nlth7PuCkZU4pC0uCsY/T2mf0I=;
	b=F+h8zueylAP49wHx2lTyX4u9j9atiIhwMVLjVR6IheqssjJyvrgqnqob+cHuIDK+fydb
	 ludJPPKTPIRt/EEo8QNc4Vy1Nv84iWdFDYmjMffCDWiKrvZx0vn0ZDx3P0rJ8sUa1nDh2
	 aAtmS/HGW0Mf0wMXDaGCnx2xK751QFUKceRZanAdSALPLfWPa8u2/HsEeRaGSbwLkq3f0
	 w+qPQ0NfzyzdiY87TN2f4aX9vka/8Bw2PPIHtwMIsjgUEhz6VjSlXuBJ2RyYmbAQuZdH5
	 qU8IpgOM2ZFFDo/O5JwrOx1oLWI/5Pz78hOotHhQ56vB/vsACuQUcedIHYqzO07PCXA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791627830;
	bh=B1a0WC/LRDG5vQqT5nlth7PuCkZU4pC0uCsY/T2mf0I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KCe3xrwhoI2CALpCjL6TdLKGKdSWfVi+cyLzCmnzW+mMToDj6Dn+YANHdZsShRmUk
	 PjkhmitCgO1pasW2jzDy8ECeRUVH0IaJ8DGgnYtcR4f4Q89dt9ywUErTS9uOn5cida
	 zBlz48NBy1teDqYRMumoDfUjml/YcoURPy8/RANqYK4fzpMgoRH//wbJE2HwtDDJys
	 EoC7TJk1AZEjtypdndPtfFdPGEkeyqfAriI83KM/pBmKaEw5li3jajBYpVaQZ9XfJ7
	 1exK7ca5E8hRvc5I9WaiWDUAyF1XdOjs35/YrpP8iuYkVlTPaSzTuUifxFUWjxG+4y
	 N0d6eURHrEIlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FB20407A0;
	Sat, 10 Oct 2026 10:23:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BD4911DE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAE1040061
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:23:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HUrgfeTOzRCG for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 10:23:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0875D40004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791627828;
 b=IljrBoQnZXloDl+FPTAJynfBUFJpox6Iza40Exqtsh2y5k+VjEb8fZkBldK/r4WtEh33
 T29I/lhcrU54ocDvW5p2jW9E32DaAVcMopTN3NuUlG9rkSnmYFgWe+syhf2l31SHtJ9Qk
 qdRFgAVm/+AMaShW+CZZJKm+UH2FAdlBmLFKUCou/rIL71YHUM5qb1elW5H0eqpu8xjcu
 adC82WO2lbOexvRIJqq4Mnb144ZoJi4CaHv6z/Bm/k7eq0CYfQ9aaHCkjCpNlHDtiaMT/
 YL6KRg7VatFhvDcFsai1V/ww+jr3V+L7l6vAgRyv5goFVcOVlkMN/BDuFF+DL4IBgPw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791627828;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=lR+ep7Dpjj3SjA8lSUucrWVQOOcEuWLakldXU/PEKsU=;
 b=bIFHAlBDThrMAoCjz9LT0iSrff8wZTcxPRdvHnPc1uIucRoAdMEdElUe2hgZTQX3VRCQ
 NrMACRL+jo5bK6UvaqzpJUoDpeimhqQhLFlerK4OcdgRlM9lSQBjxSTwGs15g+8IOZcoO
 lGZFq1vjPTGiV25qG2/vo9xeQ4SBGoPEjn2SA4LAT8rwJF9aJL8eGQx8IYTJeFAjxbzxI
 KyzJyqVLnkDBtk3lf5ey9HO1OqrrQKHbs7sr+JZT8oc1DGxr+fTVR4A4pfR/H2XeJ7WMS
 EtdEbiNCYHs3vwyOs+M1wAB4Q2mhTWE6xnBcaAyqlMIOs5O6hd2y5ekvl8q5QaqU+Ig==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0875D40004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:23:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CFAEF8E19F; Sat, 10 Oct 2026 10:22:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 12:15:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5301a7465325b33eeb29094d1ba5c26c3705bc62
X-Git-Newrev: 8ddd73f2b3a781a5a5d9b1c181c768d393d7f03a
X-Patchwork-Hint: ignore
Message-Id: <20261010102229.CFAEF8E19F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sudo: add support for OpenSSL 4.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8ddd73f2b3a781a5a5d9b1c181c768d393d7f03a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...essor-for-getting-an-ASN1_STRING-s-length.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/sudo/0002-Use-accessor-for-getting-an-ASN1_STRING-s-length.patch b/package/sudo/0002-Use-accessor-for-getting-an-ASN1_STRING-s-length.patch
new file mode 100644
index 0000000000..eec375f70c
--- /dev/null
+++ b/package/sudo/0002-Use-accessor-for-getting-an-ASN1_STRING-s-length.patch
@@ -0,0 +1,46 @@
+From f97a34bc7b390f185d544e21b0ef75db1275953e Mon Sep 17 00:00:00 2001
+From: Theo Buehler <tb@openbsd.org>
+Date: Sat, 22 Nov 2025 12:28:50 +0100
+Subject: [PATCH] Use accessor for getting an ASN1_STRING's length
+
+OpensSSL 4 has plans to make ASN1_STRING opaque [1]. hostcheck.c's code
+mostly treats it as opaque, but accesses two lengths. This is API added
+in OpenSSL 0.9.0, so I'm not sure we need a configure check.
+
+WolfSSL only recently const corrected ASN1_STRING_length(), so maybe
+there will be a need to cast away const.
+
+[1]: https://github.com/openssl/openssl/issues/29117
+
+Upstream: https://github.com/sudo-project/sudo/commit/f97a34bc7b390f185d544e21b0ef75db1275953e
+
+[Bernd: backported to 1.9.17p2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/iolog/hostcheck.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/iolog/hostcheck.c b/lib/iolog/hostcheck.c
+index dbb900e71..8383d2c49 100644
+--- a/lib/iolog/hostcheck.c
++++ b/lib/iolog/hostcheck.c
+@@ -323,14 +323,14 @@ matches_subject_alternative_name(const char *hostname,
+ #endif
+ 
+             /* IPV4 address */
+-            if(current_name->d.iPAddress->length == 4) {
++            if(ASN1_STRING_length(current_name->d.iPAddress) == 4) {
+                 if (inet_ntop(AF_INET, san_ip, san_ip_str, INET_ADDRSTRLEN) == NULL) {
+                     result = MalformedCertificate;
+                     break;
+                 }
+ #if defined(HAVE_STRUCT_IN6_ADDR)
+             /* IPV6 address */
+-            } else if (current_name->d.iPAddress->length == 16) {
++            } else if (ASN1_STRING_length(current_name->d.iPAddress) == 16) {
+                 if (inet_ntop(AF_INET6, san_ip, san_ip_str, INET6_ADDRSTRLEN) == NULL) {
+                     result = MalformedCertificate;
+                     break;
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
