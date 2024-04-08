Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF5DC67861
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 17:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8AF281447;
	Mon,  8 Apr 2024 17:30:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7zI4M5-VOIk5; Mon,  8 Apr 2024 17:30:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB9C781A6F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB9C781A6F;
	Mon,  8 Apr 2024 17:30:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 849EA1BF2BD
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 17:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7457481A6F
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 17:30:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GFtN-Kdkyo6T for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 17:30:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A22F58174D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A22F58174D
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A22F58174D
 for <buildroot@busybox.net>; Mon,  8 Apr 2024 17:30:41 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-5e8470c1cb7so3325529a12.2
 for <buildroot@busybox.net>; Mon, 08 Apr 2024 10:30:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712597441; x=1713202241;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I9uNjPue6QGEEkThX6Ia2eRzCMt7SQMrkM6jtcqWUyU=;
 b=NYd5S2avkuLs/p8i6HBuXt2cq/WSfGpEVpKfLC8++6+mSnEotejSEZgNXXurG96bQ3
 YkBQaaLQTMfOWXOqsDmYAU1xxSa7HvIr1zUAPrYcnWdBMwqrmsT+GvyQJLkJcyn276MK
 2DYS6adBTJaut7NN8yhn7M2Bl7mxN/uDJ1PLl3VI/uO7hjDDH5bb5ua5npoJRsIKeTaG
 WggX4W3MUlY4ICP0TGRPIqpyRfspIUr+ao/OEvzjhpQ/zFtC8385bpKRrT053+gZz5kP
 jEVF0v7GdwIzXJHfAvEjRh124Agnw4ua9Kcx5AcvpHftQVLDTpy8LNuV1SauUQiPf67P
 mmyg==
X-Gm-Message-State: AOJu0YyGIDI0OxlRQlE8vja2j+5sQ5gq7laVZmW07wvUvz2zxduwwcfn
 kaE7PVyZ6Xm6RitDNmLfIAxFhiS88G3EpRmFqMEyhZ1vEX+EJmUPMql6c52eESsYhUGa273KJbK
 QuM0DPBMAdmGZVcEtUSy+ggBLtaEJN9u+zpTGWxpZmO8VbiSz4g==
X-Google-Smtp-Source: AGHT+IGcazRc6MrMuoLmn7HIs/QkMTX02YvlngJyL8fXmeW8Tx6egN+45eVJlbtbHbwfey/yX/aHlwG9HPUvLBEG4gg=
X-Received: by 2002:a17:90b:20e:b0:2a2:2b83:149a with SMTP id
 fy14-20020a17090b020e00b002a22b83149amr7227921pjb.2.1712597440265; Mon, 08
 Apr 2024 10:30:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240407144250.7558-1-francois.perrad@gadz.org>
 <6413ce1c-a13b-4a04-81e5-0ba48a19e39a@mind.be>
In-Reply-To: <6413ce1c-a13b-4a04-81e5-0ba48a19e39a@mind.be>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 8 Apr 2024 19:30:29 +0200
Message-ID: <CAAE6iEV66e2XwzQDmXVopkKHLdwm0kRPVmPCRzf8hQ-rBnwEaA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1712597441; x=1713202241; darn=busybox.net;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=I9uNjPue6QGEEkThX6Ia2eRzCMt7SQMrkM6jtcqWUyU=;
 b=WpsYNYPgfyOJ29G9p/iv01kItD4+dmkbSaX0zApaVhEQ4+pQfbKiMYYVNR8viKqvdf
 onyW7ZSVtiEZEuZnsaeR79so9laUqGzRn/cyPfe2w5cvdR7qn6+9A1G882Q7awVoTij5
 DWQZ2xu9W+X/bqop20cE3ZcWDgsc8ZUH42gVLkSjYD6DN/bWQ3/HAGUfmbfTypwU7ncA
 zdU6f8EB+tua2rROFNImzWWRcYEBLz4aig3o3LCOwyqA/HU2QzU03fdbZIxeJla4fmnN
 XRfgPpvHxIlBf+x985Q0DcYqLj0sOOoZ13fmokFSt+DJdBEU4wAknSBOriSkxqv8Y9Xp
 LF2Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=WpsYNYPg
Subject: Re: [Buildroot] [RFC PATCH 0/2] PURL pkg:cpan
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@busybox.net,
 Romain Naour <romain.naour@gmail.com>, Thomas Perale <thomas.perale@mind.be>
Content-Type: multipart/mixed; boundary="===============8835863681347692025=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8835863681347692025==
Content-Type: multipart/alternative; boundary="000000000000130b6a0615992a9e"

--000000000000130b6a0615992a9e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dim. 7 avr. 2024 =C3=A0 19:09, Arnout Vandecappelle <arnout@mind.be> a =
=C3=A9crit :

>   Hi Francois, all,
>
> On 07/04/2024 16:42, Francois Perrad wrote:
> > This serie goes on the top of serie "Support SBOM in CycloneDX format"
> >
> > It handles PURL for the CPAN (Perl package manager)
> >
> > Francois Perrad (2):
> >    utils/scancpan: generate PURL package variable
> >    package/perl-*: regenerate with PURL
>
>   You chose here to explicitly include the PURL variable in all packages.
> An
> alternative would be to automatically calculate a (default) value for it
> in the
> perl infra.
>
>
You are right,

something like below (in package/pkg-perl.mk), does the same job:
$(3)_PURL =3D pkg:cpan/$(notdir $($(3)_SITE))/$($(3)_DISTNAME)@$($(3)_VERSI=
ON)

Fran=C3=A7ois


>   Since (almost) all perl packages are generated with scancpan, I do thin=
k
> it
> makes sense to do it explicitly: it is much easier for a developer to see
> what
> is really happening (they don't need to know about how the perl infra
> works), it
> is still easy on maintenance because it's generated automatically anyway,
> and it
> means we don't need to make the perl infra more complicated.
>
>   On the other hand, by putting it in the perl infra, it becomes very
> explicit
> when the automatic purl was overridden.
>
>   IMHO, the tradeoff points to what you did: putting the PURL explicit in
> the
> .mk file. But other people's opinion may differ, so I wanted to throw thi=
s
> out
> there.
>
>   Regards,
>   Arnout
>
>
> >
> >   .../perl-apache-logformat-compiler.mk                           | 1 +
> >   package/perl-appconfig/perl-appconfig.mk                        | 1 +
> >   package/perl-astro-suntime/perl-astro-suntime.mk                | 1 +
> >   package/perl-class-inspector/perl-class-inspector.mk            | 1 +
> >   package/perl-class-load/perl-class-load.mk                      | 1 +
> >   .../perl-class-method-modifiers/perl-class-method-modifiers.mk  | 1 +
> >   package/perl-class-std-fast/perl-class-std-fast.mk              | 1 +
> >   package/perl-class-std/perl-class-std.mk                        | 1 +
> >   package/perl-clone/perl-clone.mk                                | 1 +
> >   package/perl-convert-asn1/perl-convert-asn1.mk                  | 1 +
> >   package/perl-cookie-baker/perl-cookie-baker.mk                  | 1 +
> >   package/perl-crypt-blowfish/perl-crypt-blowfish.mk              | 1 +
> >   package/perl-crypt-cbc/perl-crypt-cbc.mk                        | 1 +
> >   package/perl-crypt-openssl-aes/perl-crypt-openssl-aes.mk        | 1 +
> >   package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk    | 1 +
> >   package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk  | 1 +
> >   package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk        | 1 +
> >   package/perl-data-dump/perl-data-dump.mk                        | 1 +
> >   package/perl-data-optlist/perl-data-optlist.mk                  | 1 +
> >   package/perl-data-uuid/perl-data-uuid.mk                        | 1 +
> >   package/perl-date-manip/perl-date-manip.mk                      | 1 +
> >   package/perl-datetime-tiny/perl-datetime-tiny.mk                | 1 +
> >   package/perl-dbd-mysql/perl-dbd-mysql.mk                        | 1 +
> >   package/perl-dbi/perl-dbi.mk                                    | 1 +
> >   package/perl-devel-cycle/perl-devel-cycle.mk                    | 1 +
> >   .../perl-devel-globaldestruction.mk                             | 1 +
> >   package/perl-devel-size/perl-devel-size.mk                      | 1 +
> >   .../perl-devel-stacktrace-ashtml.mk                             | 1 +
> >   package/perl-devel-stacktrace/perl-devel-stacktrace.mk          | 1 +
> >   package/perl-device-serialport/perl-device-serialport.mk        | 1 +
> >   package/perl-digest-hmac/perl-digest-hmac.mk                    | 1 +
> >   package/perl-digest-sha1/perl-digest-sha1.mk                    | 1 +
> >   package/perl-dist-checkconflicts/perl-dist-checkconflicts.mk    | 1 +
> >   package/perl-encode-detect/perl-encode-detect.mk                | 1 +
> >   package/perl-encode-locale/perl-encode-locale.mk                | 1 +
> >   package/perl-exporter-tiny/perl-exporter-tiny.mk                | 1 +
> >   package/perl-extutils-config/perl-extutils-config.mk            | 1 +
> >   package/perl-extutils-helpers/perl-extutils-helpers.mk          | 1 +
> >   .../perl-extutils-installpaths/perl-extutils-installpaths.mk    | 1 +
> >   package/perl-extutils-pkgconfig/perl-extutils-pkgconfig.mk      | 1 +
> >   package/perl-file-listing/perl-file-listing.mk                  | 1 +
> >   .../perl-file-sharedir-install/perl-file-sharedir-install.mk    | 1 +
> >   package/perl-file-sharedir/perl-file-sharedir.mk                | 1 +
> >   package/perl-file-slurp/perl-file-slurp.mk                      | 1 +
> >   package/perl-file-util/perl-file-util.mk                        | 1 +
> >   .../perl-filesys-notify-simple/perl-filesys-notify-simple.mk    | 1 +
> >   package/perl-gd/perl-gd.mk                                      | 1 +
> >   package/perl-gdgraph/perl-gdgraph.mk                            | 1 +
> >   package/perl-gdtextutil/perl-gdtextutil.mk                      | 1 +
> >   package/perl-hash-multivalue/perl-hash-multivalue.mk            | 1 +
> >   package/perl-html-parser/perl-html-parser.mk                    | 1 +
> >   package/perl-html-tagset/perl-html-tagset.mk                    | 1 +
> >   package/perl-http-cookies/perl-http-cookies.mk                  | 1 +
> >   package/perl-http-daemon/perl-http-daemon.mk                    | 1 +
> >   package/perl-http-date/perl-http-date.mk                        | 1 +
> >   package/perl-http-entity-parser/perl-http-entity-parser.mk      | 1 +
> >   package/perl-http-headers-fast/perl-http-headers-fast.mk        | 1 +
> >   package/perl-http-message/perl-http-message.mk                  | 1 +
> >   package/perl-http-multipartparser/perl-http-multipartparser.mk  | 1 +
> >   package/perl-http-negotiate/perl-http-negotiate.mk              | 1 +
> >   package/perl-i18n/perl-i18n.mk                                  | 1 +
> >   package/perl-image-exiftool/perl-image-exiftool.mk              | 1 +
> >   package/perl-io-html/perl-io-html.mk                            | 1 +
> >   package/perl-io-interface/perl-io-interface.mk                  | 1 +
> >   package/perl-io-socket-multicast/perl-io-socket-multicast.mk    | 1 +
> >   package/perl-io-socket-ssl/perl-io-socket-ssl.mk                | 1 +
> >   package/perl-json-maybexs/perl-json-maybexs.mk                  | 1 +
> >   package/perl-json-tiny/perl-json-tiny.mk                        | 1 +
> >   package/perl-libwww-perl/perl-libwww-perl.mk                    | 1 +
> >   .../perl-locale-maketext-lexicon.mk                             | 1 +
> >   package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk              | 1 +
> >   package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk      | 1 +
> >   package/perl-mail-dkim/perl-mail-dkim.mk                        | 1 +
> >   package/perl-mailtools/perl-mailtools.mk                        | 1 +
> >   package/perl-math-int64/perl-math-int64.mk                      | 1 +
> >   package/perl-math-prime-util/perl-math-prime-util.mk            | 1 +
> >   package/perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.mk    | 1 +
> >   package/perl-mime-tools/perl-mime-tools.mk                      | 1 +
> >   package/perl-module-build-tiny/perl-module-build-tiny.mk        | 1 +
> >   package/perl-module-build/perl-module-build.mk                  | 1 +
> >   .../perl-module-implementation/perl-module-implementation.mk    | 1 +
> >   package/perl-module-runtime/perl-module-runtime.mk              | 1 +
> >   .../perl-mojolicious-plugin-authentication.mk                   | 1 +
> >   .../perl-mojolicious-plugin-authorization.mk                    | 1 +
> >   .../perl-mojolicious-plugin-cspheader.mk                        | 1 +
> >   .../perl-mojolicious-plugin-i18n.mk                             | 1 +
> >   .../perl-mojolicious-plugin-securityheader.mk                   | 1 +
> >   package/perl-mojolicious/perl-mojolicious.mk                    | 1 +
> >   package/perl-moo/perl-moo.mk                                    | 1 +
> >   package/perl-mozilla-ca/perl-mozilla-ca.mk                      | 1 +
> >   package/perl-net-dns/perl-net-dns.mk                            | 1 +
> >   package/perl-net-http/perl-net-http.mk                          | 1 +
> >   package/perl-net-snmp/perl-net-snmp.mk                          | 1 +
> >   package/perl-net-ssh2/perl-net-ssh2.mk                          | 1 +
> >   package/perl-net-ssleay/perl-net-ssleay.mk                      | 1 +
> >   package/perl-net-telnet/perl-net-telnet.mk                      | 1 +
> >   package/perl-netaddr-ip/perl-netaddr-ip.mk                      | 1 +
> >   package/perl-number-bytes-human/perl-number-bytes-human.mk      | 1 +
> >   package/perl-package-stash/perl-package-stash.mk                | 1 +
> >   package/perl-params-util/perl-params-util.mk                    | 1 +
> >   package/perl-parse-yapp/perl-parse-yapp.mk                      | 1 +
> >   package/perl-path-tiny/perl-path-tiny.mk                        | 1 +
> >   package/perl-plack/perl-plack.mk                                | 1 +
> >   .../perl-posix-strftime-compiler.mk                             | 1 +
> >   package/perl-role-tiny/perl-role-tiny.mk                        | 1 +
> >   package/perl-stream-buffered/perl-stream-buffered.mk            | 1 +
> >   .../perl-sub-exporter-progressive.mk                            | 1 +
> >   package/perl-sub-install/perl-sub-install.mk                    | 1 +
> >   package/perl-sub-quote/perl-sub-quote.mk                        | 1 +
> >   package/perl-sys-meminfo/perl-sys-meminfo.mk                    | 1 +
> >   package/perl-sys-mmap/perl-sys-mmap.mk                          | 1 +
> >   package/perl-time-parsedate/perl-time-parsedate.mk              | 1 +
> >   package/perl-timedate/perl-timedate.mk                          | 1 +
> >   package/perl-try-tiny/perl-try-tiny.mk                          | 1 +
> >   package/perl-type-tiny/perl-type-tiny.mk                        | 1 +
> >   package/perl-uri/perl-uri.mk                                    | 1 +
> >   package/perl-www-form-urlencoded/perl-www-form-urlencoded.mk    | 1 +
> >   package/perl-www-robotrules/perl-www-robotrules.mk              | 1 +
> >   package/perl-x10/perl-x10.mk                                    | 1 +
> >   package/perl-xml-libxml/perl-xml-libxml.mk                      | 1 +
> >   package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk  | 1 +
> >   package/perl-xml-sax-base/perl-xml-sax-base.mk                  | 1 +
> >   package/perl-xml-sax/perl-xml-sax.mk                            | 1 +
> >   utils/scancpan                                                  | 2 +=
+
> >   124 files changed, 125 insertions(+)
> >
>

--000000000000130b6a0615992a9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0dim. 7 avr. 2024 =C3=A0=C2=A0=
19:09, Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be">arnout@mi=
nd.be</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">=C2=A0 Hi Francois, all,<br>
<br>
On 07/04/2024 16:42, Francois Perrad wrote:<br>
&gt; This serie goes on the top of serie &quot;Support SBOM in CycloneDX fo=
rmat&quot;<br>
&gt; <br>
&gt; It handles PURL for the CPAN (Perl package manager)<br>
&gt; <br>
&gt; Francois Perrad (2):<br>
&gt;=C2=A0 =C2=A0 utils/scancpan: generate PURL package variable<br>
&gt;=C2=A0 =C2=A0 package/perl-*: regenerate with PURL<br>
<br>
=C2=A0 You chose here to explicitly include the PURL variable in all packag=
es. An <br>
alternative would be to automatically calculate a (default) value for it in=
 the <br>
perl infra.<br>
<br></blockquote><div><br></div><div>You are right,=C2=A0</div><div><br></d=
iv><div>something like below (in package/<a href=3D"http://pkg-perl.mk">pkg=
-perl.mk</a>), does the same job:<br></div><div>$(3)_PURL =3D pkg:cpan/$(no=
tdir $($(3)_SITE))/$($(3)_DISTNAME)@$($(3)_VERSION)</div><div><br></div><di=
v>Fran=C3=A7ois<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
=C2=A0 Since (almost) all perl packages are generated with scancpan, I do t=
hink it <br>
makes sense to do it explicitly: it is much easier for a developer to see w=
hat <br>
is really happening (they don&#39;t need to know about how the perl infra w=
orks), it <br>
is still easy on maintenance because it&#39;s generated automatically anywa=
y, and it <br>
means we don&#39;t need to make the perl infra more complicated.<br>
<br>
=C2=A0 On the other hand, by putting it in the perl infra, it becomes very =
explicit <br>
when the automatic purl was overridden.<br>
<br>
=C2=A0 IMHO, the tradeoff points to what you did: putting the PURL explicit=
 in the <br>
.mk file. But other people&#39;s opinion may differ, so I wanted to throw t=
his out <br>
there.<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0.../<a href=3D"http://perl-apache-logformat-compiler.mk" r=
el=3D"noreferrer" target=3D"_blank">perl-apache-logformat-compiler.mk</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-appconfig/<a href=3D"http://perl-appconfig.mk=
" rel=3D"noreferrer" target=3D"_blank">perl-appconfig.mk</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +=
<br>
&gt;=C2=A0 =C2=A0package/perl-astro-suntime/<a href=3D"http://perl-astro-su=
ntime.mk" rel=3D"noreferrer" target=3D"_blank">perl-astro-suntime.mk</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-class-inspector/<a href=3D"http://perl-class-=
inspector.mk" rel=3D"noreferrer" target=3D"_blank">perl-class-inspector.mk<=
/a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-class-load/<a href=3D"http://perl-class-load.=
mk" rel=3D"noreferrer" target=3D"_blank">perl-class-load.mk</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br=
>
&gt;=C2=A0 =C2=A0.../perl-class-method-modifiers/<a href=3D"http://perl-cla=
ss-method-modifiers.mk" rel=3D"noreferrer" target=3D"_blank">perl-class-met=
hod-modifiers.mk</a>=C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-class-std-fast/<a href=3D"http://perl-class-s=
td-fast.mk" rel=3D"noreferrer" target=3D"_blank">perl-class-std-fast.mk</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-class-std/<a href=3D"http://perl-class-std.mk=
" rel=3D"noreferrer" target=3D"_blank">perl-class-std.mk</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +=
<br>
&gt;=C2=A0 =C2=A0package/perl-clone/<a href=3D"http://perl-clone.mk" rel=3D=
"noreferrer" target=3D"_blank">perl-clone.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-convert-asn1/<a href=3D"http://perl-convert-a=
sn1.mk" rel=3D"noreferrer" target=3D"_blank">perl-convert-asn1.mk</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-cookie-baker/<a href=3D"http://perl-cookie-ba=
ker.mk" rel=3D"noreferrer" target=3D"_blank">perl-cookie-baker.mk</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-crypt-blowfish/<a href=3D"http://perl-crypt-b=
lowfish.mk" rel=3D"noreferrer" target=3D"_blank">perl-crypt-blowfish.mk</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-crypt-cbc/<a href=3D"http://perl-crypt-cbc.mk=
" rel=3D"noreferrer" target=3D"_blank">perl-crypt-cbc.mk</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +=
<br>
&gt;=C2=A0 =C2=A0package/perl-crypt-openssl-aes/<a href=3D"http://perl-cryp=
t-openssl-aes.mk" rel=3D"noreferrer" target=3D"_blank">perl-crypt-openssl-a=
es.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-crypt-openssl-guess/<a href=3D"http://perl-cr=
ypt-openssl-guess.mk" rel=3D"noreferrer" target=3D"_blank">perl-crypt-opens=
sl-guess.mk</a>=C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-crypt-openssl-random/<a href=3D"http://perl-c=
rypt-openssl-random.mk" rel=3D"noreferrer" target=3D"_blank">perl-crypt-ope=
nssl-random.mk</a>=C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-crypt-openssl-rsa/<a href=3D"http://perl-cryp=
t-openssl-rsa.mk" rel=3D"noreferrer" target=3D"_blank">perl-crypt-openssl-r=
sa.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-data-dump/<a href=3D"http://perl-data-dump.mk=
" rel=3D"noreferrer" target=3D"_blank">perl-data-dump.mk</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +=
<br>
&gt;=C2=A0 =C2=A0package/perl-data-optlist/<a href=3D"http://perl-data-optl=
ist.mk" rel=3D"noreferrer" target=3D"_blank">perl-data-optlist.mk</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-data-uuid/<a href=3D"http://perl-data-uuid.mk=
" rel=3D"noreferrer" target=3D"_blank">perl-data-uuid.mk</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +=
<br>
&gt;=C2=A0 =C2=A0package/perl-date-manip/<a href=3D"http://perl-date-manip.=
mk" rel=3D"noreferrer" target=3D"_blank">perl-date-manip.mk</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br=
>
&gt;=C2=A0 =C2=A0package/perl-datetime-tiny/<a href=3D"http://perl-datetime=
-tiny.mk" rel=3D"noreferrer" target=3D"_blank">perl-datetime-tiny.mk</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-dbd-mysql/<a href=3D"http://perl-dbd-mysql.mk=
" rel=3D"noreferrer" target=3D"_blank">perl-dbd-mysql.mk</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +=
<br>
&gt;=C2=A0 =C2=A0package/perl-dbi/<a href=3D"http://perl-dbi.mk" rel=3D"nor=
eferrer" target=3D"_blank">perl-dbi.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-devel-cycle/<a href=3D"http://perl-devel-cycl=
e.mk" rel=3D"noreferrer" target=3D"_blank">perl-devel-cycle.mk</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0.../<a href=3D"http://perl-devel-globaldestruction.mk" rel=
=3D"noreferrer" target=3D"_blank">perl-devel-globaldestruction.mk</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-devel-size/<a href=3D"http://perl-devel-size.=
mk" rel=3D"noreferrer" target=3D"_blank">perl-devel-size.mk</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br=
>
&gt;=C2=A0 =C2=A0.../<a href=3D"http://perl-devel-stacktrace-ashtml.mk" rel=
=3D"noreferrer" target=3D"_blank">perl-devel-stacktrace-ashtml.mk</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-devel-stacktrace/<a href=3D"http://perl-devel=
-stacktrace.mk" rel=3D"noreferrer" target=3D"_blank">perl-devel-stacktrace.=
mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-device-serialport/<a href=3D"http://perl-devi=
ce-serialport.mk" rel=3D"noreferrer" target=3D"_blank">perl-device-serialpo=
rt.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-digest-hmac/<a href=3D"http://perl-digest-hma=
c.mk" rel=3D"noreferrer" target=3D"_blank">perl-digest-hmac.mk</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-digest-sha1/<a href=3D"http://perl-digest-sha=
1.mk" rel=3D"noreferrer" target=3D"_blank">perl-digest-sha1.mk</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-dist-checkconflicts/<a href=3D"http://perl-di=
st-checkconflicts.mk" rel=3D"noreferrer" target=3D"_blank">perl-dist-checkc=
onflicts.mk</a>=C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-encode-detect/<a href=3D"http://perl-encode-d=
etect.mk" rel=3D"noreferrer" target=3D"_blank">perl-encode-detect.mk</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-encode-locale/<a href=3D"http://perl-encode-l=
ocale.mk" rel=3D"noreferrer" target=3D"_blank">perl-encode-locale.mk</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-exporter-tiny/<a href=3D"http://perl-exporter=
-tiny.mk" rel=3D"noreferrer" target=3D"_blank">perl-exporter-tiny.mk</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-extutils-config/<a href=3D"http://perl-extuti=
ls-config.mk" rel=3D"noreferrer" target=3D"_blank">perl-extutils-config.mk<=
/a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-extutils-helpers/<a href=3D"http://perl-extut=
ils-helpers.mk" rel=3D"noreferrer" target=3D"_blank">perl-extutils-helpers.=
mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0.../perl-extutils-installpaths/<a href=3D"http://perl-extu=
tils-installpaths.mk" rel=3D"noreferrer" target=3D"_blank">perl-extutils-in=
stallpaths.mk</a>=C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-extutils-pkgconfig/<a href=3D"http://perl-ext=
utils-pkgconfig.mk" rel=3D"noreferrer" target=3D"_blank">perl-extutils-pkgc=
onfig.mk</a>=C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-file-listing/<a href=3D"http://perl-file-list=
ing.mk" rel=3D"noreferrer" target=3D"_blank">perl-file-listing.mk</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0.../perl-file-sharedir-install/<a href=3D"http://perl-file=
-sharedir-install.mk" rel=3D"noreferrer" target=3D"_blank">perl-file-shared=
ir-install.mk</a>=C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-file-sharedir/<a href=3D"http://perl-file-sha=
redir.mk" rel=3D"noreferrer" target=3D"_blank">perl-file-sharedir.mk</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-file-slurp/<a href=3D"http://perl-file-slurp.=
mk" rel=3D"noreferrer" target=3D"_blank">perl-file-slurp.mk</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br=
>
&gt;=C2=A0 =C2=A0package/perl-file-util/<a href=3D"http://perl-file-util.mk=
" rel=3D"noreferrer" target=3D"_blank">perl-file-util.mk</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +=
<br>
&gt;=C2=A0 =C2=A0.../perl-filesys-notify-simple/<a href=3D"http://perl-file=
sys-notify-simple.mk" rel=3D"noreferrer" target=3D"_blank">perl-filesys-not=
ify-simple.mk</a>=C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-gd/<a href=3D"http://perl-gd.mk" rel=3D"noref=
errer" target=3D"_blank">perl-gd.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-gdgraph/<a href=3D"http://perl-gdgraph.mk" re=
l=3D"noreferrer" target=3D"_blank">perl-gdgraph.mk</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-gdtextutil/<a href=3D"http://perl-gdtextutil.=
mk" rel=3D"noreferrer" target=3D"_blank">perl-gdtextutil.mk</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br=
>
&gt;=C2=A0 =C2=A0package/perl-hash-multivalue/<a href=3D"http://perl-hash-m=
ultivalue.mk" rel=3D"noreferrer" target=3D"_blank">perl-hash-multivalue.mk<=
/a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-html-parser/<a href=3D"http://perl-html-parse=
r.mk" rel=3D"noreferrer" target=3D"_blank">perl-html-parser.mk</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-html-tagset/<a href=3D"http://perl-html-tagse=
t.mk" rel=3D"noreferrer" target=3D"_blank">perl-html-tagset.mk</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-http-cookies/<a href=3D"http://perl-http-cook=
ies.mk" rel=3D"noreferrer" target=3D"_blank">perl-http-cookies.mk</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-http-daemon/<a href=3D"http://perl-http-daemo=
n.mk" rel=3D"noreferrer" target=3D"_blank">perl-http-daemon.mk</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-http-date/<a href=3D"http://perl-http-date.mk=
" rel=3D"noreferrer" target=3D"_blank">perl-http-date.mk</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +=
<br>
&gt;=C2=A0 =C2=A0package/perl-http-entity-parser/<a href=3D"http://perl-htt=
p-entity-parser.mk" rel=3D"noreferrer" target=3D"_blank">perl-http-entity-p=
arser.mk</a>=C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-http-headers-fast/<a href=3D"http://perl-http=
-headers-fast.mk" rel=3D"noreferrer" target=3D"_blank">perl-http-headers-fa=
st.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-http-message/<a href=3D"http://perl-http-mess=
age.mk" rel=3D"noreferrer" target=3D"_blank">perl-http-message.mk</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-http-multipartparser/<a href=3D"http://perl-h=
ttp-multipartparser.mk" rel=3D"noreferrer" target=3D"_blank">perl-http-mult=
ipartparser.mk</a>=C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-http-negotiate/<a href=3D"http://perl-http-ne=
gotiate.mk" rel=3D"noreferrer" target=3D"_blank">perl-http-negotiate.mk</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-i18n/<a href=3D"http://perl-i18n.mk" rel=3D"n=
oreferrer" target=3D"_blank">perl-i18n.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-image-exiftool/<a href=3D"http://perl-image-e=
xiftool.mk" rel=3D"noreferrer" target=3D"_blank">perl-image-exiftool.mk</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-io-html/<a href=3D"http://perl-io-html.mk" re=
l=3D"noreferrer" target=3D"_blank">perl-io-html.mk</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-io-interface/<a href=3D"http://perl-io-interf=
ace.mk" rel=3D"noreferrer" target=3D"_blank">perl-io-interface.mk</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-io-socket-multicast/<a href=3D"http://perl-io=
-socket-multicast.mk" rel=3D"noreferrer" target=3D"_blank">perl-io-socket-m=
ulticast.mk</a>=C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-io-socket-ssl/<a href=3D"http://perl-io-socke=
t-ssl.mk" rel=3D"noreferrer" target=3D"_blank">perl-io-socket-ssl.mk</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-json-maybexs/<a href=3D"http://perl-json-mayb=
exs.mk" rel=3D"noreferrer" target=3D"_blank">perl-json-maybexs.mk</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-json-tiny/<a href=3D"http://perl-json-tiny.mk=
" rel=3D"noreferrer" target=3D"_blank">perl-json-tiny.mk</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +=
<br>
&gt;=C2=A0 =C2=A0package/perl-libwww-perl/<a href=3D"http://perl-libwww-per=
l.mk" rel=3D"noreferrer" target=3D"_blank">perl-libwww-perl.mk</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0.../<a href=3D"http://perl-locale-maketext-lexicon.mk" rel=
=3D"noreferrer" target=3D"_blank">perl-locale-maketext-lexicon.mk</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-lwp-mediatypes/<a href=3D"http://perl-lwp-med=
iatypes.mk" rel=3D"noreferrer" target=3D"_blank">perl-lwp-mediatypes.mk</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-lwp-protocol-https/<a href=3D"http://perl-lwp=
-protocol-https.mk" rel=3D"noreferrer" target=3D"_blank">perl-lwp-protocol-=
https.mk</a>=C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-mail-dkim/<a href=3D"http://perl-mail-dkim.mk=
" rel=3D"noreferrer" target=3D"_blank">perl-mail-dkim.mk</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +=
<br>
&gt;=C2=A0 =C2=A0package/perl-mailtools/<a href=3D"http://perl-mailtools.mk=
" rel=3D"noreferrer" target=3D"_blank">perl-mailtools.mk</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +=
<br>
&gt;=C2=A0 =C2=A0package/perl-math-int64/<a href=3D"http://perl-math-int64.=
mk" rel=3D"noreferrer" target=3D"_blank">perl-math-int64.mk</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br=
>
&gt;=C2=A0 =C2=A0package/perl-math-prime-util/<a href=3D"http://perl-math-p=
rime-util.mk" rel=3D"noreferrer" target=3D"_blank">perl-math-prime-util.mk<=
/a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-mime-base64-urlsafe/<a href=3D"http://perl-mi=
me-base64-urlsafe.mk" rel=3D"noreferrer" target=3D"_blank">perl-mime-base64=
-urlsafe.mk</a>=C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-mime-tools/<a href=3D"http://perl-mime-tools.=
mk" rel=3D"noreferrer" target=3D"_blank">perl-mime-tools.mk</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br=
>
&gt;=C2=A0 =C2=A0package/perl-module-build-tiny/<a href=3D"http://perl-modu=
le-build-tiny.mk" rel=3D"noreferrer" target=3D"_blank">perl-module-build-ti=
ny.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-module-build/<a href=3D"http://perl-module-bu=
ild.mk" rel=3D"noreferrer" target=3D"_blank">perl-module-build.mk</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0.../perl-module-implementation/<a href=3D"http://perl-modu=
le-implementation.mk" rel=3D"noreferrer" target=3D"_blank">perl-module-impl=
ementation.mk</a>=C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-module-runtime/<a href=3D"http://perl-module-=
runtime.mk" rel=3D"noreferrer" target=3D"_blank">perl-module-runtime.mk</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0.../<a href=3D"http://perl-mojolicious-plugin-authenticati=
on.mk" rel=3D"noreferrer" target=3D"_blank">perl-mojolicious-plugin-authent=
ication.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 =C2=A0.../<a href=3D"http://perl-mojolicious-plugin-authorizatio=
n.mk" rel=3D"noreferrer" target=3D"_blank">perl-mojolicious-plugin-authoriz=
ation.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0.../<a href=3D"http://perl-mojolicious-plugin-cspheader.mk=
" rel=3D"noreferrer" target=3D"_blank">perl-mojolicious-plugin-cspheader.mk=
</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0.../<a href=3D"http://perl-mojolicious-plugin-i18n.mk" rel=
=3D"noreferrer" target=3D"_blank">perl-mojolicious-plugin-i18n.mk</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 =C2=A0.../<a href=3D"http://perl-mojolicious-plugin-securityhead=
er.mk" rel=3D"noreferrer" target=3D"_blank">perl-mojolicious-plugin-securit=
yheader.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-mojolicious/<a href=3D"http://perl-mojoliciou=
s.mk" rel=3D"noreferrer" target=3D"_blank">perl-mojolicious.mk</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-moo/<a href=3D"http://perl-moo.mk" rel=3D"nor=
eferrer" target=3D"_blank">perl-moo.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-mozilla-ca/<a href=3D"http://perl-mozilla-ca.=
mk" rel=3D"noreferrer" target=3D"_blank">perl-mozilla-ca.mk</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br=
>
&gt;=C2=A0 =C2=A0package/perl-net-dns/<a href=3D"http://perl-net-dns.mk" re=
l=3D"noreferrer" target=3D"_blank">perl-net-dns.mk</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-net-http/<a href=3D"http://perl-net-http.mk" =
rel=3D"noreferrer" target=3D"_blank">perl-net-http.mk</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-net-snmp/<a href=3D"http://perl-net-snmp.mk" =
rel=3D"noreferrer" target=3D"_blank">perl-net-snmp.mk</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-net-ssh2/<a href=3D"http://perl-net-ssh2.mk" =
rel=3D"noreferrer" target=3D"_blank">perl-net-ssh2.mk</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-net-ssleay/<a href=3D"http://perl-net-ssleay.=
mk" rel=3D"noreferrer" target=3D"_blank">perl-net-ssleay.mk</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br=
>
&gt;=C2=A0 =C2=A0package/perl-net-telnet/<a href=3D"http://perl-net-telnet.=
mk" rel=3D"noreferrer" target=3D"_blank">perl-net-telnet.mk</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br=
>
&gt;=C2=A0 =C2=A0package/perl-netaddr-ip/<a href=3D"http://perl-netaddr-ip.=
mk" rel=3D"noreferrer" target=3D"_blank">perl-netaddr-ip.mk</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br=
>
&gt;=C2=A0 =C2=A0package/perl-number-bytes-human/<a href=3D"http://perl-num=
ber-bytes-human.mk" rel=3D"noreferrer" target=3D"_blank">perl-number-bytes-=
human.mk</a>=C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-package-stash/<a href=3D"http://perl-package-=
stash.mk" rel=3D"noreferrer" target=3D"_blank">perl-package-stash.mk</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-params-util/<a href=3D"http://perl-params-uti=
l.mk" rel=3D"noreferrer" target=3D"_blank">perl-params-util.mk</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-parse-yapp/<a href=3D"http://perl-parse-yapp.=
mk" rel=3D"noreferrer" target=3D"_blank">perl-parse-yapp.mk</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br=
>
&gt;=C2=A0 =C2=A0package/perl-path-tiny/<a href=3D"http://perl-path-tiny.mk=
" rel=3D"noreferrer" target=3D"_blank">perl-path-tiny.mk</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +=
<br>
&gt;=C2=A0 =C2=A0package/perl-plack/<a href=3D"http://perl-plack.mk" rel=3D=
"noreferrer" target=3D"_blank">perl-plack.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0.../<a href=3D"http://perl-posix-strftime-compiler.mk" rel=
=3D"noreferrer" target=3D"_blank">perl-posix-strftime-compiler.mk</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-role-tiny/<a href=3D"http://perl-role-tiny.mk=
" rel=3D"noreferrer" target=3D"_blank">perl-role-tiny.mk</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +=
<br>
&gt;=C2=A0 =C2=A0package/perl-stream-buffered/<a href=3D"http://perl-stream=
-buffered.mk" rel=3D"noreferrer" target=3D"_blank">perl-stream-buffered.mk<=
/a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0.../<a href=3D"http://perl-sub-exporter-progressive.mk" re=
l=3D"noreferrer" target=3D"_blank">perl-sub-exporter-progressive.mk</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-sub-install/<a href=3D"http://perl-sub-instal=
l.mk" rel=3D"noreferrer" target=3D"_blank">perl-sub-install.mk</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-sub-quote/<a href=3D"http://perl-sub-quote.mk=
" rel=3D"noreferrer" target=3D"_blank">perl-sub-quote.mk</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +=
<br>
&gt;=C2=A0 =C2=A0package/perl-sys-meminfo/<a href=3D"http://perl-sys-meminf=
o.mk" rel=3D"noreferrer" target=3D"_blank">perl-sys-meminfo.mk</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-sys-mmap/<a href=3D"http://perl-sys-mmap.mk" =
rel=3D"noreferrer" target=3D"_blank">perl-sys-mmap.mk</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-time-parsedate/<a href=3D"http://perl-time-pa=
rsedate.mk" rel=3D"noreferrer" target=3D"_blank">perl-time-parsedate.mk</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-timedate/<a href=3D"http://perl-timedate.mk" =
rel=3D"noreferrer" target=3D"_blank">perl-timedate.mk</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-try-tiny/<a href=3D"http://perl-try-tiny.mk" =
rel=3D"noreferrer" target=3D"_blank">perl-try-tiny.mk</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-type-tiny/<a href=3D"http://perl-type-tiny.mk=
" rel=3D"noreferrer" target=3D"_blank">perl-type-tiny.mk</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +=
<br>
&gt;=C2=A0 =C2=A0package/perl-uri/<a href=3D"http://perl-uri.mk" rel=3D"nor=
eferrer" target=3D"_blank">perl-uri.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-www-form-urlencoded/<a href=3D"http://perl-ww=
w-form-urlencoded.mk" rel=3D"noreferrer" target=3D"_blank">perl-www-form-ur=
lencoded.mk</a>=C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-www-robotrules/<a href=3D"http://perl-www-rob=
otrules.mk" rel=3D"noreferrer" target=3D"_blank">perl-www-robotrules.mk</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-x10/<a href=3D"http://perl-x10.mk" rel=3D"nor=
eferrer" target=3D"_blank">perl-x10.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-xml-libxml/<a href=3D"http://perl-xml-libxml.=
mk" rel=3D"noreferrer" target=3D"_blank">perl-xml-libxml.mk</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br=
>
&gt;=C2=A0 =C2=A0package/perl-xml-namespacesupport/<a href=3D"http://perl-x=
ml-namespacesupport.mk" rel=3D"noreferrer" target=3D"_blank">perl-xml-names=
pacesupport.mk</a>=C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-xml-sax-base/<a href=3D"http://perl-xml-sax-b=
ase.mk" rel=3D"noreferrer" target=3D"_blank">perl-xml-sax-base.mk</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0package/perl-xml-sax/<a href=3D"http://perl-xml-sax.mk" re=
l=3D"noreferrer" target=3D"_blank">perl-xml-sax.mk</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0utils/scancpan=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
&gt;=C2=A0 =C2=A0124 files changed, 125 insertions(+)<br>
&gt; <br>
</blockquote></div></div>

--000000000000130b6a0615992a9e--

--===============8835863681347692025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8835863681347692025==--
