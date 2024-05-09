Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A6EC25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 14:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17C7B61004;
	Thu,  9 May 2024 14:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xL6mi_FU9d_r; Thu,  9 May 2024 14:02:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AE1060F9B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AE1060F9B;
	Thu,  9 May 2024 14:02:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 456751BF3EE
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 307EE410B3
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:02:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HDo1LjeYsUD3 for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 14:02:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 84A0F405A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84A0F405A1
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84A0F405A1
 for <buildroot@buildroot.org>; Thu,  9 May 2024 14:02:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0F4F920002;
 Thu,  9 May 2024 14:02:15 +0000 (UTC)
Date: Thu, 9 May 2024 16:02:15 +0200
To: Vincent Fazio <vfazio@gmail.com>
Message-ID: <20240509160215.363811c9@windsurf>
In-Reply-To: <20240507162936.18729-2-vfazio@gmail.com>
References: <20240428024210.11950-1-vfazio@gmail.com>
 <20240507162936.18729-1-vfazio@gmail.com>
 <20240507162936.18729-2-vfazio@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715263336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MCllmB81ouDc21txkE+O/gsTA7Ji4mRToRGxaGbivaw=;
 b=EOsdxgPa5q4WbT9caHwcXqXExmtboXiiFGKEPEza40TIlsbGFvmwfcyb/dK0m36Y8qW6jN
 FHdiHLra/MgiS+01NIDiboLtX1s3YfqkKQK6SNA8jpyDGeLLg4d3aDC+0FMUeoZQLet/zI
 CoKIKXvhRDWtf9a17j1Iz805pNViHnYQ65I1htjKUZf+tPXRk+2Ub273veSUgdskRhbOr3
 1Syvu10SAFKvlPlotOrtV6wmS4L+PdrNUdwT/lKUZbMrnf0ZUlcryuaq0ea4Dj/G3honG6
 UN3/5pQDV9vpAtS6gDBXdOth/YexXxGokBx7F1jwJ3XxXq754msODfzWCAZ8Gw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EOsdxgPa
Subject: Re: [Buildroot] [PATCH v2 2/2] package/python3: drop unnecessary
 patches
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  7 May 2024 11:29:36 -0500
Vincent Fazio <vfazio@gmail.com> wrote:

> Patches 0004 and 0009 relied upon environment variables that were used
> to drive custom logic in distutils when executed by an external Python
> interpreter. This issue should have been mostly addressed upstream [0],
> but even if that was not the case, distutils is no longer a supported
> installation method for packages to use for installation as of 09de823c.
> As such, there shouldn't be a need to continue to patch it as setuptools
> vendors its own distutils that supercedes the one provided by Python.
> 
> Patches 0010 and 0026 (see [1] [2] [3]) can be removed due to a fix
> introduced in 3.7 [4].
> 
> Patch 0028 can be dropped since commit 3fed4245 removed the dependency
> on a host provided python to build host-python3.
> 
> [0] https://github.com/python/cpython/commit/9731330d6f4d63d6d57c8e99c8d11ef1def42858
> [1]: https://github.com/python/cpython/issues/67096
> [2]: https://github.com/python/cpython/issues/75894
> [3]: https://github.com/python/cpython/issues/66338
> [4]: https://github.com/python/cpython/commit/14086cfc5eed8c5e78342d79e5db87a135d75fa8
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---
> Changes v1 -> v2:
>   - reworded rationale for 0004 and 0009
> ---
>  .checkpackageignore                           |  5 --
>  ...y-header-paths-for-cross-compilation.patch | 69 -------------------
>  ...e-shebang-of-Python-scripts-for-cros.patch | 35 ----------
>  ...ig.sh.in-ensure-sed-invocations-only.patch | 67 ------------------
>  ...thon-config.sh-don-t-reassign-prefix.patch | 53 --------------
>  ...-fix-building-on-older-distributions.patch | 47 -------------
>  6 files changed, 276 deletions(-)
>  delete mode 100644 package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
>  delete mode 100644 package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
>  delete mode 100644 package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
>  delete mode 100644 package/python3/0026-python-config.sh-don-t-reassign-prefix.patch
>  delete mode 100644 package/python3/0028-fix-building-on-older-distributions.patch

Applied to master, thanks. I have also applied a follow-up patch that
renumbers the remaining patches and refreshes them so they apply
cleanly with "git am".

Thanks for all this work on the python3 integration, this is really
great!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
