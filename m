Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACEBCD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C06724189D;
	Wed,  3 Apr 2024 19:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8oloYrVug-gX; Wed,  3 Apr 2024 19:54:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A6484189E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A6484189E;
	Wed,  3 Apr 2024 19:54:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 11BBB1BF982
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F31E840437
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LCpMwPw3EjZL for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:54:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 71217402E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71217402E6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71217402E6
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:54:08 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-343a5b667a8so117609f8f.2
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 12:54:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712174046; x=1712778846;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5BjkWRzKhVI1E6I0OSXWmLbz8/4CgDP9a6kqLcCRVPw=;
 b=KeQTHYi/ZCtFJKd4f3JsuWAPVznHlAUcK2iADTdW6/wMAoWgmuNoFdDWAgXJGaTI9l
 Ng9fJGjnglbmabC6OnBbaBoyZhSD5gUyIJ8Thyg2hKS29ilygwiEIriZQMK4yG1ZazQy
 TC/XRTaqB5LuPSF8Ac4PhJanWMIH+j4+m0gSzxQV2aZWNjBrDNiwSFjiH6mcDBASBuLK
 rIMVcn65SKIhCEbEPGWZv/Anb8wq641VA0he95W19JkPrVBOncQt2ji67jYs/t4R8FtC
 /kAaqAkqd33Q2qtzz/B4JyaH08SPMvl5LAHa4mmUHJyXO6e2k7egFLRLQK657bWrNLfz
 vdZg==
X-Gm-Message-State: AOJu0Yz13L+LoZF1ZAn8WOihcZ0KwaUjq/3UyNv05xQNkbqrjabo6/j9
 3FRlCq2QPfCu9oeLVUnHIalkzAa+zX1ePZfmIPm21b9YL5blOHWCtt+nFBU1sh6fup4VEMdTNXF
 W
X-Google-Smtp-Source: AGHT+IG/KYQhT+6kL37NklZ1AMG/GFcNDLE0BXQcLU/wbrpW2gZkRxiQI2mNl3h6XGJfDgse85fhww==
X-Received: by 2002:adf:cd91:0:b0:343:9e93:11d3 with SMTP id
 q17-20020adfcd91000000b003439e9311d3mr306414wrj.54.1712174046252; 
 Wed, 03 Apr 2024 12:54:06 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 cc13-20020a5d5c0d000000b00341b8edbe8csm15595571wrb.87.2024.04.03.12.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 12:54:06 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 21:53:34 +0200
Message-ID: <20240403195403.1359007-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712174046; x=1712778846;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5BjkWRzKhVI1E6I0OSXWmLbz8/4CgDP9a6kqLcCRVPw=;
 b=0Va3UOeKfYcUkypLgffYwrYAdbnCCypVtFFZmxMuhypRCNnT+jinMg9txJ5x5eguUq
 i5RW9rEXEPtuGcU3N1d2yasZXvH7JkXwD1AgpEJ4NTHTyS7+cybTnxjjDGQuQFsviqJL
 UXwbnpPjonq+QzUyN6g+bQ2SEKgqscTOFqzVCsA/hcSbFgGbwqezxNuQU+dRsZMTYIxB
 HM3GcoWmluIhcXVH/FH73LD84w7e4sTvwdNRnPLmk6uLxDS+R2y/Ivqf2XjeuRuk6Y4/
 FUm2QZv24ndQCJ0DF/GMZQwhMCbpTF1DVI3UngQWVn/pEdVqxdnC0D9ydwaVzzsRDSKW
 0q/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=0Va3UOeK
Subject: [Buildroot] [PATCH v11 00/17] Add support for AM62x-SK HS-FS devices
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBzZXJpZXMgYWltcyBpbml0aWFsbHkgdG8gZml4IEFNNjJ4LVNLIEhTLUZTIGRldmljZXMg
YnV0IGRvaW5nIHNvCndvdWxkIHJlcXVpcmVzIGFkZGluZyBhIFRJIGxlZ2FjeSB0b29sICJ0aS1r
My1jb3JlLXNlY2RldiIgaW50byBCdWlsZHJvb3QuCnRpLWszLWNvcmUtc2VjZGV2IGlzIHJlcGxh
Y2VkIGJ5IHUtYm9vdCdzIGJpbm1hbiB0b29sIHNpbmNlIHYyMDIzLjEwIHJlbGVhc2UKb2YgdS1i
b290LgoKSW5zdGVhZCwgd2UgYnVtcCB0aGUgQlNQIHRvIHVzZSB0aGUgbGF0ZXN0IHUtYm9vdCBy
ZWxlYXNlICgyMDI0LjAxKSB0byB1c2UKYmlubWFuLiBEb2luZyBzbyByZXF1aXJlcyB0byByZXdv
cmsgdGhlIFRJIEszIFNvQyBzdXBwb3J0IGluIEJ1aWxkcm9vdC4KCldpdGggdGhlIGFkdmljZSBv
ZiBBbmRyZWFzIERhbm5lbmJlcmcgKFRJIEszIGFyY2hpdGVjdCksIHdlIHN3aXRjaApBTTYyeC9B
TTYyQXgvQU02NHggdG8gSFMtRlMgYnkgZGVmYXVsdC4KClRlc3RzIHBlcmZvcm1lZCBvbiBlYXJs
aWVyIHJldmlzaW9uIG9mIHRoaXMgc2VyaWVzOgoKKiBjb21waWxlZCB0aV9hbTYyeF9za19kZWZj
b25maWcKICAqIHN1Y2Nlc3MKKiBib290ZWQgb24gQU02MnggU0sgRVZNIChFMykKICAqIHN1Y2Nl
c3MKICAqIG5vIG9idmlvdXMgZXJyb3JzIGluIGRtZXNnCgpUZXN0ZWQtYnk6IEdlcm8gU2Nod8Ok
cmlja2UgPGdlcm8uc2Nod2Flcmlja2UgYXQgZ3JhbmRjZW50cml4Lm5ldD4KCkRhcmlvIEJpbmFj
Y2hpICgxMik6CiAgYm9vdC90aS1rMy1yNS1sb2FkZXI6IGRyb3AgaGFzaCBmb3IgdmVyc2lvbiAy
MDIyLjEwCiAgcGFja2FnZS90aS1rMy1pbWFnZS1nZW46IGRpc2FibGUgSFMtRlMgZm9yIEFNNjUg
U09DCiAgcGFja2FnZS90aS1rMzogbW92ZSBTb0MgZmFtaWxseSBhbmQgc2VjdXJpdHkgdHlwZSBj
aG9pY2VzIG91dCBvZiB0aGUKICAgIGltYWdlLWdlbiBzY29wZQogIGJvb3QvdGktazMtcjUtbG9h
ZGVyOiBhZGQgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfVVNFX0JJTk1BTiBvcHRpb24KICBi
b290L3Vib290OiBhZGQgQlIyX1RBUkdFVF9VQk9PVF9VU0VfQklOTUFOIG9wdGlvbgogIGJvb3Qv
dGktazMtcjUtbG9hZGVyOiBpbnN0YWxsIHRpYm9vdDMuYmluIGFuZCBzeXNmdy5pdGIgdG8KICAg
IEJJTkFSSUVTX0RJUgogIGNvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnOiBidW1wIFUtQm9v
dCB2ZXJzaW9uIHRvIDIwMjQuMDEKICBjb25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZpZzogYnVt
cCBMaW51eCB2ZXJzaW9uIHRvIDYuNi4xOAogIGJvYXJkL3RpL2FtNjJ4LXNrOiBnZW5lcmFsaXpl
IHBvc3QtYnVpbGQuc2gKICBib2FyZC90aS9hbTYyeC1zazogbW92ZSBwb3N0LWJ1aWxkLnNoIHRv
IGJvYXJkL3RpL2NvbW1vbi9hbTZ4eAogIGNvbmZpZ3MvdGlfYW02NHhfc2tfZGVmY29uZmlnOiBi
dW1wIFUtQm9vdCB2ZXJzaW9uIHRvIDIwMjQuMDEKICBjb25maWdzL3RpX2FtNjR4X3NrX2RlZmNv
bmZpZzogYnVtcCBMaW51eCB2ZXJzaW9uIHRvIDYuNi4xOAoKUm9tYWluIE5hb3VyICg1KToKICBi
b2FyZC90aS9hbTZ7Miw0fXgtc2s6IGFkZCBhcm0tdHJ1c3RlZC1maXJtd2FyZSB2Mi43IGhhc2gK
ICBib290L3Vib290OiByZW1vdmUgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19USV9LM19ETSBvcHRp
b24KICBib290L3RpLWszLWltYWdlLWdlbjogcmVtb3ZlIHBhY2thZ2UKICBib290L3RpLWszLXI1
LWxvYWRlcjogcmVtb3ZlIEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX1VTRV9CSU5NQU4KICBw
YWNrYWdlL3RpLWszOiBzd2l0Y2ggQU02MngvQU02MkF4L0FNNjR4IHRvIEhTLUZTIGJ5IGRlZmF1
bHQKCiBDb25maWcuaW4ubGVnYWN5ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxMyAr
KysrCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiAt
CiBib2FyZC90aS9hbTYyeC1zay9nZW5pbWFnZS5jZmcgICAgICAgICAgICAgICAgfCAgNyArLQog
Li4uL2FybS10cnVzdGVkLWZpcm13YXJlLmhhc2ggICAgICAgICAgICAgICAgIHwgIDIgKwogLi4u
L3BhdGNoZXMvbGludXgtaGVhZGVycy9saW51eC1oZWFkZXJzLmhhc2ggIHwgIDEgKwogYm9hcmQv
dGkvYW02Mngtc2svcGF0Y2hlcy9saW51eC9saW51eC5oYXNoICAgIHwgIDIgKwogLi4uL3RpLWsz
LXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIuaGFzaCAgICAgIHwgIDIgKwogYm9hcmQvdGkvYW02
NHgtc2svZ2VuaW1hZ2UuY2ZnICAgICAgICAgICAgICAgIHwgIDcgKy0KIC4uLi9hcm0tdHJ1c3Rl
ZC1maXJtd2FyZS5oYXNoICAgICAgICAgICAgICAgICB8ICAyICsKIC4uLi9wYXRjaGVzL2xpbnV4
LWhlYWRlcnMvbGludXgtaGVhZGVycy5oYXNoICB8ICAxICsKIGJvYXJkL3RpL2FtNjR4LXNrL3Bh
dGNoZXMvbGludXgvbGludXguaGFzaCAgICB8ICAyICsKIC4uLi90aS1rMy1yNS1sb2FkZXIvdGkt
azMtcjUtbG9hZGVyLmhhc2ggICAgICB8ICAxICsKIGJvYXJkL3RpL2NvbW1vbi9hbTZ4eC9wb3N0
LWJ1aWxkLnNoICAgICAgICAgICB8IDU4ICsrKysrKysrKysrKysrCiBib290L0NvbmZpZy5pbiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSAtCiBib290L3RpLWszLWltYWdlLWdl
bi9Db25maWcuaW4gICAgICAgICAgICAgICAgfCA3NyAtLS0tLS0tLS0tLS0tLS0tLS0tCiBib290
L3RpLWszLWltYWdlLWdlbi90aS1rMy1pbWFnZS1nZW4uaGFzaCAgICAgfCAgMyAtCiBib290L3Rp
LWszLWltYWdlLWdlbi90aS1rMy1pbWFnZS1nZW4ubWsgICAgICAgfCA1NCAtLS0tLS0tLS0tLS0t
CiBib290L3RpLWszLXI1LWxvYWRlci9Db25maWcuaW4gICAgICAgICAgICAgICAgfCAyMCArKysr
KwogYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLmhhc2ggICAgIHwgIDEgLQog
Ym9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rICAgICAgIHwgMjUgKysrKyst
CiBib290L3Vib290L0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgfCAzMCArKyst
LS0tLQogYm9vdC91Ym9vdC91Ym9vdC5tayAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTgg
KysrLS0KIGNvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnICAgICAgICAgICAgICAgICB8IDIz
ICsrKy0tLQogY29uZmlncy90aV9hbTY0eF9za19kZWZjb25maWcgICAgICAgICAgICAgICAgIHwg
MjIgKysrKy0tCiBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgMSArCiBwYWNrYWdlL3RpLWszL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgfCA0
NyArKysrKysrKysrKwogcGFja2FnZS90aS1rMy90aS1rMy5tayAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDcgKysKIDI3IGZpbGVzIGNoYW5nZWQsIDI0NSBpbnNlcnRpb25zKCspLCAxODQgZGVs
ZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvdGkvYW02Mngtc2svcGF0Y2hlcy9h
cm0tdHJ1c3RlZC1maXJtd2FyZS9hcm0tdHJ1c3RlZC1maXJtd2FyZS5oYXNoCiBjcmVhdGUgbW9k
ZSAxMjAwMDAgYm9hcmQvdGkvYW02Mngtc2svcGF0Y2hlcy9saW51eC1oZWFkZXJzL2xpbnV4LWhl
YWRlcnMuaGFzaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL3RpL2FtNjJ4LXNrL3BhdGNoZXMv
bGludXgvbGludXguaGFzaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL3RpL2FtNjJ4LXNrL3Bh
dGNoZXMvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5oYXNoCiBjcmVhdGUgbW9kZSAx
MDA2NDQgYm9hcmQvdGkvYW02NHgtc2svcGF0Y2hlcy9hcm0tdHJ1c3RlZC1maXJtd2FyZS9hcm0t
dHJ1c3RlZC1maXJtd2FyZS5oYXNoCiBjcmVhdGUgbW9kZSAxMjAwMDAgYm9hcmQvdGkvYW02NHgt
c2svcGF0Y2hlcy9saW51eC1oZWFkZXJzL2xpbnV4LWhlYWRlcnMuaGFzaAogY3JlYXRlIG1vZGUg
MTAwNjQ0IGJvYXJkL3RpL2FtNjR4LXNrL3BhdGNoZXMvbGludXgvbGludXguaGFzaAogY3JlYXRl
IG1vZGUgMTAwNjQ0IGJvYXJkL3RpL2FtNjR4LXNrL3BhdGNoZXMvdGktazMtcjUtbG9hZGVyL3Rp
LWszLXI1LWxvYWRlci5oYXNoCiBjcmVhdGUgbW9kZSAxMDA3NTUgYm9hcmQvdGkvY29tbW9uL2Ft
Nnh4L3Bvc3QtYnVpbGQuc2gKIGRlbGV0ZSBtb2RlIDEwMDY0NCBib290L3RpLWszLWltYWdlLWdl
bi9Db25maWcuaW4KIGRlbGV0ZSBtb2RlIDEwMDY0NCBib290L3RpLWszLWltYWdlLWdlbi90aS1r
My1pbWFnZS1nZW4uaGFzaAogZGVsZXRlIG1vZGUgMTAwNjQ0IGJvb3QvdGktazMtaW1hZ2UtZ2Vu
L3RpLWszLWltYWdlLWdlbi5tawogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvdGktazMvQ29u
ZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS90aS1rMy90aS1rMy5tawoKLS0KMi40
NC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
