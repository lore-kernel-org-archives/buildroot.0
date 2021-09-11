Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 514A3C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 21:04:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D535861100
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 21:04:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D535861100
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DD6340612;
	Sat, 11 Sep 2021 21:04:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BGxMyF6ilh7e; Sat, 11 Sep 2021 21:04:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EF2B4049F;
	Sat, 11 Sep 2021 21:04:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B71721BF47F
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 21:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A45CC4044A
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 21:04:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jxdr4HJ2k6ov for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 21:04:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB9A840488
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 21:04:42 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id z94so1703768ede.8
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 14:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=++jgCHgmEQJQI0mmdHKsXyqm2i2x4bBsstUEXihPTUY=;
 b=ZZ/pmgV+Vd6OlI0eSJmr7EVw1M8AeLvzvz7c4iGUROe0ww/W+LJoYKRSjLRX/JxsfC
 U7mp3Wz5im+HE5zxW95X+HKx4ocy1hSPOQZyJ68bJc1mJFUo1wtDQp5jE6xHkDwHgrV/
 gGup+EQMVfEocnxI6VXTWS5QSOKIshiN3WijmmjdOGTQ4oJl8bhRetoLTXuPo6+PKjff
 SpkOpSKgFkJQ11rbGqu4y5BA4iyoE3xhH/8ktrDzsrpz1NzTdd252lVgKMu6Kdk6HMR4
 43fDKLvDVUYfvl6hIEgI72TPA0whSOX3iMG1GQrLU4z2SXjkSJTqzNZxZwqwKEHP+tkL
 5XgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=++jgCHgmEQJQI0mmdHKsXyqm2i2x4bBsstUEXihPTUY=;
 b=Z7JvQ0mCkbuWN8bHeAnM/thb//AhqvJrlMHa71B2QHly8aaJvhoOtXA0eODZcINNhN
 AldkCtSyHtU2Sx7TwF2e3nsiJW7NILN9EMMwhvrK8AIuLJQqo0mRU5n7HLS63O1qyaMO
 gD2HbQBtx2VYTVjbQi03PIb5o7U8YZQ3JwmCjH98PqAWSHSrbQxXhuqCQUF6DaQBLby/
 L9N05mGYM9UPo8JcL0ZxqXBfnrHgrGgiq5sJ3EwKzPUzofLUS+/KJCan2wMOqXTHMk8f
 rkKqNam9gxQXcpzsRbMqGXxRglaE2iBGgPOy9456CocVrL3C+vmq9tcWaEhEbdJlH6C9
 tOlQ==
X-Gm-Message-State: AOAM5304tnNyIZtp5Q12kTLMYTuH9b+5dGpcaJaDvET2NpMMOWlP+9Xr
 8mjb3W1tn/PzbvxKtQsiT309mBLOk0Dd1A==
X-Google-Smtp-Source: ABdhPJxgzu9SJ8MLZcYVJ8auDVOrrPXL3r0o9KeuHqVtT8UmiXtjFkDwh4nVv9TpLdBGeI+FNFFFCQ==
X-Received: by 2002:a05:6402:21e6:: with SMTP id
 ce6mr4765139edb.153.1631394281179; 
 Sat, 11 Sep 2021 14:04:41 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id bt24sm1202696ejb.77.2021.09.11.14.04.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 14:04:40 -0700 (PDT)
To: James Knight <james.d.knight@live.com>
References: <DM6PR08MB39937E02CFE8C1C61A541E41A0D09@DM6PR08MB3993.namprd08.prod.outlook.com>
 <9cc92872-5f7d-149c-faa5-10e9f678332e@mind.be>
 <CALAjcgUFFcqC0DK9LuvQXrXh3qECxhvapioEVXcyg2UyHJjwsQ@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <693f2918-ba6c-40c3-aedc-52d180abfe1b@mind.be>
Date: Sat, 11 Sep 2021 23:04:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CALAjcgUFFcqC0DK9LuvQXrXh3qECxhvapioEVXcyg2UyHJjwsQ@mail.gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/3] package/rpm: bump version to 4.17.0
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



On 11/09/2021 22:52, James Knight wrote:
> Arnout,
> 
> On Sat, Sep 11, 2021 at 4:27 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>> The commit message says 5.3+ but you only allow 5.3 exactly here. Could you
>> test if 5.4 works as well, and update the dependency accordingly?
> 
> Will do.
> 
> I believe I just grabbed "BR2_PACKAGE_LUA_5_3" lazily, assuming it
> would be treated as something such as >= 5.3. Doing another inspection
> now of the configuration, that is not the case.
> 
> Would it be "best" to have a dependency on "BR2_PACKAGE_LUA" and
> "!BR2_PACKAGE_LUA_5_1"? Or, would there be a better way to serve a
> +v5.3 detection?

 Sounds like a good idea - easier to support a 5.5 if that ever happens.

 Regards,
 Arnout

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
