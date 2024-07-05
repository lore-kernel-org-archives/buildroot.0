Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB0FC30658
	for <buildroot@archiver.kernel.org>; Fri,  5 Jul 2024 09:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A355840B8B;
	Fri,  5 Jul 2024 09:14:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wR7WkKTdkMoz; Fri,  5 Jul 2024 09:14:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EAFF40D43
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EAFF40D43;
	Fri,  5 Jul 2024 09:14:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8EFEB1BF31D
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 09:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71C5C40BB7
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 09:14:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YwtF11y1dDxi for <buildroot@lists.busybox.net>;
 Fri,  5 Jul 2024 09:14:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8B9FC409A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B9FC409A6
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B9FC409A6
 for <buildroot@buildroot.org>; Fri,  5 Jul 2024 09:14:33 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-367a9ab4d81so221896f8f.1
 for <buildroot@buildroot.org>; Fri, 05 Jul 2024 02:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720170871; x=1720775671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PaTuLSzNz9oUy7qTrx9wmn+/zyGHjMqiuVbQM2B2Njk=;
 b=XbWSKHq7yCDbjJaZYcETfAiBnU/IrtSaOyNmZnWJcYoNJbckoWl69E9N8YeX1sMIWZ
 /9nA99y8YHzMYFOIj215GoDE+xpKd7RzT4nggMLzar7RD2JWFEtxVGBCIupiTwVSlo/B
 aovZAThnl7Rk72OFxYuZNRrZabvspHwflHVzoc8lUiFAVUpN+mz7I6x6yg2pLH8sDYhv
 jrKu4MimPiAH7n62PmSD67eydQ7HOcWcEnKrvdgAre51Ey12BJh2nFgwcQoUNWcKF7Es
 Cz7PZD5F8kju8+FmlnOwHS6nBSlgJS8vbta9kSkW78/3g6W7qZMgBb50QygKtbXTt6aQ
 IvOg==
X-Gm-Message-State: AOJu0YzhIGr99OwtDrNE/Wz4HCAXbckLm4tsHljIEWM6O1wOklQ68lJ7
 0XSMAFbE5q7POmgGhcxh5UNmEkIjjuDfVA30pVZy0XgYv788T+WgLLMDm3GgUROYjm+5TOmpL8p
 Lzhc=
X-Google-Smtp-Source: AGHT+IEu/ICpkZCQfQAQbyvHeM30qpUwIjn2L7KX+F0ELNXK4saOVo6uH80ALfI3EfYKICZcRGfHFQ==
X-Received: by 2002:a5d:5707:0:b0:367:91be:b12b with SMTP id
 ffacd0b85a97d-3679dd36508mr2622220f8f.40.1720170871595; 
 Fri, 05 Jul 2024 02:14:31 -0700 (PDT)
Received: from junian.fritz.box (94.105.103.7.dyn.edpnet.net. [94.105.103.7])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367963fa692sm5486844f8f.85.2024.07.05.02.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 02:14:31 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri,  5 Jul 2024 11:14:09 +0200
Message-Id: <20240705091409.3370272-4-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240705091409.3370272-1-raphael.melotte@mind.be>
References: <20240701145708.2886402-1-raphael.melotte@mind.be>
 <20240705091409.3370272-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720170871; x=1720775671; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PaTuLSzNz9oUy7qTrx9wmn+/zyGHjMqiuVbQM2B2Njk=;
 b=bJc9eALMiY1ytgU++QxMJj3S++H/FWVgAB1t2VvjN3UxPYyU1omr96f6uLP2NckmR+
 R4B6sY8YQpadxRM0J5A0C0hOiIS4M5lWeRzobiNKpGsjjNKS5CGWy/BeqoJBDoTB/dh/
 ZAE+BNxqyU5tmwSLYgWar20hPE2/D80pf1IrD45esjjD9t5/63/5xxAvFOv+xaR6uB/2
 70qEYrCBZ0lyjC2nPey4z4TZHKLch59fnPa1aBEINg1bg/pBoQbNxk85ZDREly2+UfNX
 Mi+j3JdUzIxIRVSdj0aR7rYeFUtZXn8KUbOiYvCiTT4szVRCHNCwaeqKTV/YExkLQ/Lj
 oWEA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bJc9eALM
Subject: [Buildroot] [PATCH v2 4/4] support/testing: add new test for
 python-sdbus-networkmanager
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJl
PgotLS0KIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAy
ICsrCiAuLi4vc2FtcGxlX3B5dGhvbl9zZGJ1c19uZXR3b3JrbWFuYWdlci5weSAgICAgfCAyMCAr
KysrKysrKysrKysrKysrKysrCiAuLi4vdGVzdF9weXRob25fc2RidXNfbmV0d29ya21hbmFnZXIu
cHkgICAgICAgfCAxNSArKysrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAzNyBpbnNlcnRp
b25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uv
c2FtcGxlX3B5dGhvbl9zZGJ1c19uZXR3b3JrbWFuYWdlci5weQogY3JlYXRlIG1vZGUgMTAwNjQ0
IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX3NkYnVzX25ldHdvcmtt
YW5hZ2VyLnB5CgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggOWFi
ZjJkNDkwYi4uMGIxN2U0NmRjYSAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9Q
RVJTCkBAIC0yNjc0LDEwICsyNjc0LDEyIEBAIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNr
YWdlL3NhbXBsZV9weXRob25fam1lc3BhdGgucHkKIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9w
YWNrYWdlL3NhbXBsZV9weXRob25fcnNhLnB5CiBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFj
a2FnZS9zYW1wbGVfcHl0aG9uX3MzdHJhbnNmZXIucHkKIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0
cy9wYWNrYWdlL3NhbXBsZV9weXRob25fc2RidXMucHkKK0Y6CXN1cHBvcnQvdGVzdGluZy90ZXN0
cy9wYWNrYWdlL3NhbXBsZV9weXRob25fc2RidXNfbmV0d29ya21hbmFnZXIucHkKIEY6CXN1cHBv
cnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX2ptZXNwYXRoLnB5CiBGOglzdXBw
b3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9yc2EucHkKIEY6CXN1cHBvcnQv
dGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX3MzdHJhbnNmZXIucHkKIEY6CXN1cHBv
cnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX3NkYnVzLnB5CitGOglzdXBwb3J0
L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9zZGJ1c19uZXR3b3JrbWFuYWdlci5w
eQogCiBOOglSYXBoYWVsIFBhdmxpZGlzIDxyYXBoYWVsLnBhdmxpZGlzQGdtYWlsLmNvbT4KIEY6
CXBhY2thZ2UvbnZpZGlhLXBlcnNpc3RlbmNlZC8KZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGlu
Zy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fc2RidXNfbmV0d29ya21hbmFnZXIucHkgYi9z
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3NkYnVzX25ldHdvcmtt
YW5hZ2VyLnB5Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmUxNWI2M2Nl
NzAKLS0tIC9kZXYvbnVsbAorKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1w
bGVfcHl0aG9uX3NkYnVzX25ldHdvcmttYW5hZ2VyLnB5CkBAIC0wLDAgKzEsMjAgQEAKKyMhL3Vz
ci9iaW4vZW52IHB5dGhvbjMKKworaW1wb3J0IHNkYnVzCisKK2Zyb20gc2RidXNfYmxvY2submV0
d29ya21hbmFnZXIgaW1wb3J0ICgKKyAgICBEZXZpY2VUeXBlLAorICAgIE5ldHdvcmtNYW5hZ2Vy
LAorICAgIE5ldHdvcmtEZXZpY2VHZW5lcmljCispCisKK3NkYnVzLnNldF9kZWZhdWx0X2J1cyhz
ZGJ1cy5zZF9idXNfb3Blbl9zeXN0ZW0oKSkKKworbm0gPSBOZXR3b3JrTWFuYWdlcigpCitkZXZp
Y2VzID0gW05ldHdvcmtEZXZpY2VHZW5lcmljKGQpIGZvciBkIGluIG5tLmdldF9kZXZpY2VzKCld
CisKK3ByaW50KFtkLmludGVyZmFjZSBmb3IgZCBpbiBkZXZpY2VzXSkKKworYXNzZXJ0IGRldmlj
ZXMKKyMgQ2hlY2sgdGhhdCB3ZSBmb3VuZCBhdCBsZWFzdCB0aGUgbG9vcGJhY2sgaW50ZXJmYWNl
OgorYXNzZXJ0IFtkZXYgZm9yIGRldiBpbiBkZXZpY2VzIGlmIGRldi5kZXZpY2VfdHlwZSA9PSBE
ZXZpY2VUeXBlLkxPT1BCQUNLXQpkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3Bh
Y2thZ2UvdGVzdF9weXRob25fc2RidXNfbmV0d29ya21hbmFnZXIucHkgYi9zdXBwb3J0L3Rlc3Rp
bmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9zZGJ1c19uZXR3b3JrbWFuYWdlci5weQpuZXcg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5hMzk2MWVjNTRmCi0tLSAvZGV2L251
bGwKKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fc2RidXNf
bmV0d29ya21hbmFnZXIucHkKQEAgLTAsMCArMSwxNSBAQAorZnJvbSB0ZXN0cy5wYWNrYWdlLnRl
c3RfcHl0aG9uIGltcG9ydCBUZXN0UHl0aG9uUGFja2FnZUJhc2UKKworCitjbGFzcyBUZXN0UHl0
aG9uUHkzU2RidXNOZXR3b3JrbWFuYWdlcihUZXN0UHl0aG9uUGFja2FnZUJhc2UpOgorICAgIF9f
dGVzdF9fID0gVHJ1ZQorICAgIGNvbmZpZyA9IFRlc3RQeXRob25QYWNrYWdlQmFzZS5jb25maWcg
KyBcCisgICAgICAgICIiIgorICAgICAgICBCUjJfUEFDS0FHRV9QWVRIT04zPXkKKyAgICAgICAg
QlIyX0lOSVRfU1lTVEVNRD15CisgICAgICAgIEJSMl9QQUNLQUdFX05FVFdPUktfTUFOQUdFUj15
CisgICAgICAgIEJSMl9QQUNLQUdFX1BZVEhPTl9TREJVU19ORVRXT1JLTUFOQUdFUj15CisgICAg
ICAgICIiIgorICAgIHNhbXBsZV9zY3JpcHRzID0gWyJ0ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRo
b25fc2RidXNfbmV0d29ya21hbmFnZXIucHkiXQorCisgICAgdGltZW91dCA9IDMwCi0tIAoyLjM3
LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
