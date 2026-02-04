Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49960E9D3FB
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 15:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12B1F605A3;
	Wed,  4 Feb 2026 15:35:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zKNibTfpf3eI; Wed,  4 Feb 2026 15:35:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12AAB6060C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770219333;
	bh=jHCFDZEuF4a/f3cp3byY8C+oWcZoY1XgRzrH7Ja0rpg=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EOTT8O/lxOXc9fQ4RHB5nPN1K1MWV8pWDwfM/yETw48ND6AXIPLMeXwnMighVtDBj
	 LYxqY0ydK9Eb2R5hv26II7OUIHchwLASWeBk78LAkJh6ZtzkroXHjwY8QSEk3I0xnV
	 eLBHv5izRSmwXe0bn/VjL//bXHgw2TpDiplQZonbTXzDTyZPexekEuBBFVBcVcuskS
	 19+44TNAQO0NM+34vxJOA6VY/bONY/4ksO1Y7P1648ds8kwAw3LMLFMKLeRhifaJhh
	 ACzObE3rz/9V664jz273ZIUBoj8W/Va7ypQ2IHGX8+b5TOpkAC9K3PpR/HT5KhoKFH
	 8Gshzw0Z4L9wQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12AAB6060C;
	Wed,  4 Feb 2026 15:35:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F457F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FCA482865
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:35:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XfVmfXRsZpVQ for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 15:35:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2BD8E82331
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BD8E82331
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2BD8E82331
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:35:29 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id E152E31E0BBD; Wed, 04 Feb 2026 16:35:27 +0100 (CET)
Date: Wed, 4 Feb 2026 16:35:27 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aYNnP1uFAqo1fta0@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1770219327; bh=Oiy20lZe9lWAYhfbvcdRhnb3cYNlxkNSjg/zmo7rH28=;
 h=Date:From:To:Subject:From;
 b=CyfuQrzwGJ6hpW+GUeFedu7mHqw4XC+GbEFa3kBLNAfQuaPghJVgv8TJLEi50Y6Gt
 v4deXRgDsbGjlmdftkgHzrro1ry21L6HJwKBTcaZmAUc6u7zvlwxVB2IyA+cOLIQMI
 SDzQ+pCxj/IKt4D18KcJsT/YVulVWntPftkU0VFHjBSke8ChyA6IaF0KhMQOEvqTHD
 pOiV+OAEgki8x6ALn0Kkec+byqy9sVT06ZdGfb2Q59NMc8ao/f65abKRHnjI/IF3JM
 bbEnnhKLNrgqcH+WayXnkYAL/LpTrDB1iHzyk9Mxw58zyqUZbqa1kP3k94fSIgYMdR
 zm0Lb25eNxvFg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH v3 2/2] package/strongswan: add Linux kernel
 options
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

See here for options required by Strongswan to work properly:
https://docs.strongswan.org/docs/latest/install/kernelModules.html

We only enable a subset, which is the bare minimum to start
charon IKEv2 daemon. For advanced users this might be not enough.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/strongswan/strongswan.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 63ebd275e3..1e9e96367f 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -114,4 +114,16 @@ STRONGSWAN_CONF_OPTS += \
 	--disable-connmark \
 	--disable-forecast
 
+# bare minimum to start charon
+define STRONGSWAN_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETLINK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INET_AH)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INET_ESP)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_XFRM)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_XFRM_USER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_XFRM_INTERFACE)
+endef
+
 $(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
