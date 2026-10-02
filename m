Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D20CA5FDD
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 13:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FA2C812EE;
	Fri,  2 Oct 2026 13:54:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q6ZJDlEe1zgV; Fri,  2 Oct 2026 13:54:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B2C9E812DE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790949277;
	b=QvZmtNA0pkeECfh1CXeUkvOpHidCLqRrBYB/DOylBqH6ate3DPXgaB66pHnoFeYTN/in
	 6wIIjeTqNC0xkMbia2iZfCZZR2+Zkiuqj2uilBFND5OGTztrrzhQpHn5ne2yn/amW7/XE
	 12RzKLMdZJ8AcxhqseWOJS7UWDffyHP9Dle+3ZmCWJKe4ba0iONCuPAx3u98bGCrb9E/v
	 IBX3xfhQri0M1tqPlHZpOW9U/MgjyyRLvRYYoWnDdM4B4Hf2+1FgoD6QTInE6n/R/xKet
	 16cwiGsYuGtWtVjUgLTuJBkr3MwSzwxymkN1p2BuDhI+edY+I3Jp2q2xZzd33V8P2ug==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790949277;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:Date:X-Gm-Features:Message-ID:To:
	 Cc:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=10KBnkJVUTN9a5EzxUcy5iq4uO0hH7eyOFuK6T36Hkc=;
	b=PQl2hKi/tpQtFVTbUkKFKBrRxOiJf0zaEwgDFJRAncokSlfWDYMmzNCnMcBVwnjoPFDr
	 fUtldjhHa3EXKgEBxOZpPgQky/DnVYu20ql2vwxRD7bX2fZYzNfj4DeJ9gr+rW7FSCYOS
	 g/VxXXdfo9R/a7vScT/TrMtNrVYvTh/Tsm1V+M1SajA0fs5SGBxqjNYDJ9OdEJBz1xCLt
	 NNC41Ft3kh7qwOooHvq0zrWj+Q5lSruMmY4JDzepbL9a9dX4+Yd8FcZzKnO+Yn6Z2D2FA
	 cVGIg9Bu86Wnnp9oDoWn9vIDog8YQhvqBS1ZNGT5/N/WPIVwMH/MWJGSfI5QWkVFBzw==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790949277;
	bh=10KBnkJVUTN9a5EzxUcy5iq4uO0hH7eyOFuK6T36Hkc=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AkodC3TOwTJozL0p67QiNFA2mLXiLag3lbkj+r/Wh+baWC47SW/a2ey64yZ0uT0Lu
	 7JSjvA5E7StQd3B95qWB8P2I9/A6skJL3ZuE8YP/3wrT5mBXk6lv4kgrgF6Hoofsqi
	 GS4w0HH8wWK7gAwszMMs+A9GdioEC+KQdOSeSwnp9xv3u7lrI4+3noFufK2Jq8NQ1m
	 riN+Ie0WzO/1ScnsUlfQSFvRW9IVDexS4wBQyuEnOC+kKTuzCfQH/ufNlSLzmcz0rb
	 hl1miLehnCoSkUiEPMzn5uSuuLljCjkESq+KbXjmPx9mse7huAELe3MIu6OA1pQ7BV
	 EbleMhVxWbrBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2C9E812DE;
	Fri,  2 Oct 2026 13:54:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BFE8632F
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 13:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A582E404F8
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 13:54:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RA4bm02-Qz_5 for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 13:54:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org B4A394004A
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1790949276;
 b=dz3WJc+bFXvvrUXpQqBALpY3f2p8N6jy4JqKDQj2cfSpQmmf5zFeOznE7YdRKVtQmtll
 5j4q53+lPKBqbFJabiPsFn0k04mqWjYYp+wGLTTNKyZA1MDL6U9cAG44Fz+HwGKn6NwWG
 AkfS2O1UrGeJ/Y4swmGF3tdG6wXqFetuGgxHBBL8fCG3pWO1DCm49pROvuu+zLfP8SwMH
 QI+lon1HNOa/U+5oH3fIOR7nTAUDGKSe45k+qIe9zE9gSGqSQ1vs0xzGclLP+5giGvH+i
 Wc75KZ86FmJpJfCnOg+jXbNycj0tm5sEZjaFz/Uv/y7p7v+47sXxzDN6j+CPpdLvn3Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790949276;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=iJikNwy+iVPptY4f9YlKFVeuic9wQyRwQ5Bna8DSUJ4=;
 b=UHr2yb45m99OTBbuWVo1Qtop4hWmU0HE6wxEsvabNSQ4CN4SoMCF7uWx7NpJc2DHNC+m
 ckzIqGGtxaBeuNR7CxRUTZAM9hKX/LiBw7q59RPDzzFnGLIt6JwRkl6hacskEg50Y3Xyz
 GqAFyi3Dcq0hO4RX9S/rpRXO5zgZ2spfgyt+ohnkyhwL3COGgmpItIcPrqlXOxvJi4e3l
 dR7bqRi1QL3dt7Y/y8fniNEv+C9WCR3po92GZfudd6B0D/n9i70MEuY6xRWOmD/c2BixH
 XelJTiIFyCOyHN/TM98wskpyhT1F0SReBS5EiCyJTcTequLUyUuNnItKH6GdZSET3VQ==
ARC-Authentication-Results: i=2; smtp2.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=F+Au4okT; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a00:1450:4864:33::2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:33::2b; helo=mail-ed2-x2b.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed2-x2b.google.com (mail-ed2-x2b.google.com
 [IPv6:2a00:1450:4864:33::2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4A394004A
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 13:54:35 +0000 (UTC)
Received: by mail-ed2-x2b.google.com with SMTP id
 4fb4d7f45d1cf-6ae19319854so4463986a12.3
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 06:54:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790949273; cv=none;
 d=google.com; s=arc-20260327;
 b=atqkQycH1fjtxkrAXA48IKJbbh1xyQfomrIUAuBHYgrTqJ8yOx33vuoWcGSeMeDUnL
 eUKWNL6k32IXy7U7rHnIOhJbaJI6BmPiO8BIu8mtETfMlvRvO3Vf9qh/hDJ4ZCOl38jN
 t4bcVbOqJwO7plVRMCJcy6R0Xn3k5CTAMVS/UDYRSQTQWmQujZXYkdeLFDRaIEf9YIEE
 03kmP4lt7i7gq92BHxykfIYTGp+Q2oDNJa6n9Ft1893wQU2K/7En1RzeB1OFMVW3NiSW
 OOU0B9/7M5593lDz20d4LqOGDC1igDm1cKKGH5My/gaifGSnX/E2doCkOIy0VVbZgCxK
 t7HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=iJikNwy+iVPptY4f9YlKFVeuic9wQyRwQ5Bna8DSUJ4=;
 fh=Pv2yMr+uf9Z0Jj4hvc5rKp06NbEixl3KReSgrKtf0Rg=;
 b=aEKJ2+0maLpqxvgWRSOXrrd7aR+KOheoltsUoKr11uUKmWA85PX1TKmAoR4MAvNe5M
 HBJ9yl3YJ6uJfcOITMuwYWIxOYRhKSfpCOLZk0qCrpkeOC19cYtpLzCAa6oPK0rT6JBM
 SVA96a1gJrf+dPhNDkSgTXGz2TItSdHjS3Ygr2IbS5HaBdX6ffM2UYQkTWVtPbOlJ/Ia
 VlP5Hj66eDPJoEyeN5mxxG2XzGiefo3PSYZ+Y+5VqraaKwS+cs6Jpw+IB06UYByIenxA
 U5U1pPUWXwnSdgXITFEMWwkEOprbFEDQoqoq4MkOFfXI0RlIhLcs90ujUBGAnbXp5QB0
 6yDA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790949273; x=1791554073;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=iJikNwy+iVPptY4f9YlKFVeuic9wQyRwQ5Bna8DSUJ4=;
 b=mBxN5+NhcJVgeSqVrt1L4pmpJ/q3lXDEJ0jd79FsfTBCGxIYcHpHPDajjtI7HiqZ5R
 2zX5IzaW6i9k2gJGq6xenmrCCZTFe2mMRwIQ8A6EjVetuCA7Ui2DVbIyj0o3WGDlQvUD
 q0WSEZmqGR704gN6Nd5TRUAPsOXZ3hCVwscZHzPpYXllIoZOv1rUNUfScRnpwEsh8pfV
 PsEgYdGANblXJ0P8YbbBotST5nA/Lyy775knaoW9z1R5DTDcqtNDar5wje8nJy7Y/24W
 9/wrnZNskXcAlq1LH+C4WnpGI/j9kgrYcqszIrLfpqKhwCgRIBBeRIubyzoU30wRuqPu
 wsYQ==
X-Gm-Message-State: AFq9FYLfPiZ9NbFTT9EVsPqZWbZNuRK7aqlVwkjYVRGQcBCywAJL1I9B
 j3/1QQdYAB/2nqhgr2UfZjH4EYa7H1yBP6gPNMba8opDD2ULNOFC327DQK2kjbm/PeD5tmm2wix
 5enBs/sFpQ8dlRS7/UVhEAckxiSnTi6w=
X-Gm-Gg: AYBFou1PGLkn1/3gpR1XCLT6PC5knYXfp9h/VQPl0PTkQqVI6mXnRlNE22W1GSUtDfg
 jQ2TwazL16Cxpqw6hmbzEbz/IrAq4EgbdDti0uIx6aPTN/PIpOalxhFCyeCtj6JUriR3v7UhzUG
 Rq356/Lz48VM4LV5UXs8DQr8oWh3ngAdigbxDmSnQe7xu1XkyLBthweCIa/GpN2dX0ZXx1luBqV
 y39tQKMT8xG2pdeqKViOnP2KHBnIW5CvLx6bZcsm7t28efmzpU1y2cyvyfGO2wQFZ23FPNKntSh
 2g3HQPSeYlIRvZJZw2MmZs85ll7GoB3fWjFOUim0yNdQe6KcQMg7L6ZgfQ==
X-Received: by 2002:a05:6402:354f:b0:6ac:aebd:1482 with SMTP id
 4fb4d7f45d1cf-6af9e2d4a91mr2003950a12.7.1790949272914; Fri, 02 Oct 2026
 06:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260901114951.2675876-1-yegorslists@googlemail.com>
 <aq2VV4mwPo83xmnL@windsurf>
In-Reply-To: <aq2VV4mwPo83xmnL@windsurf>
Date: Fri, 2 Oct 2026 15:55:00 +0200
X-Gm-Features: AclHuK97NIMWPg1-RMTDuFEa4hsAvaxLacTrMrPWv-yCFBnHHd3DTGfe3muJnWI
Message-ID: <CAGm1_ks6eJr4qpwgEUVOnXejar6okr+QyWxqEbB98Wrc0GSkgw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, 
 Will Newton <will.newton@gmail.com>
Subject: Re: [Buildroot] [PATCH v2] package/libmicrohttpd: ignore
 CVE-2025-59777 and CVE-2025-62689
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKT24gRnJpLCBTZXAgMTgsIDIwMjYgYXQgOTo1MeKAr1BNIFRob21hcyBQZXRh
enpvbmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gWWVn
b3IsCj4KPiBPbiBUdWUsIFNlcCAwMSwgMjAyNiBhdCAwMTo0OTo1MVBNICswMjAwLCB5ZWdvcnNs
aXN0cy0tLSB2aWEgYnVpbGRyb290IHdyb3RlOgo+ID4gRnJvbTogWWVnb3IgWWVmcmVtb3YgPHll
Z29yc2xpc3RzQGdvb2dsZW1haWwuY29tPgo+ID4KPiA+IEJvdGggQ1ZFcyBhZmZlY3QgdGhlIGV4
cGVyaW1lbnRhbCBXZWJTb2NrZXQgaGVscGVyIGxpYnJhcnkKPiA+IChzcmMvbWljcm9odHRwZF93
cywgaW5zdGFsbGVkIGFzIGxpYm1pY3JvaHR0cGRfd3Muc28pLCBhcyBzdGF0ZWQgaW4gdGhlCj4g
PiBvcmlnaW5hdGluZyBKUENFUlQvQ0MgYWR2aXNvcnkgSlZONzY3MTkyMTg6Cj4gPgo+ID4gICAi
VGhlIHZ1bG5lcmFiaWxpdHkgZXhpc3RzIGluIGxpYm1pY3JvaHR0cGRfd3Muc28sIHdoaWNoIGlz
IGdlbmVyYXRlZAo+ID4gICAgd2hlbiBidWlsZGluZyB3aXRoIHRoZSAtLWVuYWJsZS1leHBlcmlt
ZW50YWwgb3B0aW9uLiIKPiA+Cj4gPiBUaGF0IGRpcmVjdG9yeSBpcyBndWFyZGVkIGJ5IEFNX0NP
TkRJVElPTkFMKFtIQVZFX0VYUEVSSU1FTlRBTF0pIGluCj4gPiBzcmMvTWFrZWZpbGUuYW0sIGFu
ZCAtLWVuYWJsZS1leHBlcmltZW50YWwgZGVmYXVsdHMgdG8gIm5vIi4gQnVpbGRyb290Cj4gPiBu
ZXZlciBwYXNzZXMgaXQsIHNvIG5vIEJ1aWxkcm9vdCB2ZXJzaW9uIGhhcyBldmVyIGJ1aWx0IHRo
ZSB2dWxuZXJhYmxlCj4gPiBjb2RlLiBVcHN0cmVhbSByZW1vdmVkIHRoZSBtb2R1bGUgb3V0cmln
aHQgaW4gY29tbWl0Cj4gPiBmZjEzYWJjMWMxZDdkMmIzMGQ2OWQ1YzBiZDRhMjM3ZTE4MDFjNTBi
ICgicmVtb3ZlIGJyb2tlbiBleHBlcmltZW50YWwKPiA+IGNvZGUiLCAxMzY1MSBkZWxldGlvbnMp
LCBmaXJzdCByZWxlYXNlZCBpbiAxLjAuMy4KPiA+Cj4gPiBBbiBpZ25vcmUgaXMgbmVlZGVkIHJh
dGhlciB0aGFuIGEgdmVyc2lvbiBidW1wLCBiZWNhdXNlIHRoZSBOVkQgZW50cmllcwo+ID4gZm9y
IGJvdGggQ1ZFcyBzaGFyZSBhIHNpbmdsZSBDUEUgbWF0Y2ggY3JpdGVyaWEgdGhhdCBlbmNvZGVz
IHRoZSBhZmZlY3RlZAo+ID4gcmFuZ2UgYXMKPiA+Cj4gPiAgIGNwZToyLjM6YTpnbnU6bGlibWlj
cm9odHRwZDoqOio6KjoqOio6KjoqOiosIHZlcnNpb25FbmRFeGNsdWRpbmcgMjAyNS0wOS0xNgo+
ID4KPiA+IGkuZS4gdGhlIGF1dGhvciBkYXRlIG9mIHRoZSBmaXggY29tbWl0IGluc3RlYWQgb2Yg
YSB2ZXJzaW9uIG51bWJlci4gU2luY2UKPiA+IHN1cHBvcnQvc2NyaXB0cy9jdmUucHkgY29tcGFy
ZXMgdmVyc2lvbnMgdXNpbmcgTG9vc2VWZXJzaW9uLCBldmVyeSAxLjAueAo+ID4gdmVyc2lvbiBl
dmFsdWF0ZXMgYXMgc21hbGxlciB0aGFuICIyMDI1LTA5LTE2IiBhbmQgaXMgcmVwb3J0ZWQgYXMK
PiA+IGFmZmVjdGVkLCBubyBtYXR0ZXIgaG93IGZhciB0aGUgcGFja2FnZSBnZXRzIGJ1bXBlZC4K
Pgo+IFRoYW5rcyBhIGxvdCwgYnV0IHRoaXMgaXMgbm90IHRoZSByaWdodCBmaXggSSdtIGFmcmFp
ZC4gVGhlIHJpZ2h0IGZpeAo+IGlzIHRvIHNlbmQgYW4gZS1tYWlsIHRvIE5WRCBhdCBjcGVfZGlj
dGlvbmFyeUBuaXN0LmdvdiB0byBhc2sgdGhlbSB0bwo+IHVwZGF0ZSB0aGUgQ1ZFIGVudHJ5LiBU
aGV5IGFyZSByZXNwb25zaXZlLiBZb3UganVzdCBuZWVkIHRvIGV4cGxhaW4KPiB2ZXJ5IGNsZWFy
bHkgd2hpY2ggY29tbWl0IGZpeGVkIHRoZSB2dWxuZXJhYmlsaXR5LCBpbiB3aGljaCByZWxlYXNl
IGl0Cj4gd2FzIGludGVncmF0ZWQsIGFuZCB0aGV5IHdpbGwgZml4IHRoZSBDVkUgZGVzY3JpcHRp
b24uCj4KPiBPbmNlIHRoaXMgaXMgZG9uZSwgd2UgY2FuIHBvdGVudGlhbGx5IGFjY2VwdCBhcyBh
IHRlbXBvcmFyeSBtZWFzdXJlIHRvCj4gYWRkIHRob3NlIElHTk9SRV9DVkVTIGVudHJ5Lgo+Cj4g
VGhlIHdheSBJIHNlZSB0aGlzIGlzIGxpa2UgcGF0Y2hlczogaWYgeW91IGRvbid0ICJ1cHN0cmVh
bSIgdGhlIGZpeCBvZgo+IHRoZSBDVkUgbWV0YWRhdGEsIHRoZW4gd2Ugd2lsbCBoYXZlIHRvIGtl
ZXAgdGhvc2UgSUdOT1JFX0NWRVMgZW50cmllcwo+IGZvcmV2ZXIsIHdoaWNoIGlzIG5vdCBkZXNp
cmFibGUuCgpJIGZpbGVkIGEgcmVxdWVzdCBhIHdlZWsgYWdvLiBUaWxsIG5vdyBubyBhbnN3ZXIg
Oi0oCgpSZWdhcmRzLApZZWdvcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
