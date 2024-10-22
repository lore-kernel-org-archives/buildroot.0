Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD802CDD0FA
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 21:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9573F605AD;
	Tue, 22 Oct 2024 21:38:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B2XLoERraxll; Tue, 22 Oct 2024 21:38:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1C6160671
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1C6160671;
	Tue, 22 Oct 2024 21:38:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 20F914C21
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0023D60671
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:38:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pwf7xfi9qFdH for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 21:38:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.179;
 helo=mail-yw1-f179.google.com; envelope-from=bryce.d.johnson@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EF8CE605AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF8CE605AD
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF8CE605AD
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:38:03 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-6e2e41bd08bso71126307b3.2
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 14:38:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729633082; x=1730237882;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AlzK0OSNfq1ToFdLOo7K8xJt9yc5qz0hWzlrkRhtx84=;
 b=Rgw7rk06KG0oQ/t0i4Vg07KBwrtCTKXTVbGRsQ5E/YRvxn9tMt441Vjgd3k9V9w6Ci
 eH7OvLvQQM4vNWbJarr+LTa/v/jnzPB47GrfRbFjb3cLgNmRhifY60C+GMbCoFu0q9ZX
 xFftoynEC3w+MU7maTgM+o8kEz//z5lpfkjgs/H2R2xanCKnBxxHmno5igDLq5j6BNrh
 OoAtWc61hHwA2skYxGk7VN8k9FIqF5iFdlTWQ2hjy1w9LiUUGpgrCC8F2YV9e5c1R8H1
 lq3TD2MPshJev7eY5IUZvSBW8PGSPx54sRg9hkv1QwqmcSBpCdYWl4HuFUQCYnGXXatx
 2Lwg==
X-Gm-Message-State: AOJu0YzrbeIAm+QXe1cb5rDCIvpttO5z8mTBJi6Q9L84p6mJXbdSa59P
 9xupokNaIIP3Sr01r8UU+t62m+1E/Llj9/blRmn3eQm/lp9oSlcVEvicKg==
X-Google-Smtp-Source: AGHT+IEvydfjskbQnaIy5sW49VOtfu9CWBqtXGzFZnJYsVR9tYc7UN1kojtF2m+gI1TEs+wfwcXCHQ==
X-Received: by 2002:a05:690c:6111:b0:6e2:167e:8155 with SMTP id
 00721157ae682-6e7f0f53dc0mr4937387b3.33.1729633082421; 
 Tue, 22 Oct 2024 14:38:02 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com.
 [209.85.128.169]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6e5f5ad5ad2sm12623147b3.70.2024.10.22.14.38.02
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Oct 2024 14:38:02 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-6e2e427b07dso51926067b3.1
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 14:38:02 -0700 (PDT)
X-Received: by 2002:a05:690c:d8a:b0:6dd:d85a:15e3 with SMTP id
 00721157ae682-6e7f0f984c2mr5125277b3.37.1729633081865; Tue, 22 Oct 2024
 14:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <20241022210334.261117-1-bryce@redpinelabs.com>
 <20241022231736.7e5626ef@windsurf>
In-Reply-To: <20241022231736.7e5626ef@windsurf>
From: Bryce Johnson <bryce@redpinelabs.com>
Date: Tue, 22 Oct 2024 15:37:51 -0600
X-Gmail-Original-Message-ID: <CADXxVSLZVC_BagdEePyLLV3_DAOytuCj46tzWWoa8N5ai=Z0mw@mail.gmail.com>
Message-ID: <CADXxVSLZVC_BagdEePyLLV3_DAOytuCj46tzWWoa8N5ai=Z0mw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Suniel Mahesh <sunil@amarulasolutions.com>
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=redpinelabs.com
Subject: Re: [Buildroot] [PATCH] package/arm-gnu-toolchain: Add $(HOSTARCH)
 so can be built with aarch64
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

SGkgVGhvbWFzLApJJ20gbG9va2luZyBhdCB0aGF0IGFzIHdlbGwsIGJ1dCBmaWd1cmVkIEkgd291
bGQgc3RhcnQgd2l0aCB0aGlzCmVhc2llciBjaGFuZ2UgdG8gbWFrZSBzdXJlIEkgZm9sbG93ZWQg
dGhlIGNvbnRyaWJ1dGlvbiBwcm9jZXNzCmNvcnJlY3RseS4KCkJyeWNlCgpPbiBUdWUsIE9jdCAy
MiwgMjAyNCBhdCAzOjE34oCvUE0gVGhvbWFzIFBldGF6em9uaQo8dGhvbWFzLnBldGF6em9uaUBi
b290bGluLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIDIyIE9jdCAyMDI0IDE1OjAzOjM0IC0wNjAw
Cj4gQnJ5Y2UgSm9obnNvbiA8YnJ5Y2VAcmVkcGluZWxhYnMuY29tPiB3cm90ZToKPgo+ID4gV2Fz
IHRlc3RpbmcgYnVpbGRpbmcgd2l0aCBhcm02NCBidWlsZCBzZXJ2ZXIgYW5kIGZhaWxlZCBiZWNh
dXNlIGl0Cj4gPiB3YXMgZG93bmxvYWRpbmcgdGhlIHg4Nl82NCB2ZXJzaW9uLgo+ID4KPiA+IFVz
ZSAkKEhPU1RBUkNIKSBpbnN0ZWFkIHNvIGl0IGNhbiBhbHNvIGRvd25sb2FkZWQKPiA+Cj4gPiBU
ZXN0ZWQgd2l0aCBidWlsZGluZyBjb25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZpZyBvbiBhcm02
NCB0aGF0IGl0Cj4gPiB1c2VzIHRvIGJ1aWxkIHRoZSAzMmJpdCBSNSBNQ1UuCj4gPgo+ID4gU2ln
bmVkLW9mZi1ieTogQnJ5Y2UgSm9obnNvbiA8YnJ5Y2VAcmVkcGluZWxhYnMuY29tPgo+ID4gLS0t
Cj4gPiAgcGFja2FnZS9hcm0tZ251LXRvb2xjaGFpbi9hcm0tZ251LXRvb2xjaGFpbi5oYXNoIHwg
MiArKwo+ID4gIHBhY2thZ2UvYXJtLWdudS10b29sY2hhaW4vYXJtLWdudS10b29sY2hhaW4ubWsg
ICB8IDIgKy0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+Cj4gQXBwbGllZCB0byBtYXN0ZXIgd2l0aCBhbiBpbXByb3ZlZCBjb21taXQgbG9nLiBU
aG91Z2ggSSBiZWxpZXZlIG1ha2luZwo+IHRoaXMgZGVwZW5kZW5jeSBtb3JlIGV4cGxpY2l0IHdv
dWxkIGJlIHVzZWZ1bCwgYXMgc3VnZ2VzdGVkIG9uIG15Cj4gcmV2aWV3IHRvIHlvdXIgdjEuIFRo
YW5rcyEKPgo+IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGluCj4g
RW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwo+IGh0dHBzOi8vYm9vdGxpbi5j
b20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
