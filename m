Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2594CC433EF
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 19:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC69D40A7F;
	Thu,  3 Feb 2022 19:36:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mY287NVF9x9S; Thu,  3 Feb 2022 19:36:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84C5440A79;
	Thu,  3 Feb 2022 19:36:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 52F1D1BF32C
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 19:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41DE6416C2
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 19:36:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KB9qVF3nY0tN for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 19:36:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E47A41753
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 19:35:59 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id p15so11918858ejc.7
 for <buildroot@buildroot.org>; Thu, 03 Feb 2022 11:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=n7QjBhPXJLUiTpGZHmLKjtTJU88t88QGdc8Qd6Sgp90=;
 b=M423E6GA5Jm/vlc3tcSVNH6pCrTwWpO+qf/TEeq41C0/rqyNMUqd3pIA7BD7AY7W+n
 Yaa/YLF3tIyLb7PnzVfdy23TOBS4AfOm6EJKHDiczmN2Jbz9SC+nze+dB58PusBpCMHN
 I9+LA2WrCZ5QBCUDE746PFLvJfEJoouh+bcJVMjWsQ12AGssUWEV4MicgEq296UC5hYw
 77nmadb0N96mFCSvnsqiJVmzOEhtAxLwlKadRJh77SJT/0yRpeZ/lpaL3LAWGs7WBxk4
 X7ouVZhJ/+3arKt9T8KQ3AakgLZKQ3VwPZBt2KxU1ONx+Seg8+pT8goQtGARN3YjWP+4
 7Row==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=n7QjBhPXJLUiTpGZHmLKjtTJU88t88QGdc8Qd6Sgp90=;
 b=e7CjGbZ5FB9NAMO5t+DRfXDo5pVB5XUf2YIzdoil+FCys9gY9Ec3Zvs8OCFQM1xt9k
 6uD7T0dKls9QqcT45QCAyEwBi1Y+p5JsweaIJQi+M84jcXJD+53wZAv9/v12mPb218Ty
 jHD4sKOoT4afmgv8s1syoGx4QSxvQa3kJMbZ+Kpoi7qKu7xm16z5MiJyjXpiaaRuiiiF
 bUtdhGrTdhupFyooNC6JA4Itz358iYxIr0W0mjI1t1bfktGo3K8G7Zbe1HfQeaIRR8oe
 c8q1qH/IZL+cvroM1qkqnE8ebCp1Zzw0aL0XvnPwUvsKBW4WnxVyhWuLOzLzyUc2DV0R
 NsiQ==
X-Gm-Message-State: AOAM532fNFl8TSvEQ0fF2um0bfOIOobAQSRc6kUiQGvve0il+UQxVd8G
 yck5Faz66CPooG+HHJsrnTL51Yz4LGDJxg==
X-Google-Smtp-Source: ABdhPJz72sKqtV0fgHWFRfl1va+TZZkvtXm3v7jcNHqu0nE4mduuGhQVRNlE581x1v98xmVjIVlNUQ==
X-Received: by 2002:a17:906:4fce:: with SMTP id
 i14mr29754957ejw.632.1643916958262; 
 Thu, 03 Feb 2022 11:35:58 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d5sm17050127ejr.200.2022.02.03.11.35.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 11:35:57 -0800 (PST)
Message-ID: <fe89e71a-ad55-44ab-20ba-d2b46b15a271@mind.be>
Date: Thu, 3 Feb 2022 20:35:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220131225622.90226-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220131225622.90226-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH v7 1/1] package/qt5: bump packages to latest
 kde submodule versions
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
Cc: Naumann Andreas <ANaumann@ultratronik.de>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Peter Seiderer <ps.report@gmx.net>,
 =?UTF-8?Q?Ga=c3=abl_Portay?= <gael.portay@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 31/01/2022 23:56, James Hilliard wrote:
> This points all qt5 packages to the latest kde submodule versions
> available at https://invent.kde.org/qt/qt/qt5/-/tree/kde/5.15

  It took me some reading of the patch and of the upstream repositories to 
understand that there are actually no release tarballs or tags, and the the 
5.15.8 is something we just pull out of our hat to be compatible with 
qt5webengine. So I updated the commit message to (hopefully) better explain that.

> 
> We need to remove some patches applied upstream already.
> 
> We need to rework qt5location to pull in the mapboxgl dependency from
> a separate package as that dependency is only included in release
> archives.

  Instead of creating a separate package for it (which BTW you forgot to add to 
DEVELOPERS), I changed this to use the git download method and _GIT_SUBMODULES = 
YES. I checked that it extracts to exactly the same thing.

> 
> We need to pin qt5 packages not available in the new upstream to the
> previous 5.15.2 version.
> 
> We need to set SYNC_QT_HEADERS for all qt5 packages in the new
> upstream as headers are only copied in release archives which are
> not provided in the kde upstream.
> 
> Set the MODULE_VERSION to 5.15.8 to match latest qt5webengine which
> should be the closest release to the kde patches which don't have
> proper version tags.
> 
> Create a .git file so to trigger headers sync during configure.

  I don't really understand why this was needed rather than calling syncqt 
explicitly, but OK.

  Applied to master, thanks.

  Regards,
  Arnout

> 
> Hold back updating qt5webengine for now since the latest version
> requires significant changes to build, just tweak existing version
> to be compatible with latest kde versions for now.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
