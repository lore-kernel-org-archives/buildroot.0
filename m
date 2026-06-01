Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C31BCD5BD1
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 07:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCF724262A;
	Mon,  1 Jun 2026 07:25:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IbBeb20WSXTm; Mon,  1 Jun 2026 07:25:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6D7E42ABC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780298749;
	bh=oIHGUD49VJ3T08e4/2YwYFDqi7ofEHEI3Ds3WtGIefI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=m6XjqrW60r6/EBmShkVO1WX5DMCoOtyFIYVALgdMPsC93rzCC03Dqt5shWpJENbGO
	 GocOEzvbJv4lLWRDHM9/q/lW6du2pmwiTA+qNctxwla8TGVQGhMUF9CfZa046gEwSk
	 qZHK42FoxRYuzToipuQV2QFzXSkScVBdoi/jmzk7e4ponX656qzI7EyitU18ouYdQd
	 Ktw7b2tcAbOWdeOe8TPKhfbqQIyUZ31TKmTtd9ovvwa2ZB+aNtjb3M3E01iAoPfeIz
	 w3ICjf/TblspBqb1WRl2aHLeEuyVzNJ/Chzd4ZI6qOTqOpuAn3NvmKpeynfOn7C1Zk
	 RW6yq4tXMyYMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6D7E42ABC;
	Mon,  1 Jun 2026 07:25:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D797E294
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 07:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD40D407EA
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 07:25:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y5umrR0ZwefI for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 07:25:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 80F0E407DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80F0E407DE
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80F0E407DE
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 07:25:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 937E6B97C615; Mon,  1 Jun 2026 09:25:43 +0200 (CEST)
Message-ID: <86f2f40c-1d80-4c48-9cda-99b11b37444c@rnout.be>
Date: Mon, 1 Jun 2026 09:25:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dowan Gullient <dowan.gullient@smile.fr>
Cc: buildroot@buildroot.org, ju.o@free.fr
References: <20260505100553.4100688-1-dowan.gullient@smile.fr>
 <20260505100553.4100688-3-dowan.gullient@smile.fr>
 <ahwg3kKssLZqpjtc@windsurf>
Content-Language: en-GB, fr-BE
In-Reply-To: <ahwg3kKssLZqpjtc@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780298744; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=U9W74M2K61NUbpWcdCmrOjnxR2c2uK3wG5jumf16b0w=;
 b=MmpQOy79Lqtg8MbaQ91A1heush4/5DsfQ+onLqYjj7keXd5BZ3ZvBFXB7OfczKgxet87kJ
 tAKITuC4MuAChmbPP5KKbxQSKfOj5otN9tC6SMUlRVd8dyqxJKL+JlyZgJiApRcfq/cw5K
 NxTqAxvOtCn+6bIJl+HNEgwAdzgOG8tATUAuJ3mi1QhwCtWDSCiaswTeUHOgYQ4jvIQQUb
 iKResmW+lbsYhoKDRe29c148nYt/34+4sWZCWeOQd5Er3CXC28ViEmXlOTnkpTZLfoAkCf
 OGuhnk5u1rHztx80fxfLZ3rkTG+xL34CbiiBbZLnE7lbHhEq0vKgJ8av4y4ybA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=MmpQOy79
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Dowan,

  In addition to Thomas's comments, I think the subject of the patch is not 
correct. test_podman currently passes on master, so "fix iptables errors" can't 
be right.

  I think what you're actually trying to do is just to bump the kernel version, 
and in the newer kernel it started failing?

  Also, see below.

On 31/05/2026 13:55, Thomas Petazzoni via buildroot wrote:
> Hello Dowan,
> 
> Thanks a lot for your patch! I have some comments below.
> 
> On Tue, May 05, 2026 at 12:05:53PM +0200, Dowan Gullient via buildroot wrote:
>> This patch bumps the kernel version and adds a Linux kernel fragment for Podman tests to resolve
>> "Protocol not supported" and "Table does not exist" errors when using iptables-based
>> networking which appeared due to the bump of the kernel version (5.10->6.18)
>> Indeed, the new kernel version requires additional configuration options due to the switch to
>> nftables, and to support Podman's networking features, especially when using iptables-based networking.
> 
> Could you wrap your commit log at 80 columns?
> 
>> Justifications:
>>
>>      NFT_COMPAT & XTABLES_LEGACY: On modern kernels (6.x+), iptables often defaults
>>      to the nft binary. CONFIG_NFT_COMPAT is strictly required for the iptables userspace
> 
> I'm afraid I don't understand "On modern kernels (6.x+), iptables
> often defaults to the nft binary". Both iptables and nft and
> user-space executables, so it doesn't really make sense to talk about
> "On modern kernels...". Could this be clarified.
> 
>>      tool to communicate with the nf_tables kernel subsystem. [1]
>>      Without CONFIG_IP_NF_IPTABLES_LEGACY, legacy calls from Netavark/CNI plugins fail.
>>
>>      NET_NS & NAMESPACES: Podman relies on Network Namespaces for container isolation.
>>      Without CONFIG_NET_NS, the kernel cannot create the private network stacks required for containers.
>>
>>      NAT & MASQUERADE: Containers require Source NAT (Masquerade) to access external networks.
>>      CONFIG_IP_NF_NAT and CONFIG_IP_NF_TARGET_MASQUERADE provide the necessary target modules
>>      for these iptables rules. [1]
>>
>>      XT_MATCH Modules: Netavark (Podman's default network stack) uses specific matches like
>>      addrtype, conntrack, and comment to manage bridge traffic and port forwarding.
>>
>> Some dependencies in the configuration file were verified by the check-config script from the Moby project [2].
> 
> Now, the more fundamental question is: if these kernel options are
> needed for podman to even work, then we should update:
> 
> define PODMAN_LINUX_CONFIG_FIXUPS
>          $(call KCONFIG_ENABLE_OPT,CONFIG_CPUSETS)
>          $(call KCONFIG_ENABLE_OPT,CONFIG_BPF_SYSCALL)
>          $(call KCONFIG_ENABLE_OPT,CONFIG_POSIX_MQUEUE)
>          $(call KCONFIG_ENABLE_OPT,CONFIG_MEMCG)
>          $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS)
>          $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_SCHED)
>          $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_FREEZER)
>          $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_DEVICE)
>          $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_CPUACCT)
>          $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_PIDS)
>          $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_BPF)
>          $(call KCONFIG_ENABLE_OPT,CONFIG_NAMESPACES)
>          $(call KCONFIG_ENABLE_OPT,CONFIG_UTS_NS)
>          $(call KCONFIG_ENABLE_OPT,CONFIG_IPC_NS)
>          $(call KCONFIG_ENABLE_OPT,CONFIG_PID_NS)
>          $(call KCONFIG_ENABLE_OPT,CONFIG_USER_NS)
>          $(call KCONFIG_ENABLE_OPT,CONFIG_NET_NS)
>          $(call KCONFIG_ENABLE_OPT,CONFIG_SECCOMP)
>          $(call KCONFIG_ENABLE_OPT,CONFIG_OVERLAY_FS)
>          $(call KCONFIG_ENABLE_OPT,CONFIG_KEYS)
>          $(PODMAN_LINUX_CONFIG_FIXUPS_BTRFS)
> endef
> 
> with more configuration options. Indeed your commit is fixing the test
> but it's not actually improving the situation for real users of our
> podman package.
> 
> Of course, we really want PODMAN_LINUX_CONFIG_FIXUPS to only enable
> options that are strictly needed for podman to work. If some options
> are only needed in some unusual cases, we don't want them to be
> enabled by PODMAN_LINUX_CONFIG_FIXUPS.

  AFAIU, most of those options are not stricly needed except for specific use 
cases, but some of them just provide better isolation. Realistically speaking, 
you probably do want all of them.

  The only issue I have with the KCONFIG_ENABLE_OPT approach is that there is no 
way to override it for the user, and there are some of them that you may 
actually want to turn off for security reasons, e.g. BPF_SYSCALL and KEYS.

  So I think the ideal is a mix of ENABLE_OPT and additional fixes in the test. 
It will be a bit difficult to decide which one goes where.

  Ideally, the commit message should document for each config option what kind 
of error you get from the test when you don't enable it, so we at least have 
information based on which to take a decision. Is that doable, Dowan? It could 
be a lot of work...

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
