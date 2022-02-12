Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9B7C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 13:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6084761B86;
	Sat, 12 Feb 2022 13:46:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0TapwmAqh49X; Sat, 12 Feb 2022 13:46:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD35361B82;
	Sat, 12 Feb 2022 13:46:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4BBC41BF283
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39C8E41507
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:45:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TdhpHTJfGpiG for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 13:45:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 975F1414E4
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 13:45:58 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id b13so20549855edn.0
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 05:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=de1PM7yyeGxc9gawvAiJuPZdcFbmPCXijf4qZu3zq0E=;
 b=Wdo0EiTRNVQWY9XSAffzBEFXIMpdYfx7WtQ54EK3gBrtGSEOklAHZpenXgb2lLGe0V
 hEiz4qC/fOWcLGPOjn7+HbH9cu8ALaPRQiJNINQoeAm+ozqK/dChZ51/G4JzAeX8AYAk
 fHtqrqJeDLGUMFlOS/+iph+689Y1prYNjTl9xKOwQBBJGuNUWQIdvEwvX93eP+/gSl7f
 6DaCk2MlZeuMNydZ359hR/iIMzFyPnMJZicndL2RH1EGRqa1wraE3w3PI2Xlb+N1HxXR
 zLqKYznIb39EMyHJDxa1RL+WcBCkGdsTJQbNHBFF9I2FP6mPkQs8pobhgFXVnyADzR6Y
 +XyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=de1PM7yyeGxc9gawvAiJuPZdcFbmPCXijf4qZu3zq0E=;
 b=njqY2GjZS6lBf3u472xxCfC4lsZUlrbB72SR+jR/XxaqH3cPKAqAVGtWMVlOs1nW+z
 L1awmsgJtCU4C2XQ1n6jK80wKe8gjUyQipRrbxhsTSHiUX3t+hjEgP5K+U2fT0etOPU4
 kkGRBbEjZofLldK1gRKNvUqnLii8LUZjuIozHtHL5Cuctbh/TYsxZWr8wa73DFy9zulN
 d8v8aJcl3IisYu1WA7Ri2j4fvHxyhQ1mrNlZValj9IZTYiUpthEkt+pEndoAEcS359Yi
 kNpox8q4UkqLkEX0QteFI22HAi41uupS2fO+h9c+8jeNep414tEwgH2o1PduqUjtcoGo
 tnyQ==
X-Gm-Message-State: AOAM531H8QKz1kwUsW53YNXJ7h7Yni5Oj114lgl1rkrNYxZvq4q1urIb
 bNZ2lp+vN02VGXZFhLOdZSSpVw==
X-Google-Smtp-Source: ABdhPJwScYteiiw3W1n1lu7VSdP1mzPtWjWFV4ejif6Q8A/bqOeZb50TOLLUvN2WufPvEvxl7deWAg==
X-Received: by 2002:a05:6402:354d:: with SMTP id
 f13mr6697121edd.289.1644673556783; 
 Sat, 12 Feb 2022 05:45:56 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id 1sm547342ejm.186.2022.02.12.05.45.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 05:45:56 -0800 (PST)
Message-ID: <a8457b90-8207-7044-0be0-14c56e3ea400@mind.be>
Date: Sat, 12 Feb 2022 14:45:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
References: <20220131194818.2084092-1-geomatsi@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220131194818.2084092-1-geomatsi@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/wpa_supplicant: bump version to
 2.10
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 31/01/2022 20:48, Sergey Matyukevich wrote:
> Update wpa_supplicant to the latest release v2.10. Drop all the patches
> as they have already been upstreamed. Remove from .mk file all the
> WPA_SUPPLICANT_IGNORE_CVES records since those CVEs will not be
> reported against the new version.
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

  The copyright year was also updated in README, which changes the hash. I fixed 
that and applied both to master, thanks.

  Regards,
  Arnout

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
