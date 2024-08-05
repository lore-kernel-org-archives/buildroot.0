Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C839DC3DA7F
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 20:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 933DA811E5;
	Mon,  5 Aug 2024 20:41:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id epvGy-JFh6pQ; Mon,  5 Aug 2024 20:41:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1413F811EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1413F811EA;
	Mon,  5 Aug 2024 20:41:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BC0AA1BF335
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 20:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8329607B3
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 20:41:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iVXf-JlCY11j for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 20:41:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3343B60730
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3343B60730
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3343B60730
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 20:41:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7A6B540002;
 Mon,  5 Aug 2024 20:41:00 +0000 (UTC)
Date: Mon, 5 Aug 2024 22:40:59 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240805224059.4494a56b@windsurf>
In-Reply-To: <ZrDeobsGFJYy4gL/@waldemar-brodkorb.de>
References: <ZrDeobsGFJYy4gL/@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722890460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xNORfybz/qzkVGLlX++NUljOemK6SZ8VsgQltjN6CFE=;
 b=ls2vHy3NX4j6gPtAwB6cUv5z7yZV/gGsPV947nYGPe4hIymd96OFC1usDo0kCbPXoBVcgt
 ZCCp+CjTDgn9kNRJIu2qnwN/MKP3ao0xUXsGvZuMDdtY5gWeClBg7gvsBOPRuwt5LnZevr
 QlbFnCyfPfytHklvrmulK/uvlj6ZkTbP1bf/MQD84NPeAzwDP+l+sztCIunzPBId+qel5y
 snLNU5VhBBXYen5aBMGl9dfbqJCHxXQ+oXJGCWCd/djAvE1V44SbOyOON+wTy2Jxd+CIlh
 5Q5mwlGn2iOxih9SVt/5m8kksXIGP8ld1Ic17O8XRAfr+QJrqHdKRBzwbGkUzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ls2vHy3N
Subject: Re: [Buildroot] [PATCH v2] package/nginx: security update to 1.26.1
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

On Mon, 5 Aug 2024 16:16:01 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> See here for a Changelog and CVE's:
> http://nginx.org/en/CHANGES-1.26
> 
> Patch 0006 is no longer required as the openssl library is found without
> this patch, which does not apply anymore.
> 
> Patch 0009 is no longer required as it was fixed in another way upstream:
> https://hg.nginx.org/nginx/rev/fb989e24c60a
> 
> Patch 0011 is upstream:
> https://hg.nginx.org/nginx/rev/f58b6f636238
> 
> Reorder the remaining patches and update .checkpackageignore accordingly.
> 
> The LICENSE file is changed, the year changed from 2022 to 2024.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1->v2:
>   - forgot to update LICENSE file hash and information about the
>     changes (requested by Thomas P.)
> ---
>  .checkpackageignore                           |   8 +-
>  ...-auto-lib-libgd-conf-use-pkg-config.patch} |   0
>  ...auto-lib-openssl-conf-use-pkg-config.patch | 251 ------------------
>  ...inux_config.h-only-include-dlfcn.h-.patch} |   0
>  ...of-endianness-for-cross-compilation.patch} |   0
>  ...to-os-linux-fix-build-with-libxcrypt.patch |  38 ---
>  ...ix-compile-error-in-configure-script.patch |  33 ---
>  package/nginx/nginx.hash                      |   4 +-
>  package/nginx/nginx.mk                        |   2 +-
>  9 files changed, 6 insertions(+), 330 deletions(-)
>  rename package/nginx/{0007-auto-lib-libgd-conf-use-pkg-config.patch => 0006-auto-lib-libgd-conf-use-pkg-config.patch} (100%)
>  delete mode 100644 package/nginx/0006-auto-lib-openssl-conf-use-pkg-config.patch
>  rename package/nginx/{0008-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch => 0007-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch} (100%)
>  rename package/nginx/{0010-Allow-forcing-of-endianness-for-cross-compilation.patch => 0008-Allow-forcing-of-endianness-for-cross-compilation.patch} (100%)
>  delete mode 100644 package/nginx/0009-auto-os-linux-fix-build-with-libxcrypt.patch
>  delete mode 100644 package/nginx/0011-Fix-compile-error-in-configure-script.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
