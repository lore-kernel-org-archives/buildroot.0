Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235B4C07E97
	for <buildroot@archiver.kernel.org>; Tue,  5 Dec 2023 16:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80FC64352A;
	Tue,  5 Dec 2023 16:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80FC64352A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DAhdDz_1o5Qd; Tue,  5 Dec 2023 16:36:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9185F4355F;
	Tue,  5 Dec 2023 16:36:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9185F4355F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 86F781BF279
 for <buildroot@lists.busybox.net>; Tue,  5 Dec 2023 16:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6001481E66
 for <buildroot@lists.busybox.net>; Tue,  5 Dec 2023 16:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6001481E66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oticHv-cdgKT for <buildroot@lists.busybox.net>;
 Tue,  5 Dec 2023 16:36:06 +0000 (UTC)
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C7A981E5A
 for <buildroot@buildroot.org>; Tue,  5 Dec 2023 16:36:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C7A981E5A
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-58d956c8c38so3893793eaf.2
 for <buildroot@buildroot.org>; Tue, 05 Dec 2023 08:36:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701794165; x=1702398965;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ADArWn61Ra3Uoq5SOQoNmKnanBmMtEyq4UGBoNnq7kw=;
 b=UClmPzl2ut6Ju5jygHt7VRIKZUxwK1S9t7thpGVM33bcDV/xySt7SrfBk/7o/MIVaf
 77ayNGLpFc1LnOPT+uo4eENGglw0tU0kAHdaNWlNo4Xaspd8r1TNqYl8sXOyr6kU/R13
 HNk+7RMrHGErizpBBp9MtBrcv9AWxsONw7SStGeh2Gl7VWsj75vB9WwNazRNdZTW9DJn
 ybcG9xx02opPG6FTR4cYqT8vlzGGNURgIODkUSy80BRtIF8i8zKA6nm/ZXwQ6igzUbkX
 pTFLFWEVztGPtk7QuFsDl46iJqaPl8JrWT6xLLQdydbZQgnNoUlLcHhupKf7m2X1jB3t
 bXgw==
X-Gm-Message-State: AOJu0YyS66YLs5iVy0Eo6vq9bWhfuv8hQXV88V5Vv2vCpyad1gGkk+bX
 ngRy0VGUOzSej8P44s2GEmgV+rI/N8z7uhaUj34Peg==
X-Google-Smtp-Source: AGHT+IFcBkfmAldE/Yrd2GACP+hho/IInA8fdwmlghh3FpCG2aIm9RHUU7JcrFNxB4JSfne0hYuOuw==
X-Received: by 2002:a05:6359:291:b0:170:17ea:f4f0 with SMTP id
 ek17-20020a056359029100b0017017eaf4f0mr5649164rwb.61.1701794164846; 
 Tue, 05 Dec 2023 08:36:04 -0800 (PST)
Received: from alesmao.newtesc.com ([187.120.6.114])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a628101000000b006ce75e0ef83sm1179261pfd.179.2023.12.05.08.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 08:36:04 -0800 (PST)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Tue,  5 Dec 2023 13:35:41 -0300
Message-ID: <20231205163541.1839475-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1701794165; x=1702398965;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ADArWn61Ra3Uoq5SOQoNmKnanBmMtEyq4UGBoNnq7kw=;
 b=er4NxSp+UFJzDFzdeih9CaQTZeQHOkKQ8Maz6D0nfeFDfvLBzGeg9cqanfTwZGUizp
 4RrPdVpO4lT2OQzx0BzlkayKA9vjmBX0AguoGz1fBXKGi9SZPcwJXNQckZHxfWXRuMF4
 geIPifsf483INha8MEaQmyiEA4MNCKJ1sr0VtBEEOJlxR04Rr1GienLJ4B570g4n3yWK
 Ktkxv4vG05bn31TOt1oZB6xAMmnKTSMVsrUjACp3Z1gAyPqLPYx67MVQZmTUW83gKhin
 eKatmDWGrPlOhT1d8ZHBwfugxqyie6nIP5N7fATC1hShVeTk07/1YIF3LIFFUo7lT4E+
 doAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=er4NxSp+
Subject: [Buildroot] [PATCH 1/1] configs/asus_tinker-s_rk3288: bump Linux to
 6.1.65 and U-boot to 2023.10
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogRmzDoXZpbyBUYXBhasOzcyA8ZmxhdmlvLnRhcGFqb3NAbmV3dGVzYy5j
b20uYnI+Ci0tLQogY29uZmlncy9hc3VzX3Rpbmtlci1zX3JrMzI4OF9kZWZjb25maWcgfCA0ICsr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvY29uZmlncy9hc3VzX3Rpbmtlci1zX3JrMzI4OF9kZWZjb25maWcgYi9jb25maWdz
L2FzdXNfdGlua2VyLXNfcmszMjg4X2RlZmNvbmZpZwppbmRleCA5NmZjNzllZTg1Li43MDgyODY5
ODgxIDEwMDY0NAotLS0gYS9jb25maWdzL2FzdXNfdGlua2VyLXNfcmszMjg4X2RlZmNvbmZpZwor
KysgYi9jb25maWdzL2FzdXNfdGlua2VyLXNfcmszMjg4X2RlZmNvbmZpZwpAQCAtMTAsNyArMTAs
NyBAQCBCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzZfMT15CiBCUjJfVEFS
R0VUX1VCT09UPXkKIEJSMl9UQVJHRVRfVUJPT1RfQlVJTERfU1lTVEVNX0tDT05GSUc9eQogQlIy
X1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTj15Ci1CUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9W
RVJTSU9OX1ZBTFVFPSIyMDIzLjA0IgorQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTl9W
QUxVRT0iMjAyMy4xMCIKIEJSMl9UQVJHRVRfVUJPT1RfQk9BUkRfREVGQ09ORklHPSJ0aW5rZXIt
cy1yazMyODgiCiBCUjJfVEFSR0VUX1VCT09UX05FRURTX0RUQz15CiBCUjJfVEFSR0VUX1VCT09U
X05FRURTX1BZVEhPTjM9eQpAQCAtMjMsNyArMjMsNyBAQCBCUjJfVEFSR0VUX1VCT09UX1NQTF9O
QU1FPSJzcGwvdS1ib290LXNwbC1kdGIuYmluIHRwbC91LWJvb3QtdHBsLmJpbiIKICMgS2VybmVs
CiBCUjJfTElOVVhfS0VSTkVMPXkKIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQot
QlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi4xLjM4IgorQlIyX0xJTlVY
X0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi4xLjY1IgogQlIyX0xJTlVYX0tFUk5FTF9E
RUZDT05GSUc9Im11bHRpX3Y3IgogQlIyX0xJTlVYX0tFUk5FTF9VSU1BR0U9eQogQlIyX0xJTlVY
X0tFUk5FTF9VSU1BR0VfTE9BREFERFI9IjB4MDIwMDAwMDAiCi0tIAoyLjQzLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
