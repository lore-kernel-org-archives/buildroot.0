Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B91C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:01:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E4A3600D4
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E4A3600D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A1C382CAC;
	Sat,  4 Sep 2021 20:01:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tKg7rUHHzJOT; Sat,  4 Sep 2021 20:01:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BF2382A72;
	Sat,  4 Sep 2021 20:01:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C72981BF31B
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B525840169
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:01:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zMlGf-d4B5Aq for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 20:01:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71D3B40167
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 20:01:29 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id n27so5020803eja.5
 for <buildroot@buildroot.org>; Sat, 04 Sep 2021 13:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=NAxhPu5nPJxgkTlfTo9Ln0Pwld6sPsqSYCdOGSmfms4=;
 b=gBE+I6HbQo75zF/9g/aGZKNgmpTGJ49TXj7u18NnFnRhjmR/KYkLN0tk/aGIuywStF
 xEInbM7tSCp5rwUssdW4boetozCrgzPDjTg8T+Zt5MofdpoIqA/vjnl3e2DP5lS2wms8
 FR+2uVuJ3fk3CON9d4yDWkta/qtl3cZptEk8f9U7GSlIm9TTv2DkO/Xy6H7Nmh298Yfv
 G9WWuJevnc3TpqTGNBGM3z1IyFf+HGXowDKx5hbyDYCDfgGUV/GIr4pk6qBqNUhakOmo
 fn/9II2yeAQHc3yvvkTIEfVUhwE1rXcYNlVbtSadd066oIj5T8VukghI19OI0hsG1hIp
 bE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=NAxhPu5nPJxgkTlfTo9Ln0Pwld6sPsqSYCdOGSmfms4=;
 b=OsYdC/nnon0lzY9qkBaYskjVZAbnV1Nhzx5LPzGAW3YxCZQC2aPvcqN2Yf3OHj32/y
 bATBQkyQyIv1EFH84BVpmlu7tDK8tJKdmQcwBo2qmFeECx4TzjfI8jVkaIMY31oKkJXb
 NM8UyDoaURjvM4Ap1BWymzm9fzZTQPJZuEZobWwRd9r6QiOyQ+WdMTyAcGsrbHi6I6fB
 eN3gWQNboxOtBjqu9UihNkpLrWTIlHnBSOOmWrQ9WTGyH1BonGMFpVOI0I5UM5N1aAVV
 9/0TjXM7anbw9MkoRacYHniWDKXiIbjqx2QaqlitorAY+sPsDP3IyuCMYL+PuqFDZfdG
 bhNQ==
X-Gm-Message-State: AOAM532KiTHLCJYalogCheJlEAZfm7Zlzyh0t3+lvlo9bEgLuh1eIuN6
 dacSDmU3BCwLPNjPuoRFwsD9WQGE/G8=
X-Google-Smtp-Source: ABdhPJwKNYFniI4a+OYAjX7AGnF1W2JA7ckGPzWWEfoPgnXp9sJqvpAUW/t3hnvygCjoOSkYMLtS+g==
X-Received: by 2002:a17:906:2642:: with SMTP id
 i2mr5562321ejc.323.1630785687740; 
 Sat, 04 Sep 2021 13:01:27 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 d6sm1811684edx.0.2021.09.04.13.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 13:01:27 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mMbqw-0003oS-HK; Sat, 04 Sep 2021 22:01:26 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210807194031.1501659-1-fontaine.fabrice@gmail.com>
Date: Sat, 04 Sep 2021 22:01:26 +0200
In-Reply-To: <20210807194031.1501659-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 7 Aug 2021 21:40:31 +0200")
Message-ID: <877dfwp0tl.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/ffmpeg: add -latomic to pkg-config files
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > -latomic was added to extralibs to fix static build of ffmpeg in commit
 > fc8798197b57488a852e2c14b4677b5eb0114a0b. However, extralibs is not
 > added to libavformat.pc resulting in the following static build failure
 > of motion:

 > /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
 > /home/buildroot/autobuild/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libavformat.a(fifo.o):
 > in function `fifo_init':
 > /home/buildroot/autobuild/instance-1/output-1/build/ffmpeg-4.4/libavformat/fifo.c:519:
 > undefined reference to `__atomic_store_8'

 > So add a patch to add extralibs (and so -latomic) to all pkg-config
 > files

 > Fixes:
 >  - http://autobuild.buildroot.org/results/62ec618e40081a250b8129ec6f5a178eb06fba1d

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Yann E. Morin):
 >  - Add extralibs to all pkg-config files and not only libavformat.pc

 >  ...igure-add-extralibs-to-extralibs_xxx.patch | 47 +++++++++++++++++++
 >  1 file changed, 47 insertions(+)
 >  create mode 100644 package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch

Committed to 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
