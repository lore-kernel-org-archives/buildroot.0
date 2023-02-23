Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F4EC636D6
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 19:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E2D941061;
	Thu, 23 Feb 2023 19:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E2D941061
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JUQrFjHMxHYj; Thu, 23 Feb 2023 19:27:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63968410A1;
	Thu, 23 Feb 2023 19:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63968410A1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 26FF91BF343
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 19:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F420D410A1
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 19:27:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F420D410A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Hvt2vgyAIEM for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 19:27:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9893B41061
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9893B41061
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 19:27:15 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id ck15so47419393edb.0
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 11:27:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GI+Oul14Ka2lducM8NVYczG8Omk+NFA1kUwa760JsdI=;
 b=DQdIZYwoAFuS9HFzrl8xSeXa5DU2enxqz3tzBKf40KSY9g8vRw9YQ6pjb4hB05lGgs
 83LoVgHiuI+6Unm0+3rhP86YM5SzvYqzGwK08xCZTzfEsmZP4tK9rhni3z87cBA7+NYa
 0TDVKAyGHrvlJmlfl3m/bSByKFfWAJnCF1+zzfb1Jnx6fJTHVGyXVsd+JxSw5hi0uTRL
 U1EGMn67Bpj/gVQL+dO310iZ4+v185VXjT+gmvnzsCliCfuoSrrV3BNKZFqB6ImfEyv+
 ZZtMfYwp4mnS7GyoWpM5memNL/WDtMlVVXFyCOnE3ryAPn04QuAvIsZAXugVKF6rHcVy
 lfpg==
X-Gm-Message-State: AO0yUKUilPw2KlM8Aes+Mzqvixx1ZEwZbMDKX65BXlujSvwdlzfGrlg+
 szywoP7C4oOgDv40956c8THsmrz725jz+lcwP/uYJg==
X-Google-Smtp-Source: AK7set981Y7xNHRkxU1nrb+7Q00bCCtkOIQaaTpgMXeSJETX3lR6KATDTlhGKc03lgv6zsP0d7mmY+8LIRjBspmGzv0=
X-Received: by 2002:a50:d51d:0:b0:4ac:b618:7fb1 with SMTP id
 u29-20020a50d51d000000b004acb6187fb1mr5906880edi.6.1677180433611; Thu, 23 Feb
 2023 11:27:13 -0800 (PST)
MIME-Version: 1.0
References: <20220518213933.2475-1-adamg@esdemc.com>
 <11b5699c-ebc7-7a6c-e8f8-c3824fe166d3@mind.be>
In-Reply-To: <11b5699c-ebc7-7a6c-e8f8-c3824fe166d3@mind.be>
Date: Thu, 23 Feb 2023 13:27:03 -0600
Message-ID: <CABu+Ghx2Qkzyb4rj7pQvuftFm9Y6rcsdvUKkDA0L+m+m+oWVAA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=esdemc.com; s=google;
 h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GI+Oul14Ka2lducM8NVYczG8Omk+NFA1kUwa760JsdI=;
 b=dadXKxgrk9ioRQ8eR5+AxMGHkuBiUADSIQ6vO3WWVViif72tp4w5+YD0LBXhxBTMAe
 MQPGKGHAJ1exgaM5w+aY/C60WjzQ/3SnqjqLDbJXtjFiJP5w0paxuyJMrNsK0VYux1z8
 rffUWv3sqH8O8uHJyR9j7l6Q5lwBQbQcRl1WI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=esdemc.com header.i=@esdemc.com
 header.a=rsa-sha256 header.s=google header.b=dadXKxgr
Subject: Re: [Buildroot] [PATCH v2 1/1] add package/python-pyqtchart
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
From: Adam Gausmann via buildroot <buildroot@buildroot.org>
Reply-To: adamg@esdemc.com
Cc: =?UTF-8?Q?Manuel_V=C3=B6gele?= <develop@manuel-voegele.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

(Apologies to Arnout; I forgot to click reply-all)

Hi Arnout, thanks for the review;

On Tue, Feb 7, 2023 at 4:55 AM Arnout Vandecappelle <arnout@mind.be> wrote:
> > +#
> > +################################################################################
> > +
> > +PYTHON_PYQTCHART_VERSION = 5.7
>
>   Why this ancient version released 7 years ago?

> > +PYTHON_PYQTCHART_SOURCE = PyQtChart_gpl-$(PYTHON_PYQTCHART_VERSION).tar.gz
> > +PYTHON_PYQTCHART_SITE = http://downloads.sourceforge.net/project/pyqt/PyQtChart/PyQtChart-$(PYT
HON_PYQTCHART_VERSION)
>
>   As mentioned earlier, better download from pypi

Keep in mind, I wrote this almost a year ago!
This is the version and site that was used for python-pyqt5 back then.
I will certainly update these in the next revision of the patch.

>   Wouldn't it make more sense to call this python-pyqt5chart, given that there's
> python-pyqt5, and that there's PyQt6-Charts? Normally we prefer to use the
> upstream name, which is pyqtchart (or PyQt-Charts or PyQtChart, depending on
> where you look), but in this case I feel OK calling it python-pyqt5chart.

The PyPI packages are "PyQtChart" (The original/legacy name for the
Qt5 version) and "PyQt6-Charts"; the download page refers to them as
"PyQt-Charts for PyQt5" and "PyQt-Charts for PyQt6".
(https://www.riverbankcomputing.com/software/pyqtchart/download)

My suggestion is to keep it the same as the official PyPI packages;
either keep the legacy name "PyQtChart" (python-pyqtchart)
or if you want to include the version number, retroactively use the
naming scheme from "PyQt6-Charts" to make "PyQt5-Charts"
(python-pyqt5-charts).

However, I don't have a strong preference; I'll use whatever name
works best for you all.

Thanks,
Adam
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
