Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0737C531DF
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 09:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7787E40582;
	Tue, 20 Aug 2024 09:45:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bnuu8qh7PBsR; Tue, 20 Aug 2024 09:45:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 328F540584
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 328F540584;
	Tue, 20 Aug 2024 09:45:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C1FB51BF32C
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 09:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB63C40568
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 09:45:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 36oAzqfnT9XH for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 09:45:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0CF1740582
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CF1740582
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0CF1740582
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 09:45:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B8F71C0004;
 Tue, 20 Aug 2024 09:45:02 +0000 (UTC)
Date: Tue, 20 Aug 2024 11:45:01 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240820114501.185c9857@windsurf>
In-Reply-To: <ZsReNU/ELx70PBm1@waldemar-brodkorb.de>
References: <ZsReNU/ELx70PBm1@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724147103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5zcOwnoeFfIlde9OOOuivb0dlNGYffP7g5HO4Rt4Hj8=;
 b=SG8NpONjMP5IAjS2wvttCI3EB8bIDynyeohuThPecDSQA2W9LBCDcOqcDhZCcavZc9q8o9
 EbHefu4ElfcELtw7ESIcnM3yifQVFPUN7rGTUVT4uBDXt31W7nc0wboxl/ftB7f2Dtby+k
 PHzxCCEd+E5JSZIUduTlPIFQVo7uhMRhrScb7nlicSn6xajBrXrNAdVCJFZhQC+7BTeKHq
 prCXk9YrmTha8VQO+8YKg4HtfY4Zkbd6JX8jIHkZwfE8efzFiRnigraNKWBhqkm1VhPAbX
 llRfuIIWXE9f3lzBobeS/xR46snqdp/j6DhURFU3MYi0OcuaYKhs1k6YLAdH9Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SG8NpONj
Subject: Re: [Buildroot] docker package in buildroot
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, 20 Aug 2024 11:13:25 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> I would like to test Docker (docker-engine) in Buildroot.
> 
> When starting a container I get:
> # docker run nginx
> docker0: port 1(veth7743781) entered blocking state
> docker0: port 1(veth7743781) entered disabled state
> veth7743781: entered allmulticast mode
> veth7743781: entered promiscuous mode
> docker0: port 1(veth7743781) entered disabled state
> veth7743781 (unregistering): left allmulticast mode
> veth7743781 (unregistering): left promiscuous mode
> docker0: port 1(veth7743781) entered disabled state
> docker: Error response from daemon: failed to create task for
> container: failed to create shim task: OCI runtime create failed:
> error opening file `/proc/self/uid_map`: No such file or directory:
> unknown.
> 
> It is inside Qemu aarch64 system with glibc.

Quick question: did you build your kernel with Buildroot, or
separately? If you built it with Buildroot, did you build it with
Docker already enabled?

Indeed the docker-engine package enables a shitload of kernel options:

define DOCKER_ENGINE_LINUX_CONFIG_FIXUPS
        $(call KCONFIG_ENABLE_OPT,CONFIG_POSIX_MQUEUE)
        $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS)
        $(call KCONFIG_ENABLE_OPT,CONFIG_MEMCG)
        $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_SCHED)
        $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_FREEZER)
        $(call KCONFIG_ENABLE_OPT,CONFIG_CPUSETS)
        $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_DEVICE)
        $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_CPUACCT)
        $(call KCONFIG_ENABLE_OPT,CONFIG_NAMESPACES)
        $(call KCONFIG_ENABLE_OPT,CONFIG_UTS_NS)
        $(call KCONFIG_ENABLE_OPT,CONFIG_IPC_NS)
        $(call KCONFIG_ENABLE_OPT,CONFIG_PID_NS)
        $(call KCONFIG_ENABLE_OPT,CONFIG_NET_NS)
        $(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER)
        $(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_ADVANCED)
        $(call KCONFIG_ENABLE_OPT,CONFIG_BRIDGE_NETFILTER)
        $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK)
        $(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES)
        $(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_ADDRTYPE)
        $(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_CONNTRACK)
        $(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_IPVS)
        $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES)
        $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER)
        $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_NAT)
        $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_MASQUERADE)
        $(call KCONFIG_ENABLE_OPT,CONFIG_BRIDGE)
        $(call KCONFIG_ENABLE_OPT,CONFIG_NET_CORE)
        $(call KCONFIG_ENABLE_OPT,CONFIG_VETH)
        $(call KCONFIG_ENABLE_OPT,CONFIG_OVERLAY_FS)
        $(call KCONFIG_ENABLE_OPT,CONFIG_KEYS)
        $(DOCKER_ENGINE_DRIVER_BTRFS_LINUX_CONFIG_FIXUPS)
        $(DOCKER_ENGINE_DRIVER_DM_LINUX_CONFIG_FIXUPS)
endef

Maybe some are missing? :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
