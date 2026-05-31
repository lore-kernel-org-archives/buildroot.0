Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F48BCD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 11:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E125784D8A;
	Sun, 31 May 2026 11:55:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e7MjkZ9g5PTR; Sun, 31 May 2026 11:55:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D336384D61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780228513;
	bh=F3Id0AVk5uk9GvDHwsA1Tl5Em069yL+CKOc/ykoQBwc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oaZ8LmZZQFqMDoSymYVlEj1KhBQttJan2mflCajv6T6FAcF9IVgPSGAZpSPoyhx3A
	 szS34oF2D7/iguTXKbjRTwZnGL9LYU20a8lH3Jv0ylpOKSKDawAqunLCL7s6xCGcDV
	 bmk5wFDr/57dXqPfw8+Hs8/gcgUqfMBjQYqmheO5wjD9CXo3rcV2Wf9wgCIOil0Cqe
	 5xZLVGqYGTttluUB47HjDtNrMkA8IvPc0eULCcj2wQzhPIUSSssGwUuZsRC56RSD7G
	 /9h7+k2bURfEHq+f907MgTMhoCFS0CcpUIorv3SfWha0yRtrQBRoYv5fqnBKsaf649
	 t4GmwSwvESpUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D336384D61;
	Sun, 31 May 2026 11:55:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EE605F4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 11:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE19340567
 for <buildroot@buildroot.org>; Sun, 31 May 2026 11:55:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4lzC2_1q9CpS for <buildroot@buildroot.org>;
 Sun, 31 May 2026 11:55:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C6A15402D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6A15402D4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C6A15402D4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 11:55:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A5ABB4E42DB6
 for <buildroot@buildroot.org>; Sun, 31 May 2026 11:55:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6362460230;
 Sun, 31 May 2026 11:55:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E129210888CC7; 
 Sun, 31 May 2026 13:55:05 +0200 (CEST)
Date: Sun, 31 May 2026 13:55:04 +0200
To: Dowan Gullient <dowan.gullient@smile.fr>
Cc: buildroot@buildroot.org, ju.o@free.fr
Message-ID: <ahwg3kKssLZqpjtc@windsurf>
References: <20260505100553.4100688-1-dowan.gullient@smile.fr>
 <20260505100553.4100688-3-dowan.gullient@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260505100553.4100688-3-dowan.gullient@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780228506; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=gYxe5OSJgoH6eel8191J5tjjJZJNOlhC7GzOTf86AHk=;
 b=GEuBmWV55rbBgIEueGW65Ygscz3g8j4uRf7e7vd4OKsvCZ+upizL5Ft9+wwfJY9t4wambM
 kuYJt4g4x3mywmbrml9xso9DDSV4WRW5G8do6UlB9F06gt71rq0H+evfnldP6Qmze8dHO9
 4jK/vXA9XCYdeJJZkjwLRowYBZRIhV+Ot0esb1d8pbCRne8KmJrGLJpISbDB0Sf+YKyGHC
 30wOwMgUuLljTUYmsdKS8T7BPJjSyD0UWlCFxzLeyqz+IwRb0uV9fZmfdtvXGm6ihYNrup
 5J4EDZt6MhmVAm1oKrg33qTzYJC0R1UX/NiiV+Z9UzL2RfpY47ysNh0uHL+PHA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=GEuBmWV5
Subject: Re: [Buildroot] [PATCH v2 2/2] support/testing: test_podman.py :
 add kernel fragment to fix iptables errors
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Dowan,

Thanks a lot for your patch! I have some comments below.

On Tue, May 05, 2026 at 12:05:53PM +0200, Dowan Gullient via buildroot wrote:
> This patch bumps the kernel version and adds a Linux kernel fragment for Podman tests to resolve
> "Protocol not supported" and "Table does not exist" errors when using iptables-based
> networking which appeared due to the bump of the kernel version (5.10->6.18)
> Indeed, the new kernel version requires additional configuration options due to the switch to
> nftables, and to support Podman's networking features, especially when using iptables-based networking.

Could you wrap your commit log at 80 columns?

> Justifications:
> 
>     NFT_COMPAT & XTABLES_LEGACY: On modern kernels (6.x+), iptables often defaults
>     to the nft binary. CONFIG_NFT_COMPAT is strictly required for the iptables userspace

I'm afraid I don't understand "On modern kernels (6.x+), iptables
often defaults to the nft binary". Both iptables and nft and
user-space executables, so it doesn't really make sense to talk about
"On modern kernels...". Could this be clarified.

>     tool to communicate with the nf_tables kernel subsystem. [1]
>     Without CONFIG_IP_NF_IPTABLES_LEGACY, legacy calls from Netavark/CNI plugins fail.
> 
>     NET_NS & NAMESPACES: Podman relies on Network Namespaces for container isolation.
>     Without CONFIG_NET_NS, the kernel cannot create the private network stacks required for containers.
> 
>     NAT & MASQUERADE: Containers require Source NAT (Masquerade) to access external networks.
>     CONFIG_IP_NF_NAT and CONFIG_IP_NF_TARGET_MASQUERADE provide the necessary target modules
>     for these iptables rules. [1]
> 
>     XT_MATCH Modules: Netavark (Podman's default network stack) uses specific matches like
>     addrtype, conntrack, and comment to manage bridge traffic and port forwarding.
> 
> Some dependencies in the configuration file were verified by the check-config script from the Moby project [2].

Now, the more fundamental question is: if these kernel options are
needed for podman to even work, then we should update:

define PODMAN_LINUX_CONFIG_FIXUPS
        $(call KCONFIG_ENABLE_OPT,CONFIG_CPUSETS)
        $(call KCONFIG_ENABLE_OPT,CONFIG_BPF_SYSCALL)
        $(call KCONFIG_ENABLE_OPT,CONFIG_POSIX_MQUEUE)
        $(call KCONFIG_ENABLE_OPT,CONFIG_MEMCG)
        $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS)
        $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_SCHED)
        $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_FREEZER)
        $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_DEVICE)
        $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_CPUACCT)
        $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_PIDS)
        $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_BPF)
        $(call KCONFIG_ENABLE_OPT,CONFIG_NAMESPACES)
        $(call KCONFIG_ENABLE_OPT,CONFIG_UTS_NS)
        $(call KCONFIG_ENABLE_OPT,CONFIG_IPC_NS)
        $(call KCONFIG_ENABLE_OPT,CONFIG_PID_NS)
        $(call KCONFIG_ENABLE_OPT,CONFIG_USER_NS)
        $(call KCONFIG_ENABLE_OPT,CONFIG_NET_NS)
        $(call KCONFIG_ENABLE_OPT,CONFIG_SECCOMP)
        $(call KCONFIG_ENABLE_OPT,CONFIG_OVERLAY_FS)
        $(call KCONFIG_ENABLE_OPT,CONFIG_KEYS)
        $(PODMAN_LINUX_CONFIG_FIXUPS_BTRFS)
endef

with more configuration options. Indeed your commit is fixing the test
but it's not actually improving the situation for real users of our
podman package.

Of course, we really want PODMAN_LINUX_CONFIG_FIXUPS to only enable
options that are strictly needed for podman to work. If some options
are only needed in some unusual cases, we don't want them to be
enabled by PODMAN_LINUX_CONFIG_FIXUPS.

Could you have a look into this?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
