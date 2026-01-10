Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FF2D277DB
	for <buildroot@archiver.kernel.org>; Sat, 10 Jan 2026 11:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97D694067D;
	Sat, 10 Jan 2026 11:56:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fkCPPrQUx8bk; Sat, 10 Jan 2026 11:56:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 994B8403BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768046194;
	bh=9AM+uQD/UihheWLhhmjp114euudOuVhAGm/I2SzXYzo=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q5SxNpmAGmxR0X2VkX/CGOFWHwnnOjZIvYW8e7N5Ov/lfFFdBMuWDvkdqmyAcTR5o
	 7mq75CwUHL2vhz3T+nVmH/4Eb+JujMelI+dLhS9C2U0CJg28/4p1GaBbS53zOZXXoE
	 FwjcFI3CBTIOJZ5ADs20/6jU8Fv/W8GVIPXCzQuLWXnfnrydLGkqKKtF3IqOQwBpKw
	 /m2YSon/Jru6W0ILO5GD2fzgOj4pBY6SJcm3vVRu4lYxijUyEIAlcdcs1w4xoZpTMz
	 4rKCmJRH9Jwbp3EiAAtdcNHzHb7ZebsGAVd9cKxwxM5BRCPO6Pw8oeVoRYWriicb7g
	 xnOQXvipMrS2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 994B8403BB;
	Sat, 10 Jan 2026 11:56:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CD4BE12E
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 11:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B438C6070F
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 11:56:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Omz5AFTgjZMy for <buildroot@buildroot.org>;
 Sat, 10 Jan 2026 11:56:31 +0000 (UTC)
X-Greylist: delayed 602 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 10 Jan 2026 11:56:30 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3D0026059D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D0026059D
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D0026059D
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 11:56:29 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 9D20631E0AE8; Sat, 10 Jan 2026 12:46:19 +0100 (CET)
Date: Sat, 10 Jan 2026 12:46:18 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org,
 Titouan Christophe <titouan.christophe@mind.be>
Message-ID: <aWI8CmIeP5d57VKp@waldemar-brodkorb.de>
References: <20251106204737.3273902-1-bernd@kuhls.net>
 <20251209093955.75fc0716@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251209093955.75fc0716@windsurf>
X-Operating-System: Linux 6.12.57+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1768045579; bh=KN6s2+BiXA6QmCfujUNbCeirPofrN0coOa7q4CJhJcc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NhKJ+hraUHpPFf787VGh56ALe/Ub9qtsQSB3RFLiANUHaC42xXpGk4K8EYzG96HZj
 JFApV5O/IYx0/PuxcaBPMTZyXPWaqSPmgsvOcz8lCLTatqpV2USdHnRdSbHFbrOtI6
 lfb1MUAXAJc04XxOMdIVAKkWaFla1IfHJZjdsFNtg6hF79JEaeueflAqTZ9EbctV45
 22uSWD8LkRC3AhkTBKVxiXmQFCcmXWvxTjtChyyxrYLEViR9UNNyd0z+cigucFNiMf
 YYdsVPLzWhCsVj6H9j9FYr2TSE301XE+/tc7Nv/N3L69h9236gDv1Utp58rylXZ5cE
 fSRbJ9q3BD5wg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=NhKJ+hra
Subject: Re: [Buildroot] [PATCH v2 1/1] package/asterisk: security bump
 version to 22.5.2
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

Hi Thomas,
Thomas Petazzoni via buildroot wrote,

> Hello Bernd,
> 
> On Thu,  6 Nov 2025 21:47:37 +0100
> Bernd Kuhls <bernd@kuhls.net> wrote:
> 
> > Fixes CVE-2025-1131:
> > https://github.com/asterisk/asterisk/security/advisories/GHSA-v9q8-9j8m-5xwp
> > 
> > Acked-by: Titouan Christophe <titouan.christophe@mind.be>
> > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> 
> I'm not sure it's been introduced by this version bump, but Asterisk is
> still causing quite a few build failures in the autobuilders.
> 
> I briefly looked into two of them:
> 
> - https://autobuild.buildroot.net/results/426/426336052c50768b06dd047ce4b8283e6da377d4/build-end.log
> 
>   menuselect/menuselect: error while loading shared libraries: libxml2.so.16: cannot open shared object file: No such file or directory
> 
>   The target asterisk package builds "menuselect" as a host tool, but
>   our $(HOST_LDFLAGS) are not passed when building menuselect, so it
>   doesn't have the right -Wl,-rpath flag passed, and therefore when it
>   tries to *run* menuselect, it doesn't find libxml2 in $(HOST_DIR)/lib
> 
>   Not sure how to pass our HOST_LDFLAGS.
> 
>   Also, since it builds menuselect for the host, is it still needed for
>   the target asterisk to depend on host-asterisk ?

The problem here is that somehow newer versions of Asterisk do
trigger sometimes a make clean before the build and then our
host-asterisk mechanism is useless, because menuselect is build
again without our HOST_LDFLAGS. I can reproduce the issue and have a
ugly one-liner patch preventing the cleanup.

Should I sent a patch?

best regards
 Waldemar
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
