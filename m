Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AA3C77B71
	for <buildroot@archiver.kernel.org>; Wed, 12 Apr 2023 08:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF56C605E3;
	Wed, 12 Apr 2023 08:13:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF56C605E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NVVG_KQFiQZO; Wed, 12 Apr 2023 08:13:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6A936140E;
	Wed, 12 Apr 2023 08:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6A936140E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 46DA51BF426
 for <buildroot@lists.busybox.net>; Wed, 12 Apr 2023 08:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D2FC80E7B
 for <buildroot@lists.busybox.net>; Wed, 12 Apr 2023 08:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D2FC80E7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HVDP1iyEbT0v for <buildroot@lists.busybox.net>;
 Wed, 12 Apr 2023 08:13:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32E4F80DCC
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 32E4F80DCC
 for <buildroot@buildroot.org>; Wed, 12 Apr 2023 08:13:26 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id a23so14145888lfk.4
 for <buildroot@buildroot.org>; Wed, 12 Apr 2023 01:13:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681287205;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TOjwzqVH3hOOcykcLyuGtygNGg+dmbYviON8HZEiaXQ=;
 b=2MpJ0erJhCwLDBJ+f/6oRUDpxdo/3YzkM8awA3zxan7qMREUJCGV0J61L+cZ+09fGS
 wYVSBEScpb32qnHFuK12jpNcbm2NrgvURH4iGedMAULgUPZcfTNnQXo6ds7PR30iE/3T
 oGVIXkoXER2e52WTYVDTU1gpr8LIcn5aI0oJP+JdYWmlyWUHAgnTVkb5WPjB60vmaHT4
 SdGWx2grj7baHtx8REJzI1yjQ6NusfiGdWKymrkPvHMv417g5H+NX1CZ5fBaoRQq2QCn
 zIsJsSyCvxFp/i6LHqIE+7NoDJzbesNSz7OtJx7irxwWOW9+/Scjh3eLlHlHo1ut4iC4
 2Dgw==
X-Gm-Message-State: AAQBX9edHtHa0N29fqNGFoRSv4Q/NednSD5Sv5abC+u8gSDXKiZxLQM/
 q2o7kXj56HaE3JyD+gW9wt3KZ0wYAQr/lfZwjrAkHA==
X-Google-Smtp-Source: AKy350ZF2ZpfvH2hOZFDQ/AL2PsAgPipUlSCD1bMGHp0BZUxqqjNHySibO5i82pLIlMAbtqaCL5+wywyi3VxxK/sTrI=
X-Received: by 2002:ac2:4946:0:b0:4ea:fa15:5bce with SMTP id
 o6-20020ac24946000000b004eafa155bcemr4896029lfi.7.1681287204809; Wed, 12 Apr
 2023 01:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230411203113.1573787-1-yann.morin.1998@free.fr>
In-Reply-To: <20230411203113.1573787-1-yann.morin.1998@free.fr>
From: Sebastian WEYER <sebastian.weyer@smile.fr>
Date: Wed, 12 Apr 2023 10:13:13 +0200
Message-ID: <CADSVbUv80=-Uec-OLmnCuSQOptJJBuTF-DG3CeHehvRW3uAatw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1681287205;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TOjwzqVH3hOOcykcLyuGtygNGg+dmbYviON8HZEiaXQ=;
 b=fMm6plz9dUWq24COCEEZCCFIhd3gUIv+WPYBjzJHRW25QEInMbK78m65VF9wNFbCRI
 F5Mx29xOj+FlFw79Dxt7il9RPhGI8QmS7AKO79aTZJqoH+Ant6VC9fDZoqsFa/fEu1pg
 HphJaPl3MQ2iAfs6gx3KDyEVWPn+jsWzDaFKzzq+ZNUh7WSbsQs9hSGUgC5js6O0DdVq
 s0U6jFn9dqyxJ7GFfdpNqG25vl+O/47ERe+OO2MMa2NW1uthRVHIVDp28BiMV3B938/i
 abAJA1wVKU1ynhhMFXpNh4WrL6i24zMER+nZIHk6c7kBgnnZu5Z302dHnP5K8DfFR+QL
 AUTA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=fMm6plz9
Subject: Re: [Buildroot] [PATCH] package/localedef: fix fallout after bump
 to glibc 2.37
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
Cc: Romain Naour <romain.naour@smile.fr>, Bagas Sanjaya <bagasdotme@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwKClRoYW5rIHlvdSBmb3IgdGhpcyBmaXguCgpPbiBUdWUsIEFwciAxMSwgMjAy
MyBhdCAxMDozMeKAr1BNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3
cm90ZToKPgo+IENvbW1pdCBhMzc5NDk5ZjczMzQgKHBhY2thZ2UvZ2xpYmM6IGJ1bXAgdG8gdmVy
c2lvbiAyLjM3KSBmb3Jnb3QgdG8KPiB1cGRhdGUgdGhlIHBhY2ggZm9yIGxvY2FsZWRlZi4KPgo+
IFRoZXJlIGlzIG5vIHZlcnNpb24gY2hlY2sgZm9yICdhcycgbm93LCBzbyBkcm9wIHRoZSByZWxh
dGVkIGh1bmsuCj4KPiBGaXhlczogYTM3OTQ5OWY3MzM0YzJhNjhkMzc1YjFjZjlkYzM1Y2Q1OTg4
NDE4MQo+Cj4gU2lnbmVkLW9mZi1ieTogWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZy
ZWUuZnI+Cj4gQ2M6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgo+IENjOiBT
ZWJhc3RpYW4gV2V5ZXIgPHNlYmFzdGlhbi53ZXllckBzbWlsZS5mcj4KPiBDYzogQmFnYXMgU2Fu
amF5YSA8YmFnYXNkb3RtZUBnbWFpbC5jb20+Cj4gLS0tCj4gIC4uLmRlbmN5LW9uLUdDQy10by00
LjgtYW5kLWJpbnV0aWxzLXRvLTIuMjQucGF0Y2ggfCAxNSArKysrLS0tLS0tLS0tLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9sb2NhbGVkZWYvMDAwMi1yZWxheC1kZXBlbmRlbmN5LW9uLUdDQy10by00
LjgtYW5kLWJpbnV0aWxzLXRvLTIuMjQucGF0Y2ggYi9wYWNrYWdlL2xvY2FsZWRlZi8wMDAyLXJl
bGF4LWRlcGVuZGVuY3ktb24tR0NDLXRvLTQuOC1hbmQtYmludXRpbHMtdG8tMi4yNC5wYXRjaAo+
IGluZGV4IDI5N2M5NmNjNWUuLjk0ZmNjZmE4NTYgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9sb2Nh
bGVkZWYvMDAwMi1yZWxheC1kZXBlbmRlbmN5LW9uLUdDQy10by00LjgtYW5kLWJpbnV0aWxzLXRv
LTIuMjQucGF0Y2gKPiArKysgYi9wYWNrYWdlL2xvY2FsZWRlZi8wMDAyLXJlbGF4LWRlcGVuZGVu
Y3ktb24tR0NDLXRvLTQuOC1hbmQtYmludXRpbHMtdG8tMi4yNC5wYXRjaAo+IEBAIC0yNCw2ICsy
NCw4IEBAIEdDQyA2LjIrCj4gICBodHRwczovL3NvdXJjZXdhcmUub3JnL2dpdC8/cD1nbGliYy5n
aXQ7YT1jb21taXQ7aD00ZGNiYmMzYjI4YWFlYWZlMjNlMWEzMGRiODQwNTVhYTZmNmZhOTg3Cj4K
PiAgU2lnbmVkLW9mZi1ieTogTWF0dGhldyBXZWJlciA8bWF0dGhldy53ZWJlckByb2Nrd2VsbGNv
bGxpbnMuY29tPgo+ICtbeWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI6IHVwZGF0ZSBmb3IgMi4zN10K
PiArU2lnbmVkLW9mZi1ieTogWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+
Cj4gIC0tLQo+ICAgY29uZmlndXJlIHwgNiArKystLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gQEAgLTMyLDE2ICszNCw3IEBAIGRpZmYgLS1n
aXQgYS9jb25maWd1cmUgYi9jb25maWd1cmUKPiAgaW5kZXggOTYxOWMxMDk5MS4uMGM0ODFkMjMz
OSAxMDA3NTUKPiAgLS0tIGEvY29uZmlndXJlCj4gICsrKyBiL2NvbmZpZ3VyZQo+IC1AQCAtNDY1
MSw3ICs0NjUxLDcgQEAgJGFzX2VjaG9fbiAiY2hlY2tpbmcgdmVyc2lvbiBvZiAkQVMuLi4gIiA+
JjY7IH0KPiAtICAgYWNfcHJvZ192ZXJzaW9uPWAkQVMgLS12ZXJzaW9uIDI+JjEgfCBzZWQgLW4g
J3MvXi4qR05VIGFzc2VtYmxlci4qIFwoWzAtOV0qXC5bMC05Ll0qXCkuKiQvXDEvcCdgCj4gLSAg
IGNhc2UgJGFjX3Byb2dfdmVyc2lvbiBpbgo+IC0gICAgICcnKSBhY19wcm9nX3ZlcnNpb249InYu
ID8uPz8sIGJhZCI7IGFjX3ZlcmNfZmFpbD15ZXM7Owo+IC0tICAgIDIuMVswLTldWzAtOV0qfDIu
Mls1LTldKnwyLlszLTldWzAtOV0qfFszLTldLip8WzEtOV1bMC05XSopCj4gLSsgICAgMi4xWzAt
OV1bMC05XSp8Mi4yWzQtOV0qfDIuWzMtOV1bMC05XSp8WzMtOV0uKnxbMS05XVswLTldKikKPiAt
ICAgICAgICBhY19wcm9nX3ZlcnNpb249IiRhY19wcm9nX3ZlcnNpb24sIG9rIjsgYWNfdmVyY19m
YWlsPW5vOzsKPiAtICAgICAqKSBhY19wcm9nX3ZlcnNpb249IiRhY19wcm9nX3ZlcnNpb24sIGJh
ZCI7IGFjX3ZlcmNfZmFpbD15ZXM7Owo+IC0KPiAtQEAgLTQ3ODEsNyArNDc4MSw3IEBAICRhc19l
Y2hvX24gImNoZWNraW5nIHZlcnNpb24gb2YgJExELi4uICIgPiY2OyB9Cj4gK0BAIC00MTc4LDcg
KzQxNzgsNyBAQCAkYXNfZWNob19uICJjaGVja2luZyB2ZXJzaW9uIG9mICRMRC4uLiAiID4mNjsg
fQo+ICAgICBhY19wcm9nX3ZlcnNpb249YCRMRCAtLXZlcnNpb24gMj4mMSB8IHNlZCAtbiAncy9e
LipHTlUgbGQuKiBcKFswLTldWzAtOV0qXC5bMC05Ll0qXCkuKiQvXDEvcCdgCj4gICAgIGNhc2Ug
JGFjX3Byb2dfdmVyc2lvbiBpbgo+ICAgICAgICcnKSBhY19wcm9nX3ZlcnNpb249InYuID8uPz8s
IGJhZCI7IGFjX3ZlcmNfZmFpbD15ZXM7Owo+IEBAIC01MCw3ICs0Myw3IEBAIGluZGV4IDk2MTlj
MTA5OTEuLjBjNDgxZDIzMzkgMTAwNzU1Cj4gICAgICAgICAgYWNfcHJvZ192ZXJzaW9uPSIkYWNf
cHJvZ192ZXJzaW9uLCBvayI7IGFjX3ZlcmNfZmFpbD1ubzs7Cj4gICAgICAgKikgYWNfcHJvZ192
ZXJzaW9uPSIkYWNfcHJvZ192ZXJzaW9uLCBiYWQiOyBhY192ZXJjX2ZhaWw9eWVzOzsKPgo+IC1A
QCAtNTE4OSw3ICs1MTg5LDcgQEAgaW50Cj4gK0BAIC00NTg5LDcgKzQ1ODksNyBAQCBpbnQKPiAg
IG1haW4gKCkKPiAgIHsKPgo+IC0tCj4gMi4yNS4xCj4KCkkgdGVzdGVkIHRoaXMgd2l0aCBCUjJf
R0VORVJBVEVfTE9DQUxFPSJDLlVURi04IiBhbmQgaXQgY29ycmVjdGx5CmdlbmVyYXRlcyB0aGUg
bG9jYWxlZGVmIGV4ZWN1dGFibGUgaW4gJChIT1NUX0RJUikvYmluLgoKVGVzdGVkLWJ5OiBTZWJh
c3RpYW4gV2V5ZXIgPHNlYmFzdGlhbi53ZXllckBzbWlsZS5mcj4KCkJlc3QgcmVnYXJkcywKU2Vi
YXN0aWFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
