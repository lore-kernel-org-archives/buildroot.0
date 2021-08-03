Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1543C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 09:14:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C08C60F0F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 09:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C08C60F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5D00606EF;
	Tue,  3 Aug 2021 09:14:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AZXJq5NYMWum; Tue,  3 Aug 2021 09:14:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CDAC60595;
	Tue,  3 Aug 2021 09:14:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA7AE1BF2B0
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 09:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A368830D7
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 09:14:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ujbsV-1HyVJA for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 09:14:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A1FF830C0
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 09:14:01 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id p21so28099581edi.9
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 02:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=+BDxJL8+3hJBrrTwimFeT/iJ/ha+2FHSXyMKQniYMuM=;
 b=FtwIr3N68la7x96nOICiBALzlTdmn4g1PN+An670lT5jlhMyeulhrrkdb9Sn5gn+SJ
 aeNu5bwQzMYG/oTqmNSt2rxWFfuYuVh3zrQzIRLe7MwI56aXRnYedV9sQ96+5vbSjtRV
 py3fZdm+Y6sJe03f4WrCduaBpaib4z1TGnHUIruo8I/funlv65WhJP2Acdx8PxEbumLf
 C6i8J4836TRAve22k10N4G8DAa+kkivODDy1yKjpLiICkz8HfA6NXO5YvW1nzKtRzBDt
 /AH5rO2kqEMI0jzytDQrgOMk3Xdsdzl9+R8CBw/V82UzAFw5XBobwu05UvxLYCopBFls
 b0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=+BDxJL8+3hJBrrTwimFeT/iJ/ha+2FHSXyMKQniYMuM=;
 b=W1onFOfpZfuzeLEyxLoYwJh8hqtGw3AniWt0pMVtQKBZlpAhbplQGyI8xEd3F1vOII
 MdLsAzc0E2ehd3gWRnCX4xoU3yH2h9M+Ntv/LJuwkHEA4oDnW77kgBqg0tCuLBJS72vQ
 cT9hL6Qduq4YOL0EOszjDi1irIb/twTyy0Uk4+tpPR7JTLvRzAQqRIchhayYnxxkVHT9
 EakL4iQR15/6YIxpyqNqT4ixcXd0D/DcmX4FEk2l3fBCmFyoopKNOytjGuISrdE5F6V3
 GDl2Oa/1h7QOc5ecVR9vy6wZkR2RZXZsSuzfvQjo66+YA0K+4maELwT5wn/DSKqiiQdl
 GVHQ==
X-Gm-Message-State: AOAM531+5YyA6haMvw2+ykFdgQ9NUbCPgbrcN3IT7xyJsjT9TUsM/HBH
 G3F9cQ47IB7AI8uGbzAYWln1CAWz+Xv2tA==
X-Google-Smtp-Source: ABdhPJysffxMZ7nrbeQfWhDAIch1qKR+83y1/rm8A0E9YHLQEyFTepsLXZ+HPjnLGb0NyNvRsX9RlQ==
X-Received: by 2002:aa7:cd03:: with SMTP id b3mr19754529edw.54.1627982039796; 
 Tue, 03 Aug 2021 02:13:59 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id c15sm7835657edu.78.2021.08.03.02.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 02:13:58 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mAqUn-0000iY-G5; Tue, 03 Aug 2021 11:13:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20210712104501.2276261-1-giulio.benetti@benettiengineering.com>
 <20210712104501.2276261-2-giulio.benetti@benettiengineering.com>
Date: Tue, 03 Aug 2021 11:13:57 +0200
In-Reply-To: <20210712104501.2276261-2-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Mon, 12 Jul 2021 12:45:01 +0200")
Message-ID: <871r7azy96.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/binutils: fix linker assert on
 OpenRisc
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > When building openal we were seeing the assert failure:
 > /home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld:
 > CMakeFiles/OpenAL.dir/al/source.cpp.o:
 > pc-relative relocation against dynamic symbol alSourcePausev
 > /home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld:
 > CMakeFiles/OpenAL.dir/al/source.cpp.o:
 > pc-relative relocation against dynamic symbol alSourceStopv
 > /home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld:
 > CMakeFiles/OpenAL.dir/al/source.cpp.o:
 > pc-relative relocation against dynamic symbol alSourceRewindv
 > /home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld:
 > CMakeFiles/OpenAL.dir/al/source.cpp.o:
 > pc-relative relocation against dynamic symbol alSourcePlayv
 > collect2: error: ld returned 1 exit status

 > So add patches to fix this binutils assert link failure on OpenRisc.
 > It's been suggested upstream and it's pending here:
 > https://sourceware.org/pipermail/binutils/2021-July/117334.html

 > Fixes:
 > http://autobuild.buildroot.net/results/c96/c96f2600f227d6c76114b9fbc41f74a57e40415a/

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
