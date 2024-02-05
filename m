Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FFEC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 21:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 913A240C1B;
	Mon,  5 Feb 2024 21:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 913A240C1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qrSfZXDGOo3T; Mon,  5 Feb 2024 21:25:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C48840B16;
	Mon,  5 Feb 2024 21:25:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C48840B16
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E88EF1BF341
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B55424180B
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:25:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B55424180B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0wghVNZXAgyl for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 21:25:21 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DF1BD417BA
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 21:25:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF1BD417BA
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27303FF803;
 Mon,  5 Feb 2024 21:25:18 +0000 (UTC)
Date: Mon, 5 Feb 2024 22:25:17 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240205222517.2b876f18@windsurf>
In-Reply-To: <20240122222351.477993-1-fontaine.fabrice@gmail.com>
References: <20240122222351.477993-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707168318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=omJe7uVpgmvzRKMgXaq4W75PgnbO6/GOnUuK8k9g7j0=;
 b=dv/mbzBSIPRKn+k+Z27QOI3LlpEvaA5VqiMYALYEHw4W04sq/FSbnVGM/tyqHgad6BfPMw
 TUKrO9FRfdHQmY4/R0b6PUi5avw42PzO3VAE7kKWyBDg2mdixsvncunNa8dQXE01PDm2OP
 4c31lgfq0BbvIdAwjLhSptjejK1ukzpE/awBSIeAmDnaPYlPXyA7cKHKyED+lzBDe3MCM9
 D9vo8NQAIyMGDa5oJCwO364rywgz0PsuNBxMZkq0tLXngJw0wlNXeA2RaXRWM0+EGIAM38
 68kGMWgYxOwzLGA6601ZSKgHCuIN+aSSNwiHBhFuhBdHCHd13vfXI0yIEkctKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dv/mbzBS
Subject: Re: [Buildroot] [PATCH 1/1] package/collectd: fix grpc build
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 22 Jan 2024 23:23:51 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following grpc build failure raised since bump of libabseil-cpp
> to version 20230802.1 in commit
> aea790392af5358568a4f1c5d2dd9f1adfb29109:
> 
> configure:25127: checking grpc++/grpc++.h usability
> configure:25127: /home/buildroot/autobuild/instance-0/output-1/host/bin/sparc64-linux-g++ -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O1 -g0 -D_FORTIFY_SOURCE=2 -std=c++11  -DNOMINMAX  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.cpp >&5
> In file included from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/absl/base/config.h:86,
>                  from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/absl/base/const_init.h:25,
>                  from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/absl/synchronization/mutex.h:67,
>                  from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/grpcpp/impl/codegen/sync.h:32,
>                  from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/grpcpp/completion_queue.h:41,
>                  from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/grpcpp/channel.h:25,
>                  from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/grpcpp/grpcpp.h:52,
>                  from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/grpc++/grpc++.h:26,
>                  from conftest.cpp:167:
> /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/absl/base/policy_checks.h:79:2: error: #error "C++ versions less than C++14 are not supported."
>    79 | #error "C++ versions less than C++14 are not supported."
>       |  ^~~~~
> 
> [...]
> 
>     grpc  . . . . . . . . no (libgrpc++ not found) (dependency error)
> 
> [...]
> 
> configure: error: "Some plugins are missing dependencies - see the summary above for details"
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e2cf909ab3c356f1881fd18cfa039e87faa10d7d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0002-configure.ac-fix-grpc-build.patch    | 96 +++++++++++++++++++
>  package/collectd/collectd.mk                  |  2 +
>  2 files changed, 98 insertions(+)
>  create mode 100644 package/collectd/0002-configure.ac-fix-grpc-build.patch

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
