Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E11C433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 23:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DF1E60BE9;
	Fri,  3 Dec 2021 23:17:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s8bPlBiO9lUB; Fri,  3 Dec 2021 23:17:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF01360BE7;
	Fri,  3 Dec 2021 23:17:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 71C0B1BF3FB
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 23:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 612DF41484
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 23:17:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1mL-eIO8-25e for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 23:17:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8868C410B4
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 23:17:23 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id p18so3514313wmq.5
 for <buildroot@buildroot.org>; Fri, 03 Dec 2021 15:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=++4rfGp7OOX0xrbeCIZl1MRDSqTQ58ckFmxnebi4sYs=;
 b=ajcYPjfaWWfFtFpcPbnLT5c542d/LgAXpHNkoqCoYDDLM5dEf9j1uzPQEyA9t/tYYf
 NFIphx7HYew8srN2PDU92t1GXPHKUgwIchszW8XPDBN53b+XbT/y/oG/vVXqJM95d4UD
 Bd2HCyvm7CPfRxLe0WXEY1nxwWhcFrN4GDNrKX5y3Kh56CLKVDfoxYwiy1qW9dnX2uyK
 0ZuSQerOLzgBeFkDXExwaPlX5F8wGK4WpruK+cbxYm9nVfRJuw+DBaZ1pidPNuvoyBes
 1F3Up0UhPSKHHY3sylH7PcisTDUCgwOeouXK74GPXZuX6cvhwO0g15m4Xd85tNLgBuWb
 ANEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=++4rfGp7OOX0xrbeCIZl1MRDSqTQ58ckFmxnebi4sYs=;
 b=6AWGRTjQmDK9OdqtqyKRteLEkX/Veb/0B7/6xSv377MdGhS660Zk0FigiJdX1RNpE2
 4/XPHEYAAxzOebBBg80UR/MwAMNT9TcmXMVcA/Q6l6DB/RcKfH+HU2g3LBuoZgv3juTi
 c32HtVu0W4PfLEZfphC9WFn/qlrX4dU01+1KpdrZmB8OB2dMRY6aIqdkmbH7h66mN7s1
 4V1jdnDsG/OgXrzHXlFLBa637vejcnz4WsbJZOSFfzTvs9Is+6XPt0UoUcMw7zYLzXuX
 bJywO+VXafwcq6VLtKRmJPspQoMEQP6hM3+Bjq5BccIFqKs7LZegcqxB0aw2swK2fqVf
 kOfg==
X-Gm-Message-State: AOAM531PO4EM44+duPqiTNLgGiRoR5n7qNdni4N7U8NUufdrYqWVGNN6
 09K84jtAqydrkfD5Qy/M2YO9yTau8gE=
X-Google-Smtp-Source: ABdhPJxGTt918f4wC0phCwTrbvw94taRw6KrwZ0YTjiAciKZhY794WUfk0Kp7aUw9nkjVa2aua3b5g==
X-Received: by 2002:a1c:9d48:: with SMTP id g69mr19260277wme.188.1638573441646; 
 Fri, 03 Dec 2021 15:17:21 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:28e3:e36b:4389:5725])
 by smtp.gmail.com with ESMTPSA id z6sm4684945wmp.9.2021.12.03.15.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 15:17:21 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 00:17:18 +0100
Message-Id: <b7c2fb620318f0964cf18f6c3170de18099f2c5e.1638573387.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638573387.git.yann.morin.1998@free.fr>
References: <cover.1638573387.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] boot/grub2/Config.in: add symbols to
 represent legacy and EFI boot
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
Cc: =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogQWRhbSBEdXNrZXR0IDxhZHVza2V0dEBnbWFpbC5jb20+CgpUaGVyZSBhcmUgY2FzZXMg
dG8gd2FudCBhIHN5bnRoZXRpYyBpbmZvcm1hdGlvbiB3aGV0aGVyIHRoZSBsZWdhY3kgQklPUwpv
ciBVLUJvb3QgYm9vdCBzY2hlbWUsIG9yIHRoZSBFRkkgYm9vdCBzY2hlbWUsIGFyZSBlbmFibGVk
LCB3aXRob3V0CnJlc29ydGluZyB0byB0ZXN0aW5nIGFsbCBhbmQgZWFjaCBwbGF0Zm9ybXMuCgpU
aGlzIGlzIGFscmVhZHkgdGhlIGNhZSBpbiBncnViMiBpdHNlbGYsIGZvciB0aGUgY29uZmlndXJh
dGlvbiBvZiB0aGUKQklPUy9VLUJvb3QgYm9vdCBwYXJ0aXRpb24sIGFuZCBidWlsdGluIG1vZHVs
ZXMgYW5kIGNvbmZpZ3VyYXRpb24gb24gb25lCmhhbmQsIGFuZCB0aGUgRUZJIGJ1aWx0aW4gbW9k
dWxlcyBhbmQgY29uZmlndXJhaXRvbiBvbiB0aGUgb3RoZXIgaGFuZC4KCkl0IGlzIGFsc28gdGhl
IGNhc2UgZm9yIG1lbmRlci1ncnViZW52LCB3aGljaCB3aWxsIHdhbnQgdG8ga25vdyBpZgplaXRo
ZXIgb3IgYm90aCBhcmUgZW5hYmxlZCwgYnV0IHdpdGhvdXQgaGF2aW5nIHRvIHJlc29ydCB0byB0
ZXN0aW5nIGFsbAp0aGUgY2FzZXMuCgpBZGQgdHdvIG5ldyBzeW1ib2xzLCB0aGF0IGVhY2ggcmVw
cmVzZW50IHRob3NlIGNvbmRpdGlvbnM6CiAgKiBCUjJfVEFSR0VUX0dSVUIyX0hBU19MRUdBQ1lf
Qk9PVAogICogQlIyX1RBUkdFVF9HUlVCMl9IQVNfRUZJX0JPT1QKCkVhY2ggdGFyZ2V0IHNlbGVj
dHMgdGhlIGFwcHJvcHJpYXRlIGJvb2wsIHdoaWNoIG1ha2VzIGl0IG11Y2ggbW9yZQpzaW1wbGUg
Zm9yIG90aGVyIHBhY2thZ2VzIHN1Y2ggYXMgbWVuZGVyLWdydWJlbnYgdG8gY2hlY2sgaWYgZ3J1
YiBsZWdhY3kKb3IgRUZJIGlzIHNlbGVjdGVkLgoKQW5kIG9mIGNvdXJzZSwgd2UgYWxzbyBtYWtl
IHVzZSBvZiB0aG9zZSBzeW1ib2xzIGluIGdydWIyIGl0c2VsZiwgdG8Kc2ltcGxpZnkgdGhlIGNv
bmRpdGlvbnMgZm9yIHNob3dpbmcuaGlkaW5nIGxlZ2FjeSBhbmQgRUZJIG9wdGlvbnMuCgpBZGRp
dGlvbmFsbHkgKGJ1dCB0aGF0IGRvZXMgbm90IG1lcml0IGJlaW5nIGluIGl0cyBvd24gcGF0Y2gp
LCBhZGQgYQpjb21tZW50IG9uIHRoZSBjbG9zaW5nICdlbmRpZicgZm9yIHRoZSBFRkkgcGFydC4K
ClNpZ25lZC1vZmYtYnk6IEFkYW0gRHVza2V0dCA8YWR1c2tldHRAZ21haWwuY29tPgpTaWduZWQt
b2ZmLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4KQ2M6IEvDtnJ5
IE1haW5jZW50IDxrb3J5Lm1haW5jZW50QGJvb3RsaW4uY29tPgoKLS0tCkNoYW5nZXMgdjUgLT4g
djYgKEFkYW0pOgogIC0gbmV3IHBhdGNoCgpDaGFuZ2VzIHY2IC0+IHY3OiAoWWFubik6CiAgLSBz
L0JSMl9UQVJHRVRfR1JVQl8vQlIyX1RBUkdFVF9HUlVCMl8vCiAgLSByZW5hbWUgdmFyaWFibGVz
IGFueXdheQogIC0gdXNlIHZhcmlhYmxlcyBpbiBncnViMiBpdHNlbGYKLS0tCiBib290L2dydWIy
L0NvbmZpZy5pbiB8IDIyICsrKysrKysrKysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAx
NyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Jvb3QvZ3J1YjIv
Q29uZmlnLmluIGIvYm9vdC9ncnViMi9Db25maWcuaW4KaW5kZXggN2JiZTY5NzkzMi4uOTJiNWRk
NTAxYiAxMDA2NDQKLS0tIGEvYm9vdC9ncnViMi9Db25maWcuaW4KKysrIGIvYm9vdC9ncnViMi9D
b25maWcuaW4KQEAgLTM0LDEyICszNCwxOSBAQCBjb25maWcgQlIyX1RBUkdFVF9HUlVCMgogCiBp
ZiBCUjJfVEFSR0VUX0dSVUIyCiAKK2NvbmZpZyBCUjJfVEFSR0VUX0dSVUIyX0hBU19MRUdBQ1lf
Qk9PVAorCWJvb2wKKworY29uZmlnIEJSMl9UQVJHRVRfR1JVQjJfSEFTX0VGSV9CT09UCisJYm9v
bAorCiBjb25maWcgQlIyX1RBUkdFVF9HUlVCMl9IQVNfUFRGCiAJYm9vbAogCiBjb25maWcgQlIy
X1RBUkdFVF9HUlVCMl9JMzg2X1BDCiAJYm9vbCAiaTM4Ni1wYyIKIAlkZXBlbmRzIG9uIEJSMl9p
Mzg2IHx8IEJSMl94ODZfNjQKKwlzZWxlY3QgQlIyX1RBUkdFVF9HUlVCMl9IQVNfTEVHQUNZX0JP
T1QKIAloZWxwCiAJICBTZWxlY3QgdGhpcyBvcHRpb24gaWYgdGhlIHBsYXRmb3JtIHlvdSdyZSB0
YXJnZXR0aW5nIGlzIGEKIAkgIHg4NiBvciB4ODYtNjQgbGVnYWN5IEJJT1MgYmFzZWQgcGxhdGZv
cm0uCkBAIC00OCw2ICs1NSw3IEBAIGNvbmZpZyBCUjJfVEFSR0VUX0dSVUIyX0kzODZfRUZJCiAJ
Ym9vbCAiaTM4Ni1lZmkiCiAJZGVwZW5kcyBvbiBCUjJfaTM4NiB8fCBCUjJfeDg2XzY0CiAJc2Vs
ZWN0IEJSMl9UQVJHRVRfR1JVQjJfSEFTX1BURgorCXNlbGVjdCBCUjJfVEFSR0VUX0dSVUIyX0hB
U19FRklfQk9PVAogCWhlbHAKIAkgIFNlbGVjdCB0aGlzIG9wdGlvbiBpZiB0aGUgcGxhdGZvcm0g
eW91J3JlIHRhcmdldHRpbmcgaGFzIGEKIAkgIDMyIGJpdHMgRUZJIEJJT1MuIE5vdGUgdGhhdCBz
b21lIHg4Ni02NCBwbGF0Zm9ybXMgdXNlIGEgMzIKQEAgLTU3LDYgKzY1LDcgQEAgY29uZmlnIEJS
Ml9UQVJHRVRfR1JVQjJfWDg2XzY0X0VGSQogCWJvb2wgIng4Ni02NC1lZmkiCiAJZGVwZW5kcyBv
biBCUjJfeDg2XzY0CiAJc2VsZWN0IEJSMl9UQVJHRVRfR1JVQjJfSEFTX1BURgorCXNlbGVjdCBC
UjJfVEFSR0VUX0dSVUIyX0hBU19FRklfQk9PVAogCWhlbHAKIAkgIFNlbGVjdCB0aGlzIG9wdGlv
biBpZiB0aGUgcGxhdGZvcm0geW91J3JlIHRhcmdldHRpbmcgaGFzIGEKIAkgIDY0IGJpdHMgRUZJ
IEJJT1MuCkBAIC02NCw2ICs3Myw3IEBAIGNvbmZpZyBCUjJfVEFSR0VUX0dSVUIyX1g4Nl82NF9F
RkkKIGNvbmZpZyBCUjJfVEFSR0VUX0dSVUIyX0FSTV9VQk9PVAogCWJvb2wgImFybS11Ym9vdCIK
IAlkZXBlbmRzIG9uIEJSMl9hcm0KKwlzZWxlY3QgQlIyX1RBUkdFVF9HUlVCMl9IQVNfTEVHQUNZ
X0JPT1QKIAloZWxwCiAJICBTZWxlY3QgdGhpcyBvcHRpb24gaWYgdGhlIHBsYXRmb3JtIHlvdSdy
ZSB0YXJnZXR0aW5nIGlzIGFuCiAJICBBUk0gdS1ib290IHBsYXRmb3JtLCBhbmQgeW91IHdhbnQg
dG8gYm9vdCBHcnViIDIgYXMgYW4gdS1ib290CkBAIC03Myw2ICs4Myw3IEBAIGNvbmZpZyBCUjJf
VEFSR0VUX0dSVUIyX0FSTV9FRkkKIAlib29sICJhcm0tZWZpIgogCWRlcGVuZHMgb24gQlIyX2Fy
bQogCXNlbGVjdCBCUjJfVEFSR0VUX0dSVUIyX0hBU19QVEYKKwlzZWxlY3QgQlIyX1RBUkdFVF9H
UlVCMl9IQVNfRUZJX0JPT1QKIAloZWxwCiAJICBTZWxlY3QgdGhpcyBvcHRpb24gaWYgdGhlIHBs
YXRmb3JtIHlvdSdyZSB0YXJnZXR0aW5nIGlzIGFuCiAJICBBUk0gcGxhdGZvcm0gYW5kIHlvdSB3
YW50IHRvIGJvb3QgR3J1YiAyIGFzIGFuIEVGSQpAQCAtODEsMTIgKzkyLDEzIEBAIGNvbmZpZyBC
UjJfVEFSR0VUX0dSVUIyX0FSTV9FRkkKIGNvbmZpZyBCUjJfVEFSR0VUX0dSVUIyX0FSTTY0X0VG
SQogCWJvb2wgImFybTY0LWVmaSIKIAlkZXBlbmRzIG9uIEJSMl9hYXJjaDY0CisJc2VsZWN0IEJS
Ml9UQVJHRVRfR1JVQjJfSEFTX0VGSV9CT09UCiAJaGVscAogCSAgU2VsZWN0IHRoaXMgb3B0aW9u
IGlmIHRoZSBwbGF0Zm9ybSB5b3UncmUgdGFyZ2V0dGluZyBpcyBhbgogCSAgQWFyY2g2NCBwbGF0
Zm9ybSBhbmQgeW91IHdhbnQgdG8gYm9vdCBHcnViIDIgYXMgYW4gRUZJCiAJICBhcHBsaWNhdGlv
bi4KIAotaWYgQlIyX1RBUkdFVF9HUlVCMl9JMzg2X1BDIHx8IEJSMl9UQVJHRVRfR1JVQjJfQVJN
X1VCT09UCitpZiBCUjJfVEFSR0VUX0dSVUIyX0hBU19MRUdBQ1lfQk9PVAogCiBjb21tZW50ICJP
cHRpb25zIGZvciB0aGUgeDg2IGxlZ2FjeSBCSU9TIG9yIEFSTSBVLUJvb3Qgc3VwcG9ydCIKIApA
QCAtMTE0LDEwICsxMjYsOSBAQCBjb25maWcgQlIyX1RBUkdFVF9HUlVCMl9CVUlMVElOX0NPTkZJ
R19QQwogCSAgZGV2aWNlIGFuZCBvdGhlciBjb25maWd1cmF0aW9uIHBhcmFtZXRlcnMsIGJ1dCBo
b3dldmVyIG1lbnUKIAkgIGVudHJpZXMgY2Fubm90IGJlIGRlc2NyaWJlZCBpbiB0aGlzIGVtYmVk
ZGVkIGNvbmZpZ3VyYXRpb24uCiAKLWVuZGlmICMgQlIyX1RBUkdFVF9HUlVCMl9JMzg2X1BDIHx8
IEJSMl9UQVJHRVRfR1JVQjJfQVJNX1VCT09UCitlbmRpZiAjIEJSMl9UQVJHRVRfR1JVQjJfSEFT
X0xFR0FDWV9CT09UCiAKLWlmIEJSMl9UQVJHRVRfR1JVQjJfSTM4Nl9FRkkgfHwgQlIyX1RBUkdF
VF9HUlVCMl9YODZfNjRfRUZJIHx8IFwKLQlCUjJfVEFSR0VUX0dSVUIyX0FSTV9FRkkgIHx8IEJS
Ml9UQVJHRVRfR1JVQjJfQVJNNjRfRUZJCitpZiBCUjJfVEFSR0VUX0dSVUIyX0hBU19FRklfQk9P
VAogCiBjb21tZW50ICJPcHRpb25zIGZvciB0aGUgRUZJIEJJT1Mgb3IgQVJNIEVGSSBzdXBwb3J0
IgogCkBAIC0xMzUsNyArMTQ2LDggQEAgY29uZmlnIEJSMl9UQVJHRVRfR1JVQjJfQlVJTFRJTl9D
T05GSUdfRUZJCiAJICBkZXZpY2UgYW5kIG90aGVyIGNvbmZpZ3VyYXRpb24gcGFyYW1ldGVycywg
YnV0IGhvd2V2ZXIgbWVudQogCSAgZW50cmllcyBjYW5ub3QgYmUgZGVzY3JpYmVkIGluIHRoaXMg
ZW1iZWRkZWQgY29uZmlndXJhdGlvbi4KIAotZW5kaWYKK2VuZGlmICMgQlIyX1RBUkdFVF9HUlVC
Ml9IQVNfRUZJX0JPT1QKKwogY29uZmlnIEJSMl9UQVJHRVRfR1JVQjJfSU5TVEFMTF9UT09MUwog
CWJvb2wgImluc3RhbGwgdG9vbHMiCiAJaGVscAotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
