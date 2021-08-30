Return-Path: <SRS0=17BZ=NV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14CD2C432BE
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 09:21:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABDEC60F44
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 09:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ABDEC60F44
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6872C400D4;
	Mon, 30 Aug 2021 09:21:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5HeTBZHl2U3T; Mon, 30 Aug 2021 09:21:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97888401FE;
	Mon, 30 Aug 2021 09:21:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C63E41BF5A3
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 09:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0918403D5
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 09:21:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hXICD4PTbDej for <buildroot@lists.busybox.net>;
 Mon, 30 Aug 2021 09:20:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E6984403C4
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 09:20:57 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id r7so4585415edd.6
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 02:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aS40oOBup3ORnEaP8xORZKY1KygBuz7qPccv6NLYWps=;
 b=Ahv3lRHoLZu+uL9c+kuRX3j162eCOWm4d62heHrBJeP4BFXXYeKN8gEgIzt+1HhJP2
 LcDsun/UXhRTYH+dMXTUFqkryB//UClnh+aF302zNY5TWmUO47uTNMHawU4XaAiJ6fno
 QjcmPlvuBcAyX3RpK+ZyUijBmi9ok2ZMCj37EJq1EIWbc/Iv2/t9O/BDFjwXWv7Ly00L
 CK9W73p1StWf01tZQB5vA2ukHPo5ncfg78w9qmePp1n0/s+xUGkslaj8d3OGXuoNMlO4
 3EEDQO8JSRvYgQtAa6ilZsHcSQe6YdxJtu3L3mtkGo7ITr8RrrbFLnRgEDzaNnE+u2fd
 SYLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=aS40oOBup3ORnEaP8xORZKY1KygBuz7qPccv6NLYWps=;
 b=f32EbObxRJofqc8FbLFq3F//+NtwZQXPANAU8iEkv/GFFO7FQ/96tIpyd/Ud1cnpEp
 elCHHvLxxVSQXHO+NsqauSOKSqJe0LOpf9WPHKGBbJ2mFlb3V6yFqCQwPRiroFqjikOj
 Sc1ClPtETnZhEfTKxZ53uFS05cIzNYJwz9NBRpv3HuNnfhJ4m/QMGDTAihSVI6otjY98
 IdZiFXMVedRINmGk60zOa7FiJLpjgbtSLqfWx56PVGOhahvOXKOK5I5RQycy1arPuq6Q
 m2JvkCgkc0vcskXTMLb0QAGBoi/WZg8ISNk+2QuOlyBW1MsurYb6TI7geqEwzioPK4zD
 GtyQ==
X-Gm-Message-State: AOAM530WUuEFQBytTKCwzmJM7y4/eWMnOEpigY/evyFuzPzBMuWKR0PQ
 RmB3NdhH7cc4RLsVVulWWOfuDA==
X-Google-Smtp-Source: ABdhPJwgiMj1R5c2HW+GfQt/zgwYMeNIMiFY7cE3T9myVB++kle0WiwROmx6Syv5TBzxCyxXRjMvMQ==
X-Received: by 2002:a05:6402:344f:: with SMTP id
 l15mr22883602edc.56.1630315255967; 
 Mon, 30 Aug 2021 02:20:55 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id b5sm6400895ejq.56.2021.08.30.02.20.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 02:20:55 -0700 (PDT)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210829183932.1737738-1-fontaine.fabrice@gmail.com>
 <20210829193748.GD1053080@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <a0cae486-dd1d-135f-bec5-d3a29b6fae78@mind.be>
Date: Mon, 30 Aug 2021 11:20:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210829193748.GD1053080@scaer>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-utils.mk: fix per-package
 build with ncurses
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

CgpPbiAyOS8wOC8yMDIxIDIxOjM3LCBZYW5uIEUuIE1PUklOIHdyb3RlOgo+IEZhYnJpY2UsIEFs
bCwKPiAKPiArSGVydsOpLCArVGhvbWFzLCArQXJub3V0LCArUm9tYWluCj4gCj4gVGhhbmtzIGZv
ciB0aGlzIHBhdGNoLCB0aGF0IGlzIGEgdmVyeSBnb29kIGV4YW1wbGUgb2YgYSB2ZXJ5IHRyaWNr
eQo+IHByb2JsZW0gd2UndmUgYmVlbiBzdHVtYmxpbmcgdXBvbiBzaW5jZSB3ZSBzdGFydGVkIGRv
aW5nIHRvcC1sZXZlbAo+IHBhcmFsbGVsIGJ1aWxkcy4uLgo+IAo+IE9uIDIwMjEtMDgtMjkgMjA6
MzkgKzAyMDAsIEZhYnJpY2UgRm9udGFpbmUgc3Bha2UgdGh1c2x5Ogo+PiBGaXggcGVyLXBhY2th
Z2UgYnVpbGQgd2l0aCBuY3Vyc2VzIGFuZCB0b29sY2hhaW5zIHByb3ZpZGluZyBuY3Vyc2VzLmgg
YnkKPj4gYWRkaW5nIC0tdXBkYXRlIHBhcmFtZXRlciB0byByc3luYyBjYWxsLiBJbmRlZWQsIHdp
dGhvdXQgdGhpcyBwYXJhbWV0ZXIsCj4+IHRoZSBjdXJzZXMuaCBmaWxlIGluc3RhbGxlZCBieSBu
Y3Vyc2VzICh3aXRoIHdjaGFyIHN1cHBvcnQpIGNvdWxkIGJlCj4+IG92ZXJyaWRlbiBieSBhIGN1
cnNlcy5oIGZpbGUgcHJvdmlkZWQgYnkgdGhlIHRvb2xjaGFpbiAod2l0aG91dCB3Y2hhcgo+PiBz
dXBwb3J0KSByZXN1bHRpbmcgaW4gdGhlIGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIG9uIGJtb24g
b3IgcnRvcnJlbnQ6Cj4+Cj4+IHJzeW5jIC1hIC0tbGluay1kZXN0PS90bXAvaW5zdGFuY2UtMC9v
dXRwdXQtMS9wZXItcGFja2FnZS9ob3N0LXBrZ2NvbmYvaG9zdC8gL3RtcC9pbnN0YW5jZS0wL291
dHB1dC0xL3Blci1wYWNrYWdlL2hvc3QtcGtnY29uZi9ob3N0LyAvdG1wL2luc3RhbmNlLTAvb3V0
cHV0LTEvcGVyLXBhY2thZ2UvcnRvcnJlbnQvaG9zdAo+PiByc3luYyAtYSAtLWxpbmstZGVzdD0v
dG1wL2luc3RhbmNlLTAvb3V0cHV0LTEvcGVyLXBhY2thZ2UvaG9zdC1za2VsZXRvbi9ob3N0LyAv
dG1wL2luc3RhbmNlLTAvb3V0cHV0LTEvcGVyLXBhY2thZ2UvaG9zdC1za2VsZXRvbi9ob3N0LyAv
dG1wL2luc3RhbmNlLTAvb3V0cHV0LTEvcGVyLXBhY2thZ2UvcnRvcnJlbnQvaG9zdAo+PiByc3lu
YyAtYSAtLWxpbmstZGVzdD0vdG1wL2luc3RhbmNlLTAvb3V0cHV0LTEvcGVyLXBhY2thZ2UvbGli
Y3VybC9ob3N0LyAvdG1wL2luc3RhbmNlLTAvb3V0cHV0LTEvcGVyLXBhY2thZ2UvbGliY3VybC9o
b3N0LyAvdG1wL2luc3RhbmNlLTAvb3V0cHV0LTEvcGVyLXBhY2thZ2UvcnRvcnJlbnQvaG9zdAo+
PiByc3luYyAtYSAtLWxpbmstZGVzdD0vdG1wL2luc3RhbmNlLTAvb3V0cHV0LTEvcGVyLXBhY2th
Z2UvbGlidG9ycmVudC9ob3N0LyAvdG1wL2luc3RhbmNlLTAvb3V0cHV0LTEvcGVyLXBhY2thZ2Uv
bGlidG9ycmVudC9ob3N0LyAvdG1wL2luc3RhbmNlLTAvb3V0cHV0LTEvcGVyLXBhY2thZ2UvcnRv
cnJlbnQvaG9zdAo+PiByc3luYyAtYSAtLWxpbmstZGVzdD0vdG1wL2luc3RhbmNlLTAvb3V0cHV0
LTEvcGVyLXBhY2thZ2UvbmN1cnNlcy9ob3N0LyAvdG1wL2luc3RhbmNlLTAvb3V0cHV0LTEvcGVy
LXBhY2thZ2UvbmN1cnNlcy9ob3N0LyAvdG1wL2luc3RhbmNlLTAvb3V0cHV0LTEvcGVyLXBhY2th
Z2UvcnRvcnJlbnQvaG9zdAo+PiByc3luYyAtYSAtLWxpbmstZGVzdD0vdG1wL2luc3RhbmNlLTAv
b3V0cHV0LTEvcGVyLXBhY2thZ2Uvc2tlbGV0b24vaG9zdC8gL3RtcC9pbnN0YW5jZS0wL291dHB1
dC0xL3Blci1wYWNrYWdlL3NrZWxldG9uL2hvc3QvIC90bXAvaW5zdGFuY2UtMC9vdXRwdXQtMS9w
ZXItcGFja2FnZS9ydG9ycmVudC9ob3N0Cj4+IHJzeW5jIC1hIC0tbGluay1kZXN0PS90bXAvaW5z
dGFuY2UtMC9vdXRwdXQtMS9wZXItcGFja2FnZS90b29sY2hhaW4vaG9zdC8gL3RtcC9pbnN0YW5j
ZS0wL291dHB1dC0xL3Blci1wYWNrYWdlL3Rvb2xjaGFpbi9ob3N0LyAvdG1wL2luc3RhbmNlLTAv
b3V0cHV0LTEvcGVyLXBhY2thZ2UvcnRvcnJlbnQvaG9zdAo+IAo+IFNvLCBpZiB3ZSBoYWQgaGFk
IGZpbGUgb3ZlcndyaXRlIGRldGVjdGlvbiBpbiBwbGFjZSAod2hpY2ggSSBoYXZlIGJlZW4KPiBy
ZXZpZXdpbmcgYW5kIHRlc3RpbmcgdGhpcyBXRSksIHRoZSBidWlsZCB3b3VsZCBoYXZlIGZhaWxl
ZCBlYXJsaWVyLCBhdAo+IHRoZSBlbmQgb2YgdGhlIGluc3RhbGwgc3RlcCBvZiBuY3Vyc2VzLCB3
aXRoOgo+IAo+ICAgICAvaG9tZS95bW9yaW4vZGV2L2J1aWxkcm9vdC9PL3Blci1wYWNrYWdlL25j
dXJzZXMvaG9zdC9yaXNjdjY0LWJ1aWxkcm9vdC1saW51eC1nbnUvc3lzcm9vdC91c3IvbGliL3Br
Z2NvbmZpZy9uY3Vyc2VzLnBjOiBGQUlMRUQKPiAgICAgL2hvbWUveW1vcmluL2Rldi9idWlsZHJv
b3QvTy9wZXItcGFja2FnZS9uY3Vyc2VzL2hvc3QvcmlzY3Y2NC1idWlsZHJvb3QtbGludXgtZ251
L3N5c3Jvb3QvdXNyL2xpYi9wa2djb25maWcvbWVudS5wYzogRkFJTEVECj4gICAgIC9ob21lL3lt
b3Jpbi9kZXYvYnVpbGRyb290L08vcGVyLXBhY2thZ2UvbmN1cnNlcy9ob3N0L3Jpc2N2NjQtYnVp
bGRyb290LWxpbnV4LWdudS9zeXNyb290L3Vzci9saWIvcGtnY29uZmlnL2Zvcm0ucGM6IEZBSUxF
RAo+ICAgICAvaG9tZS95bW9yaW4vZGV2L2J1aWxkcm9vdC9PL3Blci1wYWNrYWdlL25jdXJzZXMv
aG9zdC9yaXNjdjY0LWJ1aWxkcm9vdC1saW51eC1nbnUvc3lzcm9vdC91c3IvbGliL3BrZ2NvbmZp
Zy9wYW5lbC5wYzogRkFJTEVECj4gICAgIC9ob21lL3ltb3Jpbi9kZXYvYnVpbGRyb290L08vcGVy
LXBhY2thZ2UvbmN1cnNlcy9ob3N0L3Jpc2N2NjQtYnVpbGRyb290LWxpbnV4LWdudS9zeXNyb290
L3Vzci9pbmNsdWRlL2N1cnNlcy5oOiBGQUlMRUQKPiAgICAgL2hvbWUveW1vcmluL2Rldi9idWls
ZHJvb3QvTy9wZXItcGFja2FnZS9uY3Vyc2VzL2hvc3QvcmlzY3Y2NC1idWlsZHJvb3QtbGludXgt
Z251L3N5c3Jvb3QvdXNyL2luY2x1ZGUvdGVybS5oOiBGQUlMRUQKPiAgICAgbWQ1c3VtOiBXQVJO
SU5HOiA2IGNvbXB1dGVkIGNoZWNrc3VtcyBkaWQgTk9UIG1hdGNoCj4gICAgIEVSUk9SOiBwYWNr
YWdlIG5jdXJzZXMgaGFzIG92ZXJ3cml0dGVuIGZpbGVzIGluc3RhbGxlZCBieSBhIHByZXZpb3Vz
IHBhY2thZ2UsIGFib3J0aW5nLgo+ICAgICBtYWtlWzFdOiAqKiogW3BhY2thZ2UvcGtnLWdlbmVy
aWMubWs6NDY3OiAvaG9tZS95bW9yaW4vZGV2L2J1aWxkcm9vdC9PL2J1aWxkL25jdXJzZXMtNi4x
Ly5zdGFtcF9pbnN0YWxsZWRdIEVycm9yIDEKPiAgICAgbWFrZTogKioqIFtNYWtlZmlsZToyMzog
X2FsbF0gRXJyb3IgMgo+IAo+PiBbLi4uXQo+Pgo+PiBjaGVja2luZyBmb3IgTmN1cnNlc1cgd2lk
ZS1jaGFyYWN0ZXIgbGlicmFyeS4uLiB5ZXMKPj4gY2hlY2tpbmcgZm9yIHdvcmtpbmcgbmN1cnNl
c3cvY3Vyc2VzLmguLi4gbm8KPj4gY2hlY2tpbmcgZm9yIHdvcmtpbmcgbmN1cnNlc3cuaC4uLiBu
bwo+PiBjaGVja2luZyBmb3Igd29ya2luZyBuY3Vyc2VzLmguLi4gbm8KPj4gY29uZmlndXJlOiBX
QVJOSU5HOiBjb3VsZCBub3QgZmluZCBhIHdvcmtpbmcgbmN1cnNlc3cvY3Vyc2VzLmgsIG5jdXJz
ZXN3Lmggb3IgbmN1cnNlcy5oCj4+Cj4+IEZpeGVzOgo+PiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1
aWxkcm9vdC5vcmcvcmVzdWx0cy84YzBkMTNlM2NjM2RkZDJhMjFmOTk0NzdjYWQ0ZTM5NTIyZTlk
ZWVjCj4+ICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzL2QyZjE4Y2Nh
ZDZhMDMzMGQ3OGU5N2Q3MGM4MTBhYzg5Yjg0ZDIyNjEKPj4KPj4gU2lnbmVkLW9mZi1ieTogRmFi
cmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4+IC0tLQo+PiAgcGFj
a2FnZS9wa2ctdXRpbHMubWsgfCAyICstCj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGtnLXV0aWxzLm1r
IGIvcGFja2FnZS9wa2ctdXRpbHMubWsKPj4gaW5kZXggYWUzYzdmOWRhOS4uNWFmMzRkNGVlMCAx
MDA2NDQKPj4gLS0tIGEvcGFja2FnZS9wa2ctdXRpbHMubWsKPj4gKysrIGIvcGFja2FnZS9wa2ct
dXRpbHMubWsKPj4gQEAgLTE4NCw3ICsxODQsNyBAQCBpZmVxICgkKEJSMl9QRVJfUEFDS0FHRV9E
SVJFQ1RPUklFUykseSkKPj4gIGRlZmluZSBwZXItcGFja2FnZS1yc3luYwo+PiAgCW1rZGlyIC1w
ICQoMykKPj4gIAkkKGZvcmVhY2ggcGtnLCQoMSksXAo+PiAtCQlyc3luYyAtYSAtLWxpbmstZGVz
dD0kKFBFUl9QQUNLQUdFX0RJUikvJChwa2cpLyQoMikvIFwKPj4gKwkJcnN5bmMgLWF1IC0tbGlu
ay1kZXN0PSQoUEVSX1BBQ0tBR0VfRElSKS8kKHBrZykvJCgyKS8gXAo+IAo+IFNvcnJ5LCB0aGlz
IGlzIG5vdCB0aGUgY29ycmVjdCBzb2x1dGlvbi4gSW5kZWVkLCB3ZSBjYW4gbm90IGFjY2VwdCB0
aGF0Cj4gYSBwYWNrYWdlIG92ZXJ3cml0ZXMgYSBmaWxlIHByb3ZpZGVkIGJ5IGFub3RoZXIgcGFj
a2FnZS4gU2VlIHRoZQo+IGV4cGxhbmF0aW9ucyBUaG9tYXMgYW5kIEkgZGlzY3Vzc2VkIGVhcmxp
ZXIgdG9kYXk6Cj4gCj4gICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2J1aWxkcm9vdC8yMDIx
MDgyOTEzMzk1NS43NGQ5MjFlOUB3aW5kc3VyZi8KPiAgICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYnVpbGRyb290LzIwMjEwODI5MTY0MDMxLkdCMTA1MzA4MEBzY2Flci8KPiAKPiBUaGlzIGNh
c2UgaXMgaG93ZXZlciB2ZXJ5IHNwZWNpYWwsIGFuZCBJIGhhdmUgbm8gaWRlYSAoeWV0KSBvbiB3
aGF0IHRoZQo+IGJlc3Qgc29sdXRpb24gaXMuIEkgZ3Vlc3MgdGhlIGN1cnNlcyBoZWFkZXJzIGlu
IHRoZSB0b29sY2hhaW4gYXJlIGR1ZSB0bwo+IHRoZSBwcmVzZW5jZSBvZiBnZGIgd2l0aCBUVUkg
c3VwcG9ydC4uLgo+IAo+IEkgd291bGQgYmUgdGVtcHRlZCB0byBzYXkgInRoaXMgdG9vbGNoYWlu
IGlzIG5vdCBwdXJlLCB3ZSBjYW4ndCB1c2UgaXQiLAo+IGFuZCBkZWZlciB0byB0aGUgQm9vdGxp
biB0b29sY2hhaW4gYnVpbGRlciBwcm9qZWN0IHRvIGZpeCB0aGVpcgo+IHRvb2xjaGFpbnMsIGJ1
dCB0aGlzIGlzIHByb2JhYmx5IGEgYml0IG9mIHNodWZmbGluZyB0aGUgZHVzdCB1bmRlciB0aGUK
PiByYWcuLi4KPiAKPiBTbywgYW55IGlucHV0IGFuZCBpbnNpZ2h0IHdvdWxkIGJlIGFwcHJlY2lh
dGVkLi4uCgogSSB0aGluayB3ZSBuZWVkIHRvIHN0YXJ0IGEgd2lraSBwYWdlIGZvciB0aGlzIGRp
c2N1c3Npb24sIG9uIHRoZSBtYWlsaW5nIGxpc3QKdGhlIGNvbmNsdXNpb25zIHdpbGwgZ2V0IGxv
c3QgdG9vIGVhc2lseS4uLiBJIGRvbid0IGhhdmUgdGltZSBmb3IgdGhhdCBub3cKdGhvdWdoLCBt
YXliZSB0b25pZ2h0LgoKIFJlZ2FyZHMsCiBBcm5vdXQKCj4gCj4gUmVnYXJkcywKPiBZYW5uIEUu
IE1PUklOLgo+IAo+PiAgCQkkKFBFUl9QQUNLQUdFX0RJUikvJChwa2cpLyQoMikvIFwKPj4gIAkJ
JCgzKSQoc2VwKSkKPj4gIGVuZGVmCj4+IC0tIAo+PiAyLjMyLjAKPj4KPj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gYnVpbGRyb290IG1haWxpbmcg
bGlzdAo+PiBidWlsZHJvb3RAYnVzeWJveC5uZXQKPj4gaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
