Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949D7EE4992
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 20:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7D8E841B8;
	Fri, 18 Aug 2023 20:06:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7D8E841B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1-61LMPMyct0; Fri, 18 Aug 2023 20:06:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A44B4841B5;
	Fri, 18 Aug 2023 20:06:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A44B4841B5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD35F1BF31D
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 20:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95C38841AA
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 20:05:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95C38841AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DAwm8nfbxCK3 for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 20:05:53 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23780841AB
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 20:05:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23780841AB
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-522bd411679so1595517a12.0
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 13:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692389151; x=1692993951;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YkNCV83m7xiyiE9RlApK94LRByPVBYLxMVYl3O+f0ms=;
 b=ErHkaw1LJBPDJQYhoeY1HOrn44gjeIJXi1QGDUnLRc3FBraZRR1/vAm7j6B8zc3AiU
 NfdyrdMmTMSlIdh6dUcpAWuaH6/AFNGIotpUg/TmqsHfmzjoLY4cf/e/uFz7mUPDntw0
 SkGdfiOPE1jqkRRE0F5g/x3zdS7Da7ki0pP2WGDhO+CRKcndcROJPW75E8B1+lIbbBoc
 ltRcoof5nuHTL50DnAOcPBJupsdBtlHP121tkTH/ZJeFSGapPtGb+CSa+DIJ2mdvxsPU
 13MbPbqAxotb6xFTF+DXIAeiWJSFf2yvZYUbX1vyRvA6vS62u99wWE2WRemOVzyIjYO8
 oRtw==
X-Gm-Message-State: AOJu0YyhEvMm2JE+Oi/yN/zd7J3S2gNmgREBMcwYZxEy2llRClcmIVeo
 NvXBtF09uYuyawu1IU4FEtxmIw/7vIkTBvhM
X-Google-Smtp-Source: AGHT+IEjbFKOThwRu62oGfpeTBk4Gat1/fZ/ejKPWDuS++Ua6IcsMhAdHvlmr1T0LnDNPR6dUiislg==
X-Received: by 2002:aa7:d9cb:0:b0:523:22f6:e8a5 with SMTP id
 v11-20020aa7d9cb000000b0052322f6e8a5mr162127eds.39.1692389150993; 
 Fri, 18 Aug 2023 13:05:50 -0700 (PDT)
Received: from iamthediyvecomputer.. ([2a02:8440:5141:73:73d9:45c8:67dd:2f42])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a056402048900b0052540e85390sm1411062edv.43.2023.08.18.13.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 13:05:50 -0700 (PDT)
From: Clement Ramirez <ramirez.clement3@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 18 Aug 2023 22:05:28 +0200
Message-Id: <20230818200529.41913-2-ramirez.clement3@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230818200529.41913-1-ramirez.clement3@gmail.com>
References: <20230818200529.41913-1-ramirez.clement3@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692389151; x=1692993951;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YkNCV83m7xiyiE9RlApK94LRByPVBYLxMVYl3O+f0ms=;
 b=Fo23b1URxT+Wp4H0m/4k8rXVdzTLpOelSmNHx6im5mQAN8CV8yOC/ujWNjjlasL/AZ
 k7Mp5I/1ZJlgn50z3d6JOi21NRQn5AfX8A1BMTCIGjC3qCu52nkU4llUAg5Mp9AwOGT4
 u5Ge3C+ZXhBpbAbw6fnEmdz1XrcuSwVIZINXOw0/AA2UypGVWbWWwZoBfLLR1/Jksnkj
 I+IEmHimStncluUffMrPzJHKl+1wWjLYNpqLSomPaj+2gWpbZ1ioH60oyDACfp8QAE0h
 Qn26cKwgONwQJr++wmpJZDl6gpkw9pjMCEk669AnU6OS63cTqQQvfNB1LgAemrADn9Ir
 Py/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Fo23b1UR
Subject: [Buildroot] [PATCH 1/2] package/connman: fix CVE-2023-28488
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Clement Ramirez <ramirez.clement3@gmail.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

client.c in gdhcp in ConnMan through 1.41 could be used by
network-adjacent attackers (operating a crafted DHCP server) to cause a
stack-based buffer overflow and denial of service, terminating the
connman process.n process. (see [0] and [1] for details)

[0] https://nvd.nist.gov/vuln/detail/CVE-2023-28488
[1] https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=99e2c16ea1cced34a5dc450d76287a1c3e762138

Signed-off-by: Clement Ramirez <ramirez.clement3@gmail.com>
---
 .checkpackageignore                           |  1 +
 ...ify-and-sanitize-packet-length-first.patch | 62 +++++++++++++++++++
 package/connman/connman.mk                    |  3 +
 3 files changed, 66 insertions(+)
 create mode 100644 package/connman/0004-gdhcp-Verify-and-sanitize-packet-length-first.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index dfc1ba9001..54525e5d90 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -266,6 +266,7 @@ package/collectd/0001-src-netlink.c-remove-REG_NOERROR.patch Upstream
 package/connman/0001-gweb-Fix-OOB-write-in-received_data.patch Upstream
 package/connman/0002-wispr-Add-reference-counter-to-portal-context.patch Upstream
 package/connman/0003-wispr-Update-portal-context-references.patch Upstream
+package/connman/0004-gdhcp-Verify-and-sanitize-packet-length-first.patch Upstream
 package/connman/S45connman Variables
 package/copas/0001-Do-not-load-coxpcall-for-LuaJIT.patch Upstream
 package/coremark-pro/coremark-pro.sh.in Shellcheck
diff --git a/package/connman/0004-gdhcp-Verify-and-sanitize-packet-length-first.patch b/package/connman/0004-gdhcp-Verify-and-sanitize-packet-length-first.patch
new file mode 100644
index 0000000000..d5d81f17bf
--- /dev/null
+++ b/package/connman/0004-gdhcp-Verify-and-sanitize-packet-length-first.patch
@@ -0,0 +1,62 @@
+From 996d39df6f6c0f9d1e9968af8024bb0cde31d1e8 Mon Sep 17 00:00:00 2001
+From: Daniel Wagner <wagi@monom.org>
+Date: Tue, 11 Apr 2023 08:12:56 +0200
+Subject: gdhcp: Verify and sanitize packet length first
+
+Avoid overwriting the read packet length after the initial test. Thus
+move all the length checks which depends on the total length first
+and do not use the total lenght from the IP packet afterwards.
+
+Fixes CVE-2023-28488
+
+Reported by Polina Smirnova <moe.hwr@gmail.com>
+
+[Retrieved from:
+https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=99e2c16ea1cced34a5dc450d76287a1c3e762138]
+Signed-off-by: Clement Ramirez <ramirez.clement3@gmail.com>
+---
+ gdhcp/client.c | 16 +++++++++-------
+ 1 file changed, 9 insertions(+), 7 deletions(-)
+
+diff --git a/gdhcp/client.c b/gdhcp/client.c
+index 3016dfc2..28fa6066 100644
+--- a/gdhcp/client.c
++++ b/gdhcp/client.c
+@@ -1319,9 +1319,9 @@ static bool sanity_check(struct ip_udp_dhcp_packet *packet, int bytes)
+ static int dhcp_recv_l2_packet(struct dhcp_packet *dhcp_pkt, int fd,
+ 				struct sockaddr_in *dst_addr)
+ {
+-	int bytes;
+ 	struct ip_udp_dhcp_packet packet;
+ 	uint16_t check;
++	int bytes, tot_len;
+ 
+ 	memset(&packet, 0, sizeof(packet));
+ 
+@@ -1329,15 +1329,17 @@ static int dhcp_recv_l2_packet(struct dhcp_packet *dhcp_pkt, int fd,
+ 	if (bytes < 0)
+ 		return -1;
+ 
+-	if (bytes < (int) (sizeof(packet.ip) + sizeof(packet.udp)))
+-		return -1;
+-
+-	if (bytes < ntohs(packet.ip.tot_len))
++	tot_len = ntohs(packet.ip.tot_len);
++	if (bytes > tot_len) {
++		/* ignore any extra garbage bytes */
++		bytes = tot_len;
++	} else if (bytes < tot_len) {
+ 		/* packet is bigger than sizeof(packet), we did partial read */
+ 		return -1;
++	}
+ 
+-	/* ignore any extra garbage bytes */
+-	bytes = ntohs(packet.ip.tot_len);
++	if (bytes < (int) (sizeof(packet.ip) + sizeof(packet.udp)))
++		return -1;
+ 
+ 	if (!sanity_check(&packet, bytes))
+ 		return -1;
+-- 
+2.34.1
+
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index fbd7318e4e..40ce99fa40 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -20,6 +20,9 @@ CONNMAN_IGNORE_CVES += CVE-2022-32292
 # 0003-wispr-Update-portal-context-references.patch
 CONNMAN_IGNORE_CVES += CVE-2022-32293
 
+# 0004-gdhcp-Verify-and-sanitize-packet-length-first.patch
+CONNMAN_IGNORE_CVES += CVE-2023-28488
+
 CONNMAN_CONF_OPTS = --with-dbusconfdir=/etc
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
