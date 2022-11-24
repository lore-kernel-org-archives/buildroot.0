Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B9AC433FE
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 17:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9AC382225;
	Thu, 24 Nov 2022 17:07:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9AC382225
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HgOxk2uyH3xM; Thu, 24 Nov 2022 17:07:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE1DF8221E;
	Thu, 24 Nov 2022 17:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE1DF8221E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D0C51BF5EA
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 17:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0548140150
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 17:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0548140150
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w1gFQWRKPCJE for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 17:07:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8ACAF400D8
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8ACAF400D8
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 17:07:37 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id ho10so5433558ejc.1
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 09:07:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0lG+7cHuwc09yFV2k//PJc0iuh0Tin4VNC49Nkv+kX0=;
 b=Xk9WlvphDq2AYppXS2css1JCg6SZwgvTiGOT5OfZ6b84yVbLUnFCg0X/f10pxr9ypA
 otc8HinkuA1I6jxpIVgm+NSGWigFhHE0ISp4atoc7kHlEWgGIeQ8Oyth7eP9eaa7UCXl
 18+xo14Yt64kENJVOVCg0YbUeUxpgI7QBMeNbeml6Qq4eJv/6n/fslcA2q3mIHE9VAfS
 52kQBnbGPmKqw3Zc777fEk0jZrwfISANYZEV2JrkrDRqsQ6kTSGcRbq/YFKFai0YIA5W
 o/PQBo3pPXZCGO201wsPwRhvEKAY7IORVRTduna7nWsyLMqSson0Av4GE2lc2m7jRrXk
 TOSw==
X-Gm-Message-State: ANoB5plphu0kQ850zi3eX4LjMueVmvTqz1fwsk3sQvuIfAUNbxDDwXnL
 HKhPSbd4ElgndGch/HMtBayU0ewabXZnvw==
X-Google-Smtp-Source: AA0mqf6pt7R9QaJtVIRs+udDEH+hMQyb4p3/tgM4S6K8viQy+M5Rx0z+XjK0+9E3Bp8X3HDCbewxkA==
X-Received: by 2002:a17:907:8d02:b0:7ad:f43a:cb07 with SMTP id
 tc2-20020a1709078d0200b007adf43acb07mr4724034ejc.562.1669309655645; 
 Thu, 24 Nov 2022 09:07:35 -0800 (PST)
Received: from [10.1.0.116] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 j17-20020a17090623f100b00741a251d9e8sm612921ejg.171.2022.11.24.09.07.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Nov 2022 09:07:35 -0800 (PST)
Message-ID: <ae8ad666-4560-63dc-254e-56a62196b4b1@mind.be>
Date: Thu, 24 Nov 2022 18:07:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-GB
To: "Becker, Fabian" <Fabian.Becker@zeus.de>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <5b6ec3ddc6637a3bd348687bbf2c2e40784727f2.camel@zeus.de>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <5b6ec3ddc6637a3bd348687bbf2c2e40784727f2.camel@zeus.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0lG+7cHuwc09yFV2k//PJc0iuh0Tin4VNC49Nkv+kX0=;
 b=V7musw5F0Ji9vDsh95jXSYaes7ViR8B0VVr4O3FuGxpxpsQJhZwSYYlqF4YqU9VhLB
 OrYiWkOY+6hGalKohfbPxhFV/G22W5rzCl3KVzMdb6OhweQNXFgzBr2tV2TVYiffolnm
 s3z8bzsTfvC/nfJgTQhKk3Hg33NktpNPbG2FmUSXEcLBWN7CWPe+icyhh5/9NAVkZp21
 L7oPHEUZFdqQWSW2zXFjHKTWLF4zLiucrENrQELT2rMXvDEvnDllVQip+e+wc+E6N8CW
 eSsEuD7586f5BlrYV3Wx2x7GFXTUtIOtKmFzLSoUljYJCjbKz2gjioXSL+KZ/hpXc8PP
 CrFw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=V7musw5F
Subject: Re: [Buildroot] Errors generating initramfs with dracut
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyMy8xMS8yMDIyIDE0OjAzLCBCZWNrZXIsIEZhYmlhbiB3cm90ZToKPiBIZWxsbyBGb2xr
cywKPiAKPiBpJ20gY3VycmVudGx5IGV2YWx1YXRpbmcgaW5pdHJhbWZzIGdlbmVyYXRpb24gd2l0
aCBkcmFjdXTCoGluIDIwMjIuMTEtcmMyIGFuZCAKPiBoYXZlIGVuY291bnRlcmVkCj4gc2V2ZXJh
bCBlcnJvcnMuIE5vdCBzdXJlIGlmIHRoaXMgaXMgYSBkcmFjdXQgb3IgYnVpbGRyb290IHByb2Js
ZW0uCgogIFByb2JhYmx5IGEgYml0IG9mIGJvdGggOi0pCgpbc25pcF0KPiBkcmFjdXQtaW5zdGFs
bDogRVJST1I6IGluc3RhbGxpbmcgCj4gJy9ob21lL2Rldi9yaXZhL291dHB1dC9ob3N0L2xpYi9k
cmFjdXQvbW9kdWxlcy5kLzkwa2VybmVsLQo+IG1vZHVsZXMvcGFyc2Uta2VybmVsLnNoJyB0byAn
L2xpYi9kcmFjdXQvaG9va3MvY21kbGluZS8wMS1wYXJzZS1rZXJuZWwuc2gnCj4gZHJhY3V0OiBG
QUlMRUQ6IC9ob21lL2Rldi9yaXZhL291dHB1dC9ob3N0L2xpYi9kcmFjdXQvZHJhY3V0LWluc3Rh
bGwgLXIKPiAvaG9tZS9kZXYvcml2YS9vdXRwdXQvYnVpbGQvYnVpbGRyb290LWZzL2NwaW8vdGFy
Z2V0IC1EIAo+IC9ob21lL2Rldi9yaXZhL291dHB1dC9idWlsZC9idWlsZHJvb3QtCj4gZnMvY3Bp
by90bXAvZHJhY3V0LmVCMEZmUC9pbml0cmFtZnMgCj4gL2hvbWUvZGV2L3JpdmEvb3V0cHV0L2hv
c3QvbGliL2RyYWN1dC9tb2R1bGVzLmQvOTBrZXJuZWwtCj4gbW9kdWxlcy9wYXJzZS1rZXJuZWwu
c2ggL2xpYi9kcmFjdXQvaG9va3MvY21kbGluZS8wMS1wYXJzZS1rZXJuZWwuc2gKPiBjaG1vZDog
Y2Fubm90IGFjY2VzcyAnL2hvbWUvZGV2L3JpdmEvb3V0cHV0L2J1aWxkL2J1aWxkcm9vdC0KPiBm
cy9jcGlvL3RtcC9kcmFjdXQuZUIwRmZQL2luaXRyYW1mcy8vbGliL2RyYWN1dC9ob29rcy9jbWRs
aW5lLzAxLXBhcnNlLWtlcm5lbC5zaCc6IE5vIHN1Y2ggZmlsZSBvcgo+IGRpcmVjdG9yeQoKICBJ
IHdvdWxkIHNheSB0aGlzIGxvb2tzIGxpa2UgYSBkcmFjdXQgcHJvYmxlbTogZHJhY3V0IGlzIHN1
cHBvc2VkIHRvIGludGFsbCAKdGhhdCBmaWxlLCBidXQgaXQgZG9lc24ndCBzZWVtIHRvIGV4aXN0
Li4uCgo+IGRyYWN1dC1pbnN0YWxsOiBFUlJPUjogaW5zdGFsbGluZyAKPiAnL2hvbWUvZGV2L3Jp
dmEvb3V0cHV0L2hvc3QvbGliL2RyYWN1dC9tb2R1bGVzLmQvOTBrZXJuZWwtCj4gbW9kdWxlcy9p
bnNtb2Rwb3N0LnNoJyB0byAnL3NiaW4vaW5zbW9kcG9zdC5zaCcKPiBkcmFjdXQ6IEZBSUxFRDog
L2hvbWUvZGV2L3JpdmEvb3V0cHV0L2hvc3QvbGliL2RyYWN1dC9kcmFjdXQtaW5zdGFsbCAtcgo+
IC9ob21lL2Rldi9yaXZhL291dHB1dC9idWlsZC9idWlsZHJvb3QtZnMvY3Bpby90YXJnZXQgLUQg
Cj4gL2hvbWUvZGV2L3JpdmEvb3V0cHV0L2J1aWxkL2J1aWxkcm9vdC0KPiBmcy9jcGlvL3RtcC9k
cmFjdXQuZUIwRmZQL2luaXRyYW1mcyAKPiAvaG9tZS9kZXYvcml2YS9vdXRwdXQvaG9zdC9saWIv
ZHJhY3V0L21vZHVsZXMuZC85MGtlcm5lbC0KPiBtb2R1bGVzL2luc21vZHBvc3Quc2ggL3NiaW4v
aW5zbW9kcG9zdC5zaAo+IAo+IFNlZW1zIHRvIGJlIGEgcHJvYmxlbSB3aXRoIGZpbGVzIGluc3Rh
bGxlZCB2aWEgaW5zdF9zaW1wbGUgZnJvbSBkcmFjdXQtaW5pdC5zaCwgCj4gaW5zdF9tdWx0aXBs
ZSB3b3Jrcwo+IGp1c3QgZmluZS4gSSB0cmllZCBlbmFibGluZyBkZWJ1ZyBzd2l0Y2hlcyBpbiB0
aGUgY2FsbCB0byBkcmFjdXQtaW5zdGFsbCBhbmQgCj4gZmluZCBvdXQgd2h5IGl0J3MKPiBmYWls
aW5nLCBidXQgdGhhdCB3YXMgbm90IHJlYWxseSBoZWxwZnVsLgoKICBZYW5uIGhhcyBiZWVuIGRl
YnVnZ2luZyBhIGRpZmZlcmVudCBkcmFjdXQgaXNzdWUgcmVjZW50bHksIHBlcmhhcHMgaGUgaGFz
IHNvbWUgCmlkZWFzIG9uIGhvdyB0byBnZXQgYmV0dGVyIGRlYnVnZ2luZyBpbmZvLgoKICBkcmFj
dXQtaW5zdGFsbCBoYXMgLS1kZWJ1ZyAtYW5kIC0tbG9nZGlyIG9wdGlvbnMsIHRob3NlIG1heSBo
ZWxwLgoKCiAgSG93ZXZlciwgZG8gdGhlc2UgbWlzc2luZyBtb2R1bGVzIGFjdHVhbGx5IHBvc2Ug
YW4gaXNzdWU/IEkgdGhpbmsgd2UgZ2V0IGEgCmJ1bmNoIG9mIGVycm9yIG1lc3NhZ2VzIGZyb20g
ZHJhY3V0IGV2ZW4gaW4gYSBrbm93bi10by1iZS13b3JraW5nIGltYWdlLiBkcmFjdXQgCmlzIGEg
Yml0IG9mIGEgbWVzcy4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gCj4gUmVnYXJkcywKPiAKPiBG
Qgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
YnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
