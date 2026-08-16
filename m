Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18EFC5B572
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 09:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 643E980DDF;
	Sun, 16 Aug 2026 09:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IK3GMOwAn3dV; Sun, 16 Aug 2026 09:24:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F30B80D97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786872285;
	bh=6O4kk9+HiJGEfkJYiC75DN0oTtYde/ig20oFEC7oVDM=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eV8nlIyalOg/0Q4gvxq/YrDlvu1P+JRoIT9tlAHxk2+oonsXSfXXaSt+Enu2VYuxs
	 qjVtryZZKVF0lX7XD4shWMh+IsZkPBNUwA7F9/PU2MdLA77pcDT4lzhJmkX6+bD4a3
	 ZeQ6pwxUY0+WAnKwGRVE1zJYIY0XDKGIuCt5qg4pRVrO/CoUwnYTtc/XqLsE2KT0K6
	 mrVm+DJnnFVEHKNiVUlNsAMEyXvYh8eYFRn9QgFETF6AwSByR0VpHg1ToQr7BskmWZ
	 wVf2QMfHxcpQsW6cj1PS51oEJUA8k5bp1580mfjjMHUY7ZNO7I60+10VWVtPQvspVW
	 5L6wyHVUTgn8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F30B80D97;
	Sun, 16 Aug 2026 09:24:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DBA6F33B
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 09:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD01940742
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 09:24:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xa4fgOTE8okz for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 09:24:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D1E224073D
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1E224073D
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D1E224073D
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 09:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1786872280; bh=H5Hvu0KU1u+XLJaCtp96aWHDE6tiXl5mGlRUiOL+Apk=;
 h=Date:From:To:Subject:From;
 b=GNqZLzG/ZX0+qO9VSB1bkHJu+1ydn6G9c2n8h6NgfwCY72FAATobTvrhR0zwQTQXJ
 L25FlP4C748vNlOU6yyH+bQQ9QtZegRJg0oxage0Z6H/NWj8pAqGNw2dHmDpHveZUI
 mImH0uJiraW9qUAgtnuMAF3XJt9uKf/GUecNwZ86SIHCnxcy1HslFl6Ryge4P97cdW
 rgepom0CGFajBhtXnF2gVpy4vN7G0u1VbEtsLbG/C1lpvsVwmgIrqd1pcoUzo0jmKF
 Z9NUWsLnvtRowwxhjOTiwJzDNA7Ildj246eEXxQ8ETiw4hT+flIRZmN9naXsBBIV4B
 PQ+YmgRtIQLSw==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 7445531E0AF6; Sun, 16 Aug 2026 11:24:40 +0200 (CEST)
Date: Sun, 16 Aug 2026 11:24:40 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aoGB2EKYfAEH5N8t@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.96+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH] package/uclibc: enable FENV support
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

Enable FENV support unconditionally when a hard-float toolchain is in use.
Useful for packages as quickjs and chawan.
Adds 24kb to the C library on aarch64.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc/uclibc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 0cee106014..c19328e87a 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -286,6 +286,7 @@ else
 define UCLIBC_FLOAT_CONFIG
 	$(call KCONFIG_ENABLE_OPT,UCLIBC_HAS_FPU)
 	$(call KCONFIG_ENABLE_OPT,UCLIBC_HAS_FLOATS)
+	$(call KCONFIG_ENABLE_OPT,UCLIBC_HAS_FENV)
 endef
 endif
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
