Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C82C4332F
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:02:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA7686101C
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA7686101C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B20FC40471;
	Mon, 25 Oct 2021 19:02:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5z92AYtiwGSU; Mon, 25 Oct 2021 19:02:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03F384046E;
	Mon, 25 Oct 2021 19:02:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 843611BF3F7
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74C6780F25
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:01:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 73B0riWVoB0N for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 19:01:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9ECC680F24
 for <buildroot@busybox.net>; Mon, 25 Oct 2021 19:01:48 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id g8so2879556edb.2
 for <buildroot@busybox.net>; Mon, 25 Oct 2021 12:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HWi8AvvJZSkrMcXlkqI+d28gXaXGrme7yukkEnC2jcU=;
 b=evuyRZ+xTH2i2TZkiy0aqquA00nOpk2ddvCUSZWXwAclsYsjdiDglplRpS9lxCp738
 0G8dKlK7n5rT3JZzlpfDFnTT+KIMk2cgKz9JXoPLYlio84n9Qdjg88B/TXYNeElBMXRN
 /Y4ys4atMhFnkOWX0VVC7i1DpwKiJA1BSaW6EGcQydhWHjJm446BNOKDPx5srPCnD6CD
 oqFKmFWnHV044Uj5iODX0HrhB+1XMABYYdEFEjxuYHwxD4jzv/8fzjIPb2jYgXrxA4L4
 8l/UvLzMtSNP3ZVurZWV/nl02jwME5YpZ6o3BQm+cHvRLlB38+mwJzIYh4s1DB6So3N7
 btuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HWi8AvvJZSkrMcXlkqI+d28gXaXGrme7yukkEnC2jcU=;
 b=XbOK74Ttk8tOsAUGf85Dg/oKOLQmhniReePKSCjQ3k6INkob2SpwcE9aDywFJS7h72
 8GAgkSmlKrR0CponI3dPkj+nDDwWBsfv+lWeIlyXa3xsySYopF8cVifRQrCfh0yg2dZh
 uwmb2v5p1a4COPsCKkOFYTu9NEUW9l3DJSxwYBXWCe6DvYknWq9OuYcE+nBQ3cdJ4vz9
 RcJrqkCnnwMRpLiGCw/0KlQmpGNgN/2VOGB/s1UzCz8cEGbXupfpo9RvyEOVU4EgGLMx
 e5KCzgbadCkixEMRG8J11IeIai6A/kPc60RKdQ1CXE+eTrHgYi35k0Lp3U6p455wW0c6
 oPkQ==
X-Gm-Message-State: AOAM533/hl4SfLQ1ZLsHBfEoNJsLGED4MG9/0JhA9qSDllJ036K9Z9hZ
 EvIPElT1Oqtm5yNwqH3UVj/6wExaEv0=
X-Google-Smtp-Source: ABdhPJxgvp34B1WML2GtSR/BtEsSKF0Z+OlMt1EoM6Y18IGkE5IoBB9taKHkRwyuGWoz76XTtIrz8g==
X-Received: by 2002:a17:907:869f:: with SMTP id
 qa31mr17981658ejc.361.1635188504027; 
 Mon, 25 Oct 2021 12:01:44 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id g9sm7890584ejo.60.2021.10.25.12.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 12:01:43 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 25 Oct 2021 21:01:33 +0200
Message-Id: <20211025190134.1273703-4-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211025190134.1273703-1-francois.perrad@gadz.org>
References: <20211025190134.1273703-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/5] package/perl-mozilla-ca: bump to version
 20211001
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-mozilla-ca/perl-mozilla-ca.hash | 4 ++--
 package/perl-mozilla-ca/perl-mozilla-ca.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.hash b/package/perl-mozilla-ca/perl-mozilla-ca.hash
index c577d4887..07966f990 100644
--- a/package/perl-mozilla-ca/perl-mozilla-ca.hash
+++ b/package/perl-mozilla-ca/perl-mozilla-ca.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  8ac3fe1a83c45da3f468f78ab8133ea6  Mozilla-CA-20200520.tar.gz
-sha256  b3ca0002310bf24a16c0d5920bdea97a2f46e77e7be3e7377e850d033387c726  Mozilla-CA-20200520.tar.gz
+md5  843e42f367ea3c7abc5de5b6225791dc  Mozilla-CA-20211001.tar.gz
+sha256  122c8900000a9d388aa8e44f911cab6c118fe8497417917a84a8ec183971b449  Mozilla-CA-20211001.tar.gz
 
 # computed by scancpan
 sha256  95cd63dae5c2bf6e7cf33435981614a36c85ef01fc7a02464e05e58a5355398e  README
diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.mk b/package/perl-mozilla-ca/perl-mozilla-ca.mk
index 3bcb947f7..6b970c0f9 100644
--- a/package/perl-mozilla-ca/perl-mozilla-ca.mk
+++ b/package/perl-mozilla-ca/perl-mozilla-ca.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOZILLA_CA_VERSION = 20200520
+PERL_MOZILLA_CA_VERSION = 20211001
 PERL_MOZILLA_CA_SOURCE = Mozilla-CA-$(PERL_MOZILLA_CA_VERSION).tar.gz
 PERL_MOZILLA_CA_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AB/ABH
 PERL_MOZILLA_CA_LICENSE = MPL-2.0
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
