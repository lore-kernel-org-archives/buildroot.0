Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9B9FCC9C4
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 06:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CBD340C02;
	Tue, 10 Mar 2026 06:03:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vIIS0zbdgOTW; Tue, 10 Mar 2026 06:03:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 758CA41B01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773122608;
	bh=Pe6L8dfsAgmjLX2bvfYVwRT9gXXn8B2WF/h63ooV9Jg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QFCzHd75TlWvXQdk3XEd1qg0MMb+Yq3XIn66nwGtTGLwaFhmEDsf5lrhJT/lRusCK
	 Jw6KupocA1Vg+hQby9lzB92HfsZlB8rQPYmDg8yu4Lm4vMOfTVV6T4Z++Qb7ytQ0fL
	 w5clAlx0E/a98L8FiGc5KMlL2EmUSvvi5dDXRJn6dyozMOxi8sdPOlXDfm6x3xEJ/F
	 GkdOgqnV1dKXL0yz0YJpWp3WkaqY4B4T4smdaKpCUHjxSbmd4IxrYSs81onyZwK7EF
	 2V5hBq0TI9UJONUUw7wDJ/sPlOpW2dlxw50m5ZDTc+HnzoZRWkFlcegVL1wcdQwRdl
	 qeVeiCf+txxAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 758CA41B01;
	Tue, 10 Mar 2026 06:03:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A4EB201
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 06:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 307F784278
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 06:03:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pY1Mib8iviGm for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 06:03:25 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 99DF3841DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99DF3841DB
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99DF3841DB
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 06:03:25 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 38D4BBDE2D06;
 Tue, 10 Mar 2026 07:03:23 +0100 (CET)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>
Date: Tue, 10 Mar 2026 07:01:48 +0100
Message-ID: <20260310060155.240036-3-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304091915.1102943-1-br025@umbiko.net>
References: <20260304091915.1102943-1-br025@umbiko.net>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1773122603; bh=IxdvZ0vFJAzgP1WpC6wyBG2k/rM7j3d+rkQwPpFZ/2w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=BVK6E8AFCth9+i2zGuCIGoSUdln9wJ+hnFfla4wep8e+7AXuHUF5pRS7uWgM7A10Z
 dX7r4BogHSDAbwEpsWrjutAhCQhbK0i//08PT/h4v4EA3neh3buZKzYxd93ojT+Vhb
 nkgJu5N4NH8dnVwUvnDnozMtLv6lqLiPDr1ioYg8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=BVK6E8AF
Subject: [Buildroot] [PATCH v2 2/3] package/icu: rebase patches and add
 upstream tags
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

Details originally provided in 0002 are no longer accessible. Upstream tag
was missing. For 0003 there exists a pending change.

Rebase 0001 and 0002, add upstream tags, add some background info to 0002.

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
---
 ...0001-dont-build-static-dynamic-twice.patch | 14 ++++++----
 .../icu/0002-link-icudata-as-data-only.patch  | 27 ++++++++++---------
 2 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/package/icu/0001-dont-build-static-dynamic-twice.patch b/package/icu/0001-dont-build-static-dynamic-twice.patch
index ccbe534aa2..f808583df2 100644
--- a/package/icu/0001-dont-build-static-dynamic-twice.patch
+++ b/package/icu/0001-dont-build-static-dynamic-twice.patch
@@ -22,11 +22,15 @@ are running on the system at the same time).
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
-Index: b/source/config/mh-linux
-===================================================================
---- a/source/config/mh-linux
-+++ b/source/config/mh-linux
-@@ -35,7 +35,7 @@
+[rebase for 78.2]
+
+Upstream: N/A [Buildroot specific]
+
+Signed-off-by: Andreas Ziegler <br025@umbiko.net>
+---
+--- a/source/config/mh-linux.orig       2026-03-04 09:04:03.693446602 +0100
++++ b/source/config/mh-linux    2026-03-04 09:05:10.741886357 +0100
+@@ -37,7 +37,7 @@
  ## Shared object suffix
  SO = so
  ## Non-shared intermediate object suffix
diff --git a/package/icu/0002-link-icudata-as-data-only.patch b/package/icu/0002-link-icudata-as-data-only.patch
index d970e8d30d..44781a76e9 100644
--- a/package/icu/0002-link-icudata-as-data-only.patch
+++ b/package/icu/0002-link-icudata-as-data-only.patch
@@ -11,25 +11,26 @@ problem, and is the solution that is used by Debian, see
 https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=653457.
 
 Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@devialet.com>
----
- source/config/mh-linux | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
 
-diff --git a/source/config/mh-linux b/source/config/mh-linux
-index 531a3b2..5a2a7c4 100644
---- a/source/config/mh-linux
-+++ b/source/config/mh-linux
-@@ -21,7 +21,9 @@ LD_RPATH= -Wl,-zorigin,-rpath,'$$'ORIGIN
- LD_RPATH_PRE = -Wl,-rpath,
+[rebase for 78.2]
+
+Details + similar implementation:
+https://git.openembedded.org/openembedded-core-contrib/commit/meta/recipes-support/icu?id=644c307f63f0f0b7e97140850d3d1d2124b11b1b
+
+Upstream: N/A [Buildroot specific]
 
+Signed-off-by: Andreas Ziegler <br025@umbiko.net>
+---
+--- a/source/config/mh-linux    2026-03-04 09:05:10.741886357 +0100
++++ b/source/config/mh-linux    2026-03-04 09:09:09.695303165 +0100
+@@ -23,7 +23,9 @@
+ LD_RPATH_PRE = -Wl,-rpath,
+ 
  ## These are the library specific LDFLAGS
 -LDFLAGSICUDT=-nodefaultlibs -nostdlib
 +#LDFLAGSICUDT=-nodefaultlibs -nostdlib
 +# Debian change: linking icudata as data only causes too many problems.
 +LDFLAGSICUDT=
-
+ 
  ## Compiler switch to embed a library name
  # The initial tab in the next line is to prevent icu-config from reading it.
---
-2.0.0.rc2
-
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
