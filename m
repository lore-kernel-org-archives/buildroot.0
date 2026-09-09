Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E10C79F8C
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 05:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCD2A406E0;
	Wed,  9 Sep 2026 05:28:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IXimuuoFnOWS; Wed,  9 Sep 2026 05:28:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 61663406D1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788931732;
	b=rJLp7uETl03VvmGipHvxkJ2Eff2epBxiFiamHo7Itg0OcHSb7xSNLocMvHCSkROY5nJZ
	 kB/ioZ4hSUpCFjKVVWTKY/xYbWge74WbJSllm7GpIr2sd8wICVohTM4TkU5n4FhlcHtQg
	 nOKR+/pKvtlDG/17u3D6Q1f7pkJjQDLai2bfnnkBydQlXiXV4j2NYc7a3AWkJ2OgKvvkr
	 txse8Oyr2JALKpROnfg2Tz7xRNSN3Hn04YH3NPRmoooHZtXmIobbVfBfZugO6C9jjFoDY
	 incR7p2u3m40CBXAXHLzFzxJkV5uHhJ1MhMXCx1+8xLrfwEyt21EH7dYCzB9tvONziw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788931732;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=pRCRT91CcKVP4sDtVDJlaMeQVvceXDTSyMJkhOElHj8=;
	b=mL6HazhJ1LANqjwiqYy+BFz7o/I7aDgB8s2AwX2ulnjn9TLhBPewhbeusBTa1p0frhH8
	 nm4sdjI5DOu9Yz40WZ6Fig7KjWQu575SutWfT2qdGj9kx4nQAOOoQaCXqk8QuKRjnK3B1
	 O57mJNvILZiLklIkQJ3XMRuWGf/hAA38TGv540Za/ZHs03B/V2PHdDe/sV3iaNgrX+Nxy
	 +krNH2W1X6PNTlY0IVVN/kZ0eQk7hYlJFRYVkGvmC/rV+pKbOAb44vWVGT0YLdur88tfK
	 u9/6alwOs+3/RdkwcN+spmQ6AEue8rcZfFLE3lZvbsIzTatZU0tW8BTl7OMZ5G9eBTw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=rt5AILHg;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788931732;
	bh=pRCRT91CcKVP4sDtVDJlaMeQVvceXDTSyMJkhOElHj8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n6E+/FkFABK7UmJWTiflVij/gWRfBFN9QylIknQuENMpAA898Fqvlwku9mOa1FvBC
	 PIfiNSM4BFx2Tsks6FbhVVSZIIlU5I4nAfUj1L+HgFdROoI6eFBD4EqiPAqXuOHVNI
	 7A5+Vbwk6tP3s0eIzOFienltfrEs5N6Pc7JZgH6/IM28bTJnrZxtWhU6TKvj+Etu1a
	 yBYhhezMWbcNTL/UplxNMnxBN8yKDnQYqJg3lPO9LRplZBVjovqJHtTgJqKghMnUo/
	 9V1Kqb579ZVmKOlU18jNeHiMlMGfZWCwOiVScTMLovbtJzLS4rVeTZ0aVRlDwFdK+x
	 l4TG/yfg4eCLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61663406D1;
	Wed,  9 Sep 2026 05:28:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C5B829B
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 05:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09AAF406D1
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 05:28:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RYxYp-lcAShG for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 05:28:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6D0BC4064E
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788931729;
 b=luHv3jc8sY2EchmNBWvxUSS6JubLU+MnRNgowSN2mmXgWyt+EQpVWl7P6slvbsmJN8Dk
 Sat4yGAcXWtWs+77oqpYJqMUINfeud/SNtcC+08wPLh5HtPQMQIH91+mvcX2wFYFOB3Ag
 Z75s2KXQf6EzBjZ4pWpSHkaontSi1/n5EsCw/3Iiue9k4d9125JhIEo50wIjNjcMpTTo4
 6p3JVNQaFm2ik52BZ6oSblJwxH1jX0Tsgo4RGHlVw+OMg8bmFaYh5reAdzZf6omaFl5be
 qE2PYXBklpwfIQ0PDfgSHX/PCOXoJJHMs14+6fDbVAMhDHQbEHg3LI3+XM5jzUufCTw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788931729;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=5FKCmATWcIIr2cg4xHRDKjAPK6paFHocwVDJE1nSKD0=;
 b=h+GlPj4GUKFmshJP7EXN2me4iGwzVpdijz7YBEIFf+rrnDvqVIB793tBHRNFZBLYT09d
 92lhkopnv0WqsUD8TxiQ6Lprzhgepu0k9QcrDgE/S6VwfnFc1+nw8UCNFsqHKvcWArXaQ
 dWMvMn3a2H1QG2yayPLtiJPpMRw6m7SqnSq3zIfpX5nZ7HGqRabvK5gEeQbgMs33h0Jmh
 qZEL2Gd2lNJX6kdHy0YuZDMknsV3eB+a/k5c0ZV1GzJ/z45Z86CeONiKNirTnFBGhaKG0
 n9hRRO+zpBxyDB9qxoxTKvzuSOz8m7d4Q/i0rJd1IE/56dIcwElzdhApX8Y6ZnxHOgA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=rt5AILHg; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=rt5AILHg
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D0BC4064E
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 05:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788931724;
 bh=5FKCmATWcIIr2cg4xHRDKjAPK6paFHocwVDJE1nSKD0=;
 h=From:To:Subject:Date:From;
 b=rt5AILHg+X19Wxf0a9TmHgc6VVgApT+8pERSRAsEUh4q+WE7WsVLa7INrwobDMyet
 l+iLWXs0x7HFm3v1tjoSNbCpbB/pBoMafmon7p+bur8BGsJC8Y+qFaREDAIx0C0wuQ
 aRZAZhsKxj1tBgJ+yFh6nuPevD/PQqH8e2G6rS5mj+TkzW0KIiRFK/gHAkmIJF4c6O
 EclA4atoXKOsZC8wXhNUre2LVZ4djnlfSa1uDiiW0R/QqxWTn1orWWYOeyUdY40UAh
 pMN4VIZr/nFG+v1oOmi7C0TUm/eUyDEzZ+I3C6aiMb+R9QxH0KO1/FzfCMcsG2WBg6
 I93RhlT6h0faQ==
Received: from fli4l.lan.fli4l (p54a1bccf.dip0.t-ipconnect.de [84.161.188.207])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EE9D3A4C1FB5
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 07:28:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50322)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x4ArT-000000005ZD-2ZTM
 for buildroot@buildroot.org; Wed, 09 Sep 2026 05:28:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  9 Sep 2026 07:28:43 +0200
Message-ID: <20260909052843.18384-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.9.12
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.12/ReleaseNotes
https://forum.torproject.org/t/security-release-0-4-9-12/22096

Fixes TROVE-2026-032, TROVE-2026-033, TROVE-2026-034, TROVE-2026-035,
TROVE-2026-036, TROVE-2026-042 & TROVE-2026-043.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/fa1f24e3bee32a063f377b21420453ba9ea9ff7e

 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index b888270f14..f0ebf5d909 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.9.11.tar.gz.sha256sum
-sha256  2e6c1720118c812acf0079fd47cf91b6bfaba5d766c321c4d3d2a28d6a11a8ed  tor-0.4.9.11.tar.gz
+# From https://dist.torproject.org/tor-0.4.9.12.tar.gz.sha256sum
+sha256  c0d307c9dcdaee4848a8ca53e9d6c4ec92823e4f30be12790b0fbddfc6515f5b  tor-0.4.9.12.tar.gz
 # Locally computed
 sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 3e63fbacac..3fb4f52973 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.9.11
+TOR_VERSION = 0.4.9.12
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
