Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C90CA5FE0
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 18:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A782440DC4;
	Fri,  2 Oct 2026 18:55:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u2O6C846vU3C; Fri,  2 Oct 2026 18:55:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C68E840BBB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790967344;
	b=cBxERT0bUaung7bvOIXm/XbE+DlsuWhZyweRPyeFger07nx9G346uxIVVg3cP9IwyXd/
	 ygxVaDXiRdYkS2L6Wc+o4XJxicEHX5xxeS4OTSMKKVvIoVbg9Cvd1B79cw70gg1oQ20b+
	 98YdGsetlJEGHn/OFyFO8LesOmFn8sRy2q2OowIjZ/leuB0PL0E5hAUspMWaQ3DPeJuyr
	 bZHwOc9pFH6wwE3zUJTwGjACm6XRTVI3hpOpzp8ESzGP2/sUva4OjQgWqohU1g6f2GnNC
	 UIV4ataf4F3ZLqxMd1nixQrjGp/6WgBtOY8JJZnGShlQEhrdLdrqeqqnlgINSWhAXTA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790967344;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=v8HtGjf7GIz0M859d8H5yVWWeVAsL+5T8oFheyjG7ew=;
	b=DvII1dfmQkxjBwNhRz8Ypx9h34Hi+0HV26ftSPzNecs+gRHgl2OftD+5aEjORkgwWWdg
	 h2b9Z5QYBXj1avObrD5FKsFsbOSkr6+zKL2NHW/hEHk6jlOmdkHSbF2TItOWPAX46mo7Z
	 SzUydoHWqbOM1unKHH3c00b6IfLGD6vxkUE2X1hJVrAz9BOII/jem/AiixwwMssSAi+tO
	 FGkmpgynD7LMtuHvrGWXI+tsbdJzmlO9pjjKA4ldf2U0fNIqzCUNZoJ5ZqxH4OTosspE/
	 btKSmr1FexP+t6NNe6eCSP3Vmj8Eaf13nxNI4WIMbgo+YtYIlcUXO0zRqW2UcJHjnaQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790967344;
	bh=v8HtGjf7GIz0M859d8H5yVWWeVAsL+5T8oFheyjG7ew=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=YmTqYs6H9E7xp2Koja1dIc3jxrXOnRKoE3KoNWOjaEHqnqLnfTkWUbBzCcU+e9KWq
	 ob1wJomh8ohOSgg8TFVmjg5uR6GjfaWfysC2mR3pss3XcFrKj4LSQqSCr0uOukrhYn
	 y7O1CW/aoWitraBKyX2bqUCWcRNkJfbYnE18PADUQpFoR1DuDhGF/+iJ+NE7ih6hY1
	 ugpQ4dTywNaYzvWLDT9jj0L7y2j3jJ66rhEAElMziJPpMrzPQy8U1pA8si5TEI0z4f
	 DNiZYWV94b1x1NboWfyMBIQLKAmmfjesiLAm/qEjnoE1mROGgdWhAaMlxBsT6v9OcB
	 T9KNSR4+T7p2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C68E840BBB;
	Fri,  2 Oct 2026 18:55:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 870F7282
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 18:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 670B5400C7
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 18:55:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AeT7SRL02Fzm for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 18:55:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org E308C400BC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790967341;
 b=NOpHGcmYsWXyrRFC4rjPkvMalCAQ1uGnRe/Wc8mLS7DbKYf7ZgqQVazjYC04T0AAqLdJ
 ukwznFAeC/oZhmoE7j8taqm5MzXM7kfpnavoP/+5O1mBSNdVCrGGMB3IkI7xND6ya56AC
 9IvogyXfKXDH63WkCHhPnOrGbtJ10h64yYe1VCoH2kw1VPQCoNyntWYvDIo604nNCikiT
 IAUi4EcRhetCm5NtxgNsC1cBfa0TCU85Gv1Lxymt6wEgJ8efrL5oETxvRZGQjgcvcvV6O
 SL5zJ06B2eQsOeH6laxJACi1833T/0moVGtiWeki8YbTWGB4uRfzl4LXwjAlULKswow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790967341;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=B13WR4k/cKAKuyjIWHwBL8lc4/5lseiNul5jQ9xL8vA=;
 b=ph86Gl8w/FQSWLi9yfCO3y2uBjpeCOagxxjMvmML1bLmTedF2f/fcmy23qf/PmNJBlRE
 gl1zDg4JOvxPZunKHKc522WOR98Y09JItTH6Alxg4/MsbwEmRke1pi9xsxLCW5RKjbIOO
 XYDYiqttWZaO78ud2DGqzHRImbKKABF3tUsi3pag6i7q49f/D+uuOBSXJ/woDUlmw5zl8
 ApG4NqZQ+HuSKJHYsZrwcvKO3GEUvAb5OAa+epdp1gC68HrRWmZ/l+Ps0C/gVZx4lOe6E
 EH9vOfsMOK5pCAtG8IxWTq3FbtrhD16B9f/QxYk2rgoQfit764X25FaBYu4qNHVTF4g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=THSGDWm0; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E308C400BC
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 18:55:39 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUGiJ-1xKaNk0dBT-00YK1c; Fri, 02
 Oct 2026 20:55:31 +0200
Message-ID: <37eedeba-2ec6-441e-b4ec-1e4186e9104c@gmx.de>
Date: Fri, 2 Oct 2026 20:55:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: TIAN Yuanhao <tianyuanhao3@163.com>, buildroot@buildroot.org
References: <20260606024042.4765-1-tianyuanhao3@163.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260606024042.4765-1-tianyuanhao3@163.com>
X-Provags-ID: V03:K1:NerdhSi+zoE3J+h+mGQnRsSVJypImytBkcjmmKCyvMJuk7QXPmj
 htiTvJ42uz5N8yCRlFtbvqu3MJnCEYC5QRYE5xQTE27SH9dR9qmGRrHwEZFpT8eqmdbEG1P
 ruhIF9Pe6ZTv5jFxWV5x/rCVNg0kkIT7SRIglJw+oI0pYxQapfeCRezn/C/eQ/EUX066W46
 wsa8OHhNRi+aHdRVhSDBg==
UI-OutboundReport: notjunk:1;M01:P0:dFAwePgO9mU=;H1u5yuZVOQF0OdGoZFSwT17rjy/
 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
 Jd3wVp0f1xCUoaUwUOBlHnL/shNROMBPW2QEmc=
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: add clock group for
 PTP and RTC devices
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 06.06.26 um 04:40 schrieb TIAN Yuanhao:
> systemd upstream added a new udev rule to set the clock group for PTP
> and RTC devices, allowing applications like linuxptp to open clocks
> without root privileges:
> https://github.com/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2cdeb5decdfbcd
> 
> Add the corresponding clock group to SYSTEMD_USERS so that the group
> exists on the target system.
> 
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>

Applied to master, thank you!

> ---
>   package/systemd/systemd.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 9ce4f8fef2..e4484b9aa1 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -699,6 +699,7 @@ endef
>   
>   define SYSTEMD_USERS
>   	# udev user groups
> +	- - clock -1 * - - - PTP and RTC device group
>   	- - render -1 * - - - DRI rendering nodes
>   	# systemd user groups
>   	- - systemd-journal -1 * - - - Journal
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
