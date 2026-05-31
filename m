Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E70CD6E57
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 21:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A42B606B1;
	Sun, 31 May 2026 21:28:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d1NkAjmWeYkH; Sun, 31 May 2026 21:28:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 646CD6075D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780262891;
	bh=xym0FjYZkOyPXmSPAqQMxo8VS3O6Ku1MfOz89uTyGWo=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JXcMW8zrdkVwnsDGm/tNxNadis3oXYY+2cc6IqT3aLLxNHQ6OICL9vGXYaZNsVXsC
	 JYWlxKiD8THLOr1y9cBYB5vfKrO00GoVyuxywrzNLCdygXCJi8zPCXC+pwvn5nESNP
	 QQ5jtJC5UfSitGOBF54CwMGrqScrB7UgeZJHDfTGGZ76UVcTUt19Q3klz7w3HqaYGD
	 RhLs8NaW0Cr0iMJ0AcCBgokU3CLScgOwUk1pjuw8OlP93sUHcFs0mo0QbDFB942Yti
	 +hzvl/+tBHt2MD6XTp+zFYo4U3dihnczzPe3mn9/7Ud3hdRdRjAHT07MfH60UYK9Xh
	 sJZ57ePExoXfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 646CD6075D;
	Sun, 31 May 2026 21:28:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CF485257
 for <buildroot@buildroot.org>; Sun, 31 May 2026 21:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C10646075D
 for <buildroot@buildroot.org>; Sun, 31 May 2026 21:28:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QI5x4bQdMuvX for <buildroot@buildroot.org>;
 Sun, 31 May 2026 21:28:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::935; helo=mail-ua1-x935.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9AE56606B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AE56606B1
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com
 [IPv6:2607:f8b0:4864:20::935])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9AE56606B1
 for <buildroot@buildroot.org>; Sun, 31 May 2026 21:28:08 +0000 (UTC)
Received: by mail-ua1-x935.google.com with SMTP id
 a1e0cc1a2514c-9639f50efc6so2170966241.1
 for <buildroot@buildroot.org>; Sun, 31 May 2026 14:28:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780262887; cv=none;
 d=google.com; s=arc-20240605;
 b=FNSwzHDgsW2zcxJ+oDlBxRBGwKitCRlErzHi9FmD9W61IqexA3BGKuK7gDk/FFfK0M
 XRstttVLUHBofivKzw5W8YnwSUf1nFQ7ninbYn/tORv8tjVvm88ozls+qoxty1qQwC2o
 cfkFriftM9M3ZrLYI0dZJJpJ1dFUwrtbDtMKPIDEpXp7p0lz9nQhnzCFhlhjb7xalqvP
 Ll9cD+Q5jA0X4erc7neiY+FjpM7VfCAM+P2jGnnDihgi+CLKjsZDjsKNmHOhdpqb2fc8
 tgyeCMsn4jRBd1G4vYwFwSJnLpdV0kxtpVvu9keKHvTkGmTfpmUFrU6DCJl+YWLC+GjK
 vTmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=rmUDwQqP08U9LtCwXb0un8l+A+lSY3403rG+qdbBN2A=;
 fh=+f3U4CSVE/IxKOJklstpZrq+i19ILBslJ/jGhl6HbT4=;
 b=jZKUjV54lIdLs1Vo5/3HMD1cU0XLb7uvj7rw00GV4I8g2mcLz1lgsycZRxCzPovpAy
 EOrw6EqHNdMrzFaQSax+/VRDX8UOXAzMyvbQFw3bqAbqqKOVWmiEOqodabu8dsCw3rv2
 52+Sy/ljfgWm8ZziUWmUdypf0PpM3DlIawiDJPLalQcV6VGHGEd+Icl6ly41rsZbOYFp
 UltwvOs/P+9rUHj0kCUxBG1GJDiNrC9jH38gyzGfyrvZwrkbqskgsUHlaM62vM5k20bL
 oW3J9DvQktesIZz4zNRKg+F5fbBw++YGMfA5qO+NfRSzDwE3AU+1bcGFut6phtBOof75
 rw6Q==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780262887; x=1780867687;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rmUDwQqP08U9LtCwXb0un8l+A+lSY3403rG+qdbBN2A=;
 b=aoyue98QdbvszrUOMwRGgCRNwmQNi6EoxuxQcxwq579mHHoidLtaW0tWNguB12bup2
 qIa+u9fcEZ/RE/ZlLNmpJ5K1zksdahLWg0eVnEL9xdNRpo7KcKrdTfKp1QORgmseeX7+
 oxFGG0ZcHp3vTRyP0xrpt//24i/TzYU41yLytkJnY43X/5x/CCsvugfalJ3+9sd+5v21
 RSWN63vy3ITU9v8fVRhWXCxp4vx6kK+yg3mXjPcoy8ZeWo5Nwfg1ycivOoTwowoondKr
 MyAM3P4b1r0cZ3hT+CaHJhJhzOfRC1eVMItq9BB/LjX16stZQtge6uqLRbJ/qWPbk6PZ
 LGaw==
X-Gm-Message-State: AOJu0YxsyOjt9dHAeMeyXXwz8iewwbkDGlIhb5FtDNqVOH7NiueVdp+i
 KW0KQYDIWUKB2swi2DxRx42uMJ3vAAyHFD0ABsDsZvWbJ9YEbnGxNi6p0BfiFwVxN2qD2qLgM8I
 6OFPeJKhZdqBmrFpjQJNqjV2HrLONEvpMKwYIFx0=
X-Gm-Gg: Acq92OGKzrYyKlxhMt/swpl01KJgr0UjetvVmOvxnP/yQMgBR8YEU/cI5/8vmO1lc1W
 mxUfvIVx6b+xm2186ZuHM6yuN3g4FTOQmec66+QzpU/rU1bVcIN+NPRyapYzlDw+iDX9UVCzWWh
 k1JKhwgCwCKePQrAgiVa64TR0gsdAgo3TqK1dOxCxV495ZxOzIz9RSMUsmBSX4LcAbBOTlWN0n6
 /RSwmp3t3Gt5cN0Ti+jTIJbeWQRiHvrKwRituVheH8EAkaB0y2etwFnsqK3pJkCkZ3KMcRC8MaZ
 QWz+rCmb2QPcnk2c/PaPZgmi3SB2OtAMJhvlOsnA8y7UZ+Gcp8C/qiakyzBFYY1a6zmkbWXh7kD
 qQfAWFN5ABso91Cd7tPfmHBB75RpOKI7zFZg=
X-Received: by 2002:a05:6102:5044:b0:6a2:b2a1:f170 with SMTP id
 ada2fe7eead31-6c6a381ebb9mr3015818137.19.1780262886869; Sun, 31 May 2026
 14:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260529213651.548156-1-buildroot@bubu1.eu>
In-Reply-To: <20260529213651.548156-1-buildroot@bubu1.eu>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 31 May 2026 15:27:56 -0600
X-Gm-Features: AVHnY4LczuOvKXYJH1J-fdEaREa2INGW5sZuNe_UwgEZUjlD0TN0Z0vOQqo1Db8
Message-ID: <CADvTj4rJmsU8Q235UNjQT0Pu8sm4T7AomFJa7tqHbHuxqWs4aA@mail.gmail.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780262887; x=1780867687; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rmUDwQqP08U9LtCwXb0un8l+A+lSY3403rG+qdbBN2A=;
 b=KFKybj2pGKoI5wXYarUb/x1DlriXVR97jvlCofYXVFz36TY1S6umJLWqqWefTymepB
 2JDYMx0mHWTdpRfmAMmBH6QOWkKEq6tHMamCKjD/K+MdewoS3aeNIGfxIx590TF65XiA
 h8ilhKTikeb5zy/Ux43NBfRUXuH1c/5Y08KNgy5FDkCP0SzQcBTP8mfGvuSWia4kAKov
 BPxWescQ+RvAIUtACfXzHdnGeCJE4Y87+daSjQ7PRvZrODHyz5Yb5xMjKFcJjRimeYYk
 k2FUBlvu9l+0G0wPRc7euJkJ/umsyyTy4p8mG82zdhd12FmblUXCJacPLfQmj11EYWWz
 uW4Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=KFKybj2p
Subject: Re: [Buildroot] [next 1/2] package/pkg-download: add pypi helper
 for downloading packages from pypi.org
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

T24gRnJpLCBNYXkgMjksIDIwMjYgYXQgMzozN+KAr1BNIE1hcmN1cyBIb2ZmbWFubiB2aWEgYnVp
bGRyb290CjxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cj4KPiBQeXBpIHByb3ZpZGVz
IHBhY2thZ2VzIHVuZGVyIGEgc3RhYmxlIHVybCAoaW5zdGVhZCBvZiB0aGUgaGFzaCBiYXNlZCBv
bmUKPiB0aGF0IGNoYW5nZXMgZXZlcnkgdmVyc2lvbikgYnV0IHdlIGRvbid0IGN1cnJlbnRseSBt
YWtlIHVzZSBvZiB0aGF0IGEgbG90LgoKT2ZmaWNpYWwgZ3VpZGFuY2UgYXBwZWFycyB0byByZWNv
bW1lbmQgdXNpbmcgdGhlIGhhc2ggYmFzZWQgdXJsJ3MKcmV0dXJuZWQgYnkgdGhlIEFQSSdzOiBo
dHRwczovL2RvY3MucHlwaS5vcmcvYXBpLyNvZmZpY2lhbC1ndWlkYW5jZQoKRnJvbSBteSByZWFk
aW5nIHByZWRpY3RhYmxlIHVybHMgYXJlIG1vcmUgb2YgYSBmYWxsYmFjayBvcHRpb24gYnV0IGFy
ZQpvbmx5IHJlY29tbWVuZGVkIGlmIHVzaW5nIHRoZSBoYXNoIGJhc2VkIHVybHMgaXMgbm90IHBy
YWN0aWNhbC9wb3NzaWJsZToKaHR0cHM6Ly9kb2NzLnB5cGkub3JnL2FwaS8jcHJlZGljdGFibGUt
dXJscwoKRnJvbSBteSB1bmRlcnN0YW5kaW5nIHVzaW5nIHByZWRpY3RhYmxlIHVybHMgaW50cm9k
dWNlcyBhIGRlcGVuZGVuY3kKb24gdGhlIGNvbnZleW9yIHNlcnZpY2UgYW5kIGludHJvZHVjZXMg
YW4gYWRkaXRpb25hbCByZXF1ZXN0IGR1ZSB0bwpoYXZpbmcgdG8gZm9sbG93IGEgMzAyIHJlZGly
ZWN0IHNpbmNlIHRoZSBzdGFibGUgdXJsIGlzIG5vdCB0aGUgcmVhbCBDRE4gdXJsLgoKPiBJbnRy
b2R1Y2UgYSBweXBpIGhlbHBlciBmdW5jdGlvbiBhbmFsb3Vnb3VzIHRvIHRoZSBnaXRodWIgYW5k
IGdpdGxhYgo+IGhlbHBlcnMgdG8gbWFrZSBpdCBlYXNpZXIgdG8gZG93bmxvYWQgcGFja2FnZXMg
ZnJvbSBweXBpIHVzaW5nIHRoaXMgdXJsCj4gc2NoZW1lLgoKVGhlcmUgYXJlIG90aGVyIGRvd25z
aWRlcyB0byB0aGUgY29udmV5b3Igc2VydmljZSBzdWNoIGFzIGxlc3Mgc3RhYmlsaXR5Cmd1YXJh
bnRlZXMgZm9yIGRvd25sb2FkIGF2YWlsYWJpbGl0eSBkdWUgdG8gaXQgZXNzZW50aWFsbHkgYmVp
bmcgYSBweXBpIEFQSQpkZXBlbmRlbnQgc2VydmljZSBmcm9tIG15IHVuZGVyc3RhbmRpbmcuCgpG
b3IgZXhhbXBsZSBmb3IgcHltYXpkYS0wLjMuMTEudGFyLmd6IHRoZSBub3JtYWwgaGFzaCBiYXNl
ZCBDRE4gdXJsCndvcmtzOgpodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMv
YzgvOTgvNmRhNzVlYTkyNmU0YjM1NjY4MjNmY2YxNjQxMTRiOTMyZDljNGRlOTE1ZTE0MTJmMWUw
ZmEwMTZhYjU4L3B5bWF6ZGEtMC4zLjExLnRhci5negoKVGhlIGVxdWl2YWxlbnQgcHJlZGljdGFi
bGUgdXJsIGdpdmVzIGEgNDA0IGR1ZSB0byB0aGUgcGFja2FnZSBiZWluZwp1bmF2YWlsYWJsZSBm
cm9tIHRoZSBjb252ZXlvciBzZXJ2aWNlIGR1ZSB0byB0aGUgcGFja2FnZSBhdXRob3IgZGVsZXRp
bmcKdGhlIHBhY2thZ2UgYXQgc29tZSBwb2ludCh3aGljaCBtYWtlcyBpdCB1bnNlYXJjaGFibGUg
YnV0IGtlZXBzIHRoZQpzb3VyY2VzIGl0c2VsZiBhdmFpbGFibGUgaW4gdGhlIENETik6Cmh0dHBz
Oi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy9zb3VyY2UvcC9weW1hemRhL3B5bWF6
ZGEtMC4zLjExLnRhci5negoKRm9yIGJ1aWxkcm9vdCBJIHRoaW5rIGl0IG1ha2VzIHNlbnNlIHRv
IHVzZSB0aGUgbW9yZSBzdGFibGUgaGFzaCBiYXNlZApDRE4gdXJsJ3MgYXMgdGhvc2Ugc2hvdWxk
IGJlIHVuYWZmZWN0ZWQgYnkgcHJvamVjdC9weXBpIHBhY2thZ2UgZGVsZXRpb24KYW5kIGF2b2lk
IGFuIHVubmVjZXNzYXJ5IHJlZGlyZWN0IGFzIHdlbGwgYXMgYmVpbmcgdGhlIHJlY29tbWVuZGVk
IHVybAp0byB1c2UgYnkgcHlwaS4KCj4gRm9yIHRoYXQgd2UgaW50cm9kdWNlIGEgZmlyc3RjaGFy
IGZ1bmN0aW9uICh3cml0dGVuIGJ5IFBldGVyKSB3aGljaAo+IHJldHVybnMgdGhlIGZpcnN0IGNo
YXJhY3RlciBpbiBhIHN0cmluZyB3aXRob3V0IHNwYXduaW5nIGEgc2hlbGwuCj4KPiBDby1kZXZl
bG9wZWQtYnk6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBNYXJjdXMgSG9mZm1hbm4gPGJ1aWxkcm9vdEBidWJ1MS5ldT4KPiAtLS0KPiAgcGFj
a2FnZS9wa2ctZG93bmxvYWQubWsgfCAzICsrKwo+ICBzdXBwb3J0L21pc2MvdXRpbHMubWsgICB8
IDMgKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9wa2ctZG93bmxvYWQubWsgYi9wYWNrYWdlL3BrZy1kb3dubG9hZC5tawo+IGlu
ZGV4IGNlNjNjZTk2NTguLjE2MGM1MTI1OTkgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9wa2ctZG93
bmxvYWQubWsKPiArKysgYi9wYWNrYWdlL3BrZy1kb3dubG9hZC5tawo+IEBAIC01Niw2ICs1Niw5
IEBAIGdpdGh1YiA9IGh0dHBzOi8vZ2l0aHViLmNvbS8kKDEpLyQoMikvYXJjaGl2ZS8kKDMpCj4g
ICMgZ2l0bGFiKHVzZXIscGFja2FnZSx2ZXJzaW9uKTogcmV0dXJucyBzaXRlIG9mIEdpdGxhYi1n
ZW5lcmF0ZWQgdGFyYmFsbAo+ICBnaXRsYWIgPSBodHRwczovL2dpdGxhYi5jb20vJCgxKS8kKDIp
Ly0vYXJjaGl2ZS8kKDMpCj4KPiArIyBweXBpKHBhY2thZ2UpOiByZXR1cm5zIHNpdGUgb2YgcHlw
aS5vcmcgaG9zdGVkIHBhY2tnZQo+ICtweXBpID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQu
b3JnL3BhY2thZ2VzL3NvdXJjZS8kKGNhbGwgZmlyc3RjaGFyLCQoMSkpLyQoMSkKPiArCj4gICMg
RXhwcmVzc2x5IGRvIG5vdCBjaGVjayBoYXNoZXMgZm9yIHRob3NlIGZpbGVzCj4gIEJSX05PX0NI
RUNLX0hBU0hfRk9SID0KPgo+IGRpZmYgLS1naXQgYS9zdXBwb3J0L21pc2MvdXRpbHMubWsgYi9z
dXBwb3J0L21pc2MvdXRpbHMubWsKPiBpbmRleCA1Mjc1MDA2ZDZkLi4zY2FmMDYyNzRmIDEwMDY0
NAo+IC0tLSBhL3N1cHBvcnQvbWlzYy91dGlscy5tawo+ICsrKyBiL3N1cHBvcnQvbWlzYy91dGls
cy5tawo+IEBAIC02Miw2ICs2Miw5IEBAIGVuZGVmCj4gICQoZXZhbCAkKGNhbGwgY2FzZWNvbnZl
cnQtaGVscGVyLFVQUEVSQ0FTRSwkKGpvaW4gJChhZGRzdWZmaXggOiwkKFtGUk9NXSkpLCQoW1RP
XSkpKSkKPiAgJChldmFsICQoY2FsbCBjYXNlY29udmVydC1oZWxwZXIsTE9XRVJDQVNFLCQoam9p
biAkKGFkZHN1ZmZpeCA6LCQoW1RPXSkpLCQoW0ZST01dKSkpKQo+Cj4gKyMgZXh0cmFjdHMgdGhl
IGZpcnN0IGNoYXJhY3RlciBvZiBhIHN0cmluZwo+ICtmaXJzdGNoYXIgPSAkKGlmICQoMSksJChz
dHJpcCAkKGZvcmVhY2ggYywkKFtGUk9NXSkgLyAkKFtUT10pLCQoaWYgJChwYXRzdWJzdCAkKGMp
JSwsJCgxKSksLCQoYykpKSkpCj4gKwo+ICAjIFJldmVyc2UgdGhlIG9yZGVycyBvZiB3b3JkcyBp
biBhIGxpc3QuIEFnYWluLCBpbnNwaXJlZCBieSB0aGUgZ21zbAo+ICAjICdyZXZlcnNlJyBtYWNy
by4KPiAgcmV2ZXJzZSA9ICQoaWYgJCgxKSwkKGNhbGwgcmV2ZXJzZSwkKHdvcmRsaXN0IDIsJCh3
b3JkcyAkKDEpKSwkKDEpKSkgJChmaXJzdHdvcmQgJCgxKSkpCj4gLS0KPiAyLjU0LjAKPgo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290
IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
