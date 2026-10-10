Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6173DCA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 07:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1732606F8;
	Sat, 10 Oct 2026 07:19:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3koWm_Qf8jHf; Sat, 10 Oct 2026 07:19:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BD3FE60653
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791616755;
	b=mAvoCUOB6zO4EeEmsRbxrNlgo/BoIcftVgZ+nWtgRAwA3Pun6Qyo0d+6jwHG5jdjBTgO
	 hzrpDlUUj5WiqNd77Ngi9+dDA36vOPO2zWQh/22aVZWbpu1ubKeQrrZzOMF9103Z9o8yR
	 TiJiGue3F8PxuVk5yVQuU0uCs9pho0xlFQFSYsdV5A/dGmrl3BUzftDPM46DBM4qeEMq8
	 G53YB78shLUrDC6YCKGUFSpJbwY4D2rLsLJfNyN1YxllvMWGMN0lEWMxv4w/DQbL3QY/u
	 Qq9jKEt1GKW6BozzabU34pr0ioz8H9lhoM2SVkQYnn+0ZKnOj3E0DD65DpsdsylAXBw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791616755;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=yRjsnSxRimwujr9gSZISwJUo7+nPkD8L4/qREExMDOg=;
	b=eK2UaYUgO65HixVRZ/+pBgTZCh1emzqcDkEFyxA4q6yqzrl/liXi1PVL2iLSaLehI309
	 1tRenBU03c/pIiTUdK3QdJAHl9TIqfILBheQ/9T3A11+Qvj15LKx57+3ib/bnmlp73EW8
	 EvWr4pnEEp2dpRMctlHGxvBPA4+L5SyIHKNfC3VtNGgFUQnW1LTkXE9LuvnM2/eqHtOZe
	 qR0yZn08p9Nx0SBmmiqNX0hhUtSpNvGV7pcpz7xirLxfpuGU66rzjYEnIpKSik2XZD0ui
	 3EdgxlODJzOWkFzrcBg0jVK1CCjS/EyzJYZJpsMJKzDVxyw1iISDUE1ii0uH6ejRwvw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791616755;
	bh=yRjsnSxRimwujr9gSZISwJUo7+nPkD8L4/qREExMDOg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SyWwtcSUGjcwVElwVA7QKh5KFTXnFWnbXTM3mrLv/4gj7VvEIy8Gfj+1RxnmDawG9
	 nJwSUZ+UK/KnJc9GJpEuq6z307WnNjl7lUATH0cuCHFz2oJQAmL0ARAF1omGLwVA/b
	 WDB2p6jJnmrt42+PH5mxC9jyu6MrGGIp31H/PjPR/bUNtgkuiMDEeFnq7n/W+R7bHK
	 xR2cdz0sRun3sDV9D9HLurohrD9NxBt0nZo9CFKR1dv1QyDQEc1mC2gxvaqj5ibxg0
	 QfIw13EV6hdIAH7ybBoCEUlX4hiX7PcM9yu9YeBkyFyPtO3RJ3C4l7kmvDeXSE68Cs
	 3NiILPCDPLMbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD3FE60653;
	Sat, 10 Oct 2026 07:19:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A7F775
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 288056066F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:19:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wcPo_y4iCe0m for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 07:19:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 50FAB6066C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791616752;
 b=Pdffgm41hB0692l/pVBcFlpDVRMChtJAHbo5enFtMEqbxaczdagUcbSBJPXhDEScP2re
 /uk57wDzeIe/iIaXXZa6l2GyiB3ML1Tb97xtTRQyPfNV+GRq6wg7ZRmbLNAHndBwABkQi
 BUQ7Fhdzdo5zb2KItCLpSscSwv+A3QcBiSJCNTH0Fht4xShqD07l3DJqzq+ANjpHgTDqN
 HxVvCyR8uwbiiNadnNKEcSyx6E/j5QND92Lt38SM24wdf2vY+U9ddKumXNIMm+P2uGbVM
 r/5cnZzh7vCGN4Uyf/54U1uaAzgNfbpaU0NybWArPqZw720o+/oUU8uJqsvDyp3lhcw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791616752;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=ojRdNgAg5fKkFbJ4gX6Xy/Y1Bl6Rr2p4YJTf6oxHCE4=;
 b=R5CpSa4zQ6s+Hwul7aGxFo4fm43Dj+DsOS4KeLLUuYiXr7owoMMW3IGU7MQrA5PFOOa6
 5kBz84f+PJ6PA436GPur5TXBF+0+V+GOx88Jbn0gUnJ7tT/5b+YHY/Xd4raxHUyMT2Z7t
 OPdqbspXCO2PcVDyng2/w1A/bcksXRwlsO3JLRVskO432kFtJgaIxl3Q8Nm1uLbVVRU22
 y14+LO665uljqupQUUDUl3S2/iljVVxunQLLpdSFACYiGS0beybMe+jVcA2YguWw1e0JX
 +Ir3pAt6vu9QDuEDjqoyICJcEEDBEaZ0AnsWHKgVmb4gzyupdwwAnQo3F/e9MzBP4vQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="n7lho/nx"; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 50FAB6066C
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:19:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E3DB91A11AF
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:19:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AADC96075C;
 Sat, 10 Oct 2026 07:19:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 102FA11D70CAD; 
 Sat, 10 Oct 2026 09:19:06 +0200 (CEST)
Date: Sat, 10 Oct 2026 09:19:06 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Philipp Richter <richterphilipp.pops@gmail.com>
Message-ID: <asnm4po5cq9gOcCA@windsurf>
References: <20261006162106.3439373-1-bernd@kuhls.net>
 <20261006162106.3439373-6-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006162106.3439373-6-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v8 05/84] package/libtorrent-rasterbar: bump
 version to 2.1.1
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

T24gVHVlLCBPY3QgMDYsIDIwMjYgYXQgMDY6MTk6NDZQTSArMDIwMCwgQmVybmQgS3VobHMgd3Jv
dGU6Cj4gaHR0cHM6Ly9naXRodWIuY29tL2Fydmlkbi9saWJ0b3JyZW50L2Jsb2IvdjIuMS4xL0No
YW5nZUxvZwo+IAo+IFN3aXRjaGVkIHRvIHNoYTI1NiB0YXJiYWxsIGhhc2ggcHJvdmlkZWQgYnkg
dXBzdHJlYW0uCj4gCj4gVXBkYXRlZCBsaWNlbnNlIGhhc2ggZHVlIHRvIGNvcHlyaWdodCB5ZWFy
IGJ1bXBzOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9hcnZpZG4vbGlidG9ycmVudC9jb21taXQvZDNm
N2EzNjNjMmE0MTNmNGIzYjRkZGZkNmNiZTVhMzIwODAxNmIxYwo+IGh0dHBzOi8vZ2l0aHViLmNv
bS9hcnZpZG4vbGlidG9ycmVudC9jb21taXQvZmIyYWI5OTQ2YTEzMGRmN2I1ZWUyOTBlYzM2M2Fh
MjIxNDI1NmUwMAo+IAo+IEFkZGVkIHBhdGNoIDAwMDEgdG8gZml4IGEgYnVpbGQgZXJyb3Igd2l0
aCBnY2MtOS4zLjAgZGV0ZWN0ZWQgYnkgdGhlCj4gR2l0bGFiIHBpcGVsaW5lcyB3aGljaCB3b3Vs
ZCBiZSBpbnRyb2R1Y2VkIGJ5IHRoaXMgYnVtcC4KPiAKPiBSYWlzZWQgbWluaW11bSBnY2MgdmVy
c2lvbiB0byA4IHRvIGZpeCBhIGJ1aWxkIGVycm9yIGRldGVjdGVkIGJ5IHRoZQo+IEdpdGxhYiBw
aXBlbGluZXMgd2hpY2ggd291bGQgYmUgaW50cm9kdWNlZCBieSB0aGlzIGJ1bXA6Cj4gL2J1aWxk
cy9ia3VobHMvYnVpbGRyb290L2JyLXRlc3QtcGtnL2Jvb3RsaW4tYWFyY2g2NC1nbGliYy1vbGQv
YnVpbGQvbGlidG9ycmVudC1yYXN0ZXJiYXItMi4xLjEvaW5jbHVkZS9saWJ0b3JyZW50L3N0cmlu
Z192aWV3LmhwcDoxMzoyMzoKPiAgZmF0YWwgZXJyb3I6IHN0cmluZ192aWV3OiBObyBzdWNoIGZp
bGUgb3IgZGlyZWN0b3J5Cj4gCj4gQWRkZWQgZGVwZW5kZW5jeSB0byBCUjJfVVNFX01NVSB0byBm
aXggYSBidWlsZCBlcnJvciBkZXRlY3RlZCBieSB0aGUKPiBHaXRsYWIgcGlwZWxpbmVzIHdoaWNo
IHdvdWxkIGJlIGludHJvZHVjZWQgYnkgdGhpcyBidW1wOgo+IC9idWlsZHMvYmt1aGxzL2J1aWxk
cm9vdC9ici10ZXN0LXBrZy9ib290bGluLWFybXY3bS11Y2xpYmMvYnVpbGQvbGlidG9ycmVudC1y
YXN0ZXJiYXItMi4xLjEvc3JjL21tYXAuY3BwOjI4MzoxOToKPiAgZXJyb3I6IOKAmDo6bWFkdmlz
ZeKAmSBoYXMgbm90IGJlZW4gZGVjbGFyZWQ7IGRpZCB5b3UgbWVhbiDigJhhZHZpc2XigJk/Cj4g
Cj4gU3dpdGNoZWQgYnVpbGQgc3lzdGVtIHRvIGNtYWtlIGR1ZSB0byB1cHN0cmVhbSByZW1vdmFs
IG9mIGF1dG90b29sczoKPiBodHRwczovL2dpdGh1Yi5jb20vYXJ2aWRuL2xpYnRvcnJlbnQvY29t
bWl0L2Q3ZGIyODY2M2QzYjY4MjdjMmZhOGQ1YTQ0ZmFkN2M3MzgyODEwOGEKPiAKPiBBZGRlZCBu
ZXcgY29uZmlndXJlIG9wdGlvbiB3ZWJ0b3JyZW50Cj4gaHR0cHM6Ly9naXRodWIuY29tL2Fydmlk
bi9saWJ0b3JyZW50L2NvbW1pdC80ZWY4YmU4MThmZWE0NDBjOTIxYzM5ZTVmOTBlNTgxOGE0NzQ5
MDg2Cj4gdG8gZGlzYWJsZSB0aGUgZGVwZW5kZW5jeSB0byBPcGVuU1NMIGZvciBsaWJkYXRhY2hh
bm5lbDoKPiBodHRwczovL2dpdGh1Yi5jb20vcGF1bGxvdWlzYWdlbmVhdS9saWJkYXRhY2hhbm5l
bC9ibG9iL2EwMmI3NTE5MTdhYzhhZmM4YzU4ZGM2ZjQ0NjFkMjVmZjk0NjVkNDgvQ01ha2VMaXN0
cy50eHQjTDQ1Mgo+IHdoaWNoIHdhcyBhZGRlZCB0byBsaWJ0b3JyZW50LXJhc3RlcmJhciBpbiB2
ZXJzaW9uIDIuMS4wOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9hcnZpZG4vbGlidG9ycmVudC9jb21t
aXQvOGQ3ZDgyYjAzMzBmMTYyOTdiMjFlNzdhNWQ3YzM1NTgxMzY4N2UxNgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Cj4gQ2M6IFBoaWxpcHAgUmljaHRl
ciA8cmljaHRlcnBoaWxpcHAucG9wc0BnbWFpbC5jb20+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhh
bmtzIQoKQmVzdCByZWdhcmRzLAoKVGhvbWFzIFBldGF6em9uaQotLSAKVGhvbWFzIFBldGF6em9u
aSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVu
Z2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
