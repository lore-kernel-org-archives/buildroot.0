Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E09FF6E8C
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 08:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97E3683BFE;
	Wed, 18 Mar 2026 08:39:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5dWKqsDP8Nz0; Wed, 18 Mar 2026 08:39:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA20A83BB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773823140;
	bh=JgDzurbv7zsdUoFIZXNbIiIlTnk6V6GYiDWwqFbdHTg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nXHjymSBukNfC5X3+AIBzER59vLhjas9tuu6M+ObPgSrdsh8byavW6A0vRW0kUmcL
	 TDqIbXBNDoGV95rcTlSMlNGr+01latezhC/aLAfLimvNSztJ86NufZFBHSgliIceHj
	 bGMJeJdluOa2IWWarqq80r0kmZoF2gT8yRSAnhpsXdHIe9SMpQSjBQDfk/m+8GL35/
	 MRxzqyDDlRye+Ket2yyjho2ae2o9R+t48tjlTTirPVBHUU7ZSj9ngSL08dFU/wZQcE
	 +MI+hjgSZeyfyhhA3uPJKA8Rop3hFfYeXsyERigAJ+v6/rZLmJVOtcxcSONq6nmVFz
	 DwQK6Ob/klD9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA20A83BB1;
	Wed, 18 Mar 2026 08:39:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 940FC1B6
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 08:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79983608BA
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 08:38:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xOICIxZ17H3K for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 08:38:54 +0000 (UTC)
Received-SPF: Temperror (mailfrom) identity=mailfrom; client-ip=109.202.192.35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 803E3608B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 803E3608B9
Received: from mail.codelabs.ch (mail.codelabs.ch [109.202.192.35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 803E3608B9
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 08:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id E8FC65A0005;
 Wed, 18 Mar 2026 09:37:31 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FGvhctYDLb5P; Wed, 18 Mar 2026 09:37:30 +0100 (CET)
Received: from [10.6.32.204] (unknown [185.12.128.224])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 81F6F5A0004;
 Wed, 18 Mar 2026 09:37:30 +0100 (CET)
Message-ID: <36f45eeb35bb33fa068060c77ba22b06fc34550a.camel@strongswan.org>
From: Martin Willi <martin@strongswan.org>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Wed, 18 Mar 2026 09:37:30 +0100
In-Reply-To: <20260311081838.23403-1-thomas.perale@mind.be>
References: <20260305115752.1861153-9-martin@strongswan.org>
 <20260311081838.23403-1-thomas.perale@mind.be>
Autocrypt: addr=martin@strongswan.org; prefer-encrypt=mutual;
 keydata=mQENBEhbeIwBCADbKW4rqhkBsvQumeWTAfy+Q+YciIbbqLvxwRZPKpxz19nxJQPbWF7pG
 oiPb3TWLK3TitWVKKZuNILStsKTGiR4RqLUs8n3sESPoz5HmRqsijm6yJDzzPAE3/B7IWHBeAOssV
 TWS7b9ROz4iFI+fNLnqMqE22zMEItC2r9zi6GpDmi/QP3CcxHFzPMF5iQkMPp6QJMwOdPvYR9kBb1
 x1ubDOjsfWqI41neJTGlv3EVFc5nkv0s7PfoYxMkf8/VStd29pMe4csKJUaPDkLqenLl8Omq8Z3F+
 sbjdo+hcim4i3EsROYh59kA4/UuMFfI0hxaIaoW6UAb6gyqOHkS6vC+VABEBAAG0Jk1hcnRpbiBXa
 WxsaSA8bWFydGluLndpbGxpQHJldm9zZWMuY2g+iQE4BBMBAgAiBQJRsHoSAhsvBgsJCAcDAgYVCA
 IJCgsEFgIDAQIeAQIXgAAKCRAQGu6ewTL0wxf8B/9EThZXuVqNTK2nH2QuRi2zQntFXkK2QbU11sv
 zkfZV8xDfWKHdq67LLako/FOE1dXN6iurWFChgMexs0bSMzaftCmHGSSgGaQhBhANSObKu8M+UyHd
 bes88zNpQKdwVd9guIo6oRrX33IYkb63ifZReChcBffu6cjXQky7/79kpnl6f3qlP5ZluyNGX9Iwe
 z1EpmG2zHkJlc+3oPQbsQbFKjUOdR1hfyKbcVVQHs1ddv830Z0cpM6QbcknR81VsCQ7FYBrH5Hw3N
 AKhrfbIaZMvwBgQfXIgc7mwPZFg2oONZMzauzX6EpZ29Z+kCsy3AArnZssVAwxk+ydRJhUWlZmtCR
 NYXJ0aW4gV2lsbGkgPG1hcnRpbkBzdHJvbmdzd2FuLm9yZz6JATYEEwECACAFAkhbeIwCGy8GCwkI
 BwMCBBUCCAMEFgIDAQIeAQIXgAAKCRAQGu6ewTL0w9ruCADDGN0JgrImHOPGgsJwdP2nKwBytO8mM
 Z/Z/folgH20zqiMqyNR4lOZW9L3DF4rz83fKXQFbP7nCf6GZ/tmjmrImiTZBkKwr37ZsaBRaCz3i9
 rYITY94njenYp7jy6roMcvlBMhNjSI04AvLjaA/hcPuSexqqso+qoNTa7+VplF7OpikB8vKPt+fMp
 XuGP8TF/q8v9TrY+gcVv0c8ZOrGDnI5vJt1Fp0PvoH/vXFx3Jy90g+hRUYFbLW2S76geiGVML9AeK
 IQKjEpp2bxsd+JYGo91MeKBqjlllonxZ17eKNtlA+X+iluwcDJZzdabB19EQG7ZEf0jAy6Sy09au6
 MYFtCBNYXJ0aW4gV2lsbGkgPG1hcnRpbkByZXZvc2VjLmNoPokBNgQTAQIAIAUCSzjspgIbLwYLCQ
 gHAwIEFQIIAwQWAgMBAh4BAheAAAoJEBAa7p7BMvTDaP4IALJRUmUEagBRrdAi1SrxxcsgPDr5vo8
 1UrPADXKnMdf6KXPqfPMN4hIeS4zbFyC/FA9cg0T9680pVk8hLmcD3iCRMMnL9d38hOQmMxw2TYnd
 7rth1LuoDRhIwI1bfADw3EJGEMsTy49zVtVl1KwmqBZDDk3PGHvukHYawleOrTRVitOEvavg0vfgg
 CgqvSeSBy3tkX2EIlagC/5eXpYLguj1iI84xG01M4bZ9PU+PuzZADaHL+a9iPelBvk0uNjwKvKjPx
 OPDfaxsmEgjNG7M9gZjBkjSjvclRUlLMpe+3qHhGEYf2yKsv72hCLYy8my5jRnu59eZq72lX9YWVs
 jlXU=
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1773823050;
 bh=2RFrvoiec/G8MO7NjkUvsJapECpvl6PMc3RTUXhIh7Y=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=qMQ5dwXlxQdepGhXqzB4sT7oIZhqIbF/oRAqiT7/g9c5lWytZVuuRMCgQiceVui7U
 vQro3qKwqLsOkaSBxUPZqNHtCE3RdfTikWkLjv4XEV+g231zY1a/aKeacFM86CwQ6I
 7BFtcokyYQWQIsWcQ4Tgo9X+TrppmO2MfvZQrXCtcM35c9L7BYwKtzTHAYPXzz+uxy
 j7qAsLXXfPORa0d1mVrVKHqANvmENlX28S+TkI1veXMKo9s3QKriZwGmcLrbnoDODR
 kMQZgKKL/HDM8pXhcTfxlRf1Yp3pujtwdRN3sNX6KBMi/evKZQOe+58IL+mB63tO9f
 P8eYBq23/+rRA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=strongswan.org
Subject: Re: [Buildroot] [PATCH v2 8/8] utils/generate-cyclonedx: add hashes
 from .hash files to externalReferences
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

SGkgVGhvbWFzLAoKPiA+ICvCoMKgwqAgcGF0aCA9IGJycGF0aCAvIGNvbXBbInBhY2thZ2VfZGly
Il0gLyBmIntwa2duYW1lfS5oYXNoIgo+IAo+IEJ5IHVzaW5nIHRoaXMgcGF0aCB5b3Ugd2lsbCBt
aXNzIHNvbWUgc3BlY2lhbCBjYXNlcyBmb3IgdGhlIGhhc2gKPiBmaWxlcy4gWy4uLl0gWW91IHNo
b3VsZCBmaXJzdCBleHBvc2UgdGhlIGhhc2ggZmlsZXMgZnJvbSB0aGUgc2hvdwo+IGluZm8gb3V0
cHV0CgpUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uLCBtYWtlcyBzZW5zZS4gSSd2ZSBpbnRlZ3Jh
dGVkIHRoaXMgYXBwcm9hY2gKd2l0aCBBcm5vdXQncyBhZGRpdGlvbiBhbmQgaXQgc2VlbXMgdG8g
d29yayBmaW5lLgoKV2hhdCBpcyBhIHdheSBmb3J3YXJkIHdpdGggdGhpcyBhbmQgdGhlIG90aGVy
IHNlcmllcyBbMV0/CgogKiBBcmUgdGhlcmUgY29udHJvdmVyc2lhbCBwYXJ0cyBJIHNob3VsZCBk
cm9wPwogKiBTaGFsbCBJIHJlYmFzZSAgb24gdG9wIG9mIHlvdXIgQ3ljbG9uZURYIDEuNyBwYXRj
aGVzPwoKVGhhbmtzLApNYXJ0aW4KClsxXSBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvcGlw
ZXJtYWlsL2J1aWxkcm9vdC8yMDI2LU1hcmNoLzc5ODExMS5odG1sCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
