Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E65FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Jun 2022 21:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5C9F41046;
	Sat, 25 Jun 2022 21:50:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5C9F41046
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R3aCHy61D1sd; Sat, 25 Jun 2022 21:50:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E649140B39;
	Sat, 25 Jun 2022 21:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E649140B39
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4286B1BF95F
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 21:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AE9A60FA0
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 21:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AE9A60FA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5O-JCc7MN50Y for <buildroot@lists.busybox.net>;
 Sat, 25 Jun 2022 21:50:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D684E60F9F
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D684E60F9F
 for <buildroot@buildroot.org>; Sat, 25 Jun 2022 21:50:23 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id z19so7978230edb.11
 for <buildroot@buildroot.org>; Sat, 25 Jun 2022 14:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PIQnA6CyQrS6/Ll96ej2kxCqns2XHLKNeIqelVQg3Po=;
 b=cv8cpPa1i8ws1W2nozITHYWcYzTidN+cZwKZLl1YITUi9Tm11pW5zvDSHfNETrwwyd
 a8Anz7Wf4U9eDFPMc8TwjUj4fYNFYuVUWA4XHhFPVUUWyWot+gIrA3VeRy/JDSBjbJuF
 zpO6Nke64bhjDd306QNWrIiYIoTZ7dFqACOrAYOSFF4JFCHUR8zEnDg1F1KiML9JWf/n
 PRc3qkl1vArtQwdmMSXyxgevoaiW2P5GeqQ8a0tp3Y+fVQQqADKcjNvDihvWnnRDShHb
 JxuuMSFk8QJYRrYo/xwbspXpHAmLJxzoZlje3/QAPxSCekr6UWXhxiS/IzfUhxjvUVNa
 CEyw==
X-Gm-Message-State: AJIora9wj6Nymq8jrmDwzBkuHOpLTkIrlM9xKkD+8yBPADNHPYKjqt3e
 9rew/tORp4vaSIjaaSimWMaJXEfJi7kecA==
X-Google-Smtp-Source: AGRyM1s/tuVUnIEMqttwGNGoetP5oCo/ZbMezC64rOh8R2trlV20J44ETe9KqYeauu4yb6suyPEpYw==
X-Received: by 2002:aa7:d6c9:0:b0:435:6698:589a with SMTP id
 x9-20020aa7d6c9000000b004356698589amr7478815edr.59.1656193821748; 
 Sat, 25 Jun 2022 14:50:21 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com.
 [209.85.128.44]) by smtp.gmail.com with ESMTPSA id
 c4-20020a170906340400b0070abf371274sm3065465ejb.136.2022.06.25.14.50.21
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Jun 2022 14:50:21 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id
 l2-20020a05600c4f0200b0039c55c50482so5216797wmq.0
 for <buildroot@buildroot.org>; Sat, 25 Jun 2022 14:50:21 -0700 (PDT)
X-Received: by 2002:a05:600c:a07:b0:39e:da6e:fc49 with SMTP id
 z7-20020a05600c0a0700b0039eda6efc49mr10732968wmp.143.1656193820690; Sat, 25
 Jun 2022 14:50:20 -0700 (PDT)
MIME-Version: 1.0
References: <62b69f59.1c69fb81.a012a.57edSMTPIN_ADDED_MISSING@mx.google.com>
In-Reply-To: <62b69f59.1c69fb81.a012a.57edSMTPIN_ADDED_MISSING@mx.google.com>
Date: Sat, 25 Jun 2022 14:50:09 -0700
X-Gmail-Original-Message-ID: <CA+h8R2pS-Ecn3v8L7f9NcyWMk1JuhYxO6s03DPvK3eFQadUMuQ@mail.gmail.com>
Message-ID: <CA+h8R2pS-Ecn3v8L7f9NcyWMk1JuhYxO6s03DPvK3eFQadUMuQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=PIQnA6CyQrS6/Ll96ej2kxCqns2XHLKNeIqelVQg3Po=;
 b=NRx7T07k0JcXj17S96xJCPj8Lt3vG4kSFR0Ke+WwAo68INrg5DAT5aWMGRud6azEVI
 zfFnGxQPo3/cpwJfX0fCrk0UV7Un4qpc2tnU5uzyABrM3XyPTkyrvsXC5De26Jz0Hgs1
 eFTDPej82y3QXTJO+NTewwxQGExQlAvqRxdY9EuQzgCwa+KWaqNE4gvO4RllIHwMqIl3
 vnxZQDwJvA3GYkJItZdg1omSSh0fcRBJGlE0t572DZ5cd22+m7iIC1dLVCdOtcPqqY5c
 i8SHvbUyFtGpfH2l6GcBjsHcqtRGY5AN5Mi5VWZccgKnvFHovWXqVkRuwqhE5sLg9HGh
 eTCQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=NRx7T07k
Subject: [Buildroot] gocryptfs: build failure against riscv64
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Fri, Jun 24, 2022 at 10:38 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Autobuilder failures
> ====================
>
>     arch     |             reason             |                                       url
> -------------+--------------------------------+---------------------------------------------------------------------------------
>   riscv64    |        gocryptfs-2.2.1         | http://autobuild.buildroot.net/results/caa60874781c4077273884eb37281cc9e02ef9ac

Looked into this and found the following issues about it:

 - https://github.com/rfjakob/gocryptfs/issues/666
 - https://github.com/jacobsa/crypto/issues/13

There is a fix posted by GitHub user piggynl:

 - https://github.com/jacobsa/crypto/pull/14

I will try to integrate it as a patch & submit to Buildroot.

Thanks & best,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
