Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D047CC433F5
	for <buildroot@archiver.kernel.org>; Sat, 29 Jan 2022 19:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E75340880;
	Sat, 29 Jan 2022 19:46:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2lm6Pq9yhjS5; Sat, 29 Jan 2022 19:46:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A87D74087D;
	Sat, 29 Jan 2022 19:46:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 642BF1BF3DC
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 19:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 516C0400F1
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 19:46:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id igkuucOOKoqz for <buildroot@lists.busybox.net>;
 Sat, 29 Jan 2022 19:46:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A919400E4
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 19:46:35 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Dtg9nAIO7iF0aDtg9nhVOP; Sat, 29 Jan 2022 20:46:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643485594; bh=8wr4bEpDr8KVx67QMAcUTcZPN6MqIDESiiLjVwZAURQ=;
 h=Date:MIME-Version:Subject:From:To:Content-Type;
 b=hnIClXG+mtDGOQ8ISLJnF1c/M9weS1DOoySArxOSJMwtN4tLK3+D+Aehe/3pPg3th
 ucRfKsgdk6y9TT5l/r2R8SZhIubR5L6R/xge9X1exhig5UEoLlznMUCXEmkZ2qjfHI
 FZq6v8wtXsJ0EwC6jcCRMnKfwOcAlumYqB1UE76Djc1VoODmjKoQerg5H52WpJ8BRZ
 HkscKHNk4hj/6uzr2g9Us5CNnVALAIcM+j/7l39vJHB+bAZdrj4CtM3wtSTCtqqGBq
 8mzmQHdxoO/FWIl5v1FOhEXkYDJt9CJ2aFeZhfHlxhzlICvXKd0zjjkzWCIkJIF9R+
 b8LksWqUZZudg==
Message-ID: <db57ab75-3fa3-40e7-f280-817147d20f75@benettiengineering.com>
Date: Sat, 29 Jan 2022 20:46:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
References: <CAOf5uwkHPx7rh5H7=zeFpkNMSj47=0vMfPO0P8oSZKnwhh8q9A@mail.gmail.com>
 <6D05417C-EE4C-4145-BDB2-5CD9AC5A39A5@benettiengineering.com>
In-Reply-To: <6D05417C-EE4C-4145-BDB2-5CD9AC5A39A5@benettiengineering.com>
X-CMAE-Envelope: MS4wfA9JRi/cZcko2Zd+IpqvF1mBMnD+Iycwhkg+YjXXPAeWkr4KSyyiau0sGPXS0HhA/Ec4BPk5zWxnnXpN13W/jZdMRjHzbxh4f4665TOcdB7E59MsfZph
 gea/tCxmgEhWHPO6rN7oU7gD38Xmvmt/fIOM/7F5ajIaNpuRLADmeRXpDLpryfQTZqrPaOAIkZH0NrX2JDZJfRPNLYbm2rbrtfpHXLzWl845ouX5DS4HEoIn
 RPCFFAWfl95bBXIe6UsnKv8PGTW2SLrxWIclTB2fRYFSvL5B/FgO6cTJf/uEhg8X6sHnhq7M2z7IhwNI7Chv/zL/QEFfXMap+swbPfqGjns=
Subject: Re: [Buildroot] [PATCH] board: Add support for iMX8MN BSH SMM S2 PRO
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTWljaGFlbCwKCk9uIDI5LzAxLzIyIDE0OjU0LCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKW1NO
SVBdCgo+Pj4gSGF2ZSB5b3UgZ2l2ZW4gYSBnbyB3aXRoIGxhdGVzdCBCdWlsZHJvb3QgZG9ja2Vy
IHRvIGNoZWNrIGlmIHVib290IAo+Pj4gbmVlZHMgbGliZmR0cHksIHB5dGhvbjMgZXRjLj8KPj4+
IEl04oCZcyBoaWdobHkgcHJvYmFibGUgaXQgbmVlZHMgdGhlbS4KPj4KPj4gU3VnZ2VzdGlvbiwg
c2hvdWxkIGJlIGdpdmVuIHRvIHRoZSBvdGhlciBuZXdlc3QgYm9hcmQgdGhhdCB3YXMgYWRkZWQu
Cj4gCj4gQ29ycmVjdCwgSeKAmW0gZ29pbmcgdG8gY2hlY2sgbXkgbGF0ZXN0IGJvYXJkIHJldmll
d3MgYWJvdXQgdGhpcwoKSSd2ZSBwb2ludGVkIHRoZW0gdGJoCgo+PiBJIHRoaW5rIHRoYXQgeW91
IGFyZSB0YWxraW5nIGFib3V0Cj4+IGhvc3QtdG9vbHMgaGVyZS4gCj4gCj4gWWVzCj4gCj4+IFBs
ZWFzZSBwb2ludCBtZSB0byB0aGlzIGJ1aWxkcm9vdCBkb2NrZXIKPiAKPiBodHRwczovL2h1Yi5k
b2NrZXIuY29tL3IvYnVpbGRyb290L2Jhc2UvdGFncyAKPiA8aHR0cHM6Ly9odWIuZG9ja2VyLmNv
bS9yL2J1aWxkcm9vdC9iYXNlL3RhZ3M+Cj4gIyBkb2NrZXIgcHVsbCBidWlsZHJvb3QvYmFzZToy
MDIxMTEyMC4xOTI1CgpUaGlzIGlzIG5vdCBjb3JyZWN0LCBzb3JyeSwgSSd2ZSBqdXN0IGdpdmVu
IGEgdHJ5IGFuZCBpdCBidWlsZHMgCmNvcnJlY3RseSBldmVuIGlmIGl0IGZhaWxzIHdpdGggZ2l0
bGFiIENJLgpZb3UgaGF2ZSB0byB1c2UgdGhpcyBkb2NrZXI6CmRvY2tlciBwdWxsIGJ1aWxkcm9v
dC9iYXNlOjIwMjEwOTIyLjIyMDAKCkJlc3QgcmVnYXJkcyEKLS0gCkdpdWxpbyBCZW5ldHRpCkJl
bmV0dGkgRW5naW5lZXJpbmcgc2FzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
