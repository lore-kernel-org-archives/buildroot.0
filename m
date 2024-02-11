Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D466C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 12:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD11B8227C;
	Sun, 11 Feb 2024 12:15:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nOREVQA5dvPH; Sun, 11 Feb 2024 12:15:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C62478227F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C62478227F;
	Sun, 11 Feb 2024 12:15:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F11E31BF33A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 12:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE2278227F
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 12:15:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TVvYa4IvppN8 for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 12:15:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::217; helo=shout02.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EB0708227C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB0708227C
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB0708227C
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 12:15:37 +0000 (UTC)
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout02.mail.de (Postfix) with ESMTP id 62FB3240CD0;
 Sun, 11 Feb 2024 13:15:36 +0100 (CET)
Received: from smtp01.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix03.mail.de (Postfix) with ESMTP id 4642A80382;
 Sun, 11 Feb 2024 13:15:36 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id D9FFA240AC6;
 Sun, 11 Feb 2024 13:15:35 +0100 (CET)
To: kilian.zinnecker@mail.de, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 11 Feb 2024 13:15:35 +0100
Message-ID: <6015348.lOV4Wx5bFT@laptop>
In-Reply-To: <08b6187c-94f2-4cbc-b0e8-0066ca687796@benettiengineering.com>
References: <20231204231212.36450-1-kilian.zinnecker@mail.de>
 <20231204231212.36450-2-kilian.zinnecker@mail.de>
 <08b6187c-94f2-4cbc-b0e8-0066ca687796@benettiengineering.com>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1684
X-purgate-ID: 154282::1707653736-D952E878-29DB8D2C/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1707653736;
 bh=ELwnaDVngga6V8H/3JQD8Fyc0Wl/FjzfWTbTDAejFIE=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=k/ZUjmb4iDGoa0X17bDdT0hjTK7wRuisOUzFVRnTeCL01NvBoVz1emYLoonQhnPGz
 YDgkJzv34IQ0YOq+zvK0walFCInRDvAxHcdduVDBN8P58LASGVk8821Sir9ltUfzeW
 G/QtV1RG4/EkhukfT37hbRdPbo9/CjdgFE1r/UbT29n2dAVHk+1pPJqkFjAwkw3b5Y
 UVO1zCqqusknsgvqUqLe53AmMf5H3L/YtU8Gk6bHuiGnb/KMSS3aY0yWNffsYoGfcC
 6gbTAysxxaITmifscz7lHN2zJjKHJW/xLosmsy4YbGwfl+SKWu/1BFMo0Ck4HEHeY3
 IlQykg3ugG0JQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=k/ZUjmb4
Subject: Re: [Buildroot] [PATCH v2 1/2] package/xuantie-bins: new package
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
From: "kilian.zinnecker--- via buildroot" <buildroot@buildroot.org>
Reply-To: kilian.zinnecker@mail.de
Cc: Robert Nelson <robertcnelson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio, all,

[--SNIP--]
> can you please provide a separate patch to alphabetize?

I did so: https://gitlab.com/buildroot.org/buildroot/-/commit/
53fad3242d74b9fad11978429d6cc2879f783f4b

However, unfortunately Thomas de-alphabetized it again when he applied my 
RZBoard V2L patches: https://gitlab.com/buildroot.org/buildroot/-/commit/
f003675119c9ca503afa19c04074e81c49538baf

I just send a v3 of the BeagleV-Ahead patches. After we get this series 
applied, I will then again send a single patch to alphabetize.

[--SNIP--]
> > --- /dev/null
> > +++ b/package/xuantie-bins/Config.in
> > @@ -0,0 +1,6 @@
> > +config BR2_PACKAGE_XUANTIE_BINS
> > +	bool "xuantie-bins"
> > +	depends on BR2_riscv
> > +	help
> > +	  This package provides binary blobs, needed for the
> > +	  BeagleV-Ahead's SoC (TH1520).
> 
> Can you please describe a bit what those binaries are meant for?


I gave a brief description, but I don't know much about these. Maybe Robert 
can give even more information, if more is needed?

[--SNIP--]
> > +XUANTIE_BINS_FPGA_BIN_FILENAME = "bins/light_aon_fpga.bin"
> > +XUANTIE_BINS_AUDIO_BIN_FILENAME = "bins/light_c906_audio.bin"
> > +
> > +define XUANTIE_BINS_INSTALL_IMAGES_CMDS
> > +	$(foreach f, \
> > +		$(XUANTIE_BINS_FPGA_BIN_FILENAME) \
> > +		$(XUANTIE_BINS_AUDIO_BIN_FILENAME) \
> > +		, \
> > +		$(INSTALL) -D -m 0644 -t $(BINARIES_DIR) $(@D)/$(f)
> > +	)
> > +endef
> 
> Being only 2 files to be installed I'd prefer to see 2 lines instead of
> foreach loop. Can you please change it accordingly?

I unrolled the loop in my v3 of the patches.

Thanks for reviewing and best regards,
Kilian



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
