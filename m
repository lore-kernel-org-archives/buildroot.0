Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E43C624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3057E60DC7;
	Fri,  4 Sep 2026 12:18:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2g0eeixDs7PG; Fri,  4 Sep 2026 12:18:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8BA8B60DC1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524327;
	b=DguVhYR7IHsNbngpweH1BQ21j5qCWnMavXcnaGdmp6bUwlTpE0isN7vBlhX/Fdf8sVf0
	 wdKgrwaomZa3QgBUzGuhxqgZcUiaXjVX/Gj+GDLteU5z3NTKX89YUbu57hrnpgcQoPIUc
	 dSrMboq9VWU37EzMjwj0IoqjbtRYisU3zJI/3em5luhlN+VNqq0kwzesgE/qFBhPnTqNz
	 ljdJHHWUPUNHSQrVgzoldXgqhwIPCg8w30qc/Cc5+qVRMoMl39ZX5xtto2+qsWbMtpMh9
	 fJHS1w64I+l450vd7ZivieZOpkgDpmd8AOBwVzHc6Jj1dTweU3qSTIwECHg68GrNd/A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524327;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PlAoTzdcTbooYUyWnIebgWtbEL1y2+tvU+MbVqz3H/A=;
	b=BHU3aSfV8uKcMd/29JXK8MI69HngYe4ZvLejNFx1V8kHRwLLC9bE69u6SMwTkvsQ3Cm4
	 uhu4bemMFxc2ho2omKAn7V6LGBmU6YBPWAY8FpWKDqXEMcwvNe/K9VcPB/70MFvB2Q/gi
	 8Qi4rfnXa4Op05GXwRBpdLG+aSc4OLMem+a82bp3yMHIKS0wa2LGaAAkJ5OxY+wpDHQez
	 xqlQuVLtIDaTlkzLrmPTKSybnjq6i7f0KJQJgA2+0DHCTXco233S86RialC0rZWuxDGXp
	 3C8XBxZT1QJ5pQQ/3j3/dJ7MqquqrJISjQO/w9G0ZJD9lhw0hlF4iY/Q8TbDftLgzEg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524327;
	bh=PlAoTzdcTbooYUyWnIebgWtbEL1y2+tvU+MbVqz3H/A=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZMov9pDAXykYIz5BjMzz0bpwUaQBpN4tTc+uf7lmqcWmmTAncXehtFld2IfRkIlEo
	 nvctILWth8D5zWRVp2UEFsk8yfWGfEM1iJrHT4edY35tu6lOyT2+czZeqo1YKzp0b3
	 SYPMT02UphywxBknpJjSfdVsRP5vrMXx6FJJUDXs/WtQswwJARsvbz98Pv7JcP49Jx
	 iwhFgcd3IKXDS2Kkj0olCCVM8c9aKvwOAhF/VgH1a6o+oxSaxeopXDiH23X6nXMQF5
	 hP8Km/3vioMFn2ES4oJC1h0Uhf52c1FEUJKHpuxr81TmyPEmVccVb/ogtahHMJVKzD
	 Q64YMhZw29AmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BA8B60DC1;
	Fri,  4 Sep 2026 12:18:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DDF5DF14
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61EA180F62
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jguXd_M531ae for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:18:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 29F5080F24
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524322;
 b=DKGgDR6eagxXoTghwX863wnKzjQmNvw3MOBy3Ry5FAQKYmE2PwVBqE775k9CJDqnvfA0
 O1Uf9AZa+VTPziKWDs/Ny2KCBkrGUqPCBIS9+T6jAQcx3nLDBCXeIjxu4a/SdIyLekL6I
 qE9Mfeisf++NAOEbRQjbhmH4SGUlqx3Q83F+3xPCBWRoyndCeWOhloALW/KEP2Tk1h4ap
 FpNmkxnosJDArOUs/0SfDuus5zLi6hGRmGG0inyC2NjC6gl8S1dEn8KDxS8lFNNBqZq+/
 3SSyptXQW8eZJwETUBN9Mz65dEZa4lAU/R08NIuMYGQPNTOW/odWfu5fF1wEU6hr33Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524322;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=AOhS3loemGvZ3vMa5s2Mea5+lyliqhfb5MBEPVWaTjw=;
 b=VBX/CbHBdX6P0ycad0UuhWyMYDzMMkDaRCo2tjjnLT+w8Gg5CITlgsM5xke3knjFkJKV
 2uBrqChoTrNDTR3e9KsGcHUkkE1qohTNeUwFCV71xdRJnm2VpAaB6H86g6wIPMAajixwV
 CDIYvUVQMdW1Noz/Ksr5s0DprfnPDMLCgk1WLCWkUl4tz9kgFzlWO7vQLF2F/DLsTUkcw
 1eTsrLPhKh4tnYfitglFCbTsdQd0aG+zWb6xtMTBh7MlHiK/9ojpGmi3MJshcbey6HhCz
 NpSAqrVpi/ch52gWuNh5ODQcBy3s0e4Dc88/NrwgP8YReejqSzIxMz7aLdYN5pgE4oA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=UK7XARKI; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29F5080F24
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:41 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-495590dde14so12960475e9.0
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:18:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524320; x=1789129120;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=AOhS3loemGvZ3vMa5s2Mea5+lyliqhfb5MBEPVWaTjw=;
 b=CgvcCVZQTeBC/UE/Akn2VLRhLgsr2YJ3Z9PVGAaFcMvrHlyr7+dtPAQDJ65Rkc90xh
 OkOrRykLUJVJ5InBM83T9qBBHwIwri86oRmrhl7gNM27c004yRoFDX2+ISuPxwfpj1HL
 6TVWgbg+DjwiKzOABY2gIJOboWRt2ZA9snYVLMKYB5FHLw3DNK3XvMvhFzlbDLRc/M/R
 VJpduQTxBw0aOwETKu8SAVZLoMMBRTuQ0qpITQMQNbODMA8F7RqoEytMB+1O9ORtIzJW
 WDQrWSBhtYr9cnowp97Ux9F7vO3h2azApvRGqd2Rd/NR/R56Eoc3tv4gO7cWrBOoR7o1
 QIWw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxUDkrYSMDCQ54jQ2X4H3SUiart77g8GskcjhULjJSXGUzYGHq2OvyB3D3Vg1i7f9b1jOuLfa/0wYs=@buildroot.org
X-Gm-Message-State: AFuF++mzUBLvmOSQ/Sq+tmOxwPTtrEs2sxH87uAsB8ZMJneas2NiUeEQ
 qWuUJj99HiQfNSIPLy54/ZDBdajomlKZ5lr0dP41Wp/e7QHwfqfQsq/RPGEpEaI/zw0=
X-Gm-Gg: AYBFou0vjCwgC2smisJwzOTwYhySY0cWfr4KJdEv/wn3lcipAowZYHj7MI1LdVdzunf
 OSk86WJ380OvnBdy4IXzcU2mdl2zAH1pAuDUexxV/Ol6x/AlDt7FJlr/r+lVl3hrWXzLcHUUdnR
 1PKg4E+B35GZX/3tUWKDoy2DBnw/068yCdXGW4w0DPnmhmq/JvSiVbgWy8G7JV293b0RdLA/ygf
 t8neHLagJQ3avtHfCh9kHu2ibVfZairdOV2SKFy6lz4k2fld4DLpox04pp7Ic4FrnXvfw5XYLs2
 iUjNSW24X/LQgqNNblGt5Cm3QfYVz60vRxq7EYcYtWeMUz7QiCxGR1QNRVnppzH4HWLk5VrrhaQ
 9CQA9NfJ9SKUSR68zH3momqGtzB0gjE9sYqhXq0vBU9P+tB4yHvCO7p81+atz54LBomrcIpJfX/
 KkLP5zURp0Txo51Cwwpoll6X375CaiJyTJHzikjPFBERTbW1Yk4CdLxUTILvZ0C0dm
X-Received: by 2002:a05:600c:468b:b0:49b:9105:cdaf with SMTP id
 5b1f17b1804b1-49cf8214eaemr75585035e9.8.1788524319722; 
 Fri, 04 Sep 2026 05:18:39 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cff8195ffsm4960155e9.14.2026.09.04.05.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:18:39 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:18:38 +0200
Message-ID: <20260904121838.405747-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260824184502.676800-1-ju.o@free.fr>
References: <20260824184502.676800-1-ju.o@free.fr>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: php: fix test by
 switching to "Debian" filesystem layout
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
> Buildroot commit [1] (package/apache: use "Debian" filesystem
> layout to fix read-only rootfs) changed the filesystem layout.
> This had the effect of installing files to different locations
> and breaking the test_php runtime test.
> 
> This commit fixes the issue by updating the file paths to their
> right locations. The "httpd.conf" was updated by following the
> same recipe described in the comment (starting from a config
> file as installed by the apache Buildroot package).
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/16060152979
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/1006666f67ba2837ba4cf1014186f3b1cc8f3415
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/16075500679
> ---
>  .../rootfs-overlay/etc/apache2/httpd.conf     | 22 +++++++++----------
>  .../apache2/default-site}/htdocs/script.php   |  0
>  2 files changed, 11 insertions(+), 11 deletions(-)
>  rename support/testing/tests/package/test_php/rootfs-overlay/usr/{ => share/apache2/default-site}/htdocs/script.php (100%)
> 
> diff --git a/support/testing/tests/package/test_php/rootfs-overlay/etc/apache2/httpd.conf b/support/testing/tests/package/test_php/rootfs-overlay/etc/apache2/httpd.conf
> index 109247514b..75bad163db 100644
> --- a/support/testing/tests/package/test_php/rootfs-overlay/etc/apache2/httpd.conf
> +++ b/support/testing/tests/package/test_php/rootfs-overlay/etc/apache2/httpd.conf
> @@ -5,14 +5,14 @@
>  # - "ServerName localhost:80" added to remove startup warning,
>  # - "AddType application/x-httpd-php .php" added to enable php.
>  
> -ServerRoot "/usr"
> +ServerRoot "/"
>  Listen 80
>  
> -LoadModule authz_core_module modules/mod_authz_core.so
> -LoadModule mime_module modules/mod_mime.so
> -LoadModule log_config_module modules/mod_log_config.so
> -LoadModule unixd_module modules/mod_unixd.so
> -LoadModule php_module modules/libphp.so
> +LoadModule authz_core_module usr/lib/apache2/modules/mod_authz_core.so
> +LoadModule mime_module usr/lib/apache2/modules/mod_mime.so
> +LoadModule log_config_module usr/lib/apache2/modules/mod_log_config.so
> +LoadModule unixd_module usr/lib/apache2/modules/mod_unixd.so
> +LoadModule php_module usr/lib/apache2/modules/libphp.so
>  
>  <IfModule unixd_module>
>  User daemon
> @@ -27,8 +27,8 @@ ServerName localhost:80
>      Require all denied
>  </Directory>
>  
> -DocumentRoot "/usr/htdocs"
> -<Directory "/usr/htdocs">
> +DocumentRoot "/usr/share/apache2/default-site/htdocs"
> +<Directory "/usr/share/apache2/default-site/htdocs">
>      Options Indexes FollowSymLinks
>      AllowOverride None
>      Require all granted
> @@ -38,7 +38,7 @@ DocumentRoot "/usr/htdocs"
>      Require all denied
>  </Files>
>  
> -ErrorLog "/var/logs/error_log"
> +ErrorLog "var/log/apache2/error_log"
>  LogLevel warn
>  
>  <IfModule log_config_module>
> @@ -49,10 +49,10 @@ LogLevel warn
>        LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" %I %O" combinedio
>      </IfModule>
>  
> -    CustomLog "/var/logs/access_log" common
> +    CustomLog "var/log/apache2/access_log" common
>  </IfModule>
>  
>  <IfModule mime_module>
> -    TypesConfig /etc/apache2/mime.types
> +    TypesConfig etc/apache2/mime.types
>      AddType application/x-httpd-php .php
>  </IfModule>
> diff --git a/support/testing/tests/package/test_php/rootfs-overlay/usr/htdocs/script.php b/support/testing/tests/package/test_php/rootfs-overlay/usr/share/apache2/default-site/htdocs/script.php
> similarity index 100%
> rename from support/testing/tests/package/test_php/rootfs-overlay/usr/htdocs/script.php
> rename to support/testing/tests/package/test_php/rootfs-overlay/usr/share/apache2/default-site/htdocs/script.php
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
