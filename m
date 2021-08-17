Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4862C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 07:20:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57915600D3
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 07:20:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 57915600D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3059D40226;
	Tue, 17 Aug 2021 07:20:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mL44azmz9hjF; Tue, 17 Aug 2021 07:20:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9041A40238;
	Tue, 17 Aug 2021 07:20:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD3421BF33E
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 07:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CF7080E1B
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 07:20:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dmD9jGbmV6KF for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 07:20:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9949A80DF5
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 07:20:20 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id gt38so15531417ejc.13
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 00:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=dk64H2cWmN07uaMWxdYtH4cR+Mh/PVdQmYBH/MzkquU=;
 b=k6NkufCpE9PmFbuTrx1WWi4ku2NgEbaP2XfvrSGL37TOwrz4jRpZyBQaEXyTzMbJiS
 4xFaFscI+O+dfwtUoz0pwYq1pkClH3TTe8P2kc2+WwKwVxzKnwxKI7g2FzNs0MTSNDUS
 vgTtBKhbYqsCR2TW2nAAEIDsHHH5kq8cPbbeV7iPWzQa0X6JgtNziSqKQh/Pk1RYQh6h
 ckJnkri67zUr7ksi635D+uC35XsB42kMp7w0ySspvaeb6uXNEMDiBvpouz1srbgAzO1V
 Md0B8WEdWNsX0FqXrFUf4L5TWZHz1MyLbZ+syzSpzXrFwEitmW9jV4sev86ZXrEK16AS
 WXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=dk64H2cWmN07uaMWxdYtH4cR+Mh/PVdQmYBH/MzkquU=;
 b=cQTcuj3DXMGvS8PLwkOvxuO40eLB4+4owVpOJliQQxUbvaosNqbQWS6brrIAiEkuFr
 h9db/ZJm7TpbCB4wgCLPH21gZ9UmbJpbfSt8b1jeIF7tBGDegmwX+A5eKCvhj0P7LBZq
 oclDNXy5LeG/k+ZVx49+lI6gGRa68pNThz2ruCS4VbbgLXKkByI/lKsi3uUJE9IfTwNy
 nrxluJ1IPg7SbLCx0dqPn5DUZuGZlZ1FgRzhvCL08nNY9QH0tBLSiAU40livihEh9Naz
 ohH1LvN8xX9zwqyZWttnCpR8uwD4K+j9ITXc/E7R+kAUryjTXJ/SLYWXkC5Pn/gXVPJ2
 4fDw==
X-Gm-Message-State: AOAM5301iFkqlV/xQqHDQa51GmCgauble4BppCAMoEwB21k8Hae/PM3o
 0JHDHVz+adtJDg32x3fWA6MgkYETTxQ=
X-Google-Smtp-Source: ABdhPJybzRxnT9bkUhk2teJNkiKecl8f37vi84XP5paA7MyhVcK50nzhpbGftYwoIhVsdwpmJDiZ/A==
X-Received: by 2002:a17:906:3bd7:: with SMTP id
 v23mr2472752ejf.446.1629184818825; 
 Tue, 17 Aug 2021 00:20:18 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 u2sm366534ejc.61.2021.08.17.00.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 00:20:18 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mFtOT-0002in-Jj; Tue, 17 Aug 2021 09:20:17 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210815165845.1495680-1-fontaine.fabrice@gmail.com>
Date: Tue, 17 Aug 2021 09:20:17 +0200
In-Reply-To: <20210815165845.1495680-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 15 Aug 2021 18:58:45 +0200")
Message-ID: <87zgtg5yha.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/iozone: update IOZONE_VERSION
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
Cc: Gilles Talis <gilles.talis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Update IOZONE_VERSION to reflect what is used by
 > https://release-monitoring.org

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
