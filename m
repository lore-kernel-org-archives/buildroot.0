Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799A2CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40AC340A33;
	Fri, 16 Oct 2026 15:01:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lwhBRR-bMgd3; Fri, 16 Oct 2026 15:01:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2BBD940A12
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792162885;
	b=Ub9/gGrjuuqnRD5q0lOeoyFiee1k74j0X7koii9VkJ7eG6eCKPCXcYwGRoA7n0mWtx7R
	 6SqqLxoS2Vvdz9JGKBI855/cwFzg6cFQnRkqNcNCw5rt50Cmyfzq5KGo8vaIM1/ffC8c/
	 aSWBlplWq5bwz1x+M9tEdqznOFvRFH/AaRsligE3qsBhN3eFwLqkqjkSvb23N799WyO4/
	 bM2SagzW2GQhIzMO1jY3YdwPK09nJWofCWUhC1jNMiwqCUWV7+hNUwxPzfk3Ex+ScX5gd
	 e/FDW9QASFjVMnr0rRGwV2XYgebLQCW1NCK0DdpNV4jRsvbLu4SjncHy+JzARftKEHw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792162885;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3XPNmMDYE/o9SFp40DRjhoepehQAmbU8ZySu5aUuWWE=;
	b=C3gY/RcQ3qm+ekcwrXUEy280ByPkvbCPH1AYwMID5U5FfL0NHLlWHEj0r6BRmpzCqfnB
	 ybV0u34y1kZMoDafW2rEdicyG1YPIlw/SfwJc9fou9DnKi/L/CPeQV1n2XuxQMbUupWQ1
	 oRS4mq3vqiY/Xjlki13EbmFzvVrrLNYwrZcEpOO6RLTKMFA5EmkjLNTdOS9pfAdsY2kRC
	 mFjphxywclEgIQ2XblGsoSKbjeZrfQf3P7JxmVF/cbF14uolVQtaoJgAyPfxTYVRW+xZu
	 JaibFhhneZbXLVpJk9AEm3IC2pw2FTJzlyV0DZcyLe2C41JtzavfkQWnE7n2dS17k0Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792162885;
	bh=3XPNmMDYE/o9SFp40DRjhoepehQAmbU8ZySu5aUuWWE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EWkx/tMvy3IeuIhXVqPmeEl7KaFQSKoGYjQ1wR98pcQQOHHX7n7tIIUK948Zfo108
	 f3pg4JICTXFb4UUGBEbHK00w4XCh2frWWtUpCpmtbAH+1Yx2+f0K6076FYE9U/7+I5
	 N/ylbjG19JpFhaXom8hslvrB3qUE8ivm9hL2d5iq1sdDnTfsnkPpoQaPElv+HWamZb
	 6ETq+R7shmN4XGi1ddJqOKEqRBwbj0ZKg25xI+cTkzRMoNUiSzVp7nD8zc81rrbSMS
	 AVLLDF5+NddVAvhM+mR+vMKkwB3Huz0pO0OO+4QBAlGNPhNcwvkjWCH3c5ovHbiy3U
	 ME/5E/K0oigVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BBD940A12;
	Fri, 16 Oct 2026 15:01:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 34626255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B3824016D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7yOOGPNJqikh for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:01:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1564540042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792162882;
 b=RBWfUhPE3HfRGVTDg91vWkWflPxFBW46auGafU6oYo/zSGsoGBF2iKQ7FS9NIS+j2L14
 MstmXq9WQOUhHxaUcAUjXidfJ+ljvhE5gTaqgMrRDIGnJdpak2lakIdpEeqpQmsIeeW5z
 E4iPTmj1qhVRK3YwNZz8SeUKC0Fa1arnPxDjvrMgXGWqmQC3qUO0oJ3UbmU70cPfCeaLY
 HNIuXaLpuSBnWLKsQktN/G+u3q36qnB8i5tOAW3B/wm3E8J6Vb0O1siRZ0yV7xmwDP9jC
 phNgQ+wNvCsc9BL0ZTtsThgRLn0xp35Kw52jXxdw6ozbMtvykWdrEZxCgwQR1+Xuwdw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792162882;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=ToD+kWd0K52nGkjRBxrUYKNBtNW2Ej2WGvRIhxqCbYI=;
 b=mcaNk6xJbn8tMJHgShlK5VsXzdo85mNk8dQi5tQj8uTZCjsOq5UJNSNvHolmebMyKEPm
 I2CnOjhIS36yQCaqiMqvefJjgqxtBLRIfovW3wqB8Ysgp82mhXG6bbPUvV+nHbglgEK+s
 PjPC4Lm5FTa1v8Hu7BeWKEBbGBJLr9G2KpXAYLSliSrGcWkZntGEUk1pE54RLYxTPTyNu
 qmCVWjNLVntAgYe9eDnB2ERzwjn7ByBsshG/N2O1S/ktnYCcjDyyic9xHHhZJU40L/c1S
 f2YeQ0aPrfZoy9waoyrVPUWjEVy1ZEnzjOkelccuOp5MCzuu6TP93k6MaAupqqR2Tbw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=WRcKC+0U; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1564540042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:21 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a1698ea378so392535e9.2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792162879; x=1792767679;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ToD+kWd0K52nGkjRBxrUYKNBtNW2Ej2WGvRIhxqCbYI=;
 b=e5dQkIfNGTr4DCgKD8vjv5r+vRNwNLyT3it5vTzDTzEUZVzwOuconKfrhg6FAxR6dg
 K82WxDL7zpRGcayYviITei/yJatEaxYtrM623h5aVG6Sepkh910gctnS1aCVmvoLJvc6
 9y71n9D7FkZiQXBSFl2cvnRuOO1zQcJpbNXsCwHRKphDmWq7O5K6R6A2wnO1+sKq5fUD
 brCuIRjetMUGM9korP2AYwSf8btsJV6YYBhmImy0qb+3zmE2k16i/gPWXgHT6X721atr
 oQEyE9+cuUWOQ38g5V+dXSHv9mhhn5ajXwteGO6hCtoYq/Obyem7sylA3cbT8PrtM8HQ
 zdJg==
X-Gm-Message-State: AFq9FYKc2iAKaHiSJAIp+ifY6qYlZM46vjJMUD8Szv/q/rtAoVTA+3MS
 6EuCrjeYAu/wx6597S0d921YvOM3v7nYW9uOMbExyxMYmFO87/3Pt8BnwC643Q6TUsk4mnG3VcU
 5bdDun0s=
X-Gm-Gg: AYBFou0Kz2qmEIgwZC3dAmudZpWhx/cJPZWsX/9hg368lQNM/5FQHGkMOP2WiXcRWXv
 kOV2MHK8yqp83DX1svAW05WS7BTWzZ/upSWGD3mZAho2qVoV+ybGiVq5eqhwC0l7mls+ySO3gPS
 JXCVXzr7SAdKx59FtwLonxa2gC7e5X5bNLKIuvOGBZ+nS8Du+cZNWkHRrY28o3SsTOWMYFgrce9
 50BucduOn6AVcpBmXDpXL/SxKL/9+VsVltXGjx/9ZPekAppp6E/QZizV7ZsGslgnAZ8xq/ueqXv
 +5KoifXffe9Kg1Bi1cTsmN/7LjiZAtyi8U8BFAxMYAmn0PANq9ce6LFznfKlgmtIo319irUA4TA
 FHSc5HLl7B9/YtJx5nag+sIGPCyTIAv3lGABNmx+6fxjk27VaI2cxwNVr0KMr9Q9hO13KvZT1st
 6ZnBjrBVHxeSHeYeIOkuKI/K6GBhuOUuAgJ9hA/qNYU5CgyPEr4ac5iETerrjVlvtEXtfcq1FLq
 O6RI3UBniw/kyDKGkoVOfHWaAz7oD3X53ZHFFGRKg==
X-Received: by 2002:a05:600c:19ca:b0:4a1:d25f:3c59 with SMTP id
 5b1f17b1804b1-4a1d762c0a5mr1084685e9.34.1792162877566; 
 Fri, 16 Oct 2026 08:01:17 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1c10fe9d3sm131734475e9.13.2026.10.16.08.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:01:17 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:01:14 +0200
Message-ID: <20261016150116.59990-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20251226154652.948817-1-thomas.petazzoni@bootlin.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/flutter-engine: don't write into
 $HOME
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> gclient.py tries to not only read from $HOME/.config, but actually
> create some directories/files in there. As $HOME can be inaccessible,
> let's override XDG_CONFIG_HOME to tell the depot-tools code to write
> its stuff into $(@D)/dl-tmp instead (which we already use as a scratch
> directory in this package).
> 
> Fixes:
> 
> >>> flutter-engine 3.29.2 Downloading
> /home/thomas/buildroot/br/output-all/host/share/depot_tools/gclient.py:3367: SyntaxWarning: invalid escape sequence '\s'
>   dot_git_pattern = re.compile('^(\s*)url(\s*)=.*\.git$')
> /home/thomas/buildroot/br/output-all/host/share/depot_tools/gclient_scm.py:436: SyntaxWarning: invalid escape sequence '\.'
>   tokens = re.search('//(.+).googlesource.com/(.+?)(?:\.git)?$',
> Traceback (most recent call last):
>   File "/home/thomas/buildroot/br/output-all/host/lib/python3.13/pathlib/_local.py", line 722, in mkdir
>     os.mkdir(self, mode)
>     ~~~~~~~~^^^^^^^^^^^^
> FileNotFoundError: [Errno 2] No such file or directory: '/home/br-user/.config/depot_tools'
> 
> During handling of the above exception, another exception occurred:
> 
> Traceback (most recent call last):
>   File "/home/thomas/buildroot/br/output-all/host/share/depot_tools/gclient.py", line 108, in <module>
>     import gclient_scm
>   File "/home/thomas/buildroot/br/output-all/host/share/depot_tools/gclient_scm.py", line 23, in <module>
>     import gerrit_util
>   File "/home/thomas/buildroot/br/output-all/host/share/depot_tools/gerrit_util.py", line 42, in <module>
>     import metrics
>   File "/home/thomas/buildroot/br/output-all/host/share/depot_tools/metrics.py", line 23, in <module>
>     CONFIG_FILE = utils.depot_tools_config_path('metrics.cfg')
>   File "/home/thomas/buildroot/br/output-all/host/share/depot_tools/utils.py", line 48, in depot_tools_config_path
>     pathlib.Path(config_dir).mkdir(parents=True, exist_ok=True)
>     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/home/thomas/buildroot/br/output-all/host/lib/python3.13/pathlib/_local.py", line 726, in mkdir
>     self.parent.mkdir(parents=True, exist_ok=True)
>     ~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/home/thomas/buildroot/br/output-all/host/lib/python3.13/pathlib/_local.py", line 722, in mkdir
>     os.mkdir(self, mode)
>     ~~~~~~~~^^^^^^^^^^^^
> PermissionError: [Errno 13] Permission denied: '/home/br-user/.config'
> make[1]: *** [package/pkg-generic.mk:181: /home/thomas/buildroot/br/output-all/build/flutter-engine-3.29.2/.stamp_downloaded] Error 1
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/flutter-engine/flutter-engine.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
> index 1fa59a3863..e1c56ee62b 100644
> --- a/package/flutter-engine/flutter-engine.mk
> +++ b/package/flutter-engine/flutter-engine.mk
> @@ -181,6 +181,7 @@ define FLUTTER_ENGINE_GENERATE_TARBALL
>  	PATH=$(HOST_DIR)/share/depot_tools:$(BR_PATH) \
>  	PYTHONPATH=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR) \
>  	PUB_CACHE=$(FLUTTER_SDK_BIN_PUB_CACHE) \
> +	XDG_CONFIG_HOME=$(@D)/dl-tmp \
>  	$(FLUTTER_ENGINE_PKGDIR)/gen-tarball \
>  		--dot-gclient $(TOPDIR)/$(FLUTTER_ENGINE_PKGDIR)/dot-gclient \
>  		--jobs $(PARALLEL_JOBS) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
