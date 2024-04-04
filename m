Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3139CD1292
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 19:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42AAC6080F;
	Thu,  4 Apr 2024 19:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J4iDJwMZ9cPv; Thu,  4 Apr 2024 19:37:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B272261078
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B272261078;
	Thu,  4 Apr 2024 19:37:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D8871BF48B
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 19:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A1E041952
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 19:37:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zFSuru0phKiR for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 19:37:54 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C302440B33
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C302440B33
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C302440B33
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 19:37:53 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2a2d248a2e1so798315a91.0
 for <buildroot@buildroot.org>; Thu, 04 Apr 2024 12:37:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712259473; x=1712864273;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c7rkKI9Oo/ZHya5KN6WtrN3GN/oW5m5q9MzrpA4iwWg=;
 b=ei/N/m2gMXSd2f4ZYJwBFjDJOw2oTz+kNxWxHuIV10kIYXcJeiC+CFI1Lzj5k/w3Ok
 Mcd6w7/UvbK4mnMI4Mhyru9xHvHbWTs5lzRnSTzPl6QLGc2UfTmmk5VE7IOXuw0U1Qyb
 aBcSquIegqrYJsytYARGh63srRWV+sDDLSwblMYA1upaKu0VX7s10crAbSRyelUoeucP
 sAVYpa/OHnNsEI+IxnQgu1HL6J7pY73Hu/Rr2psJIfC3iYdHjRpOB3YWbj/xUPlTOvEU
 VlF2yaC4MhnvTzqaeV1FmcPxNFmlpzu50cSCSMKTraiusmNroIf7pxBjrNMcGqRzsSQz
 cThg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZVxQSRnsQu9DpEX1mtLI9QGm48KaEfO2LjdhRLa8whuqDlvJoNefsfrsEp3eKRIIPa8Hr3X7p6TJgtuy7Z1WjSvYO5hSqNw==
X-Gm-Message-State: AOJu0YzIHJcQt3TurMvNN3ZTmSKK/HGkDPOo2ETycXYEhMVD3cBxUOZg
 30hIGC7z2tGYQi6H3ZxiO6QPK85sKOvXLERQl2SWgl9+Ntk0J6q7DntSg4bBcthmznmdtBE8SRb
 vL50mJ/UxonN1Gj9ZkDHY6lj/8RYlnP5+NAYA+RwmOVKymmfvNnI=
X-Google-Smtp-Source: AGHT+IHaksckFsHAv4xSkC6nsmWrXeiheAf9eLNhdBQDevtefYwBx+hvVLtklCaBBlXfKHk5SedujwJXLVR+PgDSlFg=
X-Received: by 2002:a17:90a:7c43:b0:2a2:f249:6180 with SMTP id
 e3-20020a17090a7c4300b002a2f2496180mr623030pjl.18.1712259473092; Thu, 04 Apr
 2024 12:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240404191144.20339-1-KAMenyaev@salutedevices.com>
 <20240404191144.20339-2-KAMenyaev@salutedevices.com>
 <CAEHOWiOSzbsZJ9ri-rSL6_98028ycsSA6VbWtXPmqftEckU8vw@mail.gmail.com>
 <eee65f2a-6051-4ebe-9a40-55a4b81b208c@sberdevices.ru>
In-Reply-To: <eee65f2a-6051-4ebe-9a40-55a4b81b208c@sberdevices.ru>
From: =?UTF-8?B?RmzDoXZpbyBUYXBhasOzcyBQZXJlaXJh?=
 <flavio.tapajos@newtesc.com.br>
Date: Thu, 4 Apr 2024 16:37:41 -0300
Message-ID: <CAEHOWiNoPYk4zGjw4RSBYkfStCO=fd3DWFyt6N37Y4vUZDixug@mail.gmail.com>
To: Konstantin Menyaev <kamenyaev@sberdevices.ru>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1712259473; x=1712864273;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=c7rkKI9Oo/ZHya5KN6WtrN3GN/oW5m5q9MzrpA4iwWg=;
 b=v6J0oIMQtW9mzSDufmZYct8J+/2igmfJSEjZY4Ppv1pHm/i4q7lh+t1Axga8s6rux8
 3T3a0ehBa80U5FRBwOrxymQ4rlryQXjqquDbWlqezgrpTM/xI5g73PrVEataopNp72Hm
 C+8UxH19xazZwJNB6UYd19durILm4DJTDruXZ6kA0ajQx/QU6lc7hkjdvk6xgUc9AXNl
 G/iiGaMCuPRaq3YGGRlm1WgABHBcOvYzMVYzzh9DHCIwkeDaKtM1URwdhHNgb3LGd4Kj
 6XL2QjdwmfdEle7vW1ogG7mT8gAk8aK0Am2EDLUKjP11FDH0wpkgeopNxZeRPGdcaoqi
 CfOw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=v6J0oIMQ
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
Cc: KAMenyaev@salutedevices.com, sdfw_system_team@sberdevices.ru,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3732992760238326981=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3732992760238326981==
Content-Type: multipart/alternative; boundary="000000000000a851ca06154a7955"

--000000000000a851ca06154a7955
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

My mistake. I mean rsyslog 8.2402.0 -> 8.2404.0.

Em qui., 4 de abr. de 2024, 16:34, Konstantin Menyaev <
kamenyaev@sberdevices.ru> escreveu:

> what do u mean by 2024.04? buildroot branch? there is no one, only
> 2024.02.x.
>
> or u mean rsyslog package version? the latest is 8.2404.0
>
> On 04.04.2024 22:15, Fl=C3=A1vio Tapaj=C3=B3s Pereira wrote:
> > Could you also patch a bump to 2024.04 and test it altogether?
> >
> > Em qui., 4 de abr. de 2024, 16:11, <KAMenyaev@salutedevices.com>
> escreveu:
> >
> >     From: Konstantin Menyaev <KAMenyaev@salutedevices.com>
> >
> >     By default rsyslog builds with a bunch of plugins,
> >     most of them are not even used, despite the dependent package like
> >     lubcurl.
> >
> >     This option is useful in embedded systems to achieve compact
> >     footprint.
> >
> >     Signed-off-by: Konstantin Menyaev <KAMenyaev@salutedevices.com>
> >     ---
> >      package/rsyslog/Config.in  | 10 ++++++++++
> >      package/rsyslog/rsyslog.mk <http://rsyslog.mk> | 35
> >     +++++++++++++++++++----------------
> >      2 files changed, 29 insertions(+), 16 deletions(-)
> >
> >     diff --git a/package/rsyslog/Config.in b/package/rsyslog/Config.in
> >     index d9e8b1ab6f..044ea861bc 100644
> >     --- a/package/rsyslog/Config.in
> >     +++ b/package/rsyslog/Config.in
> >     @@ -17,6 +17,16 @@ config BR2_PACKAGE_RSYSLOG
> >
> >     http://www.rsyslog.com
> >
> >     +if BR2_PACKAGE_RSYSLOG
> >     +
> >     +config BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS
> >     +       bool "extra plugins"
> >     +       default y
> >     +       help
> >     +         Rsyslog extra plugins support
> >     +
> >     +endif # BR2_PACKAGE_RSYSLOG
> >     +
> >      comment "rsyslog needs a toolchain w/ threads, dynamic library"
> >             depends on BR2_USE_MMU
> >             depends on BR2_TOOLCHAIN_HAS_SYNC_4
> >     diff --git a/package/rsyslog/rsyslog.mk <http://rsyslog.mk>
> >     b/package/rsyslog/rsyslog.mk <http://rsyslog.mk>
> >     index fac78795c2..ae645011ba 100644
> >     --- a/package/rsyslog/rsyslog.mk <http://rsyslog.mk>
> >     +++ b/package/rsyslog/rsyslog.mk <http://rsyslog.mk>
> >     @@ -15,12 +15,15 @@ RSYSLOG_CPE_ID_VENDOR =3D rsyslog
> >      RSYSLOG_IGNORE_CVES +=3D CVE-2015-3243
> >      RSYSLOG_DEPENDENCIES =3D zlib libestr liblogging libfastjson
> >     host-pkgconf
> >      RSYSLOG_CONF_ENV =3D ac_cv_prog_cc_c99=3D'-std=3Dc99'
> >     +
> >     +ifeq ($(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),y)
> >      RSYSLOG_PLUGINS =3D imdiag imfile impstats imptcp \
> >             mmanon mmaudit mmfields mmjsonparse mmpstrucdata
> >     mmsequence mmutf8fix \
> >             mail omprog omruleset omstdout omuxsock \
> >             pmaixforwardedfrom pmciscoios pmcisconames pmlastmsg pmsnar=
e
> >     +endif
> >
> >     -ifeq ($(BR2_PACKAGE_LIBRELP),y)
> >     +ifeq
> >     ($(BR2_PACKAGE_LIBRELP)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy=
)
> >      RSYSLOG_DEPENDENCIES +=3D librelp
> >      RSYSLOG_PLUGINS +=3D relp
> >      endif
> >     @@ -33,7 +36,7 @@ RSYSLOG_CONF_OPTS +=3D \
> >             --disable-mmkubernetes \
> >             --disable-mmnormalize
> >
> >     -ifeq ($(BR2_PACKAGE_LIBCURL),y)
> >     +ifeq
> >     ($(BR2_PACKAGE_LIBCURL)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy=
)
> >      RSYSLOG_DEPENDENCIES +=3D libcurl
> >      RSYSLOG_CONF_OPTS +=3D \
> >             --enable-clickhouse \
> >     @@ -52,35 +55,35 @@ RSYSLOG_CONF_OPTS +=3D \
> >             --disable-omhttpfs
> >      endif
> >
> >     -ifeq ($(BR2_PACKAGE_CIVETWEB_LIB),y)
> >     +ifeq
> >
>  ($(BR2_PACKAGE_CIVETWEB_LIB)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy=
)
> >      RSYSLOG_DEPENDENCIES +=3D apr-util civetweb
> >      RSYSLOG_CONF_OPTS +=3D --enable-imhttp
> >      else
> >      RSYSLOG_CONF_OPTS +=3D --disable-imhttp
> >      endif
> >
> >     -ifeq ($(BR2_PACKAGE_CZMQ),y)
> >     +ifeq
> >     ($(BR2_PACKAGE_CZMQ)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy)
> >      RSYSLOG_DEPENDENCIES +=3D czmq
> >      RSYSLOG_CONF_OPTS +=3D --enable-imczmq --enable-omczmq
> >      else
> >      RSYSLOG_CONF_OPTS +=3D --disable-imczmq --disable-omczmq
> >      endif
> >
> >     -ifeq ($(BR2_PACKAGE_GNUTLS),y)
> >     +ifeq
> >     ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy)
> >      RSYSLOG_DEPENDENCIES +=3D gnutls
> >      RSYSLOG_CONF_OPTS +=3D --enable-gnutls
> >      else
> >      RSYSLOG_CONF_OPTS +=3D --disable-gnutls
> >      endif
> >
> >     -ifeq ($(BR2_PACKAGE_HIREDIS),y)
> >     +ifeq
> >     ($(BR2_PACKAGE_HIREDIS)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy=
)
> >      RSYSLOG_DEPENDENCIES +=3D hiredis
> >      RSYSLOG_CONF_OPTS +=3D --enable-omhiredis
> >      else
> >      RSYSLOG_CONF_OPTS +=3D --disable-omhiredis
> >      endif
> >
> >     -ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
> >     +ifeq
> >
>  ($(BR2_PACKAGE_LIBGCRYPT)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy)
> >      RSYSLOG_DEPENDENCIES +=3D libgcrypt
> >      RSYSLOG_CONF_ENV +=3D
> >     LIBGCRYPT_CONFIG=3D$(STAGING_DIR)/usr/bin/libgcrypt-config
> >      RSYSLOG_CONF_OPTS +=3D --enable-libgcrypt
> >     @@ -88,21 +91,21 @@ else
> >      RSYSLOG_CONF_OPTS +=3D --disable-libgcrypt
> >      endif
> >
> >     -ifeq ($(BR2_PACKAGE_LIBMAXMINDDB),y)
> >     +ifeq
> >
>  ($(BR2_PACKAGE_LIBMAXMINDDB)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy=
)
> >      RSYSLOG_DEPENDENCIES +=3D libmaxminddb
> >      RSYSLOG_CONF_OPTS +=3D --enable-mmdblookup
> >      else
> >      RSYSLOG_CONF_OPTS +=3D --disable-mmdblookup
> >      endif
> >
> >     -ifeq ($(BR2_PACKAGE_LIBPCAP),y)
> >     +ifeq
> >     ($(BR2_PACKAGE_LIBPCAP)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy=
)
> >      RSYSLOG_DEPENDENCIES +=3D libpcap
> >      RSYSLOG_CONF_OPTS +=3D --enable-impcap
> >      else
> >      RSYSLOG_CONF_OPTS +=3D --disable-impcap
> >      endif
> >
> >     -ifeq ($(BR2_PACKAGE_MARIADB),y)
> >     +ifeq
> >     ($(BR2_PACKAGE_MARIADB)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy=
)
> >      RSYSLOG_DEPENDENCIES +=3D mariadb
> >      RSYSLOG_CONF_OPTS +=3D --enable-mysql
> >      RSYSLOG_CONF_ENV +=3D
> >     ac_cv_prog_MYSQL_CONFIG=3D$(STAGING_DIR)/usr/bin/mysql_config
> >     @@ -110,7 +113,7 @@ else
> >      RSYSLOG_CONF_OPTS +=3D --disable-mysql
> >      endif
> >
> >     -ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
> >     +ifeq
> >
>  ($(BR2_PACKAGE_POSTGRESQL)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy)
> >      RSYSLOG_DEPENDENCIES +=3D postgresql
> >      RSYSLOG_CONF_OPTS +=3D --enable-pgsql
> >      RSYSLOG_CONF_ENV +=3D
> >     ac_cv_prog_PG_CONFIG=3D$(STAGING_DIR)/usr/bin/pg_config
> >     @@ -118,28 +121,28 @@ else
> >      RSYSLOG_CONF_OPTS +=3D --disable-pgsql
> >      endif
> >
> >     -ifeq ($(BR2_PACKAGE_QPID_PROTON),y)
> >     +ifeq
> >
>  ($(BR2_PACKAGE_QPID_PROTON)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy)
> >      RSYSLOG_DEPENDENCIES +=3D qpid-proton
> >      RSYSLOG_CONF_OPTS +=3D --enable-omamqp1
> >      else
> >      RSYSLOG_CONF_OPTS +=3D --disable-omamqp1
> >      endif
> >
> >     -ifeq ($(BR2_PACKAGE_RABBITMQ_C),y)
> >     +ifeq
> >
>  ($(BR2_PACKAGE_RABBITMQ_C)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy)
> >      RSYSLOG_DEPENDENCIES +=3D rabbitmq-c
> >      RSYSLOG_CONF_OPTS +=3D --enable-omrabbitmq
> >      else
> >      RSYSLOG_CONF_OPTS +=3D --disable-omrabbitmq
> >      endif
> >
> >     -ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
> >     +ifeq
> >
>  ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGI=
NS),yy)
> >      RSYSLOG_DEPENDENCIES +=3D util-linux
> >      RSYSLOG_CONF_OPTS +=3D --enable-uuid
> >      else
> >      RSYSLOG_CONF_OPTS +=3D --disable-uuid
> >      endif
> >
> >     -ifeq ($(BR2_INIT_SYSTEMD),y)
> >     +ifeq
> >     ($(BR2_INIT_SYSTEMD)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),yy)
> >      RSYSLOG_CONF_OPTS +=3D \
> >             --enable-imjournal \
> >             --enable-omjournal \
> >     @@ -151,7 +154,7 @@ RSYSLOG_CONF_OPTS +=3D \
> >             --disable-omjournal
> >      endif
> >
> >     -ifeq ($(BR2_PACKAGE_LIBDBI_DRIVERS),y)
> >     +ifeq
> >
>  ($(BR2_PACKAGE_LIBDBI_DRIVERS)$(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),=
yy)
> >      RSYSLOG_CONF_OPTS +=3D --enable-libdbi
> >      RSYSLOG_DEPENDENCIES +=3D libdbi-drivers
> >      else
> >     --
> >     2.44.0
> >
>

--000000000000a851ca06154a7955
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>My mistake. I mean rsyslog 8.2402.0 -&gt; 8.2404.0.<=
/div><div dir=3D"auto"><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=
=3D"ltr" class=3D"gmail_attr">Em qui., 4 de abr. de 2024, 16:34, Konstantin=
 Menyaev &lt;<a href=3D"mailto:kamenyaev@sberdevices.ru">kamenyaev@sberdevi=
ces.ru</a>&gt; escreveu:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">what do =
u mean by 2024.04? buildroot branch? there is no one, only <br>
2024.02.x.<br>
<br>
or u mean rsyslog package version? the latest is 8.2404.0<br>
<br>
On 04.04.2024 22:15, Fl=C3=A1vio Tapaj=C3=B3s Pereira wrote:<br>
&gt; Could you also patch a bump to 2024.04 and test it altogether?<br>
&gt;<br>
&gt; Em qui., 4 de abr. de 2024, 16:11, &lt;<a href=3D"mailto:KAMenyaev@sal=
utedevices.com" target=3D"_blank" rel=3D"noreferrer">KAMenyaev@salutedevice=
s.com</a>&gt; escreveu:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0From: Konstantin Menyaev &lt;<a href=3D"mailto:KAMe=
nyaev@salutedevices.com" target=3D"_blank" rel=3D"noreferrer">KAMenyaev@sal=
utedevices.com</a>&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0By default rsyslog builds with a bunch of plugins,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0most of them are not even used, despite the depende=
nt package like<br>
&gt;=C2=A0 =C2=A0 =C2=A0lubcurl.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0This option is useful in embedded systems to achiev=
e compact<br>
&gt;=C2=A0 =C2=A0 =C2=A0footprint.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Konstantin Menyaev &lt;<a href=3D"ma=
ilto:KAMenyaev@salutedevices.com" target=3D"_blank" rel=3D"noreferrer">KAMe=
nyaev@salutedevices.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0package/rsyslog/Config.in=C2=A0 | 10 ++++++++=
++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0package/rsyslog/<a href=3D"http://rsyslog.mk"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">rsyslog.mk</a> &lt;<a href=
=3D"http://rsyslog.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">http=
://rsyslog.mk</a>&gt; | 35<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++++++++++++++++++----------------<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A02 files changed, 29 insertions(+), 16 deletio=
ns(-)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/package/rsyslog/Config.in b/package/rs=
yslog/Config.in<br>
&gt;=C2=A0 =C2=A0 =C2=A0index d9e8b1ab6f..044ea861bc 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/package/rsyslog/Config.in<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/package/rsyslog/Config.in<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -17,6 +17,16 @@ config BR2_PACKAGE_RSYSLOG<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://www.rsyslog.com" rel=3D"noreferre=
r noreferrer" target=3D"_blank">http://www.rsyslog.com</a><br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+if BR2_PACKAGE_RSYSLOG<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+config BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;extra plugin=
s&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0default y<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Rsyslog extra pl=
ugins support<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+endif # BR2_PACKAGE_RSYSLOG<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0comment &quot;rsyslog needs a toolchain w/ th=
reads, dynamic library&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_USE_MMU<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_TOOLCHAI=
N_HAS_SYNC_4<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/package/rsyslog/<a href=3D"http://rsys=
log.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">rsyslog.mk</a> &lt;=
<a href=3D"http://rsyslog.mk" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">http://rsyslog.mk</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/package/rsyslog/<a href=3D"http://rsyslog.mk" rel=
=3D"noreferrer noreferrer" target=3D"_blank">rsyslog.mk</a> &lt;<a href=3D"=
http://rsyslog.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">http://r=
syslog.mk</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0index fac78795c2..ae645011ba 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/package/rsyslog/<a href=3D"http://rsyslog.mk"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">rsyslog.mk</a> &lt;<a href=
=3D"http://rsyslog.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">http=
://rsyslog.mk</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/package/rsyslog/<a href=3D"http://rsyslog.mk"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">rsyslog.mk</a> &lt;<a href=
=3D"http://rsyslog.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">http=
://rsyslog.mk</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -15,12 +15,15 @@ RSYSLOG_CPE_ID_VENDOR =3D rsysl=
og<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_IGNORE_CVES +=3D CVE-2015-3243<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_DEPENDENCIES =3D zlib libestr liblogg=
ing libfastjson<br>
&gt;=C2=A0 =C2=A0 =C2=A0host-pkgconf<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_CONF_ENV =3D ac_cv_prog_cc_c99=3D&#39=
;-std=3Dc99&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ifeq ($(BR2_PACKAGE_RSYSLOG_WITH_EXTRA_PLUGINS),y)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_PLUGINS =3D imdiag imfile impstats im=
ptcp \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 mmanon mmaudit mmfields=
 mmjsonparse mmpstrucdata<br>
&gt;=C2=A0 =C2=A0 =C2=A0mmsequence mmutf8fix \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 mail omprog omruleset o=
mstdout omuxsock \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 pmaixforwardedfrom pmci=
scoios pmcisconames pmlastmsg pmsnare<br>
&gt;=C2=A0 =C2=A0 =C2=A0+endif<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-ifeq ($(BR2_PACKAGE_LIBRELP),y)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ifeq<br>
&gt;=C2=A0 =C2=A0 =C2=A0($(BR2_PACKAGE_LIBRELP)$(BR2_PACKAGE_RSYSLOG_WITH_E=
XTRA_PLUGINS),yy)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_DEPENDENCIES +=3D librelp<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_PLUGINS +=3D relp<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -33,7 +36,7 @@ RSYSLOG_CONF_OPTS +=3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-mmkubernetes =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-mmnormalize<b=
r>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-ifeq ($(BR2_PACKAGE_LIBCURL),y)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ifeq<br>
&gt;=C2=A0 =C2=A0 =C2=A0($(BR2_PACKAGE_LIBCURL)$(BR2_PACKAGE_RSYSLOG_WITH_E=
XTRA_PLUGINS),yy)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_DEPENDENCIES +=3D libcurl<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_CONF_OPTS +=3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-clickhouse \<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -52,35 +55,35 @@ RSYSLOG_CONF_OPTS +=3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-omhttpfs<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0endif<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-ifeq ($(BR2_PACKAGE_CIVETWEB_LIB),y)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ifeq<br>
&gt;=C2=A0 =C2=A0 =C2=A0($(BR2_PACKAGE_CIVETWEB_LIB)$(BR2_PACKAGE_RSYSLOG_W=
ITH_EXTRA_PLUGINS),yy)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_DEPENDENCIES +=3D apr-util civetweb<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_CONF_OPTS +=3D --enable-imhttp<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_CONF_OPTS +=3D --disable-imhttp<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0endif<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-ifeq ($(BR2_PACKAGE_CZMQ),y)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ifeq<br>
&gt;=C2=A0 =C2=A0 =C2=A0($(BR2_PACKAGE_CZMQ)$(BR2_PACKAGE_RSYSLOG_WITH_EXTR=
A_PLUGINS),yy)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_DEPENDENCIES +=3D czmq<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_CONF_OPTS +=3D --enable-imczmq --enab=
le-omczmq<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_CONF_OPTS +=3D --disable-imczmq --dis=
able-omczmq<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0endif<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-ifeq ($(BR2_PACKAGE_GNUTLS),y)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ifeq<br>
&gt;=C2=A0 =C2=A0 =C2=A0($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_RSYSLOG_WITH_EX=
TRA_PLUGINS),yy)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_DEPENDENCIES +=3D gnutls<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_CONF_OPTS +=3D --enable-gnutls<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_CONF_OPTS +=3D --disable-gnutls<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0endif<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-ifeq ($(BR2_PACKAGE_HIREDIS),y)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ifeq<br>
&gt;=C2=A0 =C2=A0 =C2=A0($(BR2_PACKAGE_HIREDIS)$(BR2_PACKAGE_RSYSLOG_WITH_E=
XTRA_PLUGINS),yy)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_DEPENDENCIES +=3D hiredis<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_CONF_OPTS +=3D --enable-omhiredis<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_CONF_OPTS +=3D --disable-omhiredis<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0endif<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ifeq<br>
&gt;=C2=A0 =C2=A0 =C2=A0($(BR2_PACKAGE_LIBGCRYPT)$(BR2_PACKAGE_RSYSLOG_WITH=
_EXTRA_PLUGINS),yy)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_DEPENDENCIES +=3D libgcrypt<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_CONF_ENV +=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0LIBGCRYPT_CONFIG=3D$(STAGING_DIR)/usr/bin/libgcrypt=
-config<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_CONF_OPTS +=3D --enable-libgcrypt<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -88,21 +91,21 @@ else<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_CONF_OPTS +=3D --disable-libgcrypt<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0endif<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-ifeq ($(BR2_PACKAGE_LIBMAXMINDDB),y)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ifeq<br>
&gt;=C2=A0 =C2=A0 =C2=A0($(BR2_PACKAGE_LIBMAXMINDDB)$(BR2_PACKAGE_RSYSLOG_W=
ITH_EXTRA_PLUGINS),yy)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_DEPENDENCIES +=3D libmaxminddb<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_CONF_OPTS +=3D --enable-mmdblookup<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_CONF_OPTS +=3D --disable-mmdblookup<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0endif<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-ifeq ($(BR2_PACKAGE_LIBPCAP),y)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ifeq<br>
&gt;=C2=A0 =C2=A0 =C2=A0($(BR2_PACKAGE_LIBPCAP)$(BR2_PACKAGE_RSYSLOG_WITH_E=
XTRA_PLUGINS),yy)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_DEPENDENCIES +=3D libpcap<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_CONF_OPTS +=3D --enable-impcap<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_CONF_OPTS +=3D --disable-impcap<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0endif<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-ifeq ($(BR2_PACKAGE_MARIADB),y)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ifeq<br>
&gt;=C2=A0 =C2=A0 =C2=A0($(BR2_PACKAGE_MARIADB)$(BR2_PACKAGE_RSYSLOG_WITH_E=
XTRA_PLUGINS),yy)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_DEPENDENCIES +=3D mariadb<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_CONF_OPTS +=3D --enable-mysql<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_CONF_ENV +=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0ac_cv_prog_MYSQL_CONFIG=3D$(STAGING_DIR)/usr/bin/my=
sql_config<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -110,7 +113,7 @@ else<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_CONF_OPTS +=3D --disable-mysql<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0endif<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-ifeq ($(BR2_PACKAGE_POSTGRESQL),y)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ifeq<br>
&gt;=C2=A0 =C2=A0 =C2=A0($(BR2_PACKAGE_POSTGRESQL)$(BR2_PACKAGE_RSYSLOG_WIT=
H_EXTRA_PLUGINS),yy)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_DEPENDENCIES +=3D postgresql<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_CONF_OPTS +=3D --enable-pgsql<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_CONF_ENV +=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0ac_cv_prog_PG_CONFIG=3D$(STAGING_DIR)/usr/bin/pg_co=
nfig<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -118,28 +121,28 @@ else<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_CONF_OPTS +=3D --disable-pgsql<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0endif<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-ifeq ($(BR2_PACKAGE_QPID_PROTON),y)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ifeq<br>
&gt;=C2=A0 =C2=A0 =C2=A0($(BR2_PACKAGE_QPID_PROTON)$(BR2_PACKAGE_RSYSLOG_WI=
TH_EXTRA_PLUGINS),yy)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_DEPENDENCIES +=3D qpid-proton<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_CONF_OPTS +=3D --enable-omamqp1<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_CONF_OPTS +=3D --disable-omamqp1<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0endif<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-ifeq ($(BR2_PACKAGE_RABBITMQ_C),y)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ifeq<br>
&gt;=C2=A0 =C2=A0 =C2=A0($(BR2_PACKAGE_RABBITMQ_C)$(BR2_PACKAGE_RSYSLOG_WIT=
H_EXTRA_PLUGINS),yy)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_DEPENDENCIES +=3D rabbitmq-c<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_CONF_OPTS +=3D --enable-omrabbitmq<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_CONF_OPTS +=3D --disable-omrabbitmq<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0endif<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ifeq<br>
&gt;=C2=A0 =C2=A0 =C2=A0($(BR2_PACKAGE_UTIL_LINUX_LIBUUID)$(BR2_PACKAGE_RSY=
SLOG_WITH_EXTRA_PLUGINS),yy)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_DEPENDENCIES +=3D util-linux<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_CONF_OPTS +=3D --enable-uuid<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_CONF_OPTS +=3D --disable-uuid<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0endif<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-ifeq ($(BR2_INIT_SYSTEMD),y)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ifeq<br>
&gt;=C2=A0 =C2=A0 =C2=A0($(BR2_INIT_SYSTEMD)$(BR2_PACKAGE_RSYSLOG_WITH_EXTR=
A_PLUGINS),yy)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_CONF_OPTS +=3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-imjournal \<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-omjournal \<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -151,7 +154,7 @@ RSYSLOG_CONF_OPTS +=3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-omjournal<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0endif<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-ifeq ($(BR2_PACKAGE_LIBDBI_DRIVERS),y)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ifeq<br>
&gt;=C2=A0 =C2=A0 =C2=A0($(BR2_PACKAGE_LIBDBI_DRIVERS)$(BR2_PACKAGE_RSYSLOG=
_WITH_EXTRA_PLUGINS),yy)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_CONF_OPTS +=3D --enable-libdbi<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0RSYSLOG_DEPENDENCIES +=3D libdbi-drivers<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.44.0<br>
&gt;<br>
</blockquote></div></div></div>

--000000000000a851ca06154a7955--

--===============3732992760238326981==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3732992760238326981==--
