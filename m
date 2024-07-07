Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A86C30653
	for <buildroot@archiver.kernel.org>; Sun,  7 Jul 2024 05:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3996E4069D;
	Sun,  7 Jul 2024 05:50:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tar2TljCfjZE; Sun,  7 Jul 2024 05:50:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E65BC4074F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E65BC4074F;
	Sun,  7 Jul 2024 05:50:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB53E1BF834
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 05:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8E9E607BA
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 05:50:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m2fXjqAf5h4K for <buildroot@lists.busybox.net>;
 Sun,  7 Jul 2024 05:50:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 69E5B607A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69E5B607A5
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 69E5B607A5
 for <buildroot@buildroot.org>; Sun,  7 Jul 2024 05:50:14 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52e94eaf5efso3315638e87.2
 for <buildroot@buildroot.org>; Sat, 06 Jul 2024 22:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720331412; x=1720936212;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=shZqiYfrJdnlsK0bPe/WkYIprepNTnxefgX9sJHn3LM=;
 b=XHdyo1Ebj0AstPX7hlZymCy8AtjKpi0xO++Ki6JViXzfyuWxFq2kIahqeuOO6VGQyR
 dIe2MbJ/YNc+Xo8146BVJhmHG5V0Dsge5W+wSnPGFpTwU1T95kn6HgFT1Bg4nd/MQ2wg
 urKYdFVdnVwbRZLF/Iaf5BqWBxJmSVTmU8enpGuyWS7hCQY4aEw+Vcsq6zraHshuPSrn
 9qWTEU5QRdFo0fIUzdIz5gMnRFARwl216WfEOV8REVrzmPUQop3Oo5yEDE1HyyW0ngAx
 xq9lDE1oMvQ/Ln1BA1w5j5KTXjC569thi6m7ubO8dgZ1RXOf5BG3L9Mo/2KMFiGOLtMl
 KDig==
X-Gm-Message-State: AOJu0YwZwe6kvnPlkO6GKiS/MLyzNzo9fwlQg2XuG0nhCodW7Ag6sb9h
 XCEWeQS77ly4ykIee0zNYQ5keI2N6pUWm+LbAecl523M9FDRwCGeaZg9zuvXSzZ9qAzccFoZd55
 4WB4=
X-Google-Smtp-Source: AGHT+IGHCsutw2DPm+X36NqA9aDjgJc7d/GE1FbtmgQhjpii6Aq6sDVaOwfQpuW3rKixohCa9Fl1pw==
X-Received: by 2002:a05:6512:3687:b0:52c:dfa2:5ac1 with SMTP id
 2adb3069b0e04-52ea062e4f6mr5359296e87.24.1720331411569; 
 Sat, 06 Jul 2024 22:50:11 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-30-97-245.retail.telecomitalia.it. [79.30.97.245])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77cc73d48asm190178866b.21.2024.07.06.22.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jul 2024 22:50:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jul 2024 07:50:05 +0200
Message-ID: <20240707055007.3839165-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720331412; x=1720936212;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=shZqiYfrJdnlsK0bPe/WkYIprepNTnxefgX9sJHn3LM=;
 b=BPOvet6Ydya0Yv4djG3KJQrWpNCJv0VJ1o2ieoqBFepQpeGv0V2FMoQy1nHnRaiF/3
 G24RXXcvjNOBl5flVbn0XgrrzzfF3UlQdwUXkhTzl9EnEy8ZVfAYDhg2+vMjw8FnGxMW
 5vzTN/4OFgUGvhFRO/HW/H0yKdOBDKCiDw1j4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=BPOvet6Y
Subject: [Buildroot] [PATCH 1/1] package/monit: update the patches to be
 applied with fuzz 0
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
 linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q29tbWl0IDhmODhhNjQ0ZWQ3ZDYgKCJzdXBwb3J0L3NjcmlwdHMvYXBwbHktcGF0Y2hlcy5zaDog
c2V0IHRoZSBtYXhpbXVtCmZ1enogZmFjdG9yIHRvIDAiKSByZWR1Y2VkIHRoZSBmdXp6IGZhY3Rv
ci4KCkR1ZSB0byB0aGlzIGNoYW5nZSwgbW9uaXQgZmFpbHMgdG8gYnVpbGQgd2l0aCBvdXRwdXQ6
CgogICAgQXBwbHlpbmcgMDAwMS1uby1mb3JjZS1zdGF0aWMucGF0Y2ggdXNpbmcgcGF0Y2g6CiAg
ICBwYXRjaGluZyBmaWxlIE1ha2VmaWxlLmFtCiAgICBIdW5rICMxIEZBSUxFRCBhdCA4NS4KICAg
IDEgb3V0IG9mIDEgaHVuayBGQUlMRUQgLS0gc2F2aW5nIHJlamVjdHMgdG8gZmlsZSBNYWtlZmls
ZS5hbS5yZWoKCiAgICBBcHBseWluZyAwMDAyLWNvbmZpZ3VyZS5hYy1maXhlcy1taXNzaW5nLWNv
bmZpZy1tYWNyby1kaXIucGF0Y2ggdXNpbmcgcGF0Y2g6CiAgICBwYXRjaGluZyBmaWxlIGNvbmZp
Z3VyZS5hYwogICAgSHVuayAjMSBGQUlMRUQgYXQgOC4KICAgIDEgb3V0IG9mIDEgaHVuayBGQUlM
RUQgLS0gc2F2aW5nIHJlamVjdHMgdG8gZmlsZSBjb25maWd1cmUuYWMucmVqCgpUaGlzIGNvbW1p
dCByZWZyZXNoZXMgdGhlIHBhY2thZ2UgcGF0Y2hlcyBvbiB0aGUgY3VycmVudCBwYWNrYWdlIHZl
cnNpb24uCgpTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1h
cnVsYXNvbHV0aW9ucy5jb20+Ci0tLQogcGFja2FnZS9tb25pdC8wMDAxLW5vLWZvcmNlLXN0YXRp
Yy5wYXRjaCAgICAgICAgICAgICAgICAgIHwgOCArKysrKy0tLQogLi4uMDAwMi1jb25maWd1cmUu
YWMtZml4ZXMtbWlzc2luZy1jb25maWctbWFjcm8tZGlyLnBhdGNoIHwgNiArKysrLS0KIDIgZmls
ZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3BhY2thZ2UvbW9uaXQvMDAwMS1uby1mb3JjZS1zdGF0aWMucGF0Y2ggYi9wYWNrYWdlL21vbml0
LzAwMDEtbm8tZm9yY2Utc3RhdGljLnBhdGNoCmluZGV4IGVkYjYxOWI1NDE1Mi4uNDYzNGE5NTFm
M2M3IDEwMDY0NAotLS0gYS9wYWNrYWdlL21vbml0LzAwMDEtbm8tZm9yY2Utc3RhdGljLnBhdGNo
CisrKyBiL3BhY2thZ2UvbW9uaXQvMDAwMS1uby1mb3JjZS1zdGF0aWMucGF0Y2gKQEAgLTUsMTMg
KzUsMTUgQEAgc3RpbGwgZGxvcGVuKClzIHRoZSBOU1MgbGlicmFyaWVzLgogCiBSZXBvcnRlZC1i
eTogUGV0ZXIgS8O8bW1lbCA8c3ludGhldGljcHBAZ214Lm5ldD4KIFNpZ25lZC1vZmYtYnk6ICJZ
YW5uIEUuIE1PUklOIiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+CitbRGFyaW86IG1ha2UgdGhl
IHBhdGNoIHRvIGJlIGFwcGxpZWQgd2l0aCBmdXp6IGZhY3RvciAwXQorU2lnbmVkLW9mZi1ieTog
RGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgogCiBk
aWZmIC1kdXJOIG1vbml0LTUuNy5vcmlnL01ha2VmaWxlLmFtIG1vbml0LTUuNy9NYWtlZmlsZS5h
bQogLS0tIG1vbml0LTUuNy5vcmlnL01ha2VmaWxlLmFtCTIwMTQtMDItMjAgMDk6MDA6NDIuMDAw
MDAwMDAwICswMTAwCiArKysgbW9uaXQtNS43L01ha2VmaWxlLmFtCTIwMTQtMDktMDUgMTI6NDk6
NDMuNzExMTA0MDAxICswMjAwCi1AQCAtODUsNyArODUsNyBAQAotIAkJICBzcmMvcHJvY2Vzcy9z
eXNkZXBfQEFSQ0hALmMKLSAgCitAQCAtOTcsNyArOTcsNyBAQAorICAgICAgICAgICAgICAgICAg
IHNyYy9zdGF0aXN0aWNzL1N0YXRpc3RpY3MuYworIAogIG1vbml0X0xEQUREIAk9IGxpYm1vbml0
L2xpYm1vbml0LmxhCiAtbW9uaXRfTERGTEFHUyAJPSAtc3RhdGljICQoRVhUTERGTEFHUykKICtt
b25pdF9MREZMQUdTIAk9ICQoRVhUTERGTEFHUykKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbW9uaXQv
MDAwMi1jb25maWd1cmUuYWMtZml4ZXMtbWlzc2luZy1jb25maWctbWFjcm8tZGlyLnBhdGNoIGIv
cGFja2FnZS9tb25pdC8wMDAyLWNvbmZpZ3VyZS5hYy1maXhlcy1taXNzaW5nLWNvbmZpZy1tYWNy
by1kaXIucGF0Y2gKaW5kZXggMzI1ZGNjMTdlMTM2Li4zMWIyMGIzY2JjOWIgMTAwNjQ0Ci0tLSBh
L3BhY2thZ2UvbW9uaXQvMDAwMi1jb25maWd1cmUuYWMtZml4ZXMtbWlzc2luZy1jb25maWctbWFj
cm8tZGlyLnBhdGNoCisrKyBiL3BhY2thZ2UvbW9uaXQvMDAwMi1jb25maWd1cmUuYWMtZml4ZXMt
bWlzc2luZy1jb25maWctbWFjcm8tZGlyLnBhdGNoCkBAIC04LDYgKzgsOCBAQCBzbyB0aGF0IG00
IG1hY3JvcyBhcmUgcHJvcGVybHkgbG9hZGVkIHVwb24gYXV0b3JlY29uZiB1c2UuCiAKIFVwc3Ry
ZWFtOiBOL0EgKHNwZWNpZmljIHRvIGJ1aWxkcm9vdCkKIFNpZ25lZC1vZmYtYnk6IEplbnMgTWF1
cyA8bWFpbEBqZW5zLW1hdXMuZGU+CitbRGFyaW86IG1ha2UgdGhlIHBhdGNoIHRvIGJlIGFwcGxp
ZWQgd2l0aCBmdXp6IGZhY3RvciAwXQorU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRh
cmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgogLS0tCiAgY29uZmlndXJlLmFjICAg
ICAgICAgIHwgMiArLQogIGxpYm1vbml0L2NvbmZpZ3VyZS5hYyB8IDIgKy0KQEAgLTE3LDkgKzE5
LDkgQEAgZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwogaW5kZXggM2Mz
ZDMwYTIuLmY0YzVlYTA3IDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1
cmUuYWMKLUBAIC04LDcgKzgsNyBAQCBBQ19QUkVSRVEoWzIuNTNdKQorQEAgLTgsNyArOCw3IEBA
CiAgIyBFeGFtcGxlOiA1LjBfYmV0YTIKLSBBQ19JTklUKFttb25pdF0sIFs1LjM0LjBdLCBbbW9u
aXQtZ2VuZXJhbEBub25nbnUub3JnXSkKKyBBQ19JTklUKFttb25pdF0sIFs1LjMzLjBdLCBbbW9u
aXQtZ2VuZXJhbEBub25nbnUub3JnXSkKICBBQ19DT05GSUdfQVVYX0RJUihjb25maWcpCiAtQUNf
Q09ORklHX01BQ1JPX0RJUihbbTRdKQogK0FDX0NPTkZJR19NQUNST19ESVJTKFttNCBjb25maWdd
KQotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
