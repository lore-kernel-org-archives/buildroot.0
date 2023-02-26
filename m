Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F77DC64ED6
	for <buildroot@archiver.kernel.org>; Sun, 26 Feb 2023 16:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44C1D81934;
	Sun, 26 Feb 2023 16:21:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44C1D81934
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m9xd6JzefSJG; Sun, 26 Feb 2023 16:21:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C5058175E;
	Sun, 26 Feb 2023 16:21:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C5058175E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5422C1BF5A6
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 16:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C46241295
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 16:21:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C46241295
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qdf1wznH1uIO for <buildroot@lists.busybox.net>;
 Sun, 26 Feb 2023 16:21:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEBA9410DB
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CEBA9410DB
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 16:21:32 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso2121643wmb.0
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 08:21:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ChUzH3kNsQ0n/OWJIcnRHl7I5CVp4vPCM+4LhljbGW0=;
 b=gnKsCVYL9aq7JsbzwpRDhshO+v3gdFvui4StNemrkncBIUrecvk4PqYvR1bJU8W6VE
 5wgog9Wah+Q26drac4t1extMHNL4o/hfvZFseh8/h1VB8IvMbvianmnarwnuJgpQINwm
 aKr2D8W16B9I6iiSJNiBjuaq+BCZ3ux3P1jBm+bnJXy9Hv0E9RWl40Kep7a1NrjSFeFR
 VThHvtJwFogL10Qg6dFJf9R+nMUquecgvfF3BXqyBKOTXKhGurZj5Ke3JI+iUYcndrEH
 PJqFdMXtQqFAI9LWFnGRcUK/nVp5BXzRINjqm+HwbwUe34J8JFNI6xOB/BjbQYrgh1F7
 rpPA==
X-Gm-Message-State: AO0yUKWFJscDpyh0Mv0r4W5qOx15fPXc2ii1b3L6M6aTWMQYlDCnMpHP
 DVjvD2fUloZI3E4erfGDNZYER1qJGZ0=
X-Google-Smtp-Source: AK7set+Ini0ccTfi1Zqt//7rT1BGwAlWeyiCUyYfOxExIXBIWY1S4Xqr4aA2WdGLE49bgZeHY5KzeA==
X-Received: by 2002:a05:600c:a692:b0:3db:2858:db84 with SMTP id
 ip18-20020a05600ca69200b003db2858db84mr16776233wmb.34.1677428490511; 
 Sun, 26 Feb 2023 08:21:30 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 d8-20020a05600c34c800b003dc4480df80sm10523086wmq.34.2023.02.26.08.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 08:21:29 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Feb 2023 17:20:21 +0100
Message-Id: <20230226162021.67158-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ChUzH3kNsQ0n/OWJIcnRHl7I5CVp4vPCM+4LhljbGW0=;
 b=G0HcHz/HeXzRAHYtUGWQLBm/ypfpH5ZlfTK8TjJ//X0WRxCMxyUvSchCfDZG4wFBLY
 P6QG+VycWgmxKImJssKxktDoIkM/gVdvOuQ8HHBQhHEiDihZjFVn5kNmKCECj07pFjDb
 /ugGMqkO2tgZYG7ixcJEjYIb2a5ezhZ6qaRT/8m/30hExIBvqCqOMuiJn9jfsQsZXdk0
 AE9nXg1tyIVf73/ykpqhwVUp4+L+eSfffYJ0ZKePXwoM/RTdko2l/rSb5zB/8HjtrtyM
 ClVlcl857FfbJU8voblKGMOz01MrchQUhr4qd/KHSoImFZ7k8SFx9TVWWTzZLJ4LSmhS
 Lzlw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=G0HcHz/H
Subject: [Buildroot] [PATCH 1/1] package/uccp420wlan: drop package
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

dWNjcDQyMHdsYW4gaXMgbm90IG1haW50YWluZWQgYW55bW9yZSAobm8gY29tbWl0IHNpbmNlIDIw
MTcpIGFuZCBmYWlscwp0byBidWlsZCB3aXRoIGFueSAicmVjZW50IiBrZXJuZWwgKGUuZy4gPj0g
NC43IHdoaWNoIGluY2x1ZGVzCmh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9jb21t
aXQvNTdmYmNjZTM3YmU3YzFkMjYyMmI1NjU4N2MxMGFkZTAwZTk2YWZhMwpvcgpodHRwczovL2dp
dGh1Yi5jb20vdG9ydmFsZHMvbGludXgvY29tbWl0Lzg1NTJhNDM0YjZhMDVjYzM4MDA2NzMzYWZl
NmEyMzlhZDRkNjAwYTIpOgoKL2hvbWUvdGhvbWFzL2F1dG9idWlsZC9pbnN0YW5jZS0xL291dHB1
dC0xL2J1aWxkL3VjY3A0MjB3bGFuLTYuOS4xLy4vc3JjL3R4LmM6IEluIGZ1bmN0aW9uIOKAmHVj
Y3A0MjB3bGFuX3R4X2ZyZWVfYnVmZl9yZXHigJk6Ci9ob21lL3Rob21hcy9hdXRvYnVpbGQvaW5z
dGFuY2UtMS9vdXRwdXQtMS9idWlsZC91Y2NwNDIwd2xhbi02LjkuMS8uL3NyYy90eC5jOjExNDI6
NDk6IGVycm9yOiDigJhJRUVFODAyMTFfQkFORF8yR0ha4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVz
ZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIOKAmElFRUU4MDIxMV9DSEFOXzJHSFri
gJk/CiAxMTQyIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoZXRzX2JhbmQg
PT0gSUVFRTgwMjExX0JBTkRfMkdIWikKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+CiAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSUVFRTgwMjExX0NIQU5f
MkdIWgoKWy4uLl0KCi9ob21lL3Rob21hcy9hdXRvYnVpbGQvaW5zdGFuY2UtMS9vdXRwdXQtMS9i
dWlsZC91Y2NwNDIwd2xhbi02LjkuMS8uL3NyYy9jb3JlLmM6NDI4OjI5OiBlcnJvcjogaW1wbGlj
aXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYaWVlZTgwMjExX2NzYV9pc19jb21wbGV0ZeKA
mTsgZGlkIHlvdSBtZWFuIOKAmGllZWU4MDIxMV9zY2FuX2NvbXBsZXRlZOKAmT8gWy1XZXJyb3I9
aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCiAgNDI4IHwgICAgICAgICAgICAgICAgICAg
ICAgICAgaWYgKGllZWU4MDIxMV9jc2FfaXNfY29tcGxldGUodXZpZi0+dmlmKSkKICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgogICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZWVlODAyMTFfc2Nhbl9jb21wbGV0ZWQK
CkZpeGVzOgogLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy83Y2Q3MTUx
ZTM5MGI4ZjdhMGRmM2U2NDdmZTRjZDVkNjMxOWE4MzBiCgpTaWduZWQtb2ZmLWJ5OiBGYWJyaWNl
IEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KLS0tCiBDb25maWcuaW4ubGVn
YWN5ICAgICAgICAgICAgICAgICAgICAgfCAgNyArKysrKysrCiBwYWNrYWdlL3VjY3A0MjB3bGFu
L0NvbmZpZy5pbiAgICAgICAgfCAxNiAtLS0tLS0tLS0tLS0tLS0tCiBwYWNrYWdlL3VjY3A0MjB3
bGFuL3VjY3A0MjB3bGFuLmhhc2ggfCAgNCAtLS0tCiBwYWNrYWdlL3VjY3A0MjB3bGFuL3VjY3A0
MjB3bGFuLm1rICAgfCAxOCAtLS0tLS0tLS0tLS0tLS0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspLCAzOCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
L3VjY3A0MjB3bGFuL0NvbmZpZy5pbgogZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvdWNjcDQy
MHdsYW4vdWNjcDQyMHdsYW4uaGFzaAogZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvdWNjcDQy
MHdsYW4vdWNjcDQyMHdsYW4ubWsKCmRpZmYgLS1naXQgYS9Db25maWcuaW4ubGVnYWN5IGIvQ29u
ZmlnLmluLmxlZ2FjeQppbmRleCBhZjFkOGNjMWRjLi4zODFlMWUzYThjIDEwMDY0NAotLS0gYS9D
b25maWcuaW4ubGVnYWN5CisrKyBiL0NvbmZpZy5pbi5sZWdhY3kKQEAgLTE0Niw2ICsxNDYsMTMg
QEAgZW5kaWYKIAogY29tbWVudCAiTGVnYWN5IG9wdGlvbnMgcmVtb3ZlZCBpbiAyMDIzLjAyIgog
Citjb25maWcgQlIyX1BBQ0tBR0VfVUNDUDQyMFdMQU4KKwlib29sICJ1Y2NwNDIwd2xhbiByZW1v
dmVkIgorCXNlbGVjdCBCUjJfTEVHQUNZCisJaGVscAorCSAgVGhlIHVjY3A0MjB3bGFuIHBhY2th
Z2UgaXMgdW5tYWludGFpbmVkIGFuZCBkb2Vzbid0IGJ1aWxkCisJICB3aXRoIGFueSAicmVjZW50
IiBrZXJuZWwgKGUuZy4gPj0gNC43KS4KKwogY29uZmlnIEJSMl9QQUNLQUdFX0lNWF9HUFVfRzJE
X0VYQU1QTEVTCiAJYm9vbCAiaW14LWdwdS1nMmQgZXhhbXBsZXMgcmVtb3ZlZCIKIAlzZWxlY3Qg
QlIyX0xFR0FDWQpkaWZmIC0tZ2l0IGEvcGFja2FnZS91Y2NwNDIwd2xhbi9Db25maWcuaW4gYi9w
YWNrYWdlL3VjY3A0MjB3bGFuL0NvbmZpZy5pbgpkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggZWY2YTlkYjg2NS4uMDAwMDAwMDAwMAotLS0gYS9wYWNrYWdlL3VjY3A0MjB3bGFuL0NvbmZp
Zy5pbgorKysgL2Rldi9udWxsCkBAIC0xLDE2ICswLDAgQEAKLWNvbmZpZyBCUjJfUEFDS0FHRV9V
Q0NQNDIwV0xBTgotCWJvb2wgInVjY3A0MjB3bGFuIgotCWRlcGVuZHMgb24gQlIyX0xJTlVYX0tF
Uk5FTAotCWhlbHAKLQkgIFNvZnRNQUMgKG1hYzgwMjExKSBiYXNlZCBXaUZpIGRyaXZlciBmb3Ig
SW1hZ2luYXRpb24ncwotCSAgRXhwbG9yZXIgUlBVIHVjY3A0MjAuIFRoaXMgc3VwcG9ydHMgRHVh
bCBCYW5kIFdpRmkgd2l0aAotCSAgMi40R0h6IC0gMngyIGIvZy9uIDQwTUh6LCA1R0h6IC0gMngy
IGEvbi8xMWFjIDgwTUh6IG1vZGVzCi0KLQkgIFVzZWQgaW4gY3JlYXRvciBjaTQwIGJvYXJkLgot
Ci0JICBUaGlzIG1vZHVsZSBuZWVkcyBhIExpbnV4IGtlcm5lbCA+PSB2NC4yLgotCi0JICBodHRw
czovL2dpdGh1Yi5jb20vQ3JlYXRvckRldi91Y2NwNDIwd2xhbgotCi1jb21tZW50ICJ1Y2NwNDIw
d2xhbiBuZWVkcyBhIExpbnV4IGtlcm5lbCA+PSA0LjIgdG8gYmUgYnVpbHQiCi0JZGVwZW5kcyBv
biAhQlIyX0xJTlVYX0tFUk5FTApkaWZmIC0tZ2l0IGEvcGFja2FnZS91Y2NwNDIwd2xhbi91Y2Nw
NDIwd2xhbi5oYXNoIGIvcGFja2FnZS91Y2NwNDIwd2xhbi91Y2NwNDIwd2xhbi5oYXNoCmRlbGV0
ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA5MDVmYTQyOTlkLi4wMDAwMDAwMDAwCi0tLSBhL3Bh
Y2thZ2UvdWNjcDQyMHdsYW4vdWNjcDQyMHdsYW4uaGFzaAorKysgL2Rldi9udWxsCkBAIC0xLDQg
KzAsMCBAQAotIyBsb2NhbGx5IGNvbXB1dGVkIGhhc2gKLXNoYTI1NiAgMWQ0ZGU2MmZjODQyZGJh
YjczOTcwOGNmMGQ5ZWJjZTI3MGZjZGY2M2MxYzEzYWM2NzZjYmMyNTNhY2RhYTNiYiAgdWNjcDQy
MHdsYW4tNi45LjEudGFyLmd6Ci1zaGEyNTYgIGFmODA2NzMwMjk0N2MwMWZkOWVlZTcyYmVmYTU0
YzdlM2VmOGE0OGZlY2RlN2ZkNzEyNzdmMjI5MGIyYmYwZjcgIENPUFlJTkcKLXNoYTI1NiAgOWFj
NDMxNTg1ZmRkZmU2MjRiMDhjZjc0NjQ4NzZhNWU5NjA2MTA0N2ZmMjZhOWU5MjZkYTNkODlkMjFh
MmE3MyAgZmlybXdhcmUvTElDRU5TRS5pbWFnaW5hdGlvbgpkaWZmIC0tZ2l0IGEvcGFja2FnZS91
Y2NwNDIwd2xhbi91Y2NwNDIwd2xhbi5tayBiL3BhY2thZ2UvdWNjcDQyMHdsYW4vdWNjcDQyMHds
YW4ubWsKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDcyNTZiOTI3NzQuLjAwMDAwMDAw
MDAKLS0tIGEvcGFja2FnZS91Y2NwNDIwd2xhbi91Y2NwNDIwd2xhbi5taworKysgL2Rldi9udWxs
CkBAIC0xLDE4ICswLDAgQEAKLSMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCi0jCi0jIHVjY3A0MjB3
bGFuCi0jCi0jIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwotCi1VQ0NQNDIwV0xBTl9WRVJTSU9OID0g
Ni45LjEKLVVDQ1A0MjBXTEFOX1NJVEUgPSAkKGNhbGwgZ2l0aHViLENyZWF0b3JEZXYsdWNjcDQy
MHdsYW4sdiQoVUNDUDQyMFdMQU5fVkVSU0lPTikpCi1VQ0NQNDIwV0xBTl9MSUNFTlNFID0gR1BM
LTIuMCAoa2VybmVsIG1vZHVsZSksIHByb3ByaWV0YXJ5IChmaXJtd2FyZSBibG9iKQotVUNDUDQy
MFdMQU5fTElDRU5TRV9GSUxFUyA9IENPUFlJTkcgZmlybXdhcmUvTElDRU5TRS5pbWFnaW5hdGlv
bgotCi1kZWZpbmUgVUNDUDQyMFdMQU5fSU5TVEFMTF9UQVJHRVRfQ01EUwotCW1rZGlyIC1wICQo
VEFSR0VUX0RJUikvbGliL2Zpcm13YXJlL2ltZy91Y2NwNDIwd2xhbgotCWNwICQoQEQpL2Zpcm13
YXJlLyoubGRyICQoVEFSR0VUX0RJUikvbGliL2Zpcm13YXJlL2ltZy91Y2NwNDIwd2xhbgotZW5k
ZWYKLQotJChldmFsICQoa2VybmVsLW1vZHVsZSkpCi0kKGV2YWwgJChnZW5lcmljLXBhY2thZ2Up
KQotLSAKMi4zOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
