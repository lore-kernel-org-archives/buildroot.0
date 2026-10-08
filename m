Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8F1CA6011
	for <buildroot@archiver.kernel.org>; Thu,  8 Oct 2026 17:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E1A34085F;
	Thu,  8 Oct 2026 17:21:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AqwMFrQhKvMR; Thu,  8 Oct 2026 17:21:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 508C34086D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791480079;
	b=iVz/iLcaDJvWOE92mK5rqj66OBxAOKZKRa9vEXI8Rz+Yn0S+GefXO0YaS0tuaJQoUotS
	 J8NxUF07JlmCCZykwDI23yRNE9OtHgqoPZpEucdQFecEMaJH8Rn1M3/viOcbLReZVcbxe
	 AkIyxeE2Qmat6iHGmlM14K4NLNZ0MWOoUuA9lH5RjcLXgBCl4h0tKWVXGX553GmAK08Oo
	 SmFBdZuA4QmfhpQ/QlNMzs7Xe1u4WGBuZDrJsnTYW2yUBHkagN7oXrm8EcVthWv/kTxTp
	 pZHBJ6i4amPpMcrbBiUi+4uckdcsPvkYy477ctMCSk7CJGce66KugKTNsMMyX0iqsZA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791480079;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:Received:Received:
	 Received:Received:From:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Date:To:CC:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:X-Originating-IP:
	 X-ClientProxiedBy:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=lU/tkCNWojmKGatpcj035bxQjKkuPDvUjRlK+4Yup4c=;
	b=ALFROQ2kiykVzYE+JDBpURauqJKGAzt1fETqOPRUlVq20gikAqnJn4h1lBKmhExN4Wj9
	 yY9zJCmNAm7YTzjWkSF1ma7+KnI6v0R2RvQtgx4wRJq5meOazgZq/hcFD0WVrOzYnkuHK
	 47Xy9sY/TlMcppwxlHxiy/1RHYCN63ttA/vCzVvcEuBuhvAK1XUiNMd2l5RsdRLFY+AkA
	 DfZ8rHvg9oLBU9jbSpDwR4I8jcF0CJTWt6IlBT8UDdnRuXlVPv538Ke1ZAA/hLaedpb0N
	 Mqle91wSF7gaQ5vzu3k1hk0DZIlVPf+RsrQwVE5dxg1T1cnL9MYThhVG5SmNabYDfZw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791480079;
	bh=lU/tkCNWojmKGatpcj035bxQjKkuPDvUjRlK+4Yup4c=;
	h=From:Date:To:CC:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CFyLMftxYDozS/f9QZce/tFv0jTdS2z7A9Oyp/NdNeoY9KmQLDO5x6RlLxs0PpGTB
	 oWcTTZfCSeqjgEH3Ffj4VqGoUCmfS3TV0h2PUF4Io0g1otFeOP5tKErFo8BCDBt2Zg
	 ScdJQBkytvKaGkdEYVQubc4U67GjdOJFU0ZUnDHTKV6e1uga2Hb56c1ivz4r6uGNz5
	 Oq/h5a19Xs/3/2zFOgh5zIcoekU4Ogr01uwk1rVsqNYvyZLcrRIX/Nu6iZ/L8IgYPD
	 PV3AWzSxYvFtAV53GzmxNZlKsmGzBQMo/J7moJUzepN0/HbUqs/MiEtegzSFYtzOVK
	 OEg0Z0Kolkr5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 508C34086D;
	Thu,  8 Oct 2026 17:21:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 770232E0
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 17:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D8734016F
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 17:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yf65auRv84l5 for <buildroot@buildroot.org>;
 Thu,  8 Oct 2026 17:21:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 09A864008F
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=80.12.126.237
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791480076;
 b=ayh2uxWElTcpWD/95sn+nqiMbDGxjTAJZc6+4yMz/qwNdesb4t084A+pGnI5ETsCldjz
 CZRacOkwImt0CkpxvfL51A17yssFuiOLXEdiHOlRUgqj8q5ApGOz4Sp05X/oNEDO5hJPO
 Tm+vMMEGWJS7QtjxJTgQKw23oPkqYNvyNYgZ1jz0nbETeDuGyO+rJzc5fuBgw46yijl+D
 p0WDog/BODrDKOUQl1Wde/x5pI2nzfncgH0xhAk1YNf1jaPKORwpJYT4cCumiiOrbNftL
 TP9vH6Zn0kixc87Foaf/EQ6COIi5qEeR+WhEc5B3nuLHPw6GM/Q9hU8NQggyMnDlKlA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791480076;
 h=Received-SPF:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
 Received:Received:Received:Received:From:X-CSE-ConnectionGUID:
 X-CSE-MsgGUID:X-IronPort-AV:X-Amp-Result:Date:To:CC:Subject:
 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
 In-Reply-To:X-Originating-IP:X-ClientProxiedBy:
 Content-Transfer-Encoding;
 bh=UQ1akw/FuUs26Y5CZWPh5Vdy61grRzogtGpS0ytUBJ0=;
 b=p+bHKXm+Mp9AcjRXIg3RNz/Zq1lNlAkWC22O1x9lMNdBquoJKTqEa1R00Ye7Lhw/3aeT
 NYczr/jLAp/ObiS0CWshdgTyUQHZSL0g8wlF6HGQq2o0ZZUK3nyaZvrtjrr1A2a19GPT0
 uMYWbadRITFLpQADCPP0V7/ugtMGeL4qyFdfH3XiFnIN4J2T6WQqtTPqmWr3u83UPn+6t
 m/rM/B4iOjDYnQkcKi2ILNLhaAC/BxkVOc7wLUG82HY7DUqio4R4PciVpt5X6zJpjkEY3
 WRJ2Vo6lb59DkSqynz82TF5nthUBv6IH1MgpusL6zAvTMIk5rPLQi3dZKf1awljyaKQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=orange.com;
 dkim=pass header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=NtZiu807; 
 arc=none smtp.remote-ip=80.12.126.237
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.237;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=orange.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=NtZiu807
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09A864008F
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 17:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1791480076; x=1823016076;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=UQ1akw/FuUs26Y5CZWPh5Vdy61grRzogtGpS0ytUBJ0=;
 b=NtZiu807bA7Hsphfhg8ZMI08aGBxwcqBWc18/Hb+TdgiK1941ynPcNqO
 Jhv5uL5XdGyAqXy4Rn66GNlSUAWXaTLZkvvNl8C5E7YkjXo4K4hNsF09n
 YiXnlbUT8IPiZ+53pzecTBK57XATTnSkMfCuNuVtRuLb3riRLYZF2uI3Q
 7Bt+I14e57rlpVLHEFCbHhS5YGIsVlJXaQ8f2m3rh/BDcEl4sf1ofOTrY
 Ys9OEpNyJGsYkSpHw7H+5D7wKrNS6uq429rRLAMAg+lc8QzktzUsPchot
 2Rt0Quq6XmoPtrV+/cWp62dxIAwgtC6t+8ixqdIf0S3slRTsotz5NQ7ud w==;
X-CSE-ConnectionGUID: DGS7l70nSRyB1XNss2ylLw==
X-CSE-MsgGUID: 73Keui62TZGemSS2GA60ng==
Received: from unknown (HELO opfedv3rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 08 Oct 2026 19:21:12 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 19:21:12 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49;
 Thu, 8 Oct 2026 19:21:10 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Thu, 08 Oct 2026 19:21:09 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: DsFTL5YxScGHZBSZ6IDapQ==
X-CSE-MsgGUID: qCfaGVWmTQ6JqB5KvVSlLw==
X-IronPort-AV: E=Sophos;i="6.27,146,1787004000"; d="scan'208";a="477837423"
X-Amp-Result: SKIPPED(no attachment in message)
Date: Thu, 8 Oct 2026 19:21:09 +0200
To: <buildroot@buildroot.org>
CC: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <asfRBWfmApHhttIG@yd-6wlzhs3>
References: <cover.1789706718.git.yann.morin@orange.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1789706718.git.yann.morin@orange.com>
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
Subject: Re: [Buildroot] [PATCH 0/2 v2] support/size-stats: actually handle
 .pyc files
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

QWxsLAoKT24gMjAyNi0wOS0xOCAwNjo0NSArMDIwMCwgeWFubi5tb3JpbkBvcmFuZ2UuY29tIHNw
YWtlIHRodXNseToKPiBUaGlzIHNtYWxsIHR3by1wYXRjaCBzZXJpZXMgcHJvcGVybHkgYXNzb2Np
YXRlcyAucHljIGZpbGVzIHRvIHRoZQo+IGNvcnJlc3BvbmRpbmcgcGFja2FnZSwgdG8gYWNjb3Vu
dCBmb3IgdGhlIFBFUCAzMTQ3IGxheW91dC4KCk5vdyB0aGF0IFZpbmNlbnQgaGFzIHJldmlld2Vk
IGFuZCBhY2tlZCB0aGF0IHNlcmllcyAodGhhbmtzISDwn5GNKSwgaXMKdGhlcmUgYW55IG1vcmUg
ZmVlZGJhY2sgdGhhdCBJIHNob3VsZCB0YWtlIGludG8gYWNjb3VudD8gOi0pCgpSZWdhcmRzLApZ
YW5uIEUuIE1PUklOLgoKLS0gCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBfX19fX19fX19fX18KLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tOiAg
ICAgICBfICAgIDotLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1U
aW1lIEVtYmVkZGVkIHwgICAgX18vICkgICB8IC8iXCBBU0NJSSBSSUJCT04gfAp8ICAgICAgICAg
ICAgICAgICB8IFNvZnR3YXJlICBEZXNpZ25lciB8ICBfLyAtIC8nICAgfCBcIC8gQ0FNUEFJR04g
ICAgIHwKfCArMzMgNjM4LjQxMS4yNDUgJy0tLS0tLS0tLS0tLS0tLS0tLS0tOiAoXyAgICBgLS0s
IHwgIFggIEFHQUlOU1QgICAgICB8CnwgeWFubi5tb3JpbiAoYXQpIG9yYW5nZS5jb20gICAgICAg
ICAgIHxfPSIgICAgLC0tJyB8IC8gXCBIVE1MIE1BSUwgICAgfAonLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS06X19fX19fL19fX19fOi0tLS0tLS0tLS0tLS0tLS0tLScKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KQ2UgbWVz
c2FnZSBldCBzZXMgcGllY2VzIGpvaW50ZXMgcGV1dmVudCBjb250ZW5pciBkZXMgaW5mb3JtYXRp
b25zIGNvbmZpZGVudGllbGxlcyBvdSBwcml2aWxlZ2llZXMgZXQgbmUgZG9pdmVudCBkb25jDQpw
YXMgZXRyZSBkaWZmdXNlcywgZXhwbG9pdGVzIG91IGNvcGllcyBzYW5zIGF1dG9yaXNhdGlvbi4g
U2kgdm91cyBhdmV6IHJlY3UgY2UgbWVzc2FnZSBwYXIgZXJyZXVyLCB2ZXVpbGxleiBsZSBzaWdu
YWxlcg0KYSBsJ2V4cGVkaXRldXIgZXQgbGUgZGV0cnVpcmUgYWluc2kgcXVlIGxlcyBwaWVjZXMg
am9pbnRlcy4gTGVzIG1lc3NhZ2VzIGVsZWN0cm9uaXF1ZXMgZXRhbnQgc3VzY2VwdGlibGVzIGQn
YWx0ZXJhdGlvbiwNCk9yYW5nZSBkZWNsaW5lIHRvdXRlIHJlc3BvbnNhYmlsaXRlIHNpIGNlIG1l
c3NhZ2UgYSBldGUgYWx0ZXJlLCBkZWZvcm1lIG91IGZhbHNpZmllLiBNZXJjaS4NCg0KVGhpcyBt
ZXNzYWdlIGFuZCBpdHMgYXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG9yIHBy
aXZpbGVnZWQgaW5mb3JtYXRpb24gdGhhdCBtYXkgYmUgcHJvdGVjdGVkIGJ5IGxhdzsNCnRoZXkg
c2hvdWxkIG5vdCBiZSBkaXN0cmlidXRlZCwgdXNlZCBvciBjb3BpZWQgd2l0aG91dCBhdXRob3Jp
c2F0aW9uLg0KSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlbWFpbCBpbiBlcnJvciwgcGxlYXNl
IG5vdGlmeSB0aGUgc2VuZGVyIGFuZCBkZWxldGUgdGhpcyBtZXNzYWdlIGFuZCBpdHMgYXR0YWNo
bWVudHMuDQpBcyBlbWFpbHMgbWF5IGJlIGFsdGVyZWQsIE9yYW5nZSBpcyBub3QgbGlhYmxlIGZv
ciBtZXNzYWdlcyB0aGF0IGhhdmUgYmVlbiBtb2RpZmllZCwgY2hhbmdlZCBvciBmYWxzaWZpZWQu
DQpUaGFuayB5b3UuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
