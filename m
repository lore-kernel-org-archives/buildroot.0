Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B16C433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 09:00:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 307B960ED8
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 09:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 307B960ED8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6C09605EB;
	Mon, 20 Sep 2021 09:00:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ez_kfCu__g4j; Mon, 20 Sep 2021 09:00:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17B6160644;
	Mon, 20 Sep 2021 09:00:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 930051BF97E
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 09:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EBF84037C
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 09:00:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ed1eb2lzNQ1l for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 09:00:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6FF0840379
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 09:00:16 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id v24so58461403eda.3
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 02:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tImjsiOdTRCXrx3G3O5IWu9Jql9vL8dAVINRFeCmqSY=;
 b=PUNbiy/aBh/zaXmvR990MiIGHHxjVgcT+41QVxlLT4kYjYdHcktKOUrxmvwnYcQsk1
 wrS6xvsTeaFdMbEqEBOO2AVM5XNwl5NB2iK7Q7I9l2slRf3XnfPy1fI4mnJ5b1ne9Osv
 VueI6DEsHMF/PBX7746okIMjtkAGp43f9i66DOhO0rajlACqVwBbEg7XJDnGcxK72VNx
 2uvgVrD7zGS7IlUMY0mBByoV4Jtyydc1xETLpCF2DzhbC9j9dLZL1X+BIzmkABU9eszn
 K+tSdkKbsyro+PKIYqdz5H91P+kHG1WW+sxIom0q5iKwf4frSU8E+JZqrHALURcg2H12
 6Egw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tImjsiOdTRCXrx3G3O5IWu9Jql9vL8dAVINRFeCmqSY=;
 b=wUhdDpwhYcliox4yZChYK/xeBkdh39jpn4GxxCGk1CByoJ9ezFNaTBNCNmnzB2Eq1f
 CaVC4xGJp1KQ9n/r9FxRnSFcHBvmOdShdN7b/+CaK6hDIf5khRp7XIG4d17g+TUchWHO
 5ovVAV2Jrb0lGqoVKUsAcNoa54yYythA7BKUouEU9C8+69QUNGeGecypdc6LB6+KKlBT
 XfEjfKh+uJcxkrxGwjPyVfJWXaIZh1ed9xE5S839OdS1nY5+UvJsS/BGKoJik597Zlom
 GX5LmgnYxDO6dh55IRr3HCJI9F90zvkkAKJm9nyAoJqYxtC4gbBegjo4RsQbwh7mftM8
 KMzA==
X-Gm-Message-State: AOAM531V2UCpwEQnZftF8/nOSiA+Ta2W9Mgwe5dzvXtQg7xJi3I2Xbn3
 9FPfrI2QAhpQelYuM/lAe0j6ew==
X-Google-Smtp-Source: ABdhPJwYm3roSj+fNHcBQPn+o77wAyZ6qWkVd4/nwH5+AQ4uChTfHj+ffIeI0cx1ZyKCMo7XSNPv9w==
X-Received: by 2002:a17:906:660f:: with SMTP id
 b15mr26910721ejp.491.1632128414056; 
 Mon, 20 Sep 2021 02:00:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id f19sm5973574edv.91.2021.09.20.02.00.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 02:00:13 -0700 (PDT)
Message-ID: <7492dc18-5c41-b7f4-f10e-979b6c042ba8@mind.be>
Date: Mon, 20 Sep 2021 11:00:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <f98c560b-9a4f-26df-3bcb-3bdb4509786d@benettiengineering.com>
 <20210920084105.4b8fea91@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210920084105.4b8fea91@windsurf>
Subject: Re: [Buildroot] Harfbuzz bump major version question
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 20/09/2021 08:41, Thomas Petazzoni wrote:
> Hello Giulio,
> 
> On Sun, 19 Sep 2021 23:10:23 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> I'm going to bump harfbuzz to version 3.0.0 but being a major version it
>> looses 15 apis[1] and introduce some new ones. So I'm not that sure if
>> this can be a normal bump or I need to introduce the new package
>> harfbuzz3. Package pango that requires harfbuzz builds fine, but how
>> should I proceed? Should I build every package that depends on it and
>> check if it builds fine? Or should I add package harfbuzz3 and then
>> every package that depends on harfbuzz should move to harfbuzz3 package
>> per package? I'm new to this case so help is appreciated.
> 
> The best is to not have to introduce a separate harfbuzz3 package, as
> it really complicates things.
> 
> There are not that many packages that have a dependency on harfbuzz:
> 
> package/efl/efl.mk:ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
> package/libass/Config.in:       select BR2_PACKAGE_HARFBUZZ
> package/mupdf/Config.in:        select BR2_PACKAGE_HARFBUZZ
> package/pango/Config.in:        select BR2_PACKAGE_HARFBUZZ
> package/qt5/qt5base/Config.in:config BR2_PACKAGE_QT5BASE_HARFBUZZ
> package/qt5/qt5base/Config.in:  select BR2_PACKAGE_HARFBUZZ if \
> package/qt5/qt5base/qt5base.mk:ifeq ($(BR2_PACKAGE_QT5BASE_HARFBUZZ),y)
> package/supertuxkart/Config.in: select BR2_PACKAGE_HARFBUZZ
> package/vlc/vlc.mk:ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
> package/webkitgtk/Config.in:    select BR2_PACKAGE_HARFBUZZ
> package/wpewebkit/Config.in:    select BR2_PACKAGE_HARFBUZZ
> 
> So I would suggest to create a configuration that builds all those
> packages successfully prior to the harfbuzz bump, and then retry this
> configuration with the harfbuzz bump applied. This will give you a
> sense of how much breakage the API changes are causing.

  It would be nice to convert the explanation above into a documentation update!

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
