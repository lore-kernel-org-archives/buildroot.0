Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB99C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 09:51:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8A5660F70
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 09:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B8A5660F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84A7C606C9;
	Thu,  5 Aug 2021 09:51:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 325bvg5J1DWJ; Thu,  5 Aug 2021 09:51:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7BBF606A7;
	Thu,  5 Aug 2021 09:51:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DE6921BF852
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 09:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDD7582F13
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 09:51:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6XxVvYF5h8ta for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 09:51:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3526C82FA5
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 09:51:12 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 m28-20020a05600c3b1cb02902b5a8c22575so3038266wms.0
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 02:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=JVag6ciYGcCJpGQB+9wAUN418ypzW8aJ7fczxiuNVjk=;
 b=ZUaHXWY3Lv6mu0mntxbLw859Pdhu22tUkqpCACtnbTNdGSQdTFubc+IH9nJA+hUUt4
 23PNH1LtYqybJe791uZqwrnXnNqIuO+qCc2ecpKGGG6xjAdwkjlczOLqpt3pZ0ECCo2B
 LOOl2xTbWr0rR2eXTA/ZKoUReglV+/GMlK7Cv6RYmBIH7quXyBI8Slyxuv1aGJsjAymI
 N9sViy+5GBxfMen1jjvo35JqCzSI0XzTYrQ5VF7pv3istbASVm0w1VeuKuNMZEP9Nq9H
 TV0t7FKoh68lgY/InQdYxwZxEMsNw/mlytr67FNghCXw+lw35iIxSkr3vrhgT9FAV3gK
 zJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=JVag6ciYGcCJpGQB+9wAUN418ypzW8aJ7fczxiuNVjk=;
 b=isuYaTPjQJUuMM2ribHveesjRvbOXRNgruCuNLehKsDmeIoZVYyskt3f559Z5qoPQl
 VpHsFpL68vUnZd7O/dm9SdstaIeFmxf/z5w7CdECZnjx45PlStMYbvSsyQLmE/j+znn7
 ykKyiIDGJbyQVl1iKWpP2YaJkSQJiLUNj1gBc89E/x15+5JMYOg9Fi6Q/VLmJt7h0iQI
 SHuVfBKxo77OR+vnO1BLy8mqw+uQj1e1eTkyRBWqU4Dbbrlru+yvnA5LHmCOu40pJe+6
 RYOpL5CcFn1qdEy4SvQWZYkKW3soPNuhlw3wvWBZEwHv8M75fpaauuhep7GCZnEOrWAT
 lmkQ==
X-Gm-Message-State: AOAM530g6U/gnOr3knzQ4736Q7Sf+GB979AVzG9I8MNn/AgV0YCQH1Ln
 c6Y/juMUR46ZjQ9Nw1hRYFKWbysUvNk=
X-Google-Smtp-Source: ABdhPJx9Wdu05wPW9uqSo6/RJSklsZ6zqK5zuRv2K7iQSEi11RWPl9SFfAJYHdswltF6mpWjuaRmVw==
X-Received: by 2002:a7b:c309:: with SMTP id k9mr4208030wmj.48.1628157070295;
 Thu, 05 Aug 2021 02:51:10 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id y4sm5022983wmi.22.2021.08.05.02.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 02:51:09 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBa1t-0007np-4a; Thu, 05 Aug 2021 11:51:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210725074855.855272-1-fontaine.fabrice@gmail.com>
Date: Thu, 05 Aug 2021 11:51:09 +0200
In-Reply-To: <20210725074855.855272-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 25 Jul 2021 09:48:55 +0200")
Message-ID: <8735romd82.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/netsnmp: fix legal info
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit 87bef179222ee8a0b0f39c8f96113a4ecf813085 wrongly removed hash of
 > COPYING

 > Fixes:
 >  - No autobuilder failures

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
