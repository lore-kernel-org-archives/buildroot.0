Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1454FC5DF70
	for <buildroot@archiver.kernel.org>; Tue, 18 Aug 2026 07:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A285780B0A;
	Tue, 18 Aug 2026 07:25:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lBpVrJ5ACx0F; Tue, 18 Aug 2026 07:25:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D71ED80C64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787037954;
	bh=I55ITonUkjhObv4Wlsz7ZwbMhXcxPIzsIwePAp9Sj6k=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EdWNGQ25xEH1wD5HhTRSa8r6oEz2lUuYK6eoQmO/kpW/mASoygDglWVfvY2L0G+Hw
	 bUuRv5UvlAXYyleRhHu9gK3Zd05KxYtMwin/zRbmFin2+lfFFIAPFsfRK7w1XBn5wz
	 QWnzwW5X3FzVchujBAE8WfP8TWQra+ah9dmWucE1pOjQ4j1/xWaq9UioGtkJ2yco1a
	 oUeiDarzAUe7p3rfFVWPXLqu/GJq1cKwfUctPnoFhXYl52qtZnV3DjAkG2HoVGA8DG
	 j9LHrs61ulQMOz4BOta0g1krk03G3Ja8FX7n75tOJEL3g096s+SyNEVAulQO8QO8UR
	 t5VJDjwF09kAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D71ED80C64;
	Tue, 18 Aug 2026 07:25:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E264A333
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 07:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFF1F80CA6
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 07:25:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J6DZBrwMiAwr for <buildroot@buildroot.org>;
 Tue, 18 Aug 2026 07:25:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E424280C64
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E424280C64
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E424280C64
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 07:25:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 919CF1A16F8
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 07:25:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5E38E60355;
 Tue, 18 Aug 2026 07:25:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2C1FD11C748CB; 
 Tue, 18 Aug 2026 09:25:43 +0200 (CEST)
Date: Tue, 18 Aug 2026 09:25:42 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <aoQIk-X_afYgeQQN@windsurf>
References: <aoGB2EKYfAEH5N8t@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aoGB2EKYfAEH5N8t@waldemar-brodkorb.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/uclibc: enable FENV support
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sun, Aug 16, 2026 at 11:24:40AM +0200, Waldemar Brodkorb wrote:
> Enable FENV support unconditionally when a hard-float toolchain is in use.
> Useful for packages as quickjs and chawan.
> Adds 24kb to the C library on aarch64.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

I am not 100% sure, but this seems to have broken the build of gcc
14.4.0 on x86 32-bit:

  https://autobuild.buildroot.net/?reason=host-gcc-final-14.4.0&libc=uclibc

Even though we've had gcc 14.4.0 for a while, this only started
happening on August 16, first bad commit being 9ac19958, which is
shortly after this fenv support in uClibc was enabled.

And the build failure clearly connects to fenv:

In file included from ../../../libquadmath/math/x2y2m1q.c:19:
../../../libquadmath/quadmath-imp.h:310:8: error: redefinition of 'struct rm_ctx'
  310 | struct rm_ctx
      |        ^~~~~~
In file included from ../../../libquadmath/quadmath-imp.h:32:
/home/autobuild/autobuild/instance-16/output-1/host/i686-buildroot-linux-uclibc/sysroot/usr/include/fenv.h:137:8: note: originally defined here
  137 | struct rm_ctx
      |        ^~~~~~

Could you have a look into this?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
