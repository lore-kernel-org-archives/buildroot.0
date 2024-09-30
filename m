Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9313CE8379
	for <buildroot@archiver.kernel.org>; Mon, 30 Sep 2024 17:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E9EC80C14;
	Mon, 30 Sep 2024 17:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kiQKSHSkRUjQ; Mon, 30 Sep 2024 17:36:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0DDE80C58
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0DDE80C58;
	Mon, 30 Sep 2024 17:36:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 10DED1BF290
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 17:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CEA6606D0
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 17:36:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qbPVQ3oAwcor for <buildroot@lists.busybox.net>;
 Mon, 30 Sep 2024 17:36:52 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=198.175.65.12;
 helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2B64D606BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B64D606BD
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B64D606BD
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 17:36:51 +0000 (UTC)
X-CSE-ConnectionGUID: FrDQDeINRzOYj6/wzUVSwQ==
X-CSE-MsgGUID: BCbPeqJFRmebYAer8ujapA==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="38212197"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="38212197"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 10:36:40 -0700
X-CSE-ConnectionGUID: BQSjiLbDQ9imRnCS6pkM3Q==
X-CSE-MsgGUID: xXZ0rk0RT/C07HYaI5hzIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="72982769"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 10:36:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1svKJs-0000000EspW-3yvJ; Mon, 30 Sep 2024 20:36:24 +0300
Date: Mon, 30 Sep 2024 20:36:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Yan <andyshrk@163.com>
Message-ID: <ZvrhmHHKezLXHFI0@smile.fi.intel.com>
References: <20240927183553.2866682-1-andriy.shevchenko@linux.intel.com>
 <1980998d.2daf.19237e561b7.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1980998d.2daf.19237e561b7.Coremail.andyshrk@163.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727717813; x=1759253813;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=yTN7XouxPgDUN0nbJ3tNCdzW1T6ZBFeCS0V5jJU5GH8=;
 b=PUyb8M7CB6oECykEzcJxN8mcod3JhuTQpzWLBgRyy+PakDQ6WY1AQjT6
 VBid3lDhQ++0GGCT/OFjfDiZXzoOYy191zXkFHHuBmzN6C9Siw6CadWEk
 W9eCCSrvBl+9mS+KE9dY/nsQwnsbHTBMxrYj3AMwhvd/89oNB+Vd7gv7E
 vXwqWp65fsCte8i61dkffMEes0FAdJIzPR9OHZ0faIkfkv0+udp3ISrXD
 pCeOaCKU6CNNlR+nb2PHYqP+C92WGkFkS76Mrv3EyHSs86MMeMfqp6v1m
 pJ6sE+iALG7LrtzPkegv7ek/5HMQlff2/93EDZQGTTVcJFDhkTTjiOivV
 g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.intel.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PUyb8M7C
Subject: Re: [Buildroot] [PATCH v2 1/1] package: Add iotools package
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
Cc: Andy Yan <andyshrk@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCBTZXAgMjgsIDIwMjQgYXQgMDU6MTA6MzJQTSArMDgwMCwgQW5keSBZYW4gd3JvdGU6
Cj4gCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNo77yMSSBoYXZlIGEgcXVpY2sgdGVzdCB3aXRoIHRo
aXMgdG9vbCwgaXQgY2FuIHdvcmsgb24gYXJtNjQgcGxhdGZvcm0uCj4gQnV0IGkgZm91bmQgaXQg
YWxzbyAgbGFja3Mgc29tZSBmZWF0dXJlcyB0aGF0IElPIGRvZXNuJ3QgaGF2ZSwgc3VjaCBhcyBp
byBjbWQgc3VwcG9ydCBhIGxlbmd0aAo+IGFyZ3VtZW50cywgdGhhdCBtYWtlIGl0IGNhbiByZWFk
IEl0IGNhbiByZWFkIGEgYmF0Y2ggb2YgcmVnaXN0ZXJzIGF0IG9uY2UuCj4gV291bGQgeW91IGNv
bnNpZGVyIGFkZGluZyB0aGVzZSBmZWF0dXJlcyBpbiB0aGUgZnV0dXJlPwoKSSdtIG5vdCBzdXJl
IEkgZ290IHRoaXMuIFRoZXJlIGFyZSB0d28gY29tbWFuZHMgbW1pb19kdW1wICh0byByZWFkIGFu
eSBtZW1vcnkKbWFwcGVkIElPIHJhbmdlKSBhbmQgbW1pb19sb2FkICh0byB3cml0ZSB0aGUgcmFu
Z2UgZnJvbSBhIGZpbGUpLgoKPiBBdCAyMDI0LTA5LTI4IDAyOjM0OjU5LCAiQW5keSBTaGV2Y2hl
bmtvIiA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPiB3cm90ZToKPiA+VGhlIGlv
dG9vbHMgcGFja2FnZSBwcm92aWRlcyBhIHNldCBvZiBzaW1wbGUgY29tbWFuZCBsaW5lIHRvb2xz
IHdoaWNoCj4gPmFsbG93IGFjY2VzcyB0byBoYXJkd2FyZSBkZXZpY2UgcmVnaXN0ZXJzLiBTdXBw
b3J0ZWQgcmVnaXN0ZXIgaW50ZXJmYWNlcwo+ID5pbmNsdWRlIFBDSSwgSU8sIG1lbW9yeSBtYXBw
ZWQgSU8sIFNNQnVzLCBDUFVJRCwgYW5kIE1TUi4gQWxzbyBpbmNsdWRlZAo+ID5hcmUgc29tZSB1
dGlsaXRpZXMgd2hpY2ggYWxsb3cgZm9yIHNpbXBsZSBhcml0aG1ldGljLCBsb2dpY2FsLCBhbmQg
b3RoZXIKPiA+b3BlcmF0aW9ucy4KPiA+Cj4gPklmIHlvdSBldmVyIGhhdmUgdG8gZGVidWcgaGFy
ZHdhcmUsIHlvdSBjb3VsZCBwcm9iYWJseSB1c2UgdGhlc2UgdG9vbHMuCgotLSAKV2l0aCBCZXN0
IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
