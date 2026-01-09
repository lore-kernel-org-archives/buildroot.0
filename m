Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB52D26D92
	for <buildroot@archiver.kernel.org>; Fri,  9 Jan 2026 18:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 207DB60F05;
	Fri,  9 Jan 2026 18:38:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pJY2XPLGqzTL; Fri,  9 Jan 2026 18:38:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7445160EE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767983893;
	bh=L7yuQNGcKn/xce3ScD7r8dGFvn5E4upAZ3H4uqnDn2M=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ckMgO257qREzIOcSphe9ntcdq46zWJVOyScE/crjN5krJ/t8f9tnd1FkYGQLxygu2
	 9DrOJs8VGI2Niri/SFQApRhYhhO4jcRq0PQ/ZkxWbPxR5DEhtS4+8UaJPQOeTi4tmb
	 geGIoVAvdCmiNt9gBLOsX4Hnbbl9yFdZLY6BOAfYmJpJAG2zwCgOxyN+Wm94CB4AjT
	 zHZ6QQp43RD3s0hjpwcKArMd+8GwvaNPRV/8NAp01ppuk6dfsHF88Kz3gG9w6p4ub/
	 9ZovKZDvnKNCIrLzE9g5MsBk6RXktx0JNYjqTZxcj7KZBN2RLsz9movOSBVqiOYBaE
	 F44UYjhg6d7+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7445160EE9;
	Fri,  9 Jan 2026 18:38:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1971E12E
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 18:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 007AC40C6F
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 18:38:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0-mV_kDPCowS for <buildroot@buildroot.org>;
 Fri,  9 Jan 2026 18:38:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4E25840C50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E25840C50
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E25840C50
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 18:38:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 51E2619F574;
 Fri,  9 Jan 2026 19:38:06 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 09 Jan 2026 19:38:06 +0100
MIME-Version: 1.0
Date: Fri, 09 Jan 2026 19:38:06 +0100
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Cc: buildroot@buildroot.org, Alistair Francis <alistair@alistair23.me>
In-Reply-To: <20260109163816.131696-2-vincent.stehle@arm.com>
References: <20260109163816.131696-1-vincent.stehle@arm.com>
 <20260109163816.131696-2-vincent.stehle@arm.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <3e77ddc0be0eddfdc395f9a50cb2967a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767983888;
 bh=+DUw/UutDb+A5F/f+1hSx8IKia5cRH6IXCe8ofQMkqQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pAU71cy4HAZs8kkZEYwTCabQxLy5yN/j9zgCN9xy9WayG0rTlljvT+WIED8DpRa8O
 DuW8I5DmkFuBhLAtl8V2VPbgCbgJx7LIoXLigcEn3jgxMQ/F0727YdTQpOBny1aF/w
 eer1CBxPwpk+AFjeg1foJ0a/SbCvkRXSEL0cQeFj8KkRXyl16Ie+u+9kI/7ON+3Tmz
 FqW7s5bIQwJ856pJpMUCa87Qn6AQO4IfQ5EJqkE30/tBVKR28uKKv8JEUBIBOM/Tmn
 81egdLBuyFp8ioz9tUsygTyj44Rko2yZmVlVboEv0TW2AxFhZzr5hJ+tRe6S/ka97f
 Dgjpsnr1MBHfQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pAU71cy4
Subject: Re: [Buildroot] [PATCH 1/2] package/xen: xen tools need coreutils
 stat at runtime
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDkvMDEvMjAyNiAxNzozOCwgVmluY2VudCBTdGVobMOpIHdyb3RlOgo+IFhlbiB0b29scyBz
Y3JpcHRzIG5lZWQgdGhlIHN0YXQgcHJvZ3JhbSBmcm9tIGNvcmV1dGlscyB0byB3b3JrCj4gY29y
cmVjdGx5LCBhbmQgbm90IHRoZSBvbmUgZnJvbSBidXN5Ym94Lgo+IE9uZSBzdWNoIGV4YW1wbGUg
aXMgdGhlIC9ldGMveGVuL3NjcmlwdHMvbG9ja2luZy5zaCBzY3JpcHQsIHdoaWNoIHdpbGwKPiBj
YXVzZSB0aW1lb3V0cyBmb3Igb3BlcmF0aW9ucyBzdWNoIGFzICJ4bCBibG9jay1hdHRhY2giLCBv
ciB3aGVuCj4gc3RhcnRpbmcgYSBEb21VIHdpdGggYSBkaXNrLgo+IAo+IEFkZCB0aGUgZGVwZW5k
ZW5jeSBvbiBjb3JldXRpbHMgdG8gZml4IHRoaXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogVmluY2Vu
dCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgo+IENjOiBBbGlzdGFpciBGcmFuY2lz
IDxhbGlzdGFpckBhbGlzdGFpcjIzLm1lPgoKU2VyaWVzIGFwcGxpZWQgdG8gbWFzdGVyLCB0aGFu
a3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
