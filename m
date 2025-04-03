Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BBBC3600C
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 14:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A93366FBED;
	Thu,  3 Apr 2025 14:51:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XQo5qkwKlr58; Thu,  3 Apr 2025 14:51:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C97B36FBE2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C97B36FBE2;
	Thu,  3 Apr 2025 14:51:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1663F119
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 14:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F068B40AF2
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 14:51:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yeJ7c7SiIyCn for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 14:51:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7B8694045B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B8694045B
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B8694045B
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 14:51:20 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-39c1ef4acf2so704770f8f.0
 for <buildroot@buildroot.org>; Thu, 03 Apr 2025 07:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743691878; x=1744296678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bvict8W2xvo08TKfyx6vEI/LK562B7QsBVAtUZBwYY8=;
 b=tz36MC2nDqOS4jQKPMFX/r1FTHd91kOYftE2vuENnZeDk3d58Gt01JivS0OIumstJY
 tSG7HDUEnOfCizeoUNUBga0MYe0qEuUsCzLgQkvpWrL2agCXCK4wkzSvJ5FvPEriT2kr
 u5JlTFHtKRrp9TjEE+xH+zNMYN/zZcJquvAv7tpEsCtage5oWG+avFSpcrLSs7a8ch8q
 RQ0Ma8vBxu7llK6WQ2WoSHAP8Xc1ElzRAJPTyd76bCWJv6Exl94TD8M8o06Ihad+No54
 9iYtONXcoNCVVasqhiiOoRM2c40b03H4ikfdq8UwqhHrhoWabW9HS4gkXHRQjzmV9hYp
 zzZw==
X-Gm-Message-State: AOJu0Yzonuyzj9GSxS54CZjH8/hI8F7B0pwRTIm9GcGKmQSYtp95i64W
 fi0lQh4DxL8wUHyIkh3FRZ+M392S7MBm2NgvR2XPkpIjhzi+b7bZmuBgF7M/WamlH8ox5H5iGYI
 Z
X-Gm-Gg: ASbGncuVxMYs/J9zVzUwQwjr3Yc+74bH1g+bKfZmhxyqHT7K7z2lPIA+miHpKV9yg6M
 qZKMXbbYuJJzBzzBYL5Ug86dZpAsNdzyqRi2FKUnwvBZGU5EiIN+N9B9pMUeXT4x0dAmJQgMfYv
 xITsJOFTosFR/nvrs2JefyYt5taylNa2a36yeYnwTszvXCPEyH6878HLKmGaO3YmjCUSta9p7wy
 55kEOJUiz3etM9OvQpTGq+wfiIomeVbcTXDWUxRYSE9Hab5OhsllBKkBKQ5sWaDKBX7BSnumUWh
 foN4tcjysEN3nb/SmG2VnMmbrjsamc579KK5O+p9HHsV/VN/jJGN+B0V/doFvwSfpnvi1Q/MaoZ
 GRWJ17yfmgxBYi/wvlE6PIJnFnrRnTX1QQUhkjF0=
X-Google-Smtp-Source: AGHT+IGVgL3B3r+lV5GT6WRTt0gywUJUdVMOajMsBmHNe9JKKYhwvC36ytyOOmEet7Na/3xHebRjfg==
X-Received: by 2002:a05:6000:250f:b0:39c:1f10:c736 with SMTP id
 ffacd0b85a97d-39c1f10c765mr13520820f8f.43.1743691877823; 
 Thu, 03 Apr 2025 07:51:17 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec34be2ffsm20327015e9.22.2025.04.03.07.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Apr 2025 07:51:17 -0700 (PDT)
To: buildroot@buildroot.org
Cc: alex.michel@wiedemann-group.com, david.pierret@smile.fr,
 elmehdi.younes@smile.fr, eric.le.bihan.dev@free.fr,
 gsmecher@threespeedlogic.com, james.hilliard1@gmail.com,
 joseph.kogut@gmail.com, kazemi.ms@gmail.com, mail@dbrgn.ch,
 mail@t-voltmer.net, mika.westerberg@linux.intel.com, sam.voss@gmail.com,
 ycliang@andestech.com
Date: Thu,  3 Apr 2025 16:50:34 +0200
Message-ID: <20250403145044.3770916-1-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250403141538.3769560-1-elmehdi.younes@smile.fr>
References: <20250403141538.3769560-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1743691878; x=1744296678; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bvict8W2xvo08TKfyx6vEI/LK562B7QsBVAtUZBwYY8=;
 b=pZrj10V5oHjmzn1l0GeqDDUnAEOgcGegMgeY7MgNN6R406+SZWTm/smfXIhhYnloaa
 5Cubqx2vpfMtiP4FPQPxc5THzlCOsGl/+iDgCM1GYdlAVRC7GGPS3xKoWzFIqPnJNEm3
 Oy+anDxAneROw7f1yxIZPAj7eIYsHk2ABVuBQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=pZrj10V5
Subject: [Buildroot]
 =?y?q?=5BBuildroot=5D=20=5BPATCH=201/4=5D=20package/rust=3A=20fix=20bootstrap=20with=20Rust=E2=89=A51=2E83?=
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Type: multipart/mixed; boundary="===============1668962282082612854=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1668962282082612854==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Patches 2 to 4 should be squashed into a single commit, as they logically belong together. 

I used multiple commits only for better clarity.

--===============1668962282082612854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1668962282082612854==--
