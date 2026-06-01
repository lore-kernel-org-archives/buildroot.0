Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9478CD6E56
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 12:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A169610D0;
	Mon,  1 Jun 2026 12:22:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C02aEA68gI3l; Mon,  1 Jun 2026 12:22:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3FEC610F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780316528;
	bh=TI/TWw2P5Bevu9WTW1cXaW+ZrqXgnHkUi0Vs5AH3ecY=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AtUU4zoDPz4bUcCv4cGcURAJcBnzXiDCU+QOydhSYLLu/t3A1pl3/lBGsVhIWaMum
	 zlZC0yI7/8LmDjs7+8IkeG2rAJfU5m51MK3uryruDYb+xKl33iwy/2/At8vvUa1hk8
	 RaJdPgb4NpSp1HxalblBYYiBBr34Tj+9UGKzZtxFxqO8ssPyoczUSPZi/uTPrWdjvh
	 7VmRtQ4KVp5APQfGkKOD9C9O1wsdYpRIpcVF7jWVEsCreU1EcceVjzw17hbVW48oNC
	 TcvKqGuQfHDi5gB7m1jPgqkj6ob1JDEBZvFCgkGafaXTeRCVN2O9Hgc6DSomoRCv2v
	 9o34VYZ8OXRaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3FEC610F5;
	Mon,  1 Jun 2026 12:22:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F952257
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 12:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84B5042ADE
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 12:22:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yM2JSDjl6pEN for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 12:22:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 91C8842A63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91C8842A63
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91C8842A63
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 12:22:05 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-68b90fc6a1dso6853012a12.1
 for <buildroot@buildroot.org>; Mon, 01 Jun 2026 05:22:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780316523; cv=none;
 d=google.com; s=arc-20240605;
 b=OD82V7+Bpa4vmWVCQXFILLGYeN4ZGYeqhry3fCZ/wbq93eekNkXW/xWskvdUGx6cDy
 5ZUujJhzqtKBpoEYO5S3dd7PS+GJOTLSvH23F28y8kOED175OuLc61AAzOds9g3pM3/z
 LF4GpUZrU6KvrtHIvHqokkOvn16G95yKv9MmRwmvKMuVF7Lt3FRGQKZz+NKbDKYNCb3X
 kTjfKj+g+wUg5m88vD2FmojQzKOU4ZubKhN08/omGZ5MP+BBZdKWnSpHi1AJSmXSmbJB
 ySrbtjFUI1RIx2+YoLcS+oz/Er5sFoWN4pZf8zDTyM5l4TbYCFol9/tT18lYb3kjnpeY
 ZDDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=lyc24+EdnDklAbFQxElqPaHdcBkBmQBPfW1nZ52Fb4A=;
 fh=VvYGHyqcf2/7+e4pBv3LVTYnCX5C6PPIn2YDb+PYb2M=;
 b=LnhXvcgYgPqDg4KV2wfWZoGXHZX83sq/YSrBaCWfz35uWdVust65mIMJ1kbHrIUTqd
 4z7zzRpr4+bunG2qDsb4e00uMsQmCb2bEh071ec7yaCgOaGPSauxpfnOpGKndi6wh7Zj
 9iq0nQGiL/OeML32xM0G0Q19XSspiFshO10eYdT568Ho72BtsVCcZFbcdCC/v0x1ULQP
 KBQSrxf0Crp6C1OcunSUBAbE2UpIUtKcUqh3szNcYwTMjkjJX4dDZ42orszgJphR46Vc
 OSKFK2TIHOFtPBL2fpMTmgUhOTd8LET+nOW8COd2V7UVIHsmjBcsBoxBTei+KRcSV7ry
 87Fg==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780316523; x=1780921323;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lyc24+EdnDklAbFQxElqPaHdcBkBmQBPfW1nZ52Fb4A=;
 b=qhgvdO+IIIeLij6abpmCJvjNpocXs2tX1BhpyK2nv2TGzklHt69IvZjZA3GCsTlG4g
 0CICSr00Hy/ZQeaXkgsmVd8XyLJBWZzT94Qg74v1kErdPlFNmjXzHGYdIJ+SljJdCTU1
 8mcW8gndsLEy7XzA8/3u56BcrlS+5Oy1KxrXPn/fgZZHWdhrLCNG4vrf8frZmMMPtrOy
 ya649Z1eU2HX5dPSRCFB8X1gDtGlFuEVraa1RcFPxxM6wuoO/STrg7fmYkkEI1VzyTYO
 JPg9OyMOyphGvwZWoM0Slnc8nmVgNoVbMrRye4np+EpaGv9hfUo3XjgKYYQ8O+CFIKzm
 098A==
X-Forwarded-Encrypted: i=1;
 AFNElJ/S0jQC4VITnJd6yG0rVa0NCggfXNS1sKNpTUGDpVknQxbKtNM7G6wwpZInyshjOn5DVSt+f6ENH50=@buildroot.org
X-Gm-Message-State: AOJu0YyMn2RJuKbXWzzB04FpNt+zt3vHTkJXeWQz2zZwPXFVUGZyI54t
 wUQIc0Z09XlXVMnHWaGvzbrsWwCWgvo06VZAKiDz2Mr6sIYBkOkBChjw9Zdxk27isVolEakC3VB
 Qei5SmQwiNkQTleRPzFAWF5gbIsoDFlP3iySpFucH4fEymXR0WYHaqYw=
X-Gm-Gg: Acq92OGGupmrvFZ+xe9rnQCPT82oI6j5y5IvEWhHpO1DAEuB4OvtqR1tpmlzUm4o+YI
 snakTBTQN9XJwQ3ceEwNmWdbYhkipHWzwCGrfFU0mBimkfm93XlyPQC14kndtjzKc9ynxcnC/3F
 rgGVGXCXXF1vMGO+P5KXVtwoFMRffNxHYi1RPj4ErhtMv/TCtMv7ODHuIZn0LKuBO3tjv/Q3dIj
 MBPOEjJN+5ikBzUGrhzyhaZ5/e44hHXPDPHaN9u1wDwnrPdQmaSWb4WznIbRNCnniqfv5cw9OzO
 ZbsuKfu559Jh1P4u1R5TNxtipz/Wn6U=
X-Received: by 2002:a05:6402:1044:b0:676:d851:447e with SMTP id
 4fb4d7f45d1cf-68c069ae999mr4478445a12.4.1780316523274; Mon, 01 Jun 2026
 05:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260505100553.4100688-1-dowan.gullient@smile.fr>
 <20260505100553.4100688-3-dowan.gullient@smile.fr> <ahwg3kKssLZqpjtc@windsurf>
 <86f2f40c-1d80-4c48-9cda-99b11b37444c@rnout.be>
In-Reply-To: <86f2f40c-1d80-4c48-9cda-99b11b37444c@rnout.be>
Date: Mon, 1 Jun 2026 14:21:51 +0200
X-Gm-Features: AVHnY4KHTSnYkSAzN6bRIsUoOqzKLWQIpro4cY8Sub3251LJtNsZsi3i79mhZzk
Message-ID: <CAARUF10GnhiTNbek0rHL-7bBtmqrO0_sq-rXYq4T5_jwwaxPAg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1780316523; x=1780921323; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lyc24+EdnDklAbFQxElqPaHdcBkBmQBPfW1nZ52Fb4A=;
 b=zQLW7558ENLmiezVWLuHStDwuttyOJYttgT0otd+ocBUc60GY1TtoetMz42YJsl/EB
 vV8/zJWkZ64OERhgqGUJ62ORKgVEF1nRNJJTjcLrbYcE1OQy6U/vcmjfO/VDwNcyvY+8
 B2vwF7CKkzlkZ5q5n3bfClbFd5M9PgCbS/JPg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=zQLW7558
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
From: Dowan GULLIENT via buildroot <buildroot@buildroot.org>
Reply-To: Dowan GULLIENT <dowan.gullient@smile.fr>
Content-Type: multipart/mixed; boundary="===============3722824077738865581=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3722824077738865581==
Content-Type: multipart/alternative; boundary="000000000000f543420653303d05"

--000000000000f543420653303d05
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone, thanks for your messages,

>I'm afraid I don't understand "On modern kernels (6.x+), iptables
Sorry for this imprecision, I meant that for the iptables binary to work
with the new kernel version in this specific Buildroot test
configuration, CONFIG_NFT_COMPAT is required, so we can translate the
iptables commands correctly for the kernel's API Nftables.

Regarding KCONFIG_ENABLE_OPT vs test fragments: You are right, I checked
`PODMAN_LINUX_CONFIG_FIXUPS`, and several core options from my fragment
(like CONFIG_NAMESPACES, CONFIG_NET_NS, CONFIG_MEMCG) are actually already
enforced by the package. I will remove them from my test fragment. For the
remaining network-related options (VETH, BRIDGE, NETFILTER, IP_NF_NAT,
MASQUERADE, NFT_COMPAT, etc.): I believe these should stay in the test
fragment and NOT be added to `podman.mk`. These options are specifically
required for the CNI/Netavark Bridge+NAT networking mode, which is exactly
what `TestPodmanIptables` exercises (creating bridges, routing between
containers, and NATing to the outside). A real user might not need
in-kernel Bridge or NAT support. Forcing these modules globally via
KCONFIG_ENABLE_OPT would unnecessarily increase the kernel size and attack
surface for users who don't need bridge networking.

I will send a v3 with the wrapped commit log, the cleaned .fragment and a
commit message that documents which group of options fixes which specific
error in the test if this is ok for you both.

On Mon, Jun 1, 2026 at 9:25=E2=80=AFAM Arnout Vandecappelle <arnout@rnout.b=
e> wrote:

>   Hi Dowan,
>
>   In addition to Thomas's comments, I think the subject of the patch is
> not
> correct. test_podman currently passes on master, so "fix iptables errors"
> can't
> be right.
>
>   I think what you're actually trying to do is just to bump the kernel
> version,
> and in the newer kernel it started failing?
>
>   Also, see below.
>
> On 31/05/2026 13:55, Thomas Petazzoni via buildroot wrote:
> > Hello Dowan,
> >
> > Thanks a lot for your patch! I have some comments below.
> >
> > On Tue, May 05, 2026 at 12:05:53PM +0200, Dowan Gullient via buildroot
> wrote:
> >> This patch bumps the kernel version and adds a Linux kernel fragment
> for Podman tests to resolve
> >> "Protocol not supported" and "Table does not exist" errors when using
> iptables-based
> >> networking which appeared due to the bump of the kernel version
> (5.10->6.18)
> >> Indeed, the new kernel version requires additional configuration
> options due to the switch to
> >> nftables, and to support Podman's networking features, especially when
> using iptables-based networking.
> >
> > Could you wrap your commit log at 80 columns?
> >
> >> Justifications:
> >>
> >>      NFT_COMPAT & XTABLES_LEGACY: On modern kernels (6.x+), iptables
> often defaults
> >>      to the nft binary. CONFIG_NFT_COMPAT is strictly required for the
> iptables userspace
> >
> > I'm afraid I don't understand "On modern kernels (6.x+), iptables
> > often defaults to the nft binary". Both iptables and nft and
> > user-space executables, so it doesn't really make sense to talk about
> > "On modern kernels...". Could this be clarified.
> >
> >>      tool to communicate with the nf_tables kernel subsystem. [1]
> >>      Without CONFIG_IP_NF_IPTABLES_LEGACY, legacy calls from
> Netavark/CNI plugins fail.
> >>
> >>      NET_NS & NAMESPACES: Podman relies on Network Namespaces for
> container isolation.
> >>      Without CONFIG_NET_NS, the kernel cannot create the private
> network stacks required for containers.
> >>
> >>      NAT & MASQUERADE: Containers require Source NAT (Masquerade) to
> access external networks.
> >>      CONFIG_IP_NF_NAT and CONFIG_IP_NF_TARGET_MASQUERADE provide the
> necessary target modules
> >>      for these iptables rules. [1]
> >>
> >>      XT_MATCH Modules: Netavark (Podman's default network stack) uses
> specific matches like
> >>      addrtype, conntrack, and comment to manage bridge traffic and por=
t
> forwarding.
> >>
> >> Some dependencies in the configuration file were verified by the
> check-config script from the Moby project [2].
> >
> > Now, the more fundamental question is: if these kernel options are
> > needed for podman to even work, then we should update:
> >
> > define PODMAN_LINUX_CONFIG_FIXUPS
> >          $(call KCONFIG_ENABLE_OPT,CONFIG_CPUSETS)
> >          $(call KCONFIG_ENABLE_OPT,CONFIG_BPF_SYSCALL)
> >          $(call KCONFIG_ENABLE_OPT,CONFIG_POSIX_MQUEUE)
> >          $(call KCONFIG_ENABLE_OPT,CONFIG_MEMCG)
> >          $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS)
> >          $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_SCHED)
> >          $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_FREEZER)
> >          $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_DEVICE)
> >          $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_CPUACCT)
> >          $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_PIDS)
> >          $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_BPF)
> >          $(call KCONFIG_ENABLE_OPT,CONFIG_NAMESPACES)
> >          $(call KCONFIG_ENABLE_OPT,CONFIG_UTS_NS)
> >          $(call KCONFIG_ENABLE_OPT,CONFIG_IPC_NS)
> >          $(call KCONFIG_ENABLE_OPT,CONFIG_PID_NS)
> >          $(call KCONFIG_ENABLE_OPT,CONFIG_USER_NS)
> >          $(call KCONFIG_ENABLE_OPT,CONFIG_NET_NS)
> >          $(call KCONFIG_ENABLE_OPT,CONFIG_SECCOMP)
> >          $(call KCONFIG_ENABLE_OPT,CONFIG_OVERLAY_FS)
> >          $(call KCONFIG_ENABLE_OPT,CONFIG_KEYS)
> >          $(PODMAN_LINUX_CONFIG_FIXUPS_BTRFS)
> > endef
> >
> > with more configuration options. Indeed your commit is fixing the test
> > but it's not actually improving the situation for real users of our
> > podman package.
> >
> > Of course, we really want PODMAN_LINUX_CONFIG_FIXUPS to only enable
> > options that are strictly needed for podman to work. If some options
> > are only needed in some unusual cases, we don't want them to be
> > enabled by PODMAN_LINUX_CONFIG_FIXUPS.
>
>   AFAIU, most of those options are not stricly needed except for specific
> use
> cases, but some of them just provide better isolation. Realistically
> speaking,
> you probably do want all of them.
>
>   The only issue I have with the KCONFIG_ENABLE_OPT approach is that ther=
e
> is no
> way to override it for the user, and there are some of them that you may
> actually want to turn off for security reasons, e.g. BPF_SYSCALL and KEYS=
.
>
>   So I think the ideal is a mix of ENABLE_OPT and additional fixes in the
> test.
> It will be a bit difficult to decide which one goes where.
>
>   Ideally, the commit message should document for each config option what
> kind
> of error you get from the test when you don't enable it, so we at least
> have
> information based on which to take a decision. Is that doable, Dowan? It
> could
> be a lot of work...
>
>   Regards,
>   Arnout
>
>

--000000000000f543420653303d05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello everyone, thanks for your messages,<br><div><br></di=
v><div>&gt;I&#39;m afraid I don&#39;t understand &quot;On modern kernels (6=
.x+), iptables</div><div>Sorry for this imprecision, I meant that for the i=
ptables binary to work with the new kernel version=C2=A0in this specific Bu=
ildroot test configuration,=C2=A0CONFIG_NFT_COMPAT is required, so we can t=
ranslate the iptables commands correctly for the kernel&#39;s=C2=A0API Nfta=
bles.<br><br>Regarding KCONFIG_ENABLE_OPT vs test fragments:
You are right, I checked `PODMAN_LINUX_CONFIG_FIXUPS`, and several core opt=
ions from my fragment (like CONFIG_NAMESPACES, CONFIG_NET_NS, CONFIG_MEMCG)=
 are actually already enforced by the package. I will remove them from my t=
est fragment.

For the remaining network-related options (VETH, BRIDGE, NETFILTER, IP_NF_N=
AT, MASQUERADE, NFT_COMPAT, etc.):
I believe these should stay in the test fragment and NOT be added to `<a hr=
ef=3D"http://podman.mk">podman.mk</a>`. These options are specifically requ=
ired for the CNI/Netavark Bridge+NAT networking mode, which is exactly what=
 `TestPodmanIptables` exercises (creating bridges, routing between containe=
rs, and NATing to the outside).
A real user might not need in-kernel Bridge or NAT support. Forcing these m=
odules globally via KCONFIG_ENABLE_OPT would unnecessarily increase the ker=
nel size and attack surface for users who don&#39;t need bridge networking.=
<br><br></div><div>I will send a v3 with the wrapped commit log, the cleane=
d .fragment and a commit message that documents which group of options fixe=
s which specific error in the test if this is ok for you both.</div></div><=
br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Jun 1, 2026 at 9:25=E2=80=AFAM Arnout Vandecappelle=
 &lt;<a href=3D"mailto:arnout@rnout.be">arnout@rnout.be</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 Hi Dowan,<br>
<br>
=C2=A0 In addition to Thomas&#39;s comments, I think the subject of the pat=
ch is not <br>
correct. test_podman currently passes on master, so &quot;fix iptables erro=
rs&quot; can&#39;t <br>
be right.<br>
<br>
=C2=A0 I think what you&#39;re actually trying to do is just to bump the ke=
rnel version, <br>
and in the newer kernel it started failing?<br>
<br>
=C2=A0 Also, see below.<br>
<br>
On 31/05/2026 13:55, Thomas Petazzoni via buildroot wrote:<br>
&gt; Hello Dowan,<br>
&gt; <br>
&gt; Thanks a lot for your patch! I have some comments below.<br>
&gt; <br>
&gt; On Tue, May 05, 2026 at 12:05:53PM +0200, Dowan Gullient via buildroot=
 wrote:<br>
&gt;&gt; This patch bumps the kernel version and adds a Linux kernel fragme=
nt for Podman tests to resolve<br>
&gt;&gt; &quot;Protocol not supported&quot; and &quot;Table does not exist&=
quot; errors when using iptables-based<br>
&gt;&gt; networking which appeared due to the bump of the kernel version (5=
.10-&gt;6.18)<br>
&gt;&gt; Indeed, the new kernel version requires additional configuration o=
ptions due to the switch to<br>
&gt;&gt; nftables, and to support Podman&#39;s networking features, especia=
lly when using iptables-based networking.<br>
&gt; <br>
&gt; Could you wrap your commit log at 80 columns?<br>
&gt; <br>
&gt;&gt; Justifications:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 NFT_COMPAT &amp; XTABLES_LEGACY: On modern ker=
nels (6.x+), iptables often defaults<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 to the nft binary. CONFIG_NFT_COMPAT is strict=
ly required for the iptables userspace<br>
&gt; <br>
&gt; I&#39;m afraid I don&#39;t understand &quot;On modern kernels (6.x+), =
iptables<br>
&gt; often defaults to the nft binary&quot;. Both iptables and nft and<br>
&gt; user-space executables, so it doesn&#39;t really make sense to talk ab=
out<br>
&gt; &quot;On modern kernels...&quot;. Could this be clarified.<br>
&gt; <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 tool to communicate with the nf_tables kernel =
subsystem. [1]<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Without CONFIG_IP_NF_IPTABLES_LEGACY, legacy c=
alls from Netavark/CNI plugins fail.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 NET_NS &amp; NAMESPACES: Podman relies on Netw=
ork Namespaces for container isolation.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Without CONFIG_NET_NS, the kernel cannot creat=
e the private network stacks required for containers.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 NAT &amp; MASQUERADE: Containers require Sourc=
e NAT (Masquerade) to access external networks.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 CONFIG_IP_NF_NAT and CONFIG_IP_NF_TARGET_MASQU=
ERADE provide the necessary target modules<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 for these iptables rules. [1]<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 XT_MATCH Modules: Netavark (Podman&#39;s defau=
lt network stack) uses specific matches like<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 addrtype, conntrack, and comment to manage bri=
dge traffic and port forwarding.<br>
&gt;&gt;<br>
&gt;&gt; Some dependencies in the configuration file were verified by the c=
heck-config script from the Moby project [2].<br>
&gt; <br>
&gt; Now, the more fundamental question is: if these kernel options are<br>
&gt; needed for podman to even work, then we should update:<br>
&gt; <br>
&gt; define PODMAN_LINUX_CONFIG_FIXUPS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(call KCONFIG_ENABLE_OPT,CONFIG_CPU=
SETS)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(call KCONFIG_ENABLE_OPT,CONFIG_BPF=
_SYSCALL)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(call KCONFIG_ENABLE_OPT,CONFIG_POS=
IX_MQUEUE)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(call KCONFIG_ENABLE_OPT,CONFIG_MEM=
CG)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(call KCONFIG_ENABLE_OPT,CONFIG_CGR=
OUPS)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(call KCONFIG_ENABLE_OPT,CONFIG_CGR=
OUP_SCHED)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(call KCONFIG_ENABLE_OPT,CONFIG_CGR=
OUP_FREEZER)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(call KCONFIG_ENABLE_OPT,CONFIG_CGR=
OUP_DEVICE)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(call KCONFIG_ENABLE_OPT,CONFIG_CGR=
OUP_CPUACCT)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(call KCONFIG_ENABLE_OPT,CONFIG_CGR=
OUP_PIDS)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(call KCONFIG_ENABLE_OPT,CONFIG_CGR=
OUP_BPF)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(call KCONFIG_ENABLE_OPT,CONFIG_NAM=
ESPACES)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(call KCONFIG_ENABLE_OPT,CONFIG_UTS=
_NS)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(call KCONFIG_ENABLE_OPT,CONFIG_IPC=
_NS)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(call KCONFIG_ENABLE_OPT,CONFIG_PID=
_NS)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(call KCONFIG_ENABLE_OPT,CONFIG_USE=
R_NS)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(call KCONFIG_ENABLE_OPT,CONFIG_NET=
_NS)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(call KCONFIG_ENABLE_OPT,CONFIG_SEC=
COMP)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(call KCONFIG_ENABLE_OPT,CONFIG_OVE=
RLAY_FS)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(call KCONFIG_ENABLE_OPT,CONFIG_KEY=
S)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(PODMAN_LINUX_CONFIG_FIXUPS_BTRFS)<=
br>
&gt; endef<br>
&gt; <br>
&gt; with more configuration options. Indeed your commit is fixing the test=
<br>
&gt; but it&#39;s not actually improving the situation for real users of ou=
r<br>
&gt; podman package.<br>
&gt; <br>
&gt; Of course, we really want PODMAN_LINUX_CONFIG_FIXUPS to only enable<br=
>
&gt; options that are strictly needed for podman to work. If some options<b=
r>
&gt; are only needed in some unusual cases, we don&#39;t want them to be<br=
>
&gt; enabled by PODMAN_LINUX_CONFIG_FIXUPS.<br>
<br>
=C2=A0 AFAIU, most of those options are not stricly needed except for speci=
fic use <br>
cases, but some of them just provide better isolation. Realistically speaki=
ng, <br>
you probably do want all of them.<br>
<br>
=C2=A0 The only issue I have with the KCONFIG_ENABLE_OPT approach is that t=
here is no <br>
way to override it for the user, and there are some of them that you may <b=
r>
actually want to turn off for security reasons, e.g. BPF_SYSCALL and KEYS.<=
br>
<br>
=C2=A0 So I think the ideal is a mix of ENABLE_OPT and additional fixes in =
the test. <br>
It will be a bit difficult to decide which one goes where.<br>
<br>
=C2=A0 Ideally, the commit message should document for each config option w=
hat kind <br>
of error you get from the test when you don&#39;t enable it, so we at least=
 have <br>
information based on which to take a decision. Is that doable, Dowan? It co=
uld <br>
be a lot of work...<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
</blockquote></div>

--000000000000f543420653303d05--

--===============3722824077738865581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3722824077738865581==--
