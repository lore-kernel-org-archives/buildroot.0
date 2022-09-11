Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3275DC54EE9
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 12:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 953A741E1B;
	Sun, 11 Sep 2022 12:56:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 953A741E1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Eu3fmh70YPKf; Sun, 11 Sep 2022 12:56:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37C7841E18;
	Sun, 11 Sep 2022 12:56:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37C7841E18
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 392281BF373
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 12:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A4C241E18
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 12:55:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A4C241E18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bd4WvCyGqvOd for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 12:55:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C0B841DC5
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C0B841DC5
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 12:55:49 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id 29so9119321edv.2
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 05:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=PESnIx/DiE1eb+OyzUabn4qwxe2l1KvIMbcjj4CMGZI=;
 b=bAN2lohJmzlk7jSSCL/KL9wSd6pKp6MnA5gVRtcmx8ZMHTekXnXFo6Zd44lPZgCvfP
 M3mZUihRTd5DVPHt0tXWxGkSH7WxlB3zS++ksBSJUG512dvHLW9luvVrYtXc4QDjzvPx
 bzwzdZgsCNcLVCbbr0V/H6OS+cyvNFVC37GAxHQXlclT+JSp4yMtI2Vn9gUh7zu8IIHz
 T1o2pYXO+DCxYa/KNpJAT6XBXBqKtHIrsDtXiDUnWNLHDdXUf4CtGCS5zaAZNINNAqJC
 EEw66i0+SeI+bl4xSS2XOz/8wPeAIYljBXMHYwmUeJ57h2W14ogp5BmpVNwcbs+epT4+
 UVdg==
X-Gm-Message-State: ACgBeo172XHN5deeHVNSU6rvePvgYpi0+8vW/F3H3EOniQIPPAlFr3Bv
 HXNc5yMXixIHU4w/05TrLEw2NLLzXBNfBoQK
X-Google-Smtp-Source: AA6agR6k+ZOmRa3lclC6OhLhz8OVdrLl077ciOUxPa5nSGB9Kh2m+WNhd95YWSZncsZp5eplS52DSQ==
X-Received: by 2002:a05:6402:1d4e:b0:451:d378:eed2 with SMTP id
 dz14-20020a0564021d4e00b00451d378eed2mr529903edb.23.1662900944574; 
 Sun, 11 Sep 2022 05:55:44 -0700 (PDT)
Received: from ?IPV6:2a02:8070:4182:37a0:97b2:fd91:46b3:8d3a?
 ([2a02:8070:4182:37a0:97b2:fd91:46b3:8d3a])
 by smtp.gmail.com with ESMTPSA id
 kw4-20020a170907770400b0073dcdf9b0bcsm3050355ejc.17.2022.09.11.05.55.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Sep 2022 05:55:44 -0700 (PDT)
Message-ID: <36548884-9180-1dfa-cbca-2ab45a037632@gmail.com>
Date: Sun, 11 Sep 2022 14:55:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220904124315.12728-1-raphael.pavlidis@gmail.com>
 <20220905115121.GC1490660@scaer>
 <75e277ba-99aa-78f3-a60d-5e8cf2c1b9a8@gmail.com>
 <20220911121457.GG264214@scaer>
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <20220911121457.GG264214@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=PESnIx/DiE1eb+OyzUabn4qwxe2l1KvIMbcjj4CMGZI=;
 b=mAPZQdDdT8KUNBseRbRfrzPvhoD0Tp1U1DT2q/ofJbQ+F77sftI3pCoiQLa8ngsuZs
 oOya5JaZEyhVXIYGJMLnkJ6KierEHYyf78XfTFOt5O8T4fft5XinrRnqbPw32iktu5OK
 QbAivqNt8my1sZL3AxyAovdGfg1L47eyeAlROe0Yrr2cpPHRsA5RL4cTxUsyziFzcGF3
 jdf9OxTJHDRdJBPyAtxE60+ZPou1WnNTDJzv6hDIGwPr/j6ZOqMg43vKu9RD+rH8sb52
 OTz8IayJlGpwUnyKYyH/cgzuw+LRyW86P1bMIHTwXLpF4zOd1zAct0Zu8ByuEVzFDxjc
 RCiA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mAPZQdDd
Subject: Re: [Buildroot] [PATCH v2 1/1] package/shadow: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann, All,

(Thank you Yann for your review comments)

On 11.09.22 14:14, Yann E. MORIN wrote:
> Raphael, All,
> [--SNIP--]
> 
> Starting the commit log with a terse explanations of the package purpose
> is interesting, but what really matters are the details of the
> integration in Buildroot.
> 
> For example:
> 
>      package/shawdow: new package
> 
>      shadow provides utilities to deal with user accounts.
> 
>      We decided to expose all the options present in configure, as
>      options in Config.in, because those are sensitive, security-related
>      options, and we want the user to take responsibility on the
>      settings. The defaults are as they are exposed by the configure
>      script; we especially default the max group name mength to 32,
>      because accepting too long group names is a path to DoS attacks.
> 
>      Signed-off-by: Your REALNAM <your-email>
> 
> Of course, the above is just for demonstration and mostly made up, the
> actual commit content should be adapted. But you get the idea.

I will try it, thanks. Technically, I need this package to use podman 
for non-root user (newuidmap and newgidmap).

[--SNIP--]
> 
> Right, this is not trivial. Busybox installs a set of programs, for
> example /bin/ash or /bin/wc, which are also provided by the bigger ones,
> resp. dash and coreutils.
> 
> So, we by default do not want to show dash and coreutils in the
> menuconfig, as the programs they install are already installed by
> busybox, and even though the busybox variants may be slightly less
> capable that the bigger ones, they are far smaller and, more often than
> not, are sufficient.
> 
> Howerver, in some cases, most busybox applets are enough for the system,
> except a very sall subset, for which we want to be able to use the
> bigger ones.
> 
> That's when BR2_PACKAGE_BUSYBOX_SHOW_OTHERS comes into play: the user
> can enable that option in the menuconfig, and so packages that install
> the same set of programs as busybox applets, are now visible in the
> menuconfig too.
> 
> See for example package/dash/Config.in:
> 
>      1 config BR2_PACKAGE_DASH
>      2     bool "dash"
>      3     depends on BR2_USE_MMU # fork()
>      4     depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> 
> So, for shadow, I think at least the 'su' option should also depend on
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS, if not the whole package (yet, I'd
> vote for the whole package for simplicity sake).

I think I understand it now. It is an option to show option or package, 
which install a non-busybox version of a binary, correct? I will add it 
to the whole package then.

[--SNIP--]
> 
> I see the reasoning.
> 
> I'm still not entirely sure, and stating "shadow developpers know best"
> is still not very correct, because the one who knows best _in their
> specific case_ is the user.
> 
> Also, if you did not have an actual use-case for an option, then do not
> expose it at all. When/if someone actually has a need for that option,
> then they can send a patch to add it.

But this approach, I think have the disadvantage, that if it happens 
that somebody needs an option then he/she have to wait until is there, 
which it can take sometime. (Happen at least to me)

I understand it for such options, which are useless for buildroot like 
if it is something Windows specific. IMHO, I do not see any harm to 
expose those options.

[--SNIP--]
> 
> Yeah, I get it:
>      --enable-foo    Enable foo.
> 
> That still does not help at all. Help text should be able to actually
> help, and so must provide more info than the prompt does.

Okay, I will remove such help text then.

[--SNIP--]> The packaging in Buildroot mostly only (globally) expose 
just a very
> small subset of all options exposed by the configure (or similar)
> scripts.
> 
> We expose options in the menuconfig only when it actually makes sense.
> What is the purpose of limiting the group name length? Why do we want to
> allow the user to be able to set that value, rather than let the package
> decide?
> 

At least in my case, I need only BR2_PACKAGE_SHADOW_SUBORDINATE_IDS, so 
it would be nice that everything else could be deactivated to keep it small.

I tried to figure out, why this option was set to 32, and it seems that 
Linux only support username up to 32 characters. So, I will remove this 
option and set the value to 32 in the package because buildroot is only 
supporting Linux, as far as I know, correct?

https://github.com/shadow-maint/shadow/commit/1882c66bda31e50367d41b36fea41cd04fa19c73

[--SNIP--]
> 
> Note: it is not the _name_, it is the _prompt_ (i.e. what is shown to
> the user).

Sorry, I meant the prompt ;)

[--SNIP--]
> 
> OK, so this indeed gets a little bit more tricky.
> 
> The Config.in entry for account-tools-setuid should indeed use select
> (as seen above; plus help text as an example):
> 
>      config BR2_PACAKGE_SHADOW_ACCOUNT_TOOLS_SETUID
>          bool "account-tool setuid"
>          select BR2_PACKAGE_LINUX_PAM
>          help
>            chmod the account-tool utility setuid, so that non-root
>            users can use it, subjet to their PAM profile.
> 
> and then the .mk should propbably look like:
> 
>      ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
>      SHADOW_DEPENDENCIES += linux-pam
>      SHADOW_CONF_OPTS += --enable-pam
>      else
>      SHADOW_CONF_OPTS += --disable-pam
>      endif
> 
>      ifeq ($(BR2_PACAKGE_SHADOW_ACCOUNT_TOOLS_SETUID),y)
>      # PAM dependency handled above
>      SHADOW_CONF_OPTS += --enable-account-tools-setuid-I-can-t-remember-the-option-name
>      else
>      SHADOW_CONF_OPTS += --disable-account-tools-setuid-I-can-t-remember-the-option-name
>      endif

Okay, I will change it then.

> 
> Regards,
> Yann E. MORIN.
>
Thanks,
Raphael Pavlidis
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
