Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F17EC433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 18:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2D94611E5;
	Wed, 16 Mar 2022 18:24:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LXbNac0QKjc4; Wed, 16 Mar 2022 18:24:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC9B760BC6;
	Wed, 16 Mar 2022 18:24:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 436191BF3E0
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 18:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32D7B417D8
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 18:24:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r1dHTTqCm7of for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 18:24:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 78CA3416E1
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 18:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647455081;
 bh=6R1Da+3BMGbglZx9DMv3hbrJeEx/JnmYv8vraasiNAw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=ZzbsZsMFV0jEjkWtu+vx5PpIUJEH+jNZaKTipduJ378ZoAK9uGLZiMRsCGzgQ3ENi
 rHS60P+pD7VKiZ1W37O4HjcqJBsc1vZXt5u/KU/RTMzTOsWZMmDAKg/+/oQ/5EH2Qn
 HB+dASI6sfsN3joiHS30IutPUZAXdn0vwz38akaY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.226]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mlw7V-1numBn3p3r-00j3W6; Wed, 16 Mar 2022 19:24:41 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 19:24:40 +0100
Message-Id: <20220316182440.17393-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:4Jxn87i0FUn1DVFQAHQf+hYucxd8TFv50Cz28fnZ215ELil5sLC
 Nm43surK+VeXedj51fY99LF4bDjN+8I1geRFPj+RXRNRxrJnPssA8F4Rs9sn3Tn+vIjhipI
 pBYI+twL0MS/AKOIaWVAxB7Mvd2vZ21llNAd1Bvm+U5LPy1phj2pWEPU0Cx99jvK7OLitl8
 gLHMydYLOYSXcCiOaTpPA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KwHH38yOE9U=:QKY9PT9xnlMUOcAQ2gZThn
 57ZfJs/N9LsEG+sk9M1/rmzLCbCPIMdgcWWZNlE66k3GHTgiZ8LdTAuA+wLb08t1hFplNEXVm
 Cs8e4+5qYsarOwBEKXZNQEoDLq8ExhaKHIpNAvPeH+xXsn9fQgo1ozIsGbBcPLiIjZVmw2ulx
 cUz8F4jg91x9PhhRn59vQhrrYCiFtE7ZtW2zIo/4DmQCgeV5BiZtpFBRCWC1215+/oc0pkB7E
 fZ4Vi85lqhnhTkFVzC0nLA2OMFN8ChdhWsJJizTXRpP6j66eFqXt2odnoaQVv9AR+B/nU4sef
 wOtoLBCOf8gV69zVdbhkNHw4Ymd8rCRmjnjiB6YUAXaYyDTqTzvfYPftvwAnAWycybzl5Jmzr
 dq5Z2fAWqdnJ9Fy4769yM/jOO6tNEBNdo/Ry/jK3VZAiMftJcZ2UL5klC7oO7gKgt8zNHE7bq
 y+cMaOVOvsSX9bpQrVeD/i+k2h6+mj/B4A9vRt3cdkGzo5tL9H/arM/FJn61YnO6T8M9SqL6V
 k13T4QPfiSF2477KfwtIN/EqotkETZhJslRkHJfaqGd4hNxzFPbiTjfCIPShCCEoKQHGUFBEA
 2tmGw+uhE1iIqhOY/8eutXPydHiH9vGD85wkqdbBU6lFwStdy1CwWIfxc89wT9tEjPfB38UqB
 9eyKsAq3rDDSFDnlRK3OkwsXIxNXYFKUDLIlrfk44BGaLHPQ8Vyj0+hR2JYtmcOrk9BvoJ/v+
 cF6Lu/ezanP0GDWN1Z8+NSObEFH5uvMxtvtk+rMK/kDj15Q1cQS7281cjbw9J53/+cUeli5Hm
 dgNlEjujcmadrdHJ8WgOGGKrduvSoS5qlzir/A4UIavtJOZ3wqchk/YY1Utr/xfDPQSsssUXj
 wkq8+hG7azeszl+LIbb84Z3qSli/TrnLwIthKTs8TSfM0EcsjwJurE6ByoAHBiZXu5YADmLMo
 X+cTUN0I00zzbiF3AWhzWga9yJAA1j7hfXcxaAXs6b/igIV5RouZxP8BQ6QdP/7FmG+Wb9Pvg
 2uWyYdAyrMAJyS+tfAmhY/qN0FRGsitadhU1CPeU7JRG52BYs853v+5vW/vNTLTcxL/1DGbCd
 GbGKRU99k1kLZI=
Subject: [Buildroot] [PATCH v1] package/qt5base: fix eglconvenience compile
 (missing QList include)
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
Cc: Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LSBhZGQgMDAwOC1lZ2xjb252ZW5pZW5jZS1hZGQtbWlzc2luZy1RTGlzdC1pbmNsdWRlLnBhdGNo
IHRvIGZpeAogIGVnbGNvbnZlbmllbmNlIGNvbXBpbGUgKG1pc3NpbmcgUUxpc3QgaW5jbHVkZSkK
CkZpeGVzOgoKICBxZWdsY29udmVuaWVuY2UuY3BwOjQxODoyMzogZXJyb3I6IHZhcmlhYmxlIOKA
mFFMaXN0PFFCeXRlQXJyYXk+IGV4dGVuc2lvbnPigJkgaGFzIGluaXRpYWxpemVyIGJ1dCBpbmNv
bXBsZXRlIHR5cGUKICAgIDQxOCB8ICAgICBRTGlzdDxRQnl0ZUFycmF5PiBleHRlbnNpb25zID0K
ICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+CiAgcWVnbGNvbnZlbmll
bmNlLmNwcDo0MjA6NjU6IGVycm9yOiBpbnZhbGlkIHVzZSBvZiBpbmNvbXBsZXRlIHR5cGUg4oCY
Y2xhc3MgUUxpc3Q8UUJ5dGVBcnJheT7igJkKICAgIDQyMCB8ICAgICAgICAgICAgIChlZ2xRdWVy
eVN0cmluZyhkaXNwbGF5LCBFR0xfRVhURU5TSU9OUykpKS5zcGxpdCgnICcpOwogICAgICAgIHwg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF4KClNpZ25lZC1vZmYtYnk6IFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5l
dD4KLS0tCiAuLi5vbnZlbmllbmNlLWFkZC1taXNzaW5nLVFMaXN0LWluY2x1ZGUucGF0Y2ggfCAz
NyArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcXQ1L3F0NWJhc2UvMDAwOC1lZ2xjb252ZW5pZW5j
ZS1hZGQtbWlzc2luZy1RTGlzdC1pbmNsdWRlLnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9x
dDUvcXQ1YmFzZS8wMDA4LWVnbGNvbnZlbmllbmNlLWFkZC1taXNzaW5nLVFMaXN0LWluY2x1ZGUu
cGF0Y2ggYi9wYWNrYWdlL3F0NS9xdDViYXNlLzAwMDgtZWdsY29udmVuaWVuY2UtYWRkLW1pc3Np
bmctUUxpc3QtaW5jbHVkZS5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAw
MDAwLi5jNzEyNzI5MWU0Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9xdDUvcXQ1YmFzZS8w
MDA4LWVnbGNvbnZlbmllbmNlLWFkZC1taXNzaW5nLVFMaXN0LWluY2x1ZGUucGF0Y2gKQEAgLTAs
MCArMSwzNyBAQAorRnJvbSBmNjgxZjQyODQ3NzgxMmU1NDQ4NGY2MzFiMGRhMzMyY2MyZTAwZWFh
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9y
dEBnbXgubmV0PgorRGF0ZTogV2VkLCAxNiBNYXIgMjAyMiAxOTowODo1NSArMDEwMAorU3ViamVj
dDogW1BBVENIXSBlZ2xjb252ZW5pZW5jZTogYWRkIG1pc3NpbmcgUUxpc3QgaW5jbHVkZQorTUlN
RS1WZXJzaW9uOiAxLjAKK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAor
Q29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAorCitGaXhlczoKKworICBxZWdsY29udmVu
aWVuY2UuY3BwOjQxODoyMzogZXJyb3I6IHZhcmlhYmxlIOKAmFFMaXN0PFFCeXRlQXJyYXk+IGV4
dGVuc2lvbnPigJkgaGFzIGluaXRpYWxpemVyIGJ1dCBpbmNvbXBsZXRlIHR5cGUKKyAgICA0MTgg
fCAgICAgUUxpc3Q8UUJ5dGVBcnJheT4gZXh0ZW5zaW9ucyA9CisgICAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgIF5+fn5+fn5+fn4KKyAgcWVnbGNvbnZlbmllbmNlLmNwcDo0MjA6NjU6IGVy
cm9yOiBpbnZhbGlkIHVzZSBvZiBpbmNvbXBsZXRlIHR5cGUg4oCYY2xhc3MgUUxpc3Q8UUJ5dGVB
cnJheT7igJkKKyAgICA0MjAgfCAgICAgICAgICAgICAoZWdsUXVlcnlTdHJpbmcoZGlzcGxheSwg
RUdMX0VYVEVOU0lPTlMpKSkuc3BsaXQoJyAnKTsKKyAgICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgorCitTaWdu
ZWQtb2ZmLWJ5OiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+CistLS0KKyBzcmMv
cGxhdGZvcm1zdXBwb3J0L2VnbGNvbnZlbmllbmNlL3FlZ2xjb252ZW5pZW5jZS5jcHAgfCAxICsK
KyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKKworZGlmZiAtLWdpdCBhL3NyYy9wbGF0
Zm9ybXN1cHBvcnQvZWdsY29udmVuaWVuY2UvcWVnbGNvbnZlbmllbmNlLmNwcCBiL3NyYy9wbGF0
Zm9ybXN1cHBvcnQvZWdsY29udmVuaWVuY2UvcWVnbGNvbnZlbmllbmNlLmNwcAoraW5kZXggNTMw
M2QzN2MuLmRhY2VlYjhiIDEwMDY0NAorLS0tIGEvc3JjL3BsYXRmb3Jtc3VwcG9ydC9lZ2xjb252
ZW5pZW5jZS9xZWdsY29udmVuaWVuY2UuY3BwCisrKysgYi9zcmMvcGxhdGZvcm1zdXBwb3J0L2Vn
bGNvbnZlbmllbmNlL3FlZ2xjb252ZW5pZW5jZS5jcHAKK0BAIC0zOCw2ICszOCw3IEBACisgKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKi8KKyAKKyAjaW5jbHVkZSA8UUJ5dGVBcnJheT4KKysjaW5jbHVkZSA8
UUxpc3Q+CisgI2luY2x1ZGUgPFFPcGVuR0xDb250ZXh0PgorIAorICNpZmRlZiBRX09TX0xJTlVY
CistLSAKKzIuMzUuMQorCi0tIAoyLjM1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
