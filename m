Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C45E9C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 13:51:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42E3A60EE9
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 13:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 42E3A60EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F137740100;
	Wed,  4 Aug 2021 13:51:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jreNL3s42-z5; Wed,  4 Aug 2021 13:51:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D83ED40159;
	Wed,  4 Aug 2021 13:51:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 740CD1BF82C
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 13:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6107340159
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 13:51:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gNoolnEveEVi for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 13:51:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4627D40100
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 13:51:25 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id c9so2335173wri.8
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 06:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=Um+gHQ+8Rmf1TH6Z68doHAUaKv9Kop0tLcDGJSuI9TA=;
 b=hBONEpvZSmH9xnhe49STa0M58kMcMWgp92FNhqTP/13QeqcFvHbDnLk8rHtI1KSo8g
 P4pw+hUMJzkDYuOPt++/OClWPZ5lwsg6gmO7uaV1gxBBOC54V/xso4ke2eEJ9soEVlm0
 fHlFYzpTXGK4t3kOmwmsp3RsEwBVTxck+J+Hyk0M4BaZF8Md6i9cWlUnL/UAzqQPwndR
 TaQsStM4Kmmj9VUe1EhAlWutmS9cWcYe2C7jZHJqXxlO2V8OIuH6rsFjXsDMg+pH17ih
 Ljm55ugrQ6ATqhcjHfDAYiC9HSoZ8BZL3/w8xgOjCg8Kn4VrSdIToFzOW0Jx9VTDo2Nc
 JAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=Um+gHQ+8Rmf1TH6Z68doHAUaKv9Kop0tLcDGJSuI9TA=;
 b=tqipp0tzhXNdGP5Tae3/X1yDZ+jSgL4LU611miGouC6n+TIZimMuKaqmKCBSlPAumF
 Y9UjH9JBlUfUhsaUC6jaobv2Y+XCmNlWhhQRJc6KpdszCVbcGcJZ6yI26V7wiCXCGU4w
 iobceBsRsfiawsr7BFpzzPtldXz2SncU+L4SiKBgLitmG25GoklC48mALpKErd9yWwkO
 +H2ncX+7nLDOiuFOg1exl3R+eF8gXglBEdZe6NYtlmH7gEOi+aCA8af7rY/dusN7z/U1
 9iyWjBGk4r0r+s4U4TnQ3C7T8rlRBOoAlIW5EprWz4mqVADyAnz0hv5YT5UtJXIjX0Fv
 OAzQ==
X-Gm-Message-State: AOAM531k0m6SvdptcgjfEV/t0JQTEhFOhTqzBNYWC+PdIw1TLFYZiIBe
 Wio0wOwtiLX7l/N6RbZsg65WXpHigsY=
X-Google-Smtp-Source: ABdhPJysRpYLOv5VYQF+dMa8rNSnQnhblIuxLasIVWfTWa1ijqIOa6s0ixuP5B1y4bSohqaJDa7uFg==
X-Received: by 2002:a05:6000:1625:: with SMTP id
 v5mr28953732wrb.80.1628085083454; 
 Wed, 04 Aug 2021 06:51:23 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id p4sm2788587wre.83.2021.08.04.06.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 06:51:22 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBHIn-0002ws-Px; Wed, 04 Aug 2021 15:51:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
References: <20210719100523.3553404-1-james.hilliard1@gmail.com>
Date: Wed, 04 Aug 2021 15:51:21 +0200
In-Reply-To: <20210719100523.3553404-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Mon, 19 Jul 2021 04:05:23 -0600")
Message-ID: <87bl6ds4h2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/nodejs: bump to version 12.22.3
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
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
