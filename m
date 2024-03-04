Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CC6C5478C
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 13:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C12A4608EA;
	Mon,  4 Mar 2024 13:50:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cqs--N1YVLyo; Mon,  4 Mar 2024 13:50:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB3A960BCA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB3A960BCA;
	Mon,  4 Mar 2024 13:50:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 53F351BF3A0
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 13:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F3C0820A0
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 13:50:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xfXethqYNzls for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 13:50:28 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E846C820A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E846C820A4
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E846C820A4
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 13:50:27 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1dccb2edc6dso36493965ad.3
 for <buildroot@buildroot.org>; Mon, 04 Mar 2024 05:50:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709560226; x=1710165026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gUDdwSm/JKVCD6kIw6ZSEpbRASmTRLuMuSs+bDR0eWA=;
 b=gZwqwn7ZiPwy6dIZELy+PjFb/u0KLfPhTFdT1KKF4ru72lr21ec3Ey3b+4liA68ZmU
 G/zDsL3ikDsT1Fr/MHZCbF4AdwEpde7LlRuV1Kx25rHz5a4qjNG93TBLt8DN6azNHLJz
 aDzEIza1i3PlTRZZ3Z7C/qRAVjcqz/ooQ/PfyCjjoOXOKvHKNSiNmXYipP/i3xfMYTWS
 HudbpIPx+nYORHmfiimv3LdU6nOoDUDrQEAeYTt1rChSHEZbKh6ICj26s3fLCD876nId
 Gc5CkDjjTp4AcRzNgubk71A5EcZ71fDFEZBy0Q5ls5H8NBaIbWGenA8t0XBlcxFU0ud/
 FuZA==
X-Gm-Message-State: AOJu0YzK+DgXbPkgzbfPPb+5MbsF1AAfd3+zwKNSUHR25F4iuZs/KF+4
 z4IYj3iAVM6ZhJCCSGh2aJFap4oCu2LDJto3wmxR8Jc/7yenwwIav0KxMzUTgSH/h/vcWzSLatP
 x9qRpIg==
X-Google-Smtp-Source: AGHT+IFHhPD1LFZBGI33qeEimXMfzi9Z+Djr5c0DWTJ/8iAAv/gb3Bhif2raxZ7qJdBw42Z6do0i6A==
X-Received: by 2002:a17:902:ce83:b0:1dc:b81c:809 with SMTP id
 f3-20020a170902ce8300b001dcb81c0809mr9273743plg.32.1709560226629; 
 Mon, 04 Mar 2024 05:50:26 -0800 (PST)
Received: from alesmao.newtesc.com ([187.120.6.114])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a170902b58d00b001db5fc51d71sm8479115pls.160.2024.03.04.05.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 05:50:26 -0800 (PST)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Mon,  4 Mar 2024 10:50:14 -0300
Message-ID: <20240304135015.1741202-2-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240304135015.1741202-1-flavio.tapajos@newtesc.com.br>
References: <20240304135015.1741202-1-flavio.tapajos@newtesc.com.br>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1709560226; x=1710165026;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gUDdwSm/JKVCD6kIw6ZSEpbRASmTRLuMuSs+bDR0eWA=;
 b=Fd/PentfqsU5RZ0lOLPWEBC5yd0O84za0OafBnYWJMpIwWZ4yNDMm8gngKkv4nNPg2
 xuU/cFtIksTudhmYIOWylpWuVrqZwOBDlU0iYrbDHiDAxc2mG43EIBUbTWg2BLlMTmR8
 Al4Qo8O+jPMDYF+ZH38C+wJCameaRZVaZQOCKZs4MT3thvc3aFPPgvvbDiWDDzEgH+U/
 s2RjJpgMuMhlCvlbl+tiyzOs5DNHYvuS5y4ri2V8jjh2B7A41FewPEgXx2qEUDrnSmPX
 33vp8sn/kqY+XgaVoLNK1KeRL78FJ2+wrkK/iVsxFpnLfLsSESg/sZJmg+UnXHPhtSkq
 iMtA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Fd/Pentf
Subject: [Buildroot] [PATCH 2/3] package/python-sqlalchemy: add cython for
 python-sqlalchemy
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+CgpXaGVuIG1p
Z3JhdGluZyB0byBzZXR1cHRvb2xzIHdpdGggcGVwNTE3IHN1cHBvcnQgd2UgbmVlZCB0byBhZGQK
aG9zdC1weXRob24tY3l0aG9uIHdoaWNoIGlzIGEgcGVwNTE3IGJ1aWxkIGRlcGVuZGVuY3kgZm9y
CnB5dGhvbi1zcWxhbGNoZW15LgoKU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVz
LmhpbGxpYXJkMUBnbWFpbC5jb20+ClRlc3RlZC1CeTogRmzDoXZpbyBUYXBhasOzcyA8Zmxhdmlv
LnRhcGFqb3NAbmV3dGVzYy5jb20uYnI+ClNpZ25lZC1vZmYtYnk6IEZsw6F2aW8gVGFwYWrDs3Mg
PGZsYXZpby50YXBham9zQG5ld3Rlc2MuY29tLmJyPgotLS0KIHBhY2thZ2UvcHl0aG9uLXNxbGFs
Y2hlbXkvcHl0aG9uLXNxbGFsY2hlbXkubWsgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNx
bGFsY2hlbXkubWsgYi9wYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15
Lm1rCmluZGV4IDE3N2U3ZjhhMzguLjFmY2RhMzM4ZDMgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0
aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNxbGFsY2hlbXkubWsKKysrIGIvcGFja2FnZS9weXRob24t
c3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5tawpAQCAtMTIsNSArMTIsNiBAQCBQWVRIT05f
U1FMQUxDSEVNWV9MSUNFTlNFID0gTUlUCiBQWVRIT05fU1FMQUxDSEVNWV9MSUNFTlNFX0ZJTEVT
ID0gTElDRU5TRQogUFlUSE9OX1NRTEFMQ0hFTVlfQ1BFX0lEX1ZFTkRPUiA9IHNxbGFsY2hlbXkK
IFBZVEhPTl9TUUxBTENIRU1ZX0NQRV9JRF9QUk9EVUNUID0gc3FsYWxjaGVteQorUFlUSE9OX1NR
TEFMQ0hFTVlfREVQRU5ERU5DSUVTID0gaG9zdC1weXRob24tY3l0aG9uCiAKICQoZXZhbCAkKHB5
dGhvbi1wYWNrYWdlKSkKLS0gCjIuNDQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
