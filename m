Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7044C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FA19409A0;
	Sun, 27 Mar 2022 15:45:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m3H09_JjKo-O; Sun, 27 Mar 2022 15:45:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 758C640993;
	Sun, 27 Mar 2022 15:45:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B08A21BF3B9
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACB9940133
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:45:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M_iSebzrV8hU for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:45:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 82BDD40104
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:45:07 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id h4so6586254edr.3
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 08:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=InM8wv/FOsanzxfadg8zkNP5PZHohlPrpnb/D4aUNJc=;
 b=BhzVyUgRcReZtcbNoW6fHYEOTVxp78JmrSvYDr+oPI4SNgODNyYvbWBGFhrfMAjUi8
 Sukh6baSYJm3vxENTiqa19Frf3Jlo/9jtQRD4qNEY4BPfV9Dpt3y6dHzqIod/ZJQmUTy
 kHdU2q/gQUIjKaMgPr5dZwg5kluf2XpsLweq4w/1HLLNgSFxggFwUS8occwFmDnLpo/F
 jkQSfklxCKgMnsxeCeaq1Q/GCqWeG4gWNL8hsdHArM0tEpvuIi36E57aXDNYGWUzmhlV
 kBV+MFQvv0ydo0MY3/1E73BCBfsNsq+kdKfPgNaqLv0yCckhwNWZrUI0Y/cQblNlWDi3
 O+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=InM8wv/FOsanzxfadg8zkNP5PZHohlPrpnb/D4aUNJc=;
 b=HmNYlb0RYugwfIMFN11XmUXDTotfJd2XjxS+5N1LETLmTH4y2mnWEAyCwoSj5w4a/l
 BkKi8KDicLuWpYn1sP/Kzn+4zxIpjwt2EIfH20b868HgTS04NqrwkKOe21goowRKo3Qb
 wzbitsFTc0mdTb75q38WxhuVCZvfDz3WuxCHwmHOK4DaTC2SWJ+atNlYJTv77PC16xXw
 XpTMA08aw0Dil+Pkuz17YCooV4pcrZi4+UaGl1h3KlPLsagCFNa1HQSM+9PmYwNefF23
 MWek+9YgP4Z4i27JK70GUY5vowJbgn3LToBceXBHbEJXY3CZ1Nx/KqtM5K1HILMn9dR1
 qa+g==
X-Gm-Message-State: AOAM531LJCL+TfQ5gn6lD92cyNZF/iVGYY43OjwMX3yPWk7swB6ZrYy2
 /mLb1uDTGQOGiUnRtW/5u6OLfOEYSK6yzA==
X-Google-Smtp-Source: ABdhPJxYO8FvAZTUDKVJFBZ/d4KdZdkpl5cnpGX0R1SlhqKaMjvXIQxa7j4oQGgVCWPZtjACtf3SOQ==
X-Received: by 2002:a05:6402:1906:b0:418:ff14:62b8 with SMTP id
 e6-20020a056402190600b00418ff1462b8mr10950978edz.40.1648395905767; 
 Sun, 27 Mar 2022 08:45:05 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 qk30-20020a1709077f9e00b006dfae33d969sm4748660ejc.216.2022.03.27.08.45.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 08:45:05 -0700 (PDT)
Message-ID: <1ebb6766-2a49-1452-87e9-73b7bddd4353@mind.be>
Date: Sun, 27 Mar 2022 17:45:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause@embedded.rocks>,
 buildroot@buildroot.org
References: <20220318175156.186854-1-joerg.krause@embedded.rocks>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220318175156.186854-1-joerg.krause@embedded.rocks>
Subject: Re: [Buildroot] [PATCH 1/1] package/pugixml: bump to version 1.12.1
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

CgpPbiAxOC8wMy8yMDIyIDE4OjUxLCBKw7ZyZyBLcmF1c2Ugd3JvdGU6Cj4gVGhlIGxpY2Vuc2Ug
ZmlsZSBoYXMgdXBkYXRlZCB0aGUgY29weXJpZ2h0IHllYXIgdG8gMjAyMiwgdGhlcmVmb3JlCj4g
dXBkYXRlIHRoZSBoYXNoIG9mIHRoZSBsaWNlbnNlIGZpbGUgYXMgd2VsbC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBKw7ZyZyBLcmF1c2UgPGpvZXJnLmtyYXVzZUBlbWJlZGRlZC5yb2Nrcz4KCiAgQXBw
bGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gLS0tCj4gICBw
YWNrYWdlL3B1Z2l4bWwvcHVnaXhtbC5oYXNoIHwgNCArKy0tCj4gICBwYWNrYWdlL3B1Z2l4bWwv
cHVnaXhtbC5tayAgIHwgMiArLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHVnaXhtbC9wdWdpeG1s
Lmhhc2ggYi9wYWNrYWdlL3B1Z2l4bWwvcHVnaXhtbC5oYXNoCj4gaW5kZXggNWM2MjlhYzY2Zi4u
MTkwZGZiNmE2ZSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3B1Z2l4bWwvcHVnaXhtbC5oYXNoCj4g
KysrIGIvcGFja2FnZS9wdWdpeG1sL3B1Z2l4bWwuaGFzaAo+IEBAIC0xLDMgKzEsMyBAQAo+ICAg
IyBMb2NhbGx5IGNvbXB1dGVkOgo+IC1zaGEyNTYgIDhkZGY1N2I2NWZiODYwNDE2OTc5YTNmMDY0
MGMyYWQ0NWRkZGRiYmFmYTgyNTA4ZWYwYTBhZjNjZTcwNjE3MTYgIHB1Z2l4bWwtMS4xMS40LnRh
ci5nego+IC1zaGEyNTYgIGVlNDk1ZjM0YWVmZjBjNTc4YTk5ZjMzNTBhMjA1MGQ0ZTU4NjBkMjdi
MjAwNGMwM2MzODRhNTk0ZmEyYjBhN2EgIExJQ0VOU0UubWQKPiArc2hhMjU2ICBkY2Y2NzFhOTE5
Y2M0MDUxMjEwZjA4ZmZkM2VkZjllNDI0N2Y3OWFkNTgzYzYxNTc3YTEzZWU5M2FmMzNhZmM3ICBw
dWdpeG1sLTEuMTIuMS50YXIuZ3oKPiArc2hhMjU2ICAyMDZmNjcxYjZkMzQyNTU3YWRjYzk3MzA4
OGMyYzYzOGRmMGVjMGIxZGFiYmNkMjRlNjVhYWRkMjE5MTc3OGQyICBMSUNFTlNFLm1kCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvcHVnaXhtbC9wdWdpeG1sLm1rIGIvcGFja2FnZS9wdWdpeG1sL3B1
Z2l4bWwubWsKPiBpbmRleCBiYzAxODE4MGVmLi45MTM3ZjA0NjMwIDEwMDY0NAo+IC0tLSBhL3Bh
Y2thZ2UvcHVnaXhtbC9wdWdpeG1sLm1rCj4gKysrIGIvcGFja2FnZS9wdWdpeG1sL3B1Z2l4bWwu
bWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgICMKPiAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4g
ICAKPiAtUFVHSVhNTF9WRVJTSU9OID0gMS4xMS40Cj4gK1BVR0lYTUxfVkVSU0lPTiA9IDEuMTIu
MQo+ICAgUFVHSVhNTF9TSVRFID0gaHR0cHM6Ly9naXRodWIuY29tL3pldXgvcHVnaXhtbC9yZWxl
YXNlcy9kb3dubG9hZC92JChQVUdJWE1MX1ZFUlNJT04pCj4gICBQVUdJWE1MX0xJQ0VOU0UgPSBN
SVQKPiAgIFBVR0lYTUxfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UubWQKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
