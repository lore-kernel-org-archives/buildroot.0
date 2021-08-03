Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC1FC4320A
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 12:07:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7C8960EE8
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 12:07:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D7C8960EE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84AED4026B;
	Tue,  3 Aug 2021 12:07:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V_dXp_TE5XZ0; Tue,  3 Aug 2021 12:07:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3B714020D;
	Tue,  3 Aug 2021 12:07:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 486901BF29F
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 12:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 456ED606E9
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 12:07:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u8bb2ONdBuOG for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 12:07:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9BAD560639
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 12:07:24 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id c16so25034507wrp.13
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 05:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VXGs+Zz/PRbRYBwASfFU4c3gu8XPMJoTFEJZU+lty1Y=;
 b=A/2r3tEfbZxunvsvft5wbJH3sS5yWwHpHQqUfw1VqUQdoWIDvZtnpeYeZovjVc1g0P
 l6EH8mXcWOKSIjfjYcpk4u7WDcn5rPqq2WBvs+qlxOstvb+ldJlDTVXMbtlLPikQ0LmD
 rbNADC0TIin8vgzzseHfIgRrHcUyvv+aD+kleVfcwk8v9P2ObHsw39k3WpUbqIMjoKqR
 SvXIGzGuKjgXgWcun+FTOHlbh3N9K1Lre2czyt26Fsryg+kTw1WSFwSvWeZMI8TMwaTv
 +qRf1ncSIvrl4ftH7PTWMlPf+Ge0KhGWK4UU916QfH+4ECylCEqAbqzJeFHRAn35LkGf
 DipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VXGs+Zz/PRbRYBwASfFU4c3gu8XPMJoTFEJZU+lty1Y=;
 b=pFYcDdy7slLY2pFhFGjYmyQN55k1NB/eIILF8YI6FLoQ7MIFcQXmggCpfmZ4brgj/p
 xxi737fJ6bNsQ0WkJvE2zdIFjpTOIwL/71j+b0oU7Fz9lnupEEI1fe0kNSCxkU5C8p/g
 Ry3EjsNvelGjMOZwoMVFGPEqX3JKhCwmySQlYN3Wa3IcU1b2OkHNaBQk0otqaTwSwsXf
 WPfAq3zkGFJvqf4+ALSDpEAa7+BWRFTAaXhecC9Oep3fAROKcZpBtFldS+lbhJg/AURj
 +xvKpDmqse6vpu6pDJOHczvxpqT7nDJwAVHsP9Ci0B62HrApN4lqCQUARt18z6bmgM+s
 D7rg==
X-Gm-Message-State: AOAM5339FCxeNlGU3Ww8Nh+eu89J5lG6muaQbMin+RbjzD9wIbXbvYvM
 t8fDhXuR2hvtvNnrwH537CXk6EMmzP6Meg==
X-Google-Smtp-Source: ABdhPJxA6tz/VJBKOC+xk9D4d9JUIRZbrlFdoaR36+PTCHGmYGnsqSjiJKEOcoa4cuyDgGSeACwjwg==
X-Received: by 2002:adf:d219:: with SMTP id j25mr22981872wrh.82.1627992442213; 
 Tue, 03 Aug 2021 05:07:22 -0700 (PDT)
Received: from kali.home (pop.92-184-97-255.mobile.abo.orange.fr.
 [92.184.97.255])
 by smtp.gmail.com with ESMTPSA id i5sm14015346wrw.13.2021.08.03.05.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 05:07:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 Aug 2021 14:07:14 +0200
Message-Id: <20210803120714.2797624-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 1/1] package/gpsd: fix workaround for gcc bug 68485
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

V29ya2Fyb3VuZCBmb3IgZ2NjIGJ1ZyA2ODQ4NSBkb2Vzbid0IHdvcmsgYW55bW9yZSBzaW5jZSBi
dW1wIHRvIHZlcnNpb24KMy4yMSBpbiBjb21taXQgNWIzZTcyMTM5OTUyZTBjOTUzYzg2NDljY2E1
NTU3MWNlYzVmMzgzNiBiZWNhdXNlIENYWEZMQUdTCmlzIGFwcGVuZGVkIGFmdGVyIENGTEFHUyBh
bmQgZG9lcyBub3QgY29udGFpbiAtTzA6CgovdG1wL2luc3RhbmNlLTcvb3V0cHV0LTEvaG9zdC9i
aW4vbWljcm9ibGF6ZWVsLWxpbnV4LWdjYyAtbyBydGNtMl9qc29uLm9zIC1jIC0tc3lzcm9vdD0v
dG1wL2luc3RhbmNlLTcvb3V0cHV0LTEvaG9zdC9taWNyb2JsYXplZWwtYnVpbGRyb290LWxpbnV4
LXVjbGliYy9zeXNyb290IC1wdGhyZWFkIC1XYWxsIC1XY2FzdC1hbGlnbiAtV2V4dHJhIC1XaW1w
bGljaXQtZmFsbHRocm91Z2ggLVdtaXNzaW5nLWRlY2xhcmF0aW9ucyAtV21pc3NpbmctcHJvdG90
eXBlcyAtV25vLW1pc3NpbmctZmllbGQtaW5pdGlhbGl6ZXJzIC1Xbm8tdW5pbml0aWFsaXplZCAt
V3BvaW50ZXItYXJpdGggLVdyZXR1cm4tdHlwZSAtV3N0cmljdC1wcm90b3R5cGVzIC1XdmxhIC1P
MCAtT3MgLWcwIC1wdGhyZWFkIC1mUElDIC1EX0xBUkdFRklMRV9TT1VSQ0UgLURfTEFSR0VGSUxF
NjRfU09VUkNFIC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQgLUkvdG1wL2luc3RhbmNlLTcvb3V0cHV0
LTEvaG9zdC9taWNyb2JsYXplZWwtYnVpbGRyb290LWxpbnV4LXVjbGliYy9zeXNyb290L3Vzci9p
bmNsdWRlL2RidXMtMS4wIC1JL3RtcC9pbnN0YW5jZS03L291dHB1dC0xL2hvc3QvbWljcm9ibGF6
ZWVsLWJ1aWxkcm9vdC1saW51eC11Y2xpYmMvc3lzcm9vdC91c3IvbGliL2RidXMtMS4wL2luY2x1
ZGUgcnRjbTJfanNvbi5jCmR1cmluZyBSVEwgcGFzczogcmVsb2FkCnJ0Y20yX2pzb24uYzogSW4g
ZnVuY3Rpb24g4oCYanNvbl9ydGNtMl9yZWFk4oCZOgpydGNtMl9qc29uLmM6MjY3OjE6IGludGVy
bmFsIGNvbXBpbGVyIGVycm9yOiBpbiBnZW5fcmVnX3J0eCwgYXQgZW1pdC1ydGwuYzoxMTU1CiAg
MjY3IHwgfQogICAgICB8IF4KCkl0IHNob3VsZCBiZSBub3RlZCB0aGF0IEdQU0RfQ1hYRkxBR1Mg
d2FzIGFkZGVkIDUgeWVhcnMgYWdvIHdpdGggY29tbWl0CmI0YzA1MGU5YWZlZDdhOGRjMzAyZTZl
MTAxNGNjNGZmYjUwODU5MGQgYnV0IHdhcyBub3QgcmVhbGx5IHVzZWQgc2luY2UKdGhpcyBjb21t
aXQuCgpGaXhlczoKIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvZmFi
MzNmMjViMDhmYTIxOGFmOTE2NDBmZGJkOGMwZGNmMWQwNzIyOAoKU2lnbmVkLW9mZi1ieTogRmFi
cmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Ci0tLQpDaGFuZ2VzIHYx
IC0+IHYyIChhZnRlciByZXZpZXcgb2YgVGhvbWFzIFBldGF6em9uaSk6CiAtIFNldCAtTzAgaW4g
R1BTRF9DWFhGTEFHUyBpbnN0ZWFkIG9mIGZpbHRlcmluZyBvdXQgLU9zCgogcGFja2FnZS9ncHNk
L2dwc2QubWsgfCA1ICsrKystCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9ncHNkL2dwc2QubWsgYi9wYWNrYWdlL2dw
c2QvZ3BzZC5tawppbmRleCAwZmJiNWRmYTFkLi40NWY2ZDM1ZWY4IDEwMDY0NAotLS0gYS9wYWNr
YWdlL2dwc2QvZ3BzZC5taworKysgYi9wYWNrYWdlL2dwc2QvZ3BzZC5tawpAQCAtMTYsNiArMTYs
NyBAQCBHUFNEX0RFUEVOREVOQ0lFUyA9IGhvc3QtcHl0aG9uMyBob3N0LXNjb25zIGhvc3QtcGtn
Y29uZgogCiBHUFNEX0xERkxBR1MgPSAkKFRBUkdFVF9MREZMQUdTKQogR1BTRF9DRkxBR1MgPSAk
KFRBUkdFVF9DRkxBR1MpCitHUFNEX0NYWEZMQUdTID0gJChUQVJHRVRfQ1hYRkxBR1MpCiAKIEdQ
U0RfU0NPTlNfRU5WID0gJChUQVJHRVRfQ09ORklHVVJFX09QVFMpCiAKQEAgLTQ2LDYgKzQ3LDcg
QEAgZW5kaWYKIAogaWZlcSAoJChCUjJfVE9PTENIQUlOX0hBU19HQ0NfQlVHXzY4NDg1KSx5KQog
R1BTRF9DRkxBR1MgKz0gLU8wCitHUFNEX0NYWEZMQUdTICs9IC1PMAogZW5kaWYKIAogIyBJZiBs
aWJ1c2IgaXMgYXZhaWxhYmxlIGJ1aWxkIGl0IGJlZm9yZSBzbyB0aGUgcGFja2FnZSBjYW4gdXNl
IGl0CkBAIC0yMDMsNyArMjA1LDggQEAgZW5kaWYKIEdQU0RfU0NPTlNfRU5WICs9IFwKIAlMREZM
QUdTPSIkKEdQU0RfTERGTEFHUykiIFwKIAlDRkxBR1M9IiQoR1BTRF9DRkxBR1MpIiBcCi0JQ0NG
TEFHUz0iJChHUFNEX0NGTEFHUykiCisJQ0NGTEFHUz0iJChHUFNEX0NGTEFHUykiIFwKKwlDWFhG
TEFHUz0iJChHUFNEX0NYWEZMQUdTKSIKIAogZGVmaW5lIEdQU0RfQlVJTERfQ01EUwogCShjZCAk
KEBEKTsgXAotLSAKMi4zMC4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApo
dHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
