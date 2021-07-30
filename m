Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD7BC4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 13:59:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C250360EFF
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 13:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C250360EFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8466583B7B;
	Fri, 30 Jul 2021 13:59:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vnGtBSgjB0y7; Fri, 30 Jul 2021 13:59:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B461F83BA4;
	Fri, 30 Jul 2021 13:59:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C956B1BF20B
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 13:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1A2E83B7B
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 13:59:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QxR8T7YZ72rj for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 13:59:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9410083506
 for <buildroot@busybox.net>; Fri, 30 Jul 2021 13:59:06 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id d6so5682978edt.7
 for <buildroot@busybox.net>; Fri, 30 Jul 2021 06:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=QKKGI5bq8hJn4aPUkzwsNasxBuJa2HDH8c9mM/fxvi8=;
 b=cIQbZ8U4526LdAziPIj1TuQLDT5MNHqfg2kwy13Ht13NcxtLg++0xQZ6toIgtxr9Re
 /6crFxBzqziikMX4NeZEVDGXWowTsLVEVUExAV20Pf3T+4kr6pndvwnj9eytpDh6edVn
 wpWijIDz4jN7+zjWl2yNkM6vmYMwQkdRvlUYW0B1tSpjCwO8XnWDIGQMdFn3nOAKkOxe
 516n2jWy7e+jjVxR8alyUMGAKVE1CXyL4JZJZRbhE7ykTdnkKm6qWcyRXPvsEorp2dN7
 jMdwW7/w5UWXwe1ntsYzelnYSOaqAHqjulFL9vG3URsCb3m1bfcdO5VsCM6G8APb7V5Y
 xmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=QKKGI5bq8hJn4aPUkzwsNasxBuJa2HDH8c9mM/fxvi8=;
 b=m7aygsy/zGzBYTD14QvAMu2PV1mVd3+QZQVWiDn657XBo0Y5zwmY63/4f1PitDkFs9
 DkVRagdC2zLjuwJUg4FDntA6Mj2c6AFUsFxOo4fMCqgO8wYcKzuG/Uc1fcMLWoLbz/2t
 mBWnmBK8PEfMebWZoX0lNiBNjTbJT8sCTc6ucQ9UwamjQgQYNixeVhN7GyxYRBNwizEd
 QhV289qSiXpCeJP867BNKEZOSk3E0mvFHabH5DLALRhYO2lEOeTIPrfZ2QY+U8xBSAK0
 5dlbpDnjVYi5z1JjUmOLzeEjFNr3Jp6AWHOe+0i31VXu5YsD25SuYreXG4DVtC6MuAoo
 PByw==
X-Gm-Message-State: AOAM531CpJWTZQ8ZjW7wiNahhYqB14BgRG574PH9ncZ43R2VyOJQmPOP
 vIbpXSWO5mpZHBywmt4roMs=
X-Google-Smtp-Source: ABdhPJwQATOT+etVdrl0hS8jDJyzJRllgWNmUGsnvEwOhM2UY4iQ1WbWRwOFBpDKTPLve04q5u0kSA==
X-Received: by 2002:aa7:d0cc:: with SMTP id u12mr63789edo.238.1627653544841;
 Fri, 30 Jul 2021 06:59:04 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 t24sm730144eds.60.2021.07.30.06.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 06:59:04 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1m9T2V-0002AM-Dl; Fri, 30 Jul 2021 15:59:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Francois Perrad <fperrad@gmail.com>
References: <20210713135344.1196117-1-francois.perrad@gadz.org>
Date: Fri, 30 Jul 2021 15:59:03 +0200
In-Reply-To: <20210713135344.1196117-1-francois.perrad@gadz.org> (Francois
 Perrad's message of "Tue, 13 Jul 2021 15:53:44 +0200")
Message-ID: <87tukbzyvs.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/nettle: bump to version 3.7.3
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

It would have been good to mention that this is an important bugfix and
should be backported, E.G. from the announcement:

        This is bugfix release, fixing bugs that could make the RSA
        decryption functions crash on invalid inputs.

        Upgrading to the new version is strongly recommended. For
        applications that want to support older versions of Nettle,
        the bug can be worked around by adding a check that the RSA
        ciphertext is in the range 0 < ciphertext < n, before
        attempting to decrypt it.

        Thanks to Paul Schaub and Justus Winter for reporting these
        problems.

        The new version is intended to be fully source and binary
        compatible with Nettle-3.6. The shared library names are
        libnettle.so.8.4 and libhogweed.so.6.4, with sonames
        libnettle.so.8 and libhogweed.so.6.

https://lists.gnu.org/archive/html/info-gnu/2021-06/msg00002.html


Committed to 2021.02.x and 2021.05.x with the commit message extended,
thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
