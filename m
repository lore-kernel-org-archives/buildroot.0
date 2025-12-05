Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051D2D37490
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 19:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD37660797;
	Fri,  5 Dec 2025 19:58:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XsUuPjI8J8lc; Fri,  5 Dec 2025 19:58:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9E0760759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764964735;
	bh=XDQZqPnatl18U2v0DccKsJ7nrL3EbToFsnA6Bns0Mok=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oSdE4jF2LwQIT4I3ed24hNVGYGXJ6xvvCEoosWPBWUIqbN7YVrrqeHr7GmxEONFYP
	 xxHSDqQA7zZWC/MT9j0bfrjibVYRL8uex1mzEqKhaAEeftUPQLk7Sf7PpvX5WNE5Zp
	 imPAxBA4NHkxDNYVYxkE6z9O6HZa42K6VyabASZiCYHo0dKI7tm0PGUcV3ljfpuZ1G
	 8Chj09aVrh3vhsYz1XkHuHPqif8t3kaxvG5LEd2bhRHEWubfXkKnnIhsPZ0sx9jEfU
	 CANPE40D7+NDTnVU/gLK71p3tn1LMYzPQzVXw6qQtFXyF1oQklJZ7WCjt2Whm7+UOV
	 UhEZi5muEL+Iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9E0760759;
	Fri,  5 Dec 2025 19:58:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C4D2EE7
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 19:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1E4C60797
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 19:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JSqfNu9pSqXx for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 19:58:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D48FE60759
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D48FE60759
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D48FE60759
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 19:58:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DDC38A4C3728;
 Fri,  5 Dec 2025 20:58:51 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47596)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vRbx5-000000003Fn-0WrC;
 Fri, 05 Dec 2025 19:58:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Joris Lijssens <joris.lijssens@gmail.com>
Date: Fri,  5 Dec 2025 20:58:50 +0100
Message-ID: <20251205195851.1945029-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764964731;
 bh=z0Y+nkgHJylKrmgJaTFoVNN+lt6GMso0gCg1yUzJFl4=;
 h=From:To:Cc:Subject:Date:From;
 b=JG6XrHxDirYEeZmQie7fMnyJRNFVDXHxjEcfGZTgnTGHdX0VkXrtrj9juM67w6OeI
 lLJjWMObMFixWfbgBA4VlaDldy5WPDkdC66bjL4EUojr8WDWb8tuK/NdZQcMA2pc7Q
 zg5HxSUHCJTivWunCKqOvRe0VNe04cgfvEewNu1aB5iwxOdVawDYFAuYtTYNhJzpMm
 5ydQje4HrWaXkrG93M6zRr459EaSIvj6Gib7NvUFs49wzDrxteKaMb1PeR/QbkiN6p
 ua7IA7fbjtqJIezLaRlQ4EzzBxdhVTSQdff6mjkB5ek8IbK4Qy0HluEw8iXUKlGCAJ
 dSy8f/lfxTSBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=JG6XrHxD
Subject: [Buildroot] [PATCH 1/1] package/netsniff-ng: fix compilation with
 gcc-15
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

QnVpbGQgZXJyb3Igd2FzIG5vdCB5ZXQgcmVjb3JkZWQgYnkgYXV0b2J1aWxkZXJzLgoKU2lnbmVk
LW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KLS0tCiAuLi5zZXphaG4tZml4
ZWQtY29tcGlsYXRpb24td2l0aC1nY2MtMTUucGF0Y2ggfCAzOSArKysrKysrKysrKysrKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBh
Y2thZ2UvbmV0c25pZmYtbmcvMDAwMS1tYXVzZXphaG4tZml4ZWQtY29tcGlsYXRpb24td2l0aC1n
Y2MtMTUucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL25ldHNuaWZmLW5nLzAwMDEtbWF1c2V6
YWhuLWZpeGVkLWNvbXBpbGF0aW9uLXdpdGgtZ2NjLTE1LnBhdGNoIGIvcGFja2FnZS9uZXRzbmlm
Zi1uZy8wMDAxLW1hdXNlemFobi1maXhlZC1jb21waWxhdGlvbi13aXRoLWdjYy0xNS5wYXRjaApu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi41ZWFhYTkxZjEwCi0tLSAvZGV2
L251bGwKKysrIGIvcGFja2FnZS9uZXRzbmlmZi1uZy8wMDAxLW1hdXNlemFobi1maXhlZC1jb21w
aWxhdGlvbi13aXRoLWdjYy0xNS5wYXRjaApAQCAtMCwwICsxLDM5IEBACitGcm9tIDFhZjdhZTMz
ZTNlODE3OGFiNWM2NDljM2E1MjgzOGQ0Mzc1YzQyMjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tOiA9P1VURi04P3E/SmFyb3NsYXY9MjA9QzU9QTBrYXJ2YWRhPz0gPGpza2FydmFkQHJl
ZGhhdC5jb20+CitEYXRlOiBUdWUsIDEwIEp1biAyMDI1IDE0OjQ3OjU0ICswMjAwCitTdWJqZWN0
OiBbUEFUQ0hdIG1hdXNlemFobjogZml4ZWQgY29tcGlsYXRpb24gd2l0aCBnY2MtMTUKK01JTUUt
VmVyc2lvbjogMS4wCitDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKK0Nv
bnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKKworZ2NjLTE1IGJ5IGRlZmF1bHQgdXNlcyBD
MjMgc3RhbmRhcmQgd2hpY2ggaXMgbW9yZSBzdHJpY3Qgb24gZm9yd2FyZAorZGVjbGFyYXRpb25z
LgorCitPcmlnaW5hbCByZXBvcnQ6IGh0dHBzOi8vYnVnemlsbGEucmVkaGF0LmNvbS9zaG93X2J1
Zy5jZ2k/aWQ9MjM0MDkyNAorCitTaWduZWQtb2ZmLWJ5OiBKYXJvc2xhdiDFoGthcnZhZGEgPGpz
a2FydmFkQHJlZGhhdC5jb20+CisKK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vbmV0c25p
ZmYtbmcvbmV0c25pZmYtbmcvY29tbWl0LzFhZjdhZTMzZTNlODE3OGFiNWM2NDljM2E1MjgzOGQ0
Mzc1YzQyMjgKKworU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4K
Ky0tLQorIHN0YWdpbmcvbW9wcy5oIHwgNiArKystLS0KKyAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvc3RhZ2luZy9tb3BzLmgg
Yi9zdGFnaW5nL21vcHMuaAoraW5kZXggY2YxOWYwOTguLmFlMzc2OWE3IDEwMDY0NAorLS0tIGEv
c3RhZ2luZy9tb3BzLmgKKysrKyBiL3N0YWdpbmcvbW9wcy5oCitAQCAtOTQwLDkgKzk0MCw5IEBA
IGludCBtb3BzX2RpcmVjdChjaGFyKiBkZXYsIGludCBtb3BzX3R5cGUsIGNoYXIqIGFyZ3N0cmlu
Zyk7CisgCisgCisgc3RydWN0IGF1dG9tb3BzICogYXV0b21vcHNfaW5pdCh2b2lkKTsKKy1zdHJ1
Y3QgYXV0b21vcHMgKiBhdXRvbW9wc19hbGxvY19wcm90b2NvbCgpOworLXN0cnVjdCBhdXRvbW9w
cyAqIGF1dG9tb3BzX2RlbGV0ZV9wcm90b2NvbCgpOworLXN0cnVjdCBhdXRvbW9wcyAqIGF1dG9t
b3BzX3NlYXJjaF9wcm90b2NvbCgpOworK3N0cnVjdCBhdXRvbW9wcyAqIGF1dG9tb3BzX2FsbG9j
X3Byb3RvY29sKHN0cnVjdCBhdXRvbW9wcyAqY3VyKTsKKytzdHJ1Y3QgYXV0b21vcHMgKiBhdXRv
bW9wc19kZWxldGVfcHJvdG9jb2woc3RydWN0IGF1dG9tb3BzICpjdXIpOworK3N0cnVjdCBhdXRv
bW9wcyAqIGF1dG9tb3BzX3NlYXJjaF9wcm90b2NvbChzdHJ1Y3QgYXV0b21vcHMgKmxpc3QsIGNo
YXIgKm5hbWUpOworIGludCAgICAgICAgICAgICAgIGF1dG9tb3BzX2R1bXBfYWxsIChzdHJ1Y3Qg
YXV0b21vcHMqIGxpc3QpOworIHZvaWQgICAgICAgICAgICAgIGF1dG9tb3BzX3NldF9kZWZhdWx0
cyhzdHJ1Y3QgYXV0b21vcHMgKiBjdXIpOworIHN0cnVjdCBmaWVsZHMgKiAgIGF1dG9tb3BzX2Fk
ZF9maWVsZCAoc3RydWN0IGF1dG9tb3BzICphbXApOwotLSAKMi40Ny4zCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
