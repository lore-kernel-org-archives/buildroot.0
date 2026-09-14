Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D146C88E50
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 12:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2038080DF5;
	Mon, 14 Sep 2026 12:00:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lr8GNO1HfJ7V; Mon, 14 Sep 2026 12:00:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0FF7980E0D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789387216;
	b=K2JQMI+GCvfcYpF6CTB37Sso5iPwmukF7FRZywCQTjVuWQ88srN3YSoF1s4UsKZJrd4O
	 neJKG43dTKd5YJ91xGUjWndN2t0o7Sg/nTOAY2Ecnn6PnCx/5T/6I0SO0zuo+PhnPoIBi
	 BW+zy4vwlTC4ahU9D4qLTT9GT07pAXpzl3AluIjH7bUlLjYAi/GXey29Fz5EhUNflTw0J
	 kqabvSEqihJV19XrN07rBG5NJAjvJHlsM8NSwStBAtxH1SOBjnx11lpCoNg8QDizUwdv+
	 wrbzSyzUrV48NcQlpEHAISDl7Cb9j4Sxe8LmBwSv2jpuNlhFncuipH79s5dL1ZDkj5A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789387216;
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
	bh=oZMjoV2+oa5tPRFkX3OojGjiA6LhnuRzJHEKeQdyhOQ=;
	b=Utcg7Omiw+ePPXK4kFGE6UnDtwWSHq0FpDDqcGDfcBK1+b9h7J5ZTFXMa6IMivBNWKFb
	 H7cXH5s8f48ALMiHHyj5pOi4ixE9W14uI1y+ek1E20EZiW/DbDqfx13sJzu6J2W2bq4WI
	 v4XyOiUhIjpOl62ieOKkOGjZIGxwLUDlQ84enSB3K0OsicSHTSjbESijqeuVOAhFmFjXr
	 NT/wzBt/1832NLVWXuvVaQaFlyjSG7Onz8je7qoGltLqIT592QINytIssrLUpGnOxVCTN
	 i+ro2mtEo2owHOxxQiv+bdR5dWmj6KQsFCX6PtSBtQTmZ314J1SMJIX6tjRDsbXcK2g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789387216;
	bh=oZMjoV2+oa5tPRFkX3OojGjiA6LhnuRzJHEKeQdyhOQ=;
	h=From:Date:To:CC:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ARLfQa5BCRVvuJDQymjz/4BuDufBZczthjAthc9e74dvQAlD1H4Seh0XfVaD1cIDF
	 VGIwyCsYlHJGMLSjVWRIsVkViM145LY8TSXijuKFkjePaGqjHBxa4Jg2P4MDaxUC/5
	 6MkJv+rF7IgtWm5EbxwbJl4UjfOOFAHhkJmvQUWrYj7YppcWmXXNwJ6aLvyU61lyGQ
	 pPThAB66H85aw+qXh4LSPnyF8IHg384YipefBsmjBIhRC/0v/ECcw3zEERXvdVoyhu
	 8v4F8cP9smvBqaLQs0jtnAPzz6HGpdfuPO7JiyNFdL6rv8ZKObsHqKVZY0WMJNOSBr
	 NCjACz4d92xbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FF7980E0D;
	Mon, 14 Sep 2026 12:00:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F0C94109
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 12:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E248E40119
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 12:00:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3qspGXzdj_Kg for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 12:00:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 7031D400C2
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=80.12.126.238
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789387214;
 b=N0u6Keg54mqwcksdKAdjQ8ZKGRQSUuL/GVAzkm7HpgyDdpGtvJ7y0JvxubhfdzaC1abu
 qKIn6dXtwC2svg3olfxsJYJM1+B4AL//l064XmJ+dOFuCXoERuj6tYDFW3lNHbQVaFoOQ
 H9E+eQmhuPjXFeNTpdmDySq3mu1bzljrrEKYobxvkO2b93qCGeMP41CXXxaBLOQsLYj5v
 BUaofyqD3XGm0aVKv0c0A+ykM0VSpO0CXGYuSr1WbBdSXnTNMFDktxCm5idRnJttL+zVQ
 omrWyczq/QbDUWTWlvtWJ57q0WwH/yg13EsyJmbHaNrzpsS+IE873Nio5xmd62DV9BQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789387214;
 h=Received-SPF:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
 Received:Received:Received:Received:From:X-CSE-ConnectionGUID:
 X-CSE-MsgGUID:X-IronPort-AV:X-Amp-Result:Date:To:CC:Subject:
 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
 In-Reply-To:X-Originating-IP:X-ClientProxiedBy:
 Content-Transfer-Encoding;
 bh=xxwOhhycs6UBAizST06lDWIz3ErubNApyHxPiOQqyiQ=;
 b=jJkG2taoWpMnmDiFwqLTh5VEU/yTzY63ZRFgw6Y8i9zsRKKTP/dWAS0Dw8UXrZX9z2gc
 1MSidwcz8WxbkIyrm0TlKLL7E/d3HFAVSNzpZi+3XlOcclMduJ8QiSfq6aGePtFcVba8t
 BHOqdyWQ6PEbY4D+Oi1iGR1aYmZFzMNVqwxm/iAk2Ng1siWwZHCvAaLMtyF3HCf99eIwA
 +eqmoXP0l/jcVp3GL511Fx0h90qq/oen+1teQK4dEnE48obo4Yw+fgNsCsLNvNYfRaml0
 bifdFMwuzWvX9K+3GzH9iXAleej318VOkSJOdYI7WxgbDu11URznE51UmTd2EKdkjwA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=orange.com; 
 dkim=pass header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=SpQjgdAa; 
 arc=none smtp.remote-ip=80.12.126.238
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.238;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=orange.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=SpQjgdAa
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.238])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7031D400C2
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 12:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1789387214; x=1820923214;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=xxwOhhycs6UBAizST06lDWIz3ErubNApyHxPiOQqyiQ=;
 b=SpQjgdAaRSh45QVUKOYu7whxfKULWpgQU5/GzEynEFo0wYL1Fp2eQfY+
 5wXVcUGjRzXF/Nd8hEQrp42DWqyQmw7ekpgKgCxO8F73kbkBGWmgqqN8k
 axxrnZscmChs05AatbZdr24ZAfmGdK6sU25EHrct/4m9mZsIR0RRTvb7e
 Tb3Oj3m1f0q5vHZPANvzKBrKhqb6lrpR/K5j7xebCQAlmPdSJvNHA8dbK
 qw8rvM7PLXm4XgxZgDTVbTyRv+Uv9oGwLSmyt3HcwXHGZw4H1NFTAkRKn
 Fb1V1CMD+T6xkzi80Ircvl2NgK+87CRw2EH8KGo2i0SwGymVBoJCH+YM/ w==;
X-CSE-ConnectionGUID: Rt4414u3SuukJmBqyTZ+Fg==
X-CSE-MsgGUID: u13adaDRT3CLZ3SPDH1WbA==
Received: from unknown (HELO opfedv3rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 14 Sep 2026 14:00:10 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 14:00:10 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46;
 Mon, 14 Sep 2026 14:00:08 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 14 Sep 2026 14:00:08 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: SvcVnZy+QDeMrDIIJoip9w==
X-CSE-MsgGUID: y7ttnsIwTTmbdWPeGgMNWA==
X-IronPort-AV: E=Sophos;i="6.27,102,1787004000"; d="scan'208";a="467515694"
X-Amp-Result: SKIPPED(no attachment in message)
Date: Mon, 14 Sep 2026 14:00:08 +0200
To: Vincent Fazio <vfazio@xes-inc.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <aqfhyLQh3MXmcRSB@yd-6wlzhs3>
References: <cover.1786368449.git.yann.morin@orange.com>
 <c45315df9f1084fe0f6f932e1523cfa9c4e6d992.1786368449.git.yann.morin@orange.com>
 <PH1P110MB16031631D241E9E2C84C0CF49FA5A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <aqe-BvOFrZnDF1YR@yd-6wlzhs3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aqe-BvOFrZnDF1YR@yd-6wlzhs3>
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX504.corporate.adroot.infra.ftgroup
 (10.115.26.28) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
Subject: Re: [Buildroot] [PATCH 2/2] support/scripts/size-stats: properly
 assign pre-compiled .pyc files
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

VmluY2VudCwgQWxsLAoKT24gMjAyNi0wOS0xNCAxMToyNyArMDIwMCwgTU9SSU4gWWFubiBJTk5P
Vi9JVC1TIHNwYWtlIHRodXNseToKPiBPbiAyMDI2LTA4LTE5IDEzOjQ0ICswMDAwLCBWaW5jZW50
IEZhemlvIHNwYWtlIHRodXNseToKWy0tU05JUC0tXQo+ID4gTWF5YmUgd2UgY2FuIGxldmVyYWdl
IGBzb3VyY2VfZnJvbV9jYWNoZWAgWzJdIGFuZCBjb21wYXJlIHRoZSBmaWxlIG5hbWVzPwo+IEFo
LCBnb29kIGlkZWEgaWYgaXQgY2FuIHdvcmsgb3V0LW9mLXRyZWUgYXMgd2UgaW5zdGFsbCBmb3Ig
dGhlIHRhcmdldC4KPiBJJ2xsIGxvb2sgaW50byB0aGF0LgoKT2gsIHdhaXQsIHdhaXQuLi4gVGhh
dCdzIHRoZSBvdGhlciB3YXkgYXJvdW5kOiB3ZSBkbyBoYXZlIHRoZSBwYXRoIG9mCnRoZSBvcmln
aW5hbCAucHkgZmlsZSwgYW5kIHdlIGFyZSBsb29raW5nIGZvciB0aGUgcGF0aCBvZiB0aGUKcHJl
LWNvbXBpbGVkIGZpbGUhCgpTbyBJIGdhdmUgaXQgYSB0cnkgd2l0aCBjYWNoZV9mcm9tX3NvdXJj
ZSgpIFswXSBpbnN0ZWFkLCBhbmQgaXQga2luZGEKb2Ygd29ya3MuLi4KCiJLaW5kYSIsIGJlY2F1
c2UgaXQgb25seSB3b3JrcyB3aGVuIHdlIGRvIGhhdmUgYm90aCB0aGUgc291cmNlIGFuZCB0aGUK
cHJlLWNvbXBpbGVkIGZpbGVzIHRvZ2V0aGVyIChCUjJfUEFDS0FHRV9QWVRIT04zX1BZX1BZQyks
IGJ1dCBmYWlscwp3aGVuIHdlIG9ubHkgaGF2ZSB0aGUgcHJlY29tcGlsZWQgZmlsZXMgKEJSMl9Q
QUNLQUdFX1BZVEhPTjNfUFlDX09OTFkpLgpUaGF0J3MgYmVjYXVzZSBjYWNoZV9mcm9tX3NvdXJj
ZSgpIG9ubHkgd29yayBvbiB0aGUgcGF0aCBzdHJpbmcsIGFuZApkb2VzIG5vdCBjaGVjayBmaWxl
cy4KCkJ1dCB0aGF0IGlzIG5vdCBhbiBpc3N1ZSBpbiBwcmFjdGljZToKCjEuIEJSMl9QQUNLQUdF
X1BZVEhPTjNfUFlfT05MWTogd2Ugb25seSBoYXZlIC5weSBmaWxlcywgc28gd2hlbiB3ZSB0cnkK
ICAgdG8gbG9vayBhdCB0aGUgY3ByZmUtY29wbXBpbGVkIGZpbGVzLCBpdCB3aWxsIG5vdCBiZSBm
b3VuZCwgYW5kIHRodXMKICAgaWdub3JlZCAoYXMgaXQgaXMgdG9kYXkgYWxyZWFkeSkKCjIuIEJS
Ml9QQUNLQUdFX1BZVEhPTjNfUFlDX09OTFk6IHdlJ2xsIG9ubHkgaGF2ZSB0aGUgLnB5YyBmaWxl
IGluIHRoZQogICBweWNhY2hlIGRpcmVjdG9yeSwgYW5kIHRoZSAucHkgZmlsZSB3aWxsIGJlIGln
bm9yZWQgKGFzIGl0IGlzIHRvZGF5CiAgIGFscmVhZHkpLgoKMy4gQlIyX1BBQ0tBR0VfUFlUSE9O
M19QWV9QWUM6IGJvdGggd2lsbCBiZSBmb3VuZCwgYW5kIHdlJ2xsIHByb3Blcmx5CiAgIGFjY291
bnQgZm9yIGJvdGggKHVubGlrZSB0b2RheSkKClNvLCB0aGF0J3Mgd2hhdCBJJ20gZ29pbmcgdG8g
Z28gd2l0aCwgdXNpbmcgY2FjaGVfZnJvbV9zb3VyY2UoKSwgcmF0aGVyCnRoYW4gd2l0aCBteSBv
cGVuLWNvZGluZyB0aGUgc3BsaXQuIFRoYW5rcyBmb3IgdGhlIGhpbnQhIPCfkY0KCkhvd2V2ZXIs
IEkgaGF2ZSBub3Qgc2VlbiBhIHdheSB0byBjb252ZXJ0IGZyb20gYSBzb3VyY2UgZmlsZSBwYXRo
IHRvIGFuCipvcHRpbWlzZWQqIHByZWNvbXBpbGVkIHB5YyBmaWxlLiBTbyBJIHN0aWxsIGJlbGll
dmUgdGhpcyBzaG91bGQgYmUKYWRkcmVzc2VkIHdoZW4gKGlmISkgd2UgZXZlbnR1YWxseSBhZGQg
c3F1cHBvcnQgZm9yIG9wdGltaXNlZApwcmVjb21waWxlZCBweWMgZmlsZXMuIElmIHdlIGZvcmdl
dCBhYm91dCBzaXplLXN0YXQgdGhlbiwgdGhhdCdzIG5vdCBhCnByb2JsZW06IHRoZSBpbnRlcmVz
dGVkIHBhcnRpZXMgd2lsbCBoYXZlIHRvIGZpeHVwIGFmdGVyd2FyZCAobGlrZSBJJ20KY3VycmVu
dGx5IGRvaW5nIGFueXdheSA7LSkgKS4KClswXSBodHRwczovL2dpdGh1Yi5jb20vcHl0aG9uL2Nw
eXRob24vYmxvYi8yMGU2YzJmYzdjMTc0MzQyMjE0ZDU2MTg0NTQxOWM0MDMwZjg2MzhmL0xpYi9p
bXBvcnRsaWIvX2Jvb3RzdHJhcF9leHRlcm5hbC5weSNMMjM5CgpSZWdhcmRzLApZYW5uIEUuIE1P
UklOLgoKLS0gCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX19fX19f
X19fX18KLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tOiAgICAgICBfICAg
IDotLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVk
ZGVkIHwgICAgX18vICkgICB8IC8iXCBBU0NJSSBSSUJCT04gfAp8ICAgICAgICAgICAgICAgICB8
IFNvZnR3YXJlICBEZXNpZ25lciB8ICBfLyAtIC8nICAgfCBcIC8gQ0FNUEFJR04gICAgIHwKfCAr
MzMgNjM4LjQxMS4yNDUgJy0tLS0tLS0tLS0tLS0tLS0tLS0tOiAoXyAgICBgLS0sIHwgIFggIEFH
QUlOU1QgICAgICB8CnwgeWFubi5tb3JpbiAoYXQpIG9yYW5nZS5jb20gICAgICAgICAgIHxfPSIg
ICAgLC0tJyB8IC8gXCBIVE1MIE1BSUwgICAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS06X19fX19fL19fX19fOi0tLS0tLS0tLS0tLS0tLS0tLScKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KQ2UgbWVzc2FnZSBldCBz
ZXMgcGllY2VzIGpvaW50ZXMgcGV1dmVudCBjb250ZW5pciBkZXMgaW5mb3JtYXRpb25zIGNvbmZp
ZGVudGllbGxlcyBvdSBwcml2aWxlZ2llZXMgZXQgbmUgZG9pdmVudCBkb25jDQpwYXMgZXRyZSBk
aWZmdXNlcywgZXhwbG9pdGVzIG91IGNvcGllcyBzYW5zIGF1dG9yaXNhdGlvbi4gU2kgdm91cyBh
dmV6IHJlY3UgY2UgbWVzc2FnZSBwYXIgZXJyZXVyLCB2ZXVpbGxleiBsZSBzaWduYWxlcg0KYSBs
J2V4cGVkaXRldXIgZXQgbGUgZGV0cnVpcmUgYWluc2kgcXVlIGxlcyBwaWVjZXMgam9pbnRlcy4g
TGVzIG1lc3NhZ2VzIGVsZWN0cm9uaXF1ZXMgZXRhbnQgc3VzY2VwdGlibGVzIGQnYWx0ZXJhdGlv
biwNCk9yYW5nZSBkZWNsaW5lIHRvdXRlIHJlc3BvbnNhYmlsaXRlIHNpIGNlIG1lc3NhZ2UgYSBl
dGUgYWx0ZXJlLCBkZWZvcm1lIG91IGZhbHNpZmllLiBNZXJjaS4NCg0KVGhpcyBtZXNzYWdlIGFu
ZCBpdHMgYXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG9yIHByaXZpbGVnZWQg
aW5mb3JtYXRpb24gdGhhdCBtYXkgYmUgcHJvdGVjdGVkIGJ5IGxhdzsNCnRoZXkgc2hvdWxkIG5v
dCBiZSBkaXN0cmlidXRlZCwgdXNlZCBvciBjb3BpZWQgd2l0aG91dCBhdXRob3Jpc2F0aW9uLg0K
SWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0
aGUgc2VuZGVyIGFuZCBkZWxldGUgdGhpcyBtZXNzYWdlIGFuZCBpdHMgYXR0YWNobWVudHMuDQpB
cyBlbWFpbHMgbWF5IGJlIGFsdGVyZWQsIE9yYW5nZSBpcyBub3QgbGlhYmxlIGZvciBtZXNzYWdl
cyB0aGF0IGhhdmUgYmVlbiBtb2RpZmllZCwgY2hhbmdlZCBvciBmYWxzaWZpZWQuDQpUaGFuayB5
b3UuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
