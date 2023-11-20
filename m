Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18001C197A0
	for <buildroot@archiver.kernel.org>; Mon, 20 Nov 2023 21:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75E34401C2;
	Mon, 20 Nov 2023 21:42:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75E34401C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dJjcpPxsgTeV; Mon, 20 Nov 2023 21:42:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 495524039D;
	Mon, 20 Nov 2023 21:42:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 495524039D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5839E1BF255
 for <buildroot@lists.busybox.net>; Mon, 20 Nov 2023 21:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30F8760F84
 for <buildroot@lists.busybox.net>; Mon, 20 Nov 2023 21:42:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30F8760F84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1XZYx4F42NFz for <buildroot@lists.busybox.net>;
 Mon, 20 Nov 2023 21:42:36 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6EBE460EEF
 for <buildroot@buildroot.org>; Mon, 20 Nov 2023 21:42:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EBE460EEF
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-32fe1a29010so3113438f8f.0
 for <buildroot@buildroot.org>; Mon, 20 Nov 2023 13:42:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700516553; x=1701121353;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NEu45cnXXABg/ehuRkXjg2xOGS8OLvwJRwC3jk4/15M=;
 b=lj3shMNxSkpFqV3aq0e2g8zHYwSK1VK0BlW4+zEQExkhTuLC2kwkfW0KvZ9ZtXrPYU
 OlEneP9sq47x2qBxXe+u6FA5rXcSvu79HJwzUsAmItWGkrW/sNmwMyaAYVdeS5x2XYlS
 +eJTwHzfyW3Y28KL5iKPTWOrFbdDcIg2Q7BxDL0c/MsZSKBjABx6HO77xBlNTUEm4dE/
 qi1ZuGUipfK1h5SxRV0+Tz0PDQp+TwYaMhT8kFVlUsdYK+/R6X3EYcIT1aNftQvmzxTs
 5IXQWvgJ4K8ZTB4q0zb12JZcaKhP/BQAnXBrgsvjsStK3792f5D6BwMpsTPRH1jO/1VZ
 e9+w==
X-Gm-Message-State: AOJu0YzyF6XfRzpfrhle/p8dChhxBXjUByUfMx1G5iflStgSS6UcZJph
 im/SQOH+wzuuIjUNv4Elpd4ZnyxUyZRpm0onPK8=
X-Google-Smtp-Source: AGHT+IEYjoVixAHpGsDfuFDs4E244DerFDicwv1puddStSeYbl1S0k+TdaDubGMYFUAoFxKJRgcGlQ==
X-Received: by 2002:a05:6000:1cc2:b0:332:c31d:9dce with SMTP id
 bf2-20020a0560001cc200b00332c31d9dcemr4124685wrb.24.1700516553436; 
 Mon, 20 Nov 2023 13:42:33 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 d8-20020adffbc8000000b003316aeb280esm11546058wrs.104.2023.11.20.13.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 13:42:33 -0800 (PST)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Mon, 20 Nov 2023 22:41:50 +0100
Message-ID: <20231120214150.671145-1-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1700516553; x=1701121353; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NEu45cnXXABg/ehuRkXjg2xOGS8OLvwJRwC3jk4/15M=;
 b=NOWK0yzWisdzBBY1O6UP1h+Dx3PKur1TvnkrlY8Z6WT1OU63uq5EYqf7csOG9OYCV9
 GIygItCMTyPlFA+1slnQD0+BgkcDOyyw4b+QAIedFDYAGIgn59dEmjhKyNgl16Iqvayq
 T3wYPzQkzFH3ktF18PbNIY+9j6MEX52uBXk6g=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=rtone.fr header.i=@rtone.fr
 header.a=rsa-sha256 header.s=google header.b=NOWK0yzW
Subject: [Buildroot] [PATCH 1/1] board/raspberrypi: fix autoprobing of
 bluetooth driver
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
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGNvbW1pdCA2ODliOWFjNDM5IChwYWNrYWdlL3JwaS1maXJtd2FyZTogcmV3b3JrIGJvb3Qv
Y29uZmlnIGZpbGUKaGFuZGxpbmcpIGhhcyBzcGxpdCBpbiB0d28gdGhlIHByb3BlcnR5OgoKCWR0
b3ZlcmxheT1taW5pdWFydC1idCxrcm5idD1vbgoKSW50bzoKCglkdG92ZXJsYXk9bWluaXVhcnQt
YnQKCWR0b3ZlcmxheT1rcm5idD1vbgoKVGhlIGluaXRpYWwgcHJvcGVydHkgY29udGFpbmVkIHRo
ZSBkdGJvIGZpbGUgbWluaXVhcnQtYnRbMV0gYW5kIGl0cwpwYXJhbWV0ZXIga3JuYnQ9b25bMl1b
M10uCgpUaGUgZmlyc3Qgc3ludGF4IGlzIGNvcnJlY3Qgd2hpbGUgdGhlIHNlY29uZCBpcyBub3Qu
IFRoZSBrcm5idD1vbiBpcyBub3QKYSBkdG92ZXJsYXlbNF0gYnV0IGEgZHRwYXJhbVs1XS4gVGhl
cmVmb3JlIHRoZSBwcm9wZXJ0eSBkdHBhcmFtIG11c3QgYmUKdXNlZCBpbnN0ZWFkLgoKVGhpcyBm
aXhlczoKCgkjIGNhdCAvc3lzL2Zpcm13YXJlL2RldmljZXRyZWUvYmFzZS9jaG9zZW4vdXNlci13
YXJuaW5ncwoJRmFpbGVkIHRvIGxvYWQgb3ZlcmxheSAna3JuYnQ9b24nCgpbMV06IGh0dHBzOi8v
Z2l0aHViLmNvbS9yYXNwYmVycnlwaS9saW51eC9ibG9iL3JwaS01LjEwLnkvYXJjaC9hcm0vYm9v
dC9kdHMvb3ZlcmxheXMvbWluaXVhcnQtYnQtb3ZlcmxheS5kdHMKWzJdOiBodHRwczovL2dpdGh1
Yi5jb20vcmFzcGJlcnJ5cGkvbGludXgvYmxvYi9ycGktNS4xMC55L2FyY2gvYXJtL2Jvb3QvZHRz
L292ZXJsYXlzL21pbml1YXJ0LWJ0LW92ZXJsYXkuZHRzI0w5MQpbM106IGh0dHBzOi8vZ2l0aHVi
LmNvbS9yYXNwYmVycnlwaS9saW51eC9ibG9iL3JwaS01LjEwLnkvYXJjaC9hcm0vYm9vdC9kdHMv
b3ZlcmxheXMvUkVBRE1FI0wyMTMtTDIxNQpbNF06IGh0dHBzOi8vd3d3LnJhc3BiZXJyeXBpLmNv
bS9kb2N1bWVudGF0aW9uL2NvbXB1dGVycy9jb25maWdfdHh0Lmh0bWwjZHRvdmVybGF5Cls1XTog
aHR0cHM6Ly93d3cucmFzcGJlcnJ5cGkuY29tL2RvY3VtZW50YXRpb24vY29tcHV0ZXJzL2NvbmZp
Z190eHQuaHRtbCNkdHBhcmFtCgpTaWduZWQtb2ZmLWJ5OiBHYcOrbCBQT1JUQVkgPGdhZWwucG9y
dGF5QHJ0b25lLmZyPgotLS0KIGJvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ18wdy50eHQgICAgICB8
IDIgKy0KIGJvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ18zLnR4dCAgICAgICB8IDIgKy0KIGJvYXJk
L3Jhc3BiZXJyeXBpL2NvbmZpZ18zXzY0Yml0LnR4dCB8IDIgKy0KIGJvYXJkL3Jhc3BiZXJyeXBp
L2NvbmZpZ180LnR4dCAgICAgICB8IDIgKy0KIGJvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ180XzY0
Yml0LnR4dCB8IDIgKy0KIGJvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ196ZXJvMncudHh0ICB8IDIg
Ky0KIDYgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ18wdy50eHQgYi9ib2FyZC9yYXNwYmVy
cnlwaS9jb25maWdfMHcudHh0CmluZGV4IDE5NWJhZDQ0OWUuLmJjNTlkNWZhZDIgMTAwNjQ0Ci0t
LSBhL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ18wdy50eHQKKysrIGIvYm9hcmQvcmFzcGJlcnJ5
cGkvY29uZmlnXzB3LnR4dApAQCAtMjYsNCArMjYsNCBAQCBncHVfbWVtXzEwMjQ9MTAwCiBkdG92
ZXJsYXk9bWluaXVhcnQtYnQKCiAjIGVuYWJsZSBhdXRvcHJvYmluZyBvZiBCbHVldG9vdGggZHJp
dmVyIHdpdGhvdXQgbmVlZCBvZiBoY2lhdHRhY2gvYnRhdHRhY2gKLWR0b3ZlcmxheT1rcm5idD1v
bgorZHRwYXJhbT1rcm5idD1vbgpkaWZmIC0tZ2l0IGEvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmln
XzMudHh0IGIvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzMudHh0CmluZGV4IDE5NWJhZDQ0OWUu
LmJjNTlkNWZhZDIgMTAwNjQ0Ci0tLSBhL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ18zLnR4dAor
KysgYi9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfMy50eHQKQEAgLTI2LDQgKzI2LDQgQEAgZ3B1
X21lbV8xMDI0PTEwMAogZHRvdmVybGF5PW1pbml1YXJ0LWJ0CgogIyBlbmFibGUgYXV0b3Byb2Jp
bmcgb2YgQmx1ZXRvb3RoIGRyaXZlciB3aXRob3V0IG5lZWQgb2YgaGNpYXR0YWNoL2J0YXR0YWNo
Ci1kdG92ZXJsYXk9a3JuYnQ9b24KK2R0cGFyYW09a3JuYnQ9b24KZGlmZiAtLWdpdCBhL2JvYXJk
L3Jhc3BiZXJyeXBpL2NvbmZpZ18zXzY0Yml0LnR4dCBiL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZp
Z18zXzY0Yml0LnR4dAppbmRleCAzNDQxMmZhOWU4Li42NjcyODcxMTI1IDEwMDY0NAotLS0gYS9i
b2FyZC9yYXNwYmVycnlwaS9jb25maWdfM182NGJpdC50eHQKKysrIGIvYm9hcmQvcmFzcGJlcnJ5
cGkvY29uZmlnXzNfNjRiaXQudHh0CkBAIC0yNiw3ICsyNiw3IEBAIGdwdV9tZW1fMTAyND0xMDAK
IGR0b3ZlcmxheT1taW5pdWFydC1idAoKICMgZW5hYmxlIGF1dG9wcm9iaW5nIG9mIEJsdWV0b290
aCBkcml2ZXIgd2l0aG91dCBuZWVkIG9mIGhjaWF0dGFjaC9idGF0dGFjaAotZHRvdmVybGF5PWty
bmJ0PW9uCitkdHBhcmFtPWtybmJ0PW9uCgogIyBlbmFibGUgNjRiaXRzIHN1cHBvcnQKIGFybV82
NGJpdD0xCmRpZmYgLS1naXQgYS9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfNC50eHQgYi9ib2Fy
ZC9yYXNwYmVycnlwaS9jb25maWdfNC50eHQKaW5kZXggZWEwMmQzZjA3MS4uNzRhN2IyNzBjZCAx
MDA2NDQKLS0tIGEvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzQudHh0CisrKyBiL2JvYXJkL3Jh
c3BiZXJyeXBpL2NvbmZpZ180LnR4dApAQCAtMjYsNCArMjYsNCBAQCBncHVfbWVtXzEwMjQ9MTAw
CiBkdG92ZXJsYXk9bWluaXVhcnQtYnQKCiAjIGVuYWJsZSBhdXRvcHJvYmluZyBvZiBCbHVldG9v
dGggZHJpdmVyIHdpdGhvdXQgbmVlZCBvZiBoY2lhdHRhY2gvYnRhdHRhY2gKLWR0b3ZlcmxheT1r
cm5idD1vbgorZHRwYXJhbT1rcm5idD1vbgpkaWZmIC0tZ2l0IGEvYm9hcmQvcmFzcGJlcnJ5cGkv
Y29uZmlnXzRfNjRiaXQudHh0IGIvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzRfNjRiaXQudHh0
CmluZGV4IDQxYzdlOTdlOTkuLjJhOTgxNDI3NGYgMTAwNjQ0Ci0tLSBhL2JvYXJkL3Jhc3BiZXJy
eXBpL2NvbmZpZ180XzY0Yml0LnR4dAorKysgYi9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfNF82
NGJpdC50eHQKQEAgLTI2LDcgKzI2LDcgQEAgZ3B1X21lbV8xMDI0PTEwMAogZHRvdmVybGF5PW1p
bml1YXJ0LWJ0CgogIyBlbmFibGUgYXV0b3Byb2Jpbmcgb2YgQmx1ZXRvb3RoIGRyaXZlciB3aXRo
b3V0IG5lZWQgb2YgaGNpYXR0YWNoL2J0YXR0YWNoCi1kdG92ZXJsYXk9a3JuYnQ9b24KK2R0cGFy
YW09a3JuYnQ9b24KCiBkdG92ZXJsYXk9dmM0LWttcy12M2QtcGk0CiBkdG92ZXJsYXk9aW14MjE5
CmRpZmYgLS1naXQgYS9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfemVybzJ3LnR4dCBiL2JvYXJk
L3Jhc3BiZXJyeXBpL2NvbmZpZ196ZXJvMncudHh0CmluZGV4IDllNmI3ZjVjY2YuLjU1MDk1ZjY0
YTcgMTAwNjQ0Ci0tLSBhL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ196ZXJvMncudHh0CisrKyBi
L2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ196ZXJvMncudHh0CkBAIC0yNiw0ICsyNiw0IEBAIGdw
dV9tZW1fMTAyND0xMDAKIGR0b3ZlcmxheT1taW5pdWFydC1idAoKICMgZW5hYmxlIGF1dG9wcm9i
aW5nIG9mIEJsdWV0b290aCBkcml2ZXIgd2l0aG91dCBuZWVkIG9mIGhjaWF0dGFjaC9idGF0dGFj
aAotZHRvdmVybGF5PWtybmJ0PW9uCitkdHBhcmFtPWtybmJ0PW9uCi0tCjIuNDIuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
