Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0426DC79F8C
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 04:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EDF280EB3;
	Sun,  6 Sep 2026 04:55:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ZdQcNVKacuV; Sun,  6 Sep 2026 04:55:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4298A80EB4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788670501;
	b=KDtnUxA/FmhXBfddcgooQlMEGBPuayhdJc7z3JTDAgxNcnm4c7U5JlfdyqZEQ+Juphsh
	 Ly708vzbiAg58RG73TMZg5lOJa7JBjnayhjasFCnuMf2u/rmI8Pcwklp0GEUPxXwFLXq4
	 F4B9tUEXFY4NPuqXfLKu7Xh9v276pOhfmKrUwOr4xCGhXghbH/ye6XoACxGK9NBzGemfx
	 AdH38rtFRg/MJMiCOSxKDVPZ5bVn/IW22aXEad5JkzjGeUNPOB6Uu6SGmmNfvcDVkT6vY
	 1YEuXyMkkzpukMfB5llWuzGth74P8ZuXURj54uAakb602qADiSx7hkFouXkudl7RqnA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788670501;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:MIME-Version:Date:From:To:Cc:In-Reply-To:
	 References:Message-ID:X-Sender:X-Virus-Scanned:X-Virus-Status:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=dUA/YxStGhpedRsU0vmXqlyNuzSEtImbNZD9Sz0csZo=;
	b=meX60t9JvECh2jJY9Qx5b3afM5zw/cw8FhX5royNzEATFlJ8V8dEL8+F8sIlpyYOw6rO
	 7xnFKJjfozE3o87HiDMXej899TrF1hE0Jz/ISSbKvPkWq0lkkKVlQb2SkLTIYWHPutmHK
	 /CgVbXcq6E7xRhNPUMvek5qx0+h8zQIrehivTeUHJPbRz14TCrNYzNji0UtKdsQk8Wso1
	 yzRGDSXeESatzUvusdL4JZSbgKvi/grvW7JySbMZsNJN5u6vQlMz2P4xjtE6j9HbqPKP7
	 GGT8tGHMUavngn1Wy1tNvQA/IlDDWMo3W8GL+q0Lic7iZqC8+N8aL8zp0y0DjuXDSpA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788670501;
	bh=dUA/YxStGhpedRsU0vmXqlyNuzSEtImbNZD9Sz0csZo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WleWaciLaO8CfGVJrKh5C+D1Ydb9EBFHKlIIxB1sPs332TtyNoccguYS1k/65IkWg
	 azKNxxD3vMzWQqcZFxb8DaPGxBdTNWAnek2/l1BV5W8hXlI/1JCypHoo4rwDOTWZWa
	 RKiWDgQOIggwxMd8XVxcfAC5c/oOaGMFap0o8/9ZFL4miXeh2dbKKObwnwYkLNf/SY
	 UYYa3YgQ8euASDB/XS8jipMLvnyBv2JV0rAu9zpBFI2Skxf4q+RsPedKxF1DE4+5mY
	 UaM2C7ZDtevRjD+0gPDKSBQmsm7Ows+5b7KIPZgMm0YPeSkCjU9UWov/Kf+K1SEcp3
	 l6dss8B9DYfzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4298A80EB4;
	Sun,  6 Sep 2026 04:55:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 878D4118
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 04:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CF9260612
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 04:54:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lC_DrA4db0An for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 04:54:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7C53060609
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a01:4f8:151:30a2::163"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788670498;
 b=XyyfGivonG3Sas6Fr5LpgISWnjVnXweHhu5Qb/d4aFT/LU980CmGXliITNmjTcgrTmCY
 mnMIYosWP78SNIGhIDi+MVJotCggBjII6bT3goFHUl363RQEsVu7GgOykMBeB+UwjqD2s
 3W0YWm1YPCrvC9qSvgz38zTumqUf+Ek7boWqlUs0WA0vECaOepi7uJMGzSVTzwIUoQy7f
 hyP3I6e0akiXQZF5Q52xWrG+F8W4votzopmCJqtDYSHCD4BPVGrBTKj1KRLKlltKMDTSL
 0rD73K7FFm4XggcvCJqiAj1YWbB8B3Bz9qk3yLmz9vi/KjM7nim5iuzLHrXpC3YIOUQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788670498;
 h=Received-SPF:DKIM-Signature:Received:MIME-Version:Date:From:To:Cc:
 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
 Content-Transfer-Encoding:X-Virus-Scanned:X-Virus-Status;
 bh=7hkwx6359kKvQpP5IinOwb2/nH0Uw+X47uKm+R5Pi7A=;
 b=OuKRa2ybCLZv90m13hvxrIhmNcDJhKbl9In2HAg1tgS/ceauWFzssfYjF1IrhE9X7h0j
 sTaEhDKJMEBEm5MwM3ICfb+kHKNsXHqxGIs3KWE9Oe4MiJILfN/XiPjTd0mKbg0/ZoLW2
 2VJhZlDT2EoPtVVd2n8IWRsoOHGPvRHIw0LplxeEMjAfVkUrElP2FOdoBFUC+AYTJx6Wv
 dPEbMEp1mt7Do+Kl3wCq3zRdH0BIpvdYvPb0el16nALcL6VZkM+0O9/GSBFai+hbVwOxP
 Jo7VYZYyZYtBU4NZ+9zhA3FFfz/hVGShbncnJJuDHssLpER5NWhh1uvt7sK+3CIPGiA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=none header.from=umbiko.net; 
 dkim=pass header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b="HBjHZmQ/"; 
 arc=none smtp.remote-ip="2a01:4f8:151:30a2::163"
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=HBjHZmQ/
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C53060609
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 04:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umbiko.net; s=mail;
 t=1788670492; bh=QdB83D2CI+QHUUCnSKX6l1DoKTB0LU4O3KKPa1A5Dus=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=HBjHZmQ/VgM+bdjJGDZsiIG8LnTMP2pFZj7SBCqZ4ZTK2zM777p5/T9oSxLevTeyx
 HzOpz1MGedFxvEz3wA4w4521KG89ZCMFZlosLlSyZ4COpefJJ8xKbc43QqCIgHYval
 ioS1bCm+fup6ZR55X/GJt0UhDi3nmSW7bWhRraqE=
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 7D992BDE3E35;
 Sun, 06 Sep 2026 06:54:52 +0200 (CEST)
MIME-Version: 1.0
Date: Sun, 06 Sep 2026 04:54:52 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Marcus Hoffmann <buildroot@bubu1.eu>
In-Reply-To: <apwkJkKsWDShYA-8@windsurf>
References: <20260905040256.2221199-1-br025@umbiko.net>
 <20260905040256.2221199-3-br025@umbiko.net> <apwkJkKsWDShYA-8@windsurf>
Message-ID: <a628e7dbd84c1dd705bd6d1d9aafcc38@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] [PATCH v4 2/2] support/testing: add runtime test
 for mpd
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 2026-09-05 14:17, Thomas Petazzoni wrote:
> Hello Andreas,
> 
> On Sat, Sep 05, 2026 at 06:02:53AM +0200, Andreas Ziegler wrote:
>> The test determines if mpd was started by the init system by querying
>> mpd status via the built-in protocol and evaluating the result.
>> 
>> Signed-off-by: Andreas Ziegler <br025@umbiko.net>
> 
> Thanks for this new iteration!
> 
>> new file mode 100755
>> index 0000000000..4cc6895602
>> --- /dev/null
>> +++ 
>> b/support/testing/tests/package/test_mpd/rootfs-overlay/root/test_mpd.sh
>> @@ -0,0 +1,35 @@
>> +#!/bin/sh
>> +
>> +mpd_command() {
>> +	mpd_result=""
>> +	mpd_state=""
>> +	printf "Execute %s" "$1"
>> +	while IFS= read -r line; do
>> +		case $line in
>> +			OK) 						mpd_result=$line ;;
>> +			OK\ MPD*)					mpd_protocol=${line##* } ;;
>> +			state:*)					mpd_state=${line##*: } ;;
>> +			ACK\ \[[0-9]*@[0-9]*\]*)	mpd_error=${line##*\} } ;;
>> +		esac
>> +	done <<- EOF
> 
> Why are we "hacking" a minimal mpd client here instead of adding
> mpd-mpc to the image and using it to test mpd?

Hacking? The MPD command protocol is the official way to connect to the 
MPD server: https://mpd.readthedocs.io/en/latest/protocol.html. Every 
client uses it, including mpc. I use CLI one-liners regularly for 
debugging issues and a more complete version in a Python script for 
checking libraries. Why add yet another program for checking a protocol 
output?

> 
>> +	export mpd_protocol
>> +	export mpd_state
> 
> Why does this needs to be exported?

Variable scope is not clearly defined within shells. In POSIX, all 
variable declarations are global; Busybox's ash should not know about 
scope, but tolerates 'local' definitions; bash has a basic understanding 
of scope and treats function variables as local. Since I switch shells 
often (by running scripts on different machines) I usually export 
variables in functions that need visibility in the caller. It is also a 
good reminder that the function "returns" more than one value.

> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
