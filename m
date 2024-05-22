Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D104FC25B77
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 07:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E09582086;
	Wed, 22 May 2024 07:03:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6iAlG1O2Mzy3; Wed, 22 May 2024 07:03:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF0CD81EA2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF0CD81EA2;
	Wed, 22 May 2024 07:02:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B36BD1C5858
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F3C960872
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:02:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dEH2RIrXACY7 for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 07:02:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 582AA60851
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 582AA60851
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 582AA60851
 for <buildroot@buildroot.org>; Wed, 22 May 2024 07:02:49 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5731ffcc905so10889223a12.2
 for <buildroot@buildroot.org>; Wed, 22 May 2024 00:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716361367; x=1716966167;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J8QxtZpzTcjGG+oRZ9JSw66OD0qcS8ljXwjBF2rY3Yg=;
 b=uxQ/2KUIT89CVZxeCucZ4+u83QkzjrGH+clxVg67mCqD5830fJGegz8M89VU2eXpHV
 LCIC60EoUCcPC5KS3iJf25Oaot/OCLXM7xCxK2Qoj/OoMejqpuBuaZH4vB13ZXfZ1JV0
 y2dVPG9DBhoslBzsuhn39XVJEFtjUpDm6lLhxfkW5+jWkg7EQd4QMpAlHpCNlkPUQmgE
 Zq4FzDR4ZQJ5Nk02mxVhuDMlc5eCdb3a0XuAJZebNuDXVDWGS+xQyIeksV0t2O/8GeF7
 U+R3GVf67YruMqnHcVfcXNlVR9dXHUuP/eCN63HcM05dNPoSNt04NXi1T1Q1Vm3Q6eju
 m2oQ==
X-Gm-Message-State: AOJu0YxiCLQrtHaZPikUhwlO85rDc9Yeqll3hZWpFbEzYg5uLXF2Uy8I
 SvcT8MMvm7/+TvC6tOIwd+O+AeQbkPVhpOue5mh1WcXYnfAQu15SeDtwYZhD7Tjoo4IVz/OzRKE
 jn7E=
X-Google-Smtp-Source: AGHT+IEoc+/v3yHuG5u+a7YN/0722pLzsyKEMnXeVGEsKihd3XpJcu60kE/yS7g2jv/HBcdHGYH+VA==
X-Received: by 2002:a50:8e14:0:b0:56e:34e0:4699 with SMTP id
 4fb4d7f45d1cf-57832be2ef7mr796154a12.30.1716361366902; 
 Wed, 22 May 2024 00:02:46 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.196])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574d738c80csm12028365a12.81.2024.05.22.00.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 00:02:46 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 09:02:21 +0200
Message-ID: <20240522070238.3282121-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
References: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1716361367; x=1716966167;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J8QxtZpzTcjGG+oRZ9JSw66OD0qcS8ljXwjBF2rY3Yg=;
 b=G5S5N9XCwwCwOzTWYEq+FNhpfFleqwKvXcg7Vvhwk585eTvl19XuuQvvLu2v5TJqGY
 sWnFayi6cSNyE0iHB04Be/RmfEvPgsLfN+Qi/BU3dVbhNd8lciHS7bv1iniBvOGlH0EF
 +3fiANexEnoyZeMIynboZ91mPcskji7JCQJgU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=G5S5N9XC
Subject: [Buildroot] [PATCH v2 02/18] board/pine64/rock64: make the patches
 to be applied with fuzz 0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Romain Naour <romain.naour@gmail.com>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBjb21taXQgYWxsb3dzIHRoZSBVLUJvb3QgcGF0Y2ggdG8gYmUgYXBwbGllZCB3aXRoIGZ1
enogZmFjdG9yIDAuClRoZSBmdXp6IGZhY3RvciBzcGVjaWZpZXMgaG93IG1hbnkgbGluZXMgb2Yg
dGhlIHBhdGNoIGNhbiBiZSBpbmV4YWN0bHkKbWF0Y2hlZCwgc28gdGhlIHZhbHVlIDAgcmVxdWly
ZXMgYWxsIGxpbmVzIHRvIGJlIGV4YWN0bHkgbWF0Y2hlZC4KClNpZ25lZC1vZmYtYnk6IERhcmlv
IEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KLS0tCiAuLi4z
MzI4LW5lZWRzLWl0Yi1pbWFnZS10by1ib290LXByb3Blcmx5LnBhdGNoIHwgMTggKysrKysrKysr
Ky0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9ib2FyZC9waW5lNjQvcm9jazY0L3BhdGNoZXMvdWJvb3QvMDAwMS1N
YWtlZmlsZS1yazMzMjgtbmVlZHMtaXRiLWltYWdlLXRvLWJvb3QtcHJvcGVybHkucGF0Y2ggYi9i
b2FyZC9waW5lNjQvcm9jazY0L3BhdGNoZXMvdWJvb3QvMDAwMS1NYWtlZmlsZS1yazMzMjgtbmVl
ZHMtaXRiLWltYWdlLXRvLWJvb3QtcHJvcGVybHkucGF0Y2gKaW5kZXggMmQzNWI3OGRhYWYyLi43
Yzg0NzM2MDM0NTcgMTAwNjQ0Ci0tLSBhL2JvYXJkL3BpbmU2NC9yb2NrNjQvcGF0Y2hlcy91Ym9v
dC8wMDAxLU1ha2VmaWxlLXJrMzMyOC1uZWVkcy1pdGItaW1hZ2UtdG8tYm9vdC1wcm9wZXJseS5w
YXRjaAorKysgYi9ib2FyZC9waW5lNjQvcm9jazY0L3BhdGNoZXMvdWJvb3QvMDAwMS1NYWtlZmls
ZS1yazMzMjgtbmVlZHMtaXRiLWltYWdlLXRvLWJvb3QtcHJvcGVybHkucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDIxMWJmMDQ5MDg0ZTZlMzc0ZGFjMjUzMTM4ZmE4MTM2ODI5MTAxNDYgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGQzMTJjNGU0MGJmODE2ODIzYmRjZmQwNjZkZDI1
MTFiMjNlODNjOWMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiA9P1VURi04P3E/TWlj
aGE9QzU9ODI9MjA9QzU9ODF5c3pjemVrPz0gPG1pY2hhbC5seXN6Y3pla0Bib2ZjLnBsPgogRGF0
ZTogVHVlLCA1IEZlYiAyMDE5IDIyOjA4OjU0ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIE1ha2Vm
aWxlOiByazMzMjggbmVlZHMgaXRiIGltYWdlIHRvIGJvb3QgcHJvcGVybHkKQEAgLTcsMTYgKzcs
MTggQEAgQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CiBDb250ZW50LVRy
YW5zZmVyLUVuY29kaW5nOiA4Yml0CiAKIFNpZ25lZC1vZmYtYnk6IE1pY2hhxYIgxYF5c3pjemVr
IDxtaWNoYWwubHlzemN6ZWtAYm9mYy5wbD4KK1tEYXJpbzogbWFrZSB0aGUgcGF0Y2ggdG8gYmUg
YXBwbGllZCB3aXRoIGZ1enogZmFjdG9yIDBdCitTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2No
aSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+CiAtLS0KICBNYWtlZmlsZSB8
IDUgKysrKysKICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQg
YS9NYWtlZmlsZSBiL01ha2VmaWxlCi1pbmRleCA4MDg2ZjNjOTNlLi5hNjQyNWI1YjAzIDEwMDY0
NAoraW5kZXggMTQ5ZjgzOTk0ODE0Li5lYmJkZjI1OTZiOWIgMTAwNjQ0CiAtLS0gYS9NYWtlZmls
ZQogKysrIGIvTWFrZWZpbGUKLUBAIC03OTksNiArNzk5LDExIEBAIGlmbmVxICgkKEJVSUxEX1JP
TSksKQotIEFMTC0kKENPTkZJR19YODZfUkVTRVRfVkVDVE9SKSArPSB1LWJvb3Qucm9tCitAQCAt
OTIzLDYgKzkyMywxMSBAQCBpZmVxICgkKENPTkZJR19TWVNfQ09SRUJPT1QpJChDT05GSUdfU1BM
KSx5eSkKKyBBTEwtJChDT05GSUdfQklOTUFOKSArPSB1LWJvb3QteDg2LXdpdGgtc3BsLmJpbgog
IGVuZGlmCiAgCiArIyByazMzMjggbmVlZHMgaXRiIGltYWdlIHRvIGJvb3QgcHJvcGVybHkKQEAg
LTI0LDkgKzI2LDkgQEAgaW5kZXggODA4NmYzYzkzZS4uYTY0MjViNWIwMyAxMDA2NDQKICtBTEwt
eSArPSB1LWJvb3QuaXRiCiArZW5kaWYKICsKLSAjIGVuYWJsZSBjb21iaW5lZCBTUEwvdS1ib290
L2R0YiBydWxlcyBmb3IgdGVncmEKLSBpZmVxICgkKENPTkZJR19URUdSQSkkKENPTkZJR19TUEwp
LHl5KQotIEFMTC15ICs9IHUtYm9vdC10ZWdyYS5iaW4gdS1ib290LW5vZHRiLXRlZ3JhLmJpbgor
ICMgQnVpbGQgYSBjb21iaW5lZCBzcGwgKyB1LWJvb3QgaW1hZ2UgZm9yIHN1bnhpCisgaWZlcSAo
JChDT05GSUdfQVJDSF9TVU5YSSkkKENPTkZJR19TUEwpLHl5KQorIEFMTC15ICs9IHUtYm9vdC1z
dW54aS13aXRoLXNwbC5iaW4KIC0tIAotMi4xOC4xCisyLjQzLjAKIAotLSAKMi40My4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
