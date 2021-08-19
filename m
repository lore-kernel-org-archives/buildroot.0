Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D53C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 19:31:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E17260FE6
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 19:31:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E17260FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2968D40001;
	Thu, 19 Aug 2021 19:31:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S_MR8f0LmQeb; Thu, 19 Aug 2021 19:30:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC00D40100;
	Thu, 19 Aug 2021 19:30:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 705F31BF59F
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 19:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CF1880F1A
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 19:30:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9KeqQe9pYgo6 for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 19:30:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 782FB80EBB
 for <buildroot@busybox.net>; Thu, 19 Aug 2021 19:30:51 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id x4so6842462pgh.1
 for <buildroot@busybox.net>; Thu, 19 Aug 2021 12:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MM7WVG7RcgxS6QzTzyT5E23BwydPaQs0wEUlko8AFjY=;
 b=FQtuM0GuDmlmOd9Sa05Tuf5Hwz11vlJ0gxtDI+bUJXYVJaUEm4P+bqr8n35nTNhbgO
 gwn757NS5Q2FYYNHh7LEAjifgolux224bxjhHca5bKXXOzXoJamrsH4q+EBL/ZFCRtwo
 l1AYgYastx3LeLBvwoMqEHbyeHvPGdwuYHgn/ZHR7EdH62wQiXxNJqS+T19Hi+2QiVtE
 yaBMcTCdtBhP6hZlM5odVJg+yZ25cLxBw0J1RNrTuI/2QRkfFlkFWtNW1ZHMeOT7mAMB
 fRDFhZ6Z0YkSlmaPnYKg9xB842yKUi+DpWDG3HZikjdLI/ZyqFk3hFH6qhxNkloZ9W+d
 aHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MM7WVG7RcgxS6QzTzyT5E23BwydPaQs0wEUlko8AFjY=;
 b=rBgdWESPfbzeEKrWRfl7LkoVYwWpSoj4lNZI+KfaI1RW/Z8trGJyIk6Hm4MmAB4HpN
 rc2rV5lEdiTkaBE9UD8xWCz/hAv8P4FY6q3mnmZpgRd43DTe4//kc3nSCT3YgTOKhLZR
 U+JWmoGx0Nv0a6d9ubk/XRoIL/6vwMivaCEMknpLuedVTSt+2I3vpzwBEljecbKvYmtd
 kqe68F4mbPGpk4icZFK4xCKNPArOurCy/wqo4I/RCC8L9LMT5WHmejjWxaN+S8lSBGr7
 Fh9N0hzVbSklmSMAlR008kWB5p0XVoYuCIuVSJM4V3xbiSx2YL4AgRfUZiSf5p81B3/1
 I9PQ==
X-Gm-Message-State: AOAM533xcVytap0DCZ+4J8ZOeM6RZviO3G9q4Fppqa12YzHcNUKvgupd
 fSPAJKpe+ABP3BURustpi6bX94dc1GcaDGccTzSCsFOG4LO27g==
X-Google-Smtp-Source: ABdhPJyDXDMKvNIN7zAar96a86QvZgC3LVICZM2VXnoaF/7PfmFp4MQqOWlGQDiXct5uUyCUM1Lphp7zPAe8ZotfDis=
X-Received: by 2002:a62:8f86:0:b029:32e:33d7:998b with SMTP id
 n128-20020a628f860000b029032e33d7998bmr16396913pfd.64.1629401450804; Thu, 19
 Aug 2021 12:30:50 -0700 (PDT)
MIME-Version: 1.0
References: <CALtfCQajW_ZAvVq3J5cA=XgSh1w6u9_Sv+VoRcqLkSMO46aghg@mail.gmail.com>
 <34f4b07e-8a17-71a5-58cf-92af91aac87d@xes-inc.com>
In-Reply-To: <34f4b07e-8a17-71a5-58cf-92af91aac87d@xes-inc.com>
From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Thu, 19 Aug 2021 21:30:14 +0200
Message-ID: <CALtfCQaVaKxt_oHvK44EHmmSsJqh5+vEVgxEYLcNrEE10x0u7g@mail.gmail.com>
To: Vincent Fazio <vfazio@xes-inc.com>
Subject: Re: [Buildroot] Issues with SVN keywords and SITE_METHOD = svn
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SSBoYXZlIG1hZGUgdGhlc2UgdHdvIGNoYW5nZXM6CgotLS0KZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
cGtnLWRvd25sb2FkLm1rIGIvcGFja2FnZS9wa2ctZG93bmxvYWQubWsKaW5kZXggMjUyN2JhNS4u
MDg4ZjAwNiAxMDA2NDQKLS0tIGEvcGFja2FnZS9wa2ctZG93bmxvYWQubWsKKysrIGIvcGFja2Fn
ZS9wa2ctZG93bmxvYWQubWsKQEAgLTIwLDcgKzIwLDcgQEAgZXhwb3J0IExPQ0FMRklMRVMgOj0g
JChjYWxsIHFzdHJpcCwkKEJSMl9MT0NBTEZJTEVTKSkKICMgVmVyc2lvbiBvZiB0aGUgZm9ybWF0
IG9mIHRoZSBhcmNoaXZlcyB3ZSBnZW5lcmF0ZSBpbiB0aGUgY29ycmVzcG9uZGluZwogIyBkb3du
bG9hZCBiYWNrZW5kOgogQlJfRk1UX1ZFUlNJT05fZ2l0ID0gLWJyMQotQlJfRk1UX1ZFUlNJT05f
c3ZuID0gLWJyMgorQlJfRk1UX1ZFUlNJT05fc3ZuID0gLWJyMQoKIERMX1dSQVBQRVIgPSBzdXBw
b3J0L2Rvd25sb2FkL2RsLXdyYXBwZXIKCmRpZmYgLS1naXQgYS9zdXBwb3J0L2Rvd25sb2FkL3N2
biBiL3N1cHBvcnQvZG93bmxvYWQvc3ZuCmluZGV4IGIyM2I3NzcuLjcxYTEwNDIgMTAwNzU1Ci0t
LSBhL3N1cHBvcnQvZG93bmxvYWQvc3ZuCisrKyBiL3N1cHBvcnQvZG93bmxvYWQvc3ZuCkBAIC01
MCw3ICs1MCw3IEBAIF9wbGFpbl9zdm4oKSB7CiAgICAgZXZhbCAke1NWTn0gIiR7QH0iCiB9Cgot
X3N2biBleHBvcnQgLS1pZ25vcmUta2V5d29yZHMgJHtxdWlldH0gIiR7QH0iICInJHt1cml9QCR7
cmV2fSciICInJHtiYXNlbmFtZX0nIgorX3N2biBleHBvcnQgJHtxdWlldH0gIiR7QH0iICInJHt1
cml9QCR7cmV2fSciICInJHtiYXNlbmFtZX0nIgotLS0KCkFuZCBpdCB3b3JrcyBwZXJmZWN0bHku
CgpUaGFuayB5b3UuCgpPbiBUaHUsIDE5IEF1ZyAyMDIxIGF0IDIwOjU4LCBWaW5jZW50IEZhemlv
IDx2ZmF6aW9AeGVzLWluYy5jb20+IHdyb3RlOgo+Cj4gUGxlYXNlIHNlZSBCUiBjb21taXQgYzky
YmU4NWUzYTIKPgo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJv
b3QvcGF0Y2gvMjAyMTAzMTAyMjU5MzcuMzE1NTA3NS0xLXlhbm4ubW9yaW4uMTk5OEBmcmVlLmZy
Lwo+Cj4KPiBPbiA4LzE5LzIxIDE6MjYgUE0sIE9zY2FyIEdvbWV6IEZ1ZW50ZSB3cm90ZToKPiA+
IEhpIGV2ZXJ5b25lLAo+ID4KPiA+IEkgYW0gdXBkYXRpbmcgbXkgYnVpbGRyb290IGZyb20gMjAy
MC4wOC4yIHRvIDIwMjEuMDUuMSBhbmQgSSBoYXZlCj4gPiBmb3VuZCBhIHByb2JsZW0uCj4gPgo+
ID4gSSBoYXZlIG15IG93biBwYWNrYWdlIGNyZWF0ZWQgeWVhcnMgYWdvIHdpdGggU0lURV9NRVRI
T0QgPSBzdm4uIFRoZXJlCj4gPiBhcmUgc29tZSBmaWxlcyBpbiB0aGF0IHJlcG9zaXRvcnkgd2l0
aCBrZXl3b3JkIHN1YnN0aXR1dGlvbiB0aGF0IHdpdGgKPiA+IGJ1aWxkcm9vdCAyMDIwLjA4LjIg
d29ya3MgcGVyZmVjdGx5IGFuZCB0aGUgaGVhZGVycyBvZiB0aGUgZmlsZSBpcwo+ID4gZG93bmxv
YWRzIGZyb20gdGhlIHJlcG9zaXRvcnkgcGVyZmVjdGx5LCBhcyB5b3UgY2FuIHNlZToKPiA+Cj4g
PiAhIC91c3IvYmluL3B5dGhvbgo+ID4gIyAvKioKPiA+ICMgICogQGZpbGUgbmFtZS5weQo+ID4g
IyAgKiBAYXV0aG9yICBPc2NhciBHb21leiBGdWVudGUgPG9nb21lekB4eHh4Lnh4eD4KPiA+ICMg
ICogQHZlcnNpb24gJFJldjogMTYxICQKPiA+ICMgICogQGRhdGUgJERhdGU6IDIwMjEtMDgtMTkg
MTE6NTA6MjUgKzAyMDAgKGp1ZSwgMTkgYWdvIDIwMjEpICQKPiA+ICMgICogQHNlY3Rpb24gREVT
Q1JJUFRJT04KPiA+IC4uLi4KPiA+Cj4gPiBCdXQgd2l0aCBidWlsZHJvb3QgMjAyMS4wNS4xIGRv
ZXNuJ3Qgd29yayBmaW5lOgo+ID4KPiA+ICMhIC91c3IvYmluL3B5dGhvbgo+ID4gIyAvKioKPiA+
ICMgICogQGZpbGUgbmFtZS5weQo+ID4gIyAgKiBAYXV0aG9yICBPc2NhciBHb21leiBGdWVudGUg
PG9nb21lekB4eHh4Lnh4eD4KPiA+ICMgICogQHZlcnNpb24gJFJldiQKPiA+ICMgICogQGRhdGUg
JERhdGUkCj4gPiAjICAqIEBzZWN0aW9uIERFU0NSSVBUSU9OCj4gPiAuLi4KPiA+Cj4gPiBJIGhh
dmUgY2hlY2sgdGhhdCBteSBzdWJ2ZXJzaW9uIGlzIHdvcmtpbmcgcHJvcGVscmx5IGluIG15IGNv
bXB1dGVyLAo+ID4gc28gSSBkb25vdCBrbm9lIHdoYXQgdG8gZG8sIHRvIGtub3cgdGhpcyBSZXYg
a2V5d29yZCBpcyB2ZXJ5IGltcG9ydGFudAo+ID4gZm9yIG1lIGR1ZSB0byB0aGUgZmFjdCBJIHVz
ZSBpdCBmb3Igc2hvd2luZyB3aGVuIEkgZXhlY3V0ZSB0aGUKPiA+IHByb2dyYW0uCj4gPgo+ID4g
RG9lcyBhbnlvbmUgaGF2ZSBhbnkgaWRlYSBob3cgdG8gZml4IHRoaXMgaXNzdWU/Cj4gPgo+ID4g
VGhhbmtzLgo+ID4KPiA+IMOTc2NhciBHw7NtZXogRnVlbnRlCj4gPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gYnVpbGRyb290IG1haWxpbmcgbGlz
dAo+ID4gYnVpbGRyb290QGJ1c3lib3gubmV0Cj4gPiBodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPgo+IC0tCj4gVmluY2VudCBGYXppbwo+IEVtYmVk
ZGVkIFNvZnR3YXJlIEVuZ2luZWVyIC0gQVRTCj4gRXh0cmVtZSBFbmdpbmVlcmluZyBTb2x1dGlv
bnMsIEluYwo+IGh0dHA6Ly93d3cueGVzLWluYy5jb20KPgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
