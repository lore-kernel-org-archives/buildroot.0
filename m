Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0D9C48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 16:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2997D81FAB;
	Sun,  3 Mar 2024 16:17:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2OeskV_Kq6YA; Sun,  3 Mar 2024 16:17:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE0DB81FCD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE0DB81FCD;
	Sun,  3 Mar 2024 16:17:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2EDB11BF575
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29E5E60827
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:17:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y6taGw79gYpu for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 16:17:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DBADB60812
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBADB60812
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DBADB60812
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 16:17:00 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2d29111272eso56861341fa.0
 for <buildroot@buildroot.org>; Sun, 03 Mar 2024 08:17:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709482618; x=1710087418;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QFNb1vWffwW1Q/FdRRt7y/N89O0dAhQzv77Fekexo5o=;
 b=E68zXchqTljgMOFvkcY/tvy/YsLtA/+U7HuYs0xJtfgW7Hhmlta5fP1rCmKl5dbo5y
 Qa1SIoDcJ/HH2yeO8VRFbL9fBHBL7B77Gvi7+foaR1iV+lVXnjSvjAOyTLzcTQ0h47jD
 BGfp+j2gGx1QMic0L8ltNGG8CNhlUZEAJPkhxvpt7lqQKLFtjU/Hy7DWZnjSW7O67XL4
 07l2mJvvkGgPSS565O5k87+yj1PDlFD6s/ursP8gQnOF7mQrFVsAERr4759lpzej4v6B
 bo3WOhP9W/lhZV9WDWZk5+jHjsokr77Klf2R0dNxsVJB5EzNKVg8dXtU8IaTftRoGTzI
 CIdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7qQCiP/sD/xkkiZ160ITFGXw3KL4pNgBsJw9V5xckxg8R9bMAukHK6x+94ss3KcF4gdNmTFjL+ROgDCOifHXq3spV/uRgfQ==
X-Gm-Message-State: AOJu0Ywj3ZY9dDOZFazNQwHAqeFkrpHBYal/wk9pk85nrnSyWDUHuVqo
 QuGV+6RBtFcBDHKp2z0krvU2Apu5bPQIF464AGZGtFs9zgFdqRi7fNRSnA7EuUfkwSO6VUG5IlB
 E
X-Google-Smtp-Source: AGHT+IGBNhOsLLsclUqcWR/FKQjVFPGZCOTfSfn371tUsa/uOFfuAgFsbMOmbCO2h1eKa3MTfs8yjw==
X-Received: by 2002:a05:6512:40e:b0:512:b932:7913 with SMTP id
 u14-20020a056512040e00b00512b9327913mr4341527lfk.41.1709482617980; 
 Sun, 03 Mar 2024 08:16:57 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 gl7-20020a170906e0c700b00a44e65447f9sm1535534ejb.7.2024.03.03.08.16.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Mar 2024 08:16:57 -0800 (PST)
Message-ID: <bfb1ec41-15b6-409c-bb31-4f9d65df2599@mind.be>
Date: Sun, 3 Mar 2024 17:16:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Viacheslav Bocharov <adeep@lexina.in>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240131150927.194406-1-adeep@lexina.in>
In-Reply-To: <20240131150927.194406-1-adeep@lexina.in>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1709482618; x=1710087418; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QFNb1vWffwW1Q/FdRRt7y/N89O0dAhQzv77Fekexo5o=;
 b=dQOKUmJSRltAWQ1/vwDAftZltA2PxU8q0CMaAD5p1Yt6S7dpjtPTdD+Gi9v8ujl6SN
 AlILC6cW5H6cIn7ye+hndAfjR5vcYCp03ZFOGmbEw2ybhqg3WmHE5K6HCQ+dp8DxsVJ3
 KFFdSQbac1rePqqYJrP1rfbMk8DleB8PE+rQxBMfYVGziSUKhv8dAV9CbD16QTxDQtIN
 KeKeGKOah1b3oCgd14bDxZ3isAee4wbH3G9MIUFcLyU+w2e/63rDPKW5O3rdY+HMxRYV
 7k7MXTLf7GaDGX8cLgkXNHJah8jLtZjHPRVElsmOZBKQY/jCPrPf+Z1vr2BPZZ7fVaWQ
 QFiw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=dQOKUmJS
Subject: Re: [Buildroot] [PATCH v3] package/rtl8822cs bump driver version to
 latest
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 31/01/2024 16:07, Viacheslav Bocharov via buildroot wrote:
> - Update driver for kernel 6.7+
> - Fix warning/errors on build
> 
> Fixes: http://autobuild.buildroot.org/results/51000a9d4656afe9e0ea6f07b9f8ed374c2e4069

  That URL doesn't exist, I replaced it with
http://autobuild.buildroot.net/results/e4f/e4f1dd9d6e3ac305fd54221e04e4bafeb480ccf7

  Applied to master, thanks.

  Regards,
  Arnout

> 
> Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
> 
> ---
> Changes from v1:
>   * improve commit log  as suggested by Giulio
> 
> ---
>   package/rtl8822cs/rtl8822cs.hash | 2 +-
>   package/rtl8822cs/rtl8822cs.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtl8822cs/rtl8822cs.hash b/package/rtl8822cs/rtl8822cs.hash
> index 4b44512913..34bcc412ce 100644
> --- a/package/rtl8822cs/rtl8822cs.hash
> +++ b/package/rtl8822cs/rtl8822cs.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  b3b8543ff6d6d602ffaf60342969830edc8205917b96d004f84ed79524894dc7  rtl8822cs-2e4e99ae1502b173a938357dc1087e49475b26ed.tar.gz
> +sha256  d61fff0ee8b4219a6441791ff26be1b8c49ef8b2ca78345bf12b7a0541f498e9  rtl8822cs-fda6cd263e89567272060e6182a39aee20b894c4.tar.gz
> diff --git a/package/rtl8822cs/rtl8822cs.mk b/package/rtl8822cs/rtl8822cs.mk
> index 6036acb864..dbdc7d84bf 100644
> --- a/package/rtl8822cs/rtl8822cs.mk
> +++ b/package/rtl8822cs/rtl8822cs.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RTL8822CS_VERSION = 2e4e99ae1502b173a938357dc1087e49475b26ed
> +RTL8822CS_VERSION = fda6cd263e89567272060e6182a39aee20b894c4
>   RTL8822CS_SITE = $(call github,jethome-ru,rtl88x2cs,$(RTL8822CS_VERSION))
>   RTL8822CS_LICENSE = GPL-2.0
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
