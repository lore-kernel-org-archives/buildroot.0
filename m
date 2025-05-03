Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E391EC369D9
	for <buildroot@archiver.kernel.org>; Sat,  3 May 2025 12:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A624C83ACE;
	Sat,  3 May 2025 12:46:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l96EFie0Dbfa; Sat,  3 May 2025 12:46:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D592E83AD6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D592E83AD6;
	Sat,  3 May 2025 12:46:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AEA1229
 for <buildroot@buildroot.org>; Sat,  3 May 2025 12:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C0814124A
 for <buildroot@buildroot.org>; Sat,  3 May 2025 12:46:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pmfzJozOcsJ2 for <buildroot@buildroot.org>;
 Sat,  3 May 2025 12:46:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B23DC41253
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B23DC41253
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B23DC41253
 for <buildroot@buildroot.org>; Sat,  3 May 2025 12:46:04 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:3e99:697d:40d2:a4e3] (unknown
 [IPv6:2a01:e0a:12:eba0:3e99:697d:40d2:a4e3])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 75AB3BFC45
 for <buildroot@buildroot.org>; Sat,  3 May 2025 14:46:02 +0200 (CEST)
Message-ID: <8b73289c-5ac7-4760-a906-098accf0c839@grenoble.cnrs.fr>
Date: Sat, 3 May 2025 14:46:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <BN2P110MB14301BD3BE2F37B46B7EE244E08DA@BN2P110MB1430.NAMP110.PROD.OUTLOOK.COM>
 <11ab9ce1-3c31-41f8-9f67-111bb2eb9cec@grenoble.cnrs.fr>
Content-Language: en-US, fr
In-Reply-To: <11ab9ce1-3c31-41f8-9f67-111bb2eb9cec@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1746276362;
 bh=zw1zMHI5iYjgDTLhW/04oZSyOVDsdm7SwPJnBu1avOw=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=KuFTK6JIunj0k9lWc6nhRG3aL08Q5Psrhy+3jkv8/rPwg2D3gAW4LTT8rBPYXIBZ5
 WEJ1vNMVJHCjCDSFnESsNKbqWPFmHMUCMMfI58LfaWvLsNOgVhZYdzWmWkYlCyVzMP
 um0AfoXsAJHQtLpd/F/pc0MI8FmDD+SxEaRZoNQbU+C+cY4ZmXDn7wzlPapLSI4Qho
 oV65pnrLWN08D0xDc6xf8qfMTKTM5a3U6LshMgkOELyg35nK4GkBop4vAoU4BxZB6f
 3wFEVnV/ZlwQi/CQs86INoZV+510bA920cg1djTI4Uz+P8IIP+xaakWhYjhIFhB19b
 +Pu/ZJyGP829A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=KuFTK6JI
Subject: Re: [Buildroot] Error to build Buitroot images for
 qemu_riscv64_virt_defconfig
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjAyNS0wNS0wMywgSSB3cm90ZToKPiBbcWVtdV9yaXNjdjY0X3ZpcnRfZGVmY29uZmlnXSB3
b3VsZG4ndCBib290IHRob3VnaDogdGhlIGtlcm5lbCBnb3QKPiBzdHVjayBhdCDigJxXYWl0aW5n
IGZvciByb290IGRldmljZSAvZGV2L3ZkYS4uLuKAnQoKVGhpcyB3YXMgd2l0aCB0aGUgcWVtdSBj
b21tYW5kIGZyb20gYm9hcmQvcWVtdS9yaXNjdjY0LXZpcnQvcmVhZG1lLnR4dC4KRml4ZWQgYnkg
YXBwZW5kaW5nICIsaWY9dmlydGlvIiB0byB0aGUgLWRyaXZlIG9wdGlvbjoKCiAgICBxZW11LXN5
c3RlbS1yaXNjdjY0IC1NIHZpcnQgLWJpb3Mgb3V0cHV0L2ltYWdlcy9md19qdW1wLmJpbiBcCiAg
ICAta2VybmVsIG91dHB1dC9pbWFnZXMvSW1hZ2UgLWFwcGVuZCAicm9vdHdhaXQgcm9vdD0vZGV2
L3ZkYSBybyIgXAogICAgLWRyaXZlIGZpbGU9b3V0cHV0L2ltYWdlcy9yb290ZnMuZXh0Mixmb3Jt
YXQ9cmF3LGlmPXZpcnRpbyBcCiAgICAtbmV0ZGV2IHVzZXIsaWQ9bmV0MCAtZGV2aWNlIHZpcnRp
by1uZXQtZGV2aWNlLG5ldGRldj1uZXQwIFwKICAgIC1ub2dyYXBoaWMKClJlZ2FyZHMsCgpFZGdh
ciBCb25ldC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
