Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E91C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 13:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B86F84AB4;
	Sat, 23 Jul 2022 13:35:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B86F84AB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Rl6AR8Gt__G; Sat, 23 Jul 2022 13:35:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38675848BA;
	Sat, 23 Jul 2022 13:35:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38675848BA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 23FD11BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF51460FE7
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:35:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF51460FE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uTRKWhwojMRQ for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 13:35:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18C6360B59
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18C6360B59
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 13:35:34 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d8so9886541wrp.6
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 06:35:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+c8SAc2Qn4NByFXDaYAhVuYhp1RkbrZTZcAzhqozTn8=;
 b=mf7/ymL+OQZI/agtundKtKUmL2sMTiJRA6xr6e/dywu5vLFY85AES7rSxZ0epQWh6j
 WFFaFebpqw3LBVhmK/B1tHehV8ZjXYyqeteuzmCP13Ml7jBpRAxMh+oT7yqn52JubbCu
 6GI84KNNxcL73ACkQWQDDubFKR6qxDlYkmj6AX1Ld1K8LzIAwjG123Qet2W4JAGvKtW/
 /SNeIFoZyPsAPWM3SmlKMUyoRQBX2pa0VmnpkUtkFVC+oeBVFgxrCrR5Cf8mQcHZryCF
 nCZMNNoGWGVN8uAMHUxxvIn7vRktYD1+p4+5F77+/1vzBUSNM8jWTUb8Iu2vCeW0j4oH
 N10A==
X-Gm-Message-State: AJIora/0rDiyS/HlColl1aKJ0TOKqPUZjvnuN817jjmqLkthzdK6CMs7
 i3aYDC8LoNeIiydlwu5IglvGgOGg+37Qww==
X-Google-Smtp-Source: AGRyM1sj3THpjaWSeY9KSpAhzPQuJtZEKMyz6D/eD3c7WQ5kkV4lSFlcQw3pXAQrfwcdji/Li2rg6A==
X-Received: by 2002:a5d:456c:0:b0:21e:40f5:aaef with SMTP id
 a12-20020a5d456c000000b0021e40f5aaefmr2879526wrc.396.1658583332135; 
 Sat, 23 Jul 2022 06:35:32 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 j11-20020adfe50b000000b0021e4a4fc017sm6923887wrm.34.2022.07.23.06.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 06:35:31 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 15:35:25 +0200
Message-Id: <20220723133525.279819-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20220723133525.279819-1-romain.naour@smile.fr>
References: <20220723133525.279819-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+c8SAc2Qn4NByFXDaYAhVuYhp1RkbrZTZcAzhqozTn8=;
 b=D8aOfQ+ITXLs8XbjMo91k5EI2NHzY/ATptpczgNZkGrrQ/7aJGicefLuCaqhLqBXfv
 krV1J9DsSI32CMM9gqqPvLXblfEleij565ef5I7OYl6npgWy2mPoQTraw1erWrX1/ySh
 MQuJZGonYee5zzNr2Yovyw6kP9Vof/JpFtc/CaRWw3SsZhJMCRar9Icp9JgR4Ah3Sxfe
 cZDB8+7VyWZQUs6kpeeL1CFPpJxhuxSnllqDyf1BwcPQCl8kKeeGFtF5LBbT9fI2/JhV
 nCqsxrvqvIYImI/FyPV9PXnSh3FuX42jlBjT5ciCnui7y2YyLoA5cpJLLH2G4Yf1MsQW
 Wi1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=D8aOfQ+I
Subject: [Buildroot] [PATCHv2 2/2] package/gcc: disable libsanitizer for
 mips64{el} w/ n32 ABI
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgoKbGlic2FuaXRpemVy
IGhhcyBiZWVuIGVuYWJsZWQgZm9yIG1pcHM2NHtlbH0gaW4gZ2NjIDEyIFsxXSBidXQgaXQKZmFp
bCB0byBidWlsZCB3aGVuIG4zMiBBQkkgaXMgdXNlZDoKCkluIGZpbGUgaW5jbHVkZWQgZnJvbSBv
dXRwdXQvbWlwczY0ZWwtYnVpbGRyb290LWxpbnV4LWdudS9zeXNyb290L3Vzci9pbmNsdWRlL2Jp
dHMvc3RhdC5oOjI1LAogICAgICAgICAgICAgICAgIGZyb20gb3V0cHV0L21pcHM2NGVsLWJ1aWxk
cm9vdC1saW51eC1nbnUvc3lzcm9vdC91c3IvaW5jbHVkZS9mY250bC5oOjc4LAogICAgICAgICAg
ICAgICAgIGZyb20gLi4vLi4vLi4vLi4vbGlic2FuaXRpemVyL3Nhbml0aXplcl9jb21tb24vc2Fu
aXRpemVyX2xpbnV4LmNwcDo1NToKb3V0cHV0L21pcHM2NGVsLWJ1aWxkcm9vdC1saW51eC1nbnUv
c3lzcm9vdC91c3IvaW5jbHVkZS9iaXRzL3N0cnVjdF9zdGF0Lmg6MTkwOjg6IGVycm9yOiByZWRl
ZmluaXRpb24gb2Yg4oCYc3RydWN0IHN0YXQ2NOKAmQogIDE5MCB8IHN0cnVjdCBzdGF0NjQKICAg
ICAgfCAgICAgICAgXn5+fn5+CgpJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi4vLi4vLi4vLi4vbGli
c2FuaXRpemVyL3Nhbml0aXplcl9jb21tb24vc2FuaXRpemVyX2xpbnV4LmNwcDo0OToKb3V0cHV0
L21pcHM2NGVsLWJ1aWxkcm9vdC1saW51eC1nbnUvc3lzcm9vdC91c3IvaW5jbHVkZS9hc20vc3Rh
dC5oOjUyOjg6IG5vdGU6IHByZXZpb3VzIGRlZmluaXRpb24gb2Yg4oCYc3RydWN0IHN0YXQ2NOKA
mQogICA1MiB8IHN0cnVjdCBzdGF0NjQgewogICAgICB8ICAgICAgICBefn5+fn4KCkRpc2FibGUg
bGlic2FuaXRpemVyIGZvciBtaXBzNjQgd2l0aCBuMzIgQUJJLgoKTm90ZTogT25seSBnbGliYyB0
b29sY2hhaW5zIGFyZSBhZmZlY3RlZCBzaW5jZSBsaWJzYW5pdGl6ZXIgaXMKZGlzYWJsZWQgZm9y
IG11c2wgYW5kIHVDbGliYy1uZyB0b29sY2hhaW5zIFsyXS4KCkZpeGVzOgpodHRwczovL2dpdGxh
Yi5jb20va3VidTkzL3Rvb2xjaGFpbnMtYnVpbGRlci8tL2pvYnMvMjUxMDE3ODY1MQoKWzFdIGh0
dHBzOi8vZ2NjLmdudS5vcmcvZ2l0Lz9wPWdjYy5naXQ7YT1jb21taXRkaWZmO2g9MzQ0ZTZmOWYy
YWJjZmY5YjJiYjRiMjZiNjkzYmU0YTU5OTI3MmY0MwpbMl0gaHR0cHM6Ly9naXQuYnVpbGRyb290
Lm5ldC9idWlsZHJvb3QvY29tbWl0Lz9pZD01ZjRkNjU4ZDg4OGI1MzlkZTlhNjI0N2FlNWIxYTA5
OTlkZTVkNGVjCgpTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFp
bC5jb20+Ci0tLQp2MjogZml4ICJpZiIgY2xhdXNlczoKICAgIGh0dHA6Ly9saXN0cy5idXN5Ym94
Lm5ldC9waXBlcm1haWwvYnVpbGRyb290LzIwMjItSnVseS82NDY3MDAuaHRtbAotLS0KIHBhY2th
Z2UvZ2NjL2djYy5tayB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ2NjL2djYy5tayBiL3BhY2thZ2UvZ2NjL2djYy5tawpp
bmRleCAxMjhjZjg0MjFkLi4yODkyZjQ1NmNjIDEwMDY0NAotLS0gYS9wYWNrYWdlL2djYy9nY2Mu
bWsKKysrIGIvcGFja2FnZS9nY2MvZ2NjLm1rCkBAIC0xMzUsNiArMTM1LDEzIEBAIGlmZXEgKCQo
QlIyX3NwYXJjKSQoQlIyX3NwYXJjNjQpLHkpCiBIT1NUX0dDQ19DT01NT05fQ09ORl9PUFRTICs9
IC0tZGlzYWJsZS1saWJzYW5pdGl6ZXIKIGVuZGlmCiAKKyMgbGlic2FuaXRpemVyIGlzIGF2YWls
YWJsZSBmb3IgbWlwczY0e2VsfSBzaW5jZSBnY2MgMTIgYnV0IGZhaWwgdG8gYnVpbGQKKyMgd2l0
aCBuMzIgQUJJIGR1ZSB0byBzdHJ1Y3Qgc3RhdDY0IGRlZmluaXRpb24gY2xhc2ggZHVlIHRvIG1p
eGluZworIyBrZXJuZWwgYW5kIHVzZXIgaGVhZGVycy4KK2lmZXEgKCQoQlIyX21pcHM2NCkkKEJS
Ml9taXBzNjRlbCk6JChCUjJfTUlQU19OQUJJMzIpLHk6eSkKK0hPU1RfR0NDX0NPTU1PTl9DT05G
X09QVFMgKz0gLS1kaXNhYmxlLWxpYnNhbml0aXplcgorZW5kaWYKKwogIyBUaGUgbG9naWMgaW4g
bGliYmFja3RyYWNlL2NvbmZpZ3VyZS5hYyB0byBkZXRlY3QgaWYgX19zeW5jIGJ1aWx0aW5zCiAj
IGFyZSBhdmFpbGFibGUgYXNzdW1lcyB0aGV5IGFyZSBhcyBzb29uIGFzIHRhcmdldF9zdWJkaXIg
aXMgbm90CiAjIGVtcHR5LCBpLmUgd2hlbiBjcm9zcy1jb21waWxpbmcuIEhvd2V2ZXIsIHNvbWUg
cGxhdGZvcm1zIGRvIG5vdCBoYXZlCi0tIAoyLjM0LjMKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
