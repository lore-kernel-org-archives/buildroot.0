Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EC56C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 07:19:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01D3760EE0
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 07:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 01D3760EE0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C65244014C;
	Tue, 17 Aug 2021 07:19:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9E17RRaO6tB8; Tue, 17 Aug 2021 07:19:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9D7F401E2;
	Tue, 17 Aug 2021 07:19:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 802581BF33E
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 07:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7907A40010
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 07:19:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VcCy_u2gQ9cX for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 07:19:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 663BE40156
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 07:19:38 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id d11so36711864eja.8
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 00:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=7NGFcoBoUztLbBfDwVWhGJ6+9JZwX4tt+PMqVE3gTrM=;
 b=IQpvGSP//zuLn9120JiKUtW0yrSoLu1MjVJbdjgtUdxYBYIvUXTbnxRz+tTRTN9pOk
 ecrTqny315Wp4Ys420OV92gQnZ5aM63I6bAv8vA0J7VGqpLKdNHwzjvGYpanhwcFt6o/
 f448FyAB2jYjS0Ok2VhKaDKRDei4oygb2jXyeOLNN9HNEBpBS4RYoLwz4Vu481wKpBg7
 IJ5ouC8QUi+13lqfEpRTLm58naVKh/liqPWh+uN2DCKpsE6e3DnVzkEZonO2NLk7XJZB
 nuZlM1rQKrU1mGIqP7dLE82NU5Uy/k1oBAorKCgl1ypzhbqIvFBYwJrLR9VHWYxBBjZg
 WTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=7NGFcoBoUztLbBfDwVWhGJ6+9JZwX4tt+PMqVE3gTrM=;
 b=A+ZoOMXT+zUpzwX4P8eTMkPym913qRZF5X7KBh6/RCJLDKxxmdBTGgmpLfw8XTQoiE
 W2gV9DMav/1TJaXealhza5Tkq6s1lKsEKjmFZNHfg/uatYJQgbzBHmZ7dPfchN8UuYJ/
 ai6IzeCC91FrwYcbQ6KzVuc89lK91Yo5YEkVut9+2iX/VOMkk87ytxyAlyHke0K1sTTn
 UzXL1dqxr/wf73pF8Cg1AjhY0If3H4QJsgXq5V75ql4EA5hudygPCRg4aSOr9M+zUCBx
 BFOgCpF8UrMY0VmlS40sHLyvLCcQFa40dtaF5VcfvfmvDmJ7V6jNdR/cziD4TPppAi98
 zC8w==
X-Gm-Message-State: AOAM533lwZ/MH9cInPtvCdgdLsW4fdC8THk9naB7IDC8oD3X0k0gs418
 pKXUEqxNNwHYInM8fCkTZoUvmqhH5hA=
X-Google-Smtp-Source: ABdhPJwOpl3qlBJR9+EvPfoEjUim5IwoVkKASIqqL1D98L31NXB4Ekjjvj2jc43LbcO4jOur97iRLA==
X-Received: by 2002:a17:906:f90c:: with SMTP id
 lc12mr2391637ejb.96.1629184776637; 
 Tue, 17 Aug 2021 00:19:36 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 c21sm367611ejz.69.2021.08.17.00.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 00:19:36 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mFtNn-0002fw-CZ; Tue, 17 Aug 2021 09:19:35 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210815164405.1494069-1-fontaine.fabrice@gmail.com>
Date: Tue, 17 Aug 2021 09:19:35 +0200
In-Reply-To: <20210815164405.1494069-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 15 Aug 2021 18:44:05 +0200")
Message-ID: <874kbo7d2w.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/sqlite: add SQLITE_TAR_VERSION
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > 3.35.0 is the version used by https://release-monitoring.org as well as
 > NVD NIST database so add SQLITE_TAR_VERSION and drop
 > SQLITE_CPE_ID_VERSION

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
