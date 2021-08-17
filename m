Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E3EFC4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 15:42:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9A5660F58
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 15:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E9A5660F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B159F404B7;
	Tue, 17 Aug 2021 15:42:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tKA_l6D0ShvS; Tue, 17 Aug 2021 15:42:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A2FE404BF;
	Tue, 17 Aug 2021 15:42:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD5561BF2BF
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 15:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9E4C404C8
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 15:42:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fZVlKmRnMrDx for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 15:42:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1E0A404B7
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 15:42:08 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id lo4so39393749ejb.7
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 08:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=ARQlfp8OdQC8s2mqntHHlB49tQvVryYnJssx1a43DoU=;
 b=iBbJGcbcoz8LRlFl8TsySRjzefvnug0fOeMxsWB079eCq9DUiEfMDfWH9ACesv7oZi
 ABBgrC51Hnjra3G5/vaAQHesGJhHBi4OcxyD7N3qAz3ypqKB3etIFfv4XPtxsYcT4qjQ
 izwAnyQFhnTPhurcEN5GYQaepKgro/sktlB5oqMRV2RYQJGlZWNuIhq5vX1WYwUsFxC6
 kT5iTTFM2X+oo1+lC5z06Q66EqOePeBNDCgO8rfvPROP9sjGW+XYX1xJzO7nt7lLyel0
 Qo7CgCP1c0WZhAIenaEJ/o5fogdQC7iuqdWPdqOFBf+uqQpiF02SgIPwbeQU9gcKUd5A
 ySbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=ARQlfp8OdQC8s2mqntHHlB49tQvVryYnJssx1a43DoU=;
 b=Kf5f+DTLiYEMzoAz6Kp3LDS1X5vxWtCx2LzfYjREKHfBPSGaFeUbaH1nZ5vUGBOPAm
 VU3se5bfyRbtayFyYGsLxYl+SVAd927LtEkU1M42Ey080qBsbRtexDevippFse2IzY6a
 sD5ALwnEHJ9ausUwjRVmJoO+GfxFBEqP5barPPcRMi0mwVCOFqhT4YPP13KGO2Lvr71i
 Zz+pzHK0pGynaIM1fvr+SYx4eVtUoHGBLvPd6AC8VxgLxp5yF6WBVqOaiSA10U/5JTm5
 o13DoNwchYluqHuehXirMz5Gr6Tf5x36nMuRDIuTLGwgrOFEnk+HWvzrQmZ/HC43esGV
 cDBQ==
X-Gm-Message-State: AOAM531WgEM/l8lThE1d07x7xRRXKXcvlwANCWSGsfnTrZf6tboifZEU
 Itvy1Y9IvaiLBPFi7EHm3Ms=
X-Google-Smtp-Source: ABdhPJw2N5x/CdQoz5b0fFDeETcfF3L9NBoX2CyS80/d2arqDz+pA4CFNdAN2G0KyjBE9rAAF36bpg==
X-Received: by 2002:a17:906:7714:: with SMTP id
 q20mr4733873ejm.551.1629214926900; 
 Tue, 17 Aug 2021 08:42:06 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 v6sm934489ejk.117.2021.08.17.08.42.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 08:42:06 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mG1E5-0006Qp-FY; Tue, 17 Aug 2021 17:42:05 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <871r6s4avr.fsf@dell.be.48ers.dk>
 <20210817125624.54e64a83@windsurf> <87wnok2upg.fsf@dell.be.48ers.dk>
 <20210817131229.4932baf0@windsurf>
Date: Tue, 17 Aug 2021 17:42:05 +0200
In-Reply-To: <20210817131229.4932baf0@windsurf> (Thomas Petazzoni's message of
 "Tue, 17 Aug 2021 13:12:29 +0200")
Message-ID: <87im042i42.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2021-08-15
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

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 >> What was the process for reporting issues in the CPE data again?

 > E-mail to: nvd <nvd@nist.gov>

 > Make sure to give enough details about the issue, the last time I
 > interacted with them, they really wanted good explanation and evidence
 > before changing/adjusting the NVD data.

Thanks, it should be fixed now:

Thank you for bringing this to our attention. We appreciate community
input in order to provide the most accurate and up-to-date information
as possible. After reviewing the information provided, we have made the
appropriate modifications to reflect that the affected versions of
Mosquitto are up to (including) 2.0.7. Please allow up to 24 hours for
the changes to be reflected on the website and in the data feeds.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
