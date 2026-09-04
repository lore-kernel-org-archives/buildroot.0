Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723ADC61DD6
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F98C60C2A;
	Fri,  4 Sep 2026 12:17:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5JBkqrUFEETb; Fri,  4 Sep 2026 12:17:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E9C1860BFD
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524256;
	b=hvQfnszMpt7fDYofGrSlaULF/dygEbsb+wHIedGxt6JxZS3hbNmCRQxmvLZzytgWjCsM
	 9UYQTJSIXpRcGs41oNGx/c4DCbpib6NgiuUk3K9tIynQgGLB1LmcBZ+2cd4hCo3RYMpGJ
	 zzSEuSFGdrAIsaVHnepYE3fjcPlYvGQ8MsjXyBLKGqb5Au6uRkWxsa0DW6uC+ESLj8oiZ
	 foKwbfu2ZqFqnNHNn+B8JHaDHymnQIDl75X0RZOsiN6d0b3WJoJN7TYivnwwwETe7q/5d
	 jL7VDJdrZt0k0wDgb9SZysBsyptx5KGUnuqi3tpSEfYulxpD1S/zJdYjGOuHKno4PDw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524256;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xJ40KoX4QVjMoQL1ivBYSvewqkYJ4/bY786gf9twpsg=;
	b=ArqAwbfNOgiPYYcxlVZ7MRJ1/4JK/lFhgFsoLb2HJRW3lY8Uv78SJ3zMRaO9enpafjpM
	 Jfr4NPEf/wMv4O40U3FgfU8/o64M7TJseZOpyvAFS2TDp2XjFFfObDhJbVHA1m4XPr6eR
	 IbEQTVn5qT9amUJAdLbK8dEPu5QtQMQqU8w1GPypcHlQQBbUQMEV9FYcwxQWkpVfbqNIA
	 a5VeLICAGS3ynrgIteD9pGyP4iRGfpVxARKafgOICqSR6fG16cLf5FkcmJUzlbUhr7I3O
	 SRNbCF716YCS5zKU3r3LuRgUo8rYHmub0xu41zoBi8PcxsMDee+9AgOC9nj1Zpa7Cxg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524256;
	bh=xJ40KoX4QVjMoQL1ivBYSvewqkYJ4/bY786gf9twpsg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Q7UISbpGxA82Hx41hCx1YCM0esYZxGwKP2V36mL+99eVDYH4uhYUh100WjnPcLnTz
	 Rb2YNCZ9JEAadF2FnP4oOSmZR9KPZA2xpZfXYekXm2/JwGbJ85udgEnDpeMcJBTSrm
	 lIOmQIIes/By8AWlT2jZ+r96z3ZdDbngeGUO+T7SOhEBMDAJgAsONV0hZVbKSVLdQG
	 RV+tc6XEZoWTsFwsgjWkp0JW/XEVdaMSFrffbVNR3fe+FLIytlni7V4JKJFT//GYgd
	 Teq9FKKw83EtM/TYvHuPcDb2YF2IXJjTogykkQptTRrCyV/ZSS1YRArSVEFR9z9ZNv
	 LqFNyj45KOxfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9C1860BFD;
	Fri,  4 Sep 2026 12:17:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C60CF14
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 822C781176
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cm4Z9amWGazU for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:17:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5EA9B81172
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524252;
 b=PBPY7lo0+12kWSzG+GV5PwYBZbquonvkHQwaT53yQVIfJh4edJg7pTejHm5XXoEIdReX
 DIb4VrU+1heuv6fqS8lGpCyt1hbIJFfHveGL1omxIOXp/bNZiXeHkVfUzFGq1cZf91HG+
 QOHmgsrhWetW8rhzfuqk16Sd1epY0HzwDutefhQynvRDynQZvqbrccpdk3TZxkD3s7NLw
 5OjrqXQLojY8qqAyB+xYCFkIdbAJVYnGzxPLka03X4RSN1KFbEXxGA6K7rS1UtGQ+yUsI
 BFF2vsWSlRQ1LQ1X1m48L+A2CinQRsgV3TB+dYhMOLdXbPVxkNPXpwI3/vVJZGQqIJg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524252;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=zErxI0M1km/XFllCeQjFn2+1xNOYVT73F/dcPzqfeno=;
 b=rozPFbYg0NdAV0AHSo71AjGq0erc1ngNoh4DSOD1W2mIBbcIwfv7Cj55Zm2WvzRnJ/Uu
 hkAvuX2ZYoPbOjI0hPj1FtqmG5v/Tw4bkFveE4gZ/bJiy/AJ0rq5iyNng/Tfb3KUbWCLq
 mxi5kVWvKoM1tG2gD72MNg8Hv57lOA7ukSpnWGL0kv8lbQb04xgUHzKAm+oZGmKupdzJ4
 xRaYLJZUu6xsOV3CIuSHLa2Pxe6VFlZPtRdS0u5q3wP2hBkWhHe6gynxKe6jNj0KBytAX
 IQr9s6/bItz4OVNdziQ8+F4Y2C+Rtp/h3AlCADbPntKTFAQ6BSwVUEXxybnVPxdf7IA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=TVIqVzxS; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5EA9B81172
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:31 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-49b8be0409fso6536305e9.2
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524250; x=1789129050;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=zErxI0M1km/XFllCeQjFn2+1xNOYVT73F/dcPzqfeno=;
 b=qsQzpXjNovxOQf7Sbz1Ck2u8NlYbNfwr8rasKFYIW3e36gw+EEingo23mvuz/URsTi
 V0omMFQEx4iWTROmfGPwSj4qm9ZgBAgHfEFXhrFdtqrtlu8RPc4wdi0auVkfw5aEAMKH
 tL3Gd+fLmsm4nHnPmmTJa4+2WuF7gqcGfA5yQ3kdMgRdpW5C/ATHZWw8ZPWU/mxqIVFI
 //rsAaWyrW9oGxWUdD9XbiuQvgzHHMlWxn/LqzFb4T7pEzQOz99nD0F+ryUgW3Y0WGMG
 KZqEo6JRK3NoPyYEYIBEGI6lUz8ubqUapL93HtryEb2azL46in7pQFhX82PaWCz+rF+k
 KBTw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxaocfAUpJS5hndaJDPf55uyCu72X9eh9NETwWLmpr9s9W3Qfc0MBYuzQzYe/MS3anlYZImrkKqd0U=@buildroot.org
X-Gm-Message-State: AFuF++muwxGr7PnGYtLVJiNfPvNgRkpYmEtm6kOwGRnzfKfH+L88yMXB
 oU9eb3Pikp3graMla0/yspPG8XTnlFqkZqIdFsj1v/lQK+K+ienmSovyHTmWtn3SvM1HZKPjAss
 IlvXs
X-Gm-Gg: AYBFou2IYyQTTM2qVM01ptrck2rShGtaJ7kkcwOCuubXGs5/GcQpSvgg3Vnt0GqhSL2
 COJG6JwWaSw504mIUleSmZticbk2Gi+4GnfwIHUxhCfTqwMYfOG9vQs4Ar/JbTAPQjz8bw0hrHd
 hKMlWY3SqvNapsV/Ftp6Eu1UCzam37wp13q+ZVNCxhT321dRBxmZZSKRoJT1VkRQbdMSPWUfOMf
 eMWGuiLFhNl7/Abtk1o9uZyZ9G/vqwcrZBgz0gd1/1NPg4KwfbqE+UNwLUohWPShasCSZ2/LpUu
 XT/1KNkGXAYQbBYdK4oZ/R0/twDqj7kPs4XGihLNosjcoGUyh9T6Y68Ac6cYQ5B4XkiXNdoTSTs
 y2RnP5bBdlf9f9w1+tRrEOcCvnveTicsUij0/R1lXEpbPW11s4nzf165kQxI+WlCtTGfayytYZx
 yAWrGnwSAnQQNDZT/sYfVIXHP146qr7T140xBLO4kHLyNhG4I6KCib4Q==
X-Received: by 2002:a05:600c:4744:b0:49c:fc6e:a3e0 with SMTP id
 5b1f17b1804b1-49cfc6ea75amr31133045e9.31.1788524249847; 
 Fri, 04 Sep 2026 05:17:29 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee7fec25sm166563165e9.13.2026.09.04.05.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:17:29 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:17:28 +0200
Message-ID: <20260904121728.403745-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260825202833.3005742-1-bernd@kuhls.net>
References: <20260825202833.3005742-1-bernd@kuhls.net>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: security bump to
 version 3.6.4
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
> https://github.com/openssl/openssl/releases/tag/openssl-3.6.4
> 
> This release incorporates the following bug fixes and mitigations:
> 
> Fixed QUIC server being able to trigger double free when processing
> INITIAL packet.
> (CVE-2026-18798)
> 
> Fixed heap buffer overflow in CMS key unwrapping.
> (CVE-2026-63072)
> 
> Fixed invalid pointer dereference in CMP server via crafted protectionAlg.
> (CVE-2026-63076)
> 
> Fixed unbounded memory growth in QUIC server incoming channel queue.
> (CVE-2026-14456)
> 
> Fixed RPK server signature algorithm selection being able to dereference
> a missing certificate.
> (CVE-2026-14457)
> 
> Fixed excessive memory use buffering DTLS records for a future epoch.
> (CVE-2026-54874)
> 
> Fixed client-side memory leak in OCSP response checking.
> (CVE-2026-54876)
> 
> Fixed untrusted Sender DN being used as a format string in CMP response
> validation.
> (CVE-2026-63073)
> 
> Fixed CMP indefinite cache growth of extraCerts.
> (CVE-2026-63074)
> 
> Fixed QUIC ACK-only packet retention being able to cause memory exhaustion.
> (CVE-2026-63075)
> 
> Fixed possibility of AEAD forgeries with empty ciphertext when using
> EVP_Cipher().
> (CVE-2026-75803)
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.05.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/2a5d83eac421f7fd60ba5d82e0997b9e69a8e926
> 
>  package/libopenssl/libopenssl.hash | 4 ++--
>  package/libopenssl/libopenssl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
> index fc1a125521..46ac5589dc 100644
> --- a/package/libopenssl/libopenssl.hash
> +++ b/package/libopenssl/libopenssl.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/openssl/openssl/releases/download/openssl-3.6.3/openssl-3.6.3.tar.gz.sha256
> -sha256  243a86649cf6f23eeb6a2ff2456e09e5d77dd9018a54d3d96b0c6bdd6ba6c7f1  openssl-3.6.3.tar.gz
> +# From https://github.com/openssl/openssl/releases/download/openssl-3.6.4/openssl-3.6.4.tar.gz.sha256
> +sha256  9bffaa1ad1e07b354c21bd3324ec02fa15579f45a7d0494b3e74bc449b7333ef  openssl-3.6.4.tar.gz
>  
>  # License files
>  sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index e9f795832a..9ddc85c197 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBOPENSSL_VERSION = 3.6.3
> +LIBOPENSSL_VERSION = 3.6.4
>  LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
>  LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
>  LIBOPENSSL_LICENSE = Apache-2.0
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
