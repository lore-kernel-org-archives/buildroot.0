Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95F6C624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 11:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F8F760648;
	Fri,  4 Sep 2026 11:54:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ya3uhZA_PJRt; Fri,  4 Sep 2026 11:54:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9059060BE6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788522886;
	b=JWNSAIbQjL+j9O3mxKn27IDzZOkBn2WwYgYdUfSerJ3nnEa2EwvI8/LlwfMi+PiLmhiK
	 ++eVMU6bC2BgOomqh9RbAGFm/7Fc3F69+RDOtxRO2Uy+ka5+wPq8KuZgabnhpv42/Wrmd
	 aRue57le0BXLCs11i+nKONIJu+UDsd1R6S+2PU66ic/3cgutbzgvscU3DDDa7VZy+zDP5
	 jV7h4KJOgAn5gLoMKa1HqU7AkL1VZb9T2Huf1AI9SflUbrqzJPhJKvbJ2OgcmSzFqQzwN
	 7sGmLy+GD6qW50s1jNNUsSVcDeZLZ27lGADvFyVvl2d19B/2dnVmIQ/6oPNwdVokhBA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788522886;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=3l3V4QapeaOmY4yl6JQR4jeJdiHwxEZPs2GItaWxLlw=;
	b=JVcfdgwy0wiiI6ATIUoQju4O1XbgpvxjsP+cBHUVjw+Qw1OLM3AqOrKm92M/uJs2zVrV
	 1Ha4q4ieyV7HPu2ewJpvt+PtNH4CLpZ8zki42JxEq4fuLrvkkIdq/lcWE02tSrw36y+eb
	 YO/vV8PxRcWot0T/7+NZ8iR/47a1zX5+hQIxdqM+zO5vTFimMw2Q8UBdGhDM9tl9Eqsh/
	 0RzdpypLrQwaLxvxc1p9q9RWhqlIQnHmCT35hM/l1ypZIZUNU5WUe1nScHcnvaVTMuz5D
	 4b/7zfOPcMYGqbl60Hc1sR8ZatEpKIZkFEBpBrWKGB2REMg7s7fCsw1k3UIVanTxi0Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788522886;
	bh=3l3V4QapeaOmY4yl6JQR4jeJdiHwxEZPs2GItaWxLlw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Q6qDnCSSWI9Ke7/1jUaHgSC5YOCP7gBsTounRCXcGWKoDq8VkkCrysBATzDVbf91z
	 uO3eBt8+qgCRUId/NCzueMV3DMx2Vka6yi41YQzgRt619M089g/N96HLDsSfWyYcFN
	 zp+rSFynAHelq94F910GbjVze9I5B8otMj+YKqmUrx0nXFc+mMV6EtE69Ts3/hBhKW
	 O5FbZVZBK/RniV+zJQp0HeqVdyfPqtXgmhlRw4y1eYn5Cd+y901I2Khr/OCuRFMiwI
	 tRfmRvMs6Ht0rdP3a4bM3GqUe5UgPVLnmOi5ayocUv5Kc2GO5lnGScJduDeKQ8YaYq
	 lZNfosbjJQl+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9059060BE6;
	Fri,  4 Sep 2026 11:54:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7761310E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6921E4031A
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:54:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sc3cLQh2tyW1 for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 11:54:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 2742840080
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788522879;
 b=kG9SvfHJgkxUkghFy7d0sv6Fv1U7aD78l7493HQjK083GmnN6B9SZb8reL7BTo6psEti
 /2zIiDGErpgPuq4kYY+vdQpSrGlaHRkdutxrqrvz3y/V601n+KhhXGLwtri9J9ahwu6Cy
 RxX66iC2M+nBtYUP3WmwooMqpSRFfjOMFdvnqcQaqiE8R1jERMEuntjFMGO3uVi3QUz5W
 I+ZXy99h2q6CY+gqY4q0/85n04V+zO0scTfIRUo0fJLteSaDyJG/fz+u4LkhcU1m9eZAI
 eOtrtN5ICwa0G5248xfN4Iwi6QfYG0LM6+SIcEVa8LGnBRFipPF35t1+BNkkUAcS30A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788522879;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=U9+bhxz7zQJW3erkrOOMMGCKBpUUf/AOIRQWtaqpUP8=;
 b=QI6Iq47N6oyNS50I866A4Q3gfuLNiqHV0irnk0z2kluV/z5MDSjaRHpI8pZXtdtdFqNb
 rMw5OhLmu11Gtce9nH8GPrcoi4q5KlgW9NDaNE1an5BCrkBVso2tKEQBnOUezGT2M+LTa
 WO1IVnazje3JYwY1pHvWrvE5ECHuATGGZ4ZrVLC5AX+RutpK7pRsc/mNykMM3AJfegBJu
 0BtB8ISBg3z0JYakGyYB4FTFcLZnRWvkP4xgk7iOBpQIPUlEiBNMULoE3N83Oj/1VqkuL
 pPssJh5wzJKTa7bBQwmrXG2r5jMqhaFzmgkN38DjQ7jac858VQf5JVrW1Mg+i++kofg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2742840080
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:54:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D6FA949D9; Fri,  4 Sep 2026 11:53:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 4 Sep 2026 13:46:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5f8d0b78ec32bd35b8a38812c71f33529a2723cb
X-Git-Newrev: ad9557dba535b2b2ad39733c9c3d31851d34a9aa
X-Patchwork-Hint: ignore
Message-Id: <20260904115338.8D6FA949D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcurl: security bump to version
 8.22.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ad9557dba535b2b2ad39733c9c3d31851d34a9aa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://curl.se/ch/8.22.0.html
https://daniel.haxx.se/blog/2026/09/02/curl-8-22-0/

Fixes the following CVEs:
CVE-2026-13608: OpenLDAP SASL authentication bypass
CVE-2026-18924: HTTP/2 server push UAF
CVE-2026-19931: Negotiate ambient user conn reuse
CVE-2026-80229: OpenSSL provider use-after-free
CVE-2026-80230: OpenSSL pinning bypass
CVE-2026-80231: native CA store conn reuse
CVE-2026-80255: secure cookie attribute bypass with tab
CVE-2026-82208: wolfSSL CA-cache hit overrides callback
CVE-2026-82209: domain-scoped PSL domain cookie

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 6 +++---
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index e2393bf2f4..0a7b9e0169 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,7 +1,7 @@
-# From https://github.com/curl/curl/releases/tag/curl-8_21_0
+# From https://github.com/curl/curl/releases/tag/curl-8_22_0
 # after checking pgp signature:
-# https://curl.se/download/curl-8.21.0.tar.xz.asc
+# https://curl.se/download/curl-8.22.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  aa1b66a70eace83dc624508745646c08ae561de512ab403adffb93ac87fc72e6  curl-8.21.0.tar.xz
+sha256  f7ef3ae8a22e521f289803fe93543eb64c329b58aa73a9e224dfd915a2a5f4f7  curl-8.22.0.tar.xz
 # Locally computed
 sha256  82f2f4427d6545ee5aaac4f0b80428da6cc8ba41c2cf5da3a03680ec327b9681  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 219ce9f712..c3590a8a9e 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.21.0
+LIBCURL_VERSION = 8.22.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
