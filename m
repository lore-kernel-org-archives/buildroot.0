Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937DACCFA1A
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 13:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3AA560831;
	Sun,  9 Nov 2025 13:25:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kfIGmGVdye0Q; Sun,  9 Nov 2025 13:25:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F118607E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F118607E7;
	Sun,  9 Nov 2025 13:25:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0519A25D
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 13:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 028D0806E7
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 13:25:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FOuwN3tbobze for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 13:25:07 +0000 (UTC)
X-Greylist: delayed 965 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 09 Nov 2025 13:25:03 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 09D2B80685
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09D2B80685
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=2a02:2350:5:505::1;
 helo=mailrelay-egress18.pub.mailoutpod2-cph3.one.com;
 envelope-from=ayoub.zaki@embetrix.com; receiver=<UNKNOWN> 
Received: from mailrelay-egress18.pub.mailoutpod2-cph3.one.com
 (mailrelay-egress18.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:505::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09D2B80685
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 13:25:03 +0000 (UTC)
X-HalOne-ID: 3d93a652-bd6d-11f0-ac1d-fb5fec76084d
Received: from [IPV6:2a02:3102:8c10:1ae0:72ec:3970:1e4b:e6b3]
 (dynamic-2a02-3102-8c10-1ae0-72ec-3970-1e4b-e6b3.310.pool.telefonica.de
 [2a02:3102:8c10:1ae0:72ec:3970:1e4b:e6b3])
 by mailrelay3.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
 id 3d93a652-bd6d-11f0-ac1d-fb5fec76084d;
 Sun, 09 Nov 2025 13:08:53 +0000 (UTC)
Message-ID: <1c677011-9c6e-483c-ab4f-93480d7fdd69@embetrix.com>
Date: Sun, 9 Nov 2025 14:08:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
From: Ayoub Zaki <ayoub.zaki@embetrix.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1762693734; x=1763298534; 
 d=embetrix.com; s=rsa1;
 h=content-transfer-encoding:content-type:subject:from:to:mime-version:date:
 message-id:from;
 bh=UV6HglnPjYqaGY+uE/XFAZbDP7EuQ2niReK+jLZ5Hb8=;
 b=su2q636nAb3sV1t2O+BqnatgpL83R37LSUaI8fLFKFSoV5xVFMcoJQyZP+V6DXZY+ZJ2pMrZIHCLY
 YDukRUbovvWR4iajvm6RZPjegAiXTp8R91umPy3vrfBzhs2NMGQ398X8xUMTWMrXXYXXF7/iwaZQfx
 adJeHTPYeSnyso/xpLYeY9APjj1hmGauWoV9JBjU/FqYBaagHxbkz2nX7BWzoslIsR2zKgbrIfOuFE
 YknFvN97nzlI5HLswFc3r0QT5VLfbnS5+oZ8YldlfbaW3iyKPMOMLwxY6SuG0Dy1IzhudcG++Jzd01
 V0aY9DO/QsDbq2VF26HfsIMd0zpidDw==
X-Mailman-Original-DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 t=1762693734; x=1763298534; 
 d=embetrix.com; s=ed1;
 h=content-transfer-encoding:content-type:subject:from:to:mime-version:date:
 message-id:from;
 bh=UV6HglnPjYqaGY+uE/XFAZbDP7EuQ2niReK+jLZ5Hb8=;
 b=4QwoncSNNZ6RtDSS94A7DhwObVH5fv/e6IFLa6ft3S4wjK6jIl44uLXDcIs9ZygW5WNhhEF7AURPQ
 0g9CnORBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=embetrix.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=embetrix.com
 header.i=@embetrix.com header.a=rsa-sha256 header.s=rsa1 header.b=su2q636n; 
 dkim=pass header.d=embetrix.com header.i=@embetrix.com header.a=ed25519-sha256
 header.s=ed1 header.b=4QwoncSN
Subject: [Buildroot] override a core package from BR2_EXTERNAL
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKV2hhdOKAmXMgdGhlIHN1cHBvcnRlZCB3YXkgdG8gZnVsbHkgb3ZlcnJpZGUgYSBj
b3JlIHBhY2thZ2UgZnJvbSAKQlIyX0VYVEVSTkFMIHdoaWxlIGtlZXBpbmcgdGhlIHNhbWUgcGFj
a2FnZSBuYW1lIHNvIHRoYXQgZGVwZW5kZW5jaWVzIApmcm9tIG90aGVyIHBhY2thZ2VzIHN0aWxs
IHdvcmsgPwoKCk1pdCBmcmV1bmRsaWNoZW4gR3LDvMOfZW4gLyBLaW5kIHJlZ2FyZHMKCi0tIApB
eW91YiBaYWtpCkVtYmVkZGVkIFN5c3RlbXMgQ29uc3VsdGFudAoKVmFpaGluZ2VyIFN0cmHDn2Ug
Mi8xCkQtNzE2MzQgTHVkd2lnc2J1cmcKCk1vYmlsZSAgIDogKzQ5MTc2NjI5MDE1NDUKRW1haWwg
ICAgOiBheW91Yi56YWtpQGVtYmV0cml4LmNvbQpIb21lcGFnZSA6IGh0dHBzOi8vZW1iZXRyaXgu
Y29tClZBVCBOby4gIDogREUzMTM5MDI2MzQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
