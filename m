Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581DFCA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 18:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A9FA814BA;
	Sat,  3 Oct 2026 18:10:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iVQg9wyoX1ua; Sat,  3 Oct 2026 18:10:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DC273814BE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791051055;
	b=LjA4pz1/ZQMgfMfskoRH4v/hmklVnGcbp13EenHkyY32CeMiwXmCIrEBzw1cJfVo5ElF
	 2YwaqVkbBQb+snp4LG6/lTmx+lknH3awR+X2jOzeS9ioteaMSAn/1xpDYy8rv3aT4S9hk
	 DITo8bOqzeT8uX0rVqNPe5ktrn0KTrc2INSCOJIxeBF0q5ORyoQcfEeBECQKiQ0Hfgz/G
	 Sqp1rtRKUYBAIj+i1KQ3IbE0e1x4sepWmOO06ud84GrH21+YZycwRYA0cXX5nMARTjmOW
	 dvRi5fuUBcOKiMcYgU807Sg93fUs3gnu1lgFV9JnKM3fX3BYuwKR+Ls35v5k3ZPXsTg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791051055;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=t3yDO63WICk1xs+koeFtKEei9c1Z40dJ99od9Uifjj8=;
	b=bFTHQHwPMZ6sWbWoBiHQ69HApQiaEAKHvhUnNEP8ggaPJgXg+Y6FekELVcGLj/LilDRS
	 QKKX79EnWFiDUJNYsBX4NPflk/jV1EO2EXD9YeGTB7y8a7+sWVFQs+i0XonLEu/jrby+I
	 1XPbo/fAOAgLOhGryIJv6qzkaiXHvVS3wYE0+s+TlO5vd3c7gdfPwkhZ+WKgH21QqSypm
	 TRtVBpgK/V2yKTDtcf5vuZ34jYF9kSGWZGk0/hNu26UBdzcS4u8jprUWexyTqWA21ufB1
	 fdZzCfYFS1LbK152PcN3D+EpTw5v2gKWKcIZH/QzsYCw8y4M13snlzkkFXHRShfsgPg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=OjP98v2q;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791051054;
	bh=t3yDO63WICk1xs+koeFtKEei9c1Z40dJ99od9Uifjj8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=msUhgP5itZ9MFmmiglsmIh3cnFDg91SoLHdHEpXRELqWcMFzzgPalx3eISK4u1MrN
	 r09V76y12DZr6Psh+HtMeGH5mIBcEJtWO1c9FkJtkHWOqzo+LZOHHf7kLlXnMgrxU5
	 K1giC0HEA3AHHTtXARsKtRZbh9//7ge45h7iuxogCqRozrfqJ1snxq8kuaE+/I8CbX
	 H5fzDggS4dUdcfSBbEM6WjWwktQLcXlOst3PX0Ok/e8Ywf76zkJJUBRs31iCQNakCH
	 botdToVeOW+CkxNArgYAY4fITk6BDEswx6dvjAOLnPo3QXqQnTB+Iv/co9GudPEpvi
	 T6PlwMUDxSduA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC273814BE;
	Sat,  3 Oct 2026 18:10:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 44445435
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 18:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29E1E814BE
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 18:10:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DX5vvudiwGjS for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 18:10:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 686AE814BA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791051052;
 b=oNq5yIc5bQnetCunFa8tLFsSZLWoCh0I/wv7vSqz5D6oYl9EAcKJn66BZjx6b503aBma
 jYE7p3pZ9TJ2x4vqKSd3NTRxT4KMIAiF2PnuSMkHe3i2PMyHxCsoqb4DAVOz1INBXBLRL
 NNEvpSKyyTNhtZCW7lP8G+B6T6fNzv92MGK1WAAuYwwjf23uAZCp0s97yVGYufhbOQ8Uk
 owYQKOpONAKLAPR0sgrABx8C0Wcyxh+vZQjYE0NoSCDaihb+aqkgIgA4STif8yfYKfQPl
 /CIztacXLu7oRniUXipt6zLsUKuCiwl8KFMqixbuuRcBPyMt/fZpxbO7exfTx8fGyxQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791051052;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=iK0j/K+K5NkVMN7uODGqGzaLq/rJ1hIdh9J3vFZHAa8=;
 b=bSg3XeA9Xi6tcpyhE6dArPl7s7TnM516k+K3zovSi6mpXMi9zUFNkgomhkVVmZoX5Njr
 RseQ0ST68eChrH3W1PMFJnjwl/qSpEQltxU4t2ygmhO4KqDff7Pc059P8y9Dq8iWCyglY
 A+klXb3/ZV0hSkhp6LhBtSPNC1168Tez4M011bPAHo0iSsSmz0nhNlFeOecGftgIllVIc
 zNg87TreWlBW4B5yedAQSf2IyNAVpxSe5WIlRB/baiP/Xp4R4OmKt7i+St29UMcFhy8C1
 ATXwRqRMpj+jwUdw95QesA849uTt3Sk3slWTIr/0XEU8j0LTwrYOMU00AgQc48IcQDA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=OjP98v2q; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=OjP98v2q
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 686AE814BA
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 18:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791051046;
 bh=iK0j/K+K5NkVMN7uODGqGzaLq/rJ1hIdh9J3vFZHAa8=;
 h=From:To:Subject:Date:From;
 b=OjP98v2qvcuyBVhNbAnCFwOJz0jwHw7fLRQf75wQAIoGXCKvx8ihz0WhO+iXMLH4K
 6sv36jlE0Ha6/GAUDo0dkx7/uxypaXMjKoRA6MSqSvXZ7yo6xbG6MW7WW0B6JcOmKh
 GEW+gR4bALV7RvFDYiiJGNI4dUokd+y3ZaRx6odLyFIS8LxPo5EvFINHTydwWzKBY0
 EppkEPzVjsqyVkq6L712xRF3oAd3Pxpm++k8Bab5Ssh/Rm7Ghdd8e5rU2BUWMQy3ej
 d5WlSE2C2dtkTwssOVpCCxcIhwkDD1imL8gKtJ3g5aEbBGX1tKXQ0tzi5OvyHKCtOj
 2b7dSLiGGTHlg==
X-KAS-Sym: v3:f51bdf72230551df:NrMjjbdC7XG7FPWdoNu6OZ9iwAgvDvjMNFi5DpehrmL4W
 wtMlwPKEXU6l/2eTYtymXVLOb1Vpa9X006Y9ljhEPY11yZAznjT28zRdW0mJmDdMjkvbqjJ9qVb
 ZhNwAIasOA48s0NCLKPgUh2+pPHAxitSPOKH/8wR5PPG5vevfw9lCUV1rVW/7qAZgPGwGhS87gP
 5rlWq3ErODjp4rCyf57kmDzoB/4gCO2xUFaHSM3Y/+bH4oPNBj2nfwlsA5qO0nZoQYTvO1BsRvm
 89lL/gaJlQIY4y0caZnGjKXpZeDHxWT2VKKigXY0xQW0dlztoNOzclB/7z+nUxpvjiksgTsA==:
 KCv1WeOA1q7myWFM9WtD9dDR0HHKFsE61DUJvd6f7kT+NC5j8dhOQKh6uYHD7OvlNu7iU7p7PNP
 mpU4Bw7xOuVUyH6m7ZAubr+FKqLaqJ64vTvj12cRzkt6uXIwN5h2Qwj0hRkeu/UmjdOtOGu6DcV
 RDJSU/x9iw8dq0dS7bwo8tuj55OkllL/f+LSM41wECci8Cfl9BQy7K8k4E/wR99eaB4Ulz8fGtY
 yUPyPopdk6C0UOrrg4CrHmiRuOarN7xqB2BoOl8EXOtp1FBrIts39mMOZH68nFtkxMWnoTlVhkk
 BnRQS//3Da95zu8zwU3UE5sMXpHjs6vB0hkz2oRJW2ZcrXgSRWFmaHFMDpDwW23X0F6liwhKT4P
 Nq/FTJqhexsdGtxxZr2ZaUqCf8rDjyW/SBB+mRRq2U3J9x0nbYx+HcM47D4VQpbwPrxZeKK4jLn
 ZJ+W8lLhfQ0Gf1zbjPsVOa52yDnM9r1uyAllfO2tKlaiDvUotXODgMGN43EEnC6AuwxfmKOWKzA
 d8QtIDsSFFDS+QnMbNzBgemnh5eZSAZL/zk00i7ihauW9JvpNQ=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3D3AEA4C47A2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 20:10:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34594)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xD4C6-000000007X3-0Y19
 for buildroot@buildroot.org; Sat, 03 Oct 2026 18:10:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 20:10:45 +0200
Message-ID: <20261003181045.3920000-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ---
Subject: [Buildroot] [PATCH 1/1] package/ncurses: install wide-char headers
 in usr/include/ncursesw/
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

UHl0aG9uIDMuMTUgY2hhbmdlZCBpdHMgbmN1cnNlcyB3aWRlLS9ub24td2lkZS1jaGFyIGRldGVj
dGlvbiBhbmQgbm93CnJlbGllcyBvbiBkZXRlY3RpbmcgdGhlIGNvcnJlY3QgaGVhZGVyczoKaHR0
cHM6Ly9naXRodWIuY29tL3B5dGhvbi9jcHl0aG9uL2NvbW1pdC8zODNjN2JkMzhhNWYwOTIzZGI0
OGY2N2ZkYTlkODUyZDE4OTkyMWU2CgpCdWlsZHJvb3QgdG9vbGNoYWluIHg4Ni02NC1jb3JlLWk3
LS1nbGliYy0tYmxlZWRpbmctZWRnZS0yMDI2LjA4LTEKY29udGFpbnMgdGhlIG5vbi13aWRlLWNo
YXIgdmVyc2lvbiBvZiBzeXNyb290L3Vzci9pbmNsdWRlL2N1cnNlcy5oCndoaWNoIG92ZXJ3cml0
ZXMgdGhlIHdpZGUtY2hhciB2ZXJzaW9uIHByb3ZpZGVkIGJ5IHRoZSBuY3Vyc2VzIHBhY2thZ2UK
ZHVyaW5nIHRoZSBjb25maWd1cmUvcnN5bmMgc3RhZ2Ugb2YgdGhlIHB5dGhvbjMgcGFja2FnZSBp
biB0aGUgY2FzZSBvZgpCUjJfUEVSX1BBQ0tBR0VfRElSRUNUT1JJRVM9eS4gVGhlIHRvb2xjaGFp
biBwYWNrYWdlIGlzIHNvcnRlZCBhbHBoYS0KYmV0aWNhbGx5IGFmdGVyIHRoZSBuY3Vyc2VzIHBh
Y2thZ2UuCgpUbyBwcm92aWRlIGNvcnJlY3QgaGVhZGVycyBmb3IgdGhlIHB5dGhvbjMgcGFja2Fn
ZSBhbmQgdG8gbm90IGludGVyZmVyZQp3aXRoIG90aGVyIGJ1aWxkcm9vdCBwYWNrYWdlcyB3ZSBh
ZGRpdGlvbmFsbHkgaW5zdGFsbCBvbmx5IHRoZSB3Y2hhci0KZW5hYmxlZCBoZWFkZXJzIGluIHVz
ci9pbmNsdWRlL25jdXJzZXN3LyB3aGljaCBpcyB0ZXN0ZWQgYnkgcHl0aG9uMwpjb25maWd1cmUg
YmVmb3JlIHVzci9pbmNsdWRlLzoKaHR0cHM6Ly9naXRodWIuY29tL3B5dGhvbi9jcHl0aG9uL2Js
b2IvdjMuMTUuMHJjMy9jb25maWd1cmUuYWMjTDcxNDkKCkNvbmZpZ3VyZSBsb2cgc25pcHBldCBv
ZiBweXRob24zIHdpdGhvdXQgdGhpcyBwYXRjaDoKCmNoZWNraW5nIGZvciBuY3Vyc2Vzdy4uLiB5
ZXMKY2hlY2tpbmcgZm9yIHBhbmVsdy4uLiB5ZXMKY2hlY2tpbmcgZm9yIG5jdXJzZXN3L2N1cnNl
cy5oLi4uIG5vCmNoZWNraW5nIGZvciBuY3Vyc2Vzdy9uY3Vyc2VzLmguLi4gbm8KY2hlY2tpbmcg
Zm9yIG5jdXJzZXN3L3BhbmVsLmguLi4gbm8KY2hlY2tpbmcgZm9yIG5jdXJzZXMvY3Vyc2VzLmgu
Li4gbm8KY2hlY2tpbmcgZm9yIG5jdXJzZXMvbmN1cnNlcy5oLi4uIG5vCmNoZWNraW5nIGZvciBu
Y3Vyc2VzL3BhbmVsLmguLi4gbm8KY2hlY2tpbmcgZm9yIGN1cnNlcy5oLi4uIHllcwpjaGVja2lu
ZyBmb3IgbmN1cnNlcy5oLi4uIHllcwpjaGVja2luZyBmb3IgcGFuZWwuaC4uLiB5ZXMKY2hlY2tp
bmcgZm9yIGxpYnJhcnkgY29udGFpbmluZyBpbml0c2NyLi4uIG5vbmUgcmVxdWlyZWQKY2hlY2tp
bmcgZm9yIGxpYnJhcnkgY29udGFpbmluZyB1cGRhdGVfcGFuZWxzLi4uIG5vbmUgcmVxdWlyZWQK
Y2hlY2tpbmcgd2hldGhlciBjdXJzZXMgc3VwcG9ydHMgd2lkZSBjaGFyYWN0ZXJzLi4uIG5vCmNo
ZWNraW5nIGZvciB0ZXJtLmguLi4geWVzCgpjb25maWcubG9nIGNvbnRhaW5zOgpjb25maWd1cmU6
Mjk4NjE6IGNoZWNraW5nIHdoZXRoZXIgY3Vyc2VzIHN1cHBvcnRzIHdpZGUgY2hhcmFjdGVycwpb
Li4uXQpjb25mdGVzdC5jOjUzNTo5OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVu
Y3Rpb24gJ3NldGNjaGFyJzsKIGRpZCB5b3UgbWVhbiAnZ2V0Y2hhcic/IFstV2ltcGxpY2l0LWZ1
bmN0aW9uLWRlY2xhcmF0aW9uXQogIDUzNSB8ICAgICAgICAgc2V0Y2NoYXIoJndjdmFsLCBMIngi
LCBBX05PUk1BTCwgMCwgTlVMTCk7CgpDb25maWd1cmUgbG9nIHNuaXBwZXQgb2YgcHl0aG9uMyB3
aXRoIHRoaXMgcGF0Y2g6CgpjaGVja2luZyBmb3IgbmN1cnNlc3cuLi4geWVzCmNoZWNraW5nIGZv
ciBwYW5lbHcuLi4geWVzCmNoZWNraW5nIGZvciBuY3Vyc2Vzdy9jdXJzZXMuaC4uLiB5ZXMKY2hl
Y2tpbmcgZm9yIG5jdXJzZXN3L25jdXJzZXMuaC4uLiBubwpjaGVja2luZyBmb3IgbmN1cnNlc3cv
cGFuZWwuaC4uLiB5ZXMKY2hlY2tpbmcgZm9yIG5jdXJzZXMvY3Vyc2VzLmguLi4gbm8KY2hlY2tp
bmcgZm9yIG5jdXJzZXMvbmN1cnNlcy5oLi4uIG5vCmNoZWNraW5nIGZvciBuY3Vyc2VzL3BhbmVs
LmguLi4gbm8KY2hlY2tpbmcgZm9yIGN1cnNlcy5oLi4uIHllcwpjaGVja2luZyBmb3IgbmN1cnNl
cy5oLi4uIHllcwpjaGVja2luZyBmb3IgcGFuZWwuaC4uLiB5ZXMKY2hlY2tpbmcgZm9yIGxpYnJh
cnkgY29udGFpbmluZyBpbml0c2NyLi4uIG5vbmUgcmVxdWlyZWQKY2hlY2tpbmcgZm9yIGxpYnJh
cnkgY29udGFpbmluZyB1cGRhdGVfcGFuZWxzLi4uIG5vbmUgcmVxdWlyZWQKY2hlY2tpbmcgd2hl
dGhlciBjdXJzZXMgc3VwcG9ydHMgd2lkZSBjaGFyYWN0ZXJzLi4uIHllcwpjaGVja2luZyBmb3Ig
dGVybS5oLi4uIHllcwoKVGhlIHJlbGV2YW50IGxpbmUgaXMgJ2NoZWNraW5nIHdoZXRoZXIgY3Vy
c2VzIHN1cHBvcnRzIHdpZGUgY2hhcmFjdGVycycKd2hpY2ggbmVlZHMgdG8gaGF2ZSAneWVzJyBh
cyByZXN1bHQgd2hlbiBuY3Vyc2VzIGlzIGNvbmZpZ3VyZWQgd2l0aApCUjJfUEFDS0FHRV9OQ1VS
U0VTX1dDSEFSPXksIG90aGVyd2lzZSB0aGUgcHl0aG9uMyBidWlsZCBpcyBicm9rZW46CgouL01v
ZHVsZXMvX2N1cnNlc21vZHVsZS5jOiBJbiBmdW5jdGlvbiDigJhfY3Vyc2VzX3dpbmRvd19hZGRj
aF9pbXBs4oCZOgouL01vZHVsZXMvX2N1cnNlc21vZHVsZS5jOjEwMDk6MTU6IGVycm9yOiBpbXBs
aWNpdCBkZWNsYXJhdGlvbiBvZgogZnVuY3Rpb24g4oCYc2V0Y2NoYXLigJk7IGRpZCB5b3UgbWVh
biDigJhnZXRjaGFy4oCZPwogWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCi4vTW9k
dWxlcy9fY3Vyc2VzbW9kdWxlLmM6MTAxNToxOTogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9u
IG9mCiBmdW5jdGlvbiDigJhtdndhZGRfd2No4oCZOyBkaWQgeW91IG1lYW4g4oCYbXZ3YWRkY2ji
gJk/CiBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KLi9Nb2R1bGVzL19jdXJzZXNt
b2R1bGUuYzoxMDE5OjE5OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gbwpmIGZ1bmN0aW9u
IOKAmHdhZGRfd2No4oCZOyBkaWQgeW91IG1lYW4g4oCYd2FkZGNo4oCZPwogWy1XaW1wbGljaXQt
ZnVuY3Rpb24tZGVjbGFyYXRpb25dCgpUaGlzIHBhdGNoIHNob3VsZCBhbHNvIGZpeCBzaW1pbGFy
IHByb2JsZW1zOgpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvcGlwZXJtYWlsL2J1aWxkcm9v
dC8yMDI0LVNlcHRlbWJlci83NjMxNzkuaHRtbApodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
cGlwZXJtYWlsL2J1aWxkcm9vdC8yMDI1LUphbnVhcnkvNzcwMjE1Lmh0bWwKClRoZSBzcGVjaWZp
YyBwcm9ibGVtIHcuci50LiB0byBwZXItcGFja2FnZSBkaXJlY3RvcmllcyB3YXMgYWxzbwpkaXNj
dXNzZWQ6Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9waXBlcm1haWwvYnVpbGRyb290LzIw
MjEtQXVndXN0LzY4NDExOS5odG1sCgpTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRA
a3VobHMubmV0PgotLS0KIHBhY2thZ2UvbmN1cnNlcy9uY3Vyc2VzLm1rIHwgNyArKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9uY3Vy
c2VzL25jdXJzZXMubWsgYi9wYWNrYWdlL25jdXJzZXMvbmN1cnNlcy5tawppbmRleCA1ZTIwNzc1
MDBhLi5hOWIyZjA4OWE0IDEwMDY0NAotLS0gYS9wYWNrYWdlL25jdXJzZXMvbmN1cnNlcy5tawor
KysgYi9wYWNrYWdlL25jdXJzZXMvbmN1cnNlcy5tawpAQCAtODUsNiArODUsMTIgQEAgTkNVUlNF
U19DT05GX09QVFMgKz0gLS1lbmFibGUtd2lkZWMKIE5DVVJTRVNfTElCX1NVRkZJWCA9IHcKIE5D
VVJTRVNfTElCUyA9IG5jdXJzZXMgbWVudSBwYW5lbCBmb3JtCiAKK2RlZmluZSBOQ1VSU0VTX0NP
UFlfV0NIQVJfSEVBREVSUworCSQoVEFSR0VUX01BS0VfRU5WKSAkKE1BS0UxKSAtQyAkKEBEKSBc
CisJCUlOQ0xVREVESVI9JChTVEFHSU5HX0RJUikvdXNyL2luY2x1ZGUvbmN1cnNlc3cgXAorCQlp
bnN0YWxsLmluY2x1ZGVzCitlbmRlZgorCiBkZWZpbmUgTkNVUlNFU19MSU5LX0xJQlNfU1RBVElD
CiAJJChmb3JlYWNoIGxpYiwkKE5DVVJTRVNfTElCUzolPWxpYiUpLCBcCiAJCWxuIC1zZiAkKGxp
YikkKE5DVVJTRVNfTElCX1NVRkZJWCkuYSAkKFNUQUdJTkdfRElSKS91c3IvbGliLyQobGliKS5h
CkBAIC0xMTYsNiArMTIyLDcgQEAgTkNVUlNFU19MSU5LX1NUQUdJTkdfUEMgPSAkKGNhbGwgTkNV
UlNFU19MSU5LX1BDKQogCiBOQ1VSU0VTX0NPTkZfT1BUUyArPSAtLWVuYWJsZS1leHQtY29sb3Jz
CiAKK05DVVJTRVNfUE9TVF9JTlNUQUxMX1NUQUdJTkdfSE9PS1MgKz0gTkNVUlNFU19DT1BZX1dD
SEFSX0hFQURFUlMKIE5DVVJTRVNfUE9TVF9JTlNUQUxMX1NUQUdJTkdfSE9PS1MgKz0gTkNVUlNF
U19MSU5LX1NUQUdJTkdfTElCUwogTkNVUlNFU19QT1NUX0lOU1RBTExfU1RBR0lOR19IT09LUyAr
PSBOQ1VSU0VTX0xJTktfU1RBR0lOR19QQwogZWxzZQotLSAKMi40Ny4zCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
