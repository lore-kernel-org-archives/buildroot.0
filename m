Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9F4E7DF11
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 17:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B44B960744;
	Mon,  2 Feb 2026 17:38:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2jyANgm4JN1a; Mon,  2 Feb 2026 17:38:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2A026077D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770053882;
	bh=hoIz+dbElWBQIg6xKeE1LFxDI2vnCxd4JC5wG0qxcQU=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rKT/h8JH+zwEJQvhz6VgZTrXyezPYCRlVFpkEK0CVnqCnE2Ee5hP5wa5/YQaFs7xY
	 8+KO466+TpRSn182bTsG/sz/tGda59yArfBlLBIeiit6rhzmKjhZ6yELPf7xLmPKfP
	 kn63ErAKZRKnQkfpTLee/qFrhQ9YGLJPa6urqyqTSseaeikrS+hblo0+B914+TXTRI
	 oAEIQm29Jsk2Rh55ikLENToNy4B1Hzpjv+OTI35Lz7TmBA+M0TVp/d8f5P3pl2NarY
	 pqIg/D7aW/yLJtahKTKjm56eySaWjUpJYCnNec3sKayowZqnXmejOBx/mQi/vf44Pj
	 i1Ep3Y3fKzYWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2A026077D;
	Mon,  2 Feb 2026 17:38:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A6EF23E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B1D28254D
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:38:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BsFMCooZwg45 for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 17:37:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2A81182660
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A81182660
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A81182660
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:37:58 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 6BE3C31E0AC6; Mon, 02 Feb 2026 18:37:56 +0100 (CET)
Date: Mon, 2 Feb 2026 18:37:56 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aYDg9IRuE64VYwWa@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1770053876; bh=sdbXjyrUyKk8V4UKFfV/UNzqRFW/nzmGfayqqsjkVmk=;
 h=Date:From:To:Subject:From;
 b=tsMk9oE8RcGLizZqjXRR8j+Yo5VGrYw8IhxOKQSSzXYU2MgEEVLf5tSijNV4V95rD
 XP7SX4MyCeo3y7OKmkCAbWT9KBWSSa69lnSSWWyWA/XvfWkqkGSmqW0cV9npQXEfht
 ySBeypPBkuPe0I+d11y3VPrl7J1msY9Y6t3N98tf9mUdfD9466p7fpvsxa5qq/4/vb
 t/XcN5jjjBuI+AH+HNv/yyapmrSt/9ziG4+AgwypLU9F5v4ONhRltwN+lgxFMGTpZn
 CgeWEvgDGluIYCpQZvKTDYei5OiQzEmLXPfESwPvADWL9clDhf2beyBBbK0RbkwfdG
 btWY1Jdoz6A/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH] package/asterisk: add workaround to fix build
 issues
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

Sometimes asterisk buildsystem decides to remove our own
build menuselect stuff for the host. And then fails to
run the cross-compiled binary.

Add a patch to avoid removal of the menuselect stuff.

Fixes:
 - https://autobuild.buildroot.net/results/5f7/5f76f032ee596e928089b064b01f08adacade47a/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...0005-Makefile-don-t-clean-menuselect.patch | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/asterisk/0005-Makefile-don-t-clean-menuselect.patch

diff --git a/package/asterisk/0005-Makefile-don-t-clean-menuselect.patch b/package/asterisk/0005-Makefile-don-t-clean-menuselect.patch
new file mode 100644
index 0000000000..79c3174853
--- /dev/null
+++ b/package/asterisk/0005-Makefile-don-t-clean-menuselect.patch
@@ -0,0 +1,26 @@
+From 844c1cddf38fd91e15a93eef96c67a5834fc9a78 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Sat, 10 Jan 2026 12:25:30 +0100
+Subject: [PATCH] Makefile: don't clean menuselect
+
+Upstream: not applicable
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ Makefile | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index b57f77477f..80035a09e7 100644
+--- a/Makefile
++++ b/Makefile
+@@ -436,7 +436,6 @@ _clean:
+ 	rm -f doxygen.log
+ 	rm -rf latex
+ 	rm -f rest-api-templates/*.pyc
+-	@$(MAKE) -C menuselect clean
+ 	cp -f .cleancount .lastclean
+ 
+ dist-clean: distclean
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
