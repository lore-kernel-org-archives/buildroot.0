Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F44C4828F
	for <buildroot@archiver.kernel.org>; Fri,  9 Feb 2024 02:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FC1D42CF0;
	Fri,  9 Feb 2024 02:15:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8sr_wLrhXMrI; Fri,  9 Feb 2024 02:15:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A738342CF4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A738342CF4;
	Fri,  9 Feb 2024 02:15:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 859271BF616
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 02:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72EA085214
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 02:15:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id psymu758tzQK for <buildroot@lists.busybox.net>;
 Fri,  9 Feb 2024 02:15:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.48;
 helo=mail-ed1-f48.google.com; envelope-from=jdknight@jdknight.me;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5B8ED85211
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B8ED85211
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B8ED85211
 for <buildroot@buildroot.org>; Fri,  9 Feb 2024 02:15:05 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5605c7b1f32so683118a12.0
 for <buildroot@buildroot.org>; Thu, 08 Feb 2024 18:15:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707444903; x=1708049703;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FS97rv+mJ+BojaCVg3bjBTW3ZmLb9XNjTbPq/sbotDk=;
 b=i5L6+4e5TTgWfyr0AN3MtQ9L9PsQwIB5gX6lht9nBPYXEuoHW33bEWB/ULCuv+ASAg
 K/5jtQeBap6UWqQ4N7IxLqt5VCk5HlBtA3xFM/Bflk5HT9DmXV9DkoePbjzvdN3CZVE6
 iq9GQ9Ny7XbW/EH5gcH2EagWgodX6EFZQvkYEFtAmqryO3TXIF6xSFf0UEPCogpNCv72
 jg9mXvpSxSxzQ8uA6Ty+oLaLpakf9cB/lvP5CIQwQ3HtbcmckSkw9x29UjvAxPCovNvy
 J6YkdiDYunf6X5GhH6+7uIYJenbxMMwd7mS1CXvxnZ6PYeBR+gblJRpLepcCLHp5BRaA
 sc3g==
X-Gm-Message-State: AOJu0YyRiysPTezXXd+n20IpT6UQd+9gPsFIdUZ5ogWPDezzTSKBijEb
 Pxp8QR0HZEVV464xBkvWHBj2MbJMlCQbYqpODnsjaoS4Ys6MlgHw+wHHWPNc1W1uM5BRKNc6dEI
 e+SW5cSBfb9t42ws+vmYjI/tEoAs0ifdNhWWGaSxKKxXtRpG29+o=
X-Google-Smtp-Source: AGHT+IFgJEYi1IfNKOYtOTMfLZb9OS58oKCAXVx3b3McwVJ0aHYho+cJIi4uD3MZxE1ptYfIB8+f9jGUYzcdV3BGllM=
X-Received: by 2002:a05:6402:31e3:b0:560:463:8cd7 with SMTP id
 dy3-20020a05640231e300b0056004638cd7mr231946edb.34.1707444903178; Thu, 08 Feb
 2024 18:15:03 -0800 (PST)
MIME-Version: 1.0
References: <20240206222231.8950D87481@busybox.osuosl.org>
In-Reply-To: <20240206222231.8950D87481@busybox.osuosl.org>
From: James Knight <james.d.knight@live.com>
Date: Thu, 8 Feb 2024 21:14:52 -0500
Message-ID: <CALAjcgVd0VGDZCRpH3cpeikpNH0ZZOkV9c667cH6GQhMa8qtTg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=live.com
Subject: Re: [Buildroot] [git commit] package/python3: bump version to 3.12.1
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rm9yIHRob3NlIHBsYXlpbmcgd2l0aCB0aGlzIG5ldyBQeXRob24gdmVyc2lvbiwKCk9uIFR1ZSwg
RmViIDYsIDIwMjQgYXQgNToyMeKAr1BNIFRob21hcyBQZXRhenpvbmkgdmlhIGJ1aWxkcm9vdAo8
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgo+IGNvbW1pdDogaHR0cHM6Ly9naXQuYnVp
bGRyb290Lm5ldC9idWlsZHJvb3QvY29tbWl0Lz9pZD0zNmU2MzVkMmQ1YzAxNjY0NzY4NThhYTIz
OWNjYmU3OGU4ZjJhZjE0Cj4gYnJhbmNoOiBodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxk
cm9vdC9jb21taXQvP2lkPXJlZnMvaGVhZHMvbWFzdGVyCgpJIG5vdGljZWQgYWZ0ZXIgdGhpcyBw
YXRjaCwgSSBjYW4gbm8gbG9uZ2VyIGJ1aWxkIHRoZSAicHl0aG9uMyIKcGFja2FnZSBmb3IgbXkg
eDg2XzY0IGNvbmZpZ3VyYXRpb24uIEkgc2VlIHNvbWUgdGFsayBvbiB0aGUgbWFpbGluZwpsaXN0
IGFib3V0IG1heWJlIG90aGVyIGlzc3VlcyB3aXRoIHRoaXMgdmVyc2lvbiBvZiBQeXRob24gKGlm
IEkgaGF2ZQppbnRlcnByZXRlZCB0aGlzIGNvcnJlY3RseSkuIEkgYW0gYWxzbyBwbGFubmluZyB0
byBpbnZlc3RpZ2F0ZSB3aHkgSSdtCmhhdmluZyB0aGlzIGlzc3VlIHNvb24sIGJ1dCBJIHdhbnRl
ZCB0byBnaXZlIGEgaGVhZHMtdXAganVzdCBpbiBjYXNlCnRoaXMgaW5mb3JtYXRpb24gaGVscHMu
CgpUaGUgYnVpbGQgaXNzdWUgdGhhdCBvY2N1cnMgaXMgdGhlIGZvbGxvd2luZzoKCiAgICA+Pj4g
cHl0aG9uMyAzLjEyLjEgQnVpbGRpbmcKICAgIEdJVF9ESVI9LiBQQVRIPSIvYnVpbGRzL2J1aWxk
cm9vdC9vdXRwdXQvaG9zdC9iaW46L2J1aWxkcy9idWlsZHJvb3Qvb3V0cHV0L2hvc3Qvc2Jpbjov
dXNyL2xvY2FsL3NiaW46L3Vzci9sb2NhbC9iaW46L3Vzci9zYmluOi91c3IvYmluOi9zYmluOi9i
aW4iCiAvdXNyL2Jpbi9tYWtlIC1qMzMgIC1DIC9idWlsZHMvYnVpbGRyb290L291dHB1dC9idWls
ZC9weXRob24zLTMuMTIuMS8KICAgIG1ha2VbMV06IEVudGVyaW5nIGRpcmVjdG9yeSAnL2J1aWxk
cy9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL3B5dGhvbjMtMy4xMi4xJwogICAgLi4uCiAgICAvYnVp
bGRzL2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9iaW4veDg2XzY0LW90dGNoYWluLWxpbnV4LWdudS1n
Y2MKLXNoYXJlZCAgICAgLVdsLC0tbm8tYXMtbmVlZGVkIC1vIGxpYnB5dGhvbjMuc28gLVdsLC1o
bGlicHl0aG9uMy5zbwpsaWJweXRob24zLjEyLnNvCiAgICAvYnVpbGRzL2J1aWxkcm9vdC9vdXRw
dXQvaG9zdC9iaW4veDg2XzY0LW90dGNoYWluLWxpbnV4LWdudS1nY2MKIC1YbGlua2VyIC1leHBv
cnQtZHluYW1pYyAtbyBweXRob24gUHJvZ3JhbXMvcHl0aG9uLm8gLUwuIC1scHl0aG9uMy4xMgot
bGRsICAtbHB0aHJlYWQgICAgICAgICAgICAgICAgICAgICAgICAtbG0KICAgIC9idWlsZHMvYnVp
bGRyb290L291dHB1dC9ob3N0L2Jpbi94ODZfNjQtb3R0Y2hhaW4tbGludXgtZ251LWdjYwogLVhs
aW5rZXIgLWV4cG9ydC1keW5hbWljIC1vIFByb2dyYW1zL190ZXN0ZW1iZWQgUHJvZ3JhbXMvX3Rl
c3RlbWJlZC5vCi1MLiAtbHB5dGhvbjMuMTIgLWxkbCAgLWxwdGhyZWFkICAgICAgICAgICAgICAg
ICAgICAgICAgLWxtCiAgICBUcmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6CiAgICAg
IEZpbGUgIi9idWlsZHMvYnVpbGRyb290L291dHB1dC9idWlsZC9weXRob24zLTMuMTIuMS8uL1Rv
b2xzL2J1aWxkL2NoZWNrX2V4dGVuc2lvbl9tb2R1bGVzLnB5IiwKbGluZSAyNSwgaW4gPG1vZHVs
ZT4KICAgICAgICBpbXBvcnQgcGF0aGxpYgogICAgICBGaWxlICIvYnVpbGRzL2J1aWxkcm9vdC9v
dXRwdXQvYnVpbGQvcHl0aG9uMy0zLjEyLjEvTGliL3BhdGhsaWIucHkiLApsaW5lIDIwLCBpbiA8
bW9kdWxlPgogICAgICAgIGZyb20gdXJsbGliLnBhcnNlIGltcG9ydCBxdW90ZV9mcm9tX2J5dGVz
IGFzIHVybHF1b3RlX2Zyb21fYnl0ZXMKICAgICAgRmlsZSAiL2J1aWxkcy9idWlsZHJvb3Qvb3V0
cHV0L2J1aWxkL3B5dGhvbjMtMy4xMi4xL0xpYi91cmxsaWIvcGFyc2UucHkiLApsaW5lIDM2LCBp
biA8bW9kdWxlPgogICAgICAgIGltcG9ydCBtYXRoCiAgICBJbXBvcnRFcnJvcjogL2xpYi94ODZf
NjQtbGludXgtZ251L2xpYm0uc28uNjogdmVyc2lvbiBgR0xJQkNfMi4zOCcKbm90IGZvdW5kIChy
ZXF1aXJlZCBieQovYnVpbGRzL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvcHl0aG9uMy0zLjEyLjEv
YnVpbGQvbGliLmxpbnV4LXg4Nl82NC0zLjEyL21hdGguY3B5dGhvbi0zMTIteDg2XzY0LWxpbnV4
LWdudS5zbykKICAgIG1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5ICcvYnVpbGRzL2J1aWxkcm9v
dC9vdXRwdXQvYnVpbGQvcHl0aG9uMy0zLjEyLjEnCiAgICBtYWtlWzFdOiAqKiogW01ha2VmaWxl
OjExMjA6IGNoZWNrc2hhcmVkbW9kc10gRXJyb3IgMQogICAgbWFrZTogKioqIFtwYWNrYWdlL3Br
Zy1nZW5lcmljLm1rOjI4MzoKL2J1aWxkcy9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL3B5dGhvbjMt
My4xMi4xLy5zdGFtcF9idWlsdF0gRXJyb3IgMgoKRmlyc3Qgbm90aWNlZCB0aGlzIGlzc3VlIHVz
aW5nIHRoZSBtb3N0IHJlY2VudCBzb3VyY2VzIG9mIEJ1aWxkcm9vdAooYXQgdGhlIHRpbWU6IDM1
ZWI3NGM2MzQzYTllYzE0MDdmYjQ3MzI3MWRkYTA1MTY3OTIzOTEpLiBUZXN0ZWQgbXkKYnVpbGQg
YWdhaW5zdCBzb21lIG9sZCBjb21taXRzIGFuZCB3YXMgYWJsZSB0byBjb25maXJtIHRoYXQgdGhl
IGJ1aWxkCndvcmtzIHdpdGggIjA5ZGU4MjNjYmM3YmQ1MGE0MGUyNWY0MTY2YjRlNDJiZTk0YjBj
N2IiLCBidXQgZmFpbHMgYXQKIjM2ZTYzNWQyZDVjMDE2NjQ3Njg1OGFhMjM5Y2NiZTc4ZThmMmFm
MTQiICh0aGlzIHBhdGNoKS4KCkFkZGl0aW9uYWwgaW5mb3JtYXRpb246Ci0gQnVpbGRyb290IGNv
bmZpZ3VyYXRpb246IEJSMl94ODZfNjQ9eSwgdXNpbmcgYSBjcm9zc3Rvb2wtbmcKdG9vbGNoYWlu
ICh2MS4yNi4wKzZjZjY1ZDsgQ1RfQVJDSF9YODY9eTsgQ1RfQVJDSF82ND15OyBHQ0MgMTMpCi0g
SG9zdDogVWJ1bnR1IDIyLjA0LjMgTFRTIChKYW1teSBKZWxseWZpc2gpIChEb2NrZXIgY29udGFp
bmVyOiB1YnVudHU6bGF0ZXN0KQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
