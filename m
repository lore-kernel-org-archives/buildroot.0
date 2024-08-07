Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80ADC52D7B
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 19:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8875881224;
	Wed,  7 Aug 2024 19:53:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vTp5hH3cDUOd; Wed,  7 Aug 2024 19:53:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FFC48122A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FFC48122A;
	Wed,  7 Aug 2024 19:53:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42BB31BF2E3
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 19:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E6EE8122A
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 19:53:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MvY5L2ALKZXu for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 19:53:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EC97681224
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC97681224
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC97681224
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 19:53:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C703E40006;
 Wed,  7 Aug 2024 19:53:09 +0000 (UTC)
Date: Wed, 7 Aug 2024 21:53:08 +0200
To: Johan Oudinet <johan.oudinet@gmail.com>
Message-ID: <20240807215308.72682195@windsurf>
In-Reply-To: <20240807143318.439619-19-johan.oudinet@gmail.com>
References: <20240807143318.439619-1-johan.oudinet@gmail.com>
 <20240807143318.439619-19-johan.oudinet@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723060390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E8ZEGRJp6nvT0xvOSK6C8w0KKqqQalM+wA27nc/bK/A=;
 b=RcqqLktltzDZswPpSYs1w9LsEfuOqmzl6zoXSKFXlNB/0MGjbcyqAXkbwE8hdM1GaM6CYS
 18yIZeacAFf5fB37p35bFQSfGI7tAUV239+nKEBivL5GhOiJQG9Z5mSK6Bkqtr9MvJgTyq
 J3El2fs0mmE+HXMK5SJpSQOr3qlFqu+jVRrSRvQLqKEYlflh3yI61XFtQ0cAnM13RPT3+Z
 rqU7N37D3FokxZCM+GiYcjQ0Ihiw9UlKj+cP9l7theT99vu9+AY1h4BilB9kEP9O3/+CCf
 pw3Wb6T1cnHFu8BnTPNGxrVbd3swgP7RHwBKBFmzd37wONzihiBEd4oJnXjzsQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RcqqLktl
Subject: Re: [Buildroot] [PATCH 18/18] package/ejabberd: bump version to
 24.07
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

Hello Johan,

On Wed,  7 Aug 2024 16:33:18 +0200
Johan Oudinet <johan.oudinet@gmail.com> wrote:

> and update the two patches accordingly. Ejabberd now uses rebar3 by
> default, so use the --with-rebar configure option to set the correct
> rebar binary to use. Take the opportunity to fix warnings reported by
> utils/check-package.

Would it be possible to split the changes into multiple patches, i.e
fix the check-package warnings first, and then bump (or the other
around) ?

Also, if you fix some check-package warnings, make sure to remove the
corresponding ignore lines from .checkpackageignore:

package/ejabberd/0001-Makefile.in-do-not-download-or-compile-dependencies.patch lib_patch.Upstream
package/ejabberd/0002-fix-ejabberdctl.patch lib_patch.Upstream
package/ejabberd/0003-correct-includes.patch lib_patch.Upstream
package/ejabberd/S50ejabberd Shellcheck lib_sysv.Indent lib_sysv.Variables
package/ejabberd/check-erlang-lib Shellcheck

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
