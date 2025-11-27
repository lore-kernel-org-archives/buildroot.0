Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41255D111A8
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 19:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B59E61725;
	Thu, 27 Nov 2025 19:54:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6uWwongJ83sL; Thu, 27 Nov 2025 19:54:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 227B86170A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 227B86170A;
	Thu, 27 Nov 2025 19:54:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EBFD9967
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDEBB80884
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:54:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G2mW7LG9hzIz for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 19:54:37 +0000 (UTC)
Received-SPF: Temperror (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a64; helo=mail-vk1-xa64.google.com;
 envelope-from=markus.mayer@broadcom.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 33E8D80849
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33E8D80849
Received: from mail-vk1-xa64.google.com (mail-vk1-xa64.google.com
 [IPv6:2607:f8b0:4864:20::a64])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33E8D80849
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:53:54 +0000 (UTC)
Received: by mail-vk1-xa64.google.com with SMTP id
 71dfb90a1353d-559966a86caso297011e0c.2
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 11:53:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764273230; x=1764878030;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z8xTLVZXDQbES3bYmEKnjvwwgY8b3tx8n38FVvVAMCQ=;
 b=TGFtmxbPYKp4lq+BFQEc1sCXZ+C8MZ66OHdtXDPMMoCZAw3ocXYcCra2RjsBIY1M13
 rRM51pjIRNAIf9+X3TLuZTda1LizvPTbRFYMSL8M3Mov4vMYHUsozVplKushq8FLxNiX
 qYy8j618cQTmF9hbRFUvc0ldhHHz68YoOkHhJYcajxxxzR2yvwi7NNtFu19kWQU3Oeq3
 sSHyo48EgPKDREqfyrpPNsgHUB6mdIquwxNt4sfWNon/UhGmWo1P13NQ0IgnqQULyqdD
 zuTAb3SHyz61rpw12iIKK0CJiQT3l47pywHJyOC2ydqXZ6p0fW/tozEvtLnn7a4EnxYN
 EE1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQa2R4LyN9B5Rm4mmNKP30k/mF/qAoltb8CHGWdQbaSUeO3XGwxwFhex1QebPEmDIhgg2ohVedanw=@buildroot.org
X-Gm-Message-State: AOJu0YxIonZUvGuAFxGBLmJe8PU4fqHGvIfxoIkM8hC733WTV6tkBvc3
 KdQy+VTgc035ZCxmyNxyVU8BU58PgQbqguJg6SSkbe5ZmGFpk6NeeNZcUXZuMfyOV4ytpB//UZy
 eir7NTCMTkYc+6cCn/aiDLbnTj1/ildzHmd0DXqtSxUmY2BHbs/7lxhIZDJ4gXP+ViqqqImeugd
 TPPqD3fP8GTbCPx5eNJfe/L9t4tphAaxjSN+c5TOxbt2avzeaT68FVGsqfXDKdCsNcBn9w1enRD
 T9SRYEh8sOlKG8=
X-Gm-Gg: ASbGncvxztdzGL91n+FBjEuKsjuqKqElMEh1D8kCD/1DIzeaxplTey17Ie01vMgdUFS
 quoTQp9MvBKP6vTO1PtK+78GmboO+RjP/K0hytugVCEY3lxDnkvA5Cf2DRGpk6HaI+I2aBo3C/h
 53czSi7h24j3BJNsMsVoBYBMffc3y44ktGYA4p6E1LdOy6d9F3ZEtfmXne+W90IJ4gRtJ40HjsY
 1BuVxBLvmWwwdrKXsn4FvcaGy9BL7IjaMKR6kLn5+d+/1bm3mmD9rZQzkLmgq7UPP8lWnauJP6D
 Lwy5o2TeiKtSWWy6D2uKIGVe0xcsagf/8O3LExM5WHORO23utPmdTRLfg50HBmnGl+IkSQFvPM9
 8RZ2j3cZTumIl2m9CYiNYQC2RkuK0sOF1jkmhdRKVoX2mclZMpStmX0nLZTe/GAjZLZ9orpVM4D
 dN1hhnRT+XXu9jvif2EvN0Yu3O0hzCMvWJVsqGb1l2W6p2
X-Google-Smtp-Source: AGHT+IG/OXmjIC0q8YnZ5RB05zhjlYyCQGXSaRIB/KAL0Vv/ulXnqa0wwt+yXzYG7VO1rogGpXAzqBGlgaD1
X-Received: by 2002:a05:6122:2382:b0:55b:305b:4e2e with SMTP id
 71dfb90a1353d-55cd78354bdmr3973104e0c.21.1764273230362; 
 Thu, 27 Nov 2025 11:53:50 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-77.dlp.protect.broadcom.com. [144.49.247.77])
 by smtp-relay.gmail.com with ESMTPS id
 71dfb90a1353d-55cf515389fsm241224e0c.6.2025.11.27.11.53.49
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Nov 2025 11:53:50 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-64161017e34so1438746a12.1
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 11:53:49 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVOvDhOmrzCqRyRdBT8fANqBW4IQ7sit2fM/NkCJmLz5qPaH3neMIEvQ6ke+q0TcxvnQ770V39Ewi4=@buildroot.org
X-Received: by 2002:a17:906:c14a:b0:b72:7dbd:3bf with SMTP id
 a640c23a62f3a-b7671709b7cmr2853544866b.43.1764273228802; 
 Thu, 27 Nov 2025 11:53:48 -0800 (PST)
X-Received: by 2002:a17:906:c14a:b0:b72:7dbd:3bf with SMTP id
 a640c23a62f3a-b7671709b7cmr2853541666b.43.1764273228228; Thu, 27 Nov 2025
 11:53:48 -0800 (PST)
MIME-Version: 1.0
References: <20251123133431.1499202-1-thomas.petazzoni@bootlin.com>
 <fe64d9aca519af339d5d30054c162d0e@free.fr>
In-Reply-To: <fe64d9aca519af339d5d30054c162d0e@free.fr>
Date: Thu, 27 Nov 2025 11:53:36 -0800
X-Gm-Features: AWmQ_bnyIl1HYMF_nQWccZ1EhyYiiBzpwcXEKrQ_6P1Wv__-GxMjJCA2FOpC9YU
Message-ID: <CAGt4E5vMkqsHt2sUUqLWERZyRvQXyp1Z90E4wx8yPRP6CEiWgg@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>, Bernd Kuhls <bernd@kuhls.net>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1764273229; x=1764878029; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z8xTLVZXDQbES3bYmEKnjvwwgY8b3tx8n38FVvVAMCQ=;
 b=HOLbtCG5u71h67pDt0M2eBQKQxva40tApbdDi+RUwzh2vsrZ5ZIlZ5FuHihF2IV4t8
 CgI5U0fOSLWwgia0/SozC8yastBO5/T2mKVzeOIdgLkD4zMQ5YCKJnuYVG3IFvYOMO11
 GBY96JgFQwJ8puC0QNXGprEBfnlMnT1PnEczQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=broadcom.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=HOLbtCG5
Subject: Re: [Buildroot] [PATCH] package/e2fsprogs: fix build with headers
 >= 5.10 and < 5.12
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

I submitted a different patch for this to Ted T'so a week ago, on
November 21, to be exact. Unfortunately, there doesn't seem to be a
mailing list for e2fsprogs, so there is no way of quoting said email.
Unfortunately, I haven't heard back from Ted as of yet.

I think the easiest way of showing my patch set here at this point in
time is by providing a Github link.

https://github.com/tytso/e2fsprogs/compare/master...mmayer:e2fsprogs:kern-compat-master

This page should show the entirety of the diff, combining the two
commits in that tree (manual changes and derived autoconf changes).
The important changes are in the first commit (configure.ac and
kern_compat.h)[1].

The big difference between your patch and my patch is that my patch
doesn't disable functionality when the build environment is too old.
Instead, it provides the missing definitions of the data structures,
so the binaries can still be built with full functionality compiled
in. So, while your patch strips functionality out of e2fsprogs based
on the build environment, mine does not.

This makes a big difference, because "old" kernel headers at build
time don't necessarily equate to an "old" kernel at runtime. Here is
why. Our toolchain ships with a sys-root that contains the C runtime,
glibc and kernel headers. The toolchain is an external, pre-built
toolchain. For compatibility reasons, kernel headers in the toolchain
are from Linux 5.4. However, that toolchain is then used to build
entire root file systems (including the kernel) for 5.4, 5.15, 6.1 and
6.12. Just to stress this one more time, this means an entire
Buildroot build, including the kernel, is conducted with this
toolchain, but while using different kernel versions. We aren't doing
any funky business like copying binary files around and sharing them
between releases. It all gets built together as one would expect, and
users generally won't even notice the kernel headers in the sys-root
are from Linux 5.4, and they shouldn't have to care.

It is easy to see how stripping out functionality based on build time
headers will become an issue in this setting. Sure, with the 5.4-based
rootfs, the added functionality will not actually work at runtime
(ioctl not supported by the kernel), but in the other three
environments, it'll work perfectly (due to the data structure
definitions provided), despite having been built against 5.4 kernel
headers.

I held off submitting this to buildroot right away, because I was
hoping this would be accepted upstream quickly enough to not have to
clutter buildroot with patch commits. However, it being a week later,
I was about to submit my patches for inclusion into Buildroot, since
Ted hasn't responded and it is Thanksgiving in the US, which means
more delays.

However, then I noticed there was already a patch present in
Buildroot. So, I am reaching out first before submitting the series
for inclusion as it would conflict with the solution that is currently
present.

Please let me know what you think.

Regards,
-Markus

[1] https://github.com/tytso/e2fsprogs/commit/bbe1c7fb5abf7c41894616e5885ad78446dd5f3b






On Sun, 23 Nov 2025 at 06:16, Julien Olivain via buildroot
<buildroot@buildroot.org> wrote:
>
> On 23/11/2025 14:34, Thomas Petazzoni via buildroot wrote:
> > The bump of e2fsprogs to 1.47.3 in Buildroot commit
> > bb004ddba26ea86687d917fa16d313ea92aff41c causes the package to fail
> > building when the kernel headers are >= 5.10 but < 5.12.
> >
> > Indeed the new version of e2fsprogs detects the presence of
> > <linux/fsverity.h> (which occurred in 5.10), and when it's available,
> > enables some fsverity functionality, which uses an ioctl() that was
> > only introduced in 5.12. This causes some build breakage if the
> > headers used are 5.10 or 5.11.
> >
> > We fix this by introducing a patch, submitted upstream, that not only
> > verifies the availability of the header file, but also the
> > availability of the ioctl().
> >
> > Fixes:
> >
> >
> > https://autobuild.buildroot.net/results/c573233b1f871c61f916eda9c402c84070902432/
> > (host-e2fsprogs)
> >
> > https://autobuild.buildroot.net/results/0ed16cad1d1f500d0e577d03166c06381be73ffc/
> > (e2fsprogs)
> >
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>
> Applied to master, thanks.
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
