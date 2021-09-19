Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC5AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 11:55:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D1156127A
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 11:55:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D1156127A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDBB18101C;
	Sun, 19 Sep 2021 11:55:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ShLV5aKxEvb; Sun, 19 Sep 2021 11:55:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B10680EFB;
	Sun, 19 Sep 2021 11:55:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 783841BF2BF
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 11:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6709D80EFB
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 11:55:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3NMKhCNSRXlv for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 11:55:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8990E80EEE
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 11:55:11 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id eg28so26303822edb.1
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 04:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=AraTANpMWqwnBAbBv0aeyLlGc/uAVcqTuvv5eLNYi7k=;
 b=dVGr+hCY2h3nUXUgz57WsCfaSzqIjlCybQaMzOjOevwrmjqirT8z+cOPrj59yA9WDE
 yYix2MjCFjAKszyLZrAbHEguadQacMRSpcwZGIz5EfWi2PDj897QFB76iHfO8725v3o1
 6ZJUBOj+diOYH8BweyKW01d3SzrJwYW4B6EE4wQkT6HVduK3h0WMORFVh39k6dfnLbx0
 J4JuAs7nRepSN//OLDajTQ5eFFCKKc/OnGwRfDGiTMYfdx49DyzPLYxJDooKX93C/kQ7
 MlnCg0z9np4NXT3J2+Y+dbXjqUZir25zKLQIge1dCGeRGtFihH89B5YhcqDa7WQNp08r
 0Ldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=AraTANpMWqwnBAbBv0aeyLlGc/uAVcqTuvv5eLNYi7k=;
 b=XrT6pWzb+wnTGYA9lY5pbk2CqOLaXOPu5pqd6j/I8yqV8o7UAa0myIlAV7gyRQHbYy
 Z7RiLPPJV+5drdHS2pfrldAj8ye53SoTRCCvXrmrIm256DpChXYzXJN/Foz7PtERR79T
 n0N5fYfO6WwSaySKebSrQhV4OT+BSKF6nnHLrhugQZIgy79KfLXmmlzSFnKS3ETz1VWy
 zdj0HemikOI0FhYEjIxNrKfMShm5wLVIrhYqazvsBZW0TraB3195JiulPCZ5oDUfW+FF
 mjdKgZTfkzh7gR1bzpwSwCauPeZdcbl/nujqhLVqToJDaNq1Rim6k93/hGHlBTxT6sou
 Y9Ew==
X-Gm-Message-State: AOAM531XWSHrzqnC42GOsUqIT3tDX5amnLez7np/1j+cgVmMMxDiRHgv
 /Fz9CiAqxF4Tjyw/2RkQI2PsMg==
X-Google-Smtp-Source: ABdhPJwog5VrZdKOT958WTx+G79AZ0IyoNaAgi6J5TPvspPC4vu0Dzzkq7W5e1XqfGij/ocWbKZTpg==
X-Received: by 2002:a05:6402:742:: with SMTP id
 p2mr23936697edy.347.1632052509893; 
 Sun, 19 Sep 2021 04:55:09 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id bt24sm4827286ejb.77.2021.09.19.04.55.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 04:55:09 -0700 (PDT)
Message-ID: <103e4d1a-46d8-0639-6f81-d1dc96c6dbdb@mind.be>
Date: Sun, 19 Sep 2021 13:55:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@paral.in>
References: <20210919071016.3339939-1-christian@paral.in>
 <20210919093709.GO1053080@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210919093709.GO1053080@scaer>
Subject: Re: [Buildroot] [PATCH-NEXT v2 1/5] support/download/dl-wrapper:
 add concept of download post-processing
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
Cc: Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 19/09/2021 11:37, Yann E. MORIN wrote:
> Christian, All,
> 
> Can you fixup the patches as you already noticed, and respin a fixed
> up series, please? In the meantime., I've marked this one Changes
> REquested in Patchwork.
> 
> Also, what was still preventing applying this to Buildroot, was a few
> still open questions, the most prominent one I can remember is about
> BR2_PRIMARY_SITE and BR2_BACKUP_SITE.
> 
> Indeed, what we download from the main site is an un-vendored source,
> but what we will get in primary or backup sites are vendored sources.
> 
> Downloading vendored sources from primary or mirror also means that no
> vendoring should be applied afterward, i.e. vendoring should only occur
> on sources downloaded from the main site.
> 
> Did you try that? Can you report on how that eventually played out?

  I guess that's what this piece of code in go-post-process is about:

# Already vendored tarball, nothing to do
if tar tf ${output} | grep -q "^[^/]*/vendor" ; then
	exit 0
fi


  Regards,
  Arnout


[snip]
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
