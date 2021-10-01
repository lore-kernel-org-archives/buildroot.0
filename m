Return-Path: <SRS0=lBh3=OV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BF3C433F5
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 11:10:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A531561A82
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 11:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A531561A82
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E246843EC;
	Fri,  1 Oct 2021 11:10:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JyP88P1fYENh; Fri,  1 Oct 2021 11:10:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A656C84382;
	Fri,  1 Oct 2021 11:10:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 894391BF5A7
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 11:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85DD840578
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 11:10:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral.in
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Fg1sG2EJbr1 for <buildroot@lists.busybox.net>;
 Fri,  1 Oct 2021 11:10:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A20E44052A
 for <buildroot@buildroot.org>; Fri,  1 Oct 2021 11:10:27 +0000 (UTC)
Received: by mail-vs1-xe2a.google.com with SMTP id p9so5370117vst.9
 for <buildroot@buildroot.org>; Fri, 01 Oct 2021 04:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=tkHVA0bECh6KH/5/5Z9+dQ/tBqg8F73oH3+lM59VUo8=;
 b=SiECehNLXyogptgnS0atfXKJYkOMLs+7TyB+m4XawJ+/NpqvqWIdhxDRUPyx8n0K0x
 fTV6Tg3pTEPtfVtWd3MoID9bii2PPaUKpxoV6xXV2NK0E0eM3EvTW9wzT+rfIH+bXPKL
 tD8lVWpoqLmoILhl7ugACBw0HR4bmS5YU66GBqbrRB4129GIbcdQg4gs9AkpMGCOSYS0
 CCZS4EBPDnSa2YRG9PF/KufsdkDwovI606jE2m2Dmipvk9PBYW6Tl6SpdP49pyLdAwzS
 yrOcz6gc7Fir199irQXNVqTTiB4lSZHJk+H0m4NeUped6iwEu/kPgM839tumRyi9SfmB
 LT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=tkHVA0bECh6KH/5/5Z9+dQ/tBqg8F73oH3+lM59VUo8=;
 b=EmA4LOlAcI4+ZL3BWRs8tHLIQaOZa+v9kIrX56VE+GEbEmp+hjMrKLXyfKIP8oTxxc
 5PiBRJqex0BXbHTOADPyiA9qSw+tWCHWI/1tz1dvGuvYqTvVJZdMpGH3dMvN7Fiq4Nig
 OvWl6eScO2o0on9OdfuBzg3dlsogIicqZKtPQjYtpcUM73P+ha1TYDdNAk4f6iCo6EFd
 3QvQRlHShxQp1cEtQDK/SRFA+dtaC2hTqb/tAKlHHSasjVfnZPihyM0awiEpDRooCONv
 DTGM6nMrE/yQBLn9uFoiPqr+G3EL8UF7SKkSHfplhTM6d6rUyx9MygN+clMIf5vaKVdL
 PSJA==
X-Gm-Message-State: AOAM530qQpkUEggmql1Brd8N32Bv8r0RiZWxsXqtvkjJ7aDbYEUWMlcY
 7/gtconSu93E0U5M16WBPbx0//aqw72KvQ==
X-Google-Smtp-Source: ABdhPJy03f+43Ig8AbEH0uQ9X1TB6UcZIQqiEhgYTDhxNYXtukdcB7umFyvhc5Rz6sgZlXhh3x03yA==
X-Received: by 2002:a67:7282:: with SMTP id n124mr3128037vsc.15.1633086626194; 
 Fri, 01 Oct 2021 04:10:26 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com.
 [209.85.217.44])
 by smtp.gmail.com with ESMTPSA id l25sm3084275uai.6.2021.10.01.04.10.25
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 04:10:25 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id h30so10845935vsq.3
 for <buildroot@buildroot.org>; Fri, 01 Oct 2021 04:10:25 -0700 (PDT)
X-Received: by 2002:a05:6102:b13:: with SMTP id
 b19mr3210487vst.37.1633086625242; 
 Fri, 01 Oct 2021 04:10:25 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 1 Oct 2021 04:10:14 -0700
X-Gmail-Original-Message-ID: <CA+h8R2rm0EvjGOf01o8UDfKTTjFoY62bY5W3iwAHteqX+PtXyA@mail.gmail.com>
Message-ID: <CA+h8R2rm0EvjGOf01o8UDfKTTjFoY62bY5W3iwAHteqX+PtXyA@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
Subject: [Buildroot] Docker Compose v2 released
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

Docker Compose v2 was released. It's a rewrite in Go (from Python).

https://github.com/docker/compose

The changes for Buildroot will need to be (for backwards compat):

 - docker-compose: switch to go package
 - docker-compose: depend on docker-cli
 - install docker-compose binary to /usr/libexec/docker/cli-plugins
 - install https://github.com/docker/compose-switch to /usr/bin/docker-compose

The new command is "docker compose" with a CLI plugin, and
compose-switch fills in for the old "docker-compose" binary.

I'll have a look at making these changes soon.

Thanks,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
