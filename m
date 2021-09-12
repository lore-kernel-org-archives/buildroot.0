Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00186C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 19:43:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96E8A60F58
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 19:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 96E8A60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B29881B36;
	Sun, 12 Sep 2021 19:43:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D9Z2unGUMsbD; Sun, 12 Sep 2021 19:43:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F7B581B10;
	Sun, 12 Sep 2021 19:43:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1258F1BF409
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 19:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F23E6606FD
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 19:43:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sHY8PaCJE-ux for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 19:43:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 194E960635
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 19:43:15 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id x11so16285842ejv.0
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 12:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=9OMbiWO7VcXFUbXxoxoDE4iYGUHVQv0KtQ7Xwqz0j6A=;
 b=WA5OMASJAhsQBhb0fwAm9m4oj9ehmRBBeyc9A30RscZwK+h9X1wmwk+LnRB2/3knGb
 hinlWAl8MvN8fR+uE5ZaiAsnUtuqxQEFfickn6bBsrlR0jZ3YD8s0efAMpA6FATQyN7r
 9UQeEhK6Dm0H6IRUzk1VNMz4C7dsTE466A05esSZsRuzvejXd7z2eoWzDkpHvKIuHrhE
 xm2WPFcInHNFxfuf5yv8VBUSjWHrW+9yukTtCECK0LHdGfc4/kmaTfK7Ep/7r14YDu9s
 DP8lmVl+ty/D2QrVhmdT0IILBsNSc5PHGOQk1pXoCf/zk9Soj8vbPRIzYrRdNxfQZnDk
 jvUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=9OMbiWO7VcXFUbXxoxoDE4iYGUHVQv0KtQ7Xwqz0j6A=;
 b=Q0PjSgxwlcmnUCYKjovQ7LG5YRBvQIM+M4CIw/cDpVM+d+S/kJpjDEzu6zgbq8TQUQ
 FzW6WZhM0QA1eZLoYQPUXJjx+IdI9b6s0lhjLoUK+QEYll68ky6xwQzIVH4ABXBU39nd
 SabAAlFNSW71expfOJDcGQNJk6eCLFiPAGVjNoNbq/Yprhmp5LwMTlfCvXAEfQMvBRGO
 RKE3tWE35rU4AOmSCw2CggL5lhFGwHI+lAYDJYeK7E0fQxVj+YnSq+8GZWh1eL5l+rWy
 umN+DLK+/+lNAJlMUBS/myNa+7dZzO1EWHQh1gMukw4hO6hUsnDV7CdQO+Yse+qbB2aA
 hIlg==
X-Gm-Message-State: AOAM530EZMAJk1H5BQ9WlvoVMy3zCr/L6/GZwsE44dbq6qhjmjZtv14C
 n8PUxFkZ3hV8yhzgSwIOeJB4WjY9KbI=
X-Google-Smtp-Source: ABdhPJwJHPco88Uj8wrx3OoR4xB5yvrq/Uw7gxJey/Jz2WekuVsbmwEcetEZYZnZKWH9+9IAtc67bg==
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr9080169ejy.407.1631475793430; 
 Sun, 12 Sep 2021 12:43:13 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 d10sm2781160edx.57.2021.09.12.12.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 12:43:12 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mPVNg-0005gB-23; Sun, 12 Sep 2021 21:43:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210908063123.463952-1-fontaine.fabrice@gmail.com>
Date: Sun, 12 Sep 2021 21:43:12 +0200
In-Reply-To: <20210908063123.463952-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 8 Sep 2021 08:31:23 +0200")
Message-ID: <87czpd37hr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/pipewire: alsa needs seq
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > alsa unconditionally uses seq since version 0.2.90 and
 > https://github.com/PipeWire/pipewire/commit/818fb9e904a3ea43ba313994e404f1b63833c548
 > which will result in the following build failure since commit
 > a6d88d3ba5e30e11f4d726f341bc56c1be7c71c9:

 > In file included from ../spa/plugins/alsa/alsa-seq-bridge.c:44:
 > ../spa/plugins/alsa/alsa-seq.h:71:2: error: unknown type name 'snd_seq_addr_t'
 >    71 |  snd_seq_addr_t addr;
 >       |  ^~~~~~~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/65e3a9185b3b84ad78cd05f788f741b8734d2bbc

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.08.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
