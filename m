Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B975C25B74
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 20:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0869A4040A;
	Fri, 10 May 2024 20:54:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ThXW64aljZaS; Fri, 10 May 2024 20:54:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE2B1404A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE2B1404A3;
	Fri, 10 May 2024 20:53:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EA2041BF28A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D62BD404A3
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:53:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fsjUA2PwkCHO for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 20:53:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8982F4040A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8982F4040A
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8982F4040A
 for <buildroot@buildroot.org>; Fri, 10 May 2024 20:53:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B661520004;
 Fri, 10 May 2024 20:53:54 +0000 (UTC)
Date: Fri, 10 May 2024 22:53:53 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240510225353.43655bcb@windsurf>
In-Reply-To: <20240310182439.441668-1-fontaine.fabrice@gmail.com>
References: <20240310182439.441668-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715374435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dzqWIiVeD4bs/5bzzyvPFhdZcRlweIJFdd3lGhVxREI=;
 b=EWU9FAePyeO/CacG5qIApgR1x4oWYtlhR8rIwBJ8NA4ImxoVOD4hnPusePm5AzoBeHibP9
 xNYHMR5ulo6kcxOFGS9nl1lvYZnzH4oY8luvXhg8p7NZXidHieZ1QQehtUFAvqNxjhBE7Y
 yzhN7bCj54gvM3OsRk1GGtJZn0euOzQnsV8+OJ58jtg1s29bE/bvmfuBznB4Z412TT72CL
 y08phkrwOEUnX9JIT1lq8dZJLKbrt9KkwXUs2VRU76hjEbdrOuVPXHMz7Q2RBA46KAWPxw
 ijgEq1z8SvVpSsmZOZz8OZeDPpRYq7C9kwTVHvcAG7mI6sFFlUj+AFcR+hX4tQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EWU9FAeP
Subject: Re: [Buildroot] [PATCH 1/1] package/openblas: fix build without MMU
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 10 Mar 2024 19:24:39 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure without MMU:
> 
> /home/buildroot/autobuild/instance-1/output-1/host/riscv64-buildroot-linux-uclibc/bin/ld.real: test_fork.o: in function `.L6':
> test_fork.c:(.text+0x120): undefined reference to `fork'
> 
> autobuilder failure is raised since the addition of RISC-V support by
> commit c789bcddf0fb17580bef0cdc45b5334a90ecdf13
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/b9d097ae077f2cb40fc60de94bf25423636af005
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ding-against-an-uClibc-that-does-not.patch | 28 +++++++++++++++++++
>  ...-uclibc-that-does-not-implement-fork.patch | 28 +++++++++++++++++++
>  2 files changed, 56 insertions(+)
>  create mode 100644 package/openblas/0002-Skip-the-fork-test-when-building-against-an-uClibc-that-does-not.patch
>  create mode 100644 package/openblas/0003-Skip-test-when-building-with-a-uclibc-that-does-not-implement-fork.patch

It seems like following the bump in
59b48b5cff057f2429b1143d6f50c39d93ca8ef3, these patches are no longer
needed. Could you confirm? At least patch 0002 no longer applies.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
