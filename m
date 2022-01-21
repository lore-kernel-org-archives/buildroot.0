Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E0FC433F5
	for <buildroot@archiver.kernel.org>; Fri, 21 Jan 2022 10:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 160C6405BB;
	Fri, 21 Jan 2022 10:15:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o8mFDt5-15NE; Fri, 21 Jan 2022 10:15:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16F66405A5;
	Fri, 21 Jan 2022 10:15:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BCE0D1BF2FD
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 10:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A537B60F84
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 10:15:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zSuEXrWMr4oq for <buildroot@lists.busybox.net>;
 Fri, 21 Jan 2022 10:15:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FEFD60F15
 for <buildroot@buildroot.org>; Fri, 21 Jan 2022 10:15:01 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id AqwXnINQRz0d2AqwZnzEwg; Fri, 21 Jan 2022 11:14:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642760099; bh=tUKkYnSwlt1c2PEMjXlQ4ueYJwoY1pcSe1gojR+Wp+w=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=HWHnGhzAplGh0BYnToiF5Io9Zs9rCe6B2oroBvJuX36wKSlLKUepjcPkS+pQTropi
 yFIVr8DDCVNy5SC/TD6xHdEaYq6qmAYPsqtA1OXRCK/rAX/CutqRg86mJtCYnWnSeF
 838li+T39WUaYGpoxdB5pBvvb5yzlraiZMpmAo9Vi36cDUS0zJIwNq3rVgEbdQpIhr
 seAmSVhY5fOYMHPANDHebCjLAXuU7UU2xeiRSLTYx2l2xuC17VrjxeuUm8ipxeNYyM
 fWjB0aJG9CWclDiUiEHWkob9soErvl8anD/f/GWilNyBOyXn0RCEVJwYVXNdodCNt3
 o5n+LSLj0yNZA==
To: Sergey Kuzminov <kuzminov.sergey81@gmail.com>, buildroot@buildroot.org
References: <70BDD76B-E7F2-44C0-A90B-0FABCFD8755D@benettiengineering.com>
 <20220118063531.2039729-1-giulio.benetti@benettiengineering.com>
 <834ad33f-d02f-4663-8e99-4bc939cbb9f6@gmail.com>
 <d938c62f-58f6-4b53-3d47-a4dd4617b533@benettiengineering.com>
 <48d2b6c8-356d-419a-c284-e2184509d1c5@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <2ba595af-2fe2-bcfd-5c3f-f3b7b77cbef9@benettiengineering.com>
Date: Fri, 21 Jan 2022 11:14:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <48d2b6c8-356d-419a-c284-e2184509d1c5@gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfMJgxmoPZtbZAdlZ5gP2lJZ9nLHNnrRyJaQMaYlslyl16dvQP7Pd3aUqvGdecFzutiRzbU8sbUNGBEPqdfX4m8wpSF4VnbdCKP47dXTlH5n3IvDlKLOf
 LA8RPBkrb7nThWbEN7HElqVoDpmjrsZcpOGb1oXZ4I+UIqzDMC43/+Reu79RkqQPpjsAV7zJTfoWyFQTN8k5RJU1EhpAW7+vHxhclIfUggRIUVDgD1xP/tZ5
 Bgmsi+0XgpMZa/7rJZzdEw==
Subject: Re: [Buildroot] [PATCH v2] package/xr819-xradio: add patch to build
 with Linux >= 5.13
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWxsLAoKcGxlYXNlIGRyb3AgdGhpcyBwYXRjaCBzaW5jZSB0aGUgbG9jYWwgcGF0Y2ggaGFz
IGJlZW4gdXBzdHJlYW1lZDoKaHR0cHM6Ly9naXRodWIuY29tL2ZpZnRlZW5oZXgveHJhZGlvL2Nv
bW1pdC80ODczNzQ2ZmE5ZDQyYThlZGJjMWUxOTI4OTllMDBjMjllZDNkMzJhCgpTbyBJJ20gZ29p
bmcgdG8gc2VuZCBhIHBhY2thZ2UgYnVtcCBzb29uIHRoYXQgSSBhc2sgU2VyZ2V5IHRvIHRlc3Qu
CgpUaGFuayB5b3UhCkJlc3QgcmVnYXJkcwotLSAKR2l1bGlvIEJlbmV0dGkKQmVuZXR0aSBFbmdp
bmVlcmluZyBzYXMKCk9uIDE4LzAxLzIyIDE5OjEwLCBTZXJnZXkgS3V6bWlub3Ygd3JvdGU6Cj4g
VGVzdGVkLWJ5OiBTZXJnZXkgS3V6bWlub3YgPGt1em1pbm92LnNlcmdleTgxQGdtYWlsLmNvbT4K
PiAKPiAxOC4wMS4yMDIyIDIwOjUzLCBHaXVsaW8gQmVuZXR0aSDQv9C40YjQtdGCOgo+PiBIaSBT
ZXJnZXksCj4+Cj4+IE9uIDE4LzAxLzIyIDE4OjQ1LCBTZXJnZXkgS3V6bWlub3Ygd3JvdGU6Cj4+
PiBIaSBBbGwsIEdpdWxpby4KPj4+IEkgY2hlY2tlZCB0aGUgcGF0Y2gsIGV2ZXJ5dGhpbmcgd29y
a3MuCj4+Cj4+IENhbiB5b3UgcGxlYXNlIHBsYWNlIHlvdXI6Cj4+IFRlc3RlZC1ieTogTmFtZSBT
dXJuYW1lIDxlLW1haWw+Cj4+ID8KPj4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
