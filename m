Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C87EC3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 15:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A25D34058B;
	Tue, 20 Aug 2024 15:44:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4JK_dzrwzN1V; Tue, 20 Aug 2024 15:44:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 704CF405C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 704CF405C2;
	Tue, 20 Aug 2024 15:44:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D7C81BF345
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 15:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 177CD408FC
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 15:44:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xe7dne4D1aCr for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 15:44:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 28A934048D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28A934048D
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 28A934048D
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 15:44:30 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id DEA143536A70; Tue, 20 Aug 2024 17:44:27 +0200 (CEST)
Date: Tue, 20 Aug 2024 17:44:27 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZsS52zTjT0Ca9twG@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724168667; bh=YgP5RrPvtTU3ywaPsWFgnFlFciNtyqO4b2odyVb59xY=;
 h=Date:From:To:Cc:Subject:From;
 b=ukwFUQMZnLBFyFgzhdVwwfOqdIbHV/Ien/TPSg9oa1HbHxt301kXqmdOf+thOFhM8
 ru2jmlDogjJ5bhs8uCvpRjRuY4GB4JJ+BRQOhVhVnP6u3FzYwXQUv0QZFh9Dl/ReS1
 mOYqjIz5xp6DOhOJVQx92+WXGccDqOBLZe+OR4wfCLSmQ58QhmjKsOyBtULGAY4loq
 tY6ZC9/lkZsti/Rwxi+kgbuRC5Ks8jOJDpO899g5KiZtR8aYls0qpqAH3w0FhNQ0oU
 MYaHzoclSKSG1bm75rhvlszw/joAPolbu06nlCYPUSXzgrldYhnGuXwruyomlFaprH
 0wA5wZ3sgZ4mA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=ukwFUQMZ
Subject: [Buildroot] [PATCH] package/docker-engine: fix runtime problem
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
Cc: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When starting a container you get:
# docker run nginx
docker0: port 1(veth7743781) entered blocking state
docker0: port 1(veth7743781) entered disabled state
veth7743781: entered allmulticast mode
veth7743781: entered promiscuous mode
docker0: port 1(veth7743781) entered disabled state
veth7743781 (unregistering): left allmulticast mode
veth7743781 (unregistering): left promiscuous mode
docker0: port 1(veth7743781) entered disabled state
docker: Error response from daemon: failed to create task for
container: failed to create shim task: OCI runtime create failed:
error opening file `/proc/self/uid_map`: No such file or directory: unknown.

Add the missing kernel module to allow starting containers.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/docker-engine/docker-engine.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 268b851520..baec32d79d 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -106,6 +106,7 @@ define DOCKER_ENGINE_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_DEVICE)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_CPUACCT)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NAMESPACES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USER_NS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_UTS_NS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IPC_NS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_PID_NS)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
