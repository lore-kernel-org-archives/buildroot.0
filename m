Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBA9D58E4C
	for <buildroot@archiver.kernel.org>; Mon,  2 Mar 2026 09:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EB8B813EE;
	Mon,  2 Mar 2026 09:33:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YZWtbSYt6EvG; Mon,  2 Mar 2026 09:33:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50A9D81454
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772444031;
	bh=lkyNZEVr0LG6oZH4B2mZWsmalxnee6jQkpdKUL6s2h0=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cm5f6OyTxfZ/BL8A+1cX3HFOQeV6IH7FaERnsCyl0dk14XyFFsAFjlSYCK0LFM8ep
	 A15Nz+2VOvZuyUbhL3owuB+iO4kePUrjcmfD78N8lwT2uUHLj7UsUfQL7ROmrb7EBz
	 3Dl7uWkWtTq8QCnsBzD632tLOhIrWC19PpmYhDMz0BPZ3BFKnB4qGDTdquX9O0znRh
	 iJ/9SOEdJdr4MsctMYJgTmpr8sh7uTOeylm3QwLvl+B3r1NtAsVZ2F+CpFfTEOmCGE
	 lRLXM7nReURrXyw/PaHJbaxMNASOe0JFnMdhiCS3Jdtdc3WgJFX81MaP3ZBiHrB1rd
	 yEQz6saA92LPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50A9D81454;
	Mon,  2 Mar 2026 09:33:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 64CBD231
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 09:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AB83813EE
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 09:33:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L_-2sXA5WMAE for <buildroot@buildroot.org>;
 Mon,  2 Mar 2026 09:33:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0320981454
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0320981454
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0320981454
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 09:33:47 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 78313432;
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Mar 2026 09:33:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vwzeq-0000000DVtf-2rtz;
 Mon, 02 Mar 2026 10:33:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Alexis =?utf-8?Q?Lothor=C3=A9?= via buildroot <buildroot@buildroot.org>
Cc: Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260216-openscap_cpp-v2-1-a61c7bb50837@bootlin.com> ("Alexis
 =?utf-8?Q?Lothor=C3=A9?= via buildroot"'s message of "Mon, 16 Feb 2026
 17:13:05 +0100")
References: <20260216-openscap_cpp-v2-1-a61c7bb50837@bootlin.com>
Date: Mon, 02 Mar 2026 10:33:44 +0100
Message-ID: <877brumv7r.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=LSdo5cY2Gb9TcBCBgKYMG01ukCFJIbraZNU27gOFUfnML/LPjffXQXs+hz2wz9V158pO/nYduOMzJAtQjj/Ws8erumfmzb5OW4DHzNdn5pNkquQiXwTDTGz5r3i8zu5HSyYzHeZGDFRNJ1w2RSQfRITqO391uhXQhpHoKEBscH8f9xjIFJ9wjC2yxebVYCfSBZqifP9gUcntkFPqej2DyDHHN3rg2SMqpYx2KKB+pNmBw/lEESMQC8EQYyiinoSa8mBc+f6TcIcIoy3ysy6EKvqNkXR5TjPOzXyEpUzPZD7lYts6NaB5vBtm5d19wuupYNr91gQ4Et0X9uEO9kjP8w==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=7o3Jaw/mmvbKf+6I4EbEN8phZLxkZbA165JAbgbbEuI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=LSdo5cY2
Subject: Re: [Buildroot] [PATCH v2] package/openscap: add patch to enforce
 project as C project
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

Pj4+Pj4gIkFsZXhpcyIgPT0gQWxleGlzIExvdGhvcsOpIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnPiB3cml0ZXM6CgogPiBXaGVuIHRoZSB0b29sY2hhaW4gaW52b2x2ZWQg
aW4gb3BlbnNjYXAgYnVpbGQgZG9lcyBub3Qgc3VwcG9ydCBDKyssIHRoZQogPiBjb25maWd1cmUg
c3RlcCBmYWlscyB3aXRoIHRoZSBmb2xsb3dpbmcgZXJyb3I6CgogPiAgIC0tIERldGVjdGluZyBD
WFggY29tcGlsZXIgQUJJIGluZm8KID4gICAtLSBEZXRlY3RpbmcgQ1hYIGNvbXBpbGVyIEFCSSBp
bmZvIC0gZmFpbGVkCiA+ICAgLS0gQ2hlY2sgZm9yIHdvcmtpbmcgQ1hYIGNvbXBpbGVyOiAvYmlu
L2ZhbHNlCiA+ICAgLS0gQ2hlY2sgZm9yIHdvcmtpbmcgQ1hYIGNvbXBpbGVyOiAvYmluL2ZhbHNl
IC0gYnJva2VuCiA+ICAgQ01ha2UgRXJyb3IgYXQgL3Vzci9zaGFyZS9jbWFrZS9Nb2R1bGVzL0NN
YWtlVGVzdENYWENvbXBpbGVyLmNtYWtlOjczIChtZXNzYWdlKToKID4gICAgIFRoZSBDKysgY29t
cGlsZXIKCiA+ICAgICAgICIvYmluL2ZhbHNlIgoKID4gICAgIGlzIG5vdCBhYmxlIHRvIGNvbXBp
bGUgYSBzaW1wbGUgdGVzdCBwcm9ncmFtLgoKID4gICAgIEl0IGZhaWxzIHdpdGggdGhlIGZvbGxv
d2luZyBvdXRwdXQ6CgogPiAgICAgICBDaGFuZ2UgRGlyOiAnL2hvbWUvYXV0b2J1aWxkL2F1dG9i
dWlsZC9pbnN0YW5jZS02L291dHB1dC0xL2J1aWxkL29wZW5zY2FwLTEuMy4xMi9idWlsZHJvb3Qt
YnVpbGQvQ01ha2VGaWxlcy9DTWFrZVNjcmF0Y2gvVHJ5Q29tcGlsZS10VXlkcUknCgogPiAgICAg
ICBSdW4gQnVpbGQgQ29tbWFuZChzKTogL3Vzci9iaW4vY21ha2UgLUUgZW52IFZFUkJPU0U9MSAv
dXNyL2Jpbi9tYWtlIC1mIE1ha2VmaWxlIGNtVENfMTgzNGIvZmFzdAogPiAgICAgICBtYWtlWzFd
OiBFbnRlcmluZyBkaXJlY3RvcnkgJy9ob21lL2F1dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2Ut
Ni9vdXRwdXQtMS9idWlsZC9vcGVuc2NhcC0xLjMuMTIvYnVpbGRyb290LWJ1aWxkL0NNYWtlRmls
ZXMvQ01ha2VTY3JhdGNoL1RyeUNvbXBpbGUtdFV5ZHFJJwogPiAgICAgICAvdXNyL2Jpbi9tYWtl
ICAtZiBDTWFrZUZpbGVzL2NtVENfMTgzNGIuZGlyL2J1aWxkLm1ha2UgQ01ha2VGaWxlcy9jbVRD
XzE4MzRiLmRpci9idWlsZAogPiAgICAgICBtYWtlWzJdOiBFbnRlcmluZyBkaXJlY3RvcnkgJy9o
b21lL2F1dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2UtNi9vdXRwdXQtMS9idWlsZC9vcGVuc2Nh
cC0xLjMuMTIvYnVpbGRyb290LWJ1aWxkL0NNYWtlRmlsZXMvQ01ha2VTY3JhdGNoL1RyeUNvbXBp
bGUtdFV5ZHFJJwogPiAgICAgICBCdWlsZGluZyBDWFggb2JqZWN0IENNYWtlRmlsZXMvY21UQ18x
ODM0Yi5kaXIvdGVzdENYWENvbXBpbGVyLmN4eC5vIC9iaW4vZmFsc2UgICAgLW8gQ01ha2VGaWxl
cy9jbVRDXzE4MzRiLmRpci90ZXN0Q1hYQ29tcGlsZXIuY3h4Lm8gLWMgL2hvbWUvYXV0b2J1aWxk
L2F1dG9idWlsZC9pbnN0YW5jZS02L291dHB1dC0xL2J1aWxkL29wZW5zY2FwLTEuMy4xMi9idWls
ZHJvb3QtYnVpbGQvQ01ha2VGaWxlcy9DTWFrZVNjcmF0Y2gvVHJ5Q29tcGlsZS10VXlkcUkvdGVz
dENYWENvbXBpbGVyLmN4eAogPiAgICAgICBtYWtlWzJdOiAqKiogW0NNYWtlRmlsZXMvY21UQ18x
ODM0Yi5kaXIvYnVpbGQubWFrZTo4MTogQ01ha2VGaWxlcy9jbVRDXzE4MzRiLmRpci90ZXN0Q1hY
Q29tcGlsZXIuY3h4Lm9dIEVycm9yIDEKID4gICAgICAgbWFrZVsyXTogTGVhdmluZyBkaXJlY3Rv
cnkgJy9ob21lL2F1dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2UtNi9vdXRwdXQtMS9idWlsZC9v
cGVuc2NhcC0xLjMuMTIvYnVpbGRyb290LWJ1aWxkL0NNYWtlRmlsZXMvQ01ha2VTY3JhdGNoL1Ry
eUNvbXBpbGUtdFV5ZHFJJwogPiAgICAgICBtYWtlWzFdOiAqKiogW01ha2VmaWxlOjEzNDogY21U
Q18xODM0Yi9mYXN0XSBFcnJvciAyCiA+ICAgICAgIG1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5
ICcvaG9tZS9hdXRvYnVpbGQvYXV0b2J1aWxkL2luc3RhbmNlLTYvb3V0cHV0LTEvYnVpbGQvb3Bl
bnNjYXAtMS4zLjEyL2J1aWxkcm9vdC1idWlsZC9DTWFrZUZpbGVzL0NNYWtlU2NyYXRjaC9UcnlD
b21waWxlLXRVeWRxSScKCiA+ICAgICBDTWFrZSB3aWxsIG5vdCBiZSBhYmxlIHRvIGNvcnJlY3Rs
eSBnZW5lcmF0ZSB0aGlzIHByb2plY3QuCiA+ICAgQ2FsbCBTdGFjayAobW9zdCByZWNlbnQgY2Fs
bCBmaXJzdCk6CiA+ICAgICBDTWFrZUxpc3RzLnR4dDoxMSAocHJvamVjdCkKCiA+ICAgLS0gQ29u
ZmlndXJpbmcgaW5jb21wbGV0ZSwgZXJyb3JzIG9jY3VycmVkIQogPiAgIG1ha2U6ICoqKiBbcGFj
a2FnZS9wa2ctZ2VuZXJpYy5tazoyNjM6IC9ob21lL2F1dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFu
Y2UtNi9vdXRwdXQtMS9idWlsZC9vcGVuc2NhcC0xLjMuMTIvLnN0YW1wX2NvbmZpZ3VyZWRdIEVy
cm9yIDEKID4gICBtYWtlOiBMZWF2aW5nIGRpcmVjdG9yeSAnL2hvbWUvYXV0b2J1aWxkL2F1dG9i
dWlsZC9pbnN0YW5jZS02L2J1aWxkcm9vdCcKCiA+IFRoZSBvcGVuc2NhcCBwcm9qZWN0IGRvZXMg
bm90IGNvbnRhaW4gYW55IEMrKyBmaWxlLCBhbmQgc28gZG9lcyBub3QgbmVlZAogPiBhIEMrKyBj
YXBhYmxlIGNvbXBpbGVyLiBCcmluZyB0aGUgdG8tYmUtaW50ZWdyYXRlZC11cHN0cmVhbSBwYXRj
aAogPiBlbmZvcmNpbmcgQyBsYW5ndWFnZSBpbiBDTWFrZUxpc3RzLnR4dCB0byBwcmV2ZW50IHRo
aXMgYnVpbGQgZmFpbHVyZS4KCiA+IEZpeGVzOiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qu
b3JnL3Jlc3VsdHMvMWZlNTUwZmZhNzlmMGEwODNhNDUwYWUwM2ZlMDY3YThhYjczMzZiZQogPiBG
aXhlczogaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzL2U5ZDUyYjUyNjU4
NTQ0OTE2MDIyMDUwYzc4ZGNiMTM3Y2E2Yzk3ZTAKID4gRml4ZXM6IGh0dHBzOi8vYXV0b2J1aWxk
LmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy80YTljMjE3NjNhYWRkYjIxN2VlNWY4YmI4OTQ3ZmFhZDk3
NjdiYWEzCiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVA
Ym9vdGxpbi5jb20+CiA+IC0tLQogPiBDaGFuZ2VzIGluIHYyOgogPiAtIGZpeCB1cHN0cmVhbSBD
TWFrZUxpc3RzLnR4dCByYXRoZXIgdGhhbiBlbmFibGluZyBDKysgc3VwcG9ydCBpbiB0b29sY2hh
aW4KID4gLSBicmluZyBpbiB0aGUgdG8tYmUtaW50ZWdyYXRlZC11cHN0cmVhbSBjb3JyZXNwb25k
aW5nIHBhdGNoCiA+IC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI2
MDIxNi1vcGVuc2NhcF9jcHAtdjEtMS0zMzcyMTQ5ZGE1YjBAYm9vdGxpbi5jb20KCkNvbW1pdHRl
ZCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
