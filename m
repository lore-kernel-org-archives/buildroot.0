Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61178C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 13:36:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFEC6606A5
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 13:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DFEC6606A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8B2740369;
	Mon,  6 Sep 2021 13:36:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a5SPeq1BhUgP; Mon,  6 Sep 2021 13:36:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC16F40378;
	Mon,  6 Sep 2021 13:36:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 408A31BF2BA
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 13:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FE916080F
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 13:36:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WiuDKdhd1iez for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 13:36:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 050536080E
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 13:36:10 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id dm15so9556728edb.10
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 06:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=gqNH+vu0cPkgn0TSCeBWFWpWsjFuz4B5gPzwySMtsI4=;
 b=fO4nFzPKNG85vBC2CzE6tG33YvRWjBHv9NkllRrT9+Q9+3j8vRDxQA/wm8UPe4QO6Q
 kJNdlQhP6KXHw4dlCszGHr33B+gVc0lV8MfTI0xjOKOd4qSPnSrYBZ3inig6fY+Y6LmK
 Qefftvdc4a/7U7dMyo8L5xZsNAbdGoyjwtqJEBTGaI3pn8Y9DIwLn5F0pizYTz1c3GMZ
 ymwcc68FtH36nrI0Jq77XNFeFFi1e4hv9Gv3Bnn59b7j2IpWJWNImxfO0lW9VHu6g7Hy
 boLmnXpooVzMNRIX9FhMeir/zLaA72IjP8V5co3OM6CPosM7XeZugQP27cpLoW7SjBQn
 6BzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=gqNH+vu0cPkgn0TSCeBWFWpWsjFuz4B5gPzwySMtsI4=;
 b=r62SQL8+cpYcSOv3z6H4o3If9tWyFbQviJBhQNACcX9rcEnWQy4C5CMy6NcZdwnic5
 F2LTak+ZUtH9RLlmEfN67qlF4NkrXS6bK/lnhgOWFOVgm5+kp6nwzFT4I+jWVveAXyNk
 7IwgZh0Q8N08dylOZYttNIwl3hEwEm8AkIpgxsfl1AAHoPfq6V+xktrGnBP7wojh2DeD
 FndwVXBTAeOGs9mDpuJLKohCUM7d8wftkHz2Ogc9jXa85oOzryb29fKe7BhP4JayCuex
 Fjh2dczqage2ZNr/m16tP89CIjUpicAHewPr62xznCoxIPHNHPkMPS19X8fskD7yNN2u
 symQ==
X-Gm-Message-State: AOAM530XqkCtPURXQBYkBLjyHztzY/k2CNIE58zPGDvCSCnFiQcLQX2V
 pchw212iPNxMDeFfjVtcyvM=
X-Google-Smtp-Source: ABdhPJwci62BO9iM6DcPH/G5HYhMI04lGWsIWX3cr49pD9SXirsAJvIS23FCzgjSbiFXX9qZwTPbNg==
X-Received: by 2002:a50:fd02:: with SMTP id i2mr13660044eds.22.1630935369165; 
 Mon, 06 Sep 2021 06:36:09 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 jz16sm3929531ejc.34.2021.09.06.06.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:36:08 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNEn9-00029B-Hs; Mon, 06 Sep 2021 15:36:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210819204851.620758D5CB@busybox.osuosl.org>
Date: Mon, 06 Sep 2021 15:36:07 +0200
In-Reply-To: <20210819204851.620758D5CB@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Thu, 19 Aug 2021 22:49:30 +0200")
Message-ID: <87ilzdkerc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/haproxy: security bump to
 version 2.4.3
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

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=a380e058338b5fc006cb76544a4b080e52cc0f4b
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fixes the following security issues:

 > - CVE-2021-39240: An issue was discovered in HAProxy 2.2 before 2.2.16, 2.3
 >   before 2.3.13, and 2.4 before 2.4.3.  It does not ensure that the scheme
 >   and path portions of a URI have the expected characters.  For example, the
 >   authority field (as observed on a target HTTP/2 server) might differ from
 >   what the routing rules were intended to achieve.

 > - CVE-2021-39241: An issue was discovered in HAProxy 2.0 before 2.0.24, 2.2
 >   before 2.2.16, 2.3 before 2.3.13, and 2.4 before 2.4.3.  An HTTP method
 >   name may contain a space followed by the name of a protected resource.  It
 >   is possible that a server would interpret this as a request for that
 >   protected resource, such as in the "GET /admin?  HTTP/1.1 /static/images
 >   HTTP/1.1" example.

 > - CVE-2021-39242: An issue was discovered in HAProxy 2.2 before 2.2.16, 2.3
 >   before 2.3.13, and 2.4 before 2.4.3.  It can lead to a situation with an
 >   attacker-controlled HTTP Host header, because a mismatch between Host and
 >   authority is mishandled.

 > For more details, see the advisory:
 > https://www.mail-archive.com/haproxy@formilux.org/msg41041.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

For 2021.02.x and 2021.05.x I have instead bumped to 2.2.16, which
contains the same fixes, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
