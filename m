Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AFCC87FCF
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 21:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA02860A44;
	Sat,  9 Aug 2025 21:11:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ryCiJ5PiiBQ9; Sat,  9 Aug 2025 21:11:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C17AF60BC9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C17AF60BC9;
	Sat,  9 Aug 2025 21:11:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 38A09154
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 21:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F7D240B4E
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 21:11:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MccbRZrKem8d for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 21:11:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 126C240947
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 126C240947
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 126C240947
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 21:11:39 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-458c063baeaso18078945e9.1
 for <buildroot@buildroot.org>; Sat, 09 Aug 2025 14:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754773898; x=1755378698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z/bLT5VZjHc6WrRdfS7LSxz06Kc9h+/zr0DCTpHsoVE=;
 b=p4od6ioEG7ODUK5paKDAR0K7YYleTChvc8lT8LAuuWCDIAQ2h366JEjxAW9N6IsaVZ
 kp4isk1irOzHtQUC+xbZv1QV78xuYOtCHFLsZg1wTKtn1PgnUMX+nMpspM5rf1/h5G+t
 zySlMEfdEiaCawwyktpnNenXwALAH+47IFUzJPXosYXrOC/Wrmpqor67pGHrGeIVo2pW
 ChqKpCzQyl1L1HFK3quqcbgP66rxRRSWRRP8kG68UIFvubbZa9n+gBcjG4QaUFaalhxd
 PDOiF1xmW77ZwVBBcXTKlXjbyMxElpL6BjC41dX/vRbJnZuSJ/4Uibn9o7ScCDcWDP5E
 jEew==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9vkyyQnbF86IP7gBqB1sF/8/v62L5yfE89BrjqBNQKKZUg8hm2xPfypFyh5NlT/layG8SX0Sd3RI=@buildroot.org
X-Gm-Message-State: AOJu0Yy8eu5mKqbYhUNb612323CzkrsJw4DlSB9w1AWQv1aYdHEPN1x8
 o+g5DFuIpJhQjolXN3VDtG8netY/dkabUfmvvqyl/rMSR2XTW3k9D55kS86BEtIAkNj2kEoYs44
 XQ3aE
X-Gm-Gg: ASbGncuCj37qlWy/f77jbWg1XFxKGKDr2NTONYD62v3snjb+tYbX9VuLSJHajaIylVQ
 A/wMVmQNZV+h6NIBcBW/moz7O2uzBMoRlXvG3GogEubTLrdLmquGcoywqKadD0gqmq4YY9HShoL
 lsAPbiWlpB1iE1Q7UNQpP5Euct9lB0FTRl0SVqRkvG3mp9OFL+5jCZyE/wYYygSmfXXXVWfagGs
 TrSlDonx2wXvahz5HQHAGrH+grgX8XNUc/N1+l+g2s+tKzNGIUEwnsG/toc1QgpoQfOKA3czEOB
 irnp5JfaApPBjxRMWWMCWzeykvKBU5AYIlUqUiKG6NV3/7apNLTiQYkajzb5UHU4fyIH0o7yPhA
 t906FFKeJIiJO7Rb16BrNeje/
X-Google-Smtp-Source: AGHT+IGi/u60ACVWVpDOkjGYWIFxZFWY9M8b8USguYf/W+bvqINNoz/E2sJdwvMtKepKprSNQvz6Dg==
X-Received: by 2002:a05:600c:3b02:b0:456:1156:e5f5 with SMTP id
 5b1f17b1804b1-459f4f3a85amr81478105e9.31.1754773898012; 
 Sat, 09 Aug 2025 14:11:38 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3bc12csm35672355f8f.28.2025.08.09.14.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 14:11:37 -0700 (PDT)
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 Stefan Hager <stefan.hager@ginzinger.com>
Date: Sat,  9 Aug 2025 23:11:07 +0200
Message-ID: <20250809211136.355418-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <d99579f5-ed38-4683-bb5b-c3e3b6815487@smile.fr>
References: <d99579f5-ed38-4683-bb5b-c3e3b6815487@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754773898; x=1755378698; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z/bLT5VZjHc6WrRdfS7LSxz06Kc9h+/zr0DCTpHsoVE=;
 b=emNBu9NJUSxdND7TGRS5rA7uu3sdQcoEAl9oUOXyDQVp8v3fBHFPSb1FHVNTzZuTPA
 OnGY/UcZLCy+SFKmBcl/L+WKhkLnMiCkGIO67/VlgE7VuFKXDJeB+JM9nNI2dnhYADFK
 sgkErr8TNY9j9RjVzr2d5LihI3wbUIGkQNYo9pp8VVU+55c7B0tjGMREMvftHb4pxQxB
 ugSiKTOYp/tj4ZXdOjrek/J64rJpV+7huk6hdB79TcTWujnPD5uh7iwguL24o6J+PlhZ
 1+wEfO1VShzsoSfylSV5h/iQ2s852rd97eGokhQE0uuEDqShmb6Blvde6SmcKVBGxmvf
 P/dg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=emNBu9NJ
Subject: Re: [Buildroot] [PATCH] package/pthreadpool: fix thread dependency
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Um9tYWluLAoKSW4gcmVwbHkgb2Y6Cj4gSGVsbG8gVGhvbWFzLCBBbGwsCj4gCj4gTGUgMDUvMDgv
MjAyNSDDoCAyMTo0MiwgVGhvbWFzIFBlcmFsZSB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4g
PiBPbiBhdXRvYnVpbGRlciBjb25maWcgd2l0aCBCUjJfVE9PTENIQUlOX0hBU19USFJFQURTIG5v
dCBzZXQgdGhlCj4gPiBmb2xsb3dpbmcgZXJyb3IgaGFwcGVucyB3aGVuIGJ1aWxkaW5nIHRoZSBw
dGhyZWFkcG9vbCBwYWNrYWdlOgo+ID4gCj4gPiBgYGAKPiA+IC0tIExvb2tpbmcgZm9yIHB0aHJl
YWRfY3JlYXRlIGluIHB0aHJlYWRzCj4gPiAtLSBMb29raW5nIGZvciBwdGhyZWFkX2NyZWF0ZSBp
biBwdGhyZWFkcyAtIG5vdCBmb3VuZAo+ID4gLS0gTG9va2luZyBmb3IgcHRocmVhZF9jcmVhdGUg
aW4gcHRocmVhZAo+ID4gLS0gTG9va2luZyBmb3IgcHRocmVhZF9jcmVhdGUgaW4gcHRocmVhZCAt
IG5vdCBmb3VuZAo+ID4gLS0gQ2hlY2sgaWYgY29tcGlsZXIgYWNjZXB0cyAtcHRocmVhZAo+ID4g
LS0gQ2hlY2sgaWYgY29tcGlsZXIgYWNjZXB0cyAtcHRocmVhZCAtIG5vCj4gPiBDTWFrZSBFcnJv
ciBhdCAvaG9tZS9idWlsZHJvb3QvaW5zdGFuY2UtMC9vdXRwdXQtMS9ob3N0L3NoYXJlL2NtYWtl
LTMuMzEvTW9kdWxlcy9GaW5kUGFja2FnZUhhbmRsZVN0YW5kYXJkQXJncy5jbWFrZToyMzMgKG1l
c3NhZ2UpOgo+ID4gICBDb3VsZCBOT1QgZmluZCBUaHJlYWRzIChtaXNzaW5nOiBUaHJlYWRzX0ZP
VU5EKQo+ID4gQ2FsbCBTdGFjayAobW9zdCByZWNlbnQgY2FsbCBmaXJzdCk6Cj4gPiAgIC9ob21l
L2J1aWxkcm9vdC9pbnN0YW5jZS0wL291dHB1dC0xL2hvc3Qvc2hhcmUvY21ha2UtMy4zMS9Nb2R1
bGVzL0ZpbmRQYWNrYWdlSGFuZGxlU3RhbmRhcmRBcmdzLmNtYWtlOjYwMyAoX0ZQSFNBX0ZBSUxV
UkVfTUVTU0FHRSkKPiA+ICAgL2hvbWUvYnVpbGRyb290L2luc3RhbmNlLTAvb3V0cHV0LTEvaG9z
dC9zaGFyZS9jbWFrZS0zLjMxL01vZHVsZXMvRmluZFRocmVhZHMuY21ha2U6MjI2IChGSU5EX1BB
Q0tBR0VfSEFORExFX1NUQU5EQVJEX0FSR1MpCj4gPiAgIENNYWtlTGlzdHMudHh0OjE0MyAoRklO
RF9QQUNLQUdFKQo+ID4gCj4gPiAtLSBDb25maWd1cmluZyBpbmNvbXBsZXRlLCBlcnJvcnMgb2Nj
dXJyZWQhCj4gPiBgYGAKPiA+IAo+ID4gVGhpcyBjYW4gYmUgcmVwcm9kdWNlZCB3aXRoOgo+ID4g
Cj4gPiBgYGAKPiA+IGNhdCA+LmNvbmZpZyA8PEVPRgo+ID4gQlIyX2FybWViPXkKPiA+IEJSMl9U
T09MQ0hBSU5fQlVJTERST09UX1VDTElCQz15Cj4gPiBCUjJfUFRIUkVBRFNfTk9ORT15Cj4gPiBC
UjJfUEFDS0FHRV9QVEhSRUFEUE9PTD15Cj4gPiBFT0YKPiA+IG1ha2Ugb2xkZGVmY29uZmlnCj4g
PiBtYWtlIHB0aHJlYWRwb29sCj4gPiBgYGAKPiA+IAo+ID4gU2luY2UgdGhlIGludHJvZHVjdGlv
biBvZiB0aGlzIHBhY2thZ2UgaW4gWzFdLCB0aGUgZGVwZW5kZW5jeSB3YXMgbm90Cj4gPiBpbmNs
dWRlZC4gU2luY2UgdGhpcyBwYWNrYWdlIHdhcyBwYXJ0IG9mIHRoZSB0ZW5zb3JmbG93LWxpdGUK
PiA+IGRlcGVuZGVuY2llcyB0aGF0IHJlcXVpcmVkIHRocmVhZCBpdCB3YXMgbm90IGFuIGlzc3Vl
Lgo+ID4gCj4gPiBUaGlzIHBhdGNoIGFkZHMgQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUyBpbiB0
aGUgZGVwZW5kZW5jeSB0byBhdm9pZAo+ID4gZXJyb3JzIHdoZW4gYnVpbHQgYXMgYSBzdGFuZGFs
b25lIHBhY2thZ2UuCj4gPiAKPiA+IFsxXSBmMjQ4NmE2Y2Y5IHBhY2thZ2UvcHRocmVhZHBvb2w6
IG5ldyBwYWNrYWdlCj4gPiAKPiA+IEZpeGVzOiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qu
b3JnL3Jlc3VsdHMvMzVhLzM1YWExMDBkNzJjNjg3NTM1MGFkMTBjNTdmMDI4ZjA0MDUyY2JmNzkK
PiA+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXJhbGUgPHRob21hcy5wZXJhbGVAbWluZC5iZT4K
PiA+IC0tLQo+ID4gIHBhY2thZ2UvcHRocmVhZHBvb2wvQ29uZmlnLmluIHwgMSArCj4gPiAgcGFj
a2FnZS94bm5wYWNrL0NvbmZpZy5pbiAgICAgfCAyICstCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvcHRocmVhZHBvb2wvQ29uZmlnLmluIGIvcGFja2FnZS9wdGhyZWFkcG9vbC9Db25maWcuaW4K
PiA+IGluZGV4IDE5NGFlMzNmODUuLjMyODhiNTZkZWUgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdl
L3B0aHJlYWRwb29sL0NvbmZpZy5pbgo+ID4gKysrIGIvcGFja2FnZS9wdGhyZWFkcG9vbC9Db25m
aWcuaW4KPiA+IEBAIC0xLDUgKzEsNiBAQAo+ID4gIGNvbmZpZyBCUjJfUEFDS0FHRV9QVEhSRUFE
UE9PTAo+ID4gIAlib29sICJwdGhyZWFkcG9vbCIKPiA+ICsJZGVwZW5kcyBvbiBCUjJfVE9PTENI
QUlOX0hBU19USFJFQURTCj4gPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9GWERJVgo+ID4gIAloZWxw
Cj4gPiAgCSAgUHRocmVhZHBvb2wgaXMgYSBwb3J0YWJsZSBhbmQgZWZmaWNpZW50IHRocmVhZCBw
b29sCj4gCj4gV2l0aCB0aGlzIG5ldyBkZXBlbmRlbmN5IGFkZGVkLCB5b3Ugc2hvdWxkIGFkZCBh
IGtjb25maWcgY29tbWVudDoKPiAKPiBjb21tZW50ICJwdGhyZWFkcG9vbCBuZWVkcyBhIHRvb2xj
aGFpbiB3LyB0aHJlYWRzIgo+IAlkZXBlbmRzIG9uICFCUjJfVE9PTENIQUlOX0hBU19USFJFQURT
Cj4gCj4gQmVzdCByZWdhcmRzLAo+IFJvbWFpbgoKSSBzZW50IGEgdjIgdGhhdCBpbmNsdWRlZCB5
b3VyIGNvbW1lbnQ6CgpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRy
b290L2xpc3QvP3Nlcmllcz00Njg1MTIKCkkgYWxzbyB0b29rIHRoZSBvcHBvcnR1bml0eSB0byBh
ZGQgdGhlIHNhbWUgY29tbWVudCB0byB0aGUgcGFja2FnZSBjcHVpbmZvIHRoYXQKd2FzIGluY2x1
ZGVkIGluIHRoZSBzYW1lIHNlcmllcy4KCkJlc3QgcmVnYXJkcywKUEVSQUxFIFRob21hcwoKPiA+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL3hubnBhY2svQ29uZmlnLmluIGIvcGFja2FnZS94bm5wYWNr
L0NvbmZpZy5pbgo+ID4gaW5kZXggZTRiOTJmNjFlOC4uNzk0YzVjNDdkMiAxMDA2NDQKPiA+IC0t
LSBhL3BhY2thZ2UveG5ucGFjay9Db25maWcuaW4KPiA+ICsrKyBiL3BhY2thZ2UveG5ucGFjay9D
b25maWcuaW4KPiA+IEBAIC05LDcgKzksNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfWE5OUEFDSwo+
ID4gIAlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1hOTlBBQ0tfQVJDSF9TVVBQT1JUUwo+ID4gIAlk
ZXBlbmRzIG9uIEJSMl9JTlNUQUxMX0xJQlNURENQUAo+ID4gIAlkZXBlbmRzIG9uIEJSMl9UT09M
Q0hBSU5fR0NDX0FUX0xFQVNUXzRfOSAjIEMrKzE0Cj4gPiAtCWRlcGVuZHMgb24gQlIyX1RPT0xD
SEFJTl9IQVNfVEhSRUFEUyAjIGNwdWluZm8KPiA+ICsJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlO
X0hBU19USFJFQURTICMgY3B1aW5mbywgcHRocmVhZHBvb2wKPiA+ICAJc2VsZWN0IEJSMl9QQUNL
QUdFX0NQVUlORk8KPiA+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0ZQMTYKPiA+ICAJc2VsZWN0IEJS
Ml9QQUNLQUdFX0ZYRElWCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
