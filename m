Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E249CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 14:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A44D60788;
	Sun,  7 Apr 2024 14:43:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SMD-92nTsOsO; Sun,  7 Apr 2024 14:43:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03DA5608A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03DA5608A5;
	Sun,  7 Apr 2024 14:43:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DCD191BF30F
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C842081E67
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:43:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rlynKmFeL7WE for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 14:43:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6AE2581E54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AE2581E54
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6AE2581E54
 for <buildroot@busybox.net>; Sun,  7 Apr 2024 14:43:17 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a519e04b142so308700266b.3
 for <buildroot@busybox.net>; Sun, 07 Apr 2024 07:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712500995; x=1713105795;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oAkmquZiCx9dL2hLJKJ8AtnC+NflJoG97AywUUIYEZw=;
 b=f9qKt7bWQBFI7ferUIXHe1oZCOm8na70+wJtm2+kcoXQ50Guzxp/QRzMp1KoR07hTB
 +Hjy6QFvif8bKO9Cv9UzFMH6wg4tD314zTHsL8KjEEPwfagDvFL35DMW1MimQY/KXDAl
 UPK0r3KluH8WYf3WIP/3pNuUkGczQnrQ80J8kAMtorKjOO8SoeqmOwiYJfHQTEVqJ8Ow
 kFibk13PglakEJQUWrNk6/pzML+9x6LezGCrd8v6BLBR28VCN7P8+qoEI+Xlf3p7G3SA
 TOBezlNuIFY4J9xeI1RkEPkdiAARxSshkOA+GCV0ZpMU84FRwnf7Q3spUNbA3WZKB5Wq
 Nu8w==
X-Gm-Message-State: AOJu0YwjaalIq36wUY971IQsHklY4mWkQGSUNk1YY8VpTOS4sHaCUVhm
 ht8/iewrLMjZWytQRy+l3MPH0tDwwySoHm2wirx8Pl7Wo/Ttm4jE6z5wNX7mhPeb2uG/ayCDCho
 =
X-Google-Smtp-Source: AGHT+IGIBAgG1/FHcf6XRKEOWI95jgll5b2SFP64gTmhqggLpe4FyErsLwpSXDUqi4i2Nki6tzt22Q==
X-Received: by 2002:a17:907:9282:b0:a51:c27d:8f84 with SMTP id
 bw2-20020a170907928200b00a51c27d8f84mr2852774ejc.32.1712500994925; 
 Sun, 07 Apr 2024 07:43:14 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 bv4-20020a170907934400b00a51ce4710c5sm785136ejc.19.2024.04.07.07.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 07:43:14 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun,  7 Apr 2024 16:42:48 +0200
Message-Id: <20240407144250.7558-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1712500995; x=1713105795; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oAkmquZiCx9dL2hLJKJ8AtnC+NflJoG97AywUUIYEZw=;
 b=DC0VTpR1jB4K6lDLvTW2OdpuzY0DPY87MQnh1Th8OwGH0OYeX9bwghaCoeiINA47sT
 Q2KQk969voIgjxIrhrWusJxjAdFLCmjY0TK+DZlBogN1GBQ7KoZtb2KcQWHN5t/ka6PO
 Svz8+u0lmbnUwvAnfQCIzZMASxzHNsX0MuCSeBlu/kIMKLHgKmMEAqvyzVj5/xriZlOU
 9/RZmihAaEkRWm0zccIdy4sl+iyqzve72pzCWJ7p3VlnPyuRroSFY+EEeq7yCqA4QVTS
 3Py1B7tYn9HF43a9Xt6w8yXD6ByH8dxkaN0XjUMwKDJ2SbkBzSB7uOx1lloW8JG3y34H
 RPHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=DC0VTpR1
Subject: [Buildroot] [RFC PATCH 0/2] PURL pkg:cpan
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
Cc: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This serie goes on the top of serie "Support SBOM in CycloneDX format"

It handles PURL for the CPAN (Perl package manager)

Francois Perrad (2):
  utils/scancpan: generate PURL package variable
  package/perl-*: regenerate with PURL

 .../perl-apache-logformat-compiler.mk                           | 1 +
 package/perl-appconfig/perl-appconfig.mk                        | 1 +
 package/perl-astro-suntime/perl-astro-suntime.mk                | 1 +
 package/perl-class-inspector/perl-class-inspector.mk            | 1 +
 package/perl-class-load/perl-class-load.mk                      | 1 +
 .../perl-class-method-modifiers/perl-class-method-modifiers.mk  | 1 +
 package/perl-class-std-fast/perl-class-std-fast.mk              | 1 +
 package/perl-class-std/perl-class-std.mk                        | 1 +
 package/perl-clone/perl-clone.mk                                | 1 +
 package/perl-convert-asn1/perl-convert-asn1.mk                  | 1 +
 package/perl-cookie-baker/perl-cookie-baker.mk                  | 1 +
 package/perl-crypt-blowfish/perl-crypt-blowfish.mk              | 1 +
 package/perl-crypt-cbc/perl-crypt-cbc.mk                        | 1 +
 package/perl-crypt-openssl-aes/perl-crypt-openssl-aes.mk        | 1 +
 package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk    | 1 +
 package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk  | 1 +
 package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk        | 1 +
 package/perl-data-dump/perl-data-dump.mk                        | 1 +
 package/perl-data-optlist/perl-data-optlist.mk                  | 1 +
 package/perl-data-uuid/perl-data-uuid.mk                        | 1 +
 package/perl-date-manip/perl-date-manip.mk                      | 1 +
 package/perl-datetime-tiny/perl-datetime-tiny.mk                | 1 +
 package/perl-dbd-mysql/perl-dbd-mysql.mk                        | 1 +
 package/perl-dbi/perl-dbi.mk                                    | 1 +
 package/perl-devel-cycle/perl-devel-cycle.mk                    | 1 +
 .../perl-devel-globaldestruction.mk                             | 1 +
 package/perl-devel-size/perl-devel-size.mk                      | 1 +
 .../perl-devel-stacktrace-ashtml.mk                             | 1 +
 package/perl-devel-stacktrace/perl-devel-stacktrace.mk          | 1 +
 package/perl-device-serialport/perl-device-serialport.mk        | 1 +
 package/perl-digest-hmac/perl-digest-hmac.mk                    | 1 +
 package/perl-digest-sha1/perl-digest-sha1.mk                    | 1 +
 package/perl-dist-checkconflicts/perl-dist-checkconflicts.mk    | 1 +
 package/perl-encode-detect/perl-encode-detect.mk                | 1 +
 package/perl-encode-locale/perl-encode-locale.mk                | 1 +
 package/perl-exporter-tiny/perl-exporter-tiny.mk                | 1 +
 package/perl-extutils-config/perl-extutils-config.mk            | 1 +
 package/perl-extutils-helpers/perl-extutils-helpers.mk          | 1 +
 .../perl-extutils-installpaths/perl-extutils-installpaths.mk    | 1 +
 package/perl-extutils-pkgconfig/perl-extutils-pkgconfig.mk      | 1 +
 package/perl-file-listing/perl-file-listing.mk                  | 1 +
 .../perl-file-sharedir-install/perl-file-sharedir-install.mk    | 1 +
 package/perl-file-sharedir/perl-file-sharedir.mk                | 1 +
 package/perl-file-slurp/perl-file-slurp.mk                      | 1 +
 package/perl-file-util/perl-file-util.mk                        | 1 +
 .../perl-filesys-notify-simple/perl-filesys-notify-simple.mk    | 1 +
 package/perl-gd/perl-gd.mk                                      | 1 +
 package/perl-gdgraph/perl-gdgraph.mk                            | 1 +
 package/perl-gdtextutil/perl-gdtextutil.mk                      | 1 +
 package/perl-hash-multivalue/perl-hash-multivalue.mk            | 1 +
 package/perl-html-parser/perl-html-parser.mk                    | 1 +
 package/perl-html-tagset/perl-html-tagset.mk                    | 1 +
 package/perl-http-cookies/perl-http-cookies.mk                  | 1 +
 package/perl-http-daemon/perl-http-daemon.mk                    | 1 +
 package/perl-http-date/perl-http-date.mk                        | 1 +
 package/perl-http-entity-parser/perl-http-entity-parser.mk      | 1 +
 package/perl-http-headers-fast/perl-http-headers-fast.mk        | 1 +
 package/perl-http-message/perl-http-message.mk                  | 1 +
 package/perl-http-multipartparser/perl-http-multipartparser.mk  | 1 +
 package/perl-http-negotiate/perl-http-negotiate.mk              | 1 +
 package/perl-i18n/perl-i18n.mk                                  | 1 +
 package/perl-image-exiftool/perl-image-exiftool.mk              | 1 +
 package/perl-io-html/perl-io-html.mk                            | 1 +
 package/perl-io-interface/perl-io-interface.mk                  | 1 +
 package/perl-io-socket-multicast/perl-io-socket-multicast.mk    | 1 +
 package/perl-io-socket-ssl/perl-io-socket-ssl.mk                | 1 +
 package/perl-json-maybexs/perl-json-maybexs.mk                  | 1 +
 package/perl-json-tiny/perl-json-tiny.mk                        | 1 +
 package/perl-libwww-perl/perl-libwww-perl.mk                    | 1 +
 .../perl-locale-maketext-lexicon.mk                             | 1 +
 package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk              | 1 +
 package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk      | 1 +
 package/perl-mail-dkim/perl-mail-dkim.mk                        | 1 +
 package/perl-mailtools/perl-mailtools.mk                        | 1 +
 package/perl-math-int64/perl-math-int64.mk                      | 1 +
 package/perl-math-prime-util/perl-math-prime-util.mk            | 1 +
 package/perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.mk    | 1 +
 package/perl-mime-tools/perl-mime-tools.mk                      | 1 +
 package/perl-module-build-tiny/perl-module-build-tiny.mk        | 1 +
 package/perl-module-build/perl-module-build.mk                  | 1 +
 .../perl-module-implementation/perl-module-implementation.mk    | 1 +
 package/perl-module-runtime/perl-module-runtime.mk              | 1 +
 .../perl-mojolicious-plugin-authentication.mk                   | 1 +
 .../perl-mojolicious-plugin-authorization.mk                    | 1 +
 .../perl-mojolicious-plugin-cspheader.mk                        | 1 +
 .../perl-mojolicious-plugin-i18n.mk                             | 1 +
 .../perl-mojolicious-plugin-securityheader.mk                   | 1 +
 package/perl-mojolicious/perl-mojolicious.mk                    | 1 +
 package/perl-moo/perl-moo.mk                                    | 1 +
 package/perl-mozilla-ca/perl-mozilla-ca.mk                      | 1 +
 package/perl-net-dns/perl-net-dns.mk                            | 1 +
 package/perl-net-http/perl-net-http.mk                          | 1 +
 package/perl-net-snmp/perl-net-snmp.mk                          | 1 +
 package/perl-net-ssh2/perl-net-ssh2.mk                          | 1 +
 package/perl-net-ssleay/perl-net-ssleay.mk                      | 1 +
 package/perl-net-telnet/perl-net-telnet.mk                      | 1 +
 package/perl-netaddr-ip/perl-netaddr-ip.mk                      | 1 +
 package/perl-number-bytes-human/perl-number-bytes-human.mk      | 1 +
 package/perl-package-stash/perl-package-stash.mk                | 1 +
 package/perl-params-util/perl-params-util.mk                    | 1 +
 package/perl-parse-yapp/perl-parse-yapp.mk                      | 1 +
 package/perl-path-tiny/perl-path-tiny.mk                        | 1 +
 package/perl-plack/perl-plack.mk                                | 1 +
 .../perl-posix-strftime-compiler.mk                             | 1 +
 package/perl-role-tiny/perl-role-tiny.mk                        | 1 +
 package/perl-stream-buffered/perl-stream-buffered.mk            | 1 +
 .../perl-sub-exporter-progressive.mk                            | 1 +
 package/perl-sub-install/perl-sub-install.mk                    | 1 +
 package/perl-sub-quote/perl-sub-quote.mk                        | 1 +
 package/perl-sys-meminfo/perl-sys-meminfo.mk                    | 1 +
 package/perl-sys-mmap/perl-sys-mmap.mk                          | 1 +
 package/perl-time-parsedate/perl-time-parsedate.mk              | 1 +
 package/perl-timedate/perl-timedate.mk                          | 1 +
 package/perl-try-tiny/perl-try-tiny.mk                          | 1 +
 package/perl-type-tiny/perl-type-tiny.mk                        | 1 +
 package/perl-uri/perl-uri.mk                                    | 1 +
 package/perl-www-form-urlencoded/perl-www-form-urlencoded.mk    | 1 +
 package/perl-www-robotrules/perl-www-robotrules.mk              | 1 +
 package/perl-x10/perl-x10.mk                                    | 1 +
 package/perl-xml-libxml/perl-xml-libxml.mk                      | 1 +
 package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk  | 1 +
 package/perl-xml-sax-base/perl-xml-sax-base.mk                  | 1 +
 package/perl-xml-sax/perl-xml-sax.mk                            | 1 +
 utils/scancpan                                                  | 2 ++
 124 files changed, 125 insertions(+)

-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
