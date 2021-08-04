Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84E42C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:30:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DE0060EEA
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:30:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4DE0060EEA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 294E360AF0;
	Wed,  4 Aug 2021 20:30:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yoB34qCaL8zo; Wed,  4 Aug 2021 20:30:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B0A360ADA;
	Wed,  4 Aug 2021 20:30:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B06371BF5DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0B4F605EF
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:29:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fyFGOUBu-faQ for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 20:29:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AFBCD60A85
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 20:29:40 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 d131-20020a1c1d890000b02902516717f562so2188843wmd.3
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 13:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=SN4npzjO7f8+1izbylde/hQyK5HYBBqCs0MUq6FqvWg=;
 b=qUaVevJovFGfErH+Gc5YfbK5YaalEzDocIC8GTMurozWXg688Ixzt5BrYDILl9YL8x
 j/giuNjdPTKuCFh7MPPzVU2VAAfPvpeZKA/3RKZdEfVamyQ2COqzfWL1UMjfRXGtyIhq
 vCUN8lutBmlgpoO2KSvg0LmtEPoM8q7cfjJpTJXssAU3w9bEA0jbPA9hlqD1aAFxugiq
 akujdZWpuyZOn2m3HpyqPVMVd7SfNRvVXCuX6Uck05MVpwezKL2kblb0j4/ibWjgcbhB
 iGlRaDouNVstpLG4/2PSxn4QMk8Ma5JWMRbtQsP8vWriBf3/IAhleekweKlUDqpQd7q0
 F2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=SN4npzjO7f8+1izbylde/hQyK5HYBBqCs0MUq6FqvWg=;
 b=cU46iY2wBdZFSQNNlu53YT5ksQDXBbuNVezcoiUJFieCwkxZMbnm/OaJPEKJ8k4jF+
 7JgYLQq2v245NnIaOSl2pnG9GVVT375KQL9PVBJODfqw3PELZixAD4Cb+L0mVkTCdl3N
 F7775+B1zbkV11J8Vqth4LC9ouXaykG5g8XbqiElURMfgIhvTBhEt3EOSFIbYmM4qTar
 Zz3BdZAqA1kO7OeY43kCpg4RqgMJSbIqIc1JA+9bQFFpEQnetLYLycKYM79Afzxqovyc
 xkXoU1HrjstBD5zi5sVTE1RahlkCXvyr2pqosXCx4i5n4VpJ7Ge9XsJs+vKV9J3cTn8y
 M4MQ==
X-Gm-Message-State: AOAM532W2lYijW+ys/1gOTSbuphulJXLFJu80txumK3qEu6cp4hMqkI0
 P5+4lemo2wiurB2Crc2QrZk=
X-Google-Smtp-Source: ABdhPJzmxc7eOycb3YfZ9uMvvG3dJ/Bqq+fiA4Lyhj4SLgFAQmxTIWg2TD3471qhZHBy7aKqZIAqNg==
X-Received: by 2002:a05:600c:1ca4:: with SMTP id
 k36mr11494028wms.107.1628108978714; 
 Wed, 04 Aug 2021 13:29:38 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id r2sm2485016wrx.27.2021.08.04.13.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 13:29:38 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBNWD-0007VV-En; Wed, 04 Aug 2021 22:29:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20210608194926.14477-1-ps.report@gmx.net>
 <20210608194926.14477-2-ps.report@gmx.net>
 <6e5aae0a-b4a0-edba-f817-ca6eabb05b64@mind.be>
 <20210724094931.3e30dfeb@windsurf> <20210727224340.0dbaffd6@gmx.net>
Date: Wed, 04 Aug 2021 22:29:37 +0200
In-Reply-To: <20210727224340.0dbaffd6@gmx.net> (Peter Seiderer's message of
 "Tue, 27 Jul 2021 22:43:40 +0200")
Message-ID: <875ywlneby.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 2/2] package/libinput: bump version to
 1.18.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Hello Arnout, Thomas,
 > On Sat, 24 Jul 2021 09:49:31 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

 >> On Thu, 22 Jul 2021 23:18:56 +0200
 >> Arnout Vandecappelle <arnout@mind.be> wrote:
 >> 
 >> > On 08/06/2021 21:49, Peter Seiderer wrote:
 >> > > For details see [1].
 >> > >
 >> > > [1] https://lists.freedesktop.org/archives/wayland-devel/2021-June/041849.html
 >> > >
 >> > > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 >> >
 >> >  Why is this bump in two separate patches? If it's because 1.17.3 should be
 >> > applied to the 2021.05 branch, then it's better to make two distinct patches,
 >> > one for master that bumps directly to 1.18.0, and another for stable that is
 >> > marked explicitly as such with --subject-prefix.

 > Yes, this was the intention of the split..., will mark it more explicitly next
 > time...

 >> 
 >> Gah sorry, I'm only seeing this now after having applied the patches.
 >> Peter also did the same (bump in several steps) libxmlrpc, so I was not
 >> too concerned about this. Though I agree that your question makes sense.

 > For libxmlrpc the same applies for the first patch..., the other two where
 > split because they where tagged with code/stable and code/advanced, was not
 > sure about the whole/complete bump but did  not find a downside for the
 > code/advanced one...

In general I think this is fine, and I indeed backported the first
libxmlrpc to 2021.02.x and 2021.05.x, but for libinput we are on 1.16.4
on 2021.02.x, so the 1.17.3 bump is not applicable (unless 1.17.x fix
some important issues?)

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
