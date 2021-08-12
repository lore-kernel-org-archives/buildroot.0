Return-Path: <SRS0=gEIP=ND=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F0AC4338F
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 21:43:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4142860C3F
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 21:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4142860C3F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00C8B400EF;
	Thu, 12 Aug 2021 21:43:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OERJht_OoQor; Thu, 12 Aug 2021 21:42:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67CA3401D3;
	Thu, 12 Aug 2021 21:42:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D4B91BF354
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 21:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BA91401D3
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 21:42:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w8XIKH0EjCoy for <buildroot@lists.busybox.net>;
 Thu, 12 Aug 2021 21:42:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 66124400EF
 for <buildroot@buildroot.org>; Thu, 12 Aug 2021 21:42:50 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 4D7C1C0002;
 Thu, 12 Aug 2021 21:42:48 +0000 (UTC)
Date: Thu, 12 Aug 2021 23:42:47 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210812234247.3618da82@windsurf>
In-Reply-To: <20210810120134.3972324-1-fontaine.fabrice@gmail.com>
References: <20210810120134.3972324-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/flatbuffers: fix locale
 independent on musl
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Tue, 10 Aug 2021 14:01:34 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix locale indepdendent which is enabled on musl since version 1.11.0
> and
> https://github.com/google/flatbuffers/commit/5f32f948102e65eaeea461b44f3b43f96c7a7a5a
> resulting in the following build failure on snort3 since bump to version
> 3.1.6 in commit	e66f2fd310374779d415fa683813cc5f5ccf6be9:
> 
> In file included from /tmp/instance-0/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/include/flatbuffers/flexbuffers.h:24,
>                  from /tmp/instance-0/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/include/flatbuffers/idl.h:26,
>                  from /tmp/instance-0/output-1/build/snort3-3.1.6.0/src/network_inspectors/perf_monitor/fbs_formatter.cc:29:
> /tmp/instance-0/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/include/flatbuffers/util.h: In function 'void flatbuffers::strtoval_impl(int64_t*, const char*, char**, int)':
> /tmp/instance-0/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/include/flatbuffers/util.h:258:12: error: 'strtoll_l' was not declared in this scope; did you mean 'strcoll_l'?
>   258 |     *val = __strtoll_impl(str, endptr, base);
>       |            ^~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/68045b83e94f8caa337b1af7ed5f493ac1a55c47
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...flatbuffers-base.h-fix-build-on-musl.patch | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch

I have seen the feedback from upstream that this workaround potentially
breaks bionic and BSD systems, but as we don't care about these in
Buildroot, I applied your patch to master as a work-around. Hopefully
upstream will implement a better/long-term solution.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
