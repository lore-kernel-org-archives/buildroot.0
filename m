Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E857AC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 18:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2AA160AA6;
	Tue, 16 Jul 2024 18:05:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R6Q6bDQEfJOC; Tue, 16 Jul 2024 18:05:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D5FC607C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D5FC607C6;
	Tue, 16 Jul 2024 18:05:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AFB441BF3CB
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 18:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9E9E409DC
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 18:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DawZqVjFz3Hp for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 18:05:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2798A405F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2798A405F5
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2798A405F5
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 18:05:01 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-6f8d0a1e500so5159014a34.3
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 11:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721153100; x=1721757900;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=woJqTt1V9Oc7TqpbjftAtbf2DQc3osnmeqJRyS4s6z4=;
 b=N/w1dAJi3Co6oNhfKaPwE8Lpbhp15cEYVLf4dbKigQWi+f7lcjjKx0KSCldCj+8hfj
 8ia7JRMUORhUh7AawXlkpPxPCEH7zyqaoCXCgZ+27b4OQON8XXQkFeR0NECbatXDZAYq
 b/A5UTasEL5krGAOXMeyDsu+gNpvB1ymdQbAKQ+7AMz+8kEAvhKhC4YRp+zhL5evleSk
 vzxFeZEBZ/r9I0hF1jFNiAc+RYD4oxX0FcMlEPJ35iDm8kAz7E/GWrRlQAoX9MDAUVSY
 Nk2MlkgAkBfrezIWRx0ZEeNNSsdcrfygrEi9blTegauwQoztWrlxth36ClXEm8iTHOK3
 5HtA==
X-Gm-Message-State: AOJu0YxdfQ9RwjFiVagQl5USY9u/R+LokclRa9iMkHTT9hzQKjWHFsmE
 vr074bDmzuIkQt4+RwrfJAwXfKijBNigrtx9ecSyeOhZKLt7jlHJdXPPCOUUCat31Wre5eRBFKN
 Y63Wk1cDg7EoE8d11SYiYXPOPv5Q=
X-Google-Smtp-Source: AGHT+IEzh/B5O8JK0ha/zpXEHq9HVtrsvGOZgC2q0o3TEjI3EgW3eBMoyI6id0h5EW3I0ltAIFXz+CUR8PPR97jN1as=
X-Received: by 2002:a05:6830:4120:b0:703:5971:70a4 with SMTP id
 46e09a7af769-708d99ddb4cmr2973763a34.28.1721153099904; Tue, 16 Jul 2024
 11:04:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240605234131.3370484-1-james.hilliard1@gmail.com>
 <20240605234131.3370484-2-james.hilliard1@gmail.com>
 <20240716141533.7a23365d@windsurf>
In-Reply-To: <20240716141533.7a23365d@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 16 Jul 2024 12:04:48 -0600
Message-ID: <CADvTj4ruCd6M_L7q4YpSyL2Fep5UW5quORREbgd9q9-HaOaptg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721153100; x=1721757900; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=woJqTt1V9Oc7TqpbjftAtbf2DQc3osnmeqJRyS4s6z4=;
 b=e7WwLgx97WtN/c6Nfw0b2kJoaa8zB+/FA7aslvD50eUaLby4I/dKxOiLzLFRabQEE6
 v2DVL1+ZHn47yyqQ4uuIX7jKdEv8i+W6qqJAI83foa9s+7nosg+YriypN5VtnlzpDmYN
 9wEzbc8V2Mqbe/4X91vkKpcZFm4i42w0v1eFtnGf1oqqUWAR/A0JO8MeVEYz21NQ3zoq
 kscYrWzdUP8kzLLn/hG8Yqsf/Y60LbTQS/IsllN2ZB6P7B/qQGhTiwRPQKwi02S609HU
 mApbduldTgH0GuOW65RqHDdCcV1ertZK12lS/6bcQnKJr8Ui5pUugdbjo/bmdrjq7cF7
 mG2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=e7WwLgx9
Subject: Re: [Buildroot] [PATCH 2/4] package/fwupd-efi: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBKdWwgMTYsIDIwMjQgYXQgNjoxNeKAr0FNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gSmFtZXMsCj4KPiBPbiBX
ZWQsICA1IEp1biAyMDI0IDE3OjQxOjI5IC0wNjAwCj4gSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhp
bGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxs
aWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIHBhY2thZ2UvQ29u
ZmlnLmluICAgICAgICAgICAgICAgIHwgIDEgKwo+ID4gIHBhY2thZ2UvZnd1cGQtZWZpL0NvbmZp
Zy5pbiAgICAgIHwgIDggKysrKysrKysKPiA+ICBwYWNrYWdlL2Z3dXBkLWVmaS9md3VwZC1lZmku
aGFzaCB8ICAzICsrKwo+ID4gIHBhY2thZ2UvZnd1cGQtZWZpL2Z3dXBkLWVmaS5tayAgIHwgMjUg
KysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDQgZmlsZXMgY2hhbmdlZCwgMzcgaW5zZXJ0
aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2Z3dXBkLWVmaS9Db25maWcu
aW4KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9md3VwZC1lZmkvZnd1cGQtZWZpLmhh
c2gKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9md3VwZC1lZmkvZnd1cGQtZWZpLm1r
Cj4KPiBUaGFua3MgZm9yIHRoZSBwYXRjaCEgRW50cnkgaW4gREVWRUxPUEVSUyBmaWxlIGlzIG1p
c3NpbmcgKEkgaGFkIGFkZGVkCj4gaXQgbG9jYWxseSksIGJ1dCBtb3JlIGltcG9ydGFudGx5LCB0
aGUgYnVpbGQgZmFpbHM6Cj4KPiBGQUlMRUQ6IGVmaS9md3VwLXNiYXQubwo+IC9ob21lL3Rob21h
cy9wcm9qZXRzL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvZnd1cGQtZWZpLTEuNi9lZmkvZ2VuZXJh
dGVfc2JhdC5weSBlZmkvZnd1cC1zYmF0Lm8gLS1jYyAvaG9tZS90aG9tYXMvcHJvamV0cy9idWls
ZHJvb3Qvb3V0cHV0L2hvc3QvYmluL2FybS1saW51eC1nY2MgLS1jZmxhZ3MgJy1PZyAtZzMgLS1w
YXJhbT1zc3AtYnVmZmVyLXNpemU9NCAtZmV4Y2VwdGlvbnMgLVdhbGwgLVdleHRyYSAtV3ZsYSAt
c3RkPWdudTExIC1mcGljIC1mdW5zaWduZWQtY2hhciAtZnNob3J0LXdjaGFyIC1mZnJlZXN0YW5k
aW5nIC1mbm8tc3RyaWN0LWFsaWFzaW5nIC1mbm8tc3RhY2stcHJvdGVjdG9yIC1mbm8tc3RhY2st
Y2hlY2sgLWZuby1tZXJnZS1hbGwtY29uc3RhbnRzIC1Xc2lnbi1jb21wYXJlIC1Xbm8tbWlzc2lu
Zy1maWVsZC1pbml0aWFsaXplcnMgLVduby1hZGRyZXNzLW9mLXBhY2tlZC1tZW1iZXIgLWdyZWNv
cmQtZ2NjLXN3aXRjaGVzIC1EREVCVUdESVI9Ii91c3IvbGliL2RlYnVnIiAtSS4gLWlzeXN0ZW0g
L2hvbWUvdGhvbWFzL3Byb2pldHMvYnVpbGRyb290L291dHB1dC9ob3N0L2FybS1idWlsZHJvb3Qt
bGludXgtbXVzbGVhYmloZi9zeXNyb290L3Vzci9pbmNsdWRlL2VmaSAtaXN5c3RlbSAvaG9tZS90
aG9tYXMvcHJvamV0cy9idWlsZHJvb3Qvb3V0cHV0L2hvc3QvYXJtLWJ1aWxkcm9vdC1saW51eC1t
dXNsZWFiaWhmL3N5c3Jvb3QvdXNyL2luY2x1ZGUvZWZpL2FybSAtZm5vLW1lcmdlLWNvbnN0YW50
cycgLS1vYmpjb3B5IC91c3IvYmluL29iamNvcHkgLS1wcm9qZWN0LW5hbWUgZnd1cGQtZWZpIC0t
cHJvamVjdC12ZXJzaW9uIDEuNiAtLXNiYXQtdmVyc2lvbiAxIC0tc2JhdC1nZW5lcmF0aW9uIDEg
LS1zYmF0LWRpc3Ryby1pZCBidWlsZHJvb3QgLS1zYmF0LWRpc3Ryby1nZW5lcmF0aW9uIDAgLS1z
YmF0LWRpc3Ryby1zdW1tYXJ5IEJ1aWxkcm9vdCAtLXNiYXQtZGlzdHJvLXBrZ25hbWUgZnd1cGQt
ZWZpIC0tc2JhdC1kaXN0cm8tCj4gIHZlcnNpb24gZnd1cGQtZWZpLTEuNiAtLXNiYXQtZGlzdHJv
LXVybCBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS90cmVlL21h
c3Rlci9wYWNrYWdlL2Z3dXBkLWVmaQo+IC91c3IvYmluL29iamNvcHk6IFVuYWJsZSB0byByZWNv
Z25pc2UgdGhlIGZvcm1hdCBvZiB0aGUgaW5wdXQgZmlsZSBgZWZpL2Z3dXAtc2JhdC5vJwo+IFRy
YWNlYmFjayAobW9zdCByZWNlbnQgY2FsbCBsYXN0KToKPiAgIEZpbGUgIi9ob21lL3Rob21hcy9w
cm9qZXRzL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvZnd1cGQtZWZpLTEuNi9lZmkvZ2VuZXJhdGVf
c2JhdC5weSIsIGxpbmUgMTE4LCBpbiA8bW9kdWxlPgo+ICAgICBfZ2VuZXJhdGVfc2JhdChfYXJn
cykKPiAgIEZpbGUgIi9ob21lL3Rob21hcy9wcm9qZXRzL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQv
Znd1cGQtZWZpLTEuNi9lZmkvZ2VuZXJhdGVfc2JhdC5weSIsIGxpbmUgODAsIGluIF9nZW5lcmF0
ZV9zYmF0Cj4gICAgIHN1YnByb2Nlc3MucnVuKGFyZ3YsIGNoZWNrPVRydWUpCj4gICBGaWxlICIv
dXNyL2xpYjY0L3B5dGhvbjMuMTIvc3VicHJvY2Vzcy5weSIsIGxpbmUgNTcxLCBpbiBydW4KPiAg
ICAgcmFpc2UgQ2FsbGVkUHJvY2Vzc0Vycm9yKHJldGNvZGUsIHByb2Nlc3MuYXJncywKPiBzdWJw
cm9jZXNzLkNhbGxlZFByb2Nlc3NFcnJvcjogQ29tbWFuZCAnWycvdXNyL2Jpbi9vYmpjb3B5Jywg
Jy0tYWRkLXNlY3Rpb24nLCAnLnNiYXQ9L3RtcC90bXBkNTV5MjVxOScsICctLXNldC1zZWN0aW9u
LWZsYWdzJywgJy5zYmF0PWNvbnRlbnRzLGFsbG9jLGxvYWQscmVhZG9ubHksZGF0YScsICdlZmkv
Znd1cC1zYmF0Lm8nXScgcmV0dXJuZWQgbm9uLXplcm8gZXhpdCBzdGF0dXMgMS4KPgo+IEkgdGhp
bmsgaXQncyBkdWUgdG8gdGhlIGZhY3QgdGhhdCBpdCBpcyB1c2luZyAvdXNyL2Jpbi9vYmpjb3B5
IGluc3RlYWQKPiBvZiB0aGUgY3Jvc3Mgb2JqY29weS4gWW91IHByb2JhYmx5IGRpZG4ndCBub3Rp
Y2UgYXMgeW91IHdlcmUgYnVpbGRpbmcKPiBmb3IgeDg2LTY0LCBhbmQgdGhlcmVmb3JlIHRoZSBo
b3N0IG9iamNvcHkgZGlkbid0IHdvcmsuCgpJIGhhZCBhIGZldyBmaXhlcyBJIHdhcyB3b3JraW5n
IG9uIGluIG15IHYzIHdoaWNoIEkgaGFkbid0IGdvdHRlbiBhcm91bmQgdG8KZmluaXNoaW5nIHVw
LCBsb29rcyBsaWtlIHRoaXMgd2FzIG9uZSBvZiB0aGVtLgoKPgo+IENvdWxkIHlvdSB0ZXN0IGJ1
aWxkaW5nIGZvciBhIGZvcmVpZ24gYXJjaGl0ZWN0dXJlLCBhbmQgcHJlZmVyYWJseQo+IHVzaW5n
IC4vdXRpbHMvZG9ja2VyLXJ1biAoc2VlIG15IHJldmlldyBvbiBQQVRDSCA0LzQgdG8gdW5kZXJz
dGFuZCB3aHkKPiBkb2NrZXItcnVuIGlzIGltcG9ydGFudCkuCgpUaGVyZSBlbmRlZCB1cCBiZWlu
ZyBhIGZldyBvdGhlciBpc3N1ZXMgc3VjaCBhcyB1c2luZyB0aGUgd3JvbmcgcHl0aG9uMwppbnRl
cnByZXRlciwgc2hvdWxkIGFsbCBiZSBmaXhlZCBpbiB2MzoKaHR0cHM6Ly9naXRodWIuY29tL2Z3
dXBkL2Z3dXBkLWVmaS9wdWxsLzg2Cmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVj
dC9idWlsZHJvb3QvcGF0Y2gvMjAyNDA3MTYxNzUwMzcuMTg0NDkyOS00LWphbWVzLmhpbGxpYXJk
MUBnbWFpbC5jb20vCgo+Cj4gVGhhbmtzIQo+Cj4gVGhvbWFzCj4gLS0KPiBUaG9tYXMgUGV0YXp6
b25pLCBDVE8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5n
Cj4gaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
