Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592B0C79FA1
	for <buildroot@archiver.kernel.org>; Fri, 11 Sep 2026 06:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D05BA60B83;
	Fri, 11 Sep 2026 06:38:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mv6g5ejqr4Xm; Fri, 11 Sep 2026 06:38:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CBB8C60811
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789108735;
	b=Dr27ReqfWu2KIwNlXSX4jkcQWf+HhsVOkepRZOuc19OlwoEKPqq3V0MpcuHZOKMueixO
	 vZcZujMp7FxcXLcVKduBPNRjC1E/TfQTW6ns1CMSd6z2tu/UZdf5GUL9Xe7w+nfxM5Y2K
	 9VfjVpkQKYgqz8FvFzXM/hoor8GBltYgodpEgGJ0W4IUYYoOR/GjLbvUZsQlgw3pvFdR0
	 4tXvT0oootqkncH7wHSk2EwlyntcSiICDElG3DCyW7mENvkKfIH1NjoNJ0o1/0w0GZJCm
	 hcfZSAnUoUZDFWUelAPJ2YVkpjWMAhUHUycUHu/aor9Ixk2nH3cZxP0C5kswaZ6x13Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789108735;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Last-TLS-Session-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=v2VcUXWYrzivSdlazryE+rUJ/RAeH9YNyCs+vk4nXjs=;
	b=G/joDZDP9XOUCCWySAn+u8iOye6hIREf/z5K1dsoraSOr+qVgmXHYJ1ra016NZuW9llb
	 3m9NyXSTDTuvGroAvucof81I03OY5gJubVSbUkuxcAg2EiDAMu/PxCs3nU8JPRHZG98+A
	 KRzeBvpOsXeNnRO2Q5e8xT+Nk6otTGV7NtjoNLYEki7rM1fOFcnUy/lXsEHL9io17SsAL
	 JkpU09n++CqTGkgrPpxEQ8fUprr9QUafzzEQRP2nxgM7B5nhHysq2GCnw2zEfnpF+x2vn
	 tUQTlfJYqRKYXoiOPmQzzf1rb1rOg+j+hhnOFV2kQ6EccK6Eh6iA3PZRr7hJrk3ojyw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789108735;
	bh=v2VcUXWYrzivSdlazryE+rUJ/RAeH9YNyCs+vk4nXjs=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=MFtC5cfTArqA7DR3D0+rNT+gD/uDIJIWA7bABDerNg8eEGKwFn+de9OY0k6Ay8g2+
	 l7oCXl7fq6RLyYNtXJ+FZWIMYHLHCPUK8jz9Pm9KtEy4IyYcVNMIGnkriW9iqgrz22
	 0gXvp0aJd4T2K5AQxM0nhEWlUVK8z+LhqKUCmaGZue18/pgE5Th7qPSHctKiwZ/HSR
	 PwfD2ErLnSVVIHjeW+/lvsUMU13V+eKqgcTis1nEOXVvPQRaVZnppFEshq4zMeqELz
	 0ftMB0vFqJY6/1Bd46QplhmuJ0oIjhcooLT24TVBrVu/mYkhtjfXW++NULh5d0xBGJ
	 E4JxV9dZskvCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBB8C60811;
	Fri, 11 Sep 2026 06:38:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A2CBC14D
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 06:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 977708111A
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 06:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e6J6uXjJVwCP for <buildroot@buildroot.org>;
 Fri, 11 Sep 2026 06:38:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EF04881112
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789108732;
 b=B0PqBemdCyqJzXAhF/GZZwA3qqbSNBOQgH0Y8l/UGJ/S9l5oph6Mb6cPQky8TynmCSIx
 ot/Ds6fctgAB59e6RQC13jbgcNhjQIr30E+k82ActNVRho9w/TWMAjmp0gLhJZ3qaAF6B
 vheWTT1ShEImJ9JweWFJJblo7GIRhgcI95EtY/RYvAWOUxSf626K32p9ui1pQ+wrtP9+J
 /VZA9NkufYWNuoh63yiTvSRzyxMNX0dXU8yWN8/DpVAV/YgtwevzICOhwFnEiZKeiP/pr
 dQzsQzyrP8otgJl01WfWGjC2avOrB/zu54RN93ML3XaIIPiyEriVha0gSwS5mbczV4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789108732;
 h=X-Greylist:Received-SPF:Received:Received:Received:DKIM-Signature:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=MsgMEHqtzPXDq/wHoeq+1QXz1B7MD0ftB/H6jUuFDU8=;
 b=N5KTj68qJvq08hHmR3PtOdvFKuWuAeYCpvGZzNys0Gr1wCAla6OyvWJYZkYVBnG8EHWz
 3aFRf9/XecX1hixx39mRmYp8bO7OmPvOATtt4Oad3wVdri+tYJkE4EEzHcjT9hQBHJ0bn
 vfdb+izoPOVRIKejPSikjC6O8zXqjxpELmjkwAh031Mopmg4Dq3nltvXeyofXofupJzJN
 KmLDv8nZ2JUTNMrYexhfKw86PK6azM6C/HYWDuv9ds55u3dPi377fDvJJO+LpDu616iX0
 li6QU9IW8hNNDcTyqyuwV4yYspmrEi4hec2aTLZFqHuNPIze85cpvxzK0kgsl95jcvA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=17hnVGd4; 
 arc=none smtp.remote-ip=185.171.202.116
X-Greylist: delayed 472 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 11 Sep 2026 06:38:51 UTC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF04881112
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 06:38:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id B8D7AC653F5
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 06:31:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F0DFD601DE;
 Fri, 11 Sep 2026 06:30:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D877C11C7926E; 
 Fri, 11 Sep 2026 08:30:54 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Fri, 11 Sep 2026 08:30:52 +0200
Message-ID: <20260911063053.795160-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/openscap: propagate dependencies of
 libxmlsec1 after bump
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gY29tbWl0CmZlZjljYWQxZmU4NGI0MzY2ZTcwNWFkYjAzNDcwZTEyMTk5ZmZkMjUgKCJwYWNr
YWdlL2xpYnhtbHNlYzE6IGJ1bXAKdmVyc2lvbiB0byAxLjMuMTIiKSwgbGlieG1sc2VjMSB3YXMg
YnVtcGVkLCBhbmQgYWxvbmdzaWRlIHNvbWUKYWRkaXRpb25hbCAiZGVwZW5kcyBvbiIgd2VyZSBh
ZGRlZC4KCkhvd2V2ZXIsIHRoZXNlIG5ldyAiZGVwZW5kcyBvbiIgd2VyZSBub3QgcHJvcGFnYXRl
IHRvIHJldmVyc2UKZGVwZW5kZW5jaWVzIG9mIGxpYnhtbHNlYzEsIGkuZS4gb3BlbnNjYXAsIGNh
dXNpbmcgS2NvbmZpZyB3YXJuaW5nczoKCldBUk5JTkc6IHVubWV0IGRpcmVjdCBkZXBlbmRlbmNp
ZXMgZGV0ZWN0ZWQgZm9yIEJSMl9QQUNLQUdFX0xJQlhNTFNFQzEKICBEZXBlbmRzIG9uIFtuXTog
QlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNyBbPW5dICYmIEJSMl9UT09MQ0hBSU5fSEFTX0FU
T01JQyBbPW5dCiAgU2VsZWN0ZWQgYnkgW3ldOgogIC0gQlIyX1BBQ0tBR0VfT1BFTlNDQVAgWz15
XSAmJiBCUjJfUEFDS0FHRV9MSUJHUEdfRVJST1JfQVJDSF9TVVBQT1JUUyBbPXldICYmICFCUjJf
U1RBVElDX0xJQlMgWz1uXSAmJiBCUjJfVE9PTENIQUlOX0hBU19USFJFQURTX05QVEwgWz15XQoK
YW5kIHBvdGVudGlhbGx5IHNvbWUgYnVpbGQgaXNzdWVzLCBldmVuIHRob3VnaCB3ZSBkaWRuJ3Qg
Y2hlY2sgaW4gdGhlCmF1dG9idWlsZGVycyBmb3IgcG90ZW50aWFsIGZhaWx1cmVzLgoKVGhpcyBj
b21taXQgZml4ZXMgdGhhdCBieSBwcm9wZXJseSBwcm9wYWdhdGluZyB0aGUgbmV3IGRlcGVuZGVu
Y2llcy4KCkNjOiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgpD
YzogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBl
dGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KLS0tCiBwYWNrYWdlL29wZW5z
Y2FwL0NvbmZpZy5pbiB8IDggKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9vcGVuc2NhcC9Db25maWcu
aW4gYi9wYWNrYWdlL29wZW5zY2FwL0NvbmZpZy5pbgppbmRleCAwMWM2MjgxOTRjLi5iNmRlYWUw
YTVmIDEwMDY0NAotLS0gYS9wYWNrYWdlL29wZW5zY2FwL0NvbmZpZy5pbgorKysgYi9wYWNrYWdl
L29wZW5zY2FwL0NvbmZpZy5pbgpAQCAtMyw2ICszLDggQEAgY29uZmlnIEJSMl9QQUNLQUdFX09Q
RU5TQ0FQCiAJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9MSUJHUEdfRVJST1JfQVJDSF9TVVBQT1JU
UyAgIyBsaWJnY3J5cHQKIAlkZXBlbmRzIG9uICFCUjJfU1RBVElDX0xJQlMgIyBkbGZjbi5oCiAJ
ZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJFQURTX05QVEwKKwlkZXBlbmRzIG9uIEJS
Ml9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzcgIyBsaWJ4bWxzZWMxCisJZGVwZW5kcyBvbiBCUjJf
VE9PTENIQUlOX0hBU19BVE9NSUMgIyBsaWJ4bWxzZWMxCiAJc2VsZWN0IEJSMl9QQUNLQUdFX0xJ
QkNVUkwKIAkjIEluIHRoZW9yeSBzaG91bGQgYnVpbGQgd2l0aG91dCBjcnlwdG8sIGJ1dCBpbiBw
cmFjdGljZSBpdAogCSMgZG9lc24ndDogaHR0cHM6Ly9naXRodWIuY29tL09wZW5TQ0FQL29wZW5z
Y2FwL2lzc3Vlcy8yMzEwCkBAIC0xOSw2ICsyMSw4IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9PUEVO
U0NBUAogCSAgaHR0cHM6Ly93d3cub3Blbi1zY2FwLm9yZy8KIAkgIGh0dHBzOi8vZ2l0aHViLmNv
bS9PcGVuU0NBUC9vcGVuc2NhcAogCi1jb21tZW50ICJvcGVuc2NhcCBuZWVkcyBhIHRvb2xjaGFp
biB3LyBkeW5hbWljIGxpYnJhcnksIE5QVEwiCitjb21tZW50ICJvcGVuc2NhcCBuZWVkcyBhIHRv
b2xjaGFpbiB3LyBkeW5hbWljIGxpYnJhcnksIE5QVEwsIGdjYyA+PSA3IgogCWRlcGVuZHMgb24g
QlIyX1BBQ0tBR0VfTElCR1BHX0VSUk9SX0FSQ0hfU1VQUE9SVFMKLQlkZXBlbmRzIG9uIEJSMl9T
VEFUSUNfTElCUyB8fCAhQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEU19OUFRMCisJZGVwZW5kcyBv
biBCUjJfVE9PTENIQUlOX0hBU19BVE9NSUMKKwlkZXBlbmRzIG9uIEJSMl9TVEFUSUNfTElCUyB8
fCAhQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEU19OUFRMIHx8IFwKKwkJIUJSMl9UT09MQ0hBSU5f
R0NDX0FUX0xFQVNUXzcKLS0gCjIuNTUuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
