Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD42CC6B2F
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 06:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52D7260A3D;
	Thu, 15 Oct 2026 06:04:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UpUwTodwr97L; Thu, 15 Oct 2026 06:04:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 92A9A60904
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792044297;
	b=FpH5sV5GSihYxP/uoF9rH8r92v5X7B7ynnC+ItmHXXyfYNdVRblIWxLshzijh+ZANGz0
	 x6J/2xdoOORFK43z/7ibjpP0WEeaAFxHi+NSWx8NuHK9Dse96d2Q+IXX6+2TZCDOSpU2e
	 KNHedDHM67LX6SFxG3NxQYrCCwPisfArjkLCiAffPtC9N0XHLLMTt7vXcHwG/VCmWxWmy
	 oFdmoePjhWdas6UhWZyb0+bCIHGNkLJPlNfGdMYtm8xf3Qed4bGtHkmSKl2fahWH6yrdR
	 V86+1wn/j9vcnvh8QYfObhyFUi3yC/A5gceJp71lPKc7s9YJeAEkhino0TfPZ34Pctg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792044297;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=09WsMD3vOpJFuU3akxIVa1dXOXjgaa4G3Lz1CZtVbsU=;
	b=BfBUKq1ayvm8qU9y7sQtQjIUcIjax5blY2yKVMP1xXQV7eWvhRyM5Tr3DBe136zVEaL2
	 l2I7KraKbPrFZB4xyiTm4WxoU23Fl6bAi59aHnnQyaVwHxYYr6rViJykcvydXxHpjJmdl
	 D0vOL6lgZUtUyNOmbLEn9ltOibWoxfjvWbTIYR6jArO96W3zl7QUM/TNxEZ0xEZdTqh5M
	 sWuC1CipcZRXbM1DX+24g7jytTJANmH1W7N8AJezPqcr1M8rzMcmRyT7Olop6F6AyIVdY
	 Z21dtbfpsyTSx9xtBpE6mNFMH5pkPXea78inQitFtNclYufkn6DgCTFTOJBZuq1n6Zg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=PIWVQAoA;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792044297;
	bh=09WsMD3vOpJFuU3akxIVa1dXOXjgaa4G3Lz1CZtVbsU=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pg0trnhDVd9K8Y0GPt4Nu6EI9Y6IthtMvgCRllQp6rrST/it1xTI7czPz14tSm2qx
	 8qzXVmw68xrOfE2LNokH0hklddhwu4mtZJynsZzygMwymkruszY0Ai1/+UCHzc2h3s
	 hImbLOQ19Xj/KMWDFCcVDFOKSBOEr2f3Lywr36ECpHHf4sSYXJ5gshQthxTyurleC+
	 lDMog7crK7o1prYRvEZqqbhiNQbK3F6z96mByafgW3RPx3mIgAjTaIEONErBYS/+Hz
	 9MUbpRe93JGCWwyzT+nwo9rRk92TGd4/XPwFN1bRA+98TV4oe17TBt0ZpKnuN8UQ3S
	 BFJBpIkOgKIOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92A9A60904;
	Thu, 15 Oct 2026 06:04:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EB56E255
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 06:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD3516077F
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 06:04:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4AAmtFFZjNar for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 06:04:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org ACE6660904
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792044294;
 b=AwQmG8Jrn1Q06O1uB9qOlO9ojz0bJy/fjB8fU+wP5OCbHuX+sr0xRj03+TsEkAHTbAsz
 3MGLq7wz2q/oKy2qePUVildXr9tmw9l6hGTeY//pHMRBel14MDePiebq/4Xx8gRX0aRfJ
 h5HELn8JtPryFFDBBdmwG7g1m8ve4mLp1fe0jwAAiql83L8RLzN0HZ5gWYNpQnd86+KL7
 BkDrt0Ron4rGDzsJAdScsmqcycmU2UFXEdMzJCZ4Dy4hA0XAy7O8MsTfQcl5C4pmYCh7S
 wxaJetU/InvVH4YJVgcTKEXPauWb+tfhy2nktJ/uFa4ErV1VCxOv1+AtddTYzjHUZWA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792044294;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=0C7ibPUfXuxaKyPy6j7J89ltefx4GYmzmbs0YkfLTHw=;
 b=nTPLsg217FhpyhjW7vNydkKrAeWIHGCKIOq9FJ4fj3pgQw7hw+OXgS4x5DY30gRj+0Gd
 BIcw/eydLDSm8CYgWMN5rWVxvkPn/WprrZ6TexUmKdEkYBEL6Sha5OtfKN9arzPBzD2bJ
 RXye3R9YwP2o+gfW30HpXdbFd6IY6KpPkC8s0dJZVD3ZgMVG4QDzZzWevGaG79D8LaPG9
 p4Zu5e/LN4TTnFa0NCtOaoExVLRv39atnxF/pSCjh+WBck2oNk/2vPRD0BxIa5mTOnu5t
 Jba/5nm/M4tJRB9eD+FsA4ORw8ChH+AJSnhgOEBZ+mAQMQvFnph+jCl+xNVqj6M+6vQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=PIWVQAoA; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=PIWVQAoA
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ACE6660904
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 06:04:52 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=PIWVQAoAvAynCtu2rDKS45uALT+Yr5oarDmMcco2UlOnbvY+sZBXFr5viXylaAKngFzaq3CoGL2RXSeiiqaPsUSm+PehJVr2Sl+9WcKLxep2teezNAMJmIoYD8xHbfzribnqDiexZSdJ1aQU7x4YD/A5oVYrRpT5CZehdUS30enswpHt0iUsbrgK9OOIaDU25j9JSYz1yywhnieJYyamvtxRiCn8UibK25n6kJ5utFmdQmi4Z6uyrT6Htb9ebcjmuitRhi9EkFa//n0Xd8d4rg2FY0zKuJmgqhTjDkxSthmZObYcb3VB8h1hXroZ0HPaWgVrolrRSdUqcaWKHRGpQA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=0C7ibPUfXuxaKyPy6j7J89ltefx4GYmzmbs0YkfLTHw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 180915484; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 15 Oct 2026 06:04:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xHEa7-000000007VL-04Bc;
 Thu, 15 Oct 2026 08:04:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org,  Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <9c6630cc-ebe0-46b3-a5f2-32f32ea09939@gmx.de> (Fiona Klute's
 message of "Wed, 14 Oct 2026 23:33:13 +0200")
References: <20261014200935.3354206-1-peter@korsgaard.com>
 <9c6630cc-ebe0-46b3-a5f2-32f32ea09939@gmx.de>
Date: Thu, 15 Oct 2026 08:04:46 +0200
Message-ID: <8733u7jy81.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libglib2: security bump to version
 2.88.4
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

Pj4+Pj4gIkZpb25hIiA9PSBGaW9uYSBLbHV0ZSA8ZmlvbmEua2x1dGVAZ214LmRlPiB3cml0ZXM6
CgogPiBBbSAxNC4xMC4yNiB1bSAyMjowOSBzY2hyaWViIFBldGVyIEtvcnNnYWFyZDoKID4+IE5v
IENWRXMgc3BlY2lmaWVkLCBidXQgTkVXUyBzdGF0ZXM6CiA+PiAhNTM5NCBCYWNrcG9ydCB2YXJp
b3VzIHNlY3VyaXR5IGZpeGVzIHRvIGdsaWItMi04OAogPj4gaHR0cHM6Ly9naXRsYWIuZ25vbWUu
b3JnL0dOT01FL2dsaWIvLS9tZXJnZV9yZXF1ZXN0cy81Mzk0CiA+PiBBbmQgYSBudW1iZXIgb2Yg
b3RoZXIgYnVnZml4ZXM6CiA+PiAqIEJ1Z3MgZml4ZWQ6CiA+PiAtICM0MDExIGdpby90ZXN0cy9z
ZXJ2aWNlczogSW5zdGFsbGVkIHNlcnZpY2UgZmlsZSBjb250YWlucyBidWlsZCBwYXRoIGFmdGVy
CiA+PiAhNTI1OSAoSmFpcGF1bCBDaGVlcm5hbSkKID4+IC0gIzQwMjAg4oCYVExTIGNhbGxiYWNr
IG5vdCBpbnZva2Vk4oCZIGVycm9yIG9uIG1zeXMyLWNsYW5nNjQgQ0kgam9iIChMdWNhIEJhY2Np
KQogPj4gLSAhNTI2MiBCYWNrcG9ydCAhNTI2MSDigJxnaW8vdGVzdHMvc2VydmljZXM6IEZpeCBp
bnN0YWxsZWQgc2VydmljZSBmaWxlCiA+PiBjb250YWluaW5nIGJ1aWxkIHBhdGjigJ0gdG8gZ2xp
Yi0yLTg4CiA+PiAtICE1MjczIEJhY2twb3J0ICE1MjY2IOKAnGRvY3M6IEZpeCBnaW8gZ2ktZG9j
Z2VuIGRvY3NfdXJs4oCdIHRvIGdsaWItMi04OAogPj4gLSAhNTI4NSBCYWNrcG9ydCAhNTI4MyDi
gJxnY29uc3RydWN0b3I6IFJlZmVyZW5jZSBfdGxzX3VzZWQgYWxzbyBvbiBHQ0MsIENMYW5n4oCd
CiA+PiB0byBnbGliLTItODgKID4+IC0gITUzMjMgQmFja3BvcnQgITUzMTEg4oCcZml4OiBoYW5k
bGUgbG9uZyBmaWxlbmFtZXMgaW4gdHJhc2ggYnkgdHJ1bmNhdGluZyBmcm9tCiA+PiBmcm9udOKA
nSB0byBnbGliLTItODgKID4+IC0gITUzNzkgVXBkYXRlIE5vcndlZ2lhbiBOeW5vcnNrIHRyYW5z
bGF0aW9uCiA+PiAtICE1Mzk0IEJhY2twb3J0IHZhcmlvdXMgc2VjdXJpdHkgZml4ZXMgdG8gZ2xp
Yi0yLTg4CiA+PiAqIFRyYW5zbGF0aW9uIHVwZGF0ZXM6CiA+PiAtIE5vcndlZ2lhbiBOeW5vcnNr
IChSb3ktTWFnbmUgTW8pCiA+PiBodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvZ2xpYi8t
L2Jsb2IvMi44OC4zL05FV1M/cmVmX3R5cGU9dGFncwogPj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIg
S29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPgoKID4gQXBwbGllZCB0byBtYXN0ZXIsIHRo
YW5rIHlvdS4gRllJLCBJIGZpeGVkIHRoZSB2ZXJzaW9uIG51bWJlciBpbiB0aGUKID4gdXBzdHJl
YW0gTkVXUyBVUkwgKDIuODguNCBpbnN0ZWFkIG9mIC4zKS4KClVwcywgY3V0J24ncGFzdGUgZnJv
bSB0aGUgMi44OC4zIGJ1bXAuIFRoYW5rcyBmb3IgZml4aW5nIQoKLS0gCkJ5ZSwgUGV0ZXIgS29y
c2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
