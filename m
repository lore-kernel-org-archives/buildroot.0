Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1F6CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 21:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D4BF60BD7;
	Fri, 29 May 2026 21:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y1V6voB_k421; Fri, 29 May 2026 21:36:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 372C661B38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780090617;
	bh=2jfbKw7Scf2TIFbzrKxn/b/09TYtwo9P1tzpyXOe4b0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i+9TMiKCyrOyx9mKxR6JzqI2BMlSasId8gqUsrtyBiSmLorNJRZ3muPD4gXsZ3CfK
	 gUdmOXRaPvZ7eMP37KhVSR2gBgXifw5vZLSy337IdQNQgEvvck/rePX2oC8Y1FVAC4
	 6QvdMst/L5cfUMJYX4Qnyt7Xmbp53Lz5ahhOARBHDDnySdFr6W9h3C+bjr71Mvahn9
	 cbG6TYU/hdc8aD0FTC0cSevq370NdweIvLBEGxySl96hIYNiwlgaJdG2Icw1H7S8cC
	 yp1qwVOnxVW9NeOlJqPGBdfP8gxEvir0AHsTlVmxqmN+AAKIc2DjXWEQS3v6jcV4M1
	 Wy+Yn6Rzo5uSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 372C661B38;
	Fri, 29 May 2026 21:36:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B449288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BF5A84A66
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:36:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XlVKCf-TJCn1 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 21:36:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 737FC84A65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 737FC84A65
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 737FC84A65
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:36:55 +0000 (UTC)
Received: from bubutux.localdomain (82-65-127-30.subs.proxad.net
 [82.65.127.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 2CBFE2C8911A;
 Fri, 29 May 2026 23:36:53 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 23:36:47 +0200
Message-ID: <20260529213651.548156-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1780090613; bh=lt7BP1m56QUX4v56ZhgaKsGHvDu8qxSw1tenyx+YFbQ=;
 h=From:To:Cc:Subject:Date;
 b=jRmVXrfGEnRudji3dx3ti+2mpI9rECpP8LebYwQytpaxPQ/TKxhkeca58czyIXUgg
 5rX94NgLXMzdgVvAij4xdH+/KgyJEtPuX3IiDeuSGDxUiW5XI4vxfVnFJGiOamw/M9
 EL9Zxo5Zxq5byvWuu1XSctMimYnCFQObnDLXWNvwMPzXIPkN2sgb77ozGNvCH5tG1f
 rWYjAK9s8YyPKyM/X/IfjxLVmmSJuJ9ntwl6zfSFHFb4G+c0hazUQ+uEEQRie1WiuN
 4/HwV+if2av8lHtZ9Ho1rPCmiT0+YOLgV+zKng/OKAHdur6eF0d+yrp7cCBJcyLJMk
 Ub0ZvCJb/RCjw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=jRmVXrfG
Subject: [Buildroot] [next 1/2] package/pkg-download: add pypi helper for
 downloading packages from pypi.org
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pypi provides packages under a stable url (instead of the hash based one
that changes every version) but we don't currently make use of that a lot.

Introduce a pypi helper function analougous to the github and gitlab
helpers to make it easier to download packages from pypi using this url
scheme.

For that we introduce a firstchar function (written by Peter) which
returns the first character in a string without spawning a shell.

Co-developed-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/pkg-download.mk | 3 +++
 support/misc/utils.mk   | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index ce63ce9658..160c512599 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -56,6 +56,9 @@ github = https://github.com/$(1)/$(2)/archive/$(3)
 # gitlab(user,package,version): returns site of Gitlab-generated tarball
 gitlab = https://gitlab.com/$(1)/$(2)/-/archive/$(3)
 
+# pypi(package): returns site of pypi.org hosted packge
+pypi = https://files.pythonhosted.org/packages/source/$(call firstchar,$(1))/$(1)
+
 # Expressly do not check hashes for those files
 BR_NO_CHECK_HASH_FOR =
 
diff --git a/support/misc/utils.mk b/support/misc/utils.mk
index 5275006d6d..3caf06274f 100644
--- a/support/misc/utils.mk
+++ b/support/misc/utils.mk
@@ -62,6 +62,9 @@ endef
 $(eval $(call caseconvert-helper,UPPERCASE,$(join $(addsuffix :,$([FROM])),$([TO]))))
 $(eval $(call caseconvert-helper,LOWERCASE,$(join $(addsuffix :,$([TO])),$([FROM]))))
 
+# extracts the first character of a string
+firstchar = $(if $(1),$(strip $(foreach c,$([FROM]) / $([TO]),$(if $(patsubst $(c)%,,$(1)),,$(c)))))
+
 # Reverse the orders of words in a list. Again, inspired by the gmsl
 # 'reverse' macro.
 reverse = $(if $(1),$(call reverse,$(wordlist 2,$(words $(1)),$(1))) $(firstword $(1)))
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
