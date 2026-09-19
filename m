Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8022BC982CC
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 07:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0586781210;
	Sat, 19 Sep 2026 07:51:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0U7_-Q1bQnPP; Sat, 19 Sep 2026 07:51:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1E69D81204
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789804313;
	b=DrmE8JedWiPBTJy9DabKfTRBpeBze6xd3kNkAFYn+zcbKyXWe8yAplGikZeNIeeAr3HD
	 9aPNXbypxHhGKmpOJQpGLAQs5uyQQrW83CPtiCMuMlbZWRq804128136lBxIyDcToKtYK
	 FDFqO3+q1vQPTaN814PxXg1tFXVyRjyUMJwyy3tVSu1eTl66nSRZyvIBTikhzfuTAiAk4
	 9lb+U79FPjzvwf3pa0cT07chjDovVOFBALjH48bgczlUJT5r1b16w4dPDq+I3retRSNHH
	 UXscU42/fZps128RcNYqhLB49KygIdJvs7p0CK0jcMqOe9LTf2FaQk3Vf06+4PgjEvw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789804313;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:MIME-Version:
	 Content-Disposition:X-Operating-System:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=t06zoOhKItFjv6XZqAL7OUJotXC3l4SNxDkcYslTWB8=;
	b=ot+o6neqEiYbGm4RoIwsKMGU6D3ux2DwELhJ8RYwBLxHvDxibXF911gHDKkK0POXneih
	 HeMSc5qwRh1C6z6wSI8uwG1HiP8JAe/wPWSmGVo1JElMo/M8zDEA0TaWQPAE9wqTXjwud
	 t0IVVAVKsrThg2m0gsxREkv6FOD2mJTMdQkLNWGusR4Wyc8Ug0Pj9iT5olzn3SwJJEzNb
	 Ooeg842CGZDgef8eSop7+EW8goKzViC2j7R3l6uGmZeapYcv/5D5WLRwwH668xHO2sxFO
	 jtka07SXrliBjAq5YihzQFan+n8hFKYeoUVKhQOJ9nwfsow0fC8CGdTDiFanF8a0jGQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789804313;
	bh=t06zoOhKItFjv6XZqAL7OUJotXC3l4SNxDkcYslTWB8=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f0R1N/ggFx62eg5LRB4qhnuRoj7ooNBfx0Nr4FZR1Y9CK40lcpUb3T3FV8xeBZ4Xt
	 pPTKhu9ng83TKl5kCCmiCTRTjjP7lbxMYR6asEF14sUtDCGJOFzvE9gGGukW76obRA
	 ykuB4kdk+Zr81kJHtG2NbdyQGmiKy00mdbUM++V8Ng1ezT2ZsCOk6hRWbsiCQYn/Mi
	 idLwMd7ZQry2HXO9hv8FaxInLRq1de6PXDS4kTpxp/pxvBsAi4p65Mo0+pfU+f0gvB
	 hCyMOd43wj5F/QcTHt8AyAv2hKww+e9Oh3r13++P0YIWIJwLjJ23VI1nU6Fac3rDAW
	 n4eNSyznLpgSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E69D81204;
	Sat, 19 Sep 2026 07:51:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 038BF362
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 07:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E96A940B5A
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 07:51:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fv8aRR-2AEh8 for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 07:51:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E460540B43
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789804311;
 b=n+jkdUhicAABgWpod/hwiDXMrPUIU+QlxJerM4X7m8n+sCIv4K54hXvw2GGAW6HTrkal
 v8DdeB3RzqTjal8Bwkkifr+lnyikGml5XEgJad1L1sr/s/QCt0ORbMQC1gF/9F8Os3He7
 3TdWtgaFa4NK5XmgjUSN4C7PS51vvIagCQEZgY1jNNcdLsxo7AesePqLS+FaJljgzkfbR
 vHNgPR+yojmCNwwAxLrzOiTrgYZfBYkp/WWO/UFYOQoqCaXCa1ZKyyTgn6EYImBolC+hX
 l/erfwE9cl9ZHpve+PkJHuSK/OkaIL0aJBewQ1Y8+hl1u9EGGD9BlYY7QPNUHW23Mjw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789804311;
 h=Received-SPF:DKIM-Signature:Received:Date:From:To:Subject:Message-ID:
 MIME-Version:Content-Type:Content-Disposition:X-Operating-System;
 bh=b8ktAjhldHJGt9JWMqZqlPR8ldgZoAbbti0Hk4TshFk=;
 b=oSitz6Ki2ajNLet15qiuE/vyNyuHrktHL5zGcyGs0gKCKfmbVMhuoeh5u9khNTzhvL+z
 73Z+9KJJ5cqh3YXAT78WWfeByy80BrS+9uFNCh8vYs9ijrF6Nj/6+qmbPJmRjgcynA+r/
 BVZyY3tllz51/YCQSVErlWnjZOT7JQD7maZiYJ3n0a0n235UPlBlD9l73eix3NH+LRBgJ
 LsVGvDniAUYwn0zjnaGVdzBliUhK8MHsy5oOGZI2nXbZghQ8nmXJJvuznlXYq4NLcf3K8
 FzfK/91GyI4x/lGBikSJYjaz2ADBnQmDDMsrC/egQ18cWMgUl8TOoFVNxDyGYYqMa+Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=none header.from=openadk.org; 
 arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E460540B43
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 07:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1789804307; bh=6Jt0aJ5/PtqstCNNDvAb7aSTTCe8SFtLL0v0tLDc2f4=;
 h=Date:From:To:Subject:From;
 b=PJA+AOIitox1dOLf2csorLK1zRnGHQ0Y3/aqSN7o5S4n/RFKoupXTqKVbFc2ALM/3
 a8C/8Ax2EEIydgz5WP+iKTz01aWuXr6xeOS1fu6PCkSa+zlagTV4UnfArGc9uKK7hD
 nH2a7vWOM56AvEcdgTkZXCc9aiUAwZsyFf9WgSWDssIeLNJmwamDkj380t4T4HKbjN
 gyoMmQokIAbrwLaoMszdMtrnusTGHJ53HATIZj0JphfG6lAco9/EQpj5MOSuTJolsP
 t7dTI7CqEEnyf9FVkfWnB57vPcnNxL99IOh8FlfI6KHHCuyUNEwHp0tFGRLL1oc4qA
 oLgKJrndv3lVA==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 67EDD31E0646; Sat, 19 Sep 2026 09:51:47 +0200 (CEST)
Date: Sat, 19 Sep 2026 09:51:47 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aq4_E7df6qI8WnH4@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.107+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH 1/2] package/nim: new package
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

Nim is a statically typed compiled systems programming language. It
combines successful concepts from mature languages like Python, Ada and
Modula. See https://nim-lang.org/ for more information.

This is a host-only package required for the new chawan package.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1->v2:
  - remove extra parenthesis (suggested by Thomas Petazzoni)
---
 DEVELOPERS           |  1 +
 package/nim/nim.hash |  3 +++
 package/nim/nim.mk   | 22 ++++++++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/nim/nim.hash
 create mode 100644 package/nim/nim.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 51b939542d..520e2a836d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3472,6 +3472,7 @@ F:	package/evilwm/
 F:	package/fbv/
 F:	package/libpam-pkcs11/
 F:	package/mksh/
+F:	package/nim/
 F:	package/perl-cgi/
 F:	package/perl-cgi-session/
 F:	package/perl-log-message/
diff --git a/package/nim/nim.hash b/package/nim/nim.hash
new file mode 100644
index 0000000000..c455ab91a9
--- /dev/null
+++ b/package/nim/nim.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  2639a06a5ea7a7fcf57df1e7e1ef4d1b2bee58c7ac9bd00dbd2aa5bea1e5a56a  nim-2.2.12.tar.xz
+sha256  1ef33f7376a2e4b4c090fcaa42d8a206c19bc70d8d816665ff983bc14c5fe159  copying.txt
diff --git a/package/nim/nim.mk b/package/nim/nim.mk
new file mode 100644
index 0000000000..861f9249d4
--- /dev/null
+++ b/package/nim/nim.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# nim
+#
+################################################################################
+
+NIM_VERSION = 2.2.12
+NIM_SITE = https://github.com/nim-lang/nightlies/releases/download/2026-09-08-version-2-2-8e8fbf60693418dc95bb0d762fd660231d08a583/
+NIM_SOURCE = nim-$(NIM_VERSION).tar.xz
+NIM_LICENSE = MIT
+NIM_LICENSE_FILES = copying.txt
+
+define HOST_NIM_BUILD_CMDS
+	$(HOST_MAKE_ENV) cd $(@D) && ./build.sh
+endef
+
+define HOST_NIM_INSTALL_CMDS
+	cp $(@D)/bin/nim $(HOST_DIR)/bin
+	cp -dpfr $(@D)/lib/* $(HOST_DIR)/lib
+endef
+
+$(eval $(host-generic-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
