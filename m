Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEC4E7716A
	for <buildroot@archiver.kernel.org>; Sun, 15 Dec 2024 12:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74EE4407C9;
	Sun, 15 Dec 2024 12:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eWL3_uQXEUCx; Sun, 15 Dec 2024 12:42:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3309A407DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3309A407DB;
	Sun, 15 Dec 2024 12:42:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 78B2ACE
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 12:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43D7A40441
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 12:42:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id esgpHqNbaXYI for <buildroot@buildroot.org>;
 Sun, 15 Dec 2024 12:42:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 17E5240237
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17E5240237
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17E5240237
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 12:42:22 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:c850:17a3:bd5c:2f64] (unknown
 [IPv6:2a01:e0a:12:eba0:c850:17a3:bd5c:2f64])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 71AA1BFD8D;
 Sun, 15 Dec 2024 13:42:19 +0100 (CET)
Message-ID: <44d4f592-d2ab-4f19-82d0-b0dd1790e208@grenoble.cnrs.fr>
Date: Sun, 15 Dec 2024 13:42:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chris Packham <judge.packham@gmail.com>,
 buildroot <buildroot@buildroot.org>
References: <CAFOYHZDQmMRuK76TpOSAOFPdqAb4gpw=LNKfmpu=sqAD1EMhFg@mail.gmail.com>
Content-Language: en-US
Cc: Sergey Matyukevich <geomatsi@gmail.com>, Michael Walle
 <mwalle@kernel.org>, Biagio Montaruli <biagio.hkr@gmail.com>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <CAFOYHZDQmMRuK76TpOSAOFPdqAb4gpw=LNKfmpu=sqAD1EMhFg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1734266539;
 bh=rBDy2yvh2GVzeF1lyBPC/lnK7+1/I6GCLkidAkvi0Dc=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=PL8uoJIJzomRF3kGvFLYBe6zxQvlAT/6zT2AxEVuW3payLLssTQ10EtqFTfRR9DXE
 7IhxxeIkNFdzZXeIrFdAVjqrFis0Jma8U2+OuZa0LWpJ6GsdVzg5rMdWz7ezLcWjwN
 bGJ1GGjCCG8r5SWrDTqyLz7ieCTd1Gw/O4DGDAxZNpmUTbv+CfXQTgfb3q+kb7dEcn
 PKsdAFK5l0dSatJhb57EnT3zbND3nyeTXvp34El4/2XI05uY2JyMr6WKzPCMVdd68i
 9GODrcYKR0jWrnT2Cy8plCpDrbDRr4sQYqbEpunrXuWJaUo5TKTkUA0MBnWYRpirrg
 KwPDvfJUbexkg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=PL8uoJIJ
Subject: Re: [Buildroot] Linux and out of tree DTBs
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

Hello Buildroot users!

On 2024-10-20, Chris Packham wrote:
> I just found that as of Linux 6.12 we won't be able to copy
> out-of-tree dts files into the kernel source and run `make foo.dtb`.
> I know buildroot relies on this as does the build system we use at
> $dayjob.
>
> I proposed a change that would restore support for this but this has
> been rejected because "This is not a use-case in upstream"[1].
>
> So before I try to convince the upstream maintainer to change their
> mind. Has anyone looked at an alternative for handling out of tree
> dtbs?

There has been a bit of discussion on this topic here.[1] The proposed
solutions involve dropping the DTS into a vendor subdir of
$(LINUX_ARCH_PATH)/boot/dts. However, this would require either:

 * adding a new config option to let the user select the appropriate
   vendor subdir

 * patching $(LINUX_ARCH_PATH)/boot/dts/Makefile if we would want to
   create a custom "buildroot" subdir.

Both these approaches would bring a breaking change for users having
custom defconfigs outside the Buildroot tree, as they would have to
adjust the path of included .dtsi files.

I tried another approach that doesn't require new config options, nor
does it break existing out-of-tree configurations: patch the top
dts/Makefile in order to compile the DTS we are dropping there. This may
not be the cleanest approach, as it breaks the one-dir-per-vendor layout
used by the kernel. However, it turns out to be a trivial change to the
Makefile: just append

    dtb-y += foo.dtb

at the end.

The patch implementing this is a simple one-liner, see below.

Any comments before I send this as proper patch?

Regards,

Edgar.

[1] See thread starting from
    https://lists.buildroot.org/pipermail/buildroot/2024-December/768587.html

------------------------------------------------------------------ >8 --
diff --git a/linux/linux.mk b/linux/linux.mk
index 1d3d8fffa6..35f358c56f 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -517,6 +517,7 @@ define LINUX_BUILD_CMDS
        $(call KCONFIG_DISABLE_OPT,CONFIG_GCC_PLUGINS)
        $(foreach dts,$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)), \
                cp -f $(dts) $(LINUX_ARCH_PATH)/boot/dts/
+               echo "dtb-y += $(notdir $(dts:%.dts=%.dtb))" >> $(LINUX_ARCH_PATH)/boot/dts/Makefile
        )
        $(LINUX_MAKE_ENV) $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) all
        $(LINUX_MAKE_ENV) $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
