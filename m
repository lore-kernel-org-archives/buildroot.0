Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EF7C433EF
	for <buildroot@archiver.kernel.org>; Tue, 23 Nov 2021 10:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E86D740019;
	Tue, 23 Nov 2021 10:22:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sj_uoWLHkw0l; Tue, 23 Nov 2021 10:22:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8B73401E2;
	Tue, 23 Nov 2021 10:22:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E51611BF873
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 10:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3B2B402DF
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 10:22:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=datacom.com.br
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jo_nUQ3iGi5i for <buildroot@lists.busybox.net>;
 Tue, 23 Nov 2021 10:22:40 +0000 (UTC)
X-Greylist: delayed 00:09:44 by SQLgrey-1.8.0
Received: from mail.datacom.com.br (mx.datacom.com.br [177.66.5.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3DF0640220
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 10:22:40 +0000 (UTC)
Received: from mail.datacom.com.br (localhost [127.0.0.1])
 by mail.datacom.com.br (Postfix) with ESMTPS id 85A571BA05A9;
 Tue, 23 Nov 2021 07:12:50 -0300 (-03)
Received: from localhost (localhost [127.0.0.1])
 by mail.datacom.com.br (Postfix) with ESMTP id 6E68E1BA092C;
 Tue, 23 Nov 2021 07:12:50 -0300 (-03)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.datacom.com.br 6E68E1BA092C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=datacom.com.br;
 s=03E3926C-C9C4-11E9-9D53-F9759CB406EE; t=1637662370;
 bh=iera75cbBWzavQKD2CqxMhhHrPAnpIAe8S1ZLfwy7D4=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=AOcZ/kCTKMhLDh+5/YEDkM+CAjqZGLlQUiVx6rK7ykw6AVdHgo4fKdzqhONcR/Syw
 c8B2ODZIZPZh8bS3/McNt0MgXTHeX9EnZW0YlnDa85uulPN0VE7h3Imw8atYiPHP0Q
 wqb/6D8ngWa18/QarL9pwZGeQLwFKlTiKDc3LslODigcmwrTRd+F9xOWBKzUXo2/9H
 GzArUtxouCD9rYlxKq41ovKl7jTUkOMUkKSFF+zEbAnw8p6X3F8E3mty7TWdhC7OYh
 ++BLs6lgO1rrRYpFDjwGWbBri3zSenAvFREFonbZByz+nHfnEm9O0sqaqvjn9/H4mO
 Uz7NJUbSQFfhA==
Received: from mail.datacom.com.br ([127.0.0.1])
 by localhost (mail.datacom.com.br [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id R8uatEhsx0aN; Tue, 23 Nov 2021 07:12:50 -0300 (-03)
Received: from mail.datacom.com.br (mail.datacom.com.br [172.25.4.13])
 by mail.datacom.com.br (Postfix) with ESMTP id 57F2C1BA05A9;
 Tue, 23 Nov 2021 07:12:50 -0300 (-03)
Date: Tue, 23 Nov 2021 07:12:50 -0300 (BRT)
From: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <1071920240.16696563.1637662370181.JavaMail.zimbra@datacom.com.br>
In-Reply-To: <87lf1fooz3.fsf@dell.be.48ers.dk>
References: <20211121170534.3807972-1-ricardo.martincoski@gmail.com>
 <87lf1fooz3.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
X-Originating-IP: [172.31.210.185]
X-Mailer: Zimbra 9.0.0_GA_3956 (ZimbraWebClient - FF94 (Linux)/9.0.0_GA_3954)
X-Authenticated-User: ricardo.martincoski@datacom.com.br
Thread-Topic: package/stress-ng: fix broken URL
Thread-Index: TskDRj1ECWyZWi8F2NtXUMUbhPFFmg==
Subject: Re: [Buildroot] [PATCH-2021.08.x] package/stress-ng: fix broken URL
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
Cc: Romain Naour <romain.naour@gmail.com>,
 ricardo martincoski <ricardo.martincoski@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gRnJvbTogIlBldGVyIEtvcnNnYWFyZCIg
PHBldGVyQGtvcnNnYWFyZC5jb20+Cj4gVG86ICJyaWNhcmRvIG1hcnRpbmNvc2tpIiA8cmljYXJk
by5tYXJ0aW5jb3NraUBnbWFpbC5jb20+Cj4gQ2M6ICJidWlsZHJvb3QiIDxidWlsZHJvb3RAYnVp
bGRyb290Lm9yZz4sICJSb21haW4gTmFvdXIiIDxyb21haW4ubmFvdXJAZ21haWwuY29tPiwgInJp
Y2FyZG8ubWFydGluY29za2kiCj4gPHJpY2FyZG8ubWFydGluY29za2lAZGF0YWNvbS5jb20uYnI+
Cj4gU2VudDogTW9uZGF5LCBOb3ZlbWJlciAyMiwgMjAyMSA2OjMzOjA0IFBNCj4gU3ViamVjdDog
UmU6IFtQQVRDSC0yMDIxLjA4LnhdIHBhY2thZ2Uvc3RyZXNzLW5nOiBmaXggYnJva2VuIFVSTAoK
Pj4+Pj4+ICJSaWNhcmRvIiA9PSBSaWNhcmRvIE1hcnRpbmNvc2tpIDxyaWNhcmRvLm1hcnRpbmNv
c2tpQGdtYWlsLmNvbT4gd3JpdGVzOgo+IAo+ID4gRnJvbTogU8OpYmFzdGllbiBTenltYW5za2kg
PHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgo+ID4gRG8gdGhlIHNhbWUgYXMgY29t
bWl0ICIxMmMwMTA3OWJkIHBhY2thZ2Uvc3RyZXNzLW5nOiBidW1wIHRvIHZlcnNpb24KPiA+IDAu
MTMuMDUiIGRpZCBmb3IgMjAyMi4wMiBidXQgd2l0aG91dCB0aGUgdmVyc2lvbiBidW1wLgo+IAo+
ID4gVGhlIHByb2plY3QgVVJMIHJldHVybnMgNDA0IGVycm9yIGJlY2F1c2U6Cj4gCj4gPiBRdW90
aW5nIENvbGluZyBLaW5nOgo+ID4gIlVuZm9ydHVuYXRlbHkgd2hlbiBJIGxlZnQgQ2Fub25pY2Fs
IGxhc3Qgd2VlayB0aGV5IHJlbW92ZWQgbXkgdGFyYmFsbHMiCj4gCj4gPiBTbyB1c2UgZ2l0aHVi
IGFuZCB1cGRhdGUgaGFzaC4KPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFu
c2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KPiA+IENjOiBBcm5vdXQgVmFu
ZGVjYXBwZWxsZSAoRXNzZW5zaXVtL01pbmQpIDxhcm5vdXRAbWluZC5iZT4KPiA+IFtSaWNhcmRv
OiBkbyBub3QgYnVtcCB0aGUgdmVyc2lvbi4KPiA+ICBUaGVyZSB3aWxsIGJlIG5vIHZlcnNpb24g
Y2xhc2ggYXQgc291cmNlcy5idWlsZHJvb3QubmV0IHNpbmNlIHRoZSBmaWxlCj4gPiAgZm9ybWF0
IGNoYW5nZWRdCj4gPiBTaWduZWQtb2ZmLWJ5OiBSaWNhcmRvIE1hcnRpbmNvc2tpIDxyaWNhcmRv
Lm1hcnRpbmNvc2tpQGRhdGFjb20uY29tLmJyPgo+ID4gQ2M6IFJvbWFpbiBOYW91ciA8cm9tYWlu
Lm5hb3VyQGdtYWlsLmNvbT4KPiAKPiBDb21taXR0ZWQgdG8gMjAyMS4wMi54IGFuZCAyMDIxLjA4
LngsIHRoYW5rcy4KPiAKPiBXaGF0IGFib3V0IGEgcGF0Y2ggZm9yIG1hc3Rlcj8KCldpbGwgZG8u
CgpSZWdhcmRzLApSaWNhcmRvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
