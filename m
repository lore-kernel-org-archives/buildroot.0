Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F51C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 06:56:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB81560720
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 06:55:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB81560720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB2DD80D82;
	Tue, 17 Aug 2021 06:55:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yeZxOU2DR7ub; Tue, 17 Aug 2021 06:55:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5CFA80D8B;
	Tue, 17 Aug 2021 06:55:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E4EC1BF341
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 06:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E4FC80D44
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 06:55:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FwM6U7if9WMg for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 06:55:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70C4880D8B
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 06:55:49 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id b15so36520710ejg.10
 for <buildroot@buildroot.org>; Mon, 16 Aug 2021 23:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=K7fW2Awzy8dOCW/CJc/0Z3K61saiGb9zkygXhPYcx+8=;
 b=j/nir/5YkZ5ggcAM+U6zQ3BWAVdHHelpRKtLBfbR0Fr0MLPAJQS2771I8S1Uc6L+Cy
 Q8P8HF6uV4+bQwtGItHR6jS29vFYB0gIHHu5lcrCPfxaGjB7cuTQYW7ZfTESg5i8CQD2
 TGWjr7SBYD8nx7JySE3UacLnG1ryfUcGWOx5bU2IxY4cIFLso4OOcT3ler63lJUuoRf4
 8lKrEPJ4XUkqjeFN1KPyFUClsV125AaF6F8iJKMLnmynzu0nK5/HKvcok+LgRtbTkBg0
 Fq5hq9fEoJVS+LSrqTz91MdFVEp3xyIOMl4UQHxo4vHEO7OluPWikrVrZRZ/nVRXOX2G
 qPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=K7fW2Awzy8dOCW/CJc/0Z3K61saiGb9zkygXhPYcx+8=;
 b=iwn6uYleESI/sPgKKHzthZlsdhU5KSwkXac19B1bg7keeC2cUIpo9pdBvFqWXTtoQq
 LSwLJuyP7oLMbD+0okGPdTmJL8N85qWiucK46fVydBLgds0vZMliGHU7OVvpsRqfp5RK
 l2Nb3Tw/++NiHfMeZmL95FB0wMrjjyukgh/+R5L06SNM8BgfMItcs1V0ahyFWcmRUPP2
 UbakNJSPWkpP+/yzoqDJj03UvTa3yDZ1uaypziq8ENJstt1NtsRPdhrBcDsS039PYowv
 N/FmwoD97qzUQ9QDy+MOJjSH7SEEnf5dbzIPd3wU6dHRJEl+NHj5QKljgxu9xK20ndfQ
 nI4g==
X-Gm-Message-State: AOAM533KMUnjxWqo6StxPzlLZ2DGyaTvPoq91txc3Ow9LMdLuF2aMwP8
 fky9nTnVwrh/vLzSNKs12p4=
X-Google-Smtp-Source: ABdhPJxhRgiul6Lmq7/+2RiDr/fqNtLaVPJVXs977KDXZzyf/WDGXsO27fv5mFVJhIZLIugsSvovJQ==
X-Received: by 2002:a17:906:184e:: with SMTP id
 w14mr2273842eje.526.1629183347267; 
 Mon, 16 Aug 2021 23:55:47 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 x4sm343632ejb.106.2021.08.16.23.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 23:55:46 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mFt0k-0001fb-1R; Tue, 17 Aug 2021 08:55:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Christian Stewart <christian@paral.in>
References: <20210816224237.983048-1-christian@paral.in>
Date: Tue, 17 Aug 2021 08:55:46 +0200
In-Reply-To: <20210816224237.983048-1-christian@paral.in> (Christian Stewart's
 message of "Mon, 16 Aug 2021 15:42:37 -0700")
Message-ID: <87czqc7e6l.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/go: security bump to version
 1.16.7
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Anisse Astier <anisse@astier.eu>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > go1.16.7 (released 2021-08-05) includes a security fix to the
 > net/http/httputil package, as well as bug fixes to the compiler, the
 > linker, the runtime, the go command, and the net/http package.

 > https://golang.org/doc/devel/release#go1.16

 > Signed-off-by: Christian Stewart <christian@paral.in>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
