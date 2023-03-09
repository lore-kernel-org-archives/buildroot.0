Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94415C64EC4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 20:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4407A6177A;
	Thu,  9 Mar 2023 20:04:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4407A6177A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0w_wmaYIj_Kn; Thu,  9 Mar 2023 20:04:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B25A612CE;
	Thu,  9 Mar 2023 20:04:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B25A612CE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 782801BF3BA
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 20:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DB9D612CE
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 20:04:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DB9D612CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ep0y4XOJHlMp for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 20:04:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57EC860A4F
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57EC860A4F
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 20:04:49 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id a25so11895051edb.0
 for <buildroot@buildroot.org>; Thu, 09 Mar 2023 12:04:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392287;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cmmg5V/RC81kMI1dCpF/w1TBH6RSGwg0vTLs59KzBj0=;
 b=gDCFvIlkJcpSjtT/mKMm9iKlhI3SlyyL1L+JU43Pc12RotyX4Bfbzpc4CQsLA9LUNe
 XkC6NE7AQhzVdTptEubKixSZ2b9GrlZPoEIleVlFSI+HUopWG46xgvP8Jpsktur4kGzr
 vO+fCvpVv/EXdVQ6+GdZ0Q26eKifH4Dl+FRW2dwgWBPxdVWn0+U+xm6FgZhQ7Bl7MEIP
 vpq92/8B77JRToL0yI7ik6S+IMkpwgTsBV+W/e24qoK4t3jEISPT15ZuPLJ2QALlvnH2
 uPurDMasDZ3qWItRVkgf2/j76UvUTYpAGmLEKdhPXah168+uRZBkpjptKdzXX3WdErqp
 g3eg==
X-Gm-Message-State: AO0yUKW7JWwV7D+KcDecfY7mGiZRgvVCXP0QXnHGO22RqgFlc6fh4syp
 bHwALu2kKhbY8Q86NcVOjOV+8dFQt0FXZA2FepI=
X-Google-Smtp-Source: AK7set97gW8n7oEZs50JzTrVCP+1E5O/G2sjYcmLLvXwzmN6DR7yJDXLboYOwRRIECRLN1FKwSaw1A==
X-Received: by 2002:a17:906:584:b0:8d6:626d:7e03 with SMTP id
 4-20020a170906058400b008d6626d7e03mr24895130ejn.40.1678392287510; 
 Thu, 09 Mar 2023 12:04:47 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 op20-20020a170906bcf400b008ca52f7fbcbsm9167527ejb.1.2023.03.09.12.04.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 12:04:46 -0800 (PST)
Message-ID: <997d670a-8843-0686-995b-63b671cca1c5@mind.be>
Date: Thu, 9 Mar 2023 21:04:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20230305232504.232860-1-ju.o@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230305232504.232860-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1678392287;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Cmmg5V/RC81kMI1dCpF/w1TBH6RSGwg0vTLs59KzBj0=;
 b=JzjWi5L8Un0HulpX93Rh63P8D6iOTrwF2zAKy72IIWp87FVG2los9IKgdOCb7t6uop
 XIspiAQw+HKbRx2CXU0PwU3GEBOyy27oKJhHTJxy/gCCxVG6Pk73Kkc7VYlchRLpgyzX
 d7y4dmy+7TPQtbiVtIHxBBN6eT1xEl9slCf1rQyT1fCd3pt8YLTGMnfDY5o+Ktcf5EAH
 S4RlgUhV//NPV0SdTBkvgeOwrSK/+eqUGxevjXTISQp01qZoJxxQLvBKltOCEVwsokfE
 kNYANBkh6kPSL2drUSFo3aaAdjmNxmErHencDeWOhzH+3okxhKxDsmWJb91oxT7xA2+B
 STPw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JzjWi5L8
Subject: Re: [Buildroot] [PATCH next 1/1] package/bridge-utils: update
 project URL in Config.in help text
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/03/2023 00:25, Julien Olivain wrote:
> The old URL no longer works and shows "No repositories found".
> Replace it with:
> https://wiki.linuxfoundation.org/networking/bridge
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Why did you mark this for next? It's clearly a fix, right?

  Regards,
  Arnout

> ---
>   package/bridge-utils/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/bridge-utils/Config.in b/package/bridge-utils/Config.in
> index de5883f063..2d886e2cb0 100644
> --- a/package/bridge-utils/Config.in
> +++ b/package/bridge-utils/Config.in
> @@ -8,4 +8,4 @@ config BR2_PACKAGE_BRIDGE_UTILS
>   	  added. Instead use the bridge command from the iproute2
>   	  package which supports more features.
>   
> -	  https://git.kernel.org/cgit/linux/kernel/git/shemminger/bridge-utils.git/
> +	  https://wiki.linuxfoundation.org/networking/bridge
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
