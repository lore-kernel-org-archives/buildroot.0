Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89629C79F8C
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 19:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C7C8605E4;
	Sun,  6 Sep 2026 19:28:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f0xRWSW2QmAP; Sun,  6 Sep 2026 19:28:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3949F605EA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788722894;
	b=HuFLJzDLonoWX2Gwis8VHlcZeeOOGzgges3VngZ9j0p/mTJzpZoN5aZ9aje/ljGJNZzA
	 Npyk/Xu+SnlWQVFnJZ+818k9RyCWs90r/DTi54glPreUJ+b80xMIDohje9GVxlgvnEEKY
	 teBPDGRSoK0hJbSKDsSkhwNNEp3edUnD8Qa2Oc4L4pDdONgZ+9vK+X721khyMtm5rDU99
	 CzFqVmXvGo3n4MkKXsgSv1K07CZROTXvS1HWFhwy9OfDhxds+PiLqARQZsDjWY5wfRCYK
	 6BHafIvQrNDKaF5B5KEvhVpIjvkI3NIdhEhMs/QmllpoJZixyJWMMWmaoRaKrFfGVUQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788722894;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=up6nGTPWtQSPOuPXySZcEJjKQLcDWSpj6wzUmMyve/Y=;
	b=NuiXFr9epnJasclnMPYxAzbRU2cLlL43D/mlb576JyYud3GcXYu8nCYqKdK+ql0epQPt
	 gapLFc/uJaZCiB98iCh9hvTF3yRYIRl1HCmuoJzV6O2h7fejRXaGePqyJM/1KtvShwaj8
	 /VIdJrxYtxHILiLGuZg4xabpJD+cN5ZkVUO+iHNYVf9ysmuvxZYtaAqIvuhDQofs0n42X
	 GlG3p2bznww6XdFChwgzOGCEKcXVTVrccZmvzsM7e5z1vLq0yAriLu6mktjURAlMDRvkb
	 PZrVKerBLBGIZWxIU8/2NVlZ+Hh4wX0YBadzHYpFr/jk1G33/zZiZBzV3pCrWKu9CfA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788722894;
	bh=up6nGTPWtQSPOuPXySZcEJjKQLcDWSpj6wzUmMyve/Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lUOIhmicRYmC/6/4wGmzHsc40nbcf4TBvFW8Tvnl2xqJU9CZnn6XIiGxFoq6whtAs
	 Xhs8VDxjtIgL+/q3FHi2PIMPkFvhu6vUVOCVlrr1dwED3eI4ObjiLbOIErVtYzOSuu
	 I5zLKwMsDsv9Cgd5zvAOsTX0+/GXZcUhnJoDerSj2LyFE8NLxSH6qftEueI4aW4j/A
	 YGNaS95wd0LosbbJq0xa0RdJZEPfMq+kg+mEBetMbbUbmB5VbRz0KvrW7pyrturTQL
	 3OCdIFuwuT7hNDyqkNu9Yh9aKifkvEgPDIArA8PUrzSqiHTdzN7maRzxyzGTZvcSB6
	 UlVcNRHTBrRyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3949F605EA;
	Sun,  6 Sep 2026 19:28:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EF66972C
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 19:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5E694058E
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 19:28:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x8gry5_eotvz for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 19:28:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AC0E14058C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788722891;
 b=KswD5UkhD86IifGVNDCnPI+1BtGrfAqHo5Ue4S2Kr5bqQRdJkKdDbUIHJdowOj0dc8ag
 7qKhjnfHZ/jlFJnZLMgrAdHMgIZKEqr1eDcOD604CJc7wca/aRCANW2d47KaxD/EJsy4I
 SAx+ykkY2wqXzXgsjjnvF95Q5Hw8mjNZamSkO6ItCZHfvKVQU94XpeOvN3ja11VlpNJyu
 GeMnRcyJ6mCtHQ+3LVNid0HMpTIpYyX0dAE4i8bOboXaB2vcyYGXJhrXilOh2Ggu/icsk
 0ZaNQjcAtYpzezTAdGDhS1wAJMuLoNiFWCpIli6ZGGy0aEQil1ptQXluQDAu+O5pswQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788722891;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=OWuXNTY6DeamDtqR5VbisNNVFq4ftDcxceBgZk6jJB0=;
 b=IFD3TCuQhL9utFqty27KZLKe7ELf0eCrZ+HWanQgScwBFCvJM+aPHxQEe9WzW+W9HMI2
 jXYcRz9ejj7IVb3PJbACTcoDZhRPUWPSFhD33Gvg8laGNt6dK7l6oe02fEr9NWRVMe2Hd
 p67TjLetZF4YY2H8Bomqm3h7myV+NXGTYmYXN+Z5N/SY2dHUQ/WXK+dS0c0z5hQQdYZ6C
 peYySXm7ApK0ln99u1XdlhwGjko6LdswckckTis1VxC5lEEzy4q1lIN79Mfw/ehgTb+fY
 7nwjW2YsGG7JK566+TiC+53KsTx/urJhtHshW3eSRfJ0ge6eUbSGWOcUR4FozbxEUHg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC0E14058C
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 19:28:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F01C195457; Sun,  6 Sep 2026 19:27:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Sep 2026 21:10:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f77c8cf14e51b9c2cbe472fa8a9a004315fc0a17
X-Git-Newrev: 612460dffda7566bce48ebcfb257357315ae73e7
X-Patchwork-Hint: ignore
Message-Id: <20260906192709.F01C195457@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cmake: bump version to 4.4.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/612460dffda7566bce48ebcfb257357315ae73e7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://cmake.org/cmake/help/latest/release/4.4.html#id2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 8a2942493d..5f151221a4 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v4.4/cmake-4.4.0-SHA-256.txt
-sha256  65757f442fdd242e27f1728fc26dc0cba4164f7a0791a5c788631c00080369bc  cmake-4.4.0.tar.gz
+# From https://cmake.org/files/v4.4/cmake-4.4.3-SHA-256.txt
+sha256  c46400618b4f1f2b43507f24fb22f3ae830c3416cf23b776e16e1d413aa892f0  cmake-4.4.3.tar.gz
 
 # Locally calculated
 sha256  4382e7c1879ac90e3f101a395d23846fa4dbcaa1eed7265b43681e348754825d  LICENSE.rst
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 007a1efa0b..098f6e9158 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 4.4
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).0
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
