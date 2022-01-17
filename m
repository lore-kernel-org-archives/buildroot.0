Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B82BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 21:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADD7860AA1;
	Mon, 17 Jan 2022 21:08:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EGPc7RLBj5HL; Mon, 17 Jan 2022 21:08:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C29F760ABA;
	Mon, 17 Jan 2022 21:08:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1806F1BF388
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 21:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0488B4031F
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 21:08:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eElnSjHotbGx for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 21:08:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FE5C4031E
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 21:08:21 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9ZEinDsMJBBmw9ZEinwtVq; Mon, 17 Jan 2022 22:08:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642453700; bh=Ox6tDOi8pqwHLJm8Kz9T4DnNMyYFBJMnxTQVfPmD0e0=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=ME6jvfHccVRCbPSwJl3Pm8D6LkdWaM/QRcbuEGM7udb/gX2uXb2CyBI+OzwpbdOSh
 zpJvxTtNrbdP7idS5pxiSwwJFO4QYr0vxO4uZ6Vf17HUICNH4X0HigTafjVRQz6cCc
 pNrqzW4IRE2w0/Kxrf4Plr5zW+ceNVAKIIQCt/eqlpx59lq//QpXpqN5RwZYUma7Zk
 WSnQ0OFMauCWwer1ymyB3hxr58WGxi8otoJDSxLJYUMn35oTFGeGqcprpQAYjAQkLB
 680r25T03Us3CTVfJHWKzr7eDPNeftOMB/mkGGi34cAmDrImqZQirK8Vs5m6iF855j
 N75ZOD0eIF2dA==
To: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
References: <20220116112600.28441-1-kuzminov.sergey81@gmail.com>
 <300B22A3-0051-4FF0-8B59-499BC08C6A7C@benettiengineering.com>
 <78e0fe75-0ecc-51ce-6270-d6f228cfdbaf@gmail.com>
 <759da9ea-e1b8-353c-9745-1f9d91038f08@benettiengineering.com>
 <5abde9b8-d7de-ceb7-10bb-136f3f5992f1@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <4da691a9-cdba-1a3c-0aed-f2b8ac072e0d@benettiengineering.com>
Date: Mon, 17 Jan 2022 22:08:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <5abde9b8-d7de-ceb7-10bb-136f3f5992f1@gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfDFrODq+jl35DNjAGoZ2TdCeyipVB+AdLSV3SIoWkXsBwqo6LDWMd+AK1ClRMNeIfVw1fupSrx4xbDzQmqUNmH6Ucdc/+UByzDKfMbHOVtYs2UY9B5j4
 uT1U6VIkjfZr+Pi83V27nWrjeUm1tlWo8FsLxOuQipkeIQucU4He7agBjtPIcIlEUtRHD9JBe7l4UpqBQ1lWigmaDP9mYsn+DUCgdJ/QYUWsa5ba9b3ZMGC/
 XlUR5b0HTETuMb0U9PqA6Q==
Subject: Re: [Buildroot] [PATCH] board/orangepi/orangepi-zero:extlinux,
 refactoring
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgU2VyZ2V5LAoKcGxlYXNlIGtlZXAgTUwgaW4gQ2MsCgpPbiAxNy8wMS8yMiAyMTo1NiwgU2Vy
Z2V5IEt1em1pbm92IHdyb3RlOgo+IEhpLCBHaXVsaW8uIFdpZmkgaXMgd29ya2luZywgdGhhbmtz
Lgo+IAo+ICMgdW5hbWUgLWEKPiBMaW51eCBPcmFuZ2VQaV9aZXJvIDUuMTYuMSAjMSBTTVAgTW9u
IEphbiAxNyAyMTo0Njo0NSBNU0sgMjAyMiBhcm12N2wKPiBHTlUvTGludXgKPiAjIGl3Y29uZmln
Cj4gbG/CoMKgwqDCoMKgwqDCoCBubyB3aXJlbGVzcyBleHRlbnNpb25zLgo+IAo+IGV0aDDCoMKg
wqDCoMKgIG5vIHdpcmVsZXNzIGV4dGVuc2lvbnMuCj4gCj4gd2xhbjDCoMKgwqDCoCBJRUVFIDgw
Mi4xMcKgIEVTU0lEOiJBRkQ3REYiCj4gICDCoMKgwqDCoMKgwqDCoMKgwqAgTW9kZTpNYW5hZ2Vk
wqAgRnJlcXVlbmN5OjIuNDUyIEdIesKgIEFjY2VzcyBQb2ludDoKPiAyQzpDODoxQjo0QzpFMTpG
Mwo+ICAgwqDCoMKgwqDCoMKgwqDCoMKgIEJpdCBSYXRlPTI2IE1iL3PCoMKgIFR4LVBvd2VyPTIw
IGRCbQo+ICAgwqDCoMKgwqDCoMKgwqDCoMKgIFJldHJ5IHNob3J0IGxpbWl0OjfCoMKgIFJUUyB0
aHI6b2ZmwqDCoCBGcmFnbWVudCB0aHI6b2ZmCj4gICDCoMKgwqDCoMKgwqDCoMKgwqAgRW5jcnlw
dGlvbiBrZXk6b2ZmCj4gICDCoMKgwqDCoMKgwqDCoMKgwqAgUG93ZXIgTWFuYWdlbWVudDpvbgo+
ICAgwqDCoMKgwqDCoMKgwqDCoMKgIExpbmsgUXVhbGl0eT0yOC83MMKgIFNpZ25hbCBsZXZlbD0t
ODIgZEJtCj4gICDCoMKgwqDCoMKgwqDCoMKgwqAgUnggaW52YWxpZCBud2lkOjDCoCBSeCBpbnZh
bGlkIGNyeXB0OjDCoCBSeCBpbnZhbGlkIGZyYWc6MAo+ICAgwqDCoMKgwqDCoMKgwqDCoMKgIFR4
IGV4Y2Vzc2l2ZSByZXRyaWVzOjTCoCBJbnZhbGlkIG1pc2M6MMKgwqAgTWlzc2VkIGJlYWNvbjow
Cj4gCj4gIyBpZmNvbmZpZwo+IGV0aDDCoMKgwqDCoMKgIExpbmsgZW5jYXA6RXRoZXJuZXTCoCBI
V2FkZHIgMDI6NDI6RkQ6NDY6MUQ6RDMKPiAgIMKgwqDCoMKgwqDCoMKgwqDCoCBVUCBCUk9BRENB
U1QgTVVMVElDQVNUwqAgTVRVOjE1MDDCoCBNZXRyaWM6MQo+ICAgwqDCoMKgwqDCoMKgwqDCoMKg
IFJYIHBhY2tldHM6MCBlcnJvcnM6MCBkcm9wcGVkOjAgb3ZlcnJ1bnM6MCBmcmFtZTowCj4gICDC
oMKgwqDCoMKgwqDCoMKgwqAgVFggcGFja2V0czowIGVycm9yczowIGRyb3BwZWQ6MCBvdmVycnVu
czowIGNhcnJpZXI6MAo+ICAgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbGxpc2lvbnM6MCB0eHF1ZXVl
bGVuOjEwMDAKPiAgIMKgwqDCoMKgwqDCoMKgwqDCoCBSWCBieXRlczowICgwLjAgQinCoCBUWCBi
eXRlczowICgwLjAgQikKPiAgIMKgwqDCoMKgwqDCoMKgwqDCoCBJbnRlcnJ1cHQ6NDMKPiAKPiBs
b8KgwqDCoMKgwqDCoMKgIExpbmsgZW5jYXA6TG9jYWwgTG9vcGJhY2sKPiAgIMKgwqDCoMKgwqDC
oMKgwqDCoCBpbmV0IGFkZHI6MTI3LjAuMC4xwqAgTWFzazoyNTUuMC4wLjAKPiAgIMKgwqDCoMKg
wqDCoMKgwqDCoCBVUCBMT09QQkFDSyBSVU5OSU5HwqAgTVRVOjY1NTM2wqAgTWV0cmljOjEKPiAg
IMKgwqDCoMKgwqDCoMKgwqDCoCBSWCBwYWNrZXRzOjAgZXJyb3JzOjAgZHJvcHBlZDowIG92ZXJy
dW5zOjAgZnJhbWU6MAo+ICAgwqDCoMKgwqDCoMKgwqDCoMKgIFRYIHBhY2tldHM6MCBlcnJvcnM6
MCBkcm9wcGVkOjAgb3ZlcnJ1bnM6MCBjYXJyaWVyOjAKPiAgIMKgwqDCoMKgwqDCoMKgwqDCoCBj
b2xsaXNpb25zOjAgdHhxdWV1ZWxlbjoxMDAwCj4gICDCoMKgwqDCoMKgwqDCoMKgwqAgUlggYnl0
ZXM6MCAoMC4wIEIpwqAgVFggYnl0ZXM6MCAoMC4wIEIpCj4gCj4gd2xhbjDCoMKgwqDCoCBMaW5r
IGVuY2FwOkV0aGVybmV0wqAgSFdhZGRyIDEyOjQyOkZEOjQ2OjFEOkQzCj4gICDCoMKgwqDCoMKg
wqDCoMKgwqAgaW5ldCBhZGRyOjE5Mi4xNjguMTAuMjQwwqAgQmNhc3Q6MTkyLjE2OC4xMC4yNTUg
TWFzazoyNTUuMjU1LjI1NS4wCj4gICDCoMKgwqDCoMKgwqDCoMKgwqAgVVAgQlJPQURDQVNUIFJV
Tk5JTkcgTVVMVElDQVNUwqAgTVRVOjE1MDDCoCBNZXRyaWM6MQo+ICAgwqDCoMKgwqDCoMKgwqDC
oMKgIFJYIHBhY2tldHM6ODggZXJyb3JzOjAgZHJvcHBlZDozNCBvdmVycnVuczowIGZyYW1lOjAK
PiAgIMKgwqDCoMKgwqDCoMKgwqDCoCBUWCBwYWNrZXRzOjE0IGVycm9yczowIGRyb3BwZWQ6MCBv
dmVycnVuczowIGNhcnJpZXI6MAo+ICAgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbGxpc2lvbnM6MCB0
eHF1ZXVlbGVuOjEwMDAKPiAgIMKgwqDCoMKgwqDCoMKgwqDCoCBSWCBieXRlczoxMzUxNiAoMTMu
MSBLaUIpwqAgVFggYnl0ZXM6MTkyNyAoMS44IEtpQikKPiAKPiAjIHBpbmcgZ29vZ2xlLmNvbQo+
IFBJTkcgZ29vZ2xlLmNvbSAoMjE2LjIzOS4zOC4xMjApOiA1NiBkYXRhIGJ5dGVzCj4gNjQgYnl0
ZXMgZnJvbSAyMTYuMjM5LjM4LjEyMDogc2VxPTAgdHRsPTEwMiB0aW1lPTU0Ljg5MCBtcwo+IDY0
IGJ5dGVzIGZyb20gMjE2LjIzOS4zOC4xMjA6IHNlcT0xIHR0bD0xMDIgdGltZT01NC4xMDIgbXMK
PiA2NCBieXRlcyBmcm9tIDIxNi4yMzkuMzguMTIwOiBzZXE9MiB0dGw9MTAyIHRpbWU9NTEuNTgz
IG1zCj4gXkMKPiAtLS0gZ29vZ2xlLmNvbSBwaW5nIHN0YXRpc3RpY3MgLS0tCj4gMyBwYWNrZXRz
IHRyYW5zbWl0dGVkLCAzIHBhY2tldHMgcmVjZWl2ZWQsIDAlIHBhY2tldCBsb3NzCj4gcm91bmQt
dHJpcCBtaW4vYXZnL21heCA9IDUxLjU4My81My41MjUvNTQuODkwIG1zCj4gCgpUaGFua3MgYSBs
b3QgZm9yIHRyeWluZy4gU28gcGxlYXNlIGJ1bXAgbGludXggdmVyc2lvbiB0byBsYXRlc3QoNS4x
Ni4xKSAKYW5kIHNlbmQgVjIgcGF0Y2guIEluIHRoZSBtZWFud2hpbGUgSSd2ZSBqdXN0IHNlbnQg
YSBwYXRjaCBmb3Igcng4MTktcmFkaW86Cmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJv
amVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMjAxMTcyMTA3MzkuMjAyMjU1MS0xLWdpdWxpby5iZW5l
dHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20vCgpTbyB3aGVuIHlvdSBzZW5kIFYyLCBwbGVhc2Ug
Y3JlYXRlIGEgY292ZXItbGV0dGVyIHdoZXJlIHlvdSBzdGF0ZSBteSAKcGF0Y2ggZm9yIHJ4ODE5
LXJhZGlvIGlzIG5lZWRlZCB0byB3b3JrLgoKVGhhbmsgeW91IQpCZXN0IHJlZ2FyZHMKLS0gCkdp
dWxpbyBCZW5ldHRpCkJlbmV0dGkgRW5naW5lZXJpbmcgc2FzCgo+IAo+IDE3LjAxLjIwMjIgMTQ6
MzgsIEdpdWxpbyBCZW5ldHRpINC/0LjRiNC10YI6Cj4+IEhpIFNlcmdleSwKPj4KPj4gT24gMTYv
MDEvMjIgMTk6MTksIFNlcmdleSBLdXptaW5vdiB3cm90ZToKPj4+IDE2LjAxLjIwMjIgMTg6Mjks
IEdpdWxpbyBCZW5ldHRpOgo+Pj4+IEhpIFNlcmdleSwgUGV0ZXIsIEFsbCwKPj4+Pgo+Pj4+ICsj
IEFyY2hpdGVjdHVyZQo+Pj4+IEJSMl9hcm09eQo+Pj4+IEJSMl9jb3J0ZXhfYTc9eQo+Pj4+IEJS
Ml9BUk1fRlBVX1ZGUFY0PXkKPj4+PiDigKZIZXJlIF5eXiB5b3UgY2FuIGVuYWJsZSBWRlArTkVP
Ti4gSXTigJlzIHdvcmtpbmcgb24gYWxsIE9saW1leCBib2FyZHMKPj4+PiB3aXRoIHN1bnhpIEE3
IGFuZCBjYW4gc3BlZWQgdGhpbmdzIHVwLgo+Pj4+Cj4+PiBIaSwgR2l1bGlvLiBJIHdpbGwgdGVz
dCwgdGhhbmtzLgo+Pj4KPj4+Cj4+Pj4+ICsjIFdpcmVsZXNzIGRyaXZlciBhbmQgZmlybXdhcmUK
Pj4+Pj4gKyMgWzE2LjAxLjIwMjJdIERvZXNuJ3QgY29tcGlsZSB3aXRoIG5ld2VyIGtlcm5lbHMg
PiA1LjEyLngKPj4+Pj4gQlIyX1BBQ0tBR0VfWFI4MTlfWFJBRElPPXkKPj4+Pj4gQlIyX1BBQ0tB
R0VfQVJNQklBTl9GSVJNV0FSRT15Cj4+Pj4+IEJSMl9QQUNLQUdFX0FSTUJJQU5fRklSTVdBUkVf
WFI4MTk9eQo+Pj4+IENhbiB5b3UgcG9pbnQgYSB0ZXN0IGNhc2U/IFRoaXMgd2F5IEkgY291bGQg
dHJ5IHRvIGZpeCBidWlsZGluZyBhbmQKPj4+PiB5b3UgY291bGQgdGVzdCBpZiBpdCB3b3Jrcy4K
Pj4+Pgo+Pj4+IFRoYW5rIHlvdQo+Pj4+IEJlc3QgcmVnYXJkcwo+Pj4+IOKAlC0KPj4+PiBHaXVs
aW8gQmVuZXR0aQo+Pj4+IEJlbmV0dGkgRW5naW5lZXJpbmcgc2FzCj4+Pj4KPj4+IFRvIGNoZWNr
LCBzZXQgdGhlIHBhcmFtZXRlcnMgaW4gdGhlIGN1cnJlbnQgdmVyc2lvbiBvZiBCdWlsZHJvb3QK
Pj4+IEJSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNV8xNT15Cj4+PiBCUjJf
TElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI1LjE1LjE1Igo+Pj4gaW4gdGhlIGNv
bmZpZ3Mvb3JhbmdlcGlfemVyb19kZWZjb25maWcgZmlsZQo+Pj4KPj4+IG1ha2Ugb3JhbmdlcGlf
emVyb19kZWZjb25maWcKPj4+IG1ha2UKPj4KPj4gSSd2ZSBmaXhlZCB0aGUgYnVpbGRpbmcgb2Yg
dGhpcyBeXl46Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9naXVsaW9iZW5ldHRpL2J1aWxkcm9vdC9j
b21taXQvNWU4YTQyMmIyMzFmMzk1ZDY2NzRhMjMxMGVmMGZmYmY2NGFiMzhkYwo+Pgo+Pgo+PiBD
YW4geW91IHRlc3QgaWYgaXQgd29ya3MgcnVudGltZT8KPj4KPj4gVGhpcyB3YXkgeW91ciBhY3R1
YWwgcGF0Y2ggY2FuIGNoYW5nZSB1c2luZyBsYXRlc3QgTGludXgoNS4xNi4xKS4KPj4KPj4gSSd2
ZSBhbHJlYWR5IG9wZW5lZCBhIFBSIGZvciB0aGF0IHBhdGNoOgo+PiBodHRwczovL2dpdGh1Yi5j
b20vZmlmdGVlbmhleC94cmFkaW8vcHVsbC8xNQo+Pgo+PiBPbmNlIG15IHBhdGNoIHdpbGwgYmUg
bWVyZ2VkIEkgd2lsbCBidW1wIHhyYWRpbyB2ZXJzaW9uIHRvIGxhdGVzdCBpbgo+PiBCdWlsZHJv
b3QuCj4+Cj4+IFRoYW5rIHlvdQo+PiBCZXN0IHJlZ2FyZHMKPiAKPiAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
