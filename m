Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DEDC433F5
	for <buildroot@archiver.kernel.org>; Sat, 26 Feb 2022 14:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68D6C818A1;
	Sat, 26 Feb 2022 14:05:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vowff2v6LqSz; Sat, 26 Feb 2022 14:05:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9668281871;
	Sat, 26 Feb 2022 14:05:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 143A61BF3A3
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 14:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02028400FB
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 14:05:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mNOF5czwR88V for <buildroot@lists.busybox.net>;
 Sat, 26 Feb 2022 14:05:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com
 [IPv6:2607:f8b0:4864:20::a32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A04644002B
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 14:05:04 +0000 (UTC)
Received: by mail-vk1-xa32.google.com with SMTP id x62so2990650vkg.6
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 06:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=n3z3XWLyxVYk6qOFTym76M4WUGmoOfscpufnSWBQszM=;
 b=dyNeQ+ZWKjtgYIJI/xCnFBTebtnxJ2Kxhlk3CZeE7bYVAjHoRyAz54DCSlMFVCn0B/
 39CLNiZIZX+iJQGvToLi0Lxx3artqrk3Pz9BnhbSEtLRupv6BP8FCKSxswNRQJkXrZA3
 ec/4M0KtzkZE6MybGWH09vGY1fFPngzQtN85Zizu7tA/SBBf+HPE3vGH169/5vfSFZ0r
 bS+UBeJM5dhIzthA5ly3JprgKltuRlew99or5FqeNjQObluds9PT88Amld4/+rEjizZE
 3/9xOaykZIKH35YCk4gphRYZ8SR3ZWgJN4sfBIo0o8LSamhwkxl5DzM+8EFImv4aIV3i
 FAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=n3z3XWLyxVYk6qOFTym76M4WUGmoOfscpufnSWBQszM=;
 b=w70AswB7d0RgJ5a7QfTjW8U2Cx7uSIXxUYLTNbw4ZyP8amk3WNcN2uP+LySo3e7ySo
 xWQKpbqRGhHgvuOPaafSGRVh801peeyvcr2lF4K3RZG9kQ8i23gwAMiErK8sMJArCKQe
 b9oy43ylhEvCiQNZJ//b62AOg3runrash4hAJwlHCp8Ke5p2BsFonz5imVAISUBy9jAQ
 UfHbHf5j4YJjUNUb++x1XQsH32ocUYSiBKs5wpb4NnTuXbTxEoCB9eShVvWYsOj3sHEP
 4doxJC5RnMWhY5IvC5wMY4YtvXONLxUGdYnL7On5JTvWnNZzjjRlOdqgc6E0aQov39oX
 XjAw==
X-Gm-Message-State: AOAM533s/pITqImuKiXuWRXHyRfTrcMcdIXht5f2ppdyk1QO3swAiVAz
 sk5/9sJuLRnUB51HPsdsCxi25+U738kJHNSVRifum8uc
X-Google-Smtp-Source: ABdhPJyC9dVeTilIwfZO/aK7HvXDgows2DWtksDmNgxLCSS2/PfHf33qotiwivSIRbXFQxQlMitQRalTNS6w7NjMZGM=
X-Received: by 2002:a05:6122:c61:b0:331:90bf:d93f with SMTP id
 i33-20020a0561220c6100b0033190bfd93fmr5011066vkr.34.1645884303244; Sat, 26
 Feb 2022 06:05:03 -0800 (PST)
MIME-Version: 1.0
References: <20220222213202.642708-1-ju.o@free.fr>
In-Reply-To: <20220222213202.642708-1-ju.o@free.fr>
From: Gilles Talis <gilles.talis@gmail.com>
Date: Sat, 26 Feb 2022 15:04:52 +0100
Message-ID: <CAKcgs2znPw=ZxsjMSk1dWtC3i9PpXONoeQJuwCp-ykE64F2sKA@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/mariadb: fix mysql.service
 failing to create log directory
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSnVsaWVuLCBhbGwsCgpMZSBtYXIuIDIyIGbDqXZyLiAyMDIyIMOgIDIyOjMyLCBKdWxpZW4g
T2xpdmFpbiA8anUub0BmcmVlLmZyPiBhIMOpY3JpdCA6Cj4KPiBXaGVuIGVuYWJsaW5nIE1hcmlh
REIgKEJSMl9QQUNLQUdFX01BUklBREI9eSkgYW5kIHN5c3RlbWQKPiAoQlIyX0lOSVRfU1lTVEVN
RD15KSBpbiBidWlsZHJvb3QsIHRoZSBteXNxbGQuc2VydmljZSBmYWlsIHRvIHN0YXJ0Cj4gd2l0
aCBhIHBlcm1pc3Npb24gZXJyb3IuICBTZWUgb3V0cHV0IG9mIGNvbW1hbmQ6Cj4KPiAgICAgam91
cm5hbGN0bCAtLXVuaXQ9bXlzcWxkCj4KPiBXaGljaCBzaG93czoKPgo+ICAgICBzeXN0ZW1kWzFd
OiBTdGFydGluZyBNeVNRTCBkYXRhYmFzZSBzZXJ2ZXIuLi4KPiAgICAgaW5zdGFsbFsxMDJdOiBp
bnN0YWxsOiBjYW4ndCBjcmVhdGUgZGlyZWN0b3J5ICcvdmFyL2xvZy9teXNxbCc6IFBlcm1pc3Np
b24gZGVuaWVkCj4gICAgIHN5c3RlbWRbMV06IG15c3FsZC5zZXJ2aWNlOiBDb250cm9sIHByb2Nl
c3MgZXhpdGVkLCBjb2RlPWV4aXRlZCwgc3RhdHVzPTEvRkFJTFVSRQo+Cj4gU2luY2UgdGhlIHNl
cnZpY2UgZmlsZSBpbmNsdWRlcyB0aGUgIlVzZXI9bXlzcWwiIGRpcmVjdGl2ZSwgdGhlCj4gIkV4
ZWNTdGFydFByZT0iIGlzIGV4ZWN1dGVkIGFzIHRoaXMgdXNlciwgd2hpY2ggZG9lcyBub3QgaGF2
ZQo+IHBlcm1pc3Npb24gdG8gY3JlYXRlIGEgZGlyZWN0b3J5IGluICIvdmFyL2xvZyIuCj4KPiBU
aGlzIGNvbW1pdCBmaXhlcyB0aGlzIGlzc3VlIGJ5IGFkZGluZyB0aGUgIiEiIHByZWZpeCwgd2hp
Y2ggd2lsbAo+IGV4ZWN1dGUgdGhlIGNvbW1hbmQgd2l0aCBmdWxsIHByaXZpbGVnZXMuICBTZWUg
dGhlIHN5c3RlbWQuc2VydmljZSBtYW51YWwKPiBwYWdlIGVudHJ5IGZvciAiRXhlY1N0YXJ0PSIs
IHRhYmxlICJTcGVjaWFsIGV4ZWN1dGFibGUgcHJlZml4ZXMiOgo+IGh0dHBzOi8vd3d3LmZyZWVk
ZXNrdG9wLm9yZy9zb2Z0d2FyZS9zeXN0ZW1kL21hbi9zeXN0ZW1kLnNlcnZpY2UuaHRtbCNFeGVj
U3RhcnQ9Cj4gb3IgaHR0cHM6Ly9naXRodWIuY29tL3N5c3RlbWQvc3lzdGVtZC9ibG9iL3YyNTAv
bWFuL3N5c3RlbWQuc2VydmljZS54bWwjTDMzOQo+Cj4gTW9yZW92ZXIsIHRoZSAibXlzcWxfaW5z
dGFsbF9kYiIgaW52b2NhdGlvbiBkb2VzIG5vdCBuZWVkIHRoaXMgc3BlY2lhbAo+IHByZWZpeCwg
YXMgdGhlICIvdmFyL2xpYi9teXNxbCIgZGlyZWN0b3J5IG9uIHRhcmdldCBpcyBhbHJlYWR5IG93
bmVkCj4gYnkgdGhlICJteXNxbCIgdXNlci4gIFRoZSAiY2hvd24iIGNvbW1hbmQgaXMgYWxzbyB1
c2VsZXNzIGFuZCBpcwo+IHJlbW92ZWQgaW4gdGhpcyBjb21taXQuCj4KPiBSZXBvcnRlZC1ieTog
R2lsbGVzIFRhbGlzIDxnaWxsZXMudGFsaXNAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEp1
bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+Cj4gLS0tCj4gIHBhY2thZ2UvbWFyaWFkYi9teXNx
bGQuc2VydmljZSB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWFyaWFkYi9teXNxbGQuc2Vy
dmljZSBiL3BhY2thZ2UvbWFyaWFkYi9teXNxbGQuc2VydmljZQo+IGluZGV4IGQ5ZWE3NGViYzMu
LjUzNzQzMGU5YTIgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9tYXJpYWRiL215c3FsZC5zZXJ2aWNl
Cj4gKysrIGIvcGFja2FnZS9tYXJpYWRiL215c3FsZC5zZXJ2aWNlCj4gQEAgLTIsOCArMiw4IEBA
Cj4gIERlc2NyaXB0aW9uPU15U1FMIGRhdGFiYXNlIHNlcnZlcgo+Cj4gIFtTZXJ2aWNlXQo+IC1F
eGVjU3RhcnRQcmU9L2Jpbi9zaCAtYyAndGVzdCAiYGxzIC0xIC92YXIvbGliL215c3FsIHwgd2Mg
LWxgIiAhPSAiMCIgfHwgbXlzcWxfaW5zdGFsbF9kYiAtLWJhc2VkaXI9L3VzciAtLWRhdGFkaXI9
L3Zhci9saWIvbXlzcWwgJiYgY2hvd24gLVIgbXlzcWw6bXlzcWwgL3Zhci9saWIvbXlzcWwnCj4g
LUV4ZWNTdGFydFByZT1pbnN0YWxsIC1kIC1vIG15c3FsIC1nIHJvb3QgLW0gMDc1NSAvdmFyL2xv
Zy9teXNxbAo+ICtFeGVjU3RhcnRQcmU9L2Jpbi9zaCAtYyAndGVzdCAiYGxzIC0xIC92YXIvbGli
L215c3FsIHwgd2MgLWxgIiAhPSAiMCIgfHwgbXlzcWxfaW5zdGFsbF9kYiAtLWJhc2VkaXI9L3Vz
ciAtLWRhdGFkaXI9L3Zhci9saWIvbXlzcWwnCj4gK0V4ZWNTdGFydFByZT0haW5zdGFsbCAtZCAt
byBteXNxbCAtZyByb290IC1tIDA3NTUgL3Zhci9sb2cvbXlzcWwKPiAgRXhlY1N0YXJ0PS91c3Iv
YmluL215c3FsZF9zYWZlIC0tbG9nLWVycm9yPS92YXIvbG9nL215c3FsL215c3FsZC5sb2cKPiAg
UmVzdGFydD1hbHdheXMKPiAgVXNlcj1teXNxbAo+IC0tCj4gMi4zNS4xCj4KVGhhbmtzIGZvciB0
aGUgcGF0Y2guIFN1Y2Nlc3NmdWxseSB0ZXN0ZWQgb24gYW4gYWFyY2g2NCBzeXN0ZW0uIFNvLAoK
VGVzdGVkLUJ5OiBHaWxsZXMgVGFsaXMgPGdpbGxlcy50YWxpc0BnbWFpbC5jb20+Cgp0aGFua3MK
R2lsbGVzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
