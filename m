Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BE3C433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 13:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 156F460D66;
	Sun, 10 Apr 2022 13:55:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M6K2bBmgggmH; Sun, 10 Apr 2022 13:55:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12E4A60D55;
	Sun, 10 Apr 2022 13:55:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D816B1BF86C
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 13:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6FBB827C9
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 13:55:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6M4930L7qrY7 for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 13:55:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D7BF80EE8
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 13:55:21 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id bv19so2894007ejb.6
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 06:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=DE71GxbrJunvzLti1NpDDThzrMtyzs98Dpmm1o4azbU=;
 b=BCqYEQlSiv4UHisaXYI+gR5zyTT6z3Via38f9b6Qa0PavsPLqPTdx5VxjpOLYvRlDM
 cjKYWEHdmaxrDrMXsu7WmpsQRaBUQcZ4Lmcv3IWL1Kgsrj++2+SBigd9dvdLHE3z8O2S
 6iI7b/aqHhLKWPdADp73ABGyD21w8KPq3blUIF9G6RR7xMCfP/yasI6av103DHgDIZ0s
 8D8HbbvXGIRaw0vt8VAOew4gjKhOP8VueevsIPPfobdtA9Y7RF6CHRcyyXrt2YZmjuAI
 rO36ciRN5p6lgFgffR+1t89XdDalwIauVJhwBqrVvScQzJDOCowjf2Hq3hQkDls5p00+
 mQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DE71GxbrJunvzLti1NpDDThzrMtyzs98Dpmm1o4azbU=;
 b=srZrMQkZ6Z1F3PFHNpyaAfzAAtBlfet+It3G/b15C8oOCpl3dm19660DSgengMH5Gv
 TvCbYMJiSQRPIrxt05mbUzYtaFOHr4WCSHmLDM+dDfQaAdBkLphom0dz7m9OMIkKOvxi
 hR2FOkAxtaIqILC8woN9uh2/G/fA4/yjkkFkUq3TfIBJ25aqOcbmd10TnsjBDpD55tBM
 kTsK+w1LlaSv2+VJ2sLq/jimgex+bC7NyQlJhHy2zwhDnyxC1OUhqcRBzGoWI19r8jHr
 Bka5fH3jC9Pns0El3KQEuVDYT5UprGscMrKY/YWHNVUG/bPCUvYSu/7DnQc5fbWIlB+f
 A/SA==
X-Gm-Message-State: AOAM531E17XzYaL1xlU56FB1JamV1oVTaeAGgMjMSeJXLFjaRh3v70hM
 7O/hZjveGtJaQUl370nmP06/eeG3royyLw==
X-Google-Smtp-Source: ABdhPJxc6Nu4O3Fn6ydDbmtMEchHSOAx+8epFTOk5xtmt1vekcast8K7QdsyFDNJWsVNs82WLc2NHQ==
X-Received: by 2002:a17:906:39da:b0:6cf:7f09:a7bc with SMTP id
 i26-20020a17090639da00b006cf7f09a7bcmr27289753eje.457.1649598919450; 
 Sun, 10 Apr 2022 06:55:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 r19-20020a17090638d300b006d6e4fc047bsm11029108ejd.11.2022.04.10.06.55.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Apr 2022 06:55:18 -0700 (PDT)
Message-ID: <b55481af-16ad-4b5c-6db3-b6eaad44bade@mind.be>
Date: Sun, 10 Apr 2022 15:55:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: =?UTF-8?B?6ri464+Z6reg?= <tms320c5x@naver.com>, buildroot@buildroot.org
References: <cc5e9de75c10401fa84e97d2ed49e1@cweb002.nm.nfra.io>
 <ec2bb891e060dfac61aec910aac64df@cweb001.nm.nfra.io>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <ec2bb891e060dfac61aec910aac64df@cweb001.nm.nfra.io>
Subject: Re: [Buildroot] buildroot-2022.02 installation problems
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

ICBIaSwKCk9uIDA0LzA0LzIwMjIgMDM6MjMsIOq4uOuPmeq3oCB3cm90ZToKPiBIZWxsbwo+IAo+
IEkgYW0gdHJ5aW5nIHRvIGxlYXJuIExpbnV4IGxhdGUsIGJ1dCBub3RoaW5nIGlzIGVhc3kuCj4g
Cj4gSXQgdGFrZXMgYSBsb3Qgb2YgZWZmb3J0IGFuZCB0aW1lIHRvIGNvbXBpbGUgaW5kaXZpZHVh
bGx5LCBzdWNoIGFzIGJpbnV0aWxzLCAKPiBnY2MsIGdsaWJjLCBhbmQga2VybmVsLCBldGMgd2hp
Y2ggYXJlIHJlcXVpcmVkIHRvIGJ1aWxkIGEgTGludXggZW52aXJvbm1lbnQuCj4gCj4gYW5kIHRo
ZW4gaGF2ZSBkaXNjb3ZlcmVkIGJ1aWxkcm9vdCBhbmQgaSB0aG91Z2h0IHRoYXQgdGhlIGJ1aWxk
cm9vdCBjb3VsZCBiZSBhIAo+IGxpdHRsZSBlYXNpZXIgdG8gcmVhY2ggbXkgb3JpZ2luYWwgcHVy
cG9zZS4KPiAKPiBJIGFtIGFuIGVuZ2luZWVyLCBzbyBmYXIgSSBoYXZlIGRldmVsb3BlZCBub24t
bGludXggZmllbGRzIHN1Y2ggYXMgYXZyLCBzdG0zMmY0Li4uCj4gCj4gSSdtIGEgYmVnaW5uZXIg
YW5kIEkgZG9uJ3QgaGF2ZSBhbiBlbWJlZGRlZCBib2FyZC4gRmlyc3QsIEkgd2lsbCBjcmVhdGUg
YSAKPiB2aXJ0dWFsIHRhcmdldCB1c2luZyBxZW11IG9uIG15IGxhcHRvcCAodWJ1bnR1IDIwLjA0
LjMpLAo+IAo+IGFuZCB1cGxvYWQgdGhlIGtlcm5lbCAobGludXgtNS4xMS4yMiwgbm9uLXVidW50
dSkgdGhlcmUuIFRvIGRvIHRoaXMsIHRoZSAKCiAgTm90ZSB0aGF0IEJ1aWxkcm9vdCBjYW4gYnVp
bGQgdGhlIGtlcm5lbCBmb3IgeW91IGFzIHdlbGwuCgo+IHRvb2xjaGFpbiBhbmQgZ2xpYmMsIGNv
bXBpbGVyIHdpbGwgYmUgY3JlYXRlZCB0aHJvdWdoIGJ1aWxkcm9vdC4KPiAKPiBUaGUgZmlyc3Qg
dGltZSBJIGRpZCBpdCB3aXRob3V0IGtub3dpbmcgYW55dGhpbmcsIGl0IHdhcyBzdWNjZXNzZnVs
LCBidXQgSSBjYW4ndCAKPiByZW1lbWJlciB3aGljaCBvcHRpb24gSSBjaG9zZS4KPiAKPiBNYXli
ZSB3aGVuIGl0IGZpcnN0IHN1Y2NlZWRlZCwgaSB0aGluayB0aGUgZ2RiIG9wdGlvbiB3YXMgbm90
IGNoZWNrZWQgLgo+IAo+IEFmdGVyd2FyZHMsIGlmIEkgYnVpbGQgd2l0aCB0aGUgZ2RiIG9wdGlv
biBzZWxlY3RlZCBmb3IgdGhlIHRhcmdldCwgYW4gZXJyb3IgCj4gb2NjdXJzIGxpa2UgYmVsb3c6
Cj4gCj4gLi4uLgo+IAo+IFtNYWtlZmlsZTo5MjMwOiBhbGwtZ2RiXSBFcnJvciAyCgogIFRoaXMg
aXMgbm90IHN1ZmZpY2llbnQgdG8gZGVidWcgdGhlIGlzc3VlLCB5b3UnZCBoYXZlIHRvIHBvc3Qg
YSBsYXJnZXIgcGFydCBvZiAKdGhlIG91dHB1dC4gVGhhdCdzIHByb2JhYmx5IGdvaW5nIHRvIGJl
IHRvbyBiaWcgZm9yIGFuIGVtYWlsLCBzbyBwdXQgaXQgaW4gYSAKcGFzdGViaW4gaW5zdGVhZCBh
bmQganVzdCBwb3N0IHRoZSBsaW5rLgoKICBUaGF0IHNhaWQsIEkgY291bGQgcmVwcm9kdWNlIHRo
ZSBpc3N1ZSB3aXRoIEdEQiA5ICh0aGUgZmlyc3QgY29uZmlnIHlvdSAKYXR0YWNoZWQpLCBpdCdz
IGEga25vd24gaXNzdWUgd2l0aCBnbGliYy0yLjM0IFsxXSB3aGljaCB3YXMgZml4ZWQgaW4gR0RC
IDEwLjIgCmJ1dCB0aGUgcGF0Y2ggd2Fzbid0IGJhY2twb3J0ZWQgdG8gR0RCIDkuIFNvIGNoYW5n
aW5nIHRoZSBHREIgdmVyc2lvbiB0byAxMCAKc2hvdWxkIGZpeCBpdC4KCiAgVGhlIHNlY29uZCBj
b25maWcgeW91IGluY2x1ZGVkIGRvZXMgaGF2ZSBHREIgMTAsIGJ1dCBJIGNvdWxkbid0IHJlcHJv
ZHVjZSBhIApHREIgaXNzdWUgdGhlcmUuIEkgaGF2ZW4ndCBhdHRlbXB0ZWQgdG8gYnVpbGQgdGhl
IGZ1bGwgY29uZmlnIGhvd2V2ZXIsIEkgdG9vayBhIApzaG9ydGN1dCBieSB1c2luZyB0aGUgZXh0
ZXJuYWwgdG9vbGNoYWluLgoKICBTbyBpZiB5b3Ugd2FudCB0byBkZWJ1ZyBmdXJ0aGVyLCBwbGVh
c2UgaW5jbHVkZSBhIG1vcmUgZXh0ZW5zaXZlIGxvZyBpbiAKYWRkaXRpb24gdG8gdGhlIGNvbmZp
Z3VyYXRpb24uIEFsc28sIGl0J3MgYmV0dGVyIGlmIHlvdSBhdHRhY2ggYSBkZWZjb25maWcgKD0g
CnRoZSByZXN1bHQgb2YgJ21ha2Ugc2F2ZWRlZmNvbmZpZycpIGluc3RlYWQgb2YgYWxsIGZ1bGwg
Y29uZmlnLCBiZWNhdXNlIGl0J3MgYSAKbG90IHNtYWxsZXIuCgogIEJUVyBJIG5vdGljZWQgdGhh
dCB5b3UgaGF2ZSBhIGxvdCBvZiB3ZWlyZCBwYWNrYWdlcyBzZWxlY3RlZCwgbGlrZSBDVlMuIERv
IHlvdSAKcmVhbGx5IG5lZWQgYWxsIHRoYXQ/CgoKICBSZWdhcmRzLAogIEFybm91dAoKWzFdIGh0
dHBzOi8vc291cmNld2FyZS5vcmcvYnVnemlsbGEvc2hvd19idWcuY2dpP2lkPTI3NTM1CgoKPiAK
PiBNeSBjdXJyZW50IHB1cnBvc2UgaXMgdG8gcmVtb3RlbHkgZGVidWcgYSB2aXJ0dWFsIHRhcmdl
dCBwcm9ncmFtIHRocm91Z2ggCj4gZ2Ric2VydmVyIGluc3RhbGxlZCBvbiB0aGUgdGFyZ2V0IGJh
c2VkIG9uIHFlbXUuCj4gCj4gVG8gZG8gdGhpcywgZ2Ric2VydmVyIG11c3QgYmUgaW5zdGFsbGVk
IG9uIHRoZSB0YXJnZXQsIGJ1dCB0aGlzIGRvZXMgbm90IHdvcmsuCj4gCj4gQXR0YWNoZWQgaXMg
dGhlIC5jb25maWcgZmlsZSB3aGVuIHRoZSBlcnJvciBvY2N1cnMuCj4gCj4gSSBsb29rIGZvcndh
cmQgdG8geW91ciByZXBseS4KPiAKPiBNeSBvcmlnaW5hbCBqb2IgaXMgdG8gY29udHJvbCB0aGUg
bW90b3IuIEJ1dCBiZWZvcmUgdGhhdCwgSSdtIGFscmVhZHkgZXhoYXVzdGVkLgo+IAo+IAo+IGhv
c3Q6IHVidW50dSAyMC4wNC4zLCBhcmNoOiB4ODZfNjQsIHg4Nl82NC1wYy1saW51eC1nbnUtZ2Nj
Cj4gCj4gdGFyZ2V0OiBrZXJuZWwgNS4xMS4yMihib290IGJ5IHFlbXUpLCBhcmNoOiB4ODZfNjQs
IHg4Nl82NC1idWlsZHJvb3QtbGludXgtZ251LWdjYwo+IAo+ID0+VGhlIGNvbW1hbmQgdG8gcnVu
IHFlbXUgd2lsbDoKPiAKPiBxZW11LXN5c3RlbS14ODZfNjQgLWtlcm5lbCAvdXNyL3NyYy9saW51
eC01LjExLjIyL2FyY2gveDg2L2Jvb3QvYnpJbWFnZSAtbSA0MDk2TSAKPiAtc21wIDEgLWJvb3Qg
YyAtaGRhIC9ob21lL2RnZ2lsL0Rvd25sb2Fkcy9idWlsZHJvb3Qvb3V0cHV0L2ltYWdlcy9yb290
ZnMuZXh0NCAKPiAtYXBwZW5kICJyb290PS9kZXYvc2RhIHJ3IGFjcGk9b2ZmIiAtcwo+IAo+IAo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRy
b290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
