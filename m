Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3091FC6377A
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 20:49:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D127B61221
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 20:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D127B61221
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F84740146;
	Wed, 21 Jul 2021 20:49:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AlyyeWvX4miI; Wed, 21 Jul 2021 20:49:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFC0D40134;
	Wed, 21 Jul 2021 20:49:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A25491BF5F5
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 20:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E21140234
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 20:49:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tNsE3uV6RygO for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 20:49:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA7FD401D2
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 20:49:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id B9EDE240006;
 Wed, 21 Jul 2021 20:49:14 +0000 (UTC)
Date: Wed, 21 Jul 2021 22:49:13 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Christian Stewart <christian@paral.in>
Message-ID: <20210721224913.3d600ccc@windsurf>
In-Reply-To: <20210622024337.3009417-1-christian@paral.in>
References: <20210622024337.3009417-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: use host compiler when
 go-bootstrap unsupported
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Christian,

On Mon, 21 Jun 2021 19:43:37 -0700
Christian Stewart <christian@paral.in> wrote:

> All Go compiler versions > 1.4.x (old) are written in Go, and require a existing
> compiled Go version to use to build from source.
> 
> https://golang.org/doc/install/source#bootstrapFromSource
> 
> The process for "bootstrapping" the Go compiler in Buildroot is:
> 
> 1. Compile a C/C++ cross-compiler (gcc) as the host toolchain.
> 2. Build go-bootstrap (which is Go 1.4.x and written in C)
> 3. Build go 1.16.x (written in Go) using go-bootstrap.
> 
> The problem is that step 2 - build go-bootstrap - does not work on 64-bit arm.
> The Go compiler from 1.4.x is compatible with x86, x86_64, and arm (32 bit).

So perhaps my brain is not smart enough here, but how is the Go
compiler then build on 64-bit ARM ?

> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/go-bootstrap/go-bootstrap.mk | 6 ++++++
>  package/go/Config.in.host            | 2 --
>  package/go/go.mk                     | 4 ++++
>  3 files changed, 10 insertions(+), 2 deletions(-)

Implementation-wise, I agree with the feedback from Baruch, we need
some checks in support/dependencies/.

Normally, the way we do things is that packages express their
dependency on a particular system tool by selecting a hidden boolean.
For example packages that need java on the host will select
BR2_NEEDS_HOST_JAVA, and in support/dependencies/dependencies.sh, if
BR2_NEEDS_HOST_JAVA=y, we check if java is installed.

The other model that we have is for optional host tools, where we can
use the system-provided one or fallback to building our own if not.
That's for example what support/dependencies/check-host-lzip.{mk,sh} is
doing.

check-host-lzip.mk calls suitable-host-package, which itself calls the
check-host-lzip.sh script to verify if lzip is installed. If there is
no suitable lzip available on the host, then check-host-lzip.mk defines
BR2_LZIP_HOST_DEPENDENCY to host-lzip, so that packages who need the
lzip utility can depend on $(BR2_LZIP_HOST_DEPENDENCY). It will be
empty if the system has a lzip program, or it will be set to host-lzip
if Buildroot needs to build its own.

Another feature for the lzip situation is that we can force Buildroot
to build the host packages even if the tool is found on the machine,
using BR2_FORCE_HOST_BUILD=y.

The thing is that your host-go-bootstrap situation does not exactly fit
these situations.

I think the easiest would be to do like we do for Java, but only select
BR2_NEEDS_HOST_GO if we're on a host architecture that doesn't support
building host-go-bootstrap.

If we go this route, then it should look like this:

 * Top-level Config.in defines BR2_NEEDS_HOST_GO as an hidden boolean

 * support/dependencies/dependencies.sh should test if a functional Go
   compiler is available on the machine if BR2_NEEDS_HOST_GO is
   defined, and if not bail out with a hard error

 * BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS and
   BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS should loose their "depends
   on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS" and instead have
   something like:

	select BR2_NEEDS_HOST_GO if !BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS

 * go.mk should be modified to not use host-go-bootstrap if
   !BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS. I don't think
   host-go-bootstrap should be modified like you did however, the
   changes should be contained into package/go/go.mk.

The one thing that bothers me however is the hardcoding of /usr/lib/go
in your proposal as the location of the Go compiler. I guess we could
have some logic in the top-level Makefile that looks for the path of
the host Go compiler perhaps ?

Does this make sense ?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
