Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB651C05027
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 13:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 665D9408EC;
	Mon, 20 Feb 2023 13:01:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 665D9408EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4aIrtezNFYBB; Mon, 20 Feb 2023 13:01:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EF97405A9;
	Mon, 20 Feb 2023 13:01:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EF97405A9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F5FC1BF288
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 13:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 273A481EBE
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 13:01:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 273A481EBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jyOqVU1mXUue for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 13:01:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD8C781E9F
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD8C781E9F
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 13:01:38 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id g23so1391047lfv.2
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 05:01:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3m2KxF6zZ6kEbgxzL1yF6Nt2Fgs7G8ojBlEM/8rLRT8=;
 b=meSUFFG0b9qyW21r1viBRLSywpQKsRhp+S02bjSgLIFQU1Llyu+QLCjHrZH4QTdKLc
 VNHM1ZUcODkmWGRIaKgAfIVHAnRpKHzhUyCFL1mRP1gYHfmuUY1m46zh7XTZPWg6/RYf
 2BqrinXM+/mOznLsOIBIDP6qr7IBm3TFo7Hg6fUR+lW8tKbV+reTg6wafEUY/p1AJOkB
 R7oFSYNC5NAs3fZ2zKrQgHcdjtClFQ3ZaIRlqOWcdRshZ1hcs8G8ZcXj8yqV6f1Ipl0D
 ov0uhvGwzjzeJCMP1P7tdGI/OMqSV59QHRsclkXM2McaOO9qKRJEI6Jb9exijFpRLTsd
 dRDw==
X-Gm-Message-State: AO0yUKXhqVcJ53/oPsCaSzGfqhIq6hXUzU32MFc+ybo1J4Xc3/0ZWNzr
 zMgy+5Z1UOX8IIF2PcwrAg7TSiPvVTv5Ay76
X-Google-Smtp-Source: AK7set93lgh9m13oS+S4R7OpysKfRzIoR8Zn4KWKfxeszWl60h/FngRlTsIE3LR/MCBl2ITjJnRj0g==
X-Received: by 2002:a05:6512:410:b0:4cb:3a60:65cc with SMTP id
 u16-20020a056512041000b004cb3a6065ccmr609450lfk.5.1676898096429; 
 Mon, 20 Feb 2023 05:01:36 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
 [209.85.208.182]) by smtp.gmail.com with ESMTPSA id
 d18-20020ac25452000000b004d8540b947asm429938lfn.56.2023.02.20.05.01.35
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 05:01:35 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id e9so1045033ljn.9
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 05:01:35 -0800 (PST)
X-Received: by 2002:a2e:8e32:0:b0:293:5f43:c7b0 with SMTP id
 r18-20020a2e8e32000000b002935f43c7b0mr651742ljk.5.1676898095460; Mon, 20 Feb
 2023 05:01:35 -0800 (PST)
MIME-Version: 1.0
References: <20230220090923.2155635-1-thomas.devoogdt@barco.com>
 <20230220090923.2155635-3-thomas.devoogdt@barco.com>
 <20230220112939.GB446957@igalia.com>
In-Reply-To: <20230220112939.GB446957@igalia.com>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Mon, 20 Feb 2023 14:01:24 +0100
X-Gmail-Original-Message-ID: <CACXRmJgC3ZJeWuJXpid2RRCD7CnXu+PZ7wRfBP35dLqfOVU62w@mail.gmail.com>
Message-ID: <CACXRmJgC3ZJeWuJXpid2RRCD7CnXu+PZ7wRfBP35dLqfOVU62w@mail.gmail.com>
To: Adrian Perez de Castro <aperez@igalia.com>
Subject: Re: [Buildroot] [PATCH v1 3/3] package/webkitgtk: security bump to
 version 2.38.5
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpDb21waWxpbmcgd2Via2l0Z3RrIHRha2VzIHNvbWUgdGltZSwgc28gSSB3b24ndCBjaGVj
ayBhbGwKYXJjaGl0ZWN0dXJlcywgYnV0IGF0IGxlYXN0IHRoaXMgc21hbGwgcmVwb3J0IGlzIG9r
OgoKJCBjYXQgd2Via2l0Z3RrLmNvbmZpZwpCUjJfUEFDS0FHRV9YT1JHNz15CkJSMl9QQUNLQUdF
X01FU0EzRD15CkJSMl9QQUNLQUdFX01FU0EzRF9PUEVOR0xfR0xYPXkKQlIyX1BBQ0tBR0VfTUVT
QTNEX0dBTExJVU1fRFJJVkVSX1NXUkFTVD15CkJSMl9QQUNLQUdFX0xJQkdUSzM9eQpCUjJfUEFD
S0FHRV9XRUJLSVRHVEs9eQoKJCAuL3V0aWxzL3Rlc3QtcGtnIC1jIHdlYmtpdGd0ay5jb25maWcg
LXAgd2Via2l0Z3RrCiAgICAgICAgICAgICAgICAgICAgYm9vdGxpbi1hcm12NS11Y2xpYmMgWzEv
Nl06IE9LCiAgICAgICAgICAgICAgICAgICAgIGJvb3RsaW4tYXJtdjctZ2xpYmMgWzIvNl06IE9L
CiAgICAgICAgICAgICAgICAgICBib290bGluLWFybXY3bS11Y2xpYmMgWzMvNl06IFNLSVBQRUQK
ICAgICAgICAgICAgICAgICAgICAgYm9vdGxpbi14ODYtNjQtbXVzbCBbNC82XTogT0sKICAgICAg
ICAgICAgICAgICAgICAgIGJyLWFybS1mdWxsLXN0YXRpYyBbNS82XTogU0tJUFBFRAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc291cmNlcnktYXJtIFs2LzZdOiBTS0lQUEVECjYgYnVpbGRz
LCAzIHNraXBwZWQsIDAgYnVpbGQgZmFpbGVkLCAwIGxlZ2FsLWluZm8gZmFpbGVkLCAwIHNob3ct
aW5mbyBmYWlsZWQKCmtyLAoKVGhvbWFzIERldm9vZ2R0CgpPcCBtYSAyMCBmZWIuIDIwMjMgb20g
MTA6Mjkgc2NocmVlZiBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdhbGlhLmNvbT46
Cj4KPiBIaSBUaG9tYXMsIGFsbCwKPgo+IE9uIE1vbiwgMjAgRmViIDIwMjMgMTA6MDk6MjMgKzAx
MDAgVGhvbWFzIERldm9vZ2R0IDx0aG9tYXNAZGV2b29nZHQuY29tPiB3cm90ZToKPiA+IEZyb206
IFRob21hcyBEZXZvb2dkdCA8dGhvbWFzLmRldm9vZ2R0QGdtYWlsLmNvbT4KPiA+Cj4gPiBCdWdm
aXggcmVsZWFzZSwgd2l0aCBtYW55IHNlY3VyaXR5IGZpeGVzLCBpbmNsdWRpbmcgKGJ1dCBub3Qg
bGltaXRlZCB0bykKPiA+IGEgcGF0Y2ggZm9yIENWRS0yMDIzLTIzNTI5Lgo+ID4KPiA+IFJlbGVh
c2Ugbm90ZXM6Cj4gPgo+ID4gICBodHRwczovL3dlYmtpdGd0ay5vcmcvMjAyMy8wMi8xNS93ZWJr
aXRndGsyLjM4LjUtcmVsZWFzZWQuaHRtbAo+Cj4gSGVoZSwgSSB3YXMganVzdCBhYm91dCB0byBz
dWJtaXQgdGhpcyB1cGRhdGUgbXlzZWxmIGFmdGVyIHNtb2tlLXRlc3RpbmcKPiBhIGJ1aWxkLiBU
aGFua3MgZm9yIHNlbmRpbmcgaXQgOi0pCj4KPiA+IEFjY29tcGFueWluZyBzZWN1cml0eSBhZHZp
c29yeToKPiA+Cj4gPiAgIGh0dHBzOi8vd2Via2l0Z3RrLm9yZy9zZWN1cml0eS9XU0EtMjAyMy0w
MDAyLmh0bWwKPiA+Cj4gPiBBbHNvIHJhaXNlIHRoZSBtaW5pbWFsIEdDQyB2ZXJzaW9uIHRvIDgu
Mywgd2hpY2ggd2FzIGFscmVhZHkgcmVxdWlyZWQgc2luY2Ugd2Via2l0Z3RrLTIuMzYuNC4KPiA+
IFNpbWlsYXIgdG8gY29tbWl0IGVjMWZmODAyZGY5YTBmMTdkZDJiNzM0YmE1MzZhNWUyMDZhYTVh
YTQsCj4gPiB3ZSBkbyBjaGVjayBvbiA+PSBHQ0MgOCwgYmVjYXVzZSB3ZSBjYW4ndCBjaGVjayBv
biA+PSBHQ0MgOC4zLgo+ID4KPiA+ICAgaHR0cHM6Ly9naXRodWIuY29tL1dlYktpdC9XZWJLaXQv
Y29tbWl0L2Y4MTJjNWRiMWZmMjJiY2JlMTA3MGNhNGVkNjEzMDg1Y2QzNjQ5OWIKPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBUaG9tYXMgRGV2b29nZHQgPHRob21hcy5kZXZvb2dkdEBnbWFpbC5jb20+
Cj4KPiBBY2tlZC1ieTogQWRyaWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+
Cj4KPiA+IC0tLQo+ID4gIHBhY2thZ2Uvd2Via2l0Z3RrL0NvbmZpZy5pbiAgICAgIHwgNCArKy0t
Cj4gPiAgcGFja2FnZS93ZWJraXRndGsvd2Via2l0Z3RrLmhhc2ggfCA4ICsrKystLS0tCj4gPiAg
cGFja2FnZS93ZWJraXRndGsvd2Via2l0Z3RrLm1rICAgfCAyICstCj4gPiAgMyBmaWxlcyBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBh
L3BhY2thZ2Uvd2Via2l0Z3RrL0NvbmZpZy5pbiBiL3BhY2thZ2Uvd2Via2l0Z3RrL0NvbmZpZy5p
bgo+ID4gaW5kZXggZGM1ZDczOGRhZS4uOTc2MzQxMDkzZSAxMDA2NDQKPiA+IC0tLSBhL3BhY2th
Z2Uvd2Via2l0Z3RrL0NvbmZpZy5pbgo+ID4gKysrIGIvcGFja2FnZS93ZWJraXRndGsvQ29uZmln
LmluCj4gPiBAQCAtMTYsNyArMTYsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfV0VCS0lUR1RLX0FS
Q0hfU1VQUE9SVFMKPiA+ICAgICAgIGRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfU1lOQ180
Cj4gPiAgICAgICBkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0xJQkdQR19FUlJPUl9BUkNIX1NVUFBP
UlRTICMgbGliZ2NyeXB0Cj4gPgo+ID4gLWNvbW1lbnQgIndlYmtpdGd0ayBuZWVkcyBsaWJndGsz
IGFuZCBhIHRvb2xjaGFpbiB3LyBDKyssIHdjaGFyLCB0aHJlYWRzLCBkeW5hbWljIGxpYnJhcnks
IGdjYyA+PSA3LCBob3N0IGdjYyA+PSA0LjkiCj4gPiArY29tbWVudCAid2Via2l0Z3RrIG5lZWRz
IGxpYmd0azMgYW5kIGEgdG9vbGNoYWluIHcvIEMrKywgd2NoYXIsIHRocmVhZHMsIGR5bmFtaWMg
bGlicmFyeSwgZ2NjID49IDgsIGhvc3QgZ2NjID49IDQuOSIKPiA+ICAgICAgIGRlcGVuZHMgb24g
QlIyX1BBQ0tBR0VfV0VCS0lUR1RLX0FSQ0hfU1VQUE9SVFMKPiA+ICAgICAgIGRlcGVuZHMgb24g
IUJSMl9CSU5GTVRfRkxBVAo+ID4gICAgICAgZGVwZW5kcyBvbiAhQlIyX1BBQ0tBR0VfTElCR1RL
MyB8fCAhQlIyX0lOU1RBTExfTElCU1REQ1BQIHx8IFwKPiA+IEBAIC0zMiw3ICszMiw3IEBAIGNv
bmZpZyBCUjJfUEFDS0FHRV9XRUJLSVRHVEsKPiA+ICAgICAgIGRlcGVuZHMgb24gQlIyX0hPU1Rf
R0NDX0FUX0xFQVNUXzRfOSAjIGljdSwgaG9zdC1ydWJ5Cj4gPiAgICAgICBkZXBlbmRzIG9uIEJS
Ml9JTlNUQUxMX0xJQlNURENQUAo+ID4gICAgICAgZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hB
U19USFJFQURTICMgd2F5bGFuZCwgaWN1LCBsaWJzb3VwCj4gPiAtICAgICBkZXBlbmRzIG9uIEJS
Ml9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzcKPiA+ICsgICAgIGRlcGVuZHMgb24gQlIyX1RPT0xD
SEFJTl9HQ0NfQVRfTEVBU1RfOAo+ID4gICAgICAgZGVwZW5kcyBvbiBCUjJfVVNFX1dDSEFSICMg
aWN1LCBsaWJzb3VwCj4gPiAgICAgICBkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0xJQkdUSzMKPiA+
ICAgICAgIGRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfV0VCS0lUR1RLX0FSQ0hfU1VQUE9SVFMKPiA+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL3dlYmtpdGd0ay93ZWJraXRndGsuaGFzaCBiL3BhY2thZ2Uv
d2Via2l0Z3RrL3dlYmtpdGd0ay5oYXNoCj4gPiBpbmRleCAzNGZkMTlkM2RlLi5jNzcxMjk3YjVh
IDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS93ZWJraXRndGsvd2Via2l0Z3RrLmhhc2gKPiA+ICsr
KyBiL3BhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5oYXNoCj4gPiBAQCAtMSw3ICsxLDcgQEAK
PiA+IC0jIEZyb20gaHR0cHM6Ly93ZWJraXRndGsub3JnL3JlbGVhc2VzL3dlYmtpdGd0ay0yLjM4
LjQudGFyLnh6LnN1bXMKPiA+IC1tZDUgIDFjOWNhODNhMGFkN2U0Y2E5ZTkzMzA5NDU3MmNiN2Q5
ICB3ZWJraXRndGstMi4zOC40LnRhci54ego+ID4gLXNoYTEgIDM4YjQ3ZGYyYmU5YmZiOTdkNjhm
Y2U4YzdmYTI4MTk5NjZhNzkwMzYgIHdlYmtpdGd0ay0yLjM4LjQudGFyLnh6Cj4gPiAtc2hhMjU2
ICA0ZjQ3ZWEyOWEyZDRkNWYxNWVlZjNkYzllMmQ2YzZmMDY3ZThkZTg2M2EzZjY0NDU1ZTFjY2Y5
NjkzY2MxZDM2ICB3ZWJraXRndGstMi4zOC40LnRhci54ego+ID4gKyMgRnJvbSBodHRwczovL3dl
YmtpdGd0ay5vcmcvcmVsZWFzZXMvd2Via2l0Z3RrLTIuMzguNS50YXIueHouc3Vtcwo+ID4gK21k
NSAgZGUwNWQzMTRhM2VjYjVmYjM4MzVlNGQ4NGY4ZjQ2NmQgIHdlYmtpdGd0ay0yLjM4LjUudGFy
Lnh6Cj4gPiArc2hhMSAgMTc3NDM5MGM2MjhiYjNhNTI0ZDRlZDc2ZjExZGU0YTg3ODA3OGRiNiAg
d2Via2l0Z3RrLTIuMzguNS50YXIueHoKPiA+ICtzaGEyNTYgIDQwYzIwYzQzMDIyMjc0ZGY1ODkz
ZjIyYjEwNTRmYTg5NGMzZWVhMDU3Mzg5YmIwOGFlZTA4YzViMGJiMGMxYTcgIHdlYmtpdGd0ay0y
LjM4LjUudGFyLnh6Cj4gPgo+ID4gICMgSGFzaGVzIGZvciBsaWNlbnNlIGZpbGVzOgo+ID4gIHNo
YTI1NiAgMGI1ZDNhN2NjMzI1OTQyNTY3MzczYjBlY2Q3NTdkMDdjMTMyZTBlYmQ3Yzk3YmZjNjNm
N2UxYTc2MDk0ZWRiNCAgU291cmNlL1dlYkNvcmUvTElDRU5TRS1BUFBMRQo+ID4gZGlmZiAtLWdp
dCBhL3BhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5tayBiL3BhY2thZ2Uvd2Via2l0Z3RrL3dl
YmtpdGd0ay5tawo+ID4gaW5kZXggYTY5NzRkYjkyNi4uMzI2M2Y3ZmVhMCAxMDA2NDQKPiA+IC0t
LSBhL3BhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5tawo+ID4gKysrIGIvcGFja2FnZS93ZWJr
aXRndGsvd2Via2l0Z3RrLm1rCj4gPiBAQCAtNCw3ICs0LDcgQEAKPiA+ICAjCj4gPiAgIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKPiA+Cj4gPiAtV0VCS0lUR1RLX1ZFUlNJT04gPSAyLjM4LjQKPiA+
ICtXRUJLSVRHVEtfVkVSU0lPTiA9IDIuMzguNQo+ID4gIFdFQktJVEdUS19TSVRFID0gaHR0cHM6
Ly93d3cud2Via2l0Z3RrLm9yZy9yZWxlYXNlcwo+ID4gIFdFQktJVEdUS19TT1VSQ0UgPSB3ZWJr
aXRndGstJChXRUJLSVRHVEtfVkVSU0lPTikudGFyLnh6Cj4gPiAgV0VCS0lUR1RLX0lOU1RBTExf
U1RBR0lORyA9IFlFUwo+ID4gLS0KPiA+IDIuMzkuMgo+ID4KPiA+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0
Cj4gPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gPgo+Cj4gQ2hlZXJzLAo+IOKAlEFkcmnD
oW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
