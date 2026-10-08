Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D43DCA600C
	for <buildroot@archiver.kernel.org>; Thu,  8 Oct 2026 14:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D710640B08;
	Thu,  8 Oct 2026 14:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3DqssUPBmaxC; Thu,  8 Oct 2026 14:01:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EEB2840AF1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791468073;
	b=OI80np8kEg3noJ3+ChDFbF40Y2LI9Wgjeq4HGsU2sLX/sFyuD/FFFdLGWJ1HkrJV/+aB
	 UwpG11XCYl4JP8pETF+uuWH3ULN3Oe8bAbU8341bJ8iWu0utXZKzqJm/rK3yNmc/Uzy0S
	 I+raD5cemr7IHaFYbQLT57/ulEtPoRM3sNjFNepaq/z/1mUGyJAE3E5py2JqZPF9axnCK
	 UBbMZwZicuufN/96oYXS5JnbGpViJ7OwDPTh8WWBw2lStZkM1Kx3HKMFHAZuhBQv5TH0h
	 LHkeYFXhW2kqKzy0eBdFKksNEV+dA8s46JSnvNgjYT1EE6Ut2f9PqsD0sg2prMvr4TA==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791468073;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:Date:X-Gm-Features:Message-ID:To:
	 Cc:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=j36o2gJwP75Dd0docuBjW+6lKJ6pqY7lyUsthP/XeNg=;
	b=O/PxkocQ17+AqeX8E19icd7s9UeF6lwW1gUVf+P/l+Ovh91neE7OoP1hzbcMqfUdUi4o
	 XaEBJ5Zu3dl5qtU7lSJap0qFl6CgG94DYQzuRNmgefpWx8GaGK9u6W68KLr+0AqIQomQe
	 reAY3j/xuO2gdLF6SFEAHB280YYxFWG7COTqFgBs4f6iV/pcKgqoo1+nmhqXInIXNrTZN
	 JEspGx5aP8pLPiy32cO/HGg2ppQO6a8qM4ZuJVZcra1pO8nPEK/NZ4yByDfW8+C79ITjL
	 MIU09jwvF2K+H/ecdovx8MXSR2FsKhCtkMHDexDpaXXAfYOGhopZKo4w8T1LtOVqdLw==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791468073;
	bh=j36o2gJwP75Dd0docuBjW+6lKJ6pqY7lyUsthP/XeNg=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TltcIVIoqtth4TrqpbO94sh9UG0tUIWyO748zpC9jzRybluBgY/VJO34Zh+Q3QZ5Y
	 mVnaUKxoPQOr7Hyu7rV1y8sj0q5XpgnR6tv9eWqUuxHyxKNSNs+rqkwv2WtAy2qdN7
	 VTHtnrPChTaBd0vp5HGjkI/mLzr5nJtTCzZTFBujDDPD/OCUABOtYdDmEXKr2Y8020
	 Nk3DC5w6Mn3Hmx/UMZoGIA6It5tbRc1ByKO6K2QfJktNXbQRmocd7QqLT4rxPiUBTf
	 w3LYwLpgcXIpenJfdwiY3Ut/6SzWEcIdFfk6zBJlyFRi6LadCJP+ly4r+MlGPy3M3z
	 QXGPXqx67Y8nw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEB2840AF1;
	Thu,  8 Oct 2026 14:01:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E2EF675
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 14:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D44B58129C
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 14:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6b5O28_XLiIV for <buildroot@buildroot.org>;
 Thu,  8 Oct 2026 14:01:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C7DB081166
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1791468070;
 b=ZIKJWfjEXyiBlmwD5hnUrHB++S6izIJ9Tx+yd81kShYEGI/0YlBqU9+f7Aww/EUcPwZQ
 A9H9ZbhLz84YhvpqC5/Sw4brjpkCH3L5SoEaKkj0sPl7MC3bJhhfzp+H3hQ+wJoxx4oY2
 o1UBp1g3Tsa6nicOGagPbkbFXIyqegw01VLZwAopDONkmPRr++e3JwOtlczLNwl96Ivha
 hdZ9xrgZoUXjEySCZtEn46x4lAnHdcESntlDv8W0zcin8VeX9eAIbvqntKdBiUsQ53ZPq
 t992Y2La2Hk2y8o8TzE4zf2Az4y6i5Cb25uNSCr+fFTnyEXRmyDvhyFtM+/Aj123WOQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791468070;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=ZEsaTMuMiEfn+JLdZ5K5fmKPa1Zx3FaEYa0xtNRRuw4=;
 b=kNNAq+ipgwCnOGe130jXFADU+BOs8vH7BughhMl8zwdWRuKQbD1zDcI9MM3FaCj3xCNj
 CzRFt+FlXAKfzj+urdTgBu5ujDy8a297nS8qniJrCXav7QtMWkMik5Q75WxNGlMW0oM9Y
 V1fP9moeGaybWcReuFU2W3TwcTA0TFu8fNKGbRctaFPO6AQ9XyET82wn68seqk1pmwNnF
 JYIPl3xtuhs60xc7HHAFOvKAxAQNXwhvWcars4E7jw57RYR2XvECDNmCyxpHc3pHYb0TL
 TbTkBthv0Rh7RFeoizEgF/S6BTXO59lPr62xkzkLSwlU4e+4bSul2/7z/x7ZV3Lu0WQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=lzwUXrKw; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a00:1450:4864:20::530"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C7DB081166
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 14:01:07 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6afb0d2a586so5765611a12.1
 for <buildroot@buildroot.org>; Thu, 08 Oct 2026 07:01:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791468065; cv=none;
 d=google.com; s=arc-20260327;
 b=qrUNANF+IKyoUSn/8391GEaHVB04QydsxJNLpDD/d1RHxRB1MgaHSKPVWixrhlvBNt
 nSwtxRvIpRwOvh705W53SDNbePn5LO2QkHzKxDEv3HxNEnIoc2D+dcGGxKoEeV6+3hD6
 i+GDcdIDaXBAJr+e7RevqAJFQ1kyamgYrEB4U+PKcwN9Any+q6adX7CVPidWmK++2Kj7
 xHiKHS7ch0hBJ4dvEtlDRc2iZsaB2sCAvnvr6LVhv3likVRu3MwKlFssp3L8PThnexPu
 ddgY4NyUsdF4hho8em0RW2YViBXGjCuLNoLkUH+lKswJ74McvFyBHLMNpamPybaAD7rH
 ay9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ZEsaTMuMiEfn+JLdZ5K5fmKPa1Zx3FaEYa0xtNRRuw4=;
 fh=Pv2yMr+uf9Z0Jj4hvc5rKp06NbEixl3KReSgrKtf0Rg=;
 b=nXaQif5tF7LJu6CoglMyrX+iwH1jh8ky1M6a6yHdbVcAPzQf3Yd9ZrW5fwEivM136W
 cm50pXddDup5VeXiAy/WqhwOLatIOmQVAXQRwps5JLma23yWsKMn7c98Xi1YUe50vsV+
 vaqu/8wSBi/g/fjMpUKUeFWrQvXKFXXzjTVH54ryREiZQRS6t4sOvSQSqv3yj79Jx9BY
 60thpceVmXWBgKaj6O+Rf5USCcwQuRYFuYP96wEPfOQDgBYeY7v6ws2PsgSheBBLB30f
 ywGMPE02BMY+7ZQC4noWCf4G8shhrkJ+K2r9cm9hg1Sznr9BQljMDE6JbGyCvFwwyOls
 DXjA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791468065; x=1792072865;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ZEsaTMuMiEfn+JLdZ5K5fmKPa1Zx3FaEYa0xtNRRuw4=;
 b=cNLCdFPybtxw7jePcfFBPS4gVrcQDoXxUQt9wlri3iIF52DItgycikvqJjhGuQn/55
 /mDx3hNxFHFeLJTuj/g1g8eVK8qrNCLonAF6K3luWvQiW7Llv7ZVqSybXYrdim/oFdfr
 EV79e1+fojCXcOQyKuiyAy5ZU33FRfs11W/4Nvj8fRsS7MZEg8NE4yFs8eL3o8uxdnwc
 pMoZJGDSSdH8XR1jXHx0Ewlhs2rZeVw2Wz9vnSpbQlOWCcaaV7EpD8YWPIe8mShnxdFV
 INhRPUwKjftx+VOqPnnV3bqfZpJMJc75mJdNnk6/dkzJHMrTc/dfObwbW7jDcA2ZriEo
 T9Cg==
X-Gm-Message-State: AFq9FYIJs5TOV2wInb38M7ZD/qWkUyibMHE3XjUabVIRCKY+S12lnaUg
 EvHc1zwsSR3w4J9nFSJQQ4EyNgsmgqopBLxuisjYAQ8BK5U7jctIA/yiVxNt0sKMGlJgZEbV3mC
 SMOIIKNy7r6DnHqu/waQm1x+dOB00u48=
X-Gm-Gg: AYBFou3SZC1aLAOkVKNdDgzxWpWQ+HaJ5piv8RrnTBetEDYWpEy2dhtAkGVIBifGWVN
 PK6w4OeBKkBFyAYiRyvaCXP2yYmc/WzFANgWtxW9uXknLcuJ5IrTDO4TiaFHBLUxa4pup6tqgfu
 IQ5DRiXPHOMiJrCmkJakMXaCzYY0pNsBM9DQXpilAe1eaWQ6qyEfX/Q8FlT6Ofy1gn6dDXXA2bC
 +9cSsuGLSwX843eLzYTtNOXWvIUfnR04UdmbhEtObrJ8Y9HU/pZ1qPf28cItKo2xIOyXyE2W4SQ
 rHISX4PtBlpYE3zggDYJjutbZ21UqLo8NAlBmYMPQz8G98KJnzu1HFbp
X-Received: by 2002:a05:6402:23dc:b0:6a3:ee60:b13f with SMTP id
 4fb4d7f45d1cf-6aff397b608mr4649385a12.14.1791468065012; Thu, 08 Oct 2026
 07:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260901114951.2675876-1-yegorslists@googlemail.com>
 <aq2VV4mwPo83xmnL@windsurf>
 <CAGm1_ks6eJr4qpwgEUVOnXejar6okr+QyWxqEbB98Wrc0GSkgw@mail.gmail.com>
In-Reply-To: <CAGm1_ks6eJr4qpwgEUVOnXejar6okr+QyWxqEbB98Wrc0GSkgw@mail.gmail.com>
Date: Thu, 8 Oct 2026 16:01:30 +0200
X-Gm-Features: AclHuK-056clUNWB3A7Gi_xEpyS6K87w4jALE4TDhXebHiC99J16ZQ4TJLi4oos
Message-ID: <CAGm1_ktftT0eCbujWXYwky+_u18eSbyxDFWoMgrL9r7fw-rKkA@mail.gmail.com>
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

T24gRnJpLCBPY3QgMiwgMjAyNiBhdCAzOjU14oCvUE0gWWVnb3IgWWVmcmVtb3YKPHllZ29yc2xp
c3RzQGdvb2dsZW1haWwuY29tPiB3cm90ZToKPgo+IEhpIFRob21hcywKPgo+IE9uIEZyaSwgU2Vw
IDE4LCAyMDI2IGF0IDk6NTHigK9QTSBUaG9tYXMgUGV0YXp6b25pCj4gPHRob21hcy5wZXRhenpv
bmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4KPiA+IEhlbGxvIFllZ29yLAo+ID4KPiA+IE9uIFR1
ZSwgU2VwIDAxLCAyMDI2IGF0IDAxOjQ5OjUxUE0gKzAyMDAsIHllZ29yc2xpc3RzLS0tIHZpYSBi
dWlsZHJvb3Qgd3JvdGU6Cj4gPiA+IEZyb206IFllZ29yIFllZnJlbW92IDx5ZWdvcnNsaXN0c0Bn
b29nbGVtYWlsLmNvbT4KPiA+ID4KPiA+ID4gQm90aCBDVkVzIGFmZmVjdCB0aGUgZXhwZXJpbWVu
dGFsIFdlYlNvY2tldCBoZWxwZXIgbGlicmFyeQo+ID4gPiAoc3JjL21pY3JvaHR0cGRfd3MsIGlu
c3RhbGxlZCBhcyBsaWJtaWNyb2h0dHBkX3dzLnNvKSwgYXMgc3RhdGVkIGluIHRoZQo+ID4gPiBv
cmlnaW5hdGluZyBKUENFUlQvQ0MgYWR2aXNvcnkgSlZONzY3MTkyMTg6Cj4gPiA+Cj4gPiA+ICAg
IlRoZSB2dWxuZXJhYmlsaXR5IGV4aXN0cyBpbiBsaWJtaWNyb2h0dHBkX3dzLnNvLCB3aGljaCBp
cyBnZW5lcmF0ZWQKPiA+ID4gICAgd2hlbiBidWlsZGluZyB3aXRoIHRoZSAtLWVuYWJsZS1leHBl
cmltZW50YWwgb3B0aW9uLiIKPiA+ID4KPiA+ID4gVGhhdCBkaXJlY3RvcnkgaXMgZ3VhcmRlZCBi
eSBBTV9DT05ESVRJT05BTChbSEFWRV9FWFBFUklNRU5UQUxdKSBpbgo+ID4gPiBzcmMvTWFrZWZp
bGUuYW0sIGFuZCAtLWVuYWJsZS1leHBlcmltZW50YWwgZGVmYXVsdHMgdG8gIm5vIi4gQnVpbGRy
b290Cj4gPiA+IG5ldmVyIHBhc3NlcyBpdCwgc28gbm8gQnVpbGRyb290IHZlcnNpb24gaGFzIGV2
ZXIgYnVpbHQgdGhlIHZ1bG5lcmFibGUKPiA+ID4gY29kZS4gVXBzdHJlYW0gcmVtb3ZlZCB0aGUg
bW9kdWxlIG91dHJpZ2h0IGluIGNvbW1pdAo+ID4gPiBmZjEzYWJjMWMxZDdkMmIzMGQ2OWQ1YzBi
ZDRhMjM3ZTE4MDFjNTBiICgicmVtb3ZlIGJyb2tlbiBleHBlcmltZW50YWwKPiA+ID4gY29kZSIs
IDEzNjUxIGRlbGV0aW9ucyksIGZpcnN0IHJlbGVhc2VkIGluIDEuMC4zLgo+ID4gPgo+ID4gPiBB
biBpZ25vcmUgaXMgbmVlZGVkIHJhdGhlciB0aGFuIGEgdmVyc2lvbiBidW1wLCBiZWNhdXNlIHRo
ZSBOVkQgZW50cmllcwo+ID4gPiBmb3IgYm90aCBDVkVzIHNoYXJlIGEgc2luZ2xlIENQRSBtYXRj
aCBjcml0ZXJpYSB0aGF0IGVuY29kZXMgdGhlIGFmZmVjdGVkCj4gPiA+IHJhbmdlIGFzCj4gPiA+
Cj4gPiA+ICAgY3BlOjIuMzphOmdudTpsaWJtaWNyb2h0dHBkOio6KjoqOio6KjoqOio6KiwgdmVy
c2lvbkVuZEV4Y2x1ZGluZyAyMDI1LTA5LTE2Cj4gPiA+Cj4gPiA+IGkuZS4gdGhlIGF1dGhvciBk
YXRlIG9mIHRoZSBmaXggY29tbWl0IGluc3RlYWQgb2YgYSB2ZXJzaW9uIG51bWJlci4gU2luY2UK
PiA+ID4gc3VwcG9ydC9zY3JpcHRzL2N2ZS5weSBjb21wYXJlcyB2ZXJzaW9ucyB1c2luZyBMb29z
ZVZlcnNpb24sIGV2ZXJ5IDEuMC54Cj4gPiA+IHZlcnNpb24gZXZhbHVhdGVzIGFzIHNtYWxsZXIg
dGhhbiAiMjAyNS0wOS0xNiIgYW5kIGlzIHJlcG9ydGVkIGFzCj4gPiA+IGFmZmVjdGVkLCBubyBt
YXR0ZXIgaG93IGZhciB0aGUgcGFja2FnZSBnZXRzIGJ1bXBlZC4KPiA+Cj4gPiBUaGFua3MgYSBs
b3QsIGJ1dCB0aGlzIGlzIG5vdCB0aGUgcmlnaHQgZml4IEknbSBhZnJhaWQuIFRoZSByaWdodCBm
aXgKPiA+IGlzIHRvIHNlbmQgYW4gZS1tYWlsIHRvIE5WRCBhdCBjcGVfZGljdGlvbmFyeUBuaXN0
LmdvdiB0byBhc2sgdGhlbSB0bwo+ID4gdXBkYXRlIHRoZSBDVkUgZW50cnkuIFRoZXkgYXJlIHJl
c3BvbnNpdmUuIFlvdSBqdXN0IG5lZWQgdG8gZXhwbGFpbgo+ID4gdmVyeSBjbGVhcmx5IHdoaWNo
IGNvbW1pdCBmaXhlZCB0aGUgdnVsbmVyYWJpbGl0eSwgaW4gd2hpY2ggcmVsZWFzZSBpdAo+ID4g
d2FzIGludGVncmF0ZWQsIGFuZCB0aGV5IHdpbGwgZml4IHRoZSBDVkUgZGVzY3JpcHRpb24uCj4g
Pgo+ID4gT25jZSB0aGlzIGlzIGRvbmUsIHdlIGNhbiBwb3RlbnRpYWxseSBhY2NlcHQgYXMgYSB0
ZW1wb3JhcnkgbWVhc3VyZSB0bwo+ID4gYWRkIHRob3NlIElHTk9SRV9DVkVTIGVudHJ5Lgo+ID4K
PiA+IFRoZSB3YXkgSSBzZWUgdGhpcyBpcyBsaWtlIHBhdGNoZXM6IGlmIHlvdSBkb24ndCAidXBz
dHJlYW0iIHRoZSBmaXggb2YKPiA+IHRoZSBDVkUgbWV0YWRhdGEsIHRoZW4gd2Ugd2lsbCBoYXZl
IHRvIGtlZXAgdGhvc2UgSUdOT1JFX0NWRVMgZW50cmllcwo+ID4gZm9yZXZlciwgd2hpY2ggaXMg
bm90IGRlc2lyYWJsZS4KPgo+IEkgZmlsZWQgYSByZXF1ZXN0IGEgd2VlayBhZ28uIFRpbGwgbm93
IG5vIGFuc3dlciA6LSgKCkkgZ290IHRoZSBhbnN3ZXIuIEJvdGggQ1ZFcyBhcmUgbm8gbG9uZ2Vy
IHZhbGlkIGZvciB0aGUgY3VycmVudAp2ZXJzaW9uLiBUaGUgcGF0Y2ggY2FuIGJlIGRpc21pc3Nl
ZC4KClllZ29yCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
