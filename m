Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3853C43458
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 11:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56F8C406E0;
	Mon, 13 Jul 2026 11:37:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8S9pCUPhZgpu; Mon, 13 Jul 2026 11:37:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A28040731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783942660;
	bh=ER02Df7TqpmesQUo6wldiR+BAKIFYAiRvuHTKO7oiVI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PmFanWSEmamilCWn6pBap55X1BZ02Oh42kgzM81k3faQxeQfmqXRjXd/Gqx1Fy5W9
	 20XgsMjrukTph9J33alzz9Unbf63EJYfN0TJN9s/xtrNbZw7EkzOeHimry+ziA+jWO
	 xrncnYUU3zlZ5LYhia7lIAyK9La+UQuZMvjtHaWk+J70jZyT1b3Z6zShr9Sh6Yej4f
	 7CaShU1gQGLdJzRjpkdjDV3kLAUdkys5gNEwm6ecF2mKYXB7fM2OxrTyponUwVwYUc
	 axQo3QUIDax6raIQuZ5SeDpwgfcrENtrt3L8rhPt0ADeZ0X0K5okd/Ju4r5boNHFjP
	 crhCTyViDvo5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A28040731;
	Mon, 13 Jul 2026 11:37:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C19C128
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 11:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CCBF80E63
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 11:37:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GIhk5g1ti9l1 for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 11:37:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 531BD80EC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 531BD80EC4
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 531BD80EC4
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 11:37:38 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-ca913a601fbso2068333a12.3
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 04:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783942657; x=1784547457;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=69Vz4BPZXpNPsiNJzyrAlxuuQNwj4VLD02NqT6QBi5U=;
 b=nn6sJTN3WXLo8udCZW5AdY6mh0cVUUTgdpCXYkoNMgM+Zp9QO/nt8be58brDPBlRjV
 mrPjLNx1Q2W7QzNrtT0tlbOBrCKkD8G+ohM82FyH9DyaaIggW/ToBDiHR+cRJgKpc7gN
 OMKTL1PlXKGmH4o0knczvKLUkN/czBrMmQXV3OV3lsSX5ZH8FgDxAvCG2d0NJbeOkQWe
 mIn6beDZ9V9EgVrV3X6FysWgphUDZGO+Z8StSuwqaqIWrnBzrESvoRJV88OC1gRcDhLr
 LxUs17mny+7UP65aCae9TBpjAWIL1eVGXVow0V/yFjmhvPTaVyD0mdxejy8N6iswJvpE
 x+Gg==
X-Gm-Message-State: AOJu0Yw/u75sKIukhuBMAHi4Xx7yAOimfvWiYukcfMsyYTNNzd2/3dc/
 z72Tu3oBNV29mOgRRdqx2ImkRet/jlUO3JrkBNvIXKPv0NPUGDEn4gH/uNXJiL/d
X-Gm-Gg: AfdE7ckGnxCpZMlnL+LD6X68bd2yNGH/4Kk7AsA4/I6xVmJe719ki0z7gRu1p3svENJ
 2JUkfFrDOLdhbC4Pho3GsrNYaiifSARFheu1rjbl2L+ss4XbOH/AJG557e7kQBMs0l4JOx3As0j
 7JVrZ1pZETM7G74KypWgQhgeptH26gg4lRFxjz1Wd5UvF/N8jlDfhnzCXzk3b+nKb7qhGLcibUU
 oRINiKvziGx0y831yRikyrrG2qo+hCbcjbvZeR2Yx32vLWvitoaDnIGn+8/NxPlaSKwa96NLmjW
 ubI8k2ltRSvspacxdFSLEmboTA7r7ObiUQ45VyYqg2gNPy0QBZg3WxyCFRPnoHS+SUY14GRhGGr
 30j/aF5GtpR0Y33van5nFjj/jqP4XOnaxAmE/qw8t4IWmXtR3e0SkC0FGnxMDKxjQQUAxFJRTSW
 RRfEzxWIK5YGzmGZ23SrKuhqt6Zmq53KlX1cVR5Em8FJhb9FROKUldvEEGog==
X-Received: by 2002:a05:6a20:4304:b0:398:8870:b58f with SMTP id
 adf61e73a8af0-3c110762f82mr9320629637.14.1783942657459; 
 Mon, 13 Jul 2026 04:37:37 -0700 (PDT)
Received: from fedora.taildae27b.ts.net
 ([2409:40e5:11f0:8059:9b5:e8fe:ca6d:932b])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-313b9ca880fsm27730681eec.23.2026.07.13.04.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 04:37:36 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Mon, 13 Jul 2026 17:07:07 +0530
Message-ID: <20260713113710.1732927-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783942657; x=1784547457; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=69Vz4BPZXpNPsiNJzyrAlxuuQNwj4VLD02NqT6QBi5U=;
 b=cfUu19aNx0naYvwvMBAjc/O6h2dgHhG35SF51pb5dDAlpB5V22jMdGHV6wM0j5gpcw
 3WWExK9P+nM6fHjeLEzyscYBBwSbfQzVC6VMr7DSdjOzNT+PuJTiQmmHNKQMMk7cC/hv
 cgp2zBYUJPsWRphV/PaxaftPQrNTQUfcaLG+Z33M4cL1XPAV/T2u9jOr5XJ4s2RzfXON
 AiXATnuvdNWnQSdEWJbMz6XzXWTAzHp0lU6AFIX/gsaRQgp/rtnQ0OcSIBFI0xqPQyj8
 AYAfmKDlmlDxDkqNGzoEqCPRfNICQ0x0zoouc5iNrD5QINGH6N+MRkxTHTC7xDI+Ue0U
 GO8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=cfUu19aN
Subject: [Buildroot] [PATCH] package/unrar: bump to version 7.2.7
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

Upstream does not provide a per-release change log for the unrarsrc
tarball itself, only for WinRAR. Fixed from Repology/rarlab that
7.2.7 is the latest unrarsrc release available at:

 - https://www.rarlab.com/rar/unrarsrc-7.2.7.tar.gz
 - https://www.rarlab.com/WhatsNew.txt

While at it, mark CVE-2022-30333 as ignored, since it was already
fixed upstream in 6.1.2 and is falsely flagged by buildroot autobuilder for this
package.

Fixes CVE-2022-30333 (false positive, patched since 6.1.2/6.1.7).
 - https://nvd.nist.gov/vuln/detail/CVE-2022-30333
 - https://security-tracker.debian.org/tracker/CVE-2022-30333

Tested with:
 - utils/test-pkg -p unrar

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/unrar/unrar.hash | 2 +-
 package/unrar/unrar.mk   | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/unrar/unrar.hash b/package/unrar/unrar.hash
index 65dcab4464..8679c01adc 100644
--- a/package/unrar/unrar.hash
+++ b/package/unrar/unrar.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d1afa67ef4121ebc5986815699e05db0ce8648499e5dca854f282a4c3f72c003  unrarsrc-7.2.6.tar.gz
+sha256  01d903a7dcf413cb2925696d7796e48e38d471f79bfe7ef3ad2aebf6c12dbefd  unrarsrc-7.2.7.tar.gz
 sha256  6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a  license.txt
diff --git a/package/unrar/unrar.mk b/package/unrar/unrar.mk
index c829a2ebbb..5886fe480f 100644
--- a/package/unrar/unrar.mk
+++ b/package/unrar/unrar.mk
@@ -4,13 +4,16 @@
 #
 ################################################################################
 
-UNRAR_VERSION = 7.2.6
+UNRAR_VERSION = 7.2.7
 UNRAR_SOURCE = unrarsrc-$(UNRAR_VERSION).tar.gz
 UNRAR_SITE = https://www.rarlab.com/rar
 UNRAR_LICENSE = unrar
 UNRAR_LICENSE_FILES = license.txt
 UNRAR_CPE_ID_VENDOR = rarlab
 
+# CVE-2022-30333 was fixed in 6.1.2
+UNRAR_IGNORE_CVES += CVE-2022-30333
+
 define UNRAR_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) CXX="$(TARGET_CXX)" STRIP="/bin/true" \
 		CXXFLAGS="$(TARGET_CXXFLAGS) -pthread -std=c++11" \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
