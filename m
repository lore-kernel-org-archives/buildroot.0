Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EFDC43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 08:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4717860F44;
	Sun, 24 Jul 2022 08:32:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4717860F44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ca2oEQ2yGzVx; Sun, 24 Jul 2022 08:32:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2608560BC7;
	Sun, 24 Jul 2022 08:32:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2608560BC7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2CF781BF35F
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 08:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0705D41696
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 08:32:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0705D41696
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id guAFkORDPiR0 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 08:32:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3006F40025
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3006F40025
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 08:32:03 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id q18so1493313wrx.8
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 01:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GV75uiECoc6XqKttLIZj1AJgMcUe3pouOYnb/3JrZvs=;
 b=hAQwgcM9r1LGMuDGlzFdIrvxtQM5nIaHy9L6UxYFsRB1EZHkUmvI/4pJlf80KXROTc
 o0dqE8w/ylhiC1+kf5UaGBZQIN1i4wHS320uonSBAzX1jTqJW54ZYIYp52xgPN+rG5Ez
 luBnrayIcbNaojJn+LNhxHSssfwXG5+bXtLYdKNuizOS79CLW9vkzH9j+zch1gF/Vwjo
 9SLR8/4S2jS97lOnE9p8UiJnc13J6muYiP805oC8gTA4g1jcJdv+RN62vjTuCsswPB8U
 7LgwJrJXzVX6A3T8/5mkxzMxaUU5S/3d/kfF9+uHGVRSwpw6nzKDgpBUY9VMAhJbfGXH
 hIfw==
X-Gm-Message-State: AJIora//3pBgZ533sj7v7c8GHSMoeDmcL7UzGgFdEodDi0RvlCkWgmaK
 B8YyJVhkkfR6UWG7Wc8ARhOKBnyLqJi//g==
X-Google-Smtp-Source: AGRyM1telD7MWGk1FnugT1tPIh54DXOHRkZEgY8B03Zi+Ubm8FgHAmSys5SqjLhfEa5IG4geOOOHqQ==
X-Received: by 2002:a5d:5885:0:b0:21d:ad15:30be with SMTP id
 n5-20020a5d5885000000b0021dad1530bemr4767468wrf.90.1658651521119; 
 Sun, 24 Jul 2022 01:32:01 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 j23-20020a05600c1c1700b003a32251c3f9sm16555904wms.5.2022.07.24.01.32.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 01:32:00 -0700 (PDT)
Message-ID: <94a2d730-3d96-6a3b-77bb-0b2ffc2eabb6@smile.fr>
Date: Sun, 24 Jul 2022 10:32:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: fr
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20220724073726.A0A3B854E7@busybox.osuosl.org>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220724073726.A0A3B854E7@busybox.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=GV75uiECoc6XqKttLIZj1AJgMcUe3pouOYnb/3JrZvs=;
 b=Iaa35i2ZDBH5/bYzpB3uhjXalTTvzvrjPgP1qh2keNGNPdHX9BL7ra5lx9IGjkEoTR
 VFYQz/7xIqW9wgqpYwUlLEMBGqC1XyP4pxgjGRTi9AwinBYNaTT+RamoHFh5hKPoHQUd
 AtTjaHTOzWppIcZAzdVhHoLnfYXct5ZReIN07qsw+IkaOeX8BuIPaSGZ/JyNPFUJo/V4
 yl+ESSFQ09qg5FUcASV488gDnyBreFVr0Orb0La8FjyCgvVDfo+jWmIs1o/nAXTc1noC
 aFgEzlJrVMTbvrVwhXjLDX/oqTc4nezjPrz7Dd7HRtgkwwEcLXRrQB4Gbhg1PIQ7MWDW
 Zfnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=Iaa35i2Z
Subject: Re: [Buildroot] [git commit] package/python-maturin: new package
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSAyNC8wNy8yMDIyIMOgIDA5OjUwLCBUaG9tYXMgUGV0YXp6b25pIHZpYSBidWls
ZHJvb3QgYSDDqWNyaXTCoDoKPiBjb21taXQ6IGh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVp
bGRyb290L2NvbW1pdC8/aWQ9MmQ5OTFjOTJmNWJlNmE5YTg1OGM4Njg5ZWEyZDkyNzM2NWU5YzY2
NAo+IGJyYW5jaDogaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvY29tbWl0Lz9p
ZD1yZWZzL2hlYWRzL21hc3Rlcgo+IAo+IFRoaXMgaXMgcGVwNTE3IHB5bzMgYnVpbGQgYmFja2Vu
ZCB0aGF0J3MgYW4gYWx0ZXJuYXRpdmUgdG8KPiBweXRob24tc2V0dXB0b29scy1ydXN0Lgo+IAo+
IE5vdGUgdGhhdCBtYXR1cmluIGl0c2VsZiB1c2VzIHB5dGhvbi1zZXR1cHRvb2xzLXJ1c3QgZm9y
Cj4gYm9vdHN0cmFwcGluZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFt
ZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiBUZXN0ZWQtYnk6IEdyYWVtZSBTbWVjaGVyIDxnc21l
Y2hlckB0aHJlZXNwZWVkbG9naWMuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpv
bmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Cj4gLS0tCgouLi4KCj4gKysrIGIvcGFj
a2FnZS9weXRob24tbWF0dXJpbi9weXRob24tbWF0dXJpbi5tawo+IEBAIC0wLDAgKzEsMjUgQEAK
PiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArIwo+ICsjIHB5dGhvbi1tYXR1cmluCj4gKyMK
PiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArCj4gK1BZVEhPTl9NQVRVUklOX1ZFUlNJT04g
PSAwLjEyLjIwCj4gK1BZVEhPTl9NQVRVUklOX1NPVVJDRSA9IG1hdHVyaW4tJChQWVRIT05fTUFU
VVJJTl9WRVJTSU9OKS50YXIuZ3oKPiArUFlUSE9OX01BVFVSSU5fU0lURSA9IGh0dHBzOi8vZmls
ZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy8zOS9iYS9mZWM1OTg5NTYzOTMyMzAzNDFkZWY0
MjM2N2M2YWQwZWZiZWU2ZGRjODk5Zjg4NThlNWIyNWE3ZjM3YTUKPiArUFlUSE9OX01BVFVSSU5f
U0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKPiArUFlUSE9OX01BVFVSSU5fTElDRU5TRSA9IEFwYWNo
ZS0yLjAgb3IgTUlUCj4gK1BZVEhPTl9NQVRVUklOX0xJQ0VOU0VfRklMRVMgPSBsaWNlbnNlLWFw
YWNoZSBsaWNlbnNlLW1pdAo+ICtIT1NUX1BZVEhPTl9NQVRVUklOX0RFUEVOREVOQ0lFUyA9IFwK
PiArCWhvc3QtcHl0aG9uLXNldHVwdG9vbHMtcnVzdCBcCj4gKwlob3N0LXB5dGhvbi10b21saSBc
Cj4gKwlob3N0LXJ1c3RjCj4gK0hPU1RfUFlUSE9OX01BVFVSSU5fRU5WID0gXAo+ICsJJChIT1NU
X1BLR19DQVJHT19FTlYpIFwKPiArCVBZTzNfQ1JPU1NfTElCX0RJUj0iJChIT1NUX0RJUikvdXNy
L2xpYi9weXRob24kKFBZVEhPTjNfVkVSU0lPTl9NQUpPUikiCgpTaG91bGQgYmUgJChIT1NUX0RJ
UikvbGliIGhlcmUuCgpTZWUKaHR0cDovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVp
bGRyb290L3BhdGNoL2JjMTZhZGZlM2Q3MTQzMTA1ZTg0MDA3MmVkYjE2OWU0Y2I3MzU0Y2MuMTY1
ODAwNzAwMC5naXQueWFubi5tb3Jpbi4xOTk4QGZyZWUuZnIvCgpCZXN0IHJlZ2FyZHMsClJvbWFp
bgoKCj4gKyMgV2UgbmVlZCB0byB2ZW5kb3IgdGhlIENhcmdvIGNyYXRlcyBhdCBkb3dubG9hZCB0
aW1lCj4gK1BZVEhPTl9NQVRVUklOX0RPV05MT0FEX1BPU1RfUFJPQ0VTUyA9IGNhcmdvCj4gK1BZ
VEhPTl9NQVRVUklOX0RPV05MT0FEX0RFUEVOREVOQ0lFUyA9IGhvc3QtcnVzdGMKPiArSE9TVF9Q
WVRIT05fTUFUVVJJTl9ETF9FTlYgPSAkKEhPU1RfUEtHX0NBUkdPX0VOVikKPiArCj4gKyQoZXZh
bCAkKGhvc3QtcHl0aG9uLXBhY2thZ2UpKQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
