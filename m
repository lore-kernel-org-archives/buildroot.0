Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E224FCD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B946B40C5C;
	Fri, 15 May 2026 13:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1zStBAvsJ6XH; Fri, 15 May 2026 13:34:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4D2540E34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852055;
	bh=2NwXRxYY3B3Zh4HnwhdK/q4UPbOY0+4g6eiNecXvjrA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qAmKyZvPgXuWGjTKuTZ6ZkkHXDl4aiolhnbTnYSOWlA6hXjhyktTVoGzJQzabOimW
	 oriQGhxBzx92P36c9aQ/10c9IMNGYc37ZTQG3MDjNyiHqw6jWrecP4wmdzFqrkerXH
	 eIAjBXXXt7JSLX4SnKJVKVuPsOS5eYAaFR0BZA6pM4Me1+ydlHRyiaOZ+HCmtpa04z
	 YQz9iMh93UBGScRdMl2FUPg5sBQMkJMQAivSm0O/EwlnVVDg0pBfbEzuCa3QdUwq0C
	 QH3UBYFmtS/cv4P1sPFjLHVY77pqdp3Lo+O5MkuQhU2dDqSdmqQWp+DYgAzwT0OOM0
	 22UQCvCRSG4Tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4D2540E34;
	Fri, 15 May 2026 13:34:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F007A36F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D62C484352
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mn76GdhTAaWn for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:34:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B4EEB84339
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4EEB84339
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4EEB84339
 for <buildroot@busybox.net>; Fri, 15 May 2026 13:34:12 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-488ad135063so76481565e9.0
 for <buildroot@busybox.net>; Fri, 15 May 2026 06:34:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852051; x=1779456851;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dTb3MfxMtw4W0iH5MYUQMByjaip9dh21PKUd1cD6si4=;
 b=S97pdXIFg64D/S+r9b59B0wWXLuq9gdH58sSgqAjy4tkYnhcMGmehb0kEVUDbpHdqG
 3p/vCmZ+75KQZ0wcr0FUR9xnRku56Xs/9FCqD28A72KZ5md1Owky5yxRPHrVZgKaPjyY
 Gy5tXtf68bJUDgZiac9x9c81qQOV4/UZ70acrf5lG+nKDkUlAEbwolVksZfZ5WNKdZjt
 +mB6gfcPp4wT4a1RkJGgy2dFOzrMCZucU/PPCZiA3Xz1PnsidD0oXvQCvHAHJ9Rukxiw
 E+M1JoFEVU1pwx4YsDMJSuKcJPp1eb4I+GeCEBG71050cumnhYPpgsjRJT8mtu5mSiPF
 HyQA==
X-Forwarded-Encrypted: i=1;
 AFNElJ91kJEnhZYW7dRfSHGTs6ulQY8qbBQB9ToiSbkmKsEonbrnLgqGlB3IfEAJEb8QK5Fh7V5vqyzJNd8=@busybox.net
X-Gm-Message-State: AOJu0YzEeqhAJjNItCM4rzltRS9nKzgEM/ZtZGbvXghppw0aVSGf0Wqs
 CKf7zA/W3h1KHlyc7gY1WewF72lXXuQDWI6UW734vuHNlZZorDbVF8xRxfu+X6/XKlk=
X-Gm-Gg: Acq92OFR51QRvXXtNYdVgm8fAM4HJ3WlaspZrpQg6Yp6JXY4pAkY/hMKsgfZRO+5znG
 dT9wJQOi2nVgA5AvLz6Xu0GfU8SoVZG09h/7GQjX8BORK8my8H/idiOW1jHt5Yu3gO0TL7hqnAq
 VIicIOw/3lnUAX1VVEeGckvwDWYAmmwbO+ujofdI9lXzX0q3s1T254w1kieJDl7+PQJJUA48ez0
 ti8cDPHaaFxHbTNbdbkqIK8OS+CKoTX+0QNAxsbqzQoYGfV4XnrZ2aj8bM3nI6pro3TbEtKcVyK
 o4M7vkpmlfm4EIVpuL3/M2136bMsBreOI9IxxUTpOjbiBAOimne2hrz6iwAjztBDntJ1QZCx3fV
 ssz7Relw2vXo8pyusNUPks/L1NuCNMTNXZF+L9uIzz5EsgEIaLn/EIm8cX5/74DgrRFq+H+jlow
 EArMLoHjrTURqdahcaFAPQjU4jOqr4WOkG0NHoYhB9FJdr7kxNnxCVWiM=
X-Received: by 2002:a05:600c:4692:b0:48f:d5b8:5b07 with SMTP id
 5b1f17b1804b1-48fe63253e0mr55975785e9.20.1778852050616; 
 Fri, 15 May 2026 06:34:10 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe5694f2csm61809645e9.4.2026.05.15.06.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:34:10 -0700 (PDT)
To: Francois Perrad <francois.perrad@gadz.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@busybox.net
Date: Fri, 15 May 2026 15:34:09 +0200
Message-ID: <20260515133409.316387-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429164108.159388-1-francois.perrad@gadz.org>
References: <20260429164108.159388-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852051; x=1779456851; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dTb3MfxMtw4W0iH5MYUQMByjaip9dh21PKUd1cD6si4=;
 b=cRCNrnWNL7M7cMePqopXhqEe4dJ8klT6vNQbl6HnITtZUsNblVh4z8PoSLXKON/RBp
 88QT1+pbsBJjrjIPnODHC1NerpaD4sSXIhfQDmZ97m5ekj47bj2tGqkPR2lfsd8XzFJA
 ab97txlnNvPkq4EceGqXeenij6UVv1cRlQQruIQiadVFQkkvYw7dRx1FN/FebnRlUMRa
 /Px5yRCskM+PXlx7k235YiughpfrN8sOImi/rU6dlOR+g2UzneqsTaJhMwqRMBtlP7os
 SAygwZ3kfbM8n/jXONMtDHferyO3xDBTQ4S1Ua7JHEr1GG5tU+p+NznhTSBWI1mwdN4z
 oS3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cRCNrnWN
Subject: Re: [Buildroot] [PATCH] package/libpcap: security bump to version
 1.10.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> fix CVE-2025-11961: Fix OOBR and OOBW in pcap_ether_aton()
> 
> For change log, see:
> https://github.com/the-tcpdump-group/libpcap/blob/libpcap-1.10.6/CHANGES
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/libpcap/libpcap.hash | 4 ++--
>  package/libpcap/libpcap.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libpcap/libpcap.hash b/package/libpcap/libpcap.hash
> index 7f53b99b8..098b059fd 100644
> --- a/package/libpcap/libpcap.hash
> +++ b/package/libpcap/libpcap.hash
> @@ -1,6 +1,6 @@
>  # Locally calculated after checking pgp signature
> -# https://www.tcpdump.org/release/libpcap-1.10.5.tar.gz.sig
> -sha256  37ced90a19a302a7f32e458224a00c365c117905c2cd35ac544b6880a81488f0  libpcap-1.10.5.tar.gz
> +# https://www.tcpdump.org/release/libpcap-1.10.6.tar.gz.sig
> +sha256  872dd11337fe1ab02ad9d4fee047c9da244d695c6ddf34e2ebb733efd4ed8aa9  libpcap-1.10.6.tar.gz
>  
>  # Hash for license file:
>  sha256  8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd  LICENSE
> diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
> index 67adb0a97..c4feee576 100644
> --- a/package/libpcap/libpcap.mk
> +++ b/package/libpcap/libpcap.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBPCAP_VERSION = 1.10.5
> +LIBPCAP_VERSION = 1.10.6
>  LIBPCAP_SITE = https://www.tcpdump.org/release
>  LIBPCAP_LICENSE = BSD-3-Clause
>  LIBPCAP_LICENSE_FILES = LICENSE
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
