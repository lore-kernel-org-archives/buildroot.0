Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DC9C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 21:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9065611E2;
	Sun, 24 Jul 2022 21:26:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9065611E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CWbJSfieJQFe; Sun, 24 Jul 2022 21:26:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4CB1611DD;
	Sun, 24 Jul 2022 21:26:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4CB1611DD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 883C81BF33C
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 21:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61E5983ECA
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 21:26:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61E5983ECA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id afgEZTGsGgW1 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 21:26:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BBA083EC9
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BBA083EC9
 for <buildroot@busybox.net>; Sun, 24 Jul 2022 21:26:48 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id g2so5447919wru.3
 for <buildroot@busybox.net>; Sun, 24 Jul 2022 14:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4ekNp00BvWgcEkCV/RHgT1QlmEaBK1VB1hlqwA1ihpo=;
 b=gxulGwyutvS42tXzRVflXIXHfekwA7KkBs5RVbijvYR0aVpdo4oQu2ewdMXxBBGIt/
 gGawcKlQ0WIr/MZMOFVbp3bw/lZcuzNYy4nA60Opn58pEB3lGPjY35JaTgoy8s0XIQLu
 M6xMcBq1s1ZLh/boCwJZ1nNg2K9rA1k1g7n1R80MPiB0EycN7PNcJSzjp6b0hlaYAt0v
 sd62SbMiC6jur9klVXy5mfGVw1Z03gq0pT9ZT9IESVWYpIBQHgzFgrnLu3JiSiSXJHs6
 IB8mSt3cjU68bBEdk2Qkvb3FiNNgWkd8jvW4OHMx+ObnEJwxlIMQq+msB02T6/1fVoD/
 UmHA==
X-Gm-Message-State: AJIora+YXEjWV+lrc3TcXI5MlkZJQxSXloimir05rero8bP+SFyCDPyd
 MnOpOeIijpUNLY0Wd6P6yBTxyg==
X-Google-Smtp-Source: AGRyM1uNy4vKq6i0QTstJH751umIkJvxk7aVFNmKoEPno2WHIRvX+W225qrcWZW0xDSRQhHfsSUEgg==
X-Received: by 2002:a5d:5742:0:b0:21e:503b:a368 with SMTP id
 q2-20020a5d5742000000b0021e503ba368mr5777835wrw.366.1658698006417; 
 Sun, 24 Jul 2022 14:26:46 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 5-20020a05600c248500b003a3279b9037sm15487857wms.16.2022.07.24.14.26.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 14:26:45 -0700 (PDT)
Message-ID: <b83cb617-6954-cb58-3944-c727803631bf@mind.be>
Date: Sun, 24 Jul 2022 23:26:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@busybox.net
References: <20210314223207.13460-1-ps.report@gmx.net>
 <20210314223207.13460-2-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210314223207.13460-2-ps.report@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4ekNp00BvWgcEkCV/RHgT1QlmEaBK1VB1hlqwA1ihpo=;
 b=bloEYU6lB8q5sXfcNQ8eLcVkLd80vzVoUHnG+ksuz98mhc8a5yizaM1RsEo839O5oI
 9P10aXFPZ8651eIpqtRURxVbjG17IVqLcfxTwuLwqyprxcBtE7LxIcP6FCj9/W2S9jYX
 SMs4HVuWvBsiN5AD6Di1L9sTUxGKG8TEGij+5OXt6k93UBurN4fk5CKv6askEvSfXDV7
 BudTkubm8LCwZ52WJopw/xh5oylzWxvx/8ijHom9oclBfM5SRRqA0l2gvePEG9JMKUyb
 rDcYb/Y/3ui69gqcnpFC3HNoPpqkJC5vvs2DhP/LeN6gEjXCa3uM7ponPKX7UrqSn+Zw
 PkbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bloEYU6l
Subject: Re: [Buildroot] [PATCH v1 2/2] package/batman-adv: enable
 B.A.T.M.A.N. V protocol by default
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/03/2021 23:32, Peter Seiderer wrote:
> As upstream enables CONFIG_BATMAN_ADV_BATMAN_V option since
> 2018.2 by defaullt ([1]) honor this in buildroot and do
> the same (and remove the leagcy experimental comment accordingly).
> 
> [1] https://git.open-mesh.org/batman-adv.git/blob/HEAD:/CHANGELOG.rst#l174
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

  I finally applied to master with just a bit extension of the commit message to 
indicate that upstream's label of it being experimental is no longer really true.

  Regards,
  Arnout

> ---
>   package/batman-adv/Config.in | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/batman-adv/Config.in b/package/batman-adv/Config.in
> index 9d3d7967b9..f3ac974296 100644
> --- a/package/batman-adv/Config.in
> +++ b/package/batman-adv/Config.in
> @@ -25,11 +25,10 @@ config BR2_PACKAGE_BATMAN_ADV_NC
>   	  https://www.open-mesh.org/projects/batman-adv/wiki/NetworkCoding
>   
>   config BR2_PACKAGE_BATMAN_ADV_BATMAN_V
> -	bool "enable B.A.T.M.A.N. V protocol (experimental)"
> +	bool "enable B.A.T.M.A.N. V protocol"
> +	default y
>   	help
>   	  Enables B.A.T.M.A.N. V network protocol.
> -	  This is the next-gen protocol and is experimental at this
> -	  time.
>   
>   	  https://www.open-mesh.org/projects/batman-adv/wiki/BATMAN_V
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
