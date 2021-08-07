Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 392C4C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 20:44:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90D6E61052
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 20:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 90D6E61052
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40EBA60687;
	Sat,  7 Aug 2021 20:44:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b7AkmUaGtT_L; Sat,  7 Aug 2021 20:44:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9796060656;
	Sat,  7 Aug 2021 20:44:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 15B6C1BF3F7
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 20:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04F7182702
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 20:44:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qbamnviQzMWo for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 20:44:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC4CF826EF
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 20:44:39 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id b7so18477227edu.3
 for <buildroot@buildroot.org>; Sat, 07 Aug 2021 13:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=OYX7Fkdj6tbok8ZpgRBEc1h+nqK6XmPACq1Ie+qs264=;
 b=MngSh9Ix/X7c6DVG9MGuriDh7duG7ITePcNWZagHLTRhm+gnNAzYF5uYmMcwF1Ap4i
 zCbK0CpCdw8PC3zJo1pru8TeDhY32+oigvHckUVkt3deHumAFAzAcNlF+3Oadcq5M1zX
 YrfDF3A5QY2ww+JaaUwM71D/CLcD5Qj1rGdKbQj7eaz7N1ayQUTInPwQoVeARwHYr311
 FTtC3seR2NdE6vxjfkuHxNXUZlw0IPWSYR6HVo6eY3O4xmP04ZOoCeGPvjq38iOK4B59
 CflLAE3/WrSlKYPLZzBE2xLP8rE4ntRjXXpdRQwYT2rp6POfy+WVjAlqKz2bD05OMHb4
 s7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=OYX7Fkdj6tbok8ZpgRBEc1h+nqK6XmPACq1Ie+qs264=;
 b=HZHc1zIquLx3/4iwG/ayWDA9lgHDb6oCKlxvMHfn2MBXV7+N9cprLqYzeklXmO8ylW
 nmK5/GWtDztGBcAXZ5cKx5CFCSFMSmmGsdT/8pGjUA58KSR688Dx8EbR3VbtNjufTF0G
 145RO2mOtRtvYQGR7vNMwxU9kkX0U5nYUM2bAFUfrbZsCo+IV0Kh4SbOa2ZYcLvApBT4
 5rpvON7Y9KSd/khV02MP/kVJN+1TBrUZnoQpTW3KIDskwovbv8XiqV6HISbhut2kYOzs
 6cQh4ybRIZxVqnNFyAy/+VJuXX52uwNK2lMw5Qgx0HLZXy+sZScwRhW6yz2TPutDxneE
 0Bpg==
X-Gm-Message-State: AOAM531Ff720HA4ms4VgXn3BfXWoz7A8iEf9wQTvqEqYO3+JysHx7OH4
 bn5S2qIWKqKDj59PwFWeNK1oPDi/YZZdzg==
X-Google-Smtp-Source: ABdhPJwX9WcbocqaQUJB0FcSeUWFKc20PYWZC0h4tr7qmkhemCsgVL90AXSkhGz1N9aKBt3T2tcjOA==
X-Received: by 2002:a05:6402:40cd:: with SMTP id
 z13mr20697245edb.91.1628369077696; 
 Sat, 07 Aug 2021 13:44:37 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id o25sm4093323ejh.109.2021.08.07.13.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 13:44:36 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCTBL-0006Q7-0y; Sat, 07 Aug 2021 22:44:35 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210801212949.382493-1-fontaine.fabrice@gmail.com>
Date: Sat, 07 Aug 2021 22:44:34 +0200
In-Reply-To: <20210801212949.382493-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 1 Aug 2021 23:29:49 +0200")
Message-ID: <877dgxdlxp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libodb: fix build with gcc 11
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
 > In file included from details/shared-ptr/base.cxx:5:
 > ../odb/details/shared-ptr/base.hxx:38:49: error: ISO C++17 does not allow dynamic exception specifications
 >    38 | operator new (std::size_t, odb::details::share) throw (std::bad_alloc);
 >       |                                                 ^~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/cfd5f92f0aa923815edba5fbfcd5b7b312d9d40e

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
