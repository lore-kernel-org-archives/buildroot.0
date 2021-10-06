Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B42AC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 16:41:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 203936023E
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 16:41:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 203936023E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB9E0407C9;
	Wed,  6 Oct 2021 16:41:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aO5AYZgRB2lC; Wed,  6 Oct 2021 16:41:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCAF3404AF;
	Wed,  6 Oct 2021 16:41:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1AD421BF309
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 16:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 173FD60EC9
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 16:41:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H717DblvRLqr for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 16:41:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 20ADA60ECD
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 16:41:29 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id o20so10662626wro.3
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 09:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ir20gL0UQ17NKCGBWywsrFeJwOVP4T/42LvGW2PndQw=;
 b=dTbn36bsp2GlXa2/QheXwETIU1VLb5T7cqg8sTd1XWma4Z95DGRjpZp70UxVec0B0q
 8kHAX8v4gAAnMS0CGwT6QTt8OfVVXpof8m5KnSBSSqd2c5iiMwCJUmBOPZw2hYesutTe
 PXH8RQ8gb8DbZZMxJXzPNLh/F8fd7iQB50qEibcZf3sBqTdQzHWDoRUsk0QB+okRNidS
 GxdocNiL9GUqiy1HNh/u8HV8cuCFPQZ7cZJaAt5GqDKlsvhCqqLfy+EAzc6PAJdEKDR+
 JFA8PTbSvSpRi9Wi/EEkjicIx+ghkTR7AzYaFDEZy6PkUw9LPgYvvHZe6EG/8dj/IcKY
 0hwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ir20gL0UQ17NKCGBWywsrFeJwOVP4T/42LvGW2PndQw=;
 b=6EVpt2k9tEqN1uXYr038zE8HMmmSKvRTaEGGQZDI/eQQNwvh6FBbsFIEv3snL3FAdr
 R9ChXlfDNH+RVwfQE2rsPvNlNZTPIYJgG7+TzgDMs3OugrdJgq81IV5pHY5CRT7RsQyp
 WvRgkZjrrVW0Rpi/M9W2+zH5/YE7583zmwwFCA8PM0GA1dQIQ2GJZRuIjpATvfReILPd
 3ZpZhboTCWM1210TE0R2myfeMxH0fs20hGx5tuvgkHGi18IUF1JSzYFIQvziRk+K/U5S
 t2AgdL46ZBZLPoX0+6tYBEOZUVGEOKbXP8FUlk5fn2VCX6BFDlKrgzGz3mOhm80ov9X0
 NDJw==
X-Gm-Message-State: AOAM533hPQ5eWESj09y4YkS+oE+ZLB7HjUxxYO2/VT8f4SXNioo9NMI2
 2JHr5PBtUPu9/P4z4+CUqvS06ItlBxk=
X-Google-Smtp-Source: ABdhPJzHrNKVyVDOB6XWMTWIpEKyu+zHL7svlR70Xief3iN5+R9+RjGDd/ac3BSfY8bZ8K/Ihy7TUA==
X-Received: by 2002:a1c:ac03:: with SMTP id v3mr10802517wme.13.1633538487018; 
 Wed, 06 Oct 2021 09:41:27 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id b19sm3880756wmb.1.2021.10.06.09.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:41:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 18:40:31 +0200
Message-Id: <20211006164031.2627877-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pkg-autotools: fix python with
 automake >= 1.16.4
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Set --with-python_{prefix,exec_prefix} to fix the following build
failures with python and libsoc or libgpiod raised since bump of
automake to version 1.16.4 in commit
fe90272b5128987ee7492fff950660e05324838d and
https://git.savannah.gnu.org/cgit/automake.git/commit/?id=ed8daa069a6c8ed34f7856c42402ec46f305e670:

 /bin/mkdir -p '/home/buildroot/autobuild/instance-0/output-1/host/arc-buildroot-linux-uclibc/sysroot/home/buildroot/autobuild/instance-0/output-1/host/lib/python3.9/site-packages'
 /bin/bash ../../libtool   --mode=install /usr/bin/install -c   gpiod.la '/home/buildroot/autobuild/instance-0/output-1/host/arc-buildroot-linux-uclibc/sysroot/home/buildroot/autobuild/instance-0/output-1/host/lib/python3.9/site-packages'
libtool: install: /usr/bin/install -c .libs/gpiod.so /home/buildroot/autobuild/instance-0/output-1/host/arc-buildroot-linux-uclibc/sysroot/home/buildroot/autobuild/instance-0/output-1/host/lib/python3.9/site-packages/gpiod.so

[...]

libgpiod: installs files in /home/buildroot/autobuild/instance-0/output-1/host/arc-buildroot-linux-uclibc/sysroot//home/buildroot/autobuild/instance-0/output-1

Fixes:
 - http://autobuild.buildroot.org/results/045dc3f737f58d44014a4b717b5a565388e86f63
 - http://autobuild.buildroot.org/results/6e7a129b05e7852a4dc8dd35148664ad09610f28

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pkg-autotools.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 7720d6ffe7..2566bd546d 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -189,6 +189,8 @@ define $(2)_CONFIGURE_CMDS
 		--build=$$(GNU_HOST_NAME) \
 		--prefix=/usr \
 		--exec-prefix=/usr \
+		--with-python_prefix=/usr \
+		--with-python_exec_prefix=/usr \
 		--sysconfdir=/etc \
 		--localstatedir=/var \
 		--program-prefix="" \
@@ -221,6 +223,7 @@ define $(2)_CONFIGURE_CMDS
 	CONFIG_SITE=/dev/null \
 	./configure \
 		--prefix="$$(HOST_DIR)" \
+		--with-python_prefix="$$(HOST_DIR)" \
 		--sysconfdir="$$(HOST_DIR)/etc" \
 		--localstatedir="$$(HOST_DIR)/var" \
 		--enable-shared --disable-static \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
