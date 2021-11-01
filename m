Return-Path: <SRS0=b2+E=PU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B099C433EF
	for <buildroot@archiver.kernel.org>; Mon,  1 Nov 2021 17:07:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8B846120F
	for <buildroot@archiver.kernel.org>; Mon,  1 Nov 2021 17:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D8B846120F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D36180CEB;
	Mon,  1 Nov 2021 17:07:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TtF8pgLss6qc; Mon,  1 Nov 2021 17:07:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2E8880CB3;
	Mon,  1 Nov 2021 17:06:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 006A41BF358
 for <buildroot@lists.busybox.net>; Mon,  1 Nov 2021 17:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F095F80CB3
 for <buildroot@lists.busybox.net>; Mon,  1 Nov 2021 17:06:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MhhIqsv0c3ao for <buildroot@lists.busybox.net>;
 Mon,  1 Nov 2021 17:06:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D3B980C3C
 for <buildroot@busybox.net>; Mon,  1 Nov 2021 17:06:57 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id m22so29179773wrb.0
 for <buildroot@busybox.net>; Mon, 01 Nov 2021 10:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=sV8S6P4M5MvjRmVcV7HVw64Cu4md4/wpqzoC1tDoiLg=;
 b=YS4zKFYv8IMpjU8NdayZ5ybMY8mkZur+JGHWPpr/ntCuiCoor2DRLvVLG0QTOxYfNM
 yrTbnFRXszrmumSsKJUf7G7dCHnosiJdWeAQ+v4ROp3bmc+38PSRPAl1dvE3jFVztcbs
 sXrs2KtdiGKRwBlvu8ZbfZ09X+cysSZEG+P121/fwm0dRiX4fhxzRB1SRGoitE8FaC3I
 c+13xG+eyEsM4poeGMp0uHkPhNqI49/wvolDg9y5fhlSIPoWhM2Por3KPR9lsZJIEuOt
 emAY9tOQprM4EI9a7duANrT4k6/K6CE6oW+Wk5q1lpcHT0M5TJK0Onhhl3zFH0825d4Z
 Ggtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=sV8S6P4M5MvjRmVcV7HVw64Cu4md4/wpqzoC1tDoiLg=;
 b=KHd2bIdxn0KxOxu/jwPzmcLIfFDRQMYVdd29iZlQAZfONmYMWo6i8+CkyyS47tmWxP
 pQoQqAc/iw/PoaHRH8SRhmmF4PiNm/HdjDr3aUKGMC6/Ai2ua6V/C/li1jYfdEQP45sb
 un8LH4jAt7zFY/Sz1ir3xpeswqFRUjaas5E0Ka6mJ577dcQ62GU7Nbb1jLkYNcWcWAtm
 ktIeCeVr2yXO5MqL1NcwWJs9vC/0JqrdKZckXUK9cI6/E6MJ1Ud3PaB3yVvwGrbuBeI+
 M7OfXNTFTah3PuBieFGC5YG3FRo25wAUXvZ/FZ/UDC39bzhA2luog9LWtXVq4/YWVjop
 ItlA==
X-Gm-Message-State: AOAM5313up2EUdBqbcD4JIXYXVBMI2o2Wo9qNP1AfHGP9ISdpfeI+mOO
 QA3jPpkhi+bDM7TE6JT8zWI=
X-Google-Smtp-Source: ABdhPJwBgMKc/uSd9WcizbgI1KqVKQ1JMpMeAEo2Ctcp8yZhWpEdFjrIYNCTNStu+zWQHO6gBosDCw==
X-Received: by 2002:a5d:4a46:: with SMTP id v6mr38445308wrs.262.1635786415351; 
 Mon, 01 Nov 2021 10:06:55 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id j40sm85848wms.16.2021.11.01.10.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:06:55 -0700 (PDT)
Date: Mon, 1 Nov 2021 18:06:47 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Michael Fischer <mf@go-sys.de>
Message-ID: <YYAep/UzQ7qWg/1o@pevik>
References: <20211101101217.23328-1-mf@go-sys.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211101101217.23328-1-mf@go-sys.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/busybox: bump version to 1.34.1
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@busybox.net, Denys Vlasenko <vda.linux@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Michael,

> patch 0003: already applied upstream

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Thanks!

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
