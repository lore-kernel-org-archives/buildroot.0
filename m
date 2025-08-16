Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5965ECA0EE9
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 20:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09F8983F29;
	Sat, 16 Aug 2025 20:17:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ktjl1ujrs2vw; Sat, 16 Aug 2025 20:17:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11DCE83F1D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11DCE83F1D;
	Sat, 16 Aug 2025 20:17:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 60CD875
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4688683F1D
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:17:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZPd_A7oA-obO for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 20:17:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 59BEA83EF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59BEA83EF4
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59BEA83EF4
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:17:52 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 818457017; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 16 Aug 2025 20:17:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1unNLX-00A7Ds-0R;
 Sat, 16 Aug 2025 22:17:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org
References: <20250816195542.3748-1-fl@n621.de>
Date: Sat, 16 Aug 2025 22:17:47 +0200
In-Reply-To: <20250816195542.3748-1-fl@n621.de> (Florian Larysch's message of
 "Sat, 16 Aug 2025 21:55:41 +0200")
Message-ID: <87bjofm36c.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=FvQMywWrtawpMxsP9JJrMzK+8aInUKmfdF3Z2aAt8t4S+U8eMEctoOXwrZR1/wngjDIsqCXyvvBNx6lE5L/RueafOhRyma809bTHwWdyXUPhMGKvEL5VCOqvkGbvEcGWCAduZ/aax5rTOESXKayWqew7GP/qGlzrhUm8p3/FeRYGUJShJ6qXgoi77AlKPrE+nMe+Z9+k3DQht/jR5IbhCY3FWZVw0Sr39bZOzA9lDG/Y6M2xnEONMJoBiud4YNK7wHEjg8E4C0gN20nvawTCzLcdleCutwdHfSRpJsdA8peFfFrfrVwdUNbOUC4D+CbczbQHtAB2bSVPw1ALwQdxmg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=sMs3j2FlYTcSMr+KPnj4WPQ/SUyIDyZh0KQvvKmEEbo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=FvQMywWr
Subject: Re: [Buildroot] [PATCH 1/1] package/libjwt: require openssl
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Florian" == Florian Larysch <fl@n621.de> writes:

 > Ever since upstream commit 01dd6da ("Rework the entire API"), first
 > introduced as part of release v3.0.0, openssl is a hard requirement for
 > building libjwt. As such, "-DWITH_OPENSSL=ON" also has become a no-op.

 > In Buildroot, this has been masked somewhat by the implicit select when
 > gnutls is disabled, but a failure can be reproduced using test-pkg with
 > a config like:

 > BR2_PACKAGE_GNUTLS=y
 > BR2_PACKAGE_LIBJWT=y

 > Fix this by requiring openssl. Furthermore, building against libressl
 > does not work because libjwt requires API surface that is not present
 > there[1], so we need to force libopenssl.

 > libjwt still supports linking against additional crypto providers, so we
 > can still link against gnutls if it is present.

 > [1] https://autobuild.buildroot.org/results/463/4638a7d46c149ca0f46d3fe5f5f90dc5ee9d1e03

While it can work with the combination gnutls + libopenssl, would there
be any advantage over just using openssl for everything?


 > Signed-off-by: Florian Larysch <fl@n621.de>
 > ---
 >  package/libjwt/Config.in | 3 ++-
 >  package/libjwt/libjwt.mk | 7 ++-----
 >  2 files changed, 4 insertions(+), 6 deletions(-)

 > diff --git a/package/libjwt/Config.in b/package/libjwt/Config.in
 > index 39d1665e0e..47eb0882a3 100644
 > --- a/package/libjwt/Config.in
 > +++ b/package/libjwt/Config.in
 > @@ -1,6 +1,7 @@
 >  config BR2_PACKAGE_LIBJWT
 >  	bool "libjwt"
 > -	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
 > +	select BR2_PACKAGE_OPENSSL
 > +	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 >  	select BR2_PACKAGE_JANSSON
 >  	help
 >  	  JSON Web Tokens are an open, industry standard RFC 7519
 > diff --git a/package/libjwt/libjwt.mk b/package/libjwt/libjwt.mk
 > index 29ca9cebf4..687432142f 100644
 > --- a/package/libjwt/libjwt.mk
 > +++ b/package/libjwt/libjwt.mk
 > @@ -7,7 +7,7 @@
 >  LIBJWT_VERSION = 3.2.0
 >  LIBJWT_SITE = https://github.com/benmcollins/libjwt/releases/download/v$(LIBJWT_VERSION)
 >  LIBJWT_SOURCE = libjwt-$(LIBJWT_VERSION).tar.xz
 > -LIBJWT_DEPENDENCIES = host-pkgconf jansson
 > +LIBJWT_DEPENDENCIES = host-pkgconf jansson openssl
 >  LIBJWT_INSTALL_STAGING = YES
 >  LIBJWT_LICENSE = MPL-2.0
 >  LIBJWT_LICENSE_FILES = LICENSE
 > @@ -16,10 +16,7 @@ LIBJWT_CPE_ID_PRODUCT = jwt_c_library
 
 >  LIBJWT_CONF_OPTS += -DWITH_TESTS=OFF
 
 > -ifeq ($(BR2_PACKAGE_OPENSSL),y)
 > -LIBJWT_CONF_OPTS += -DWITH_OPENSSL=ON
 > -LIBJWT_DEPENDENCIES += openssl
 > -else
 > +ifeq ($(BR2_PACKAGE_GNUTLS),y)
 >  LIBJWT_CONF_OPTS += -DWITH_GNUTLS=ON
 >  LIBJWT_DEPENDENCIES += gnutls
 >  endif
 > -- 

 > 2.50.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
