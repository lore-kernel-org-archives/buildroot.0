Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77EDAC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 19:54:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D845D600D4
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 19:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D845D600D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 698F04017C;
	Sat,  4 Sep 2021 19:54:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c_mGRnw0gIUS; Sat,  4 Sep 2021 19:54:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87BCF40169;
	Sat,  4 Sep 2021 19:54:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 972F91BF31B
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 19:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 851E2404A5
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 19:54:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YePuclKxbOgI for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 19:54:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4AEB74048A
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 19:54:12 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id a25so4998856ejv.6
 for <buildroot@buildroot.org>; Sat, 04 Sep 2021 12:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=BJVwTLkuYloEKbjl3KwfgHQaEYlEmfgvsc3gr5W206E=;
 b=Tg9Cb0yheGCAJqtRwIqwEiPsqqam60RrPhjQqN5IuA5ghoYbjToxQPFXuNhhCwq9hL
 6oLCmFSYz2oOkWECTs/TVHpupPzww6J3BP9L3nUZu9qNGCGaT3DZ5MCgYgXeWIlz2OcR
 vTzRMe60VMmgTxlCw0R2P2FYpErQ0IIrEJin1wO0HhVKiZyxNIx5CHx+X1k+CjtM1jQj
 al0urErydMLdVgLVBW7n+exa380/9K3fk5TBYdo1f1Gpy9dLQdLHsd9Qxc0cpJVLTTb+
 r1jdcFEtQdYw0KRs7ySOT+ug63gCzeqUMDNY1rNjZshvB2o+XNe8cB1deCg1S1TsajJb
 BJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=BJVwTLkuYloEKbjl3KwfgHQaEYlEmfgvsc3gr5W206E=;
 b=m1vkXPBVClqtcRa4YGzjnToG3ymxeIIEtWn9DdfpkqUo696UyeBCXw752trVwg0pcX
 wuHr+uf1bycXZhCM2WRv6wx8EyUXH+pEOBwYFyFDnLaXN4XHmDxMMy+lIDa4C6dnsZAo
 mGGA1KPgqNG5IgtWrioOT1A9Tg5al+dpMRRfvcUFiHV8t06yLoQ6rrOhuIctLnC4nEQt
 DxZ87J0jjq5bvKvs9/bDyYcxASWd6FTMjHDbPeYQ/NtCJw0l8BRax5Mb98MWojMBO0uo
 +agr27Q4KpqXojOUGX1QJ86wQ6rTQCrOj3+S5Kw93di6H6N47wMWBcbV3aHs3igjQ+1s
 SsIQ==
X-Gm-Message-State: AOAM533SRrGQ7TVYi9iGnZFMRA+ZJ/Li1ZCGg+CO3zQ9zCs+VWNkp9pO
 7Ysk3EwoH24+LdsRSNgbGExpZeBL42M=
X-Google-Smtp-Source: ABdhPJxeRoGt/NR4at0BkxlQfQUhltjxaGsK8ikRGPq3ooBahud3rpXG3sUS+LbP2QvoDBoW+GvtEA==
X-Received: by 2002:a17:907:78cf:: with SMTP id
 kv15mr5463119ejc.422.1630785250467; 
 Sat, 04 Sep 2021 12:54:10 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 k12sm1804207edq.59.2021.09.04.12.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 12:54:09 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mMbjt-0003N8-5H; Sat, 04 Sep 2021 21:54:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Alexander Egorenkov <egorenar@linux.ibm.com>
References: <20210808094844.385703-1-egorenar@linux.ibm.com>
Date: Sat, 04 Sep 2021 21:54:09 +0200
In-Reply-To: <20210808094844.385703-1-egorenar@linux.ibm.com> (Alexander
 Egorenkov's message of "Sun, 8 Aug 2021 11:48:44 +0200")
Message-ID: <87k0jwp15q.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/prelink-cross: fix handling of
 TLS offsets for s390 arch
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: aduskett@gmail.com, yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Alexander" == Alexander Egorenkov <egorenar@linux.ibm.com> writes:

 > /tmp/instance-1/output-1/host/sbin/prelink-rtld: error while loading
 > shared libraries: /lib64/libc.so.6: cannot handle TLS data
 > ERROR: can't resolve libraries to shared libraries: glib-2.0, gobject-2.0
 > ninja: build stopped: subcommand failed.
 > make: *** [package/pkg-generic.mk:270:
 > /tmp/instance-1/output-1/build/gobject-introspection-1.68.0/.stamp_built]
 > Error 1
 > make: Leaving directory '/tmp/instance-1/buildroot'

 > Fixes:
 > - http://autobuild.buildroot.org/?reason=gobject-introspection-1.68.0&arch=s390x

 > Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
