Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391CDC624A4
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 15:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E73C14056A;
	Mon, 31 Aug 2026 15:53:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V640JB74dYSR; Mon, 31 Aug 2026 15:53:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788191601;
	bh=vfyLTxfGc2WnlK22ffXHAZCmj9yGz5/8QCs+bsq7YhY=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=czmHx5F9TR57wYT2jixP/PwdQG6JEbL7b5YXcbbfU0M95GC5lwPdQAOsGITh/7BAW
	 4h9ipnRcqjinek/uefR8iyKNJpJ3n60Mg6Ebludnmsd/plqLG/hY3J+E8Pw/STiL/b
	 nAl7oJLLT6wfhrDySF2v758o67AfmjHQ9MHQ8O1G/tQzhZucaI8TewWNIyL0DheVHE
	 7AyR6b+KVZadVP1Ss80cYKBuGNZXH+lI0LfJvazZOv6DZmtAEO61EYOGPsixro6kbO
	 Rqh2MiER46jiK3ZdUpNxoWXrZ05u9c6NFeV4b0krFDlhVuWGt8IWUzx8NnDuxi5Yiy
	 o40C+zCcV91KA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68D9040549;
	Mon, 31 Aug 2026 15:53:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 64E1A2FD
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 15:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AB0D40549
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 15:53:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iKDMnJcWAzaO for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 15:53:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.168.131;
 helo=mx0a-0031df01.pphosted.com; envelope-from=chris.obbard@oss.qualcomm.com;
 receiver=<UNKNOWN> 
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 553AB40545
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 15:53:18 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67VFpO7P954891
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 15:53:18 GMT
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd8cvs5xc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 15:53:18 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-836c9f68dcbso55233267b3.0
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 08:53:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788191597; cv=none;
 d=google.com; s=arc-20260327;
 b=HND3Rso+HOPauHx7cHIXEfYBJ8J4Xrk06s8AX7m6wkoFcwCL3/7Gih3zf4ObrHxpXs
 gpRPhpDANcml/GAZUmE624T0cfIEIULYR+YuQIOLfEx3c/Hi3Bo5vapXH3zyZEsI1JDM
 RA/8aO2sUcnYzCn2U9VmuUZ2VM8AbjDf4tHPLbvlJIJSZK8g2aofIrp2AU1PTRqGAj9m
 qLlfMlhSQOmrV/nRpDiJGD8nHkkftm9MYX6twtXIL3jrgEUclQp661rO8uvY2lM+55if
 eBTJJ80UcACStir13h/XXMuYhLbSjMBemw9q6P3saaIlUOJD44w8jnRI1ja/BM9Vu3Wc
 TTKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=S3WkL7BFzwjeexH9LCJOcawpW6tZfOWGXItJfSftpxU=;
 fh=SxFyu5t76ee56XyUI+NVlLOn4f8Cs91YmkEBFhre3X0=;
 b=G/jMYoQ/1eDK2oe9nH3/J95yeNC1Mo1e7Ib+4Bq3NnA/Kmo0tHdL/V3sg+b2XaEPYi
 n3Ou2ggp5qNH7BoQ/llIv77U4ZJKLn2+ST3OiWtTabl5+89abQ9lwWl5ejo+qCIO3LIo
 2Y4ze0EN3qAqGClc0qFh7EWnipO7Jf8LKCP0b/7Gkk6qmgvhCHYzauwpskSBvKf6hxUO
 JRNndeclqTo44VpxkbfPnHD4ahFrr0WyOFuflSrlwmnavWufzZcjUM/9/ffIc6kR34ec
 yyeaspx7KIsd/jUi9IZi/LuIvKpQ45ZTCzNK/P2b2Yx8/KJ5WHIeJfIiTJ/cXP5CcWpg
 636A==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788191597; x=1788796397;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=S3WkL7BFzwjeexH9LCJOcawpW6tZfOWGXItJfSftpxU=;
 b=VPAKkqv5KLkdJTJmsAk1cHudXzi2Bm1geuIS/0wjSwL47LrsgUJF/5LDnLT0CQFRFD
 66/lHc8Io++os9aq8RPUyiFcqByYXPNSbx8Cr6wQhZiMdSkv36dt6htKRG2RyEm5Dl73
 KIcdFMBfTgsC/NVWBdZfdogC1i/y0i70dMQ659sXHTv69gKXfWZzHoJm0z/Ho/aZjf5O
 9lrptsOPK4Xo0X4H+oYd+udkqiUSlMpIdGW4BRhgxl7wifA7hFPO2ZSq9hJrGNGWuraN
 ohdLojJYV/Fn588SFbNJsPKP0x2pk8AcSApJGx8HKOKKKlRgpEHbKCsbP0rIWHk/DMtp
 z0ew==
X-Gm-Message-State: AFuF++lvGSc8U8yBdBKud83MTUnV5Yn34Bcsg+yaosPRYbfBixb9Rx3a
 VNXuLG0fkUNlWT8L0w/d2miGAwgfMmQ3d4SCnuOouwYdCHe2DozakX0a/3xhxkijjBYp6Wheta7
 BFVFS38iaPgZzDpdmTaCf5Yqq2LOYK2FB7F6MaHp+peA4SnyuISlWS8zCSD2RDO5bR20e02kjfG
 f4OMjdw32srR8KnwNyxBBU7mQdhazckPDrHi9DN1c2Vvo=
X-Gm-Gg: AYBFou2NB/SlANuih0PbnQkME7yYAiMpm0PxZC8AKu9fdDYVZKwzmC4Ax0gsyKsWjeT
 g7nY9GP+44/SrjBVpkT406Ll31cvfv/Fvhg73SZn1AeXPkJvmQpdFIlZhA7w67KxbqdfyIh46og
 H2xcDTAPFOrByxEpfshwl0IuV4gs2OOervx/J3lpVF/yO/lIziR878SYvK
X-Received: by 2002:a05:690c:398:b0:864:7ad7:a2f9 with SMTP id
 00721157ae682-8647ad7ac36mr45586847b3.28.1788191597278; 
 Mon, 31 Aug 2026 08:53:17 -0700 (PDT)
X-Received: by 2002:a05:690c:398:b0:864:7ad7:a2f9 with SMTP id
 00721157ae682-8647ad7ac36mr45586637b3.28.1788191596814; Mon, 31 Aug 2026
 08:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260829-wip-obbardc-package-dtui-fix-armv5-v1-1-1dfdc176385d@oss.qualcomm.com>
 <apNK8wHXKqXUz1n7@windsurf>
In-Reply-To: <apNK8wHXKqXUz1n7@windsurf>
Date: Mon, 31 Aug 2026 16:53:05 +0100
X-Gm-Features: AcwNN1UlaXqhhdSD6XmKq18mXh6JQCD8TuCIJeAEQsbQQr8vMhO45Y8zgbQzA1c
Message-ID: <CAPnEM6bFrZt2Gr=tR9qYf_ixPe38DAvNpOGa8se_J2OsaxYLFw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Christopher Obbard <obbardc@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEzNSBTYWx0ZWRfX7tUvuVj5D2f0
 86O+KSUcB26CJMrMmFmqdSnvZnNeK8wswTzvvUARrePUEAEdWSl9dihdOu4gObciGxb2f3E9VI0
 voJB+oezv9lV88Qw9LCcOXqDl5iSTAM=
X-Authority-Analysis: v=2.4 cv=JtnBas4C c=1 sm=1 tr=0 ts=6a95a36e cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=P-IC7800AAAA:8 a=gclNHXdbYVx0Uk-JWVsA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEzNSBTYWx0ZWRfX5nV307Wgimcg
 WpQUpr4cly6+qkU+MRgE629bBKKezLnzXk1nRnVS60XLGM73G5B1dNsi5s47ad8034rGYQqROSr
 w10Am8Ot/qtVdV0FjJrlVUytfJ+YH6RcR6V6m4aviE4MZyQBSYTn21a4ZIy8cNP6wUOqZezicJA
 U38F+J5qn2m5ModoL+eiYkP/bowHOYZ5oPu7iJf7S6NEpEwSDJUyh26X/t9eZ+f0W/a2vVYZa4q
 hXtHN9qG2cH6F55xnY5c5URDgCOGEHqX80Ee2k2gFBuJg1huWcXjBTfUaHUJNBVyYLrek/RcXjT
 7CmEfDM+4PxhgSCPr8o5435BbgpWgRguNM+I0uK7IxhPjlNASdNEuwt5SH3fkKY1EhwrFjIcbGD
 GYkcmO2zRN8ojpn+6bpg2xEuJpJP65V5S82YWJB5lq/GIEkvWnIbxKEQYNIjbchu3N5U+ahz8f6
 Z4yxVfWoFI2U2Rtc0WA==
X-Proofpoint-GUID: Y9vAq-8BxL0zw2cSvBl4T1VlcCIj7Kgo
X-Proofpoint-ORIG-GUID: Y9vAq-8BxL0zw2cSvBl4T1VlcCIj7Kgo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310135
Subject: Re: [Buildroot] [PATCH] package/dtui: require 64-bit atomic support
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
From: Chris Obbard via buildroot <buildroot@buildroot.org>
Reply-To: Chris Obbard <chris.obbard@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKT24gU2F0LCBBdWcgMjksIDIwMjYgYXQgMTA6MTLigK9QTSBUaG9tYXMgUGV0
YXp6b25pCjx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhlbGxvIENo
cmlzdG9waGVyLAo+Cj4gT24gU2F0LCBBdWcgMjksIDIwMjYgYXQgMTI6MDE6MDJQTSArMDEwMCwg
Q2hyaXN0b3BoZXIgT2JiYXJkIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4KPiA+IEFzIGEgZm9sbG93
LXVwIGl0IGNvdWxkIGJlIHdvcnRoIGFkZGluZyBhCj4gPiBCUjJfUEFDS0FHRV9IT1NUX1JVU1RD
X1RBUkdFVF9IQVNfQVRPTUlDXzY0IHN5bWJvbCB0bwo+ID4gcGFja2FnZS9ydXN0Yy9Db25maWcu
aW4uaG9zdCwgZGVmYXVsdGluZyB0byB5IGV2ZXJ5d2hlcmUgZXhjZXB0IHRoZSB0aHJlZQo+ID4g
dGFyZ2V0IGNvbWJpbmF0aW9ucyBsaXN0ZWQgYWJvdmUuIFBhY2thZ2VzIGNvdWxkIHRoZW4gZXhw
cmVzcyB0aGlzCj4gPiBjb25zdHJhaW50IGFzIGEgc2luZ2xlIGRlcGVuZGVuY3kgYW5kIGl0IHdv
dWxkIHN0YXkgY29ycmVjdCBhcyBydXN0Cj4gPiBnYWlucyBuZXcgdGFyZ2V0cy4KPgo+IFllcywg
cGxlYXNlIGFkZCB0aGlzLiBJdCB3aWxsIGJlIG11Y2ggbW9yZSBleHBsaWNpdCBhbmQgbG9naWNh
bC4gTWF5YmU6Cj4KPiBjb25maWcgQlIyX1BBQ0tBR0VfSE9TVF9SVVNUQ19BUkNIX0hBU19BVE9N
SUNfVTY0Cj4KPiBDb3VsZCB5b3UgcHJlcGFyZSBhIHYyIHdpdGggdGhpcz8KCkkganVzdCBzZW50
IGEgdjIsIGJ1dCBJIGZvcmdvdCB0byBjaGFuZ2UgdGhlIGNvbmZpZyBuYW1lLCBldmVuIHRob3Vn
aAp5b3VyIG1haWwgd2FzIHJpZ2h0IGluIGZyb250IG9mIG1lLiBPb3BzISBJIHdpbGwgc2VuZCB0
aGF0IGluIHYzIGFsb25nCndpdGggYW55IG90aGVyIGZlZWRiYWNrLgoKCkNoZWVycyEKCkNocmlz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
