Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA6CC25B74
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 10:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56162402A5;
	Mon, 27 May 2024 10:50:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kNpy6PtduKJJ; Mon, 27 May 2024 10:50:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DABEE402A6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DABEE402A6;
	Mon, 27 May 2024 10:50:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C3C8F1D1B38
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 10:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC836605CD
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 10:49:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6SSHhHEd9SVE for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 10:49:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=stephan.lukits@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2826C605C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2826C605C7
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2826C605C7
 for <buildroot@buildroot.org>; Mon, 27 May 2024 10:49:56 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5786988ae9bso2410645a12.3
 for <buildroot@buildroot.org>; Mon, 27 May 2024 03:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716806995; x=1717411795;
 h=to:date:message-id:subject:mime-version:content-transfer-encoding
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hB+by6dEnDaZd0QV1M9Nreydy9NYDaBw1SXE1GSOGuE=;
 b=Zl5HMpLrXjteTcM3fFr+YiaIl+/6yQmfWJAkjKoqKSiA2I8Zksj/32p0MSGUbYsV5g
 Z6oM1qJnPaJeUp/5Yg8qQLhs99Zcaiz1N2gnt4WgT+mx5N9wCsMxQ6Ml8NSluAwElCs/
 Q7GvmfShSf414BkXoql9Lt71nEWIMILNNx80DAXYSBEfzBX3bZFC9AZ1DV4lTdOaZO/I
 CQeFip0GvA5+gL8ZXKSGNQHpKBZ462o7hXbBNWJURFLWkUgGCWnhNwjg6tJOodxBlyQ2
 4/eCNsFvB9KgBLPCwNVHCvcB4ezL/U/br3xGcrVgrEAGJytKbNE/VkdKV7cCp1pRX3/8
 7JgQ==
X-Gm-Message-State: AOJu0YwUe8P1CThtlusTvPgHZOVv83Jcu6spu9VMUFk7sYxTwwKUHRf0
 UQlZUYlSwiClSVxDYXejUmMxoJ+jH1+yrfz5JzGlbkbKnUk7uuYjpRmJ9Zfu
X-Google-Smtp-Source: AGHT+IFhC70PM46S2ch1/ydxZx7nlhUXZt0dd7t7tOYiJvta1VaDKg50NplZ4eHftZjOLFBaeypnxQ==
X-Received: by 2002:a17:906:57d9:b0:a5c:ec66:226d with SMTP id
 a640c23a62f3a-a62641b1bb4mr616082766b.17.1716806995001; 
 Mon, 27 May 2024 03:49:55 -0700 (PDT)
Received: from smtpclient.apple
 (p200300d6f736c700f118a3b4edd5dce7.dip0.t-ipconnect.de.
 [2003:d6:f736:c700:f118:a3b4:edd5:dce7])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c817ee7sm479964166b.33.2024.05.27.03.49.54
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2024 03:49:54 -0700 (PDT)
From: Stephan Lukits <stephan.lukits@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Message-Id: <D64D07D6-F5B1-474D-A9EC-1D765362C88A@gmail.com>
Date: Mon, 27 May 2024 12:49:43 +0200
To: buildroot@buildroot.org
X-Mailer: Apple Mail (2.3774.600.62)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716806995; x=1717411795; darn=buildroot.org;
 h=to:date:message-id:subject:mime-version:content-transfer-encoding
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=hB+by6dEnDaZd0QV1M9Nreydy9NYDaBw1SXE1GSOGuE=;
 b=bV2zQPw3GI8edpBObeUfiYlS9FzMsfL0CSkTcqf42HO3HLXpKMMIrH09DHk+FQ961m
 ncK2wVeyWmtDuRp2/BuZfRA9pDWF+8TNvzFIXoRpxZ42CWkptPxQN/15IAOI/DrBe+0W
 g7KKpGIeE+6Z9s7oxuMc7Ha3ZXAHLl9HDZVSY5zoBuMDPal0keOePHoNU83ArwDrFq3v
 kA4HP2zLDPbX0oBZQ2YYyABrkhT5ZvkdEoNdPI2c9yDPBHYlD3VTla2KXAVMAlC0qeeA
 uiIn9aUln0iQJYPMXVIPouuY+0fDJ14u9GdGErUtDOe8D4lxUneEJyWuHeHq8f5R/+nG
 l/Sg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bV2zQPw3
Subject: [Buildroot] [make] wget: Unknown option 'passive-ftp'
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

Good afternoon, choosing a preset configuration and calling `make` fails:

goedel@fedora-linux-38 buildroot-2024.02]$ make
>>> host-pkgconf 1.6.3 Downloading
wget --passive-ftp -nd -t 3 -O '/home/goedel/vizitec/buildroot/buildroot-2024.02/output/build/.pkgconf-1.6.3.tar.xz.6Ki7ZF/output' 'https://distfiles.ariadne.space/pkgconf/pkgconf-1.6.3.tar.xz' 
Unknown option 'passive-ftp'
wget --passive-ftp -nd -t 3 -O '/home/goedel/vizitec/buildroot/buildroot-2024.02/output/build/.pkgconf-1.6.3.tar.xz.Ia3Uk3/output' 'https://sources.buildroot.net/pkgconf/pkgconf-1.6.3.tar.xz' 
Unknown option 'passive-ftp'
wget --passive-ftp -nd -t 3 -O '/home/goedel/vizitec/buildroot/buildroot-2024.02/output/build/.pkgconf-1.6.3.tar.xz.ETh0Z6/output' 'https://sources.buildroot.net/pkgconf-1.6.3.tar.xz' 
Unknown option 'passive-ftp'
make: *** [package/pkg-generic.mk:179: /home/goedel/vizitec/buildroot/buildroot-2024.02/output/build/host-pkgconf-1.6.3/.stamp_downloaded] Error 1
[goedel@fedora-linux-38 buildroot-2024.02]$ wget --passive-ftp -nd -t 3 -O '/home/goedel/vizitec/buildroot/buildroot-2024.02/output/build/.pkgconf-1.6.3.tar.xz.6Ki7ZF/output' 'https://distfiles.ariadne.space/pkgconf/pkgconf-1.6.3.tar.xz'
Unknown option 'passive-ftp'


$ wget --version
GNU Wget2 2.1.0 - multithreaded metalink/file/website downloader

+digest +https +ssl/gnutls +ipv6 +iri +large-file +nls -ntlm -opie +psl -hsts
+iconv +idn2 +zlib -lzma +brotlidec +zstd -bzip2 -lzip +http2 +gpgme

thx for any help, Stephan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
