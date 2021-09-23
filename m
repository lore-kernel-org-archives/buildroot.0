Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C402C433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 07:59:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF10061215
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 07:59:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF10061215
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6168F403B0;
	Thu, 23 Sep 2021 07:59:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aPjx4xDc_QST; Thu, 23 Sep 2021 07:59:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4836404ED;
	Thu, 23 Sep 2021 07:59:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 78DF81BF2F7
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 07:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75EB6608A2
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 07:59:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p4Ou1I8J8HRL for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 07:59:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CBA1A607AC
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 07:59:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A5FB56109E;
 Thu, 23 Sep 2021 07:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632383989;
 bh=hv0vpVWZMVXN43YrB2lrNThF8AasUDESTbNunzdU/i4=;
 h=In-Reply-To:References:From:To:Subject:Cc:Date:From;
 b=A04KJ44+vOe+7biA0g7UFtv+1CY4mVQRgTKRto90vIRlmj9D61kGqKNe4G1r+j0YO
 rZe4bFLNbbD/KFifvIN+4Bweel0+vyOCcBE8dcYi/eoN2F6FQFi5cMBV3lXfEKvYD/
 pgR0B2knZMi7phqyjQb0XejgaqvvJZ3hGuo4bQuThw83Eb5s3gEDl2Xv93zuoFkE3X
 Fw7Z80OGTnBybnkSMEY1gMjbPr5feoKaU8hLt3TWKhcTpCoWU2XZu2T3MU+xTBH6S+
 1BjAtri4iRd67InuyjRziHrFoXLCC1MLN0o1X9Zty7dijQFV9m/VPLUacT1aSuvOqX
 9IJnCOyrX/Evg==
MIME-Version: 1.0
In-Reply-To: <CAJPV9MpWep997PN1v+R0E6RKhe4EOwY=ogFECnyfG0ppz2ekww@mail.gmail.com>
References: <20210830114531.2285178-1-jose.pekkarinen@unikie.com>
 <CAJPV9MrgZcVw3cmO1+w_zn6M2yub+nCZ73H_YJ0g=OTpuu1MeA@mail.gmail.com>
 <163214596519.4283.5229631383777844599@kwain>
 <CAJPV9MqsdZa5oCYSE-+ZsNi4w1w8CWVeUPd4CohXddt5pcr7zQ@mail.gmail.com>
 <163220836697.4283.6363157164675068449@kwain>
 <CAJPV9MpNh0rXA6ZTJJyj5A58goFtt7GnPNimddk94eZw8S2bdQ@mail.gmail.com>
 <163223176981.4283.2007173106051805069@kwain>
 <CAJPV9Mp-6PBtw5G2YDORJ_5cqypjtrc2CR3cMrzfe36RpUW2oQ@mail.gmail.com>
 <163232062091.4283.13096713479109144471@kwain>
 <CAJPV9MpWep997PN1v+R0E6RKhe4EOwY=ogFECnyfG0ppz2ekww@mail.gmail.com>
From: Antoine Tenart <atenart@kernel.org>
To: José Pekkarinen <jose.pekkarinen@unikie.com>
Message-ID: <163238398624.3979.10768324598204859494@kwain>
Date: Thu, 23 Sep 2021 09:59:46 +0200
Subject: Re: [Buildroot] [PATCH] package/refpolicy: Treat all modules as
 custom
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

UXVvdGluZyBKb3PDqSBQZWtrYXJpbmVuICgyMDIxLTA5LTIzIDA4OjI2OjAyKQo+ICBPbiBXZWQs
IFNlcCAyMiwgMjAyMSBhdCA1OjIzIFBNIEFudG9pbmUgVGVuYXJ0IDxbMV1hdGVuYXJ0QGtlcm5l
bC5vcmc+Cj4gIHdyb3RlOgo+Cj4gICAgSG93ZXZlciBJJ20gc3VycHJpc2VkIGFzIG15IHVuZGVy
c3RhbmRpbmcgd2FzIHRoZSBzdW1tYXJ5IHdhcyByZXF1aXJlZAo+ICAgIGZvciB0aGUgcmVmcG9s
aWN5IGNvbmZpZ3VyYXRpb24gc3RlcCB0byBzdWNjZWVkIChJIGRpZCB1c2UgYSBzdW1tYXJ5Cj4g
ICAgZm9yIGFsbCBteSB0ZXN0cyBiZWNhdXNlIG9mIHRoaXMpLiBXaGVuIHJlbW92aW5nIGEgc3Vt
bWFyeSBmcm9tIGEgbW9kdWxlCj4gICAgSSBhbHdheXMgZ2V0IHRoZSBmb2xsb3dpbmcgZXJyb3Is
IGFuZCB0aGUgQnVpbGRyb290IGJ1aWxkIHN0b3BzLgo+Cj4gICAgwqAgZG9jL3BvbGljeS54bWw6
ODM3NjogZWxlbWVudCBtb2R1bGU6IHZhbGlkaXR5IGVycm9yIDogRWxlbWVudCBtb2R1bGUKPiAg
ICBjb250ZW50IGRvZXMgbm90IGZvbGxvdyB0aGUgRFRELCBleHBlY3RpbmcgKHN1bW1hcnkgLCBk
ZXNjPyAsIHJlcXVpcmVkPwo+ICAgICwgKGludGVyZmFjZSB8IHRlbXBsYXRlKSogLCAoYm9vbCB8
IHR1bmFibGUpKiksIGdvdCAoKQo+ICAgIMKgIERvY3VtZW50IGRvYy9wb2xpY3kueG1sIGRvZXMg
bm90IHZhbGlkYXRlIGFnYWluc3QgZG9jL3BvbGljeS5kdGQKPgo+ICAgIERvIHlvdSBoYXZlIGFu
IGlkZWEgd2hhdCBtYWRlIHlvdXIgYnVpbGQgdG8gc3VjY2VlZCBldmVuIHRob3VnaCB5b3UgZGlk
Cj4gICAgbm90IGhhdmUgYSBzdW1tYXJ5IGluIHlvdXIgbW9kdWxlPwo+Cj4gIEkgYmVsaWV2ZSBp
dCBpcyB2YWxpZGF0aW5nIHRvIHRoZSBzdW1tYXJ5IHByaW9yIHRvIHRoZSBtb2R1bGUsCj4gIHRo
ZSBvbmUgeW91IHB1dCBpbiBtZXRhZGF0YS54bWwsIGJ1dCBub3QgYW55IGludGVybmFsIHN1bW1h
cnkgZm9yCj4gIHRoZSBpbnRlcmZhY2UuIFRoaXMgaXMgaG93IHBvbGljeS54bWwgbG9va3MgbGlr
ZSBpbiBhIGNhc2Ugd2hlcmUgSSBkaWRuJ3QKPiAgYXBwbHkgdGhlIG1pdGlnYXRpb246Cj4gIDxs
YXllciBuYW1lPSJidWlsZHJvb3QiPgo+ICA8c3VtbWFyeT5CdWlsZHJvb3QgZXh0cmEgbW9kdWxl
czwvc3VtbWFyeT4KPiAgPG1vZHVsZSBuYW1lPSJiYXNlIiBmaWxlbmFtZT0icG9saWN5L21vZHVs
ZXMvYnVpbGRyb290L2Jhc2UuaWYiPgo+ICA8L21vZHVsZT4KPiAgPG1vZHVsZSBuYW1lPSJzZWN1
cmUiIGZpbGVuYW1lPSJwb2xpY3kvbW9kdWxlcy9idWlsZHJvb3Qvc2VjdXJlLmlmIj4KPiAgPC9t
b2R1bGU+Cj4gIDwvbGF5ZXI+Cj4KPiAgV2l0aCB0aGlzIHRoZSBtb2R1bGVzLmNvbmYgY29tZXMg
YXM6Cj4KPiAgIyBMYXllcjogYnVpbGRyb290Cj4gICMgTW9kdWxlOiBiYXNlCj4gICMKPiAgIyBM
YXllcjogYnVpbGRyb290Cj4gICMgTW9kdWxlOiBzZWN1cmUKPiAgIwo+Cj4gIFRoZXJlIGlzIGEg
c3VtbWFyeSBmb2xsb3dlZCBieSBhIG1vZHVsZSwgdmFsaWRhdGlvbiBwYXNzLCBidXQKPgo+ICB0
aGUgbW9kdWxlIGlzIG5vdCBidWlsdC4gSWYgSSBhZGQgdGhlIGZvbGxvd2luZyBsaW5lcyBpbiB0
aGUgYnVpbGQgZm9sZGVyCj4gIG1vZHVsZXNbMV0KPiAgYW5kIHJ1biBtYWtlLmNvbmY6Cj4gIFsx
XcKgcmVmcG9saWN5LTIuMjAyMDA4MTgvcG9saWN5L21vZHVsZXMvYnVpbGRyb290L3NlY3VyZS5p
ZjogIyMKPiAgPHN1bW1hcnk+RXh0ZXJuYWwgc2VjdXJlIG1vZHVsZS48L3N1bW1hcnk+Cj4gIHJl
ZnBvbGljeS0yLjIwMjAwODE4L3BvbGljeS9tb2R1bGVzL2J1aWxkcm9vdC9iYXNlLmlmOiAjIwo+
ICA8c3VtbWFyeT5FeHRlcm5hbCBiYXNlIG1vZHVsZS48L3N1bW1hcnk+Cj4KPiAgVGhlIHBvbGlj
eS54bWwgbG9va3MgbGlrZToKPgo+ICA8bGF5ZXIgbmFtZT0iYnVpbGRyb290Ij4KPiAgPHN1bW1h
cnk+QnVpbGRyb290IGV4dHJhIG1vZHVsZXM8L3N1bW1hcnk+Cj4gIDxtb2R1bGUgbmFtZT0iYmFz
ZSIgZmlsZW5hbWU9InBvbGljeS9tb2R1bGVzL2J1aWxkcm9vdC9iYXNlLmlmIj4KPiAgPHN1bW1h
cnk+RXh0ZXJuYWwgYmFzZSBtb2R1bGVzLjwvc3VtbWFyeT4KPiAgPC9tb2R1bGU+Cj4gIDxtb2R1
bGUgbmFtZT0ic2VjdXJlIiBmaWxlbmFtZT0icG9saWN5L21vZHVsZXMvYnVpbGRyb290L3NlY3Vy
ZS5pZiI+Cj4gIDxzdW1tYXJ5PkV4dGVybmFsIHNlY3VyZSBvcyB2bSBtb2R1bGUuPC9zdW1tYXJ5
Pgo+ICA8L21vZHVsZT4KPiAgPC9sYXllcj4KPgo+ICBUaGVuIHBvbGljeS9tb2R1bGVzLmNvbmYg
bG9va3MgdGhpcyB3YXk6Cj4KPiAgIyBMYXllcjogYnVpbGRyb290Cj4gICMgTW9kdWxlOiBiYXNl
Cj4gICMKPiAgIyBFeHRlcm5hbCBiYXNlIG1vZHVsZXMuCj4gICMgwqAKPiAgYmFzZSA9IG1vZHVs
ZQo+Cj4gICMgTGF5ZXI6IGJ1aWxkcm9vdAo+ICAjIE1vZHVsZTogc2VjdXJlCj4gICMKPiAgIyBF
eHRlcm5hbCBzZWN1cmUgb3Mgdm0gbW9kdWxlLgo+ICAjIMKgCj4gIHNlY3VyZSA9IG1vZHVsZQo+
Cj4gIEFuZCB0aGlzIHByb2R1Y2VzIHRoZSBtb2R1bGVzIHRvIGdldCBpbnRvIHRoZSBwb2xpY3ku
MzIgZmlsZS4KPiAgRG9lcyBpdCBtYWtlcyBhbnkgc2Vuc2Ugb24geW91ciBlbmQ/CgpUaGUgYWJv
dmUgZG9lcyBub3QgcmVwcm9kdWNlIGZvciBtZS4gQnV0IEkgbWlnaHQga25vdyB3aGF0J3MgZ29p
bmcgb246CmRvIHlvdSBoYXZlIHhtbGxpbnQgaW5zdGFsbGVkIG9uIHlvdXIgbWFjaGluZT8KCklm
IG5vdCwgdGhlIHZhbGlkYXRpb24gc3RlcCBpcyBza2lwcGVkIGJ1dCB0aGUgYnVpbGQgaXMgbm90
IHN0b3BwZWQsCndoaWNoIHdvdWxkIGV4cGxhaW4gdGhlIGRpZmZlcmVuY2UgaW4gYmVoYXZpb3Vy
IHdlIGhhdmUgYmV0d2VlbiBvdXIKdGVzdHM6CgogIE1ha2VmaWxlOjQ1MzoKICAkKHZlcmJvc2Up
IGlmIHRlc3QgLXggJChYTUxMSU5UKSAmJiB0ZXN0IC1mICQoeG1sZHRkKTsgdGhlbiBcCiAgICAg
ICAgICAkKFhNTExJTlQpIC0tbm9vdXQgLS1wYXRoICQoZGlyICQoeG1sZHRkKSkgLS1kdGR2YWxp
ZCAkKHhtbGR0ZCkgJEAgO1wKICAgICAgICAgIGVsc2UgXAogICAgICAgICAgZWNobyAiJEAgWE1M
IHZhbGlkYXRpb24gbm90IHJ1bi4gUGxlYXNlIGluc3RhbGwgdGhlIHhtbGxpbnQgdG9vbC4iIDtc
CiAgZmkKCkkgYmVsaWV2ZSB3ZSBzaG91bGQgbWFrZSByZWZwb2xpY3kgZGVwZW5kIG9uIGhvc3Qt
bGlieG1sMiBhbmQgZm9yY2UgaXQKdG8gdXNlIHRoZSBCdWlsZHJvb3QgdmVyc2lvbiBvZiB4bWxs
aW50IGJ5IHNldHRpbmcgWE1MTElOVCBpbiB0aGUKY29uZmlndXJhdGlvbiBzdGVwLgoKRG8gdGhl
IGZvbGxvd2luZyBmaXhlcyB0aGUgaXNzdWVbMV0gb24geW91ciBzaWRlPwoKICBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9yZWZwb2xpY3kvcmVmcG9saWN5Lm1rIGIvcGFja2FnZS9yZWZwb2xpY3kvcmVm
cG9saWN5Lm1rCiAgaW5kZXggMTE4MGYwZDM4YmFlLi5lY2Q4Y2YyMjZiNDUgMTAwNjQ0CiAgLS0t
IGEvcGFja2FnZS9yZWZwb2xpY3kvcmVmcG9saWN5Lm1rCiAgKysrIGIvcGFja2FnZS9yZWZwb2xp
Y3kvcmVmcG9saWN5Lm1rCiAgQEAgLTE0LDcgKzE0LDggQEAgUkVGUE9MSUNZX0RFUEVOREVOQ0lF
UyA9IFwKICAgICAgICAgIGhvc3QtcG9saWN5Y29yZXV0aWxzIFwKICAgICAgICAgIGhvc3QtcHl0
aG9uMyBcCiAgICAgICAgICBob3N0LXNldG9vbHMgXAogIC0gICAgICAgaG9zdC1nYXdrCiAgKyAg
ICAgICBob3N0LWdhd2sgXAogICsgICAgICAgaG9zdC1saWJ4bWwyCgogICBpZmVxICgkKEJSMl9Q
QUNLQUdFX1JFRlBPTElDWV9DVVNUT01fR0lUKSx5KQogICBSRUZQT0xJQ1lfVkVSU0lPTiA9ICQo
Y2FsbCBxc3RyaXAsJChCUjJfUEFDS0FHRV9SRUZQT0xJQ1lfQ1VTVE9NX1JFUE9fVkVSU0lPTikp
CiAgQEAgLTMwLDYgKzMxLDcgQEAgZW5kaWYKICAgIyBDYW5ub3QgdXNlIG11bHRpcGxlIHRocmVh
ZHMgdG8gYnVpbGQgdGhlIHJlZmVyZW5jZSBwb2xpY3kKICAgUkVGUE9MSUNZX01BS0UgPSBcCiAg
ICAgICAgICBQWVRIT049JChIT1NUX0RJUikvdXNyL2Jpbi9weXRob24zIFwKICArICAgICAgIFhN
TExJTlQ9JChMSUJYTUwyX0hPU1RfQklOQVJZKSBcCiAgICAgICAgICBURVNUX1RPT0xDSEFJTj0k
KEhPU1RfRElSKSBcCiAgICAgICAgICAkKFRBUkdFVF9NQUtFX0VOVikgXAogICAgICAgICAgJChN
QUtFMSkKCihJIGFsc28gY2hlY2tlZCBmb3Igb3RoZXIgYHRlc3QgLXhgIGNvbmRpdGlvbnMgaW4g
dGhlIHJlZnBvbGljeQpNYWtlZmlsZTsgeG1sbGludCBzZWVtcyB0byBiZSB0aGUgb25seSBvbmUp
LgoKWzFdICJmaXggdGhlIGlzc3VlIiBha2EgdGhyb3cgYW4gZXJyb3Igd2hpbGUgYWRkaW5nIG1v
ZHVsZXMgd2l0aG91dCBhCiAgICBzdW1tYXJ5LgoKVGhhbmtzLApBbnRvaW5lCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGxpc3RzLmJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
