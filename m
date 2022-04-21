Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2FFC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 20:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E348382F92;
	Thu, 21 Apr 2022 20:57:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YcQBpezpQ44b; Thu, 21 Apr 2022 20:57:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF7F8823CB;
	Thu, 21 Apr 2022 20:57:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B231E1BF3E3
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 20:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF35040044
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 20:57:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s2HubpOvzc67 for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 20:57:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6DCA040055
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 20:57:17 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id c10so8318120wrb.1
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 13:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jAo0QyE62NYjstW6+ywc11tJL2M2nBw50RS4OxBvSBI=;
 b=A1nT7XZ3fG+AbzJtUSAVm2fmUV9DsUs3aZPRghNQ4Z1n69ScKgj59lM+Yjm5VTyxHQ
 6quRvOZR3ljyCuVwPH1E8c4tETUpW+FcvrX3tQ8bqCaQ9snZ92TIuH8WdRcqDciftrWU
 hL1nPq3bEVN+dcMA9q81XcBIW5TQQ7rn56sVzu29Q1+wBhLCp9V0cAGtpaWap+jdn2ds
 XVK4BsdT6D+TTCIWyfOx5Ue7NsHgSvF+8MJsllyHAQZkmmVeDsyT17dbEiVNyIjR6Ebt
 dVjehz8/Y/TOB+F5qNGNUpChXluiE52qFh/fYHB+RC1Dsx/8tLWkuP8W+lNGSlNrHfMy
 0XOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jAo0QyE62NYjstW6+ywc11tJL2M2nBw50RS4OxBvSBI=;
 b=36nCCHfVOwEJrD1GYTrTtBNaW3+aICPoTaJbid6Bgceo3G/af0H4bcVoIlxLqqja4Q
 /JzpkUjjeGvx7DryxXuetIy5XvK2DpxRK1+A/+s5+WxH0/d4Dqh0OsLAymM63Dsj3LkZ
 v92lkKrxnBBF91DgLoJpxTTA+geQM7BIEyXhJSZE9ejkbZEyWCm8kBnbBSHOPIXwoSl1
 qvKhvBe4N5QtCgUhqgMhdAIZVkphvvFVmKcbIbnKuHxiKWok7a4L2dpbJVEfkhl2j+mQ
 /nxnggyjLb5VjHHhnREKuuROpl1SSiL6XGKP2O8Gi1xM0Tk0Ic5BKCdk7in9D5TVRZte
 flgw==
X-Gm-Message-State: AOAM533FRCu+m1G//kJNokKZIQM8+2czqg+rByYseb2AYN6UwajnFyh5
 axROMo9sjioGOsfu9hvt7Pdhcrf9Ne/XSQ==
X-Google-Smtp-Source: ABdhPJxaHf0SVz+1EgGKMTqbnKqZ2M7sLcQTViQy7PBRM/twH6Yvn9qx7HmDRimRyuaNEUky1AMUqw==
X-Received: by 2002:a05:6000:154c:b0:20a:c753:1878 with SMTP id
 12-20020a056000154c00b0020ac7531878mr748084wry.308.1650574635579; 
 Thu, 21 Apr 2022 13:57:15 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 t9-20020adfa2c9000000b002061561d4a7sm79741wra.96.2022.04.21.13.57.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 13:57:15 -0700 (PDT)
Message-ID: <721a1c20-0994-3ba5-68ed-de085fefeaf4@mind.be>
Date: Thu, 21 Apr 2022 22:57:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220417215822.1070695-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220417215822.1070695-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/espeak: fix pulseaudio build
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
Cc: Arnaud Aujon <arnaud@intelibre.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/04/2022 23:58, Fabrice Fontaine wrote:
> Pass $(TARGET_CONFIGURE_OPTS) AUDIO="$(ESPEAK_AUDIO_BACKEND)" to
> ESPEAK_INSTALL_TARGET_CMDS to avoid the following build failure with
> pulseaudio raised since the addition of the package in commit
> 10b6d10009c70262cfb492b2abaa3a091a8fb4aa:
> 
>>>> espeak 1.48.04 Installing to target
> PATH="/nvmedata/autobuild/instance-5/output-1/per-package/espeak/host/bin:/nvmedata/autobuild/instance-5/output-1/per-package/espeak/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin" /usr/bin/make -j1 -C /nvmedata/autobuild/instance-5/output-1/build/espeak-1.48.04/src DESTDIR="/nvmedata/autobuild/instance-5/output-1/per-package/espeak/target" install
> make[1]: Entering directory '/nvmedata/autobuild/instance-5/output-1/build/espeak-1.48.04/src'
> g++ -O2 -DUSE_PORTAUDIO -D PATH_ESPEAK_DATA=\"/usr/share/espeak-data\" -Wall -fPIC -fvisibility=hidden -pedantic \
> -I. -D LIBRARY -c -fno-exceptions  wave.cpp  -o x_wave.o
> g++  -shared -Wl,-soname,libespeak.so.1 -o libespeak.so \
> x_speak_lib.o x_compiledict.o x_dictionary.o x_intonation.o x_readclause.o x_setlengths.o x_numbers.o x_synth_mbrola.o x_synthdata.o x_synthesize.o x_translate.o x_mbrowrap.o x_tr_languages.o x_voices.o x_wavegen.o x_phonemelist.o x_espeak_command.o x_event.o x_fifo.o x_wave.o x_debug.o x_klatt.o x_sonic.o -lstdc++ -lportaudio -lpthread
> /usr/bin/ld: cannot find -lportaudio
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/a4a6e3203ad70cd724da8130ee1648141ab39a6a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/espeak/espeak.mk | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/espeak/espeak.mk b/package/espeak/espeak.mk
> index d592673ac5..44893ac9be 100644
> --- a/package/espeak/espeak.mk
> +++ b/package/espeak/espeak.mk
> @@ -37,7 +37,8 @@ define ESPEAK_BUILD_CMDS
>   endef
>   
>   define ESPEAK_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR="$(TARGET_DIR)" install
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src $(TARGET_CONFIGURE_OPTS) \
> +		AUDIO="$(ESPEAK_AUDIO_BACKEND)" DESTDIR="$(TARGET_DIR)" install
>   endef
>   
>   $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
