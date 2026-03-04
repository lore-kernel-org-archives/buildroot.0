Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD81EDEC17
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 07:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C3F6813B5;
	Wed,  4 Mar 2026 07:05:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W__FaidKYkSW; Wed,  4 Mar 2026 07:05:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B73878139F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772607951;
	bh=+09sJKqWEjqeYfVtvnHseZ+tzbcmlYXGHqzuvpkRPf0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QpNle4NrGNKiIX5Nm8nld3T0Jbw5MVDPpPOqCSksUaYKikmU0Rt9wQL80zTjvB3WH
	 +mH0sbmFBPtnw7OE2L7R5kUvGvmMNaJPIGJZ0zqfQYA0M8vb/xd+4QkYyG0RKAjHBB
	 kKXlbX5G64Ypid6P0QllRMfIEa2ZbwR2ng9dqxpj7FIMPfUwfWaeox2lh3JjCWcStZ
	 1on6cOAeXvno6Fs97Y2MLa81trWX3iE4Vkvs2fS1a7z01+GQtr/sfVv7RdIjbirpee
	 4oSJxxHA++uUSfqhzsMmBndbEDKf64iGY0gKhQGKUuox+7PNw+3TuNhsFnUj8qSRph
	 +t/mK/MN4yIGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B73878139F;
	Wed,  4 Mar 2026 07:05:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 664B81EB
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 07:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C86160786
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 07:05:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yNh25UciYBVT for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 07:05:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=115.124.30.119;
 helo=out30-119.freemail.mail.aliyun.com;
 envelope-from=cp0613@linux.alibaba.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 60F4360752
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60F4360752
Received: from out30-119.freemail.mail.aliyun.com
 (out30-119.freemail.mail.aliyun.com [115.124.30.119])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60F4360752
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 07:05:40 +0000 (UTC)
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com
 fp:SMTPD_---0X-CVZoe_1772607916 cluster:ay36) by smtp.aliyun-inc.com;
 Wed, 04 Mar 2026 15:05:21 +0800
From: cp0613@linux.alibaba.com
To: ju.o@free.fr
Cc: buildroot@buildroot.org
Date: Wed,  4 Mar 2026 15:05:16 +0800
Message-ID: <20260304070516.1677-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <b02a221e1a4914633565797b5f211029@free.fr>
References: <b02a221e1a4914633565797b5f211029@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1772607925; h=From:To:Subject:Date:Message-ID:MIME-Version;
 bh=2fIyKGNFBGXFu/psT3dmqahWG7oQE3xyB+sTHNSkviA=;
 b=UxglN+xjb+r0pcW0z/bB0ONd83NzVwT2qEhLLTHEsdR7UQKiNpaA/DZTJ83v4hwKI5nupkwLRh5UhPHPc62MYs5oubxbDOcxvMpIdYU6AyQSnBNx/SOQ/zwAWK4bgNDfUU168iyf8KmvTlRnHH5rL2liV3nujxSLkT6UttOo1NU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linux.alibaba.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com
 header.a=rsa-sha256 header.s=default header.b=UxglN+xj
Subject: Re: [Buildroot] [PATCH] package/iniparser: new package
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

On Tue, 03 Mar 2026 19:08:41 +0100, ju.o@free.fr wrote:

> > From: Chen Pei <cp0613@linux.alibaba.com>
> > 
> > The iniparser is a simple C library offering ini file parsing services.
> > 
> > ndctl[1] requires it.
> > 
> > [1] https://github.com/pmem/ndctl
> > 
> > Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> > ---
> [...]
> > diff --git a/package/iniparser/iniparser.mk 
> > b/package/iniparser/iniparser.mk
> > new file mode 100644
> > index 0000000000..9034a1cb78
> > --- /dev/null
> > +++ b/package/iniparser/iniparser.mk
> > @@ -0,0 +1,14 @@
> > +################################################################################
> > +#
> > +# iniparser
> > +#
> > +################################################################################
> > +
> > +INIPARSER_VERSION = v4.2.6
> > +INIPARSER_SITE = 
> > https://gitlab.com/iniparser/iniparser/-/archive/$(INIPARSER_VERSION)
> > +INIPARSER_SOURCE = iniparser-$(INIPARSER_VERSION).tar.gz
> 
> Could you move the "v" from the _VERSION to _SITE and update _SOURCE,
> please? This will allow our version monitoring scripts to work better.
> We should preferably have:
> 
> INIPARSER_VERSION = 4.2.6
> INIPARSER_SITE = 
> https://gitlab.com/iniparser/iniparser/-/archive/v$(INIPARSER_VERSION)
> INIPARSER_SOURCE = iniparser-v$(INIPARSER_VERSION).tar.gz
> 
> Note: your initial submission was also reporting an error, which
> should be fixed indirectly with the change I propose. Please make
> sure to run the command "utils/docker-run make check-package" before
> sending patches. See:
> https://nightly.buildroot.org/manual.html#_preparing_a_patch_series
> 
> > +INIPARSER_INSTALL_STAGING = YES
> > +INIPARSER_LICENSE = MIT
> > +INIPARSER_LICENSE_FILES = LICENSE
> > +
> > +$(eval $(cmake-package))
> > --
> > 2.50.1
> 
> Also, quoting the Buildroot documentation at:
> https://nightly.buildroot.org/manual.html#DEVELOPERS
> """
> We ask developers adding new packages, new boards, or generally new 
> functionality in Buildroot, to register themselves in the DEVELOPERS 
> file. As an example, we expect a developer contributing a new package to 
> include in his patch the appropriate modification to the DEVELOPERS 
> file.
> """
> 
> Note that will received emails from the autobuilders in
> case of build failures, and from other developers using
> the get-developers script.
> 
> Could you add a new entry in the DEVELOPERS file registering
> yourself to this new package?
> 
> Could you send an updated v2 patch with those changes, please?
> 
Hi, Julien,

Thank you for your review and reminder. I will send an v2 patch,
update iniparser.mk, and add a new entry in the DEVELOPERS.

Thanks,
Pei

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
