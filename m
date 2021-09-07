Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75071C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 13:53:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB04C610FE
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 13:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB04C610FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FBF580EEF;
	Tue,  7 Sep 2021 13:53:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LhV-XPhZjHZr; Tue,  7 Sep 2021 13:53:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB19280ED9;
	Tue,  7 Sep 2021 13:53:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 781E01BF2CC
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 13:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66DFF40169
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 13:53:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L5opHM3U6lKq for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 13:53:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71B0540147
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 13:53:07 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id e21so19793440ejz.12
 for <buildroot@buildroot.org>; Tue, 07 Sep 2021 06:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=bkZWiHCPG+F1czRUZaaWX/s9jLTSogWAteShF/KlgPs=;
 b=MxJ9rUQxyYYzRIDkw7eFFgh1fZqvHFk4iuVBkhGN1vhtG5Ngj1Qy7vv5PArkrWVlM7
 B4R9nL0b4HPn8taYaTGy2M/7VbhO5+3aGl+W6KLg9bLn5FalTOtF6eS0+AGtDdkOoRMi
 YWe03QZKTLFdIIS+D+tfKE538kW4PDSMH1w0qIyAtoqQYnd3Lg0RAbaJbM3TIMplSM1Q
 lZSevzKf0mC+87YHJ5tjgnUiVM76odUIlizJGxJfrLOQ6gom4EM958e/2J0gBod40EHw
 tYjxATfq3pMrg88hbB7RhrepLAwImRWdL2Ik2muRhPQX1ZDF0Cl4kJ1GO9OmHQ8eSFqa
 Jntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=bkZWiHCPG+F1czRUZaaWX/s9jLTSogWAteShF/KlgPs=;
 b=uJMTXbqVdKSnuAEEZLM2wsXfRF22DNanUkWM3aikIQI3HoeuPAYxkwqup496Bm9dBi
 ggg7YmHKlPicya8r9fa+k7mIs/NlDpk9fuseDjcT8oIKj3jxEF9Ogy+CBI5HZ9KJSxFJ
 kHKMhQ9jEDFgh3nYjJMNC1hZv3jTCegCAglEHvLRlBEjN5vre0AlHCDtyNcMAqlH2h0j
 QEVX/iVU1pEMkjA2mnW9FiYXOC+iCpnN7cv1Ec3kq2Zjxul8On7irGbazpYri01XW23A
 LUjINCbxZRwTm9XVlzgWtVppVnzsx+dsp7s/+Ati0TjgUOgZKLuA4o/fSDry1td8cCKD
 oa3Q==
X-Gm-Message-State: AOAM530VyyIQqqXXT2okSnOZSjYsdO4PKeGkNhZMZ71vVwm3n4CCka3q
 BkDX/36+ZxecM06bOgY7Tk1L8aC/xHo=
X-Google-Smtp-Source: ABdhPJxvzyeDdqo8zXyMywcvE+wpMKxAxOTkO5jWcDf5f8lClJM3pflaPeG/8cLuutGy+Jq3mt0+Aw==
X-Received: by 2002:a17:906:93ef:: with SMTP id
 yl15mr19530578ejb.229.1631022785784; 
 Tue, 07 Sep 2021 06:53:05 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 g10sm5565672ejj.44.2021.09.07.06.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 06:53:05 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNbX6-0003WI-IZ; Tue, 07 Sep 2021 15:53:04 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20210828204747.93BFD86703@busybox.osuosl.org>
Date: Tue, 07 Sep 2021 15:53:04 +0200
In-Reply-To: <20210828204747.93BFD86703@busybox.osuosl.org> (Yann E. MORIN's
 message of "Sat, 28 Aug 2021 22:48:21 +0200")
Message-ID: <87lf48eblr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] docs/manual: fix typo in name of a
 qmake-package variable
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=ac2db5eb2e6091a05d1cd3d641213ab01ddb0aa2
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Since commit 39d334faa5c1 (package/pkg-qmake: add <pkg>_SYNC_QT_HEADERS
 > support), the qmake-package infra recognises said variable but the
 > manual has the wrong variable name, which is missing the "_QT" part.

 > We fix that by amending the manual to document the proper variable name.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
