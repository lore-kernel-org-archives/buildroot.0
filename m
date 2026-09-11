Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E298C88E4A
	for <buildroot@archiver.kernel.org>; Fri, 11 Sep 2026 00:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DE2880D7A;
	Fri, 11 Sep 2026 00:07:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id umsCsT2skvQF; Fri, 11 Sep 2026 00:07:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8EA3B80C3F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789085270;
	b=c+Q5JbIwkdV+JU4b0SPbKeRTZJrnM4XTHAC3t/lbVFiFbXtWBscbtUhuKTXUQG2y859o
	 vM53HXs1mS/QinC+0u8GfESvl1iCGPOItvx01rB2pgpFoyJ0fY2xX3FL5qBFkXuLHBFoI
	 VqwHa48KmJgonq+7CUPcgarBmsvaVJUpUpEJDqbxQAdxKK73pIdkpS9dKZJj4hErDATEh
	 W5s4frRMSpJ9wVPxIf8Lnu3YvEabTdMP9hdcWhgzEzKzoldqgetLygDc02z1lLH4DsoAF
	 j+WleDoTs+MDrb5guatg+FE38IKNnQI0vKrAb5AnPkfLkKK5/S/Zb+B+oDNgo5d+jGQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789085270;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:Errors-To:Sender;
	bh=yzdZKb8MzILvEqeQ/yHKcxygsGaHjQOJ/1XQtTzBUQY=;
	b=ee8DLcHrIFwnVz0fqKoI23nqyXJ9DDQ1X8OBWtxcawl/oJYGNSNi8SbuftzuFmD4KW7g
	 wggVBivF0wZRKnW3wpBjFbXUP9itv9BLJRzOuCveJNkkqQyj1v/+aLkp3DNvoEpU17bR/
	 pJle3nQpI8nNiZaOVVfLV3MAO9zmKNo5ehnGnhIc2D7ofjP93I6rsmAk2CA8Ycfbc/m/y
	 UxTvWxSxIHtwKAmy4pTvSBnz/DbDygP4mZZYZn+mhhrneJUIUPoaUl49/6Egc2rUmknMH
	 Z0Ea8vgiS+/uPZIIjhtVMVl8hA9XJKci3ru6shRzJudgt2hGgb0efpz/5HvRiDsuBpg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=SlXyzE8i;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789085270;
	bh=yzdZKb8MzILvEqeQ/yHKcxygsGaHjQOJ/1XQtTzBUQY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Le1xVxAk0JFMMNHS9k3FwpBb/hSB55ZT+eFnyJyKKz2ROOSoXxpjJUOjo6CksEMOl
	 N15BKxjHpaL8hSq+Cywlpt7Qmwms0iZkHbtViT3Ms3LDjdprcZ/T6NoyMDqbOyhPX7
	 qHyqBY/TXWz3Cp6e5w2JKGL2o7NJDAwZYGSBORTb7fnK39jr0bxFmu0Hk0AbGWEwru
	 onX5f2+3BmJnNGVSrvPqTlhir9RXOQFsf70+vNMpSTnsMevjTsf2V335vC8KWVAyVc
	 WtQN2g6LI40bxltuNUDy6emXFcjaOapYaymke1YmE9tLwyeJlbTHGgIiwLaFh+9lbA
	 MS99uwlRnSLsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EA3B80C3F;
	Fri, 11 Sep 2026 00:07:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E428E14D
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 00:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6528807A8
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 00:07:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nIj0O2NLr3_K for <buildroot@buildroot.org>;
 Fri, 11 Sep 2026 00:07:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2378181067
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789085267;
 b=tf0FSNt0trjCeEwL/kuxVXAxLVYq6CwYGgCvcHtLOznVQvBN2uq4sv3b8CXcdROcQlfx
 mne69ObtHLXdTQoVrLN6CgfeAYI3YtUhTmj2LjTaAI21M8d4Umwl3bBRsZzag/l/UZ+TS
 b1sdKMb7NV6Wwmel+fh/oH45St/yp/vwFIv5vqb/DfUo6dHQViikhFvUDwV47Y4b3NWYF
 8XiA6Z8mdNxQ3u7aipC/02z4NzFB8eFLhUpMdXEW+8ejGH8iVcoiS3XtYDPvLgaW+vtL7
 qWUAD51HdoSXYTU8YeDRBz23AiRG11nMMruUfodvkrVdqzlMMGXpNBwuLX4yR2hGZzw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789085267;
 h=Received-SPF:DKIM-Signature:Received:Received:Date:Message-ID:From:
 To:Cc:Subject:In-Reply-To:References:MIME-Version:Content-Type;
 bh=4ROVQehWGZKfgwdJhvUWc6DI+pwB3YtVm9C0dAd9nG8=;
 b=d+GDDwFCcjgYDfFo31qm7YTOd+HyUnZ1Rq9V3VCCeEqR/8thGuVAo/VQJknhw42TAc5p
 QiT5L9Y3U8Nk7N9JMxFndJXZ0g7z9HxLWlUakwMiIQbIl+UOmhs7gR545rIQSPjQXpIRB
 UDszausICB1WXs9erHXCNd43URaRD17uuwG47IqYQMqy3f7CZ7QSi5gt+eeRhOQEw8THi
 8U8hN9TOzQo49WRATJ5NLeqgfRuILzqpXRGXKg/f17ODoLGFlXVk67DINuaUc5LfRfNPQ
 7+27iWbG2DvB0sBGveqkC/PJkxVtpEjMz6Rbp9qJHwM6D7cGeXxd35kQeb6TmA54POA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=igalia.com; 
 dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=SlXyzE8i; 
 arc=none smtp.remote-ip=213.97.179.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=SlXyzE8i
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2378181067
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 00:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:Subject:Cc:To:From:Message-ID:Date:
 From:Reply-To; bh=4ROVQehWGZKfgwdJhvUWc6DI+pwB3YtVm9C0dAd9nG8=; b=SlXyzE8id5N
 klW19+hUSCvHx/dqD0H2bGM4mzaCJt0SQEmdbyCuhltEqphIUunExsbqaP80XD2SEGCXJLBd58mxS
 /uijuCMafYKgjfh7ahopqVKiLyfriANP7s2Z4+zqVrSOMo1SwLWLj1etuvFoFKfmyBff+2xGggYN+
 OmiuXLaW3UITHEzrkCn9UJC4Jhuzh16Q9mtluRB+NVq9E6HIZQA5LrGAzSolkaKBM13FQx3KYS3/V
 FA4hU2Cv7PZ/pAP695HecrbjK6Pz48w81zVhz2MN7+MDBvN7PqDZXWsjZsfHi7eyrD06sZKDQsSJ3
 gYoySzr8GYyFJs1zx2FMDAg==;
Received: from 68.171.94.90.dynamic.jazztel.es ([90.94.171.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1x4ons-000QWw-Rz; Fri, 11 Sep 2026 02:07:40 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id ddc2b1e8;
 Fri, 11 Sep 2026 00:07:40 +0000 (UTC)
Date: Fri, 11 Sep 2026 02:07:36 +0200
Message-ID: <20260911020736.GO430618603926647@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Julien Olivain <ju.o@free.fr>
Cc: Julien Olivain via buildroot <buildroot@buildroot.org>,
 buildroot@buildroot.org
In-Reply-To: <98a3e0f65ab3ed8e1b2723d620cce2d1@free.fr>
References: <20260910095223.1597453-1-aperez@igalia.com>
 <98a3e0f65ab3ed8e1b2723d620cce2d1@free.fr>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/bubblewrap: security bump to
 version 0.12.0
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
Content-Type: multipart/mixed; boundary="===============7539479673928531242=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============7539479673928531242==
Content-Type: multipart/signed; boundary="upzhVcRdsTXHfGCZ"; micalg="pgp-sha256"; protocol="application/pgp-signature"


--upzhVcRdsTXHfGCZ
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"; hp="clear"
Date: Fri, 11 Sep 2026 02:07:36 +0200
Message-ID: <20260911020736.GO430618603926647@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Julien Olivain <ju.o@free.fr>
Cc: Julien Olivain via buildroot <buildroot@buildroot.org>,
 buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH] package/bubblewrap: security bump to version
 0.12.0
In-Reply-To: <98a3e0f65ab3ed8e1b2723d620cce2d1@free.fr>
References: <20260910095223.1597453-1-aperez@igalia.com>
 <98a3e0f65ab3ed8e1b2723d620cce2d1@free.fr>
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8gSnVsaWVuLAoKT24gVGh1LCAxMCBTZXAgMjAyNiAyMjowMTozOCArMDIwMCBKdWxpZW4g
T2xpdmFpbiB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cj4g
T24gMTAvMDkvMjAyNiAxMTo1MiwgQWRyaWFuIFBlcmV6IGRlIENhc3RybyB3cm90ZToKPiA+IEZp
eGVzIGEgc2FuZGJveCBlc2NhcGUgdGhyb3VnaCBzeW1saW5rIHRyYXZlcnNhbCB0cmFja2VkIGlu
Cj4gPiBDVkUtMjAyNi04Nzc2Niwgd2hpY2ggYWZmZWN0cyBhbGwgcHJldmlvdXMgdmVyc2lvbnMu
Cj4gPiAKPiA+IFVzaW5nIHRoZSBid3JhcCBiaW5hcnkgd2l0aCB0aGUgc2V0dWlkIGJpdCBzZXQg
aXMgbm8gbG9uZ2VyIHN1cHBvcnRlZAo+ID4gYW5kIHVzZXIgbmFtZXNwYWNlcyBhcmUgbm93IGFs
d2F5cyByZXF1aXJlZCwgc28gYSBrZXJuZWwgY29uZmlnIGZpeHVwCj4gPiBpcyBhcHBsaWVkLgo+
ID4gCj4gPiBBIG5ldyBidWlsZCBvcHRpb24gYWxsb3dzIGluZGljYXRpbmcgdGhlIG1pbmltdW0g
a2VybmVsIHZlcnNpb24gdGhhdAo+ID4gd2lsbCBiZSB1c2VkLCB3aGljaCByZW1vdmVzIGNvZGUg
dXNlZCBmb3IgYmFja3dhcmRzIGNvbXBhdGliaWxpdHkgd2l0aAo+ID4ga2VybmVscyBvbGRlciB0
aGFuIDUuNi4wIHdoZW4gYSBuZXdlciB2ZXJzaW9uIGlzIHNwZWNpZmllZC4gUGFzc2luZwo+ID4g
JChMSU5VWF9WRVJTSU9OX1BST0JFRCkgc2VlbXMgcmVhc29uYWJsZSBoZXJlLgo+ID4gCj4gPiBU
aGlzIHZlcnNpb24gYWxzbyBjaGFuZ2VkIHRoZSBsaWNlbnNlIGZyb20gTEdQTC0yLjArIHRvIExH
UEwtMi4xKywKPiA+IGhlbmNlIHRoZSB1cGRhdGVkIGhhc2guCj4gPiAKPiA+IFJlbGVhc2Ugbm90
ZXM6Cj4gPiAKPiA+ICAgaHR0cHM6Ly9naXRodWIuY29tL2NvbnRhaW5lcnMvYnViYmxld3JhcC9y
ZWxlYXNlcy90YWcvdjAuMTIuMAo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBBZHJpYW4gUGVyZXog
ZGUgQ2FzdHJvIDxhcGVyZXpAaWdhbGlhLmNvbT4KPiAKPiBBcHBsaWVkIHRvIG1hc3RlciwgdGhh
bmtzLiBGb3IgaW5mbywgSSBmaXhlZCB0aGUgbGludXggY29uZmlnIGZpeHVwIChubwo+IHB1biBp
bnRlbmRlZCkuIFRoZSAiX0xJTlVYIiB3YXMgbWlzc2luZyBhbmQgdGhlIGZpeHVwIHdhcyBub3Qg
YXBwbGllZC4gCj4gU2VlOgo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxk
cm9vdC8tL2NvbW1pdC80Y2I2MTkzZDJlY2EzOWIxYmQ3OWZmNDg2N2M4NDJmNTA3ZjY5MmI4CgpH
b29kIGNhdGNoLCB0aGFua3MhCgrigJRBZHJpw6FuCg==

--upzhVcRdsTXHfGCZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEIAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCaqNGSAAKCRCRxVnb5MkS
OyF7AJ0fG3CAcgPRQyWAol8SdtOjxG9NEQCdFGEP5a2f2+hVtiFzSynq7ib6KIA=
=YJ7s
-----END PGP SIGNATURE-----

--upzhVcRdsTXHfGCZ--

--===============7539479673928531242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7539479673928531242==--
