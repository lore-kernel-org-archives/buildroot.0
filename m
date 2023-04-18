Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEDD2C77B75
	for <buildroot@archiver.kernel.org>; Tue, 18 Apr 2023 09:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1CDC408B2;
	Tue, 18 Apr 2023 09:44:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1CDC408B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lL8dRZrzAqDj; Tue, 18 Apr 2023 09:44:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFF154187E;
	Tue, 18 Apr 2023 09:44:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFF154187E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 831DF1C425C
 for <buildroot@lists.busybox.net>; Tue, 18 Apr 2023 09:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C98241176
 for <buildroot@lists.busybox.net>; Tue, 18 Apr 2023 09:43:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C98241176
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CKZPhGNmTeLW for <buildroot@lists.busybox.net>;
 Tue, 18 Apr 2023 09:43:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2A0840135
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C2A0840135
 for <buildroot@buildroot.org>; Tue, 18 Apr 2023 09:43:54 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id a5so15030680ejb.6
 for <buildroot@buildroot.org>; Tue, 18 Apr 2023 02:43:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681811032; x=1684403032;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lYwhUc0JsHY7TgugMLP9oyHh9lg/vchXVbG1roj4Axs=;
 b=a+NGMSyPk2HY/3xA6SCoK01GAKRlMO4pwEeb/gARTalMOxnwi187Lf0RYOOqrmCCi7
 QqbzLO35v+17KhWcOZBNdjNaPgYUysxtdYmv6RVVh66Tlc1NiiVLRoYFecLJ0fPjNUTw
 lkYG9lCHkQM6MhD/THaPRO1Ea0ke9ZpwxMXvgKZuK+URBF3gnsNAh35vkOctwG9KuvOt
 TQyDr8AkNVp46IjbKiJ/xw1bfhtyVfMJl/N2jxSSJzHNWfoMiDT7cVy/Hx1gYDZYj93o
 W1Sb+E4pzQ+BIn7cibtiBpI7rbl7LQAtra2B9+KIyF2RsYhembkZwPJYw277NaP1JBdB
 krAg==
X-Gm-Message-State: AAQBX9cZ4iKxdWIAllb706IT5sWwcTjOCJ+KRVJVdPwjI9CWxqFFjvFs
 ug8Q+rwNHm/mbIMufAr82VST9XFiGHJFQPP0urs9MQ==
X-Google-Smtp-Source: AKy350aJ7lf0c1egF/Llj812upkMjb2ilKioZB5OoSuK+CMcnYDdLt3plVMeA6MJnPQ7KyUdez9FGg==
X-Received: by 2002:a17:906:25cc:b0:94f:377f:4b21 with SMTP id
 n12-20020a17090625cc00b0094f377f4b21mr8711513ejb.63.1681811032599; 
 Tue, 18 Apr 2023 02:43:52 -0700 (PDT)
Received: from junian.fritz.box (94.105.100.233.dyn.edpnet.net.
 [94.105.100.233]) by smtp.gmail.com with ESMTPSA id
 d9-20020a17090648c900b0094f4f2db7e0sm3714208ejt.143.2023.04.18.02.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 02:43:52 -0700 (PDT)
From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
To: buildroot@buildroot.org
Date: Tue, 18 Apr 2023 11:43:16 +0200
Message-Id: <20230418094317.2236091-2-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230418094317.2236091-1-raphael.melotte@mind.be>
References: <20230418094317.2236091-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681811032; x=1684403032;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lYwhUc0JsHY7TgugMLP9oyHh9lg/vchXVbG1roj4Axs=;
 b=WvoldLifOV6cXfI1BPB2BLubZzsAtPDSHRvvnyxKIPjbgxqSmQetBDMCz2LQtQaVzd
 +B2cMJyIbvbI2wjHa6RW2olqN1GDDafArtSW/aFbHX0aQIP50rDNDQ7l5tuU5swFrEdX
 eFmhoil6vmDQM29L6l/+9eRmo8UkKzGgFW4QvQgJwcwpZcUZsgASC42XE3IENZNc/Wzy
 DecUDxNwsD0xA2T4/F3veajtKYQbDIIiRzjTVDMJzWFyd09wZll+kSLC9zrclTpcWhWp
 C3LGFLT+sX4YKy6Zh3lHDMjbWAxh4TFBbaHVPMf0NmScWqcVURjSokzqGHaQ5U/2ZgDz
 dfsg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WvoldLif
Subject: [Buildroot] [PATCH 2/2]
 support/testing/tests/package/test_python_botocore.py: increase timeout
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2l0aCB0aGUgY3VycmVudCBweXRob24tYm90b2NvcmUgdmVyc2lvbiwgdGhlIHRlc3QgdGltZXMg
b3V0IG9uCm1hY2hpbmVzIG9uIHdoaWNoIGl0IHdhcyBwYXNzaW5nIHdpdGggcHJldmlvdXMgdmVy
c2lvbnMuIEluY3JlYXNlIHRoZQp0aW1lb3V0IHNvIHRoYXQgdGhlIHRlc3QgY2FuIGJlIHJ1biB3
aXRob3V0IHVzaW5nIGEgdGltZW91dAptdWx0aXBsaWVyLgoKU2lnbmVkLW9mZi1ieTogUmFwaGHD
q2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgotLS0KIHN1cHBvcnQvdGVzdGlu
Zy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX2JvdG9jb3JlLnB5IHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvc3VwcG9y
dC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fYm90b2NvcmUucHkgYi9zdXBwb3J0
L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9ib3RvY29yZS5weQppbmRleCA0OGMy
ZjNjYzAyLi5mMTIzOTkzYzA4IDEwMDY0NAotLS0gYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFj
a2FnZS90ZXN0X3B5dGhvbl9ib3RvY29yZS5weQorKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMv
cGFja2FnZS90ZXN0X3B5dGhvbl9ib3RvY29yZS5weQpAQCAtMTIsNyArMTIsNyBAQCBjbGFzcyBU
ZXN0UHl0aG9uUHkzQm90b2NvcmUoVGVzdFB5dGhvblBhY2thZ2VCYXNlKToKICAgICAgICAgQlIy
X1RBUkdFVF9ST09URlNfRVhUMl9TSVpFPSIxMjBNIgogICAgICAgICAiIiIKICAgICBzYW1wbGVf
c2NyaXB0cyA9IFsidGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX2JvdG9jb3JlLnB5Il0KLSAg
ICB0aW1lb3V0ID0gMTAKKyAgICB0aW1lb3V0ID0gMzAKIAogICAgIGRlZiBsb2dpbihzZWxmKToK
ICAgICAgICAgZXh0Ml9maWxlID0gb3MucGF0aC5qb2luKHNlbGYuYnVpbGRkaXIsICJpbWFnZXMi
LCAicm9vdGZzLmV4dDIiKQotLSAKMi4zNy4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
