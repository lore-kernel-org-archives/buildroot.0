Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4726DCD1284
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 19:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DA2C6108E;
	Thu,  4 Apr 2024 19:16:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xxtgcF1y1MhU; Thu,  4 Apr 2024 19:15:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A47BF6102B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A47BF6102B;
	Thu,  4 Apr 2024 19:15:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0EF7C1BF48B
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 19:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECB9583089
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 19:15:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z8cC76vTV5gR for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 19:15:52 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AAFB083123
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAFB083123
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AAFB083123
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 19:15:50 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-5e42b4bbfa4so999095a12.1
 for <buildroot@buildroot.org>; Thu, 04 Apr 2024 12:15:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712258149; x=1712862949;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7qIbpDz7w1w9BGMT/yxIz5AonNPj6d9p2AjTxUrFSDE=;
 b=HNtmPbIwGZKS3ZRI0cwPnRC/xTue0MXhO4iM5syIcZ4BHSU/VnMDrt0wKy8mhmL/2m
 e1f7JG8U+3jfsc+CK/ucAFSV2p/Xp9z/hWEg6bayDBNbJKFKUYDr1C3qGFEIJwMd1ime
 nT1dgpZDNvj62PsrlzDpC++yXu5LHnL+QBmLhXwII3PiSTfTyOKp+Na1arBeUsLFOsQ2
 14L2pRS8f353RX0dyTd3seQcy25NXhSpQ/4Jku9nM0spksGZ88OAvuCnz/YQ15fDlJP0
 72F3edh4xdDg1djCg8HznRuvn03J3KDr/LG916lsbIiDD7r7t2SPTDE5rVDhDkkwtO+F
 lVYw==
X-Gm-Message-State: AOJu0YxF6NQDZq8kIIU7wkKj7gOt2IczWnNq83CfdTiLBxlsYHWmC2y9
 kqwM3ldLFvzLgzG/uzQFPOXXdr2sgIKwonJ8NldgkAouLFsdtGhtSIUcuXlxd0QjnacXhIK6/5L
 /STYMrfhG0UZO5poBr7wS7gZJ89PuiG4rcYhXA2WBSA/sT0I3
X-Google-Smtp-Source: AGHT+IFqDiBBik4nz9hbyZIGaqkkQwu6Ou90acKY2jVWBR9r7t8JLOUhIIrM8OfU/5+tfGsmhKyZ6dNpmiKDEl7Yxgw=
X-Received: by 2002:a17:90b:a08:b0:2a0:86b6:2e9 with SMTP id
 gg8-20020a17090b0a0800b002a086b602e9mr3393662pjb.12.1712258148699; Thu, 04
 Apr 2024 12:15:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240404191144.20339-1-KAMenyaev@salutedevices.com>
 <20240404191144.20339-2-KAMenyaev@salutedevices.com>
In-Reply-To: <20240404191144.20339-2-KAMenyaev@salutedevices.com>
From: =?UTF-8?B?RmzDoXZpbyBUYXBhasOzcyBQZXJlaXJh?=
 <flavio.tapajos@newtesc.com.br>
Date: Thu, 4 Apr 2024 16:15:37 -0300
Message-ID: <CAEHOWiOSzbsZJ9ri-rSL6_98028ycsSA6VbWtXPmqftEckU8vw@mail.gmail.com>
To: KAMenyaev@salutedevices.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1712258149; x=1712862949;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7qIbpDz7w1w9BGMT/yxIz5AonNPj6d9p2AjTxUrFSDE=;
 b=ezHW4Wc21l+01GhUGdpOcM8PyCWKOQTs2fZ9lOdI3pYvCClpdzhVi4nAiSXjCqNmV3
 nRUwyamV1vOXW72Wo96b7HyVScFTmRmL943807ofczVEhgocGkXWI9yht0MbcjwdIuz5
 HuSzg/Wq7378TUJYbMZLyz0CQCSk1KG9ioGJ6uVYO8zGBj2aliSC7uSjt2o0+ImWr69n
 dEoPprOn5DCVaGAmYurlKOKXZnyYV7GV40HmV1DXcLAhXTRBelpOeYZoC//pDHG0xehO
 5yfAJ4nfm3WiRn1l2b+2BqFwWMTEFlJLfmRR8bLkPM0jVmG5VeLDq1CXbLHDxQh/yIA2
 KXPA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ezHW4Wc2
Subject: Re: [Buildroot] [PATCH 2/2] package/rsyslog: extra plugins option
 introduced
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
Cc: sdfw_system_team@sberdevices.ru, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3505254082311709004=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3505254082311709004==
Content-Type: multipart/alternative; boundary="000000000000b7b00906154a2a69"

--000000000000b7b00906154a2a69
Content-Type: text/plain; charset="UTF-8"

Could you also patch a bump to 2024.04 and test it altogether?

Em qui., 4 de abr. de 2024, 16:11, <KAMenyaev@salutedevices.com> escreveu:

> From: Konstantin Menyaev <KAMenyaev@salutedevices.com>
>
> By default rsyslog builds with a bunch of plugins,
> most of them are not even used, despite the dependent package like lubcurl.
>
> This option is useful in embedded systems to achieve compact footprint.
>
> Signed-off-by: Konstantin Menyaev <KAMenyaev@salutedevices.com>
> ---
>  package/rsyslog/Config.in  | 10 ++++++++++
>  package/rsyslog/rsyslog.mk | 35 +++++++++++++++++++----------------
>  2 files changed, 29 insertions(+), 16 deletions(-)
>
> diff --git a/package/rsyslog/Config.in b/package/rsyslog/Config.in
> index d9e8b1ab6f..044ea861bc 100644
> --- a/package/rsyslog/Config.in
> +++ b/package/rsyslog/Config.in
> @@ -17,6 +17,16 @@ config BR2_PACKAGE_RSYSLOG
>
>           http://www.rsyslog.com
>
> +if BR2_PACKAGE_RSYSLOG
> +
> +config BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS
> +       bool "extra plugins"
> +       default y
> +       help
> +         Rsyslog extra plugins support
> +
> +endif # BR2_PACKAGE_RSYSLOG
> +
>  comment "rsyslog needs a toolchain w/ threads, dynamic library"
>         depends on BR2_USE_MMU
>         depends on BR2_TOOLCHAIN_HAS_SYNC_4
> diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
> index fac78795c2..ae645011ba 100644
> --- a/package/rsyslog/rsyslog.mk
> +++ b/package/rsyslog/rsyslog.mk
> @@ -15,12 +15,15 @@ RSYSLOG_CPE_ID_VENDOR = rsyslog
>  RSYSLOG_IGNORE_CVES += CVE-2015-3243
>  RSYSLOG_DEPENDENCIES = zlib libestr liblogging libfastjson host-pkgconf
>  RSYSLOG_CONF_ENV = ac_cv_prog_cc_c99='-std=c99'
> +
> +ifeq ($(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),y)
>  RSYSLOG_PLUGINS = imdiag imfile impstats imptcp \
>         mmanon mmaudit mmfields mmjsonparse mmpstrucdata mmsequence
> mmutf8fix \
>         mail omprog omruleset omstdout omuxsock \
>         pmaixforwardedfrom pmciscoios pmcisconames pmlastmsg pmsnare
> +endif
>
> -ifeq ($(BR2_PACKAGE_LIBRELP),y)
> +ifeq ($(BR2_PACKAGE_LIBRELP)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy)
>  RSYSLOG_DEPENDENCIES += librelp
>  RSYSLOG_PLUGINS += relp
>  endif
> @@ -33,7 +36,7 @@ RSYSLOG_CONF_OPTS += \
>         --disable-mmkubernetes \
>         --disable-mmnormalize
>
> -ifeq ($(BR2_PACKAGE_LIBCURL),y)
> +ifeq ($(BR2_PACKAGE_LIBCURL)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy)
>  RSYSLOG_DEPENDENCIES += libcurl
>  RSYSLOG_CONF_OPTS += \
>         --enable-clickhouse \
> @@ -52,35 +55,35 @@ RSYSLOG_CONF_OPTS += \
>         --disable-omhttpfs
>  endif
>
> -ifeq ($(BR2_PACKAGE_CIVETWEB_LIB),y)
> +ifeq
> ($(BR2_PACKAGE_CIVETWEB_LIB)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy)
>  RSYSLOG_DEPENDENCIES += apr-util civetweb
>  RSYSLOG_CONF_OPTS += --enable-imhttp
>  else
>  RSYSLOG_CONF_OPTS += --disable-imhttp
>  endif
>
> -ifeq ($(BR2_PACKAGE_CZMQ),y)
> +ifeq ($(BR2_PACKAGE_CZMQ)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy)
>  RSYSLOG_DEPENDENCIES += czmq
>  RSYSLOG_CONF_OPTS += --enable-imczmq --enable-omczmq
>  else
>  RSYSLOG_CONF_OPTS += --disable-imczmq --disable-omczmq
>  endif
>
> -ifeq ($(BR2_PACKAGE_GNUTLS),y)
> +ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy)
>  RSYSLOG_DEPENDENCIES += gnutls
>  RSYSLOG_CONF_OPTS += --enable-gnutls
>  else
>  RSYSLOG_CONF_OPTS += --disable-gnutls
>  endif
>
> -ifeq ($(BR2_PACKAGE_HIREDIS),y)
> +ifeq ($(BR2_PACKAGE_HIREDIS)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy)
>  RSYSLOG_DEPENDENCIES += hiredis
>  RSYSLOG_CONF_OPTS += --enable-omhiredis
>  else
>  RSYSLOG_CONF_OPTS += --disable-omhiredis
>  endif
>
> -ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
> +ifeq
> ($(BR2_PACKAGE_LIBGCRYPT)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy)
>  RSYSLOG_DEPENDENCIES += libgcrypt
>  RSYSLOG_CONF_ENV +=
> LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
>  RSYSLOG_CONF_OPTS += --enable-libgcrypt
> @@ -88,21 +91,21 @@ else
>  RSYSLOG_CONF_OPTS += --disable-libgcrypt
>  endif
>
> -ifeq ($(BR2_PACKAGE_LIBMAXMINDDB),y)
> +ifeq
> ($(BR2_PACKAGE_LIBMAXMINDDB)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy)
>  RSYSLOG_DEPENDENCIES += libmaxminddb
>  RSYSLOG_CONF_OPTS += --enable-mmdblookup
>  else
>  RSYSLOG_CONF_OPTS += --disable-mmdblookup
>  endif
>
> -ifeq ($(BR2_PACKAGE_LIBPCAP),y)
> +ifeq ($(BR2_PACKAGE_LIBPCAP)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy)
>  RSYSLOG_DEPENDENCIES += libpcap
>  RSYSLOG_CONF_OPTS += --enable-impcap
>  else
>  RSYSLOG_CONF_OPTS += --disable-impcap
>  endif
>
> -ifeq ($(BR2_PACKAGE_MARIADB),y)
> +ifeq ($(BR2_PACKAGE_MARIADB)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy)
>  RSYSLOG_DEPENDENCIES += mariadb
>  RSYSLOG_CONF_OPTS += --enable-mysql
>  RSYSLOG_CONF_ENV +=
> ac_cv_prog_MYSQL_CONFIG=$(STAGING_DIR)/usr/bin/mysql_config
> @@ -110,7 +113,7 @@ else
>  RSYSLOG_CONF_OPTS += --disable-mysql
>  endif
>
> -ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
> +ifeq
> ($(BR2_PACKAGE_POSTGRESQL)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy)
>  RSYSLOG_DEPENDENCIES += postgresql
>  RSYSLOG_CONF_OPTS += --enable-pgsql
>  RSYSLOG_CONF_ENV += ac_cv_prog_PG_CONFIG=$(STAGING_DIR)/usr/bin/pg_config
> @@ -118,28 +121,28 @@ else
>  RSYSLOG_CONF_OPTS += --disable-pgsql
>  endif
>
> -ifeq ($(BR2_PACKAGE_QPID_PROTON),y)
> +ifeq
> ($(BR2_PACKAGE_QPID_PROTON)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy)
>  RSYSLOG_DEPENDENCIES += qpid-proton
>  RSYSLOG_CONF_OPTS += --enable-omamqp1
>  else
>  RSYSLOG_CONF_OPTS += --disable-omamqp1
>  endif
>
> -ifeq ($(BR2_PACKAGE_RABBITMQ_C),y)
> +ifeq
> ($(BR2_PACKAGE_RABBITMQ_C)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy)
>  RSYSLOG_DEPENDENCIES += rabbitmq-c
>  RSYSLOG_CONF_OPTS += --enable-omrabbitmq
>  else
>  RSYSLOG_CONF_OPTS += --disable-omrabbitmq
>  endif
>
> -ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
> +ifeq
> ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy)
>  RSYSLOG_DEPENDENCIES += util-linux
>  RSYSLOG_CONF_OPTS += --enable-uuid
>  else
>  RSYSLOG_CONF_OPTS += --disable-uuid
>  endif
>
> -ifeq ($(BR2_INIT_SYSTEMD),y)
> +ifeq ($(BR2_INIT_SYSTEMD)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy)
>  RSYSLOG_CONF_OPTS += \
>         --enable-imjournal \
>         --enable-omjournal \
> @@ -151,7 +154,7 @@ RSYSLOG_CONF_OPTS += \
>         --disable-omjournal
>  endif
>
> -ifeq ($(BR2_PACKAGE_LIBDBI_DRIVERS),y)
> +ifeq
> ($(BR2_PACKAGE_LIBDBI_DRIVERS)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy)
>  RSYSLOG_CONF_OPTS += --enable-libdbi
>  RSYSLOG_DEPENDENCIES += libdbi-drivers
>  else
> --
> 2.44.0
>
>

--000000000000b7b00906154a2a69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Could you also patch a bump to 2024.04 and test it altoge=
ther?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">Em qui., 4 de abr. de 2024, 16:11,  &lt;<a href=3D"mailto:KAMenyaev@sa=
lutedevices.com">KAMenyaev@salutedevices.com</a>&gt; escreveu:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">From: Konstantin Menyaev &lt;<a href=3D"mailto:=
KAMenyaev@salutedevices.com" target=3D"_blank" rel=3D"noreferrer">KAMenyaev=
@salutedevices.com</a>&gt;<br>
<br>
By default rsyslog builds with a bunch of plugins,<br>
most of them are not even used, despite the dependent package like lubcurl.=
<br>
<br>
This option is useful in embedded systems to achieve compact footprint.<br>
<br>
Signed-off-by: Konstantin Menyaev &lt;<a href=3D"mailto:KAMenyaev@salutedev=
ices.com" target=3D"_blank" rel=3D"noreferrer">KAMenyaev@salutedevices.com<=
/a>&gt;<br>
---<br>
=C2=A0package/rsyslog/Config.in=C2=A0 | 10 ++++++++++<br>
=C2=A0package/rsyslog/<a href=3D"http://rsyslog.mk" rel=3D"noreferrer noref=
errer" target=3D"_blank">rsyslog.mk</a> | 35 +++++++++++++++++++-----------=
-----<br>
=C2=A02 files changed, 29 insertions(+), 16 deletions(-)<br>
<br>
diff --git a/package/rsyslog/Config.in b/package/rsyslog/Config.in<br>
index d9e8b1ab6f..044ea861bc 100644<br>
--- a/package/rsyslog/Config.in<br>
+++ b/package/rsyslog/Config.in<br>
@@ -17,6 +17,16 @@ config BR2_PACKAGE_RSYSLOG<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://www.rsyslog.com" rel=
=3D"noreferrer noreferrer" target=3D"_blank">http://www.rsyslog.com</a><br>
<br>
+if BR2_PACKAGE_RSYSLOG<br>
+<br>
+config BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;extra plugins&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default y<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Rsyslog extra plugins support<br>
+<br>
+endif # BR2_PACKAGE_RSYSLOG<br>
+<br>
=C2=A0comment &quot;rsyslog needs a toolchain w/ threads, dynamic library&q=
uot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_USE_MMU<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_TOOLCHAIN_HAS_SYNC_4<br>
diff --git a/package/rsyslog/<a href=3D"http://rsyslog.mk" rel=3D"noreferre=
r noreferrer" target=3D"_blank">rsyslog.mk</a> b/package/rsyslog/<a href=3D=
"http://rsyslog.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">rsyslog=
.mk</a><br>
index fac78795c2..ae645011ba 100644<br>
--- a/package/rsyslog/<a href=3D"http://rsyslog.mk" rel=3D"noreferrer noref=
errer" target=3D"_blank">rsyslog.mk</a><br>
+++ b/package/rsyslog/<a href=3D"http://rsyslog.mk" rel=3D"noreferrer noref=
errer" target=3D"_blank">rsyslog.mk</a><br>
@@ -15,12 +15,15 @@ RSYSLOG_CPE_ID_VENDOR =3D rsyslog<br>
=C2=A0RSYSLOG_IGNORE_CVES +=3D CVE-2015-3243<br>
=C2=A0RSYSLOG_DEPENDENCIES =3D zlib libestr liblogging libfastjson host-pkg=
conf<br>
=C2=A0RSYSLOG_CONF_ENV =3D ac_cv_prog_cc_c99=3D&#39;-std=3Dc99&#39;<br>
+<br>
+ifeq ($(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),y)<br>
=C2=A0RSYSLOG_PLUGINS =3D imdiag imfile impstats imptcp \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mmanon mmaudit mmfields mmjsonparse mmpstrucdat=
a mmsequence mmutf8fix \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mail omprog omruleset omstdout omuxsock \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pmaixforwardedfrom pmciscoios pmcisconames pmla=
stmsg pmsnare<br>
+endif<br>
<br>
-ifeq ($(BR2_PACKAGE_LIBRELP),y)<br>
+ifeq ($(BR2_PACKAGE_LIBRELP)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy)<=
br>
=C2=A0RSYSLOG_DEPENDENCIES +=3D librelp<br>
=C2=A0RSYSLOG_PLUGINS +=3D relp<br>
=C2=A0endif<br>
@@ -33,7 +36,7 @@ RSYSLOG_CONF_OPTS +=3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-mmkubernetes \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-mmnormalize<br>
<br>
-ifeq ($(BR2_PACKAGE_LIBCURL),y)<br>
+ifeq ($(BR2_PACKAGE_LIBCURL)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy)<=
br>
=C2=A0RSYSLOG_DEPENDENCIES +=3D libcurl<br>
=C2=A0RSYSLOG_CONF_OPTS +=3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-clickhouse \<br>
@@ -52,35 +55,35 @@ RSYSLOG_CONF_OPTS +=3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-omhttpfs<br>
=C2=A0endif<br>
<br>
-ifeq ($(BR2_PACKAGE_CIVETWEB_LIB),y)<br>
+ifeq ($(BR2_PACKAGE_CIVETWEB_LIB)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS)=
,yy)<br>
=C2=A0RSYSLOG_DEPENDENCIES +=3D apr-util civetweb<br>
=C2=A0RSYSLOG_CONF_OPTS +=3D --enable-imhttp<br>
=C2=A0else<br>
=C2=A0RSYSLOG_CONF_OPTS +=3D --disable-imhttp<br>
=C2=A0endif<br>
<br>
-ifeq ($(BR2_PACKAGE_CZMQ),y)<br>
+ifeq ($(BR2_PACKAGE_CZMQ)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy)<br>
=C2=A0RSYSLOG_DEPENDENCIES +=3D czmq<br>
=C2=A0RSYSLOG_CONF_OPTS +=3D --enable-imczmq --enable-omczmq<br>
=C2=A0else<br>
=C2=A0RSYSLOG_CONF_OPTS +=3D --disable-imczmq --disable-omczmq<br>
=C2=A0endif<br>
<br>
-ifeq ($(BR2_PACKAGE_GNUTLS),y)<br>
+ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy)<b=
r>
=C2=A0RSYSLOG_DEPENDENCIES +=3D gnutls<br>
=C2=A0RSYSLOG_CONF_OPTS +=3D --enable-gnutls<br>
=C2=A0else<br>
=C2=A0RSYSLOG_CONF_OPTS +=3D --disable-gnutls<br>
=C2=A0endif<br>
<br>
-ifeq ($(BR2_PACKAGE_HIREDIS),y)<br>
+ifeq ($(BR2_PACKAGE_HIREDIS)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy)<=
br>
=C2=A0RSYSLOG_DEPENDENCIES +=3D hiredis<br>
=C2=A0RSYSLOG_CONF_OPTS +=3D --enable-omhiredis<br>
=C2=A0else<br>
=C2=A0RSYSLOG_CONF_OPTS +=3D --disable-omhiredis<br>
=C2=A0endif<br>
<br>
-ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)<br>
+ifeq ($(BR2_PACKAGE_LIBGCRYPT)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy=
)<br>
=C2=A0RSYSLOG_DEPENDENCIES +=3D libgcrypt<br>
=C2=A0RSYSLOG_CONF_ENV +=3D LIBGCRYPT_CONFIG=3D$(STAGING_DIR)/usr/bin/libgc=
rypt-config<br>
=C2=A0RSYSLOG_CONF_OPTS +=3D --enable-libgcrypt<br>
@@ -88,21 +91,21 @@ else<br>
=C2=A0RSYSLOG_CONF_OPTS +=3D --disable-libgcrypt<br>
=C2=A0endif<br>
<br>
-ifeq ($(BR2_PACKAGE_LIBMAXMINDDB),y)<br>
+ifeq ($(BR2_PACKAGE_LIBMAXMINDDB)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS)=
,yy)<br>
=C2=A0RSYSLOG_DEPENDENCIES +=3D libmaxminddb<br>
=C2=A0RSYSLOG_CONF_OPTS +=3D --enable-mmdblookup<br>
=C2=A0else<br>
=C2=A0RSYSLOG_CONF_OPTS +=3D --disable-mmdblookup<br>
=C2=A0endif<br>
<br>
-ifeq ($(BR2_PACKAGE_LIBPCAP),y)<br>
+ifeq ($(BR2_PACKAGE_LIBPCAP)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy)<=
br>
=C2=A0RSYSLOG_DEPENDENCIES +=3D libpcap<br>
=C2=A0RSYSLOG_CONF_OPTS +=3D --enable-impcap<br>
=C2=A0else<br>
=C2=A0RSYSLOG_CONF_OPTS +=3D --disable-impcap<br>
=C2=A0endif<br>
<br>
-ifeq ($(BR2_PACKAGE_MARIADB),y)<br>
+ifeq ($(BR2_PACKAGE_MARIADB)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy)<=
br>
=C2=A0RSYSLOG_DEPENDENCIES +=3D mariadb<br>
=C2=A0RSYSLOG_CONF_OPTS +=3D --enable-mysql<br>
=C2=A0RSYSLOG_CONF_ENV +=3D ac_cv_prog_MYSQL_CONFIG=3D$(STAGING_DIR)/usr/bi=
n/mysql_config<br>
@@ -110,7 +113,7 @@ else<br>
=C2=A0RSYSLOG_CONF_OPTS +=3D --disable-mysql<br>
=C2=A0endif<br>
<br>
-ifeq ($(BR2_PACKAGE_POSTGRESQL),y)<br>
+ifeq ($(BR2_PACKAGE_POSTGRESQL)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),y=
y)<br>
=C2=A0RSYSLOG_DEPENDENCIES +=3D postgresql<br>
=C2=A0RSYSLOG_CONF_OPTS +=3D --enable-pgsql<br>
=C2=A0RSYSLOG_CONF_ENV +=3D ac_cv_prog_PG_CONFIG=3D$(STAGING_DIR)/usr/bin/p=
g_config<br>
@@ -118,28 +121,28 @@ else<br>
=C2=A0RSYSLOG_CONF_OPTS +=3D --disable-pgsql<br>
=C2=A0endif<br>
<br>
-ifeq ($(BR2_PACKAGE_QPID_PROTON),y)<br>
+ifeq ($(BR2_PACKAGE_QPID_PROTON)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),=
yy)<br>
=C2=A0RSYSLOG_DEPENDENCIES +=3D qpid-proton<br>
=C2=A0RSYSLOG_CONF_OPTS +=3D --enable-omamqp1<br>
=C2=A0else<br>
=C2=A0RSYSLOG_CONF_OPTS +=3D --disable-omamqp1<br>
=C2=A0endif<br>
<br>
-ifeq ($(BR2_PACKAGE_RABBITMQ_C),y)<br>
+ifeq ($(BR2_PACKAGE_RABBITMQ_C)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),y=
y)<br>
=C2=A0RSYSLOG_DEPENDENCIES +=3D rabbitmq-c<br>
=C2=A0RSYSLOG_CONF_OPTS +=3D --enable-omrabbitmq<br>
=C2=A0else<br>
=C2=A0RSYSLOG_CONF_OPTS +=3D --disable-omrabbitmq<br>
=C2=A0endif<br>
<br>
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)<br>
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PL=
UGINS),yy)<br>
=C2=A0RSYSLOG_DEPENDENCIES +=3D util-linux<br>
=C2=A0RSYSLOG_CONF_OPTS +=3D --enable-uuid<br>
=C2=A0else<br>
=C2=A0RSYSLOG_CONF_OPTS +=3D --disable-uuid<br>
=C2=A0endif<br>
<br>
-ifeq ($(BR2_INIT_SYSTEMD),y)<br>
+ifeq ($(BR2_INIT_SYSTEMD)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy)<br>
=C2=A0RSYSLOG_CONF_OPTS +=3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-imjournal \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-omjournal \<br>
@@ -151,7 +154,7 @@ RSYSLOG_CONF_OPTS +=3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-omjournal<br>
=C2=A0endif<br>
<br>
-ifeq ($(BR2_PACKAGE_LIBDBI_DRIVERS),y)<br>
+ifeq ($(BR2_PACKAGE_LIBDBI_DRIVERS)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGIN=
S),yy)<br>
=C2=A0RSYSLOG_CONF_OPTS +=3D --enable-libdbi<br>
=C2=A0RSYSLOG_DEPENDENCIES +=3D libdbi-drivers<br>
=C2=A0else<br>
-- <br>
2.44.0<br>
<br>
</blockquote></div>

--000000000000b7b00906154a2a69--

--===============3505254082311709004==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3505254082311709004==--
