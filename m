Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878C5CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 07:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 303CA81089;
	Sun, 11 Oct 2026 07:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KhtCs-SeDOw5; Sun, 11 Oct 2026 07:53:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 231B48100C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791705202;
	b=ONs18fsFbhbplVIecGViCSZLGx5WQz8NFIx1NaLFtJqt8A1SDlUHbx76sI8iMMUpFST6
	 btgpWQ//JS8sj2zU3MiHAnhCIgWWmrutrkJ8JYHA5W8mMry5nVfuL95bROYP873t8QOZK
	 ySIjyQt3//WFDEsPRUp8Pt+7amWHmZtIn5zd0sciHFn5JdPEJ/vbDd+vha9Me8CLNf19C
	 xhQAxpgyvS98wny7iUqoy0HLJXwvQZkoGwLuzQaxFtRSSQFZ79PMdobvUE+7zRCsB0G+J
	 xiqtZA+w+hPpFWlkxfVM0ftyTlldyCOSf37HxEdD91v8HqK9/xdDTUxRPA/mxGnwttg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791705202;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=r9LRHRm/hYZQyCyTuh26jI837ynSXhJZ8+9pgeAhtGg=;
	b=mxX3Ap5i38ryiXPfuuSeubVhZSwpzyEJ5wiRKh3LKZcmd2LyEAV0Xf9bGOUs0zA5uc/z
	 52KauweUjrvaoACe1mBbKEkM4WEFcBYSpuMoXlTV49aTe+IsbWCMw4C4/Oxh/Kgu9kjKK
	 QsiGx7FK/+dC76ymDH+ssyrS9QE+2JbX9Ptzv7rPjPtp4SL214rSleDAUIjTjYM8myZYB
	 NL1R21upng3niIoHjBcRsh0rUpE1iYB1LYUOaGcRZeyMykMC9FzAmF7s9tRyKJnnogmeY
	 cqBwqOwBzW585dwFG0RQcpqcbTuXs9A/C5UHh7MCCQ87V/HukNAyfy87na5+jpJeKkg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791705202;
	bh=r9LRHRm/hYZQyCyTuh26jI837ynSXhJZ8+9pgeAhtGg=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IlHDE2U/ImsqM+HEOj1qzriKCi9z/YaU6fHJwXnILU9KMSbnFPNIYXzsFV/iQNHr5
	 LYjSID+DLE0E9N7AB8l+I1mcf4YRDMjr2NOk6H8T9Bmog/a/KQapmv5ST4XT1Ziigb
	 ohWzw33bJ42UhVtiVWo2DmZRim3nfMuegGFtwAMpE6vB2yp84bM0da++/MdQ0wDN6A
	 uTYvDhOuz29F/NxoirlEVuF7iPnaEwzG0ldKGDLxsjuSxziV+LhznnhvbQY9vOEcUP
	 CI1Biv2FauZm9b42hHDy9rypw5oem87oPOYPJpuZZsURy3g0y4vwnH1N5i28w7soID
	 C19hplB4FL6AA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 231B48100C;
	Sun, 11 Oct 2026 07:53:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 85D9D1A6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 07:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77CB46062D
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 07:53:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V4TYcIsOAAoL for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 07:53:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AD97A605E0
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791705199;
 b=J6RFd62PDiPtr50bVEYZZFU4LGzJJeHD/o5gRHOEv67Th0kNi9OWIKAufOw13DFdHMoB
 4RD/BCP6fr4z77lJy7rqFFn5e78uCh8YfD92nq9IdZfAJUX9AEaHVrcYCp0dec4v4Z7Xs
 PulVymv4MAOyT/g/uM3UmQe1tqwDzkXYYedaTQ0EJkqb2/yCALTcNu3WlwdbdZ3YB6GFq
 GDyrqoG5wl3sMM1Ig7I2RgD2kax5Bz7rY2S1JXIUcHGywxyL+88rnh+OetPTO/zBD/ykB
 UD59Wu9cb9+frk/WlRyH1hlMi9ZtMuRmgEXcbsoeW1rUAYhyk9CxcnKMl1FoOn0e1Yw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791705199;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=h12ZkXPM+pyhzmmrx/eCeVEaBErsZP/K/MwGz6Bt+60=;
 b=HbHQLD9L+nd4aQRNV6m6p4RzRVYXT9mKxS5kaumjjq74TtSR8NdjpdZwXLFEjpJrznuX
 LU+7AjKrmP++H5XtLsDQLiStms1XOJmx1DAXtTM6l2W0eCtOnWfQlyYqvfo+0Mto0HW0T
 URMET8evdYv3wnrZc4rGFoBK+MPfyM46Knn4I6cEPElQGTK9lgCpr387mqJXnPdjTMfMm
 X0jb0bHLX03C8A+WNkCeM5EfvrQpzs4lYajmqDVMMYSKpi/7HCrYrpVJPiqDxXa0b0C8p
 f+pyzUF2Ptz4ZQroTfr03VfsYmxtk/fSf9rtUSmuDYhiiWPjcdiCzJXAmyl9F/R3lyA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b=MK5Lvtjn; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=MK5Lvtjn
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD97A605E0
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 07:53:18 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=MK5Lvtjn8uW6bTSN7T7U9yP4EUnJmypELrG1XkCxnEofpWY15oCrO2b4AL6YavQlZ82UjFRU1JNdSKX9J1I2cLzSy/nZ2c8JNTBRr8wR3V8lvrt/IcZXcO2G1npdH2iBFNQMUpOr+IzF+F6STokr83RNLa0MoXKiWflecIDis3/YzSiqxPBaeB+uEUmaBG79NBMnbPFkSqT2/dodcq0aRQcaUBxoCye54CqxXnCMM0hc1t2RS+d8487xrRhBqE+e0VN5b8/a6VfIao+bOuCH7u5+9Z55TCQseGEKd3IcKEEQz/ID5KAPLwfP2SNZN0QVJGKZ4X6/UrTRliNWoQTacQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=x4ilkm66xja6som8J+BsKbz3hNsvcWplmdYHmu+XZN0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -120770656; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 11 Oct 2026 07:53:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xFoMs-00000005A7r-0W1Q;
 Sun, 11 Oct 2026 09:53:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: buildroot@buildroot.org,  James Hilliard <james.hilliard1@gmail.com>,
 Julien Olivain <ju.o@free.fr>
In-Reply-To: <20261002103144.13914-1-flaviu.nistor@gmail.com> (Flaviu Nistor's
 message of "Fri, 2 Oct 2026 13:31:35 +0300")
References: <20261002103144.13914-1-flaviu.nistor@gmail.com>
Date: Sun, 11 Oct 2026 09:53:14 +0200
Message-ID: <87cxtgk711.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v4 RESEND 1/3] package/python-cramjam: new
 package
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

Pj4+Pj4gIkZsYXZpdSIgPT0gRmxhdml1IE5pc3RvciA8Zmxhdml1Lm5pc3RvckBnbWFpbC5jb20+
IHdyaXRlczoKCkhpLAoKID4gQWRkIGNyYW1qYW0sIGEgcHl0aG9uIGJpbmRpbmdzIHRvIGRlL2Nv
bXByZXNzaW9uIGFsZ29yaXRobXMuCiA+IEl0IGlzIG5lZWRlZCBieSBweXRob24tc25hcHB5IHBh
Y2thZ2UgaW4gb3JkZXIgdG8gYnVtcCB0aGUgdmVyc2lvbi4KCiA+IFNpZ25lZC1vZmYtYnk6IEZs
YXZpdSBOaXN0b3IgPGZsYXZpdS5uaXN0b3JAZ21haWwuY29tPgogPiAtLS0KID4gQ2hhbmdlcyBp
biB2NDoKID4gLSBVcGRhdGUgYWxzbyBERVZFTE9QRVJTIGZpbGUgYXMgc3VnZ2VzdGVkIGJ5IEZp
b25hIEtsdXRlLgogPiAtIExpbmsgdG8gdjM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDI2MDcyNDA2NTAwNC4yMTc0MTEtMS1mbGF2aXUubmlzdG9yQGdtYWlsLmNvbS8KCiA+ICBERVZF
TE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMyArKysKID4gIHBhY2th
Z2UvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKID4gIHBhY2thZ2Uv
cHl0aG9uLWNyYW1qYW0vQ29uZmlnLmluICAgICAgICAgICB8ICA5ICsrKysrKysrKwogPiAgcGFj
a2FnZS9weXRob24tY3JhbWphbS9weXRob24tY3JhbWphbS5oYXNoIHwgIDQgKysrKwogPiAgcGFj
a2FnZS9weXRob24tY3JhbWphbS9weXRob24tY3JhbWphbS5tayAgIHwgMTQgKysrKysrKysrKysr
KysKID4gIDUgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKQogPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IHBhY2thZ2UvcHl0aG9uLWNyYW1qYW0vQ29uZmlnLmluCiA+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9weXRob24tY3JhbWphbS9weXRob24tY3JhbWphbS5oYXNoCiA+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tY3JhbWphbS9weXRob24tY3JhbWphbS5tawoK
ID4gZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCiA+IGluZGV4IGYyNzEzYzcy
MzkuLjkzNTE5NTc0YzkgMTAwNjQ0CiA+IC0tLSBhL0RFVkVMT1BFUlMKID4gKysrIGIvREVWRUxP
UEVSUwogPiBAQCAtMTEzNCw2ICsxMTM0LDkgQEAgRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3Bh
Y2thZ2UvdGVzdF9uZnRhYmxlcy5weQogPiAgRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2th
Z2UvdGVzdF9weXRob25fbmV0d29ya21hbmFnZXJfZ29pLnB5CiA+ICBGOglzdXBwb3J0L3Rlc3Rp
bmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9weXJvdXRlMi5weQogCiA+ICtOOglGbGF2aXUg
TmlzdG9yIDxmbGF2aXUubmlzdG9yQGdtYWlsLmNvbT4KID4gK0Y6CXBhY2thZ2UvcHl0aG9uLWNy
YW1qYW0vCiA+ICsKID4gIE46CUZsw6F2aW8gVGFwYWrDs3MgPGZsYXZpby50YXBham9zQG5ld3Rl
c2MuY29tLmJyPgogPiAgRjoJY29uZmlncy9hc3VzX3Rpbmtlci1zX3JrMzI4OF9kZWZjb25maWcK
ID4gIEY6CWJvYXJkL2FzdXMvdGlua2VyLXMvCiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZp
Zy5pbiBiL3BhY2thZ2UvQ29uZmlnLmluCiA+IGluZGV4IGZjMWU1N2QzMGQuLmQ0ZTNjMmZlNTgg
MTAwNjQ0CiA+IC0tLSBhL3BhY2thZ2UvQ29uZmlnLmluCiA+ICsrKyBiL3BhY2thZ2UvQ29uZmln
LmluCiA+IEBAIC0xMDYxLDYgKzEwNjEsNyBAQCBtZW51ICJFeHRlcm5hbCBweXRob24gbW9kdWxl
cyIKID4gIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWNvbnN0cnVjdC9Db25maWcuaW4iCiA+ICAJ
c291cmNlICJwYWNrYWdlL3B5dGhvbi1jb250b3VycHkvQ29uZmlnLmluIgogPiAgCXNvdXJjZSAi
cGFja2FnZS9weXRob24tY291Y2hkYi9Db25maWcuaW4iCiA+ICsJc291cmNlICJwYWNrYWdlL3B5
dGhvbi1jcmFtamFtL0NvbmZpZy5pbiIKID4gIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWNyYXlv
bnMvQ29uZmlnLmluIgogPiAgCXNvdXJjZSAicGFja2FnZS9weXRob24tY3JjL0NvbmZpZy5pbiIK
ID4gIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWNyYzE2L0NvbmZpZy5pbiIKID4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvcHl0aG9uLWNyYW1qYW0vQ29uZmlnLmluIGIvcGFja2FnZS9weXRob24tY3Jh
bWphbS9Db25maWcuaW4KID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKID4gaW5kZXggMDAwMDAwMDAw
MC4uODQxMTljYTk2OAogPiAtLS0gL2Rldi9udWxsCiA+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWNy
YW1qYW0vQ29uZmlnLmluCiA+IEBAIC0wLDAgKzEsOSBAQAogPiArY29uZmlnIEJSMl9QQUNLQUdF
X1BZVEhPTl9DUkFNSkFNCiA+ICsJYm9vbCAicHl0aG9uLWNyYW1qYW0iCiA+ICsJZGVwZW5kcyBv
biAhQlIyX0FSTV9DUFVfQVJNVjUKCldoeT8gUGVyaGFwcyB5b3UgbWVhbiBCUjJfUEFDS0FHRV9I
T1NUX1JVU1RDX1RBUkdFVF9BUkNIX1NVUFBPUlRTPwoKCj4gKwloZWxwCiA+ICsJICBQeXRob24g
YmluZGluZ3MgdG8gZGUvY29tcHJlc3Npb24gYWxnb3JpdGhtcyBpbiBSdXN0LgogPiArCSAgQWxs
b3dzIGZvciB1c2luZyBhbGdvcml0aG1zIHN1Y2ggYXMgU25hcHB5LCB3aXRob3V0IGFueQogPiAr
CSAgc3lzdGVtIG9yIG90aGVyIHB5dGhvbiBkZXBlbmRlbmNpZXMuCiA+ICsKID4gKwkgIGh0dHBz
Oi8vcHlwaS5vcmcvcHJvamVjdC9jcmFtamFtCiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhv
bi1jcmFtamFtL3B5dGhvbi1jcmFtamFtLmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1jcmFtamFtL3B5
dGhvbi1jcmFtamFtLmhhc2gKID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKID4gaW5kZXggMDAwMDAw
MDAwMC4uMjA0MmJiNjI4MQogPiAtLS0gL2Rldi9udWxsCiA+ICsrKyBiL3BhY2thZ2UvcHl0aG9u
LWNyYW1qYW0vcHl0aG9uLWNyYW1qYW0uaGFzaAogPiBAQCAtMCwwICsxLDQgQEAKID4gKyMgTG9j
YWxseSBjb21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCiA+ICtzaGEyNTYgIDU0MmVhMzQ5YTc1Mjhk
ODg5MzU4NTZkM2ViNTYyY2QxN2JmZjcxM2Q3YTQxZWFiOGQ2ODEyZDc4YTNjYjAwYmEgIGNyYW1q
YW0tMi4xMS4wLnRhci5negoKWW91IG9ubHkgbmVlZCB0aGUgdmVuZG9yZWQgdGFyYmFsbCBoZXJl
LCBFLkcuIHNlZSBweXRob24tY3J5cHRvZ3JhcGh5LgoKQ29tbWl0dGVkIHdpdGggdGhvc2UgY2hh
bmdlcywgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
