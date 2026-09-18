Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81EEC982DD
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 19:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E61140D03;
	Fri, 18 Sep 2026 19:14:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zAZnQPOkA_Gi; Fri, 18 Sep 2026 19:14:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8CE4F40D06
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789758874;
	b=kzhqrWLCR/oST+/QS1ab+OBx5YZyzRJEwW+n6okeH7Kj1RT42nlo3ogsiakrYosLNj1O
	 gBxLkbTPITfUiv4qBDfsVvrXb3PRyGgSiorF0hnTiMhEUyOotFI9Sl7P0t/hQEDsYU2Hl
	 jSW/mxUsYfhcZ4UBLOpkj7qASFck2hM8G36amMP1PmHGGmOJn/ITzxb4CkbE5IypihziN
	 PtmDjGvkgN1UO0T1GFzR8lpdxiADFPYkw5EmI8n62syUf4oQgHfdv+/mMqmoU6xn8YLru
	 mabbZLiVxXLuF2i/7t6pYWNt4NuNLkGiw5FCgzDEx8VVVXyv93Y2/7niQjd+WwXiXMw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789758874;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=MyIAGjPleULZoITtLzffllzMg8saTWUffQdvVnxk3U4=;
	b=MGUhYtZE34rj15jmyRng2vwVIC+PkuU6/PCgljZV3l5tCOYCA2bSGsZ40JynTnUDHvUW
	 FLtEU6raiwhdKKlb+36EQZDWyy5Fm0nQvCHBgsgYFQfezhKwOoZPWoCNeRTwFYZrWoeEL
	 wddbdCaAXgOQzscgrKZ0MdfLTo4QpXAcwRlaGJ+uR4W+bDwPBWtaSB8WbWoKXp1jFM+Il
	 7hVRIjG2by/qDmLVjdGDVrk3ZED/AxMlmWGufdiQaD2kha1Ds3HW+GnDm8JTpZX2R1c9X
	 85bFekx9aJ/CqiO5Ug5njigBncq3V/p8rfgyIW9Ac/rCxElxmpNdkJL+Oy9H8rRQ8Jg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789758874;
	bh=MyIAGjPleULZoITtLzffllzMg8saTWUffQdvVnxk3U4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=V0o7c+jOlLdw0LyMmGzfrCJWZxH2oyucEYHlnr7ZWwPXATnJPwGoxm0mktUP9RFv6
	 8uZo4xdy85RiMF9WwUjt+epb4JNqnAcQoD6XMrwGW152P4x4fohhxkHGRnSmoRP8sy
	 /SlL5l8IrKjISMxeAIpbtwnvb1jhlzzubh8e72bPqcUzvybptMDN5OzTLZGFmErzP3
	 bGkIDfDwpSzyaCD8ols/nv35vSCnP4ziVk0NVDpcxoY4xcpJOuEsldiyKw7ln1f5zV
	 EYtBI51gnHDxfWthW9qptNeFWq7IvGVQwPcni+JzqCaVbX6FSsJFfMpxZNc8NJEpeN
	 yssctGlwTvOig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CE4F40D06;
	Fri, 18 Sep 2026 19:14:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B5B5237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61CA840D06
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rpPfwmxVd9BV for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 19:14:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A9DE140D03
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789758870;
 b=oQGPKr0lfKzHKvSnugvFJHBosXSjQxShkzfM+ju8beZhy4s+6YxTOIXS/vy7pjEdqTOk
 /EIyHZoxgfdDvEYdDrWX6r+I+y+XLjKAtgZ876aCJOAuN5q9kyejz3MwB3nvVMxkUMx3j
 7WWJl1CakkUkeF0RDFHX2//wNHpEx69HtXw3BJIELZcRbEgmhNSvPu4k9niU8QtZlwN2p
 l25H9MR2UiDS6noGTK9vTEejDEZRs24wGO3abbbRGXcGyGFtDjrcpB4p+7g1xhXVpyG8m
 GwbdiylpPKnYjTjGpuTaWdCHq6KFC6ikdgLEtzojepheryb3mjB8WUA5ytzsCJ8mYJA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789758870;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=nj/Jy26Drms+CGC7FQFCI9Ijf+4NmR8tYSoZgnAJN0k=;
 b=NimgcGRXYkqpY7FhM+h2WrUyajHxf5f5SKh6f0voQvTGz4d/+VhHq4sF+9ZS+VNZv7+/
 K4znlhjKc8WA0NpkkC19X5UXMfTlKXF309yl2PErzsJ8aPYT+1yQ6TUlWxEph5yhSDPM8
 h5SpQenB7m9WVccvFQqdTlkTAMZAnGruAgU+xOTFOmkU+30X6A2NCF8odgvf+BYpu74kh
 BsS0+JaeoPUzr8yWgsAdD7aQarrXdpB5nbRXsC8lYgjxRFlgfxurpkg4wV9ulnpl+s1K1
 XxBgu5lzdiZBGxktDYB7tTYZSkyLvdDbOTfAffDe8w/h+53WcZai23RyWTSBYyBD5UA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9DE140D03
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:14:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 228BA976A3; Fri, 18 Sep 2026 19:13:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 21:07:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 458441ad76c0a1624b113dfaadbda2c16eccd5bf
X-Git-Newrev: e59900428f540256721d37554948866e85b52727
X-Patchwork-Hint: ignore
Message-Id: <20260918191323.228BA976A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtirpc: bump to version 1.3.8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e59900428f540256721d37554948866e85b52727
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changes 1.3.7..1.3.8:

b2a58e4 Release 1.3.8
65d2745 libtirpc: Bound maxsize in xdr_rpc_gss_unwrap_data() decode calls
ccc1acf libtirpc: limit XDR decode node count
9c15036 libtirpc: Fix use-after-free in xdr_pmaplist() XDR_FREE path
01796f8 libtirpc: fix rpc_gss_get_principal_name to allocate memory correctly
468d4e6 Add missing exports for rpc_gss_getcred + authdes_getucred

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libtirpc/libtirpc.hash | 4 ++--
 package/libtirpc/libtirpc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libtirpc/libtirpc.hash b/package/libtirpc/libtirpc.hash
index 0c94fd80c0..ec72a38304 100644
--- a/package/libtirpc/libtirpc.hash
+++ b/package/libtirpc/libtirpc.hash
@@ -1,5 +1,5 @@
 # From sourceforge's info on download page:
-sha1  885aaa0b9c348d06dd8a9e2ae0a1a7343711eb1b  libtirpc-1.3.7.tar.bz2
+sha1  fe35ce7e81ccfa974c74ced9ac725207af9fa318  libtirpc-1.3.8.tar.bz2
 # Locally computed
-sha256  b47d3ac19d3549e54a05d0019a6c400674da716123858cfdb6d3bdd70a66c702  libtirpc-1.3.7.tar.bz2
+sha256  8839959bfcc7a0f4c609d8e4f53f1c67ae33de23775ec35beb39ff15adf11920  libtirpc-1.3.8.tar.bz2
 sha256  17cf6098f95bdbb269f0bbc68e76c88fe20487ca7ec53f454923ab4256ecd2e7  COPYING
diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index eadacedfcf..243b9466c0 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTIRPC_VERSION = 1.3.7
+LIBTIRPC_VERSION = 1.3.8
 LIBTIRPC_SOURCE = libtirpc-$(LIBTIRPC_VERSION).tar.bz2
 LIBTIRPC_SITE = http://downloads.sourceforge.net/project/libtirpc/libtirpc/$(LIBTIRPC_VERSION)
 LIBTIRPC_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
