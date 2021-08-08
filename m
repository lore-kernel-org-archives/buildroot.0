Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576F8C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 09:31:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2A6C60EE0
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 09:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D2A6C60EE0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 947CB834C6;
	Sun,  8 Aug 2021 09:31:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id itgcmHx_nBae; Sun,  8 Aug 2021 09:31:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3BD583486;
	Sun,  8 Aug 2021 09:31:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE70B1BF408
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 09:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDBB783486
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 09:31:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D7MpWyoc962l for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 09:31:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 005A183434
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 09:31:29 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id x14so5015534edr.12
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 02:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=pmLGIpv8U9Hqq8JvbHRqydCwHlapP2WsFicnvu8rGYQ=;
 b=NScTgSCvaqBnKPbsVGWEMtj6BVCmAwRFO4gM8+jJHaCt2lBF5M1lf1VaRA9J9qT+zM
 7tJeMK6s9+15v4vuzMG28ZIxK0FPUsRr8ay7CODG5FKbyrg0Ed4MZiKqh4fZf59BJKD9
 5TOsqpJoukvgx/OFAo7QwoHfRzNFn8nX63RVoJhARcrY+WEr6hK8OJyB0FjYQsf3JBpq
 uXoOr+s+dEbm+sMZAJFKgDLIFLq+zxMV0mpc75Xmy+tYUwvmTpE/gbT0cPGWexwvSxSa
 7b6mYIb9KaNOOCQVYGVMieOQ4PzEStvPXQLl00oFcGON6QRWr2AK3uxAGCBshiniUSXD
 Objw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=pmLGIpv8U9Hqq8JvbHRqydCwHlapP2WsFicnvu8rGYQ=;
 b=kUKzCAC/tsmOPaENTiIykFXavFSd6aE3aDcxqRqnUbf3hVO1213UDKZQfF9n9JuDpX
 k0EKz6jYjesJV4zuaxp58gGPIDPkGb9g7FsHolOupvY+dHvfwuMoHeV3ha4kTFFNkfPH
 wK51NvGOwBpOPhEKUo1QcGewwQmyxm5GljVIW5N2d6/n/T9N/fWu3DcHUvG9XzpDRpx4
 vAejh/J0HknptA0j/zM2dhMxDWn+0WMVxdh90Usu0GppF8U4DqEFvvpKSn1LHxdwya8A
 Rw9XXgO1bMUIMN6nyY/ANlcJeW4xO8BOYwg7H4LtpvJIiAQML4RhxzLvL0MEzX4asIwm
 bGyQ==
X-Gm-Message-State: AOAM5335vns8Jf5g1t5pm64FQixdLDNO36EBXtFr2qgkoDXzCDVXcipr
 2t+fccgypJHG+kb2dRXj+BnfTaMJzdepkg==
X-Google-Smtp-Source: ABdhPJwqeN6a5GZoEphdh3HSTw7KeRwLAhkQxBz9EpuQHXOXDGvVY4sduVpJBcCkNon6iW/713lSNQ==
X-Received: by 2002:a05:6402:1289:: with SMTP id
 w9mr23177226edv.127.1628415088215; 
 Sun, 08 Aug 2021 02:31:28 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id l9sm6554530edt.55.2021.08.08.02.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 02:31:27 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCf9T-0002xi-11; Sun, 08 Aug 2021 11:31:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210803134633.4009691-1-fontaine.fabrice@gmail.com>
Date: Sun, 08 Aug 2021 11:31:26 +0200
In-Reply-To: <20210803134633.4009691-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 3 Aug 2021 15:46:33 +0200")
Message-ID: <87a6lscmfl.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libodb-pqsql: fix build with
 gcc 11
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure with gcc 11:
 > configure:13698: checking for libodb
 > configure:13772: /tmp/instance-1/output-1/host/bin/arm-buildroot-linux-gnueabihf-g++ -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=2 -D_REENTRANT  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.cpp >&5
 > In file included from /tmp/instance-1/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/odb/exception.hxx:15,
 >                  from conftest.cpp:26:
 > /tmp/instance-1/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/odb/details/shared-ptr/base.hxx:38:49: error: ISO C++17 does not allow dynamic exception specifications
 >    38 | operator new (std::size_t, odb::details::share) throw (std::bad_alloc);
 >       |                                                 ^~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/73b06d7f923e5a7294377951f212b89b6cb0946a

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
