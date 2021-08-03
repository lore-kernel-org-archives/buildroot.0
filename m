Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D23C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:45:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E60A60ED6
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:45:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E60A60ED6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 273A4608E9;
	Tue,  3 Aug 2021 20:45:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qpEi49lAyPqv; Tue,  3 Aug 2021 20:45:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9621C608C6;
	Tue,  3 Aug 2021 20:45:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 356131BF83C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3261681DCA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:45:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VIv2lAOVXlxY for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 20:45:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83FDB81B04
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 20:45:34 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 l34-20020a05600c1d22b02902573c214807so2550610wms.2
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 13:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=pdekQYDia3VOSuZXVUrO7w1SlsjrxvIdeLTH0cPiDAs=;
 b=EX35LtkZTkigfDYgXXxgXDTwp9SF4dsX1YrS6Fb1ETftXljwXS3hMIfnI2LvdNz+WX
 0Dss7sXMhAxCplnv8X2qmdoCIUY0Yiwkf8yG6Uvg0HM37Kmqxr0EqSqkInaQTeASNHLh
 ZOxHc6Ou1oFdp93eXsXzIqUDX8LP9pYFAA0GBeePGbT+mp4woupFWIVN0l9ewDUiTNPB
 GGLScxl+bDipL8IqbsvtZWxrRMnYjaR6nZ38TldmId+6YRFEBNDovYgP7bm7+Ohbm0/g
 I1uAmeYinLmM05cCeuKCsU5k9zREE6LIvHSSDmhjV/fQxqiq8Wk3jREWRIs4c1eFz7/4
 6NdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=pdekQYDia3VOSuZXVUrO7w1SlsjrxvIdeLTH0cPiDAs=;
 b=g6KHFXEXgVUHcTD2MbwcYulS0FQWLHwbt1Db3m++aW65q3mXky9hXakvREL/wKKH/r
 vm2Lnwlj6h/5Tzr+52MfdSw01+3GuPo6PWiSQ2rNcQg62hWrwR9bRNgP024eAU9N9tSi
 q1+gdKxVKp7599dsaoHmM4lUNi3ax87NXF4EtWSIrxnBlltoMQUSKhsF4Ic3/BlpStWQ
 HyEeSFrGIngXdXxKaIbkYTibo5tLHoex1xHY1hVVqACnFRVva+6B0+1/DEzC1+YjSQXe
 EU4DF8KlbMnEHIu4NSXuvUt+0E4rf3o7MSUytW2TlcM7+6DvKBQj1dzPOFjRpV1ivm2k
 Izzg==
X-Gm-Message-State: AOAM533DdLHJaIx2CEYBzmE6ZPkeNMMuRHeFpql7YB6fTYZU5oweh7Aw
 N35qQNud6IxmUgAKtGwWvKo=
X-Google-Smtp-Source: ABdhPJzebo80lO9SNt6dabRjJ07lwAo7fgY1Pir7M9qOsHJd7LgKYEw9ag4Lrjw9LtdELQA+uzIhlQ==
X-Received: by 2002:a7b:c8c8:: with SMTP id f8mr15945644wml.6.1628023532609;
 Tue, 03 Aug 2021 13:45:32 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id z17sm21186wrt.47.2021.08.03.13.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 13:45:32 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mB1I3-00072R-3w; Tue, 03 Aug 2021 22:45:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210717212439.1146952-1-fontaine.fabrice@gmail.com>
Date: Tue, 03 Aug 2021 22:45:31 +0200
In-Reply-To: <20210717212439.1146952-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 17 Jul 2021 23:24:39 +0200")
Message-ID: <871r7auuj8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/dovecot: ignore CVE-2016-4983
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > CVE-2016-4983 is an issue in a postinstall script in the dovecot rpm,
 > which is part of the Red Hat packaging and not part of upstream dovecot

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
