Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38B0C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Dec 2021 11:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B59641DC8;
	Sun, 19 Dec 2021 11:39:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ib_YfiBPvOqF; Sun, 19 Dec 2021 11:39:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A35C041DA6;
	Sun, 19 Dec 2021 11:39:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 739FF1BF59F
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 11:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61B6884C88
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 11:39:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MKDITGR6mNwh for <buildroot@lists.busybox.net>;
 Sun, 19 Dec 2021 11:39:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 92A9D84C86
 for <buildroot@buildroot.org>; Sun, 19 Dec 2021 11:39:14 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id q74so20058950ybq.11
 for <buildroot@buildroot.org>; Sun, 19 Dec 2021 03:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tMmuG4SHI1L5Nj7bm+Ng3WRKO1GIyvk5qOBtwR86ab4=;
 b=WKeP7f8j15nOFZHCfKbNSBdz1u17U/jp/hEoM6EJ+RYbq7TxT89vulWlIQOmP16U3Y
 hnHLmCSMw92Fdx9rnSUuuf3Q3rsvERfPDM7a5VeyBg3BJa6TrARqp2yAeg5pQt0iE3PZ
 pfXQH2+mz83XS7ur7puPczOo2HIwWT+C95lCO58CDivLzSrIEa2RAoAWvFpe8bwBuPNy
 VIFfa5s8ugtUyOEMRMsczoeKnySCrh20ki8WF4732mFP1z/8UzEBVuTH9lTaqbpFXXzi
 pKRC67cjCaG/qGY6Hw60rJA2xjBSGvxDjyaIb7In/PkowO5UUnbHeRJNfE4lcdgT42a1
 6PAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tMmuG4SHI1L5Nj7bm+Ng3WRKO1GIyvk5qOBtwR86ab4=;
 b=3adb0AJZ3fpKUek8tN/vGogRTVSBmGYLVrDa2wxqjrEcc4Z6AcSHlwfZSYliSW0KPS
 wIiAF2hylqz3MBzpYonyHMkrud0fIa9C4PS3c+MOkNb5C4qDhQGVE41UqwgbhNMllbbh
 ec+SnTGmLzZfVrMRX8UB7FaOBKA+fQFBthq25YApdnEOSFfzzu86F+/hFScK+PZyVBKW
 Vvri3zlELIZx+ejX32gtOGTOHfoMJ4jf9CZOVViFtt4o+jT7tFX+IlIdJgLB7scCwUS4
 ef3JDFcI4kfsutZ25Yjhd63YKP04CNiCZOUU94f2t+LqJsoP3ThbSvKu1KxUN4cs24Me
 F/kQ==
X-Gm-Message-State: AOAM532n7wuNgqovlSaNbpRXm20E5dKioiG5bdte76tGAp+mj6nh4Cz5
 mzEjOEDCIO10qgqB/dFV1Df/86u/hUlSbAgeyLyMFP78
X-Google-Smtp-Source: ABdhPJwNF7D5xH2GGELXKM5YTlm+6L6Mt8Pcbi/kMYI+EiF4vovkQUrdJb4chxayqJCyKH9QS+5ub0YiEaqv8OLSrhM=
X-Received: by 2002:a25:8505:: with SMTP id w5mr17351272ybk.570.1639913953186; 
 Sun, 19 Dec 2021 03:39:13 -0800 (PST)
MIME-Version: 1.0
References: <20211219110405.2233620-1-yann.morin.1998@free.fr>
In-Reply-To: <20211219110405.2233620-1-yann.morin.1998@free.fr>
From: Yunhao Tian <t123yh.xyz@gmail.com>
Date: Sun, 19 Dec 2021 19:39:01 +0800
Message-ID: <CAFQXTv2EwXLCK27mif6dBxSuFuocwP7o=AL=a_5B=5T8CuO0Yg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH] package/libopenaptx: drop package
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCllhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiDkuo4yMDIx
5bm0MTLmnIgxOeaXpeWRqOaXpSAxOTowNOWGmemBk++8mgo+Cj4gVGhlIGxpY2Vuc2luZyBhYm91
dCBsaWJvcGVuYXB0eCBpcyB2ZXJ5IGNvbXBsaWNhdGVkLiBWZXJzaW9uIDAuMi4xIHdhcwo+IHRh
Z2dlZCB3aXRoIHRoZSBzb2xlIHB1cnBvc2Ugb2YgcmVsaWNlbnNpbmcgZnJvbSBMR1BMdjIuMSsg
dG8gR1BMdjMuMCs6Cj4KPiAgICAgaHR0cHM6Ly9naXRodWIuY29tL3BhbGkvbGlib3BlbmFwdHgv
Y29tbWl0LzgxMWJjMTg1ODZkNjM0MDQyNjE4ZDYzMzcyN2FjMDI4MWQ0MTcwYjgKPgo+IEhvd2V2
ZXIsIHRoaXMgaXMgaGFzIHZhcmlvdXMgaXNzdWVzOgo+Cj4gICAtIHRoZSBjb2RlIG9yaWdpbmFs
bHkgY29tZXMgZnJvbSBmZm1wZWcsIHdoZXJlIGl0IHdhcyBMR1BMdjIuMSssIHNvCj4gICAgIHRo
ZSByZWxpY2Vuc2luZyBpcyBkdWJpb3VzIGF0IGJlc3Q7Cj4KPiAgIC0gYW4gZXhwbGljaXQgYmFu
IHRvIGYuZC5vIGFuZCBDb2xsYWJvcmEgZnJvbSB1c2luZyB0aGF0IGNvZGUsIGFuZAo+ICAgICB3
aXRoIGEgbG9uZyByYW50IGFib3V0IGl0LCBldmVuIHN0YXRpbmcgdGhhdCB0aGUgbGljZW5zZSB0
byBmLmQubyBvcgo+ICAgICBDb2xsYWJvcmEgd2FzIHRlcm1pbmF0ZWQ6Cj4gICAgICAgICBodHRw
czovL2dpdGh1Yi5jb20vcGFsaS9saWJvcGVuYXB0eC9jb21taXQvODExYmMxODU4NmQ2MzQwNDI2
MThkNjMzNzI3YWMwMjgxZDQxNzBiOCNjb21taXRjb21tZW50LTU0MTU0MTU2Cj4KPiAgICAgICAg
IFBlciDCpzgvTEdQTCBhbmQgwqc4L0dQTCBsaWNlbnNlIHdhcyB0ZXJtaW5hdGVkIHdpdGggQ29s
bGFib3JhIGFuZAo+ICAgICAgICAgRnJlZWRlc2t0b3AgYW5kIHdhcyBub3QgYXV0b21hdGljYWxs
eSByZWluc3RhdGVkLiBJdCBhcHBsaWVzIHRvCj4gICAgICAgICBhbGwgdmVyc2lvbnMgb2YgdGhp
cyBsaWJyYXJ5LCBpbmNsdWRpbmcgb2xkZXIgYW5kIENvbGxhYm9yYSBhbmQKPiAgICAgICAgIEZy
ZWVkZXNrdG9wIGNhbm5vdCB1c2UgdGhpcyBsaWJyYXJ5IGFueW1vcmUuCj4KPiBBIHNldCBvZiB1
cHN0cmVhbSBpc3N1ZXMgaGF2ZSBiZWVuIHJhaXNlZCwgaW4gcmVsYXRpb24gd2l0aCB0aGlzIHRv
cGljOgo+Cj4gICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9wYWxpL2xpYm9wZW5hcHR4L2lzc3Vlcy8x
MQo+ICAgICAgICAgUG9zc2libGUgbGljZW5zZSB2aW9sYXRpb24KPgo+ICAgICBodHRwczovL2dp
dGh1Yi5jb20vcGFsaS9saWJvcGVuYXB0eC9pc3N1ZXMvMTIKPiAgICAgICAgIFJlc3RyaWN0aW9u
cyBiZWluZyBpbnZhbGlkYXRlZCBieSB0ZXJtcyBvZiBHUEwKPgo+ICAgICBodHRwczovL2dpdGh1
Yi5jb20vcGFsaS9saWJvcGVuYXB0eC9pc3N1ZXMvMTMKPiAgICAgICAgIFBsZWFzZSBwcm92aWRl
IGxpbmtzIG9yIGNpdGF0aW9ucyBmb3IgUkVBRE1FIGNsYWltcwo+Cj4gSW4gYWxsIGNhc2VzLCB0
aGUgYXV0aG9yIGRpc21pc3NlZCB0aG9zZSBhcyBpbnZhbGlkLCB3aXRoIHZhcmlvdXMgbGV2ZWxz
Cj4gb2YgYW1pYWJpbGl0eS4uLgo+Cj4gVGhpcyBzaXR1YXRpb24gaXMgdmVyeSBjb25jZXJuaW5n
Lgo+Cj4gRHJvcCB0aGUgcGFja2FnZSB0byBhdm9pZCBhbnkgaXNzdWUuCj4KCkkgdW5kZXJzdGFu
ZCB5b3VyIGNvbmNlcm5zLiBJZiB0aGUgbGljZW5zZSBwcm9ibGVtIGRvZXMgcmVhbGx5IG1hdHRl
ciwKd2UgY291bGQgdGhlbiB1c2UgdmVyc2lvbiAwLjIuMCBvZiB0aGlzIHBhY2thZ2UsIHdoaWNo
IGlzIGVzc2VudGlhbGx5CnRoZSBzYW1lIG9mIDAuMi4xLCBhbmQgd2l0aCBwcm9wZXIgbGljZW5z
ZS4gSSBvYmplY3QgcmVtb3ZpbmcgYWxsIHRoZQpzdXBwb3J0IGp1c3QgYmVjYXVzZSBvZiB0aGUg
c3VidGxlIGxpY2Vuc2UgaXNzdWUuCgpSZWdhcmRzLApZdW5oYW8KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
