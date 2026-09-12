Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D751C79FB6
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 07:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0663D80EC0;
	Sat, 12 Sep 2026 07:39:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T5WtptJ_XpyN; Sat, 12 Sep 2026 07:39:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 011B080EC1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789198771;
	b=Gr56e0aEAZG2ulPPxSx/hSz6CDq5Bo5JksAC0ig0jURzqverGlTTw4FNxvgjVUIrV+G9
	 tDcjE9SN0VVAneUX7AIJX6HWfiO3Tk4MvaIRsOUy5C1XXE7TEagFHpVd17Bh/bj1nOaHS
	 Y/JiAHlpXaiz4ZiXSj/ZWLc0I/eCOAxSepwa0bRZBNE+/OBYFGEcwr5cKhO1Opt3rJSWt
	 I084QV9DolEf3OFMo38BBEiAaxNGB7YJEP7yOAmFwpa2Yc8+JArG60spi6R+x6QV8OqC4
	 vog0IRZbFk6zvYiyfc5TWTupeI5aeAVbMy205BJvuk+W6FCG6AcAynXX16OL8HF5Vrg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789198771;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=i5YUek43UrmXwZSdB2PNWJwcRxr2rBvZy3J4SlaefhE=;
	b=oKCbm5/EKqXOrHAVI3Ad4NX+rAQTloi3EtOqOx7PruFAZqSQCZuXRXkkqACBPsjLI71i
	 87zJ07+iDhHEfqPPpFJ1LSPYYI5RHskQhfo4ewCT4RSREhxjn13INy48SGCGHrNe9/3SU
	 vX+zab6PTEYSthBsjkHRKqNuAVK/qNLVMvZOZ+QLnOiLJyYWJXQtDFxWQ4zKB9J0sJMis
	 zkk40Fzsvgab36pOhKepz/x01r6ffOOA9ZJkFjs6Ga6nA0veOjl/jACDOpnYe0P5jLKhe
	 vNYHZOagJ6H4Y3DwOtt0EqSILdjVy4Nd+uefjX+JjhAlMsfwVA76mInAnywuV2DQeUw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789198771;
	bh=i5YUek43UrmXwZSdB2PNWJwcRxr2rBvZy3J4SlaefhE=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PeS9hJDMkM3aH5jsvjLAYyDQ4JMDByR87ZBkTZEWEaBJ4ChCXgFy9KJQ+1poB/FiX
	 IXHET/0K6Gm3UwspsfnTxn9Dc9T+6iDvCtej5f9VhL8jKRwEx3GQOM5yHH2Hr7DbNX
	 yFp3AwmMbOPrh86RNtYTpdNu4AeckyJHjy3j9ROhedaAMilYMSNJiut7fv7TMh06Kf
	 KB9uAmH4XPdfwNGYrVghzFDpIRNAb1X8gFbFULhuL5UNUuDNqyTnXvqugPaQrq1IKb
	 yUcvMZa/+QCU3ZMWq7FZV5NJ4G6R1xXY92INvCLDlInDtCgUAgUxmQDXMVcx4eBEld
	 dlbGSLlQ40nfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 011B080EC1;
	Sat, 12 Sep 2026 07:39:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A5BD92E3
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 07:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C042407C5
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 07:39:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qUdHAd8kpzh0 for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 07:39:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5C0CA407B8
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789198768;
 b=e9UYLRCL6gbg+VggTAd8mX53WGue0mgAzweJjFutklL+Lp7QZsOEMU+Vsqa7XZ3lSyQ7
 TVkPNZ7amIqrDir4yKblAM9JgDKPRxJ5nmlxqnCYHfn0Wdy2BQwb5Ry/O9IxIjZ7wAI52
 iNE/jsHSqS315Ih6k8l9yZQ6RiXz3ZUfnnl9CA7YWFbdy4wm14W4JEWOd778kCncz7k2N
 SfnW6WE49DJnEKtZMlJFxYTYF6bBoz+fcLjJYVhzTLAVhyXREF0a94Fd8bNhk56lp3oTf
 tPcCXPfrUe/lvf5ItRuVmwfz9bBlIVQBpPqbjHPM9IyJIi8POi1jP3qf4EfxFtB9CCQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789198768;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=dQj8hqTmfvKMzmuozf2KeJSA8Db6y/ZiTiM0PHURpGU=;
 b=YW8bIAk3soebg0V/TP+zJd6CLtxuBHmlHzsi28XZl0ahe13Sjq/oDFMidvI66Ck/wa6E
 O7qlCgtkuLPa+ianCoJMK8vnAQuRjtt9WoniQ6Xs3KeNBzI6af+7U0W8Qohi/Qxu9RGos
 Jq7n0PLMwxabRzCKlvryjNLaNLayGB2f9RGEdr5cCeqjnRWPEAC698Sn8smGhbxw/rHaD
 4FA3Kc+L35MvQKu6T6JZP0b6gzaDciUYcdPxoJTXN1a0mPAb6FUH8AsrqxyqkuCdh7Hlm
 WXEZlsFB2M6mxDUw6E4CGZgEIctPAtsnmHv2CLjdX1DwKdQogSYSzzLfj8qGb8MBMug==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=tyLGaCt2; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=tyLGaCt2
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C0CA407B8
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 07:39:25 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=tyLGaCt2BHHxE/OkJdfrSqP0ajaDg8QnvgW7JTi/zNQJMUY7ZxNyH8GRGzKhO15f6d4uqSBLqJDDDuvvpD5iaDpgQ/FWnGSKXdVc4mXHO5BlmMiYAw9+n5gUuwy4QPXos57Zu8YFSw/YPB8JFgce9LGkzJ3gXN1vL5WrbqmAz8k8gC7vGb+3NCktqKNWgSRWxJxqzmrP31Fvi8MKf6QIwBcP008PJGtk55WKShqEgtCET7hiVhLaDnvfKRMQnV/LG/T2uKKdIV1Sm1qvbeZiVqEyTGwy1EvyVwZfAyGlqP8RjbEhZSOCuhBmG5+xMSp/LHuXp8VAlY7ovqJ1eTxNXQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=dQj8hqTmfvKMzmuozf2KeJSA8Db6y/ZiTiM0PHURpGU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 988907796; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 12 Sep 2026 07:39:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x5IKW-0000000FCkB-2vS5;
 Sat, 12 Sep 2026 09:39:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260910203818.2550925-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Thu, 10 Sep 2026 22:38:18 +0200")
References: <20260910203818.2550925-1-bernd@kuhls.net>
Date: Sat, 12 Sep 2026 09:39:20 +0200
Message-ID: <87qziydil3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.24.7
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

Pj4+Pj4gIkJlcm5kIiA9PSBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PiB3cml0ZXM6Cgog
PiBodHRwczovL3d3dy5zYW1iYS5vcmcvc2FtYmEvaGlzdG9yeS9zYW1iYS00LjI0LjcuaHRtbAog
PiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgogPiAtLS0KID4g
T24gQXVnLCAxNXRoLCB0aGUgR2l0bGFiIHBpcGVsaW5lcyBwYXNzZWQgYnVpbGRpbmcgNC4yNC42
OgogPiBodHRwczovL2dpdGxhYi5jb20vYmt1aGxzL2J1aWxkcm9vdC8tL2NvbW1pdHMvZDk0NTQ3
NWY3ZWZmMGUzNzIyZmRiZmE2ODI0NzAzMWQ4M2YxMjIxMAoKID4gVGhlIHNhbWUgdmVyc2lvbiBp
cyBicm9rZW4gYXMgb2YgU2VwLCAxMHRoOgogPiBodHRwczovL2dpdGxhYi5jb20vYmt1aGxzL2J1
aWxkcm9vdC8tL2NvbW1pdHMvZDJkZWExM2Y1OWVkNWMyNzYwMWNhNDgwYzQ5ZDc3YmQ2NGY3ZjAy
NgoKID4gYm9vdGxpbi1tNjhrLTY4MDQwLXVjbGliYzoKID4gLi4vLi4vbGliL3V0aWwvdGltZS5j
OiBJbiBmdW5jdGlvbiDigJhwdXNoX2Rvc19kYXRlM+KAmToKID4gLi4vLi4vbGliL3V0aWwvdGlt
ZS5jOjI1OToxOiBpbnRlcm5hbCBjb21waWxlciBlcnJvcjogU2VnbWVudGF0aW9uIGZhdWx0Cgog
PiBib290bGluLXBvd2VycGMtZTUwMG1jLXVjbGliYzoKID4gc3NwLWxvY2FsLmM6KC50ZXh0LnVu
bGlrZWx5KzB4MjApOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX3N0YWNrX2Noa19mYWlsJwoK
ID4gVGhpcyB2ZXJzaW9uIGJ1bXAgc2hvd3MgdGhlIHNhbWUgZXJyb3JzIHNvIHRoaXMgYnVtcCBk
b2VzIG5vdCBpbnRyb2R1Y2UKID4gbmV3IGJ1aWxkIGVycm9yczoKID4gaHR0cHM6Ly9naXRsYWIu
Y29tL2JrdWhscy9idWlsZHJvb3QvLS9jb21taXRzL2EzNWMwNWQzNTg3ZTRiNGIwYjUwODM5NTUx
OGJmYzFlOWE4M2JmNmIKCkNvbW1pdHRlZCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dh
YXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
