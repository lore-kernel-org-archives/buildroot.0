Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282BDC001DB
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 23:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 622C660E5D;
	Mon,  7 Aug 2023 23:49:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 622C660E5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S_2VZ3TtEhMW; Mon,  7 Aug 2023 23:49:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEC1C60B1B;
	Mon,  7 Aug 2023 23:49:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEC1C60B1B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E1B11BF42E
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 23:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2965781EB2
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 23:49:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2965781EB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B0C69MLwD5R2 for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 23:49:33 +0000 (UTC)
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F19481EB0
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 23:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F19481EB0
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1bb69c0070dso3928654fac.1
 for <buildroot@buildroot.org>; Mon, 07 Aug 2023 16:49:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691452172; x=1692056972;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+bSWOaj+bJ/Od19qpcspixKBUR+lK12wWbv9U3uUOok=;
 b=X1FHvi470xEMzb+/6mNt8itIti0LSmA2DQ92T48ZSnBB/LNwrPGcBHS8ol5Sxdi+9c
 jxA6j3AGZAn59dAC6d9oymltDEDIhDCzMOvYVZyT7op4scAWHAuJicUq2JpUh2RamGcd
 W/fHirqr46T+INR8QQZJyuFSuiERzIK0Z4CMv3+7GhHfrbXENseFIr+kbMdGjUfbOfUv
 R6IHNNeZ3vYTsEKkz7GsJMBbeZCaqkKyjTgUpqyRH8lvRXkD+Y+I++kaQH9YiYKj0Xl+
 j1HCFj4bg/TkMIo7ubQb4BPt0RGekJ50OHr113L+ZlqKbhg2XMQ/gfhjdlToyjwdguYv
 XBAg==
X-Gm-Message-State: AOJu0Yw/AKgjoNlEH6LO1RRJ+ABHljR6ab5cSCMPD9pjVzyHFsATIAIW
 iNnM93fbaCd02c+OpeSUy3sgIJAbX4czfKZUGgBqIgaV
X-Google-Smtp-Source: AGHT+IGDrjcjQJyPHD5Cx4XYsyp/vH2Jn3Og6KiJxqKdH38WRPYmgO2KDzjIJz6WXVjjsj/rQ4djclHxBc77s6sGLIU=
X-Received: by 2002:a05:6870:32cf:b0:1bb:fdb7:d979 with SMTP id
 r15-20020a05687032cf00b001bbfdb7d979mr11760010oac.11.1691452171871; Mon, 07
 Aug 2023 16:49:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230806213957.4098743-1-james.hilliard1@gmail.com>
 <20230806235655.1100a637@windsurf>
In-Reply-To: <20230806235655.1100a637@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 7 Aug 2023 17:49:19 -0600
Message-ID: <CADvTj4r2V46KqM13zOJ4WzPPRXJ9MAiaWE3ZzPhX_PG0mPAUoA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691452172; x=1692056972;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+bSWOaj+bJ/Od19qpcspixKBUR+lK12wWbv9U3uUOok=;
 b=PhJS9Wjx4/VF2mA3EsHVSbq9EbvED3x/ZAlDtxQ5tCBChoennYbF0ba/6WfgBXapr7
 DbMwprS32KwPtT8R+eSrhvEvsVpii7lQJY+G69wCSbULQshA40xYCiZh5O/EQUPvGlg/
 OjbLKpVK3yfeE2XUKUJ/y/5E90LDt6fYYOufefqwqqVdHqxXBIYZleTEphfIIScGIq62
 YoZAIdH95jC8IHADcD3MlMGfroa8o5r/tfv+YcXde8rn6g7kX2NYWHLkN7ajspcpMhLG
 +emLxsnpnoVMjI79naVbo2Z4eVS4vX1FcWc/gZ+vR9PrwrrONcQ6TrV17XsLB+1sSaee
 PTrA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=PhJS9Wjx
Subject: Re: [Buildroot] [PATCH 1/1] package/python-boto3: bump to version
 1.28.20
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
Cc: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBBdWcgNiwgMjAyMyBhdCAzOjU24oCvUE0gVGhvbWFzIFBldGF6em9uaQo8dGhvbWFz
LnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBPbiBTdW4sICA2IEF1ZyAyMDIzIDE1
OjM5OjU3IC0wNjAwCj4gSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+
IHdyb3RlOgo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlh
cmQxQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIHBhY2thZ2UvcHl0aG9uLWJvdG8zL3B5dGhvbi1i
b3RvMy5oYXNoIHwgNCArKy0tCj4gPiAgcGFja2FnZS9weXRob24tYm90bzMvcHl0aG9uLWJvdG8z
Lm1rICAgfCA0ICsrLS0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKPgo+IFNhbWUgY29tbWVudCBhcyBmb3IgcHl0aG9uLWJvdG9jb3JlLgoKSSB0
aGluayBvbmx5IHRoZSBweXRob24tYm90b2NvcmUgdXBkYXRlIHdhcyByZXF1aXJlZCB0byBmaXgg
YW55CmZhaWx1cmVzIHdlIHdlcmUgaGl0dGluZywgc28gdGhpcyBBRkFJVSBzaG91bGRuJ3Qgc3Ry
aWN0bHkgcmVxdWlyZSBhbnkKYmFja3BvcnRpbmcoYWx0aG91Z2ggaXQgbWlnaHQgYmUgYSBnb29k
IGlkZWEgdG8gZG8gYW55d2F5cyBzaW5jZSB3ZQp1cGRhdGVkIGJvdG9jb3JlPykuCgo+Cj4gVGhh
bmtzLAo+Cj4gVGhvbWFzCj4gLS0KPiBUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KPiBF
bWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCj4gaHR0cHM6Ly9ib290bGluLmNv
bQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
