Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D443AC87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B6B180D20;
	Thu,  7 Aug 2025 18:24:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vT8s2QXzPky9; Thu,  7 Aug 2025 18:24:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEF5B80D8D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEF5B80D8D;
	Thu,  7 Aug 2025 18:24:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C9ADA4C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB591400B3
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:23:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kupIZ8V88-Vo for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:23:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7C5A340057
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C5A340057
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C5A340057
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:23:58 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-459e794b331so8579565e9.3
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:23:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591036; x=1755195836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QSY6zd1AoGB80tOffSTYJt1AcpAUyzOiB1qaNmVlfCU=;
 b=qYQd5XOeWBjWLbu/N03Le/gLfX7kwY3cstcdkb1KejGYXITiv1eGGexj7Oo9QIbOrg
 jieQ+w9PKojAd3u2QPUJIlmeYsF9SeDlI8i7Sw3WnoS42y1B7uzDoDYUZcDxhD0H28N1
 Vdj4FYXxSjCFcUX1e5Cv2qBNU5LYB5pPcyH/NrRk4tsU3WnpbalBDp0Vau2GWd8H0h8A
 sR8cPTf55/6nam7c7y/7VoB7iQTIKUUL+KRsSHGOvIwsMYePPQt3Qsal23vsEu0OZLy/
 7IivzjLjnagNYeKUu/NvDzyk1ZjdzXJ6kq6+E1wGRqI3HXqn44tjlbMyPconFxy9o1jR
 B6Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXStC5qliMMfE1gElo7z3JtHPuIlCbpHPZtkfTH69wDFbm89aTP5vDPaHQhSOQwtmdYxQtCOXr+TmU=@buildroot.org
X-Gm-Message-State: AOJu0YzwYK9sYGOEhPlRXM329owfpjfeOIWCauqYB5XvUZOY1Q4SvyWT
 aem75zTKcL8IImiQKrxjWNiX/zJ7bWl1xuqInR+dlUDgt5nuDJq7R4vWmvxSAU3cyi0=
X-Gm-Gg: ASbGncuWv0r/XZ2Kmd9wC0vVOoGtY0isLsfpzHbXIKZR0DCFPwks4KhVYC1HOErL7oY
 WfmM3sLj0bCJNTnKDKeIXRrDW42X5hxUH0axYP7JXJzFoZFfURMKDShPuBVOHwEWyp94ICNUXbA
 lTW2pv3s7AtDYscgZjhmbJHDHEBrnYHr/NqbdOciQMbdP+o7mC9+fGSESYdfb1mMGnvshUoTqTc
 koVFn2b5NglWJsGXCbVypfmkO1jU9dQb35cwVkrl6eG1cCW6KE2eytFyDVVxkuDPnffiH4MpIAe
 dzIHUsD3V3w/oIC9fxX6Mshe1sMXrIcGRnNTkBdG9MBiTaItAQkr9AscfUqsy1diN4w0jOKwrSF
 NPzecaB4lJ0G3ag==
X-Google-Smtp-Source: AGHT+IFJE1ex3d33DbU3cUx6+o0Fl1P+xORSgcg8hsEbXmy0aOPSn50OIVKh9YXc3uAi2nK1P2SMzg==
X-Received: by 2002:a05:600c:35c2:b0:445:1984:247d with SMTP id
 5b1f17b1804b1-459f4eaa21amr212535e9.7.1754591036520; 
 Thu, 07 Aug 2025 11:23:56 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c4a2848sm27257978f8f.71.2025.08.07.11.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:23:56 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:23:55 +0200
Message-ID: <20250807182355.723864-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250706064416.276504-1-bernd@kuhls.net>
References: <20250706064416.276504-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591036; x=1755195836; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QSY6zd1AoGB80tOffSTYJt1AcpAUyzOiB1qaNmVlfCU=;
 b=KSG+c7nsY/n3W5ZC+7Esep2w+4uua4pZsBWie5WjYQJRtU1PydjyS31It+pHyTG3td
 HsHI2BdhXat2OeeT5pzurn/geiw8VwbUfjlTAwrzCzJRpYjLaElT4Yo3snfKGjuo62pI
 7UbiX3hMYUS8WbslKLmj3if6M/LCStc6E8AHf8eCIz7z088ZiA8UFbeqcqvr4sL55YPQ
 ZYdAZajnwlx0WhQXXhXMHLkY+a+VTQCmJogz3KjlNIA/KJcffitXvaWU+zpcAMa2A746
 FwOYMEWjAItvVvjRkrQOInLzITuPFgpvgGUCng/dGVhD8dTk8Yvxg/2yhJecV35IC5s7
 MF7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KSG+c7ns
Subject: Re: [Buildroot] [PATCH 1/3] package/ntp: fix OpenSSL detection
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
> Fixes:
> https://autobuild.buildroot.org/results/261e630f20dd20b7f606a7bcbd8fa7b50ce82fbe/
> 
> The build error occurs when libatomic is needed for linking.
> In ntp_openssl.m4 the result of OpenSSL's pkgconf was omitted.
> 
> Enable configure option --enable-verbose-ssl to help future debugging:
> configure: ntp_ssl_libs_l:   (-lssl -lcrypto -latomic)
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/ntp/0005-fix-openssl-configure.patch | 18 ++++++++++++++++++
>  package/ntp/ntp.mk                           |  2 +-
>  2 files changed, 19 insertions(+), 1 deletion(-)
>  create mode 100644 package/ntp/0005-fix-openssl-configure.patch
> 
> diff --git a/package/ntp/0005-fix-openssl-configure.patch b/package/ntp/0005-fix-openssl-configure.patch
> new file mode 100644
> index 0000000000..0a213fcee6
> --- /dev/null
> +++ b/package/ntp/0005-fix-openssl-configure.patch
> @@ -0,0 +1,18 @@
> +Fix OpenSSL detection
> +
> +Upstream: https://bugs.ntp.org/show_bug.cgi?id=3985
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +
> +diff -uNr ntp-4.2.8p18.orig/sntp/m4/ntp_openssl.m4 ntp-4.2.8p18/sntp/m4/ntp_openssl.m4
> +--- ntp-4.2.8p18.orig/sntp/m4/ntp_openssl.m4	2024-05-07 13:21:14.000000000 +0200
> ++++ ntp-4.2.8p18/sntp/m4/ntp_openssl.m4	2025-07-06 08:37:14.140657598 +0200
> +@@ -326,7 +326,7 @@
> + 	     not_found) ;;
> + 	     *)
> + 		AC_MSG_NOTICE([Searching for libcrypto in $i])
> +-		LIBS="-L$i $NTPSSL_SAVED_LIBS"
> ++		LIBS="-L$i $ntp_ssl_libs_l $NTPSSL_SAVED_LIBS"
> + 		AC_CHECK_LIB(
> + 		    [crypto],
> + 		    [EVP_MD_CTX_new],
> diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
> index 1a7c7e7937..f481c5d79b 100644
> --- a/package/ntp/ntp.mk
> +++ b/package/ntp/ntp.mk
> @@ -29,7 +29,7 @@ NTP_CONF_OPTS = \
>  NTP_AUTORECONF = YES
>  
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
> -NTP_CONF_OPTS += --with-crypto --enable-openssl-random
> +NTP_CONF_OPTS += --with-crypto --enable-openssl-random --enable-verbose-ssl
>  NTP_DEPENDENCIES += openssl
>  else
>  NTP_CONF_OPTS += --without-crypto --disable-openssl-random
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
