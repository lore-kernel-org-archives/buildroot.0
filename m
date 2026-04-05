Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C78E9D800
	for <buildroot@archiver.kernel.org>; Sun,  5 Apr 2026 15:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA9BB80FBA;
	Sun,  5 Apr 2026 15:49:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EPTiyJzVMdQt; Sun,  5 Apr 2026 15:49:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E169980FA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775404148;
	bh=7o4pSE0X6JZMGeq5IngszqjkJd/fq5k8K3DgFc8PF7Y=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HqWVw/oGFy5th0WWKcA9Om2Gy0fwxb7f0835Bh1wabV4JHrD1WhbrMG+qz5nb4dPT
	 g1soVOVioK7t8vCBFkXa4mK0Klr5ZzDfbUSxgIPE+9y+mPboHWVdbApgLiEdAeawKz
	 0yH1ZU63qm46zgVIStkp7if6fo4cyjYLZ7C+/hkqqMNFZdeOGOSyF1B9VRWm3+rTTX
	 6IRME1y8KjloaQspBbWKXEOWGi3SsNi4xHhA3O2/lq7FlxsRggHHvWQ+szi7k25EJX
	 Qyk1olqyi2+RDYPlSXI1P286Zq+2yQ3ChVlVVHmtnBr37C02/xXgSEE9jIpIPDeYkp
	 jbD5RmWc3qX6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E169980FA2;
	Sun,  5 Apr 2026 15:49:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 121E6219
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 15:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0386A40AA5
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 15:49:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6smW7GxOYVKV for <buildroot@buildroot.org>;
 Sun,  5 Apr 2026 15:49:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7FD3840AA3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FD3840AA3
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7FD3840AA3
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 15:49:00 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRTN9-1vos9i42Uf-00QLJR; Sun, 05
 Apr 2026 17:48:24 +0200
Message-ID: <e09aa58a-2cb0-4ef6-b9fd-1a6a6fd15a21@gmx.de>
Date: Sun, 5 Apr 2026 17:48:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: Brandon Maier <brandon.maier@collins.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240831191919.370005-1-fiona.klute@gmx.de>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20240831191919.370005-1-fiona.klute@gmx.de>
X-Provags-ID: V03:K1:9T1UhCWHMIIvaU53Zq9Us6G+UB9ljtxPtSAqynGYTIcpkIQ8MTz
 PEMuBBbn/3noO5zixXiZahne1NIKO6g1VmqFqD4xvaIpXQ7FUTfplsdW8i8go4jcJNTfPGn
 l/kl4C16LShAekWiAZSDNO3UIszUbqDgmY42VMy4nNwsfE+iSybj7PBN/s1xDmA9OHcLf+D
 y7GYo725dFV0G/YxMM3aQ==
UI-OutboundReport: notjunk:1;M01:P0:gA1kpHMSKUU=;qvZ/Uovpv+e9ycNZhzKkWxTTk0M
 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
 nCwMqrHrJiw+zCsogC+eV7pw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1775404104; x=1776008904; i=fiona.klute@gmx.de;
 bh=dTBDkSLwS2G0X6QQ6C0aLtN7/N4/XZFlcWl4aRsivrg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ov6lx4cmtltBZtKMXukdBh1v1ZIVNNwnlf7t8Hgk0g/NybV7cTLstFL9N5nYtRik
 WRNikCZ/VYjUBOGYNEIQsc9iv2LoY6KUAFikwnQItC984xiy2+xorojTL11yHGB+U
 qjpzshcrJVpxjH8TIgfYowUkTWaSh90bt3cO6jotEmXkzTZ6BtNwg6uewaL0bATdn
 zGd4LTvWuDLR4u+S9ZRUfxoOtD4A5SkOIYFEZ0CPe3B5e3ZDTEALxmZpEYq/d03vB
 CeulqAcSuG8UHI+2/aNB7nkSm5i9NAu5SkhQS6H9gMRC6z5kodtowpw533VU5In4p
 aQx7YSdXHR16zNjliQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=ov6lx4cm
Subject: Re: [Buildroot] [PATCH next v4 1/1] utils/docker-run: mount and
 pass BR2_EXTERNAL dirs
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

Hi everyone,

with the documentation clarification in 
f9cdca48a57f24f2babb8f72652e099e08a59cd5 merged (BR2_EXTERNAL is space 
separated, with colons supported for backwards compatibility), can we 
get this merged? As far as I remember proper handling of spaces was the 
main point of contention in review, and with the decision for space 
separated list the patch should be fine as-is.

Best regards,
Fiona

Am 31.08.24 um 21:19 schrieb Fiona Klute via buildroot:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> The BR2_EXTERNAL environment variable is passed into the container,
> and each path listed in it mounted. This allows using external trees
> when running a build using utils/docker-run. Testing the existence of
> the variable instead of a non-empty value allows passing an empty
> BR2_EXTERNAL variable to disable currently set external trees.
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
> Brandon, I've dropped your reviewed-by because the changes from v3 are
> significant and counter to what you suggested in previous
> reviews. Feel free to re-add it (or not).
> 
> Changes v3 -> v4:
> * Split BR2_EXTERNAL on spaces OR colons
> * Revert changes to mountpoints processing loop
> 
> Changes v2 -> v3:
> * Use read to make the loop that creates mount options more robust,
>    removing pre-exisiting shellcheck override. Suggested by Brandon
>    Maier.
> 
> Changes v1 -> v2:
> * Correctly handle spaces in external tree paths
> 
>   utils/docker-run | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/utils/docker-run b/utils/docker-run
> index 1adb02d74e..9579f83ce2 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -90,6 +90,13 @@ if [ "${BR2_DL_DIR}" ]; then
>       docker_opts+=( --env BR2_DL_DIR )
>   fi
> 
> +if [ -v BR2_EXTERNAL ]; then
> +    docker_opts+=( --env BR2_EXTERNAL )
> +    for br2_ext in ${BR2_EXTERNAL//:/ }; do
> +        mountpoints+=( "${br2_ext}" )
> +    done
> +fi
> +
>   # shellcheck disable=SC2013 # can't use while-read because of the assignment
>   for dir in $(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u); do
>       docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )
> --
> 2.45.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
