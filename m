Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D866C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 18:11:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D86561057
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 18:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D86561057
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF22B60652;
	Sat,  7 Aug 2021 18:11:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bgYA6Ls5HuOU; Sat,  7 Aug 2021 18:11:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 466A8605C8;
	Sat,  7 Aug 2021 18:11:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 51CE41BF403
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 18:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FE1140112
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 18:11:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5W3LY9n3VTnz for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 18:11:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2CDEC40019
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 18:11:39 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id zb12so16382631ejb.5
 for <buildroot@buildroot.org>; Sat, 07 Aug 2021 11:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=y83s8R80KgwqOzHKhP7Kk9waeuSfbdJ0UwnSkVIIP88=;
 b=PeoIv5WjVUSkTa/q1kG98OJ4Hgb5Fnt+zAX+1ZHlNMJh511K801j5Enns9JeuBTMbA
 Au+Huc6nkvps/aDwncjtrAd8mQw8MdZaVbGqIL6Bz0w1OMsKr6+kvcrR/OTHqN+Enw5h
 PzMGEdfixrt7rYRaSOniWofpNHVRVFI/scesPr/i6WLCo7sJ2eK+Gj3jgu/LA96Iz0xS
 iZFDKw4fx+ZoaFclKwpLI8jX/EWAhKwcgP6Unp4NvOLbswL/BDTJqXBrfi3d8TYy7cmo
 MkNdZY0LQNaH4KV+y21firJfNfI51Ockesh53CeyBqUiX5TU0O2snJYbH3hyI2xUiiK5
 m7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=y83s8R80KgwqOzHKhP7Kk9waeuSfbdJ0UwnSkVIIP88=;
 b=PHP3TtjccYMo+WCrw/sVAK/BRFZJrzwCiGHcu4JsSGOTDTmn6tHiVUwXcsfiWsQtmE
 sQ4w6GOfGaBgn7sZ3iENxLqHVhJPG6UARwrSlrnZq+2HGUkaFo+QvdOsTEgMgNAlX9u5
 tZo1dDlwKuxPGC/qbSzXNhQzcJrR3HAND7NL9c6xceZjbCpREr3yRo8Tgu9BYSwzh2nv
 Qv1t1ws0A7B1gJe4JA8Y7mVPaE8M2N3vMTG/AN2maFDeg2shcnG1WhUhq7Q+iigpkmcj
 3spvoC1lKsl/eYmoSxLc8PADLpZRii383nKIjB+AckYXzmlI/YBqJODo0LfVvUZm/aTi
 Nttg==
X-Gm-Message-State: AOAM531pMuUaBaWg5IQvT3N2+f0Shl0etPpHaP4JYxLWE/m/IcIZc/ee
 lHrC7mwl1NIzemWkzGVlKLo=
X-Google-Smtp-Source: ABdhPJzqEjeHXnIe/HbBJLEBt4NistPVeb/rfHlfFPgTersQjEW9EMd7dVavEeirqL4zkWFvrOmu0Q==
X-Received: by 2002:a17:906:a012:: with SMTP id
 p18mr15160942ejy.331.1628359897416; 
 Sat, 07 Aug 2021 11:11:37 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id i14sm5433800edx.30.2021.08.07.11.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 11:11:36 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCQnI-0004gL-Bq; Sat, 07 Aug 2021 20:11:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210801132645.3623057-1-fontaine.fabrice@gmail.com>
Date: Sat, 07 Aug 2021 20:11:36 +0200
In-Reply-To: <20210801132645.3623057-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 1 Aug 2021 15:26:45 +0200")
Message-ID: <87lf5ddt0n.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wireshark: security bump to
 version 3.4.7
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

 > Fix CVE-2021-22235: Crash in DNP dissector in Wireshark 3.4.0 to 3.4.6
 > and 3.2.0 to 3.2.14 allows denial of service via packet injection or
 > crafted capture file

 > https://www.wireshark.org/security/wnpa-sec-2021-06.html

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
