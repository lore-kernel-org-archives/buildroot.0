Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB4CC432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 12:46:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 243A560E97
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 12:46:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 243A560E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5BC460653;
	Sat, 28 Aug 2021 12:46:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BV26lqZTMnon; Sat, 28 Aug 2021 12:46:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 987E860657;
	Sat, 28 Aug 2021 12:46:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 49F691BF319
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 12:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 381BB42838
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 12:46:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iuQBnr0wI_20 for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 12:46:16 +0000 (UTC)
X-Greylist: delayed 00:07:02 by SQLgrey-1.8.0
Received: from smtpcmd0881.aruba.it (smtpcmd0881.aruba.it [62.149.156.81])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2AAF42843
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 12:46:15 +0000 (UTC)
Received: from smtpclient.apple ([141.136.145.219])
 by Aruba Outgoing Smtp  with ESMTPA
 id Jxc5mgl2JiG5UJxc5mxfqg; Sat, 28 Aug 2021 14:39:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1630154351; bh=W7oT8tuZfatRnT3c+l3MmeweiVGmqXMsGDROeUAxXjg=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=KsjfP86Zw++rL45eIq9Y+F+hi3GxuNvPJ49l1d5g4cYcVBtkX+LfykgRMw0xBtY5k
 oy01V+o0sHMlmrxx6HnbTj6aODTNMUIhHabJ8KwiTZaj1J99VdhbcWMMU1qVNbRzs0
 LRntHo4w2S7xLTQy6uibbve0a2liakq5VzwSQ77HCjunHAEcbgJkkHpLvHb8C+LS69
 JotOHNdnTmsK06/WKblrp28rR6phq3XkyfLXqZFwDCOweSV2E9Yi/ZmqqVAlDtCtdX
 T2noYuWS5Yyv/YulmC4iVtkshcrUxOzwAn/zb1dcItcrvfnn72bm4kvHFdFIDfozUA
 rvh8dbIUNE9BQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sat, 28 Aug 2021 14:39:09 +0200
Message-Id: <7FE9A46C-9CD8-4143-99DE-CE8D786A459C@benettiengineering.com>
References: <86602fc9-9d62-0b7b-4ce3-25bf3de27254@mind.be>
In-Reply-To: <86602fc9-9d62-0b7b-4ce3-25bf3de27254@mind.be>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailer: iPhone Mail (18G82)
X-CMAE-Envelope: MS4wfDXwW2BeWCSJnMGMnlxR+4Y0HoLazXWuqIo/LDARlpEVC5BcHpaLGVHG3ZRMdF057xPYPzL+c9L4Cz2O6rW4Mxco7B8Xi30Yr8qDZADG+awNQdSV1AyL
 mM4cO5duripHDy/NKMZ30UnA7A5iJRCIxhg73qBgP7v+Gb+wnboCBLcEUXilZU8eWA2rkCXlViX9+SdJtRko1chY7rbx+kCnC6BC3Xn16Sa4T6KM6bvOBJ9u
 U6NIYa8LewBuIYyatGl5v63rQ6s1ofgmA8Uv/U4SVqstle08sfkP/ZWk2CRV/7huyyIyOQjllNue25wKlKF7PDUxt2nWKiW8qZMXJuO/2u64XS2xG/ovBZVx
 pYkJQG9J
Subject: Re: [Buildroot] [PATCH 1/2] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_83143
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
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGkgQXJub3V0LAoKPiBJbCBnaW9ybm8gMjggYWdvIDIwMjEsIGFsbGUgb3JlIDE0OjA2LCBBcm5v
dXQgVmFuZGVjYXBwZWxsZSA8YXJub3V0QG1pbmQuYmU+IGhhIHNjcml0dG86Cj4gCj4g77u/Cj4g
Cj4+IE9uIDI4LzA4LzIwMjEgMDA6MzQsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+PiBydWJ5IHBh
Y2thZ2UgZmFpbHMgdG8gYnVpbGQgZm9yIHRoZSBTSDQgYXJjaGl0ZWN0dXJlIHdpdGggb3B0aW1p
emF0aW9uCj4+IGVuYWJsZWQgd2l0aCBnY2MgPSA5LjMuMDoKPj4gaHR0cDovL2F1dG9idWlsZC5i
dWlsZHJvb3QubmV0L3Jlc3VsdHMvZjU3L2Y1NzQyZTdmYjZlODE0MmJjZGI1M2I3ZjRmNWU5YzFi
ZWEzNTU4Y2QvCj4+IAo+PiBJdCdzIGFscmVhZHkgYmVlbiByZXBvcnRlZCB1cHN0cmVhbToKPj4g
aHR0cHM6Ly9nY2MuZ251Lm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9ODMxNDMKPj4gCj4+
IFNpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5n
aW5lZXJpbmcuY29tPgo+PiAtLS0KPj4gdG9vbGNoYWluL0NvbmZpZy5pbiB8IDkgKysrKysrKysr
Cj4+IDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPj4gCj4+IGRpZmYgLS1naXQgYS90
b29sY2hhaW4vQ29uZmlnLmluIGIvdG9vbGNoYWluL0NvbmZpZy5pbgo+PiBpbmRleCBiZjJiYjNl
ZmU0Li40NDE5NDQzOTMwIDEwMDY0NAo+PiAtLS0gYS90b29sY2hhaW4vQ29uZmlnLmluCj4+ICsr
KyBiL3Rvb2xjaGFpbi9Db25maWcuaW4KPj4gQEAgLTEzMyw2ICsxMzMsMTUgQEAgY29uZmlnIEJS
Ml9UT09MQ0hBSU5fSEFTX0dDQ19CVUdfNjg0ODUKPj4gICAgYm9vbAo+PiAgICBkZWZhdWx0IHkg
aWYgQlIyX21pY3JvYmxhemUKPj4gCj4+ICsjIGh0dHBzOi8vZ2NjLmdudS5vcmcvYnVnemlsbGEv
c2hvd19idWcuY2dpP2lkPTgzMTQzCj4+ICsjIEVycm9yOiBpbnZhbGlkIG9wZXJhbmRzICgqVU5E
KiBhbmQgLnRleHQgc2VjdGlvbnMpIGZvciBgLScgb24gc2g0Lgo+PiArIyBUaGlzIGJ1ZyBubyBs
b25nZXIgZXhpc3RzIGluIGdjYyAxMC54IGJ1dCByZWFwcGVhcmVkIG9uIGdjYyAxMS54IGFuZAo+
PiArIyBpdCBzdGlsbCBub3QgYmVlbiBmaXhlZCB5ZXQuCj4+ICtjb25maWcgQlIyX1RPT0xDSEFJ
Tl9IQVNfR0NDX0JVR184MzE0Mwo+PiArICAgIGJvb2wKPj4gKyAgICBkZWZhdWx0IHkgaWYgIUJS
Ml9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzEwCj4gCj4gVGhlIGNvbmRpdGlvbiBkb2Vzbid0IGNv
cnJlc3BvbmQgdG8gdGhlIGNvbW1lbnQgYWJvdmUuLi4KCknigJl2ZSB0cmllZCBpdCBhbmQgY2hl
Y2tlZCAuY29uZmlnCkkgZmluZCBpdCBlbWl0dGVkIG9uIGdjYyA5IGFuZCAxMSB3aGlsZSBvbiBn
Y2MgMTAgbm90IGFzIGRlc2NyaWJlZC4KSXTigJlzIGFsd2F5cyBkaWZmaWN1bHQgdG8gbWUgdG8g
dW5kZXJzdGFuZCBob3cgdGhhdCB2YXJpYWJsZSB3b3Jrcy4KCkdpdWxpbwoKPiAKPiAKPiBSZWdh
cmRzLAo+IEFybm91dAo+IAo+PiArICAgIGRlcGVuZHMgb24gQlIyX3NoNAo+PiArCj4+ICMgaHR0
cHM6Ly9nY2MuZ251Lm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9ODUxODAuIFRoaXMgYnVn
IG5vCj4+ICMgbG9uZ2VyIGV4aXN0cyBpbiBnY2MgOC54Lgo+PiBjb25maWcgQlIyX1RPT0xDSEFJ
Tl9IQVNfR0NDX0JVR184NTE4MAo+PiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVz
eWJveC5uZXQKPiBodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5i
dXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
