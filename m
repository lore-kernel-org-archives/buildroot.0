Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA45CCF9E3
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 19:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 891E885151;
	Sun,  2 Nov 2025 19:43:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p0Ft6Lly09ko; Sun,  2 Nov 2025 19:43:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F58B8514A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F58B8514A;
	Sun,  2 Nov 2025 19:43:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17C52436
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 19:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 147EF4184B
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 19:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NoUSIvnSCJRS for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 19:43:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 00FBF4184F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00FBF4184F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 00FBF4184F
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 19:43:00 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1098477083; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 02 Nov 2025 19:42:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vFdyY-000u6H-2c;
 Sun, 02 Nov 2025 20:42:54 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: Bernd Kuhls <bernd@kuhls.net>,  buildroot@buildroot.org
References: <20251030202646.1825077-1-bernd@kuhls.net>
 <20251030202646.1825077-3-bernd@kuhls.net>
 <CAMV0Ro_8cErOj0+GPHc9bpQ3vnKiXhNc6iKfHXfztVmOBNmnew@mail.gmail.com>
Date: Sun, 02 Nov 2025 20:42:54 +0100
In-Reply-To: <CAMV0Ro_8cErOj0+GPHc9bpQ3vnKiXhNc6iKfHXfztVmOBNmnew@mail.gmail.com>
 (Akhilesh Nema's message of "Thu, 30 Oct 2025 16:37:12 -0700")
Message-ID: <87o6pk9q69.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=LYo/EFHNhgtJuPLmjJW8lZtV4Uuhw50/VSf08WsrPGPlbu+KL39giHbGEBThJVSkbWjztyqnGsx1WNdJ7ubvYHKCzcjGlN1Z/d5lPhSVjXomlMKTbtviMNq1bDRtdDkYe86R8W/EvteQLpAPi1ilIhp1s78tlgkX59wxpz5Qr+ClUtRTF1AznsqBBMj++fwTh3nE9hBZujWM8sfLMtgT1LJb75qE4jiyZYmHEei/4/HvjmYLQMDYPNoFwKwDKJvr/Wf0P061tO2eCRBNIbw0DFWcfhMmMk08vIgIWzfJTzDuBVead+wIQv8jpmHRDSvZq8w6dXfcmL1+pkk5cClslQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=jOwLM2Z96pKcs2illyxD3lriOElxt/x7j0sT6EWoK1U=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=LYo/EFHN
Subject: Re: [Buildroot] [PATCH 2/4] package/expect: remove package
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

Pj4+Pj4gIkFraGlsZXNoIiA9PSBBa2hpbGVzaCBOZW1hIDxuZW1hYWtoaWxlc2hAZ21haWwuY29t
PiB3cml0ZXM6CgogPiBIaSBCZXJuZCwKID4gT24gVGh1LCBPY3QgMzAsIDIwMjUgYXQgMToyN+KA
r1BNIEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+IHdyb3RlOgoKID4+IFBhY2thZ2UgaXMg
dW5tYWludGFpbmVkIGFuZCBjYXVzZXMgYnVpbGQgZXJyb3JzIHdpdGggZ2NjID49IDE0Lng6CiA+
PiBodHRwczovL3NvdXJjZWZvcmdlLm5ldC9wL2V4cGVjdC9idWdzLzEwNwogPj4gCiA+PiBGaXhl
czoKID4+IAogPj4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzQyNS80
MjVkYWRhYTRhNzVlYWU5MzMxMzUxMTcyODM5NDAyYTE5Nzc0OWE1LwogPj4gCiA+PiBFeHBlY3Qg
aXMgc3RpbGwgdXNlZCBvbiBsZWdhY3kgc3lzdGVtcyBmb3IgYXV0b21hdGlvbiBhbmQgdGVzdGlu
ZywgYW5kCiA+IHJlbW92aW5nIGl0IHdvdWxkIGNyZWF0ZSBvdmVyaGVhZCBmb3IgdXNlcnMgdG8g
bWFpbnRhaW4gaXQgaW4gdGhlaXIKID4gZXh0ZXJuYWwgdHJlZXMuCgpTbyB3aGF0IGRvIHlvdSBz
dWdnZXN0PyBXaWxsIHlvdSB0YWtlIG92ZXIgbWFpbnRlbmFuY2U/IElmIHNvLCBwbGVhc2UKc2Vu
ZCBhIHBhdGNoIHRvIGZpeCB0aGUgYnVpbGQgaXNzdWUgYWJvdmUgYW5kIG9uZSB0byBhZGQgYSBE
RVZFTE9QRVJTCmVudHJ5IGZvciBpdCB3aXRoIHlvdXIgbmFtZS4KClRoYW5rcy4KCi0tIApCeWUs
IFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
