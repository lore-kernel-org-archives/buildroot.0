Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A9B5C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 18:08:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7C4960E8D
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 18:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7C4960E8D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3922401E9;
	Sat,  7 Aug 2021 18:08:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CdPlNjcXAfm8; Sat,  7 Aug 2021 18:08:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1E8540019;
	Sat,  7 Aug 2021 18:08:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B6A51BF403
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 18:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39A5D401D0
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 18:08:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I1A0Rcarf54x for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 18:08:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C21EC40112
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 18:08:48 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id u3so21221825ejz.1
 for <buildroot@buildroot.org>; Sat, 07 Aug 2021 11:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=ARjvuXX+KC1M/wC5qZy9GmPmK0VdlgX0x++UfG6zLjw=;
 b=FkxfwB9BMdRJQHVfylD+uqnAddyp6r3Z/4p8R4ztUpHJeQkeYwUqdNUTXW/9JnoRdI
 r1VQok57i6ae072Sbxyil+PejwkomSuft7dHA0PyuLjXjQJ8L2E4p8Y2wASnDDTiOnmm
 Q2nqH16s31eRfB0gUTcBDusRduZMhs1Sf0w+Aq7b5NliZomV+5HlaM3UUrat90gxahxX
 FcQpXFEIcX8daP+Tp2ZV8aSV2DJ7qzUIxiEXC9jPJnZrJxjw3I6JQRpvqK9AQ5WQKwZ1
 vXVP+2eRjfNqtxW84B8+aDX/TaOWQeJz/N6XQIDZzqjo0xNtYkuf45b4XuNwFWNdR0r+
 Pphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=ARjvuXX+KC1M/wC5qZy9GmPmK0VdlgX0x++UfG6zLjw=;
 b=UbYobT4pCXQ6D/WupwuMidC9nuXvYaGYKqOnxEkfe8QAs8gSE1TtHHMwXNxYRxn6DT
 sw+w1/GfyctF32kkRBYv9kDqipvXqTNLSJ+RZCVJDyvpuZKXDZX0wpGg3/52GJ8VhIe3
 ozHvbJTmf0OFID4SKAeBgug15xcRBQHbLHWlHD/Xt+9vSjwg+7zv4KSicOZZsToB8SGh
 n1k5LENJHgUSLIsN6EQzVQheijq+jvrBtgSGXdQ0EcO76j2shtFTT75g+rYWX9Oh4xlK
 61wM4j5KkBbp+PBISSbpYL7+q8sNlrCrKtt1SUIHZ94JXsumZqdCzL46EGhvjSRUZSrV
 sPwA==
X-Gm-Message-State: AOAM531VL2g/yyWAyrJgV8Za7PaDjA51B4CnHlHKqs/KS9+3VXs+j68H
 EKqeNw82g+A2oK1h7jtIyr+TR47yr8H9/A==
X-Google-Smtp-Source: ABdhPJx8NdsMdPxdy29d1kQsPWLus+SSmNuhSCjCET6fm3ZiZ3rSp17zjkPT2EROAABr9J1DkvW1nA==
X-Received: by 2002:a17:907:98e1:: with SMTP id
 ke1mr15562295ejc.162.1628359726916; 
 Sat, 07 Aug 2021 11:08:46 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id b17sm5343452edd.27.2021.08.07.11.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 11:08:46 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCQkX-0004Xf-9e; Sat, 07 Aug 2021 20:08:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210801120036.2911538-1-fontaine.fabrice@gmail.com>
Date: Sat, 07 Aug 2021 20:08:45 +0200
In-Reply-To: <20210801120036.2911538-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 1 Aug 2021 14:00:36 +0200")
Message-ID: <87tuk1dt5e.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libfreeimage: add CPE variables
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
Cc: =?utf-8?B?UsOpbWkgUsOpcm9sbGU=?= <remi.rerolle@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > cpe:2.3:a:freeimage_project:freeimage is a valid CPE identifier for this
 > package:

 >   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Afreeimage_project%3Afreeimage

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
