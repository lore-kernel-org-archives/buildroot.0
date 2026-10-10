Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBCFCA9EC3
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 12:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31D56608D1;
	Sat, 10 Oct 2026 12:46:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 73QPqgWA-vtx; Sat, 10 Oct 2026 12:46:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9BD6D606F8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791636410;
	b=EKOxYa0YMLKUKBwZ2QdgpjXdAAsgjS430iTPXOfNQx4T/cioMSMYYwPsWUADEdJtPdQs
	 EHBXkRfEeqkuT3Lp8Nd0SOulo4wH+LSdJt8VSCp0mLaPVMw7D1q/QmJuYp3Ormd2BEHLs
	 xpouqQdHrPLAwYHzdG+PB7Zc6nAX999ekOr2KSOsHFQjnfWQMhyYeJtDr9Xxd22YaGdTr
	 2TY43a7WrB9pYQAWyzNhcTvgKzJ8tF711aUudp+WFkpN4Y5RsTKuX06VYVGEBkt1tmWiO
	 7hrqgVGM6nAyxMak4IlL4lhrz+NaFE9nxcA3A7H4CCx5L5rKh2VjrdF9SyvNBA6IPgA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791636410;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=qg0AUmMPFcx7b4iXjPtbvl8sGcgIP3D3/FyEFYmmOSo=;
	b=AcEyA2fqJNNJJ7W+OVIX5mNjlnR9/C8t4uJF4QP8K4X5ztK7elFVM944/GCnw5oG1WQz
	 Uq6NbQlTCveuunCLk7gEyh1JCEiu5lczss8ltBJf+c4gvQjKspy/CYvM+w+iXMB04AgZP
	 STK06em8VxLID7uR+jtZuAn5eQadJ8s11UvjtVCx7I5DBHEU5XVLLu2TXFTDR2LnfhHx/
	 m+BFVRiFxTggwv83jzN5TxmDJAH5h32/BS5DWvRJePNcbWvlE4PdDW/k5Pk9egH0/k+rB
	 lDrJvE4bfYoV+jBwhyR1O96K2sWQ+bZkK2d7CWESQpKPcEZqwJYBRrldNbquXZJKoUg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791636410;
	bh=qg0AUmMPFcx7b4iXjPtbvl8sGcgIP3D3/FyEFYmmOSo=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gsiFxLCMCppq4d9CKWzwcrXtEZ4uLJmF9LnvK4RuqAK1l8i3vIAyV+ip8rJIidSC4
	 ZngFwx1Ksrt0TaX9l8ww8PJZSZh9jx36W1f0cmVN5wJj9+vM0a5zBIXybDmHsez8XL
	 ZA8OURNpkGdHwGg9G5XX2LZHA24TZaa95thvHhstxWv36EXKgf6/ERxpBXOS2hii8i
	 ngTdZ1XLchWE7ppJl1gKGoIhv7jvXbMNiHEOkPVuliZ7rya0p/PGr3JxAyh1nwngJI
	 /JYuHS8dQQG3nUd1N9bea3WYpfcAv6uPGi6vyp+VETKb7ZaqgIpoIFf9OkaHaTWUAb
	 z87Eftq3tOwkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BD6D606F8;
	Sat, 10 Oct 2026 12:46:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F2C2D317
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D907381299
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XSGvqytqbItQ for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 12:46:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6159A81215
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791636405;
 b=VNRVxXGdbztx0iCs2ldR6GX5pODlqbC2YujBbZW75Ny388kU0W0jTxxZ5w1y58q5Zc1o
 MjYpoWac+2/lh8B9WMNpIbjMfr1syWSKpgWJRVbUK5jSx69GJGx0i7bfCTEDP02IzpTTR
 +RttT1CVL1lheE1N7QXuVj5I06VxUtXpRsxgiXFtz8R4nNmHQFMBF6baOQOcgxSVeqhsV
 k4qFrPJ8DhzQVvuWN9OCQMRK/G6/TIQ3ls0pxr1tGAq2N0ukAEVwSdA3AXQgLZlacOwqE
 bf+cI9lHGkAWC7eZsHPRE+KS2vSp4nf6R4kUmdfrY/21y47H++zo52ZOtbm+a1PyApA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791636405;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=1d24i7/QUSEXBbqMF18W4IDYB4T6ObmFW71AVhoUVPQ=;
 b=eOdz3+cKrkKklKHcQavn4SAnCBavTSmm8Dp+lC06sngNGX4DweRW5INe5ySz4z23TePN
 j78eOXhV+9++7XkiyoajNGS9lnf2OaGtZwR+jMtLGEG7/Hro/Mmh/OL7e/sSbNsNdUopq
 Q/F1zuOj1801cuheXOjUP0rD3az4GpRWPPvC/X4p/WzRWfBL3pCjpWSoP0vUaw1U9xTWf
 PeDM0qwjAiRZLVF8yhFASvsJm8i0rev2cg3xoAjcTczW5+3vaBR2GBR2EKb44CDjFzJgc
 nUPeFXBqzBpZTI1YKsnzC/uMGMuq2WJTbldL+ASBJpbhHHofHGdy56iV0nxSyD9wriw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b=XrS0QH0Q; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=XrS0QH0Q
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6159A81215
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:46:43 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=XrS0QH0Q/RkFOhTedLiIKaciMXpjkpmbtJK+Qz1vr00AKbAQHV6FaHH5t14uqAnlHjOn2pHFnczpffjY3jnHyr5TPfLRsq7pE1V/S5cYKP7kfEW+VGlQ+JHa6XAB2VLNwdiWmwfFo9R2Gph2s4mwgRQs20S0kn5Yb08sPO+Q7BG7B6qe0+atRA6pab0dl69RicDmGSW674tYollsC/mnrH2wS8G769XhMG+a1PAK2OCLwAntq+kC/FP1NMCv77njvqEz0q0In1OXew5idR2prGuOjb3X3WVioOZdlBqZoMRLwCozBROsuCepwHzSethDKL953pM49K6oCC81S0sEpg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=+Lf3b4OwufppuGN59F9JVg3MtSiWSDQthnmIdKubYUM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1834254337; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 10 Oct 2026 12:46:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xFWTD-00000001XiC-0zjA;
 Sat, 10 Oct 2026 14:46:35 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Thijs Vermeir <thijsvermeir@gmail.com>
In-Reply-To: <20260619142831.3664440-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Fri, 19 Jun 2026 16:28:31 +0200")
References: <20260619142831.3664440-1-bernd@kuhls.net>
Date: Sat, 10 Oct 2026 14:46:35 +0200
Message-ID: <87se2du3is.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/x265: bump version to 4.2
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

Pj4+Pj4gIkJlcm5kIiA9PSBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PiB3cml0ZXM6Cgog
PiBodHRwczovL21haWxtYW4udmlkZW9sYW4ub3JnL3BpcGVybWFpbC94MjY1LWRldmVsLzIwMjYt
QXByaWwvMDE0NTMzLmh0bWwKID4gUmViYXNlZCBwYXRjaCAwMDAxLgogPiBSZW1vdmVkIHJlbWFp
bmluZyBwYXRjaGVzIHdoaWNoIGFyZSBpbmNsdWRlZCBpbiB0aGlzIHJlbGVhc2UuCgogPiBBZGRl
ZCBkZXBlbmRlbmN5IHRvIF9TWU5DXzggZm9yIGNsaSBkdWUgdG8gdXBzdHJlYW0gY29tbWl0CiA+
IGh0dHBzOi8vYml0YnVja2V0Lm9yZy9tdWx0aWNvcmV3YXJlL3gyNjVfZ2l0L2NvbW1pdHMvN2Vh
NTRiZGY1YTZhMzVlM2ZmZjQ0ZDg0NTRlMzE2OTU5MjhkYzc1MiNMc291cmNlL2NvbW1vbi90aHJl
YWRpbmcuaFQ3MAoKVGhpcyBwb2ludHMgdG8gdGhlICNpZiBOT19BVE9NSUNTIGNvbmRpdGlvbmFs
LCBzbyB5b3UgcHJvYmFibHkgaW5zdGVhZAptZWFuOgoKaHR0cHM6Ly9iaXRidWNrZXQub3JnL211
bHRpY29yZXdhcmUveDI2NV9naXQvY29tbWl0cy83ZWE1NGJkZjVhNmEzNWUzZmZmNDRkODQ1NGUz
MTY5NTkyOGRjNzUyI0xzb3VyY2UvY29tbW9uL3RocmVhZGluZy5oVDg4CgpBcyB0aGVyZSBpcyBh
IE5PX0FUT01JQ1MgbG9naWMsIHBlcmhhcHMgd2Ugc2hvdWxkIGp1c3QgcGFzcwotRE5PX0FUT01J
Q1M9T04gaWYgIUJSMl9UT09MQ0hBSU5fSEFTX1NZTkNfOD8gSW4gYW55IGNhc2UsIGl0IGlzIG5v
dApzcGVjaWZpYyB0byB0aGUgQ0xJLCBidXQgc2hvdWxkIGJlIGZvciB0aGUgeDI2NSBwYWNrYWdl
IGluc3RlYWQgKHRoZQpkZXBlbmRlbmN5IG9uIF9fc3luY19mZXRjaF9hbmRfYWRkXzggY29tZXMg
ZnJvbSB0aGUgbGlicmFyeSwgbm90IHRoZQpjbGkpLgoKCiA+IFRoaXMgYnVtcCBpbmNsdWRlcyB1
cHN0cmVhbSBjb21taXQKID4gaHR0cHM6Ly9iaXRidWNrZXQub3JnL211bHRpY29yZXdhcmUveDI2
NV9naXQvY29tbWl0cy9mNzRiMmYzOGFkODUwYTA5NTI0ZjMzMWY2NDg3MGU2MzAwZmQ5MjNiCiA+
IHRoYXQgdXNlcyB2c3QxcV9zMTZfeDIoKSB3aGljaCB3YXMgZmlyc3QgYWRkZWQgdG8gZ2NjIDk6
CiA+IGh0dHBzOi8vZ2NjLmdudS5vcmcvZ2l0Lz9wPWdjYy5naXQ7YT1jb21taXQ7aD01Njg0MjFi
YWE1YTRjZGI3YmI3YzVhYzMyM2M5Mzk0OTJlZTNmMDUyCgogPiBjYXVzaW5nIGJ1aWxkIGVycm9y
cyBkZXRlY3RlZCBieSB0aGUgR2l0bGFiIHBpcGVsaW5lczoKID4gL2J1aWxkcy9ia3VobHMvYnVp
bGRyb290L2JyLXRlc3QtcGtnL2Jvb3RsaW4tYWFyY2g2NC1nbGliYy1vbGQvYnVpbGQveDI2NS00
LjIvc291cmNlL2NvbW1vbi9hYXJjaDY0L3BpeGVsLXByaW0uY3BwOjkzNjoyNToKID4gIGVycm9y
OiDigJh2c3QxcV9zMTZfeDLigJkgd2FzIG5vdCBkZWNsYXJlZCBpbiB0aGlzIHNjb3BlCgogPiBE
aXNhYmxlIGFzbSBmb3IgaTM4NiB3aXRoIG11c2wgdG9vbGNoYWlucyB0byBmaXggbGlua2luZyBl
cnJvciBkZXRlY3RlZAogPiBieSB0aGUgR2l0bGFiIHBpcGVsaW5lczoKCiA+IC9idWlsZHMvYmt1
aGxzL2J1aWxkcm9vdC9ici10ZXN0LXBrZy9ib290bGluLXg4Ni1pNjg2LW11c2wvYnVpbGQveDI2
NS00LjIvc291cmNlL2NvbW1vbi94ODYvY3B1LWEuYXNtOjE4MToKID4gIGVycm9yOiBFTEYgZm9y
bWF0IGNhbm5vdCBwcm9kdWNlIG5vbi1QQy1yZWxhdGl2ZSBQTFQgcmVmZXJlbmNlcwoKSXQgc291
bmRzIG9kZCB0byBtZSB0aGF0IHRoZSBDIGxpYnJhcnkgd291bGQgbWF0dGVyIGZvciBhbiBlcnJv
cgpnZW5lcmF0ZWQgZm9yIG5hc20uIEkgZGlkIGEgdGVzdCBidWlsZCB3aXRoIGk2ODYvZ2xpYmMg
YW5kIHNlZSB0aGUgc2FtZQppc3N1ZToKClsgMTMlXSBCdWlsZGluZyBBU01fTkFTTSBvYmplY3Qg
Y29tbW9uL0NNYWtlRmlsZXMvY29tbW9uLmRpci94ODYvbWMtYS5hc20ubwovaG9tZS9wZWtvL3Nv
dXJjZS9idWlsZHJvb3Qvb3V0cHV0LXgyNjViL2J1aWxkL3gyNjUtNC4yL3NvdXJjZS9jb21tb24v
eDg2L2NwdS1hLmFzbToxODE6IGVycm9yOiBFTEYgZm9ybWF0IGNhbm5vdCBwcm9kdWNlIG5vbi1Q
Qy1yZWxhdGl2ZSBQTFQgcmVmZXJlbmNlcwoKTG9va2luZyB1cHN0cmVhbSwgSSBzZWUgdGhlcmUg
aXMgYSA0LjMgcmVsZWFzZSB3aGljaCBhbW9uZyBidWdmaXhlcwpsaXN0czoKCkZpeCBpNjg2IGJ1
aWxkIGZhaWx1cmUgKG5vbi1QQy1yZWxhdGl2ZSBQTFQgcmVmZXJlbmNlcykgYW5kIFBvd2VyUEM2
NApidWlsZCB3aXRoIENsYW5nLgoKU28gbWF5YmUgd29ydGggYnVtcGluZyB0byB0aGF0IGluc3Rl
YWQ/CgpDYXJlIHRvIGZpeCB0aGF0IGFuZCByZXNlbmQ/CgotLSAKQnllLCBQZXRlciBLb3JzZ2Fh
cmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
