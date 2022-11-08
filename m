Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD6CC433FE
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 17:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74F1160E0F;
	Tue,  8 Nov 2022 17:51:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74F1160E0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B26D72uAS0pB; Tue,  8 Nov 2022 17:51:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5014160E09;
	Tue,  8 Nov 2022 17:51:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5014160E09
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0EECE1BF955
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 17:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEB3F81358
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 17:51:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEB3F81358
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0CNj2J0-2YdE for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 17:51:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9EDC8134C
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9EDC8134C
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 17:51:34 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id bs21so22190831wrb.4
 for <buildroot@buildroot.org>; Tue, 08 Nov 2022 09:51:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=99rBqAhsZCkXEbxeuuQx2LtfW9wCWSXjuFVsKFnb+tA=;
 b=i6mJeHTp+23qdsQIY7+DGTgu5cx+gfgn3PSIMn4D1+z1pp+Yj0ZK5UMy9eEuE8Ya0E
 zT8H0MjtR5OYIgokBL2OsEd5uF02VNFWxFKPbf6GGKFWCZwXGELvbqZpveflTSi8jbTk
 edr6LAfmxEMUiPEY3olkxHu4Fh0KzD+IeEQZjvmFaXDCG+D6KWlnoJehg2vw9/ryxgIF
 ZJRrDxzTFOeZujYRx9D7nYWsFtv8rpwFqnTz3gYQI78P/D0KmKJ7gKfECGJV8xp6oKzx
 LgmDwo/91z9Y2lZkW+URkJEeDPcwtpAxUmxNAKa0Snx9eFV6BxDAHEa6xWKMmotpWiJJ
 WyPA==
X-Gm-Message-State: ACrzQf3E5pJomRUfFbxddMbPWaC4GN5g0bJIXRrjjMC3E9bffKhRHncH
 ZSEUFEP9nqlWN/7BG/T/mV0U3H0bdM8=
X-Google-Smtp-Source: AMsMyM4ireTidchoe8KW/p2WylG8HBpIBFBtB12NQ3ZRnEs3Qxd48dljdTqbHTbZN4QkuTbofDeNFg==
X-Received: by 2002:adf:cd86:0:b0:236:6056:14d3 with SMTP id
 q6-20020adfcd86000000b00236605614d3mr38001932wrj.30.1667929892335; 
 Tue, 08 Nov 2022 09:51:32 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 j13-20020adfea4d000000b0023bb7e4b8b1sm11046480wrn.82.2022.11.08.09.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 09:51:31 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  8 Nov 2022 18:51:29 +0100
Message-Id: <20221108175129.727174-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=99rBqAhsZCkXEbxeuuQx2LtfW9wCWSXjuFVsKFnb+tA=;
 b=RxGDm462jWYdR3lcb6v1CEYGo6qndnzBzBe2k3fhViVRc06rNbXZs0jhr0djY0tXbv
 2P2mouLEkLRxksi3aoYcs5DIQWEZZw21/k1tJxQitjgCGU+CAo0JGXa+DQ2Poa1rhMPK
 6hueUFUnNfyHb2GYZpsJIP79DTQAtHesbyumYbn2sxOk/RfNqjyC6OMko6Hu2TxUoJkc
 b3wqN5VD6SQ0g3k0/agWRNdQjQE0uGCJhXDVvuey6TNKmTPFTWEX0Xy99MTT6OAObvlT
 qbuSKnM0nJ1DVssKFEJFSrPNsmtOW379w0KhJuEAjYvfmmtmxGuUsrgraErD2ZwAqo9z
 njzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RxGDm462
Subject: [Buildroot] [PATCH 1/1] package/perl-net-ssleay: bump to version
 1.93_01
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Refresh patch
- Drop -lz from Makefile with libressl as this is the only solution for
  now: https://github.com/radiator-software/p5-net-ssleay/issues/399
- License has been clarified to be Artistic-2.0 since version 1.86.11:
  https://github.com/radiator-software/p5-net-ssleay/commit/aa4a0206d6d2a5ac2998dd9d6a8c5b88902c04de
- This bump will fix the following build failure with libressl:

  In file included from /home/autobuild/autobuild/instance-11/output-1/host/armeb-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/perl5/5.34.1/armeb-linux/CORE/perl.h:5748,
                   from SSLeay.xs:141:
  SSLeay.xs: In function 'XS_Net__SSLeay_SESSION_get_master_key':
  SSLeay.xs:5569:37: error: invalid use of incomplete typedef 'SSL_SESSION' {aka 'struct ssl_session_st'}
   5569 |      sv_setpvn(ST(0), (const char*)s->master_key, s->master_key_length);
        |                                     ^~

https://metacpan.org/release/CHRISN/Net-SSLeay-1.93_01/changes

Fixes:
 - http://autobuild.buildroot.org/results/71337cc496727f2b1173c055d706c5bfc2f5d2bc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-fix-build-system.patch               | 30 +++++++++----------
 package/perl-net-ssleay/perl-net-ssleay.hash  |  6 ++--
 package/perl-net-ssleay/perl-net-ssleay.mk    | 13 ++++++--
 3 files changed, 28 insertions(+), 21 deletions(-)

diff --git a/package/perl-net-ssleay/0001-fix-build-system.patch b/package/perl-net-ssleay/0001-fix-build-system.patch
index a6cd0f9ceb..a5ccf464ba 100644
--- a/package/perl-net-ssleay/0001-fix-build-system.patch
+++ b/package/perl-net-ssleay/0001-fix-build-system.patch
@@ -8,29 +8,29 @@ paths, since they are missing the destdir; Buildroot compilers
 and linkers already know where to search, anyway.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+[Fabrice: update for 1.93_01]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 
 diff -durN perl-net-ssleay-1.64.orig/inc/Module/Install/PRIVATE/Net/SSLeay.pm perl-net-ssleay-1.64/inc/Module/Install/PRIVATE/Net/SSLeay.pm
---- perl-net-ssleay-1.64.orig/inc/Module/Install/PRIVATE/Net/SSLeay.pm	2014-04-01 08:08:37.000000000 +0200
-+++ perl-net-ssleay-1.64/inc/Module/Install/PRIVATE/Net/SSLeay.pm	2014-07-13 00:38:46.281380282 +0200
-@@ -37,14 +37,18 @@
-         exit 0; # according http://wiki.cpantesters.org/wiki/CPANAuthorNotes this is best-practice when "missing library"
+--- perl-net-ssleay-1.64.orig/Makefile.PL	2014-04-01 08:08:37.000000000 +0200
++++ perl-net-ssleay-1.64/Makefile.PL	2014-07-13 00:38:46.281380282 +0200
+@@ -192,12 +192,16 @@
+         exit MISSING_PREREQ;
      }
  
--    $self->check_openssl_version($prefix, $exec);
+-    check_openssl_version($prefix, $exec);
 +# Does not work for cross-compilation.
 +# In Buildroot, we do have a supported version.
-+#    $self->check_openssl_version($prefix, $exec);
-     my $opts = $self->ssleay_get_build_opts($prefix, $exec);
- 
-     $self->makemaker_args(
++#    check_openssl_version($prefix, $exec);
+     my %args = (
          CCCDLFLAGS => $opts->{cccdlflags},
          OPTIMIZE => $opts->{optimize},
--        INC => join(' ', map {"-I$_"} @{$opts->{inc_paths}}),
--        LIBS => join(' ', (map {"-L$_"} @{$opts->{lib_paths}}), (map {"-l$_"} @{$opts->{lib_links}})),
+-        INC => qq{-I"$opts->{inc_path}"},
+-        LIBS => join(' ', (map '-L'.maybe_quote($_), @{$opts->{lib_paths}}), (map {"-l$_"} @{$opts->{lib_links}})),
 +# Buildroot already has the correct include and library search paths.
-+#        INC => join(' ', map {"-I$_"} @{$opts->{inc_paths}}),
-+#        LIBS => join(' ', (map {"-L$_"} @{$opts->{lib_paths}}), (map {"-l$_"} @{$opts->{lib_links}})),
++#        INC => qq{-I"$opts->{inc_path}"},
++#        LIBS => join(' ', (map '-L'.maybe_quote($_), @{$opts->{lib_paths}}), (map {"-l$_"} @{$opts->{lib_links}})),
 +        LIBS => join(' ', (map {"-l$_"} @{$opts->{lib_links}})),
      );
- 
-     if ( $self->prompt(
+     # From HMBRAND to handle multple version of OPENSSL installed
+     if (my $lp = join " " => map '-L'.maybe_quote($_), @{$opts->{lib_paths} || []})
diff --git a/package/perl-net-ssleay/perl-net-ssleay.hash b/package/perl-net-ssleay/perl-net-ssleay.hash
index 7502a60ad1..9caff68edd 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.hash
+++ b/package/perl-net-ssleay/perl-net-ssleay.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  d602bdce4e0531c6efc276e3e429ca69  Net-SSLeay-1.85.tar.gz
-sha256  9d8188b9fb1cae3bd791979c20554925d5e94a138d00414f1a6814549927b0c8  Net-SSLeay-1.85.tar.gz
+md5  c73821e9790b3bdb3471d9b8faf48bbb  Net-SSLeay-1.93_01.tar.gz
+sha256  876d022fbc719631b11d6bb4b6e78db3c19bbca578093c376c8f9900a4432aa3  Net-SSLeay-1.93_01.tar.gz
 
 # computed by scancpan
-sha256  b55065185a2172d9f2ea2dd87c18c206ea3dc45a64e5f3deb3eee34d839dc822  LICENSE
+sha256  685e534b60d4e2b4fbb1a259a83b5a86e877a919bbb9efc95994276f706a3a71  LICENSE
diff --git a/package/perl-net-ssleay/perl-net-ssleay.mk b/package/perl-net-ssleay/perl-net-ssleay.mk
index 80ce8b9cc7..8b7b2b973b 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.mk
+++ b/package/perl-net-ssleay/perl-net-ssleay.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PERL_NET_SSLEAY_VERSION = 1.85
+PERL_NET_SSLEAY_VERSION = 1.93_01
 PERL_NET_SSLEAY_SOURCE = Net-SSLeay-$(PERL_NET_SSLEAY_VERSION).tar.gz
-PERL_NET_SSLEAY_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIKEM
+PERL_NET_SSLEAY_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CH/CHRISN
 PERL_NET_SSLEAY_DEPENDENCIES = openssl
-PERL_NET_SSLEAY_LICENSE = OpenSSL
+PERL_NET_SSLEAY_LICENSE = Artistic-2.0
 PERL_NET_SSLEAY_LICENSE_FILES = LICENSE
 PERL_NET_SSLEAY_DISTNAME = Net-SSLeay
 
@@ -24,4 +24,11 @@ define PERL_NET_SSLEAY_FIX_MAKEFILE
 endef
 PERL_NET_SSLEAY_POST_CONFIGURE_HOOKS += PERL_NET_SSLEAY_FIX_MAKEFILE
 
+ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+define PERL_NET_SSLEAY_DROP_ZLIB_MAKEFILE
+	$(SED) "s/-lz//" $(@D)/Makefile
+endef
+PERL_NET_SSLEAY_POST_CONFIGURE_HOOKS += PERL_NET_SSLEAY_DROP_ZLIB_MAKEFILE
+endif
+
 $(eval $(perl-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
