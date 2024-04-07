Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B416CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 17:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2BAE81D4F;
	Sun,  7 Apr 2024 17:09:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IU8x_5dSkkIz; Sun,  7 Apr 2024 17:09:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52DE481D24
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52DE481D24;
	Sun,  7 Apr 2024 17:09:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF9C01BF2BE
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 17:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B0C381D24
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 17:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WTU0Mtk9iEGH for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 17:09:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0480681C6F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0480681C6F
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0480681C6F
 for <buildroot@busybox.net>; Sun,  7 Apr 2024 17:09:11 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41634598125so9543135e9.3
 for <buildroot@busybox.net>; Sun, 07 Apr 2024 10:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712509749; x=1713114549;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q9156vwPVWjBCU9V5yrpTi1Qan3TtAtwGHnaZX/Ydwc=;
 b=HSxtpdyQ1M70oNOLfPPk5RP0ZY+mVuoAJfUV6FFjdfPnrmhfPzw4CKqgwvTSsFwinF
 5VASZtTvDS+0GLrYgXyTH/sjN0aRHj6FEY19XArA/C0odIUl+ag/5zpMYSrDS96/qSTH
 DJZLqhsN2OrVB6LbnkBDAM6gnfEDeWij2u2piCqOwX1Q+0oDCmhoaDWbR7hCT0VHAqJB
 MOWdDzz9Btz1ryADP3Qf+U+WyNe+7DVKjzv6Kzm8Bzy4rG2+GvmqMrEhrR0PZzLVOjiF
 0SuNMCdkiCZWN04nDvOCN4BaRpPsYBfSo6QnTMHAGtam4aIk8m3p/WlhKJfAeMJampMr
 iVOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+gcclLXO+7/Jd5jYKiL/QqMVnyyay7mW8jOsFD3fJdB8ZfRgoH1+RbgcMP1akqTXEIyqHQX5GalWz+WOFzeCeZkTiwvg=
X-Gm-Message-State: AOJu0YzaM2B/Jmaassk6IyOHf/V4x1eYhkZavtzhvkHu5m8uiYkDdLMw
 K8IG5eQFuBg2ucsj8JBmwE5Q6+5UT6HFcTg+xB09ErGzAKjOEqKYeAaIXp41Icc=
X-Google-Smtp-Source: AGHT+IH7Yeup7UplZYH3pbnjtunm8Q9KScAWDKF9ci86OhyoiODfpVcerg06NzybfpdTwj6fNymf2Q==
X-Received: by 2002:a05:600c:1f86:b0:415:52a3:63ef with SMTP id
 je6-20020a05600c1f8600b0041552a363efmr4472993wmb.31.1712509749360; 
 Sun, 07 Apr 2024 10:09:09 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 z8-20020adfe548000000b0034335e47102sm6989621wrm.113.2024.04.07.10.09.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 10:09:08 -0700 (PDT)
Message-ID: <6413ce1c-a13b-4a04-81e5-0ba48a19e39a@mind.be>
Date: Sun, 7 Apr 2024 19:09:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Francois Perrad <francois.perrad@gadz.org>, buildroot@busybox.net
References: <20240407144250.7558-1-francois.perrad@gadz.org>
Content-Language: en-GB
In-Reply-To: <20240407144250.7558-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712509749; x=1713114549; darn=busybox.net;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q9156vwPVWjBCU9V5yrpTi1Qan3TtAtwGHnaZX/Ydwc=;
 b=ItQmlWcAk1I5/G4tEZDb9Fi+PdehxfwPgrXpE2i4N2QSGfmmQMkBKA1+5gwB8WH8i2
 LLRWcZC481zQtt5XHBTvSttHb3vTs9PtoNPRZXkJlxa2VCRuhfg+g5qBohtw2o01K+2N
 ZzwcWF8ToKbKgwq9ul3ZTlMD1mFj5bf7qmgZWH1m/NxPBWmL2halvkGZCl3x6mWrrH5A
 PNi5ltShHdRhyoBD+4XSysQHEJqLz25Nh6Vj/jIbOq/CU/Vu369RTinCwY7P/wmXJUJV
 n2NUJNxUHhUl2LEv8LzPGA2LjdKJjKm0QSs/RM4iHDLdpiM0I5sYs7WyhDA3jPzhMZA8
 1oxg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ItQmlWcA
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Francois, all,

On 07/04/2024 16:42, Francois Perrad wrote:
> This serie goes on the top of serie "Support SBOM in CycloneDX format"
> 
> It handles PURL for the CPAN (Perl package manager)
> 
> Francois Perrad (2):
>    utils/scancpan: generate PURL package variable
>    package/perl-*: regenerate with PURL

  You chose here to explicitly include the PURL variable in all packages. An 
alternative would be to automatically calculate a (default) value for it in the 
perl infra.

  Since (almost) all perl packages are generated with scancpan, I do think it 
makes sense to do it explicitly: it is much easier for a developer to see what 
is really happening (they don't need to know about how the perl infra works), it 
is still easy on maintenance because it's generated automatically anyway, and it 
means we don't need to make the perl infra more complicated.

  On the other hand, by putting it in the perl infra, it becomes very explicit 
when the automatic purl was overridden.

  IMHO, the tradeoff points to what you did: putting the PURL explicit in the 
.mk file. But other people's opinion may differ, so I wanted to throw this out 
there.

  Regards,
  Arnout


> 
>   .../perl-apache-logformat-compiler.mk                           | 1 +
>   package/perl-appconfig/perl-appconfig.mk                        | 1 +
>   package/perl-astro-suntime/perl-astro-suntime.mk                | 1 +
>   package/perl-class-inspector/perl-class-inspector.mk            | 1 +
>   package/perl-class-load/perl-class-load.mk                      | 1 +
>   .../perl-class-method-modifiers/perl-class-method-modifiers.mk  | 1 +
>   package/perl-class-std-fast/perl-class-std-fast.mk              | 1 +
>   package/perl-class-std/perl-class-std.mk                        | 1 +
>   package/perl-clone/perl-clone.mk                                | 1 +
>   package/perl-convert-asn1/perl-convert-asn1.mk                  | 1 +
>   package/perl-cookie-baker/perl-cookie-baker.mk                  | 1 +
>   package/perl-crypt-blowfish/perl-crypt-blowfish.mk              | 1 +
>   package/perl-crypt-cbc/perl-crypt-cbc.mk                        | 1 +
>   package/perl-crypt-openssl-aes/perl-crypt-openssl-aes.mk        | 1 +
>   package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk    | 1 +
>   package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk  | 1 +
>   package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk        | 1 +
>   package/perl-data-dump/perl-data-dump.mk                        | 1 +
>   package/perl-data-optlist/perl-data-optlist.mk                  | 1 +
>   package/perl-data-uuid/perl-data-uuid.mk                        | 1 +
>   package/perl-date-manip/perl-date-manip.mk                      | 1 +
>   package/perl-datetime-tiny/perl-datetime-tiny.mk                | 1 +
>   package/perl-dbd-mysql/perl-dbd-mysql.mk                        | 1 +
>   package/perl-dbi/perl-dbi.mk                                    | 1 +
>   package/perl-devel-cycle/perl-devel-cycle.mk                    | 1 +
>   .../perl-devel-globaldestruction.mk                             | 1 +
>   package/perl-devel-size/perl-devel-size.mk                      | 1 +
>   .../perl-devel-stacktrace-ashtml.mk                             | 1 +
>   package/perl-devel-stacktrace/perl-devel-stacktrace.mk          | 1 +
>   package/perl-device-serialport/perl-device-serialport.mk        | 1 +
>   package/perl-digest-hmac/perl-digest-hmac.mk                    | 1 +
>   package/perl-digest-sha1/perl-digest-sha1.mk                    | 1 +
>   package/perl-dist-checkconflicts/perl-dist-checkconflicts.mk    | 1 +
>   package/perl-encode-detect/perl-encode-detect.mk                | 1 +
>   package/perl-encode-locale/perl-encode-locale.mk                | 1 +
>   package/perl-exporter-tiny/perl-exporter-tiny.mk                | 1 +
>   package/perl-extutils-config/perl-extutils-config.mk            | 1 +
>   package/perl-extutils-helpers/perl-extutils-helpers.mk          | 1 +
>   .../perl-extutils-installpaths/perl-extutils-installpaths.mk    | 1 +
>   package/perl-extutils-pkgconfig/perl-extutils-pkgconfig.mk      | 1 +
>   package/perl-file-listing/perl-file-listing.mk                  | 1 +
>   .../perl-file-sharedir-install/perl-file-sharedir-install.mk    | 1 +
>   package/perl-file-sharedir/perl-file-sharedir.mk                | 1 +
>   package/perl-file-slurp/perl-file-slurp.mk                      | 1 +
>   package/perl-file-util/perl-file-util.mk                        | 1 +
>   .../perl-filesys-notify-simple/perl-filesys-notify-simple.mk    | 1 +
>   package/perl-gd/perl-gd.mk                                      | 1 +
>   package/perl-gdgraph/perl-gdgraph.mk                            | 1 +
>   package/perl-gdtextutil/perl-gdtextutil.mk                      | 1 +
>   package/perl-hash-multivalue/perl-hash-multivalue.mk            | 1 +
>   package/perl-html-parser/perl-html-parser.mk                    | 1 +
>   package/perl-html-tagset/perl-html-tagset.mk                    | 1 +
>   package/perl-http-cookies/perl-http-cookies.mk                  | 1 +
>   package/perl-http-daemon/perl-http-daemon.mk                    | 1 +
>   package/perl-http-date/perl-http-date.mk                        | 1 +
>   package/perl-http-entity-parser/perl-http-entity-parser.mk      | 1 +
>   package/perl-http-headers-fast/perl-http-headers-fast.mk        | 1 +
>   package/perl-http-message/perl-http-message.mk                  | 1 +
>   package/perl-http-multipartparser/perl-http-multipartparser.mk  | 1 +
>   package/perl-http-negotiate/perl-http-negotiate.mk              | 1 +
>   package/perl-i18n/perl-i18n.mk                                  | 1 +
>   package/perl-image-exiftool/perl-image-exiftool.mk              | 1 +
>   package/perl-io-html/perl-io-html.mk                            | 1 +
>   package/perl-io-interface/perl-io-interface.mk                  | 1 +
>   package/perl-io-socket-multicast/perl-io-socket-multicast.mk    | 1 +
>   package/perl-io-socket-ssl/perl-io-socket-ssl.mk                | 1 +
>   package/perl-json-maybexs/perl-json-maybexs.mk                  | 1 +
>   package/perl-json-tiny/perl-json-tiny.mk                        | 1 +
>   package/perl-libwww-perl/perl-libwww-perl.mk                    | 1 +
>   .../perl-locale-maketext-lexicon.mk                             | 1 +
>   package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk              | 1 +
>   package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk      | 1 +
>   package/perl-mail-dkim/perl-mail-dkim.mk                        | 1 +
>   package/perl-mailtools/perl-mailtools.mk                        | 1 +
>   package/perl-math-int64/perl-math-int64.mk                      | 1 +
>   package/perl-math-prime-util/perl-math-prime-util.mk            | 1 +
>   package/perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.mk    | 1 +
>   package/perl-mime-tools/perl-mime-tools.mk                      | 1 +
>   package/perl-module-build-tiny/perl-module-build-tiny.mk        | 1 +
>   package/perl-module-build/perl-module-build.mk                  | 1 +
>   .../perl-module-implementation/perl-module-implementation.mk    | 1 +
>   package/perl-module-runtime/perl-module-runtime.mk              | 1 +
>   .../perl-mojolicious-plugin-authentication.mk                   | 1 +
>   .../perl-mojolicious-plugin-authorization.mk                    | 1 +
>   .../perl-mojolicious-plugin-cspheader.mk                        | 1 +
>   .../perl-mojolicious-plugin-i18n.mk                             | 1 +
>   .../perl-mojolicious-plugin-securityheader.mk                   | 1 +
>   package/perl-mojolicious/perl-mojolicious.mk                    | 1 +
>   package/perl-moo/perl-moo.mk                                    | 1 +
>   package/perl-mozilla-ca/perl-mozilla-ca.mk                      | 1 +
>   package/perl-net-dns/perl-net-dns.mk                            | 1 +
>   package/perl-net-http/perl-net-http.mk                          | 1 +
>   package/perl-net-snmp/perl-net-snmp.mk                          | 1 +
>   package/perl-net-ssh2/perl-net-ssh2.mk                          | 1 +
>   package/perl-net-ssleay/perl-net-ssleay.mk                      | 1 +
>   package/perl-net-telnet/perl-net-telnet.mk                      | 1 +
>   package/perl-netaddr-ip/perl-netaddr-ip.mk                      | 1 +
>   package/perl-number-bytes-human/perl-number-bytes-human.mk      | 1 +
>   package/perl-package-stash/perl-package-stash.mk                | 1 +
>   package/perl-params-util/perl-params-util.mk                    | 1 +
>   package/perl-parse-yapp/perl-parse-yapp.mk                      | 1 +
>   package/perl-path-tiny/perl-path-tiny.mk                        | 1 +
>   package/perl-plack/perl-plack.mk                                | 1 +
>   .../perl-posix-strftime-compiler.mk                             | 1 +
>   package/perl-role-tiny/perl-role-tiny.mk                        | 1 +
>   package/perl-stream-buffered/perl-stream-buffered.mk            | 1 +
>   .../perl-sub-exporter-progressive.mk                            | 1 +
>   package/perl-sub-install/perl-sub-install.mk                    | 1 +
>   package/perl-sub-quote/perl-sub-quote.mk                        | 1 +
>   package/perl-sys-meminfo/perl-sys-meminfo.mk                    | 1 +
>   package/perl-sys-mmap/perl-sys-mmap.mk                          | 1 +
>   package/perl-time-parsedate/perl-time-parsedate.mk              | 1 +
>   package/perl-timedate/perl-timedate.mk                          | 1 +
>   package/perl-try-tiny/perl-try-tiny.mk                          | 1 +
>   package/perl-type-tiny/perl-type-tiny.mk                        | 1 +
>   package/perl-uri/perl-uri.mk                                    | 1 +
>   package/perl-www-form-urlencoded/perl-www-form-urlencoded.mk    | 1 +
>   package/perl-www-robotrules/perl-www-robotrules.mk              | 1 +
>   package/perl-x10/perl-x10.mk                                    | 1 +
>   package/perl-xml-libxml/perl-xml-libxml.mk                      | 1 +
>   package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk  | 1 +
>   package/perl-xml-sax-base/perl-xml-sax-base.mk                  | 1 +
>   package/perl-xml-sax/perl-xml-sax.mk                            | 1 +
>   utils/scancpan                                                  | 2 ++
>   124 files changed, 125 insertions(+)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
