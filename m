Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 677DFC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 19:57:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 005F76101E
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 19:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 005F76101E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B28FF4021B;
	Sun, 12 Sep 2021 19:57:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9nCtxyD5YSos; Sun, 12 Sep 2021 19:57:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D92B840186;
	Sun, 12 Sep 2021 19:57:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BC41C1BF409
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 19:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7E7140155
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 19:57:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ZDgm8z19zn8 for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 19:57:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C56BF4012A
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 19:57:38 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id ho42so16233034ejc.9
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 12:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=E8gWVRLLsrJO5bf4aZP5iuQQR9vjwzRAnvJ9JxXp5Cw=;
 b=Gj1VwCmR9bo7cLGHB5sjCUHY6ECEoCI8ZsmRBAit8lzPwd6TYjr92rufu9misQNQOD
 2VNvIq61biEhEOQggDzJFiix2w7+CKHs7HbfSBfn16YYaJakN9NvcOnm6PhjA3XlEA+X
 cpa/qPLMOKmqfWqRxi+StI4Gbo/HVJ052R6bzcMr+6AaqhtepJAYdySzn3Tq2OVtvrnR
 aH8uypAhJQznozw85V17DJOjtf+ZzER+S/jUZhhflSeFwUvr9xVfAjams6u9YAhSGXL5
 7KB7TTjMrZPFGAeGzLprGKKQzN5JUEMnNQ+F/Et3h+oqpEMCfNf0IA0f4NrY6CLGPlnO
 T39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=E8gWVRLLsrJO5bf4aZP5iuQQR9vjwzRAnvJ9JxXp5Cw=;
 b=JIa066rMfAaVEQxO+scC6wkEY1HZRqkmQj/TJkJzCCFzwUfcC2sNPd6tFh2xqpbU6p
 gxsAoJhPKCGjdz6/hy/lWIW2Pc4U7n0OlIwuetQ5Ux2cgwIw5Gr/Pg+WAPDYlhwH39jQ
 pfqMcqtCts44tiVTD6jDybPw8JoxfyF+HTliwm4LaK6JgLBgrjsvxm5nGWOZkbPwLNES
 dsL9xA+U9Wny7zRUcFy3cQuEVAD1CK4D5jd4TrwuVzmsgoMK0PTz2fEEIX/J/yXY3odr
 L2tNQYmtYeUpggJdvfsoreGBTcY0RxYLdCi7e5bH3V20fcM3/ZQBKH90TYbfq9ocQTVv
 Lngw==
X-Gm-Message-State: AOAM532Lp6yZng7E5PjNSUp5g3wJ7U1gSRdlugLgVb45p6JlLdSy+FfD
 G2BTxe6txfMSqmTHM6bhb4I=
X-Google-Smtp-Source: ABdhPJwBRavbrmfB41tphNpVRKIO4LvhGF/FrQcsBfer335oyPCtJwKCq2PeNdFBrRoHczaCC+snWQ==
X-Received: by 2002:a17:907:10c8:: with SMTP id
 rv8mr8733487ejb.280.1631476657074; 
 Sun, 12 Sep 2021 12:57:37 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 a24sm2784050edu.49.2021.09.12.12.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 12:57:36 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mPVbb-00063i-QX; Sun, 12 Sep 2021 21:57:35 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
References: <20210829024632.682029-1-james.hilliard1@gmail.com>
Date: Sun, 12 Sep 2021 21:57:35 +0200
In-Reply-To: <20210829024632.682029-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Sat, 28 Aug 2021 20:46:25 -0600")
Message-ID: <874kap36ts.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/8] package/swupdate: let buildroot
 handle stripping
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

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > In buildroot, stripping for the target is configured and implemented
 > with the global `BR2_STRIP_strip` option that drive the stripping in
 > the target-finalize step.

 > So, we explicitly disable stripping at build time for swupdate.

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
