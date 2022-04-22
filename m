Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36147C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 15:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98D2241C85;
	Fri, 22 Apr 2022 15:44:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uid6ePSIB973; Fri, 22 Apr 2022 15:44:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 858314158B;
	Fri, 22 Apr 2022 15:44:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D86491BF2C4
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 15:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C65CB40470
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 15:44:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=zx2c4.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h6-L_ZCGDZcH for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 15:44:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA9E84017B
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 15:44:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D710AB830D6
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 15:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C69AC385A8
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 15:44:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="jCnmZY5u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1650642254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iXW4hxSo/URUy6vBZwI38CvXI/RDC3FOCqqA/hK8POg=;
 b=jCnmZY5uOjS2Jh1y1jDD5yPmxzjfOgVaMKtmW+Mvrvihzo/1XTRkLrqOe8tENDsahqSJbu
 8WVemTGEAzZXM6SsyVTb+D16GswWaOFNLkZQFxPzgfL7fwBsma+nIteMGWG2tloL/4Pr3Z
 OeIRFf6ztEgG5tTSUMpIcdsgY7FL89o=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b17b5b68
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 15:44:14 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id w20so8982006ybi.8
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 08:44:14 -0700 (PDT)
X-Gm-Message-State: AOAM532k1dVDSAYnZ5f7ZSXu+T6zr39aqsf4p8syaqkazvResBuAj6/U
 2p6aLaz7enM5H8xh8reWVemDj0eJhWMDdnBcmcs=
X-Google-Smtp-Source: ABdhPJyCPNMgz2BdkcrYRykku4v1o+Sgb2q819Ykj/e5IH5pQ4T4Ohxybwzp3Z2AAyz++m9TciII0OJ52+tNgHwK+ao=
X-Received: by 2002:a5b:6cf:0:b0:61e:1371:3cda with SMTP id
 r15-20020a5b06cf000000b0061e13713cdamr5028056ybq.235.1650642252913; Fri, 22
 Apr 2022 08:44:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220420170326.1901572-1-Jason@zx2c4.com>
 <CAHmME9rx5E7WyksZzqCXKPttWBQ5QnAg2kLzY2AOYYNdcOLuyA@mail.gmail.com>
In-Reply-To: <CAHmME9rx5E7WyksZzqCXKPttWBQ5QnAg2kLzY2AOYYNdcOLuyA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 22 Apr 2022 17:44:02 +0200
X-Gmail-Original-Message-ID: <CAHmME9pftkLwEOFwcYZgi0jUoD++d1UyHf0-R5=oQfKw=ZmO=A@mail.gmail.com>
Message-ID: <CAHmME9pftkLwEOFwcYZgi0jUoD++d1UyHf0-R5=oQfKw=ZmO=A@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>, Peter Korsgaard <peter@korsgaard.com>,
 Michael Fischer <mf@go-sys.de>, Arnout Vandecappelle <arnout@mind.be>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v5] package/urandom-scripts: actually credit
 seed files via seedrng
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Another thought: I noticed the busybox package itself has various init
scripts. We could just delete the now-obsolete urandom-scripts
package, and simply add the init script to the busybox package. Would
this be workable?

Jason
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
