Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36314EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 19:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A009940193;
	Mon, 26 Jun 2023 19:07:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A009940193
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fOl6BPk7Vi6Q; Mon, 26 Jun 2023 19:07:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A71840571;
	Mon, 26 Jun 2023 19:07:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A71840571
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5FCBC1BF334
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 19:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37C0B60761
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 19:07:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37C0B60761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qX9MbSUcCOYY for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 19:07:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7D2160750
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A7D2160750
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 19:07:16 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-988a076a7d3so545863066b.3
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 12:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687806434; x=1690398434;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=llbtLMgc0K8vgztjlsbIOdWsiOyn6OWgY0bwTqzqBJo=;
 b=LhOgV0p4P7CTO2TnSobwydBr9Bp7g//DvBTIn+RSi+4Af7Y1jJ0IzrypzJrUeSIr48
 SYVwMqMkIUfw/+wy+RGzFZQJjdKelpgHAfvqynhnbMOnZMNnBJgSRMBW8gFnvKdX2X9c
 yvRStR/+fxEgyeUjiohGHysKJD9IMm9LcaBinzpib9jZfhsjy4k/wlNvsZDxq7YqzcKE
 3UNeSwSEFRocIoZ6u+U8pQAFZKmAUNOFhtqUqrtrmvz2drT5H0ai3aKogz/YW+QRl9OL
 ZUq3w6VuYRvw+ubfgCfzbyfyPzfSgeRHSV/cPZTT/5oKVadlvMiXrgr4Rfhs6sCSwaJn
 Dl5Q==
X-Gm-Message-State: AC+VfDx4AOK/xj+AL+WB6ziW1GjWBmE9d31HTK2abQC4ABpjtE6P1L6g
 qzJ4uklFT6etyvwk7yn9GtmBNJiQTjOicKNH
X-Google-Smtp-Source: ACHHUZ5GEDmMG2wjfMIQhQQzH6cXOoHfLwDLxrsQx7+cFB0IfhZJqWnEERY28Gp7V5NJRiLh4lqQDQ==
X-Received: by 2002:a2e:8497:0:b0:2b6:a630:1e7 with SMTP id
 b23-20020a2e8497000000b002b6a63001e7mr1426006ljh.37.1687805901658; 
 Mon, 26 Jun 2023 11:58:21 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com.
 [209.85.208.52]) by smtp.gmail.com with ESMTPSA id
 u12-20020a05640207cc00b0051bf998b25fsm3088935edy.44.2023.06.26.11.58.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jun 2023 11:58:21 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-51bece5d935so4934433a12.1
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 11:58:20 -0700 (PDT)
X-Received: by 2002:aa7:d458:0:b0:51b:df1d:ebc3 with SMTP id
 q24-20020aa7d458000000b0051bdf1debc3mr11366754edr.25.1687805900742; Mon, 26
 Jun 2023 11:58:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230606214556.174086-1-christian@aperture.us>
 <CADXxVSJN_s=UkATganO9Bdghec=fPuAdoLZAx2-V3M33UKd_Dw@mail.gmail.com>
 <CA+h8R2pw8ZpZ43AeO3XVZ5ea4JhEN4TWbpErHYgCWL1Gv+JTqQ@mail.gmail.com>
In-Reply-To: <CA+h8R2pw8ZpZ43AeO3XVZ5ea4JhEN4TWbpErHYgCWL1Gv+JTqQ@mail.gmail.com>
From: Bryce Johnson <bryce@redpinelabs.com>
Date: Mon, 26 Jun 2023 12:58:09 -0600
X-Gmail-Original-Message-ID: <CADXxVS+x4WikuxYagouCJa0DA=sZjJ+-35Qnv=vL=K=1eVmKRw@mail.gmail.com>
Message-ID: <CADXxVS+x4WikuxYagouCJa0DA=sZjJ+-35Qnv=vL=K=1eVmKRw@mail.gmail.com>
To: Christian Stewart <christian@aperture.us>
Subject: Re: [Buildroot] [PATCH v6 1/3] package/go-bootstrap: split into two
 stages: go1.4 and go1.19.10
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQ2hyaXN0aWFuLApZb3VyIHBhdGNoc2V0IHNlZW1zIHRvIGJlIHdvcmtpbmcgd2VsbCBlbm91
Z2ggZm9yIG1lIHRvIGRvIGEgbGl0dGxlIHByb3RvdHlwaW5nLgoKSGVyZSBpcyB0aGUgZXJyb3I6
Cgo+Pj4gaG9zdC1nby1ib290c3RyYXAtc3RhZ2UyIDEuMTkuMTAgSW5zdGFsbGluZyB0byBob3N0
IGRpcmVjdG9yeQovdXNyL2Jpbi9pbnN0YWxsIC1EIC1tIDA3NTUKL2hvbWUvam9obnNvbmIvYnVp
bGRyb290MS9vdXRwdXQvYnVpbGQvaG9zdC1nby1ib290c3RyYXAtc3RhZ2UyLTEuMTkuMTAvYmlu
L2dvCi9ob21lL2pvaG5zb25iL2J1aWxkcm9vdDEvb3V0cHV0L3Blci1wYWNrYWdlL2hvc3QtZ28t
Ym9vdHN0cmFwLXN0YWdlMi9ob3N0L2xpYi9nby0xLjE5LjEwL2Jpbi9nbwovdXNyL2Jpbi9pbnN0
YWxsIC1EIC1tIDA3NTUKL2hvbWUvam9obnNvbmIvYnVpbGRyb290MS9vdXRwdXQvYnVpbGQvaG9z
dC1nby1ib290c3RyYXAtc3RhZ2UyLTEuMTkuMTAvYmluL2dvZm10Ci9ob21lL2pvaG5zb25iL2J1
aWxkcm9vdDEvb3V0cHV0L3Blci1wYWNrYWdlL2hvc3QtZ28tYm9vdHN0cmFwLXN0YWdlMi9ob3N0
L2xpYi9nby0xLjE5LjEwL2Jpbi9nb2ZtdApjcCAtYSAvaG9tZS9qb2huc29uYi9idWlsZHJvb3Qx
L291dHB1dC9idWlsZC9ob3N0LWdvLWJvb3RzdHJhcC1zdGFnZTItMS4xOS4xMC9saWIKL2hvbWUv
am9obnNvbmIvYnVpbGRyb290MS9vdXRwdXQvcGVyLXBhY2thZ2UvaG9zdC1nby1ib290c3RyYXAt
c3RhZ2UyL2hvc3QvbGliL2dvLTEuMTkuMTAvCm1rZGlyIC1wIC9ob21lL2pvaG5zb25iL2J1aWxk
cm9vdDEvb3V0cHV0L3Blci1wYWNrYWdlL2hvc3QtZ28tYm9vdHN0cmFwLXN0YWdlMi9ob3N0L2xp
Yi9nby0xLjE5LjEwL3BrZwpjcCAtYSAvaG9tZS9qb2huc29uYi9idWlsZHJvb3QxL291dHB1dC9i
dWlsZC9ob3N0LWdvLWJvb3RzdHJhcC1zdGFnZTItMS4xOS4xMC9wa2cvaW5jbHVkZQovaG9tZS9q
b2huc29uYi9idWlsZHJvb3QxL291dHB1dC9idWlsZC9ob3N0LWdvLWJvb3RzdHJhcC1zdGFnZTIt
MS4xOS4xMC9wa2cvbGludXhfKgovaG9tZS9qb2huc29uYi9idWlsZHJvb3QxL291dHB1dC9wZXIt
cGFja2FnZS9ob3N0LWdvLWJvb3RzdHJhcC1zdGFnZTIvaG9zdC9saWIvZ28tMS4xOS4xMC9wa2cv
CmNwIC1hIC9ob21lL2pvaG5zb25iL2J1aWxkcm9vdDEvb3V0cHV0L2J1aWxkL2hvc3QtZ28tYm9v
dHN0cmFwLXN0YWdlMi0xLjE5LjEwL3BrZy90b29sCi9ob21lL2pvaG5zb25iL2J1aWxkcm9vdDEv
b3V0cHV0L3Blci1wYWNrYWdlL2hvc3QtZ28tYm9vdHN0cmFwLXN0YWdlMi9ob3N0L2xpYi9nby0x
LjE5LjEwL3BrZy8KIyBUaGUgR28gc291cmNlcyBtdXN0IGJlIGluc3RhbGxlZCB0byB0aGUgaG9z
dC8gdHJlZSBmb3IgdGhlIEdvIHN0ZGxpYi4KY3AgLWEgL2hvbWUvam9obnNvbmIvYnVpbGRyb290
MS9vdXRwdXQvYnVpbGQvaG9zdC1nby1ib290c3RyYXAtc3RhZ2UyLTEuMTkuMTAvc3JjCi9ob21l
L2pvaG5zb25iL2J1aWxkcm9vdDEvb3V0cHV0L3Blci1wYWNrYWdlL2hvc3QtZ28tYm9vdHN0cmFw
LXN0YWdlMi9ob3N0L2xpYi9nby0xLjE5LjEwLwo+Pj4gaG9zdC1nbyAxLjIwLjUgQ29uZmlndXJp
bmcKbWtkaXIgLXAgL2hvbWUvam9obnNvbmIvYnVpbGRyb290MS9vdXRwdXQvcGVyLXBhY2thZ2Uv
aG9zdC1nby9ob3N0CnJzeW5jIC1hIC0tbGluay1kZXN0PS9ob21lL2pvaG5zb25iL2J1aWxkcm9v
dDEvb3V0cHV0L3Blci1wYWNrYWdlL2hvc3QtZ28tYm9vdHN0cmFwLXN0YWdlMi9ob3N0LwovaG9t
ZS9qb2huc29uYi9idWlsZHJvb3QxL291dHB1dC9wZXItcGFja2FnZS9ob3N0LWdvLWJvb3RzdHJh
cC1zdGFnZTIvaG9zdC8KL2hvbWUvam9obnNvbmIvYnVpbGRyb290MS9vdXRwdXQvcGVyLXBhY2th
Z2UvaG9zdC1nby9ob3N0CnJzeW5jIC1hIC0tbGluay1kZXN0PS9ob21lL2pvaG5zb25iL2J1aWxk
cm9vdDEvb3V0cHV0L3Blci1wYWNrYWdlL2hvc3Qtc2tlbGV0b24vaG9zdC8KL2hvbWUvam9obnNv
bmIvYnVpbGRyb290MS9vdXRwdXQvcGVyLXBhY2thZ2UvaG9zdC1za2VsZXRvbi9ob3N0LwovaG9t
ZS9qb2huc29uYi9idWlsZHJvb3QxL291dHB1dC9wZXItcGFja2FnZS9ob3N0LWdvL2hvc3QKbWtk
aXIgLXAgL2hvbWUvam9obnNvbmIvYnVpbGRyb290MS9vdXRwdXQvcGVyLXBhY2thZ2UvaG9zdC1n
by90YXJnZXQKcnN5bmMgLWEgLS1saW5rLWRlc3Q9L2hvbWUvam9obnNvbmIvYnVpbGRyb290MS9v
dXRwdXQvcGVyLXBhY2thZ2UvaG9zdC1nby1ib290c3RyYXAtc3RhZ2UyL3RhcmdldC8KL2hvbWUv
am9obnNvbmIvYnVpbGRyb290MS9vdXRwdXQvcGVyLXBhY2thZ2UvaG9zdC1nby1ib290c3RyYXAt
c3RhZ2UyL3RhcmdldC8KL2hvbWUvam9obnNvbmIvYnVpbGRyb290MS9vdXRwdXQvcGVyLXBhY2th
Z2UvaG9zdC1nby90YXJnZXQKcnN5bmMgLWEgLS1saW5rLWRlc3Q9L2hvbWUvam9obnNvbmIvYnVp
bGRyb290MS9vdXRwdXQvcGVyLXBhY2thZ2UvaG9zdC1za2VsZXRvbi90YXJnZXQvCi9ob21lL2pv
aG5zb25iL2J1aWxkcm9vdDEvb3V0cHV0L3Blci1wYWNrYWdlL2hvc3Qtc2tlbGV0b24vdGFyZ2V0
LwovaG9tZS9qb2huc29uYi9idWlsZHJvb3QxL291dHB1dC9wZXItcGFja2FnZS9ob3N0LWdvL3Rh
cmdldAo+Pj4gaG9zdC1nbyAxLjIwLjUgQnVpbGRpbmcKY2QgL2hvbWUvam9obnNvbmIvYnVpbGRy
b290MS9vdXRwdXQvYnVpbGQvaG9zdC1nby0xLjIwLjUvc3JjICYmCkdPMTExTU9EVUxFPW9mZgpH
T0NBQ0hFPS9ob21lL2pvaG5zb25iL2J1aWxkcm9vdDEvb3V0cHV0L3Blci1wYWNrYWdlL2hvc3Qt
Z28vaG9zdC9zaGFyZS9ob3N0LWdvLWNhY2hlCkdPUk9PVF9CT09UU1RSQVA9L2hvbWUvam9obnNv
bmIvYnVpbGRyb290MS9vdXRwdXQvcGVyLXBhY2thZ2UvaG9zdC1nby9ob3N0L2xpYi9nby0xLjE5
LjEwCkdPUk9PVF9GSU5BTD0vaG9tZS9qb2huc29uYi9idWlsZHJvb3QxL291dHB1dC9wZXItcGFj
a2FnZS9ob3N0LWdvL2hvc3QvbGliL2dvCkdPUk9PVD0iL2hvbWUvam9obnNvbmIvYnVpbGRyb290
MS9vdXRwdXQvYnVpbGQvaG9zdC1nby0xLjIwLjUiCkdPQklOPSIvaG9tZS9qb2huc29uYi9idWls
ZHJvb3QxL291dHB1dC9idWlsZC9ob3N0LWdvLTEuMjAuNS9iaW4iCkdPT1M9bGludXggQ0M9L3Vz
ci9iaW4vZ2NjIENYWD0vdXNyL2Jpbi9nKysgQ0dPX0VOQUJMRUQ9MQpDQ19GT1JfVEFSR0VUPSIv
aG9tZS9qb2huc29uYi9idWlsZHJvb3QxL291dHB1dC9wZXItcGFja2FnZS9ob3N0LWdvL2hvc3Qv
YmluL2FybS1idWlsZHJvb3QtbGludXgtdWNsaWJjZ251ZWFiaWhmLWdjYyIKQ1hYX0ZPUl9UQVJH
RVQ9Ii9ob21lL2pvaG5zb25iL2J1aWxkcm9vdDEvb3V0cHV0L3Blci1wYWNrYWdlL2hvc3QtZ28v
aG9zdC9iaW4vYXJtLWJ1aWxkcm9vdC1saW51eC11Y2xpYmNnbnVlYWJpaGYtZysrIgpHT09TPSJs
aW51eCIgR09BUkNIPWFybSAgR09BUk09NyBHT19BU1NVTUVfQ1JPU1NDT01QSUxJTkc9MQouL21h
a2UuYmFzaApCdWlsZGluZyBHbyBjbWQvZGlzdCB1c2luZwovaG9tZS9qb2huc29uYi9idWlsZHJv
b3QxL291dHB1dC9wZXItcGFja2FnZS9ob3N0LWdvL2hvc3QvbGliL2dvLTEuMTkuMTAuCihnbzEu
MTkuMTAgbGludXgvYW1kNjQpCmdvIHRvb2wgZGlzdDogY2Fubm90IGludm9rZSBDIGNvbXBpbGVy
ClsiL2hvbWUvam9obnNvbmIvYnVpbGRyb290MS9vdXRwdXQvcGVyLXBhY2thZ2UvaG9zdC1nby9o
b3N0L2Jpbi9hcm0tYnVpbGRyb290LWxpbnV4LXVjbGliY2dudWVhYmloZi1nY2MiXToKZm9yay9l
eGVjIC9ob21lL2pvaG5zb25iL2J1aWxkcm9vdDEvb3V0cHV0L3Blci1wYWNrYWdlL2hvc3QtZ28v
aG9zdC9iaW4vYXJtLWJ1aWxkcm9vdC1saW51eC11Y2xpYmNnbnVlYWJpaGYtZ2NjOgpubyBzdWNo
IGZpbGUgb3IgZGlyZWN0b3J5CgpHbyBuZWVkcyBhIHN5c3RlbSBDIGNvbXBpbGVyIGZvciB1c2Ug
d2l0aCBjZ28uClRvIHNldCBhIEMgY29tcGlsZXIsIHNldCBDQz10aGUtY29tcGlsZXIuClRvIGRp
c2FibGUgY2dvLCBzZXQgQ0dPX0VOQUJMRUQ9MC4KCm1ha2U6ICoqKiBbcGFja2FnZS9wa2ctZ2Vu
ZXJpYy5tazoyOTM6Ci9ob21lL2pvaG5zb25iL2J1aWxkcm9vdDEvb3V0cHV0L2J1aWxkL2hvc3Qt
Z28tMS4yMC41Ly5zdGFtcF9idWlsdF0KRXJyb3IgMgptYWtlOiAqKiogV2FpdGluZyBmb3IgdW5m
aW5pc2hlZCBqb2JzLi4uLgoKT24gTW9uLCBKdW4gMjYsIDIwMjMgYXQgMTI6MjPigK9QTSBDaHJp
c3RpYW4gU3Rld2FydAo8Y2hyaXN0aWFuQGFwZXJ0dXJlLnVzPiB3cm90ZToKPgo+IEFsbCwKPgo+
IE9uIE1vbiwgSnVuIDI2LCAyMDIzIGF0IDExOjE44oCvQU0gQnJ5Y2UgSm9obnNvbiA8YnJ5Y2VA
cmVkcGluZWxhYnMuY29tPiB3cm90ZToKPiA+Cj4gPiBDaHJpc3RpYW4sCj4gPiBJIG5lZWRlZCB0
byBhZGQgSE9TVF9HT19CT09UU1RSQVBfU1RBR0UxX0RFUEVOREVOQ0lFUz10b29sY2hhaW4gICB3
aXRoCj4gPiBwZXIgcGFja2FnZSBidWlsZCBvcHRpb24gdG8gZ2V0IHRoZSBidWlsZCB3b3JraW5n
Lgo+ID4KPiA+IEJyeWNlCj4KPiBUaGFua3MgZm9yIHRoZSB0aXAsIEkgaGFkIGRyb3BwZWQgdGhp
cyBiZWNhdXNlIG9mIGEgcHJldmlvdXMgUFIgcmV2aWV3Cj4gYnkgVGhvbWFzOgo+Cj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290LzIwMjMwMzEyMjI1ODA2LjBiZjRiMGZkQHdpbmRz
dXJmLwo+Cj4gQ291bGQgeW91IHByb3ZpZGUgdGhlIGVycm9yIHlvdSBzZWUgd2hlbiB0b29sY2hh
aW4gZGVwZW5kZW5jeSBpc24ndCB0aGVyZT8KPgo+IFRob21hczogQ291bGQgeW91IHBsZWFzZSBo
YXZlIGFub3RoZXIgbG9vayBhdCB0aGlzIC0gdG9vbGNoYWluIGlzCj4gcmVxdWlyZWQgZm9yIEhP
U1RDQ19OT0NDQUNIRSBmb3Igd2hhdGV2ZXIgcmVhc29uLgo+Cj4gPiA+ICAtIERyb3BwZWQgZGVw
ZW5kZW5jeSBvbiB0b29sY2hhaW4gaW4gZ28tYm9vdHN0cmFwLXN0YWdlMQo+ID4gPiAgLSBEcm9w
cGVkIHVwZGF0aW5nIHNvdXJjZXMgdGltZXN0YW1wcyBpbiBnby1ib290c3RyYXAtc3RhZ2V7MSwy
fQo+ID4gPiAgLSBVcGRhdGUgZ28tYm9vdHN0cmFwLXN0YWdlMiB0byAxLjE5LjcKPiA+ID4gIC0g
RHJvcCB0aGVzZSBjb21tZW50cyBhbmQgbW92ZSB0byBzZXBhcmF0ZSBwYXRjaDoKPiA+ID4gICAg
LSBGaXggdHlwbyBpbiBjb21tZW50cy4KPiA+ID4gICAgLSBBZGp1c3RlZCBjb21tZW50IGJ1aWx0
IGluIC0+IGJ1aWx0LWluLgo+ID4gPiAgICAtIEFkanVzdCBjb21tZW50cyByZWxhdGluZyB0byBj
b3B5aW5nIHNyYy8gdG8gaG9zdC8KPiA+ID4gICAgLSBEcm9wcGVkIG91dGRhdGVkIGNvbW1lbnQg
cmVmZXJyaW5nIHRvIGlzc3VlIDI3NzUuCj4gPiA+ICAtIFRoYW5rcyBUaG9tYXMgZm9yIHRoZSBy
ZXZpZXcuCj4KPiBUaGFua3MsCj4gQ2hyaXN0aWFuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
