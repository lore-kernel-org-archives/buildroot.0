Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDF7E7AD58
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 14:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E7C641EB4;
	Tue,  3 Oct 2023 14:30:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E7C641EB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LhvYwE3qPCZx; Tue,  3 Oct 2023 14:30:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7208A41F62;
	Tue,  3 Oct 2023 14:30:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7208A41F62
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E3471BF59B
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 14:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E913280E75
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 14:30:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E913280E75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gy7teVxH-DCh for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 14:30:03 +0000 (UTC)
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC6FC80E5C
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 14:30:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC6FC80E5C
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-57bd4e4ada6so602347eaf.3
 for <buildroot@buildroot.org>; Tue, 03 Oct 2023 07:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696343402; x=1696948202;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0qkQ+p8fzigJVMLg+ShOwV1PjR2NhPjZO8M/O/GG7e4=;
 b=GEZGRHpkfndLnEB9AlMCxNJmbyKXulCUOwCCz/hiJk1yWjWBJ29dXZKA2zccyhy5mr
 DBbYC53lsUXg3MUK3D1wwehI2cQSh+GuNI7dOB6KeT6mjfI9Y7cTQzdsH90YtgGBVVaD
 Qw8tD/mW7J3aGUrhZZqmO4OBlLqzPTbZgB0LB71jO4rQVhCqeqxrCNaykWOsiLt0c+/B
 ji9O9De1NrA8fpCSz7q4Ci0GI1XogRxxV/AScQmsqhLbvvvB4UNUjRGnWSVL+WYyLSC7
 1gYrJR0M04hR+vDhcmPG4RYt+UDbbrekN0xfpIyjaHfp1jVbAef6xiY8aZEowdHdvzZr
 UqDw==
X-Gm-Message-State: AOJu0YyBpUEpl+sVn24I8pepVu9VBPLUujQj5nj7u7XU0xvvF4uq7JxR
 aH9K1H9L+gdKZa9Va2Egv+JGd+Lm+Oz6807BlyINKg==
X-Google-Smtp-Source: AGHT+IGdFhJTe1fvfK6DzxLfCF5EsVKZhmz3WwXx1oFKDaE3lD2e8F4l7BdfaaXepl8ynerji+3qeF1vskC3ofHBhI0=
X-Received: by 2002:a4a:9c9b:0:b0:573:f620:ec7e with SMTP id
 z27-20020a4a9c9b000000b00573f620ec7emr12228126ooj.0.1696343401275; Tue, 03
 Oct 2023 07:30:01 -0700 (PDT)
MIME-Version: 1.0
References: <20221004110421.137795-1-angelo@amarulasolutions.com>
 <20221004110421.137795-4-angelo@amarulasolutions.com>
 <cbc23baa-a46b-ab0c-e2ef-7940d9d12e69@mind.be>
In-Reply-To: <cbc23baa-a46b-ab0c-e2ef-7940d9d12e69@mind.be>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 3 Oct 2023 16:29:25 +0200
Message-ID: <CA+_SqVau=wW7oH4NWwzAbMG+efCnHcJq6Ep5OuecKopYR5kUFQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696343402; x=1696948202;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0qkQ+p8fzigJVMLg+ShOwV1PjR2NhPjZO8M/O/GG7e4=;
 b=lvSdvWc8/G6O5HQmIWivbKm93DYY4YzlX48jrgtqe5SJLOc+bSCvOhTa35GLlQM69H
 7qfR85rauIKbvs8nUtbSTQa0Z/eI/8KvhIji2lZz2cg2JstbAVHxMJmDs0l8Le5/CBaS
 74RGppXytr0CZxfm2BJWgYl5H7SaAUbWlHogo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=lvSdvWc8
Subject: Re: [Buildroot] [PATCH v4 3/5] package/wpa_supplicant: configure
 wifi on systemd when enabled
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

SGkgQXJub3V0LAoKT24gU2F0LCBTZXAgMzAsIDIwMjMgYXQgNjo1MeKAr1BNIEFybm91dCBWYW5k
ZWNhcHBlbGxlIDxhcm5vdXRAbWluZC5iZT4gd3JvdGU6Cj4KPgo+Cj4gT24gMDQvMTAvMjAyMiAx
MzowNCwgQW5nZWxvIENvbXBhZ251Y2NpIHdyb3RlOgo+ID4gQ29uZmlndXJlIGEgZGVmYXVsdCBi
YXNpYyB3aWZpIHNldHVwIGFibGUgdG8gYXV0b21hdGljYWxseSBjb25uZWN0Cj4gPiB0byB0aGUg
c2VsZWN0ZWQgYWNjZXNzIHBvaW50Lgo+Cj4gICBJIHRoaW5rIHRoaXMgZmVhdHVyZSBpcyBpbmRl
ZWQgdXNlZnVsLiBJSVVDLCBjdXJyZW50bHkgd3BhX3N1cHBsaWNhbnQgYWN0dWFsbHkKPiBpc24n
dCBzdGFydGVkLCBldmVuIHRob3VnaCB3ZSBkbyBpbnN0YWxsIGEgc2VydmljZSBmaWxlLgoKSSBk
byBub3QgdGhpbmsgSSdtIGdvaW5nIHRvIHJlc3BpbiBhbm90aGVyIHZlcnNpb24gb2YgdGhpcyBw
YXRjaCBkdWUKdG8gdGhlIGZhY3QgdGhlIG90aGVyIHBhdGNoZXMgaW4gdGhlIHNlcmllcyB3ZXJl
IHJlamVjdGVkLgoKVGhpcyBwYXRjaCBpcyBpbmRlZWQgbm90IHVzZWZ1bCB3aXRob3V0IHRoZSBv
dGhlcnM6IHdoYXQncyB0aGUgcG9pbnQKb2YgaGF2aW5nIHN5c3RlbWQgY29uZmlndXJlZCBmb3Ig
d3BhX3N1cHBsaWNhbnQgaWYgaW4gYW55IGNhc2UgdGhlCnVzZXIgbXVzdCBjb25maWd1cmUgYW4g
b3ZlcmxheSB0byBhZGQgYSB3b3JraW5nIHdwYV9zdXBwbGljYW50LmNvbmYKZmlsZT8gVGhlIHNl
cmllcyB3YXMgbWVhbnQgdG8gb2ZmZXIgYW4gZWFzeSB3YXkgdG8gY29uZmlndXJlIHRoZSB3aWZp
CmluIHRoZSBzYW1lIHdheSB3ZSBkbyBmb3IgdGhlIGV0aGVybmV0LgoKTW9yZW92ZXIsIGlmIHdl
IGNvbmZpZ3VyZSB3cGFfc3VwcGxpY2FudCBoZXJlLCBpdCdzIG5vdCBnb2luZyB0byB3b3JrCndp
dGhvdXQgY2xlYXJseSBleHBsYWluIHNvbWV3aGVyZSB0aGF0IHRoZSB1c2VyIG11c3QgaW1wbGVt
ZW50IGl0cyBvd24Kd3BhX3N1cHBsaWNhbnQuY29uZiBmaWxlLgpJbWhvIGl0J3Mgd2F5IG1vcmUg
Y29uZnVzaW5nIHRoYW4gb2ZmZXJpbmcgYSBjb21wbGV0ZWx5IERJWSBzb2x1dGlvbgphcyB3ZSBk
byBub3cuIEluIHRoZSBmaXJzdCBjYXNlIHdlIG5lZWQgdG8gZXhwbGFpbiBzb21ld2hlcmUgd2hh
dCB0bwpkbywgaW4gdGhlIGxhdHRlciB0aGUgdXNlciB3aWxsIGZpZ3VyZSBpdCBvdXQuCgo+Cj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogQW5nZWxvIENvbXBhZ251Y2NpIDxhbmdlbG9AYW1hcnVsYXNv
bHV0aW9ucy5jb20+Cj4gPiAtLS0KPiA+ICAgcGFja2FnZS93cGFfc3VwcGxpY2FudC93cGFfc3Vw
cGxpY2FudC5tayB8IDEwICsrKysrKysrKysKPiA+ICAgc3lzdGVtL0NvbmZpZy5pbiAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAxICsKPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRp
b25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvd3BhX3N1cHBsaWNhbnQvd3BhX3N1
cHBsaWNhbnQubWsgYi9wYWNrYWdlL3dwYV9zdXBwbGljYW50L3dwYV9zdXBwbGljYW50Lm1rCj4g
PiBpbmRleCA2MGFlMjkwZTI2Li44NjExZmM2NTc3IDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS93
cGFfc3VwcGxpY2FudC93cGFfc3VwcGxpY2FudC5tawo+ID4gKysrIGIvcGFja2FnZS93cGFfc3Vw
cGxpY2FudC93cGFfc3VwcGxpY2FudC5tawo+ID4gQEAgLTI3Nyw2ICsyNzcsMTUgQEAgZGVmaW5l
IFdQQV9TVVBQTElDQU5UX0VOQUJMRV9XSUZJCj4gPiAgICAgICAgICAgICAgIGVjaG8gIn0iOyBc
Cj4gPiAgICAgICApID4+ICQoVEFSR0VUX0RJUikvZXRjL3dwYV9zdXBwbGljYW50LmNvbmYKPiA+
ICAgZW5kZWYKPiA+ICtkZWZpbmUgV1BBX1NVUFBMSUNBTlRfV0lGSV9JTlNUQUxMX0lOSVRfU1lT
VEVNRAo+ID4gKyAgICAgJChJTlNUQUxMKSAtbSAwNzU1IC1kICQoVEFSR0VUX0RJUikvZXRjL3dw
YV9zdXBwbGljYW50Lwo+ID4gKyAgICAgbG4gLXNmIC4uL3dwYV9zdXBwbGljYW50LmNvbmYgXAo+
ID4gKyAgICAgICAgICAgICAkKFRBUkdFVF9ESVIpL2V0Yy93cGFfc3VwcGxpY2FudC93cGFfc3Vw
cGxpY2FudC0kKEJSMl9TWVNURU1fREhDUCkuY29uZgo+Cj4gICBJZiB0aGUgaW50ZXJmYWNlLXNw
ZWNpZmljIHNlcnZpY2UgaXMgdXNlZCByYXRoZXIgdGhhbiB0aGUgZ2xvYmFsIG9uZSwgSSB0aGlu
awo+IHRoZSBpZGVhIGlzIHRvIGJlIGFibGUgdG8gdXNlIHNlcGFyYXRlIGNvbmYgZmlsZXMgZm9y
IHRoZW0uIFNvIEkgdGhpbmsgaXQgbWFrZXMKPiBtb3JlIHNlbnNlIHRvIGNvcHkgdGhhbiBzeW1s
aW5rLgo+Cj4gICBUaGF0IHNhaWQsIEknbSBub3Qgc3VyZSBpZiBpdCdzIHJlYWxseSB1c2VmdWwg
dG8gdXNlIHRoZSBwZXItaW50ZXJmYWNlCj4gc2VydmljZS4gVGhlIGdsb2JhbCBvbmUgc2hvdWxk
IHdvcmsgYXMgd2VsbCwgbm8/IEkgdGhpbmsgdGhlIG9ubHkgdGhpbmcgd2UncmUKPiBtaXNzaW5n
IGlzIHRvIGVuYWJsZSBpdCBmb3IgdGhlIHdpZmkgaW50ZXJmYWNlLgo+Cj4gICBBbHNvLCBJIGRv
bid0IHRoaW5rIGl0J3MgYSBnb29kIGlkZWEgdG8gcmV1c2UgQlIyX1NZU1RFTV9ESENQIGZvciB0
aGlzLiBUaGVyZQo+IGFyZSBxdWl0ZSBhIGZldyBib2FyZHMgdGhhdCBoYXZlIGJvdGggZXRoZXJu
ZXQgYW5kIHdpZmkgYW5kIGlkZWFsbHkgd2Ugd2FudCBib3RoCj4gdG8gY29tZSB1cC4gU28gSSB0
aGluayBpdCdzIHdvcnRoIGFkZGluZyBhIEJSMl9TWVNURU1fV0xBTiB0byBzcGVjaWZ5IHRoZSB3
aWZpCj4gaW50ZXJmYWNlIC0gYW5kIHBlcmhhcHMgYXV0b21hdGljYWxseSBzZWxlY3Qgd3BhX3N1
cHBsaWNhbnQgaWYgdGhhdCBvcHRpb24gaXMKPiBzZXQgKGFsdGhvdWdoIHdlIGNvdWxkIGp1c3Qg
YXMgd2VsbCB1c2UgaXdkIGluc3RlYWQgb2Ygc3VwcGxpY2FudCwgb2YgY291cnNlKS4KPgo+ID4g
K2VuZGVmCj4gPiArZGVmaW5lIFdQQV9TVVBQTElDQU5UX1dJRklfSU5TVEFMTF9JTklUX1NZU1RF
TURfUFJFU0VUCj4gPiArICAgICAkKEhPU1RfRElSKS9iaW4vc3lzdGVtY3RsIC0tcm9vdD0kKFRB
UkdFVF9ESVIpIHByZXNldCB3cGFfc3VwcGxpY2FudFxAJChCUjJfU1lTVEVNX0RIQ1ApLnNlcnZp
Y2UKPgo+ICAgSSdtIG5vdCBzdXJlIHdoYXQgdGhpcyBpcyBzdXBwb3NlZCB0byBkby4gRG9lc24n
dCBpdCBqdXN0IHVuZG8gdGhlIGRpc2FibGUgd2UKPiBkbyBpbiA1MC13cGFfc3VwcGxpY2FudC5w
cmVzZXQ/IFdvdWxkbid0IGl0IGJlIGJldHRlciB0byBqdXN0IHJlbW92ZSB0aGF0IHByZXNldAo+
IHNvbWVob3c/Cj4KPiA+ICtlbmRlZgo+ID4gK1NZU1RFTURfUk9PVEZTX1BSRV9DTURfSE9PS1Mg
Kz0gV1BBX1NVUFBMSUNBTlRfV0lGSV9JTlNUQUxMX0lOSVRfU1lTVEVNRF9QUkVTRVQKPiA+ICAg
ZW5kaWYKPiA+Cj4gPiAgIGRlZmluZSBXUEFfU1VQUExJQ0FOVF9JTlNUQUxMX1RBUkdFVF9DTURT
Cj4gPiBAQCAtMzA0LDYgKzMxMyw3IEBAIGRlZmluZSBXUEFfU1VQUExJQ0FOVF9JTlNUQUxMX0lO
SVRfU1lTVEVNRAo+ID4gICAgICAgICAgICAgICAkKFRBUkdFVF9ESVIpL3Vzci9saWIvc3lzdGVt
ZC9zeXN0ZW0vd3BhX3N1cHBsaWNhbnQtd2lyZWRALnNlcnZpY2UKPiA+ICAgICAgICQoSU5TVEFM
TCkgLUQgLW0gNjQ0ICQoV1BBX1NVUFBMSUNBTlRfUEtHRElSKS81MC13cGFfc3VwcGxpY2FudC5w
cmVzZXQgXAo+ID4gICAgICAgICAgICAgICAkKFRBUkdFVF9ESVIpL3Vzci9saWIvc3lzdGVtZC9z
eXN0ZW0tcHJlc2V0LzUwLXdwYV9zdXBwbGljYW50LnByZXNldAo+ID4gKyAgICAgJChXUEFfU1VQ
UExJQ0FOVF9XSUZJX0lOU1RBTExfSU5JVF9TWVNURU1EKQo+ID4gICBlbmRlZgo+ID4KPiA+ICAg
JChldmFsICQoZ2VuZXJpYy1wYWNrYWdlKSkKPiA+IGRpZmYgLS1naXQgYS9zeXN0ZW0vQ29uZmln
LmluIGIvc3lzdGVtL0NvbmZpZy5pbgo+ID4gaW5kZXggNjQ3MDcyYjk2NS4uNzYxYTVhOTVjMiAx
MDA2NDQKPiA+IC0tLSBhL3N5c3RlbS9Db25maWcuaW4KPiA+ICsrKyBiL3N5c3RlbS9Db25maWcu
aW4KPiA+IEBAIC00MjEsNiArNDIxLDcgQEAgY29tbWVudCAiYXV0b21hdGljIG5ldHdvcmsgY29u
ZmlndXJhdGlvbiB2aWEgREhDUCBuZWVkcyBpZnVwZG93biBvciBidXN5Ym94IG9yIG4KPiA+ICAg
Y29uZmlnIEJSMl9TWVNURU1fQ09OTkVDVF9XSUZJCj4gPiAgICAgICBib29sICJDb25uZWN0IHRv
IGEgZGVmYXVsdCB3aWZpIGFjY2VzcyBwb2ludCIKPiA+ICAgICAgIGRlcGVuZHMgb24gQlIyX1NZ
U1RFTV9ESENQICE9ICIiICYmIEJSMl9QQUNLQUdFX1dQQV9TVVBQTElDQU5UCj4gPiArICAgICBz
ZWxlY3QgQlIyX1BBQ0tBR0VfV1BBX1NVUFBMSUNBTlRfQ1RSTF9JRkFDRSBpZiBCUjJfUEFDS0FH
RV9TWVNURU1ECj4KPiAgIFRoaXMgbmVlZHMgc29tZSBleHBsYW5hdGlvbi4gSSBkb24ndCBzZWUg
dGhlIHNlcnZpY2UgZmlsZXMgcmVxdWlyaW5nIHRoaXMKPiBhbnl3aGVyZS4KPgo+ICAgT24gdGhl
IG90aGVyIGhhbmQsIHRoZSBnbG9iYWwgc2VydmljZSBmaWxlIGRvZXMgc3RhcnQgd3BhX3N1cHBs
aWNhbnQgd2l0aCB0aGUKPiAtdSBvcHRpb24gc28gaXQgd291bGQgbmVlZCBkYnVzLgo+Cj4KPiAg
IFJlZ2FyZHMsCj4gICBBcm5vdXQKPgo+ID4KPiA+ICAgY29uZmlnIEJSMl9TWVNURU1fQ09OTkVD
VF9XSUZJX1NTSUQKPiA+ICAgICAgIHN0cmluZyAiQWNjZXNzIHBvaW50IFNTSUQiCgoKCi0tIAoK
QW5nZWxvIENvbXBhZ251Y2NpCgpTb2Z0d2FyZSBFbmdpbmVlcgoKYW5nZWxvQGFtYXJ1bGFzb2x1
dGlvbnMuY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQW1hcnVsYSBTb2x1
dGlvbnMgU1JMCgpWaWEgbGUgQ2FuZXZhcmUgMzAsIDMxMTAwIFRyZXZpc28sIFZlbmV0bywgSVQK
ClQuICszOSAoMCk0MiAyNDMgNTMxMAppbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgp3d3cuYW1h
cnVsYXNvbHV0aW9ucy5jb20KCltgYXNdIGh0dHBzOi8vd3d3LmFtYXJ1bGFzb2x1dGlvbnMuY29t
fApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
