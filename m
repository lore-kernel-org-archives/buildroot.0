Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DC7C982D6
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 16:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9494460B49;
	Thu, 17 Sep 2026 16:12:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1w39-731CYm8; Thu, 17 Sep 2026 16:12:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A11C160B57
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789661532;
	b=aUoF0dLGRhvzQx+wLLEqK5m04wzCx5FX6vWwZ1CYp4hMw5YpUi7X3PU1ePI8WnfxiFfj
	 ReXg5VDwj/VV8lRUpi3HPV/O7hgLXElDI6ceUQFqTeq3/q0s8p39/dOJlyzpfEVd9ogxE
	 JWOr/CvrIQE8dIsoq5fej/uUhnFZg4FbICZnB2tdEQVXQEMEV44LHNQY3qBD4Xm++WO/U
	 rbmQQzmIWwH+MUvk1aZVEZ5abDnW18L9Rkj/G0/Z1KwaTo/OyB9lMxJ96zlZuXOPJP0aY
	 /hbXg8Hg81qeBnjgBB6W/32A8BUh2Oq+L54h9ajAcHu8WrIP7AfnoEheJxhN5qqVJnw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789661532;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:From:To:Cc:In-Reply-To:References:
	 Organization:Date:MIME-Version:User-Agent:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:Errors-To:Sender;
	bh=QdnVlqsqmxZ5zz5sP781/GnTAzEGEvFYXXmSG5lGRQ0=;
	b=AmsyzGgnpPWEN/0yGdh3zJZ8TwSSx7o0Y8WJt7g9TXYyhUWoVnwMmIlBjG7ddEauFXnC
	 fWx89fz9rRiyNaO653b6lhJnxmOuDBSTiEkxE1EPtrpnOBAaLo0b1fUYSwG/gBGXUPeNl
	 p6w1AVIom/8CUx9OFgfeXdjDViamtphjG2lglQfImIN6gQl1G6dTKg0tI5BVDo5Ubk0eV
	 sqT+k21PlMEO222OwMWXmCZ7rOxJF4nhydeLDQO1nHmyb7VshG8b05tFF64xkEl8xHsLz
	 qkPNULbNgSvn0hgDqehGuhATiAbUInr1VdJyeJqE6jQNM0Yt5AIfBuxrYU4NY8LApjQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789661532;
	bh=QdnVlqsqmxZ5zz5sP781/GnTAzEGEvFYXXmSG5lGRQ0=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WKe67JYuDDDmODKIByEGNJbgyAM7R/riTeSqIzQNVNLZ9dBVZpxQVK5OvmfcQlYvh
	 RdshAo/EGQTzrHhClIayjLwL6sKujkXeAsEDeYAfdyiYH2TdcIzR4AS91Fovz7NwAc
	 Wc2jcY7jtMxjJ2+FDwLhZbL4MhBPB2e1vpfiqS68xEYXVWX1iFgH6N/PJzrJehEhPo
	 xEkBkrlia5+NfVjEdDT/gjpNn5csFGIwH8E735sZZXOHN4i2HEJoEFPHRsR4PGn6qe
	 i6taqanPnjBBgQ5eS2/5uHWApalJ1YEBwCkBFh2iAOHQ9Xeo7J13rpQ84Eqn/7+LC8
	 R/Y/p4nwecbpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A11C160B57;
	Thu, 17 Sep 2026 16:12:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D3E3A29
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 16:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE99D81092
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 16:12:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UG50gmUAwQrY for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 16:12:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 021CC810B0
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:34::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789661527;
 b=dB1U76fzQuJtSrZyh3LXRYd0KmmWaNy51iTWjF78B3jYtr3lpxPBdZQtUeQiLZb7mJ1e
 ZdJFCEB92WppOQQ0A05koVTenw/p5BjExaY8Xgt60Rz+6RWPthJ9DUWxDrhO5ebPLZY3w
 Z/BrpNd0wSVAfhDFcEUeXK3UCxToKY4+y4Vd1N9qpk3aHFgXjGqhAbCpXFDr0NVvxW47C
 s1vHCXyeVBFMZYkzOLguu6O5skOwiX3akaxW9pVOtuovsrP0dfwyHdd4mQCtZMwgp/h0i
 ob15KKH72modyOnTeJdYctImhBvKG9gSFJB2/dfGkTESKYiOEpM8lKvX4HutuWU5grg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789661527;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
 From:To:Cc:In-Reply-To:References:Organization:Content-Type:Date:
 MIME-Version:User-Agent;
 bh=SP9cWVHZkWIOKXEXUJe8AhZX1YUNtkRS3rnMwWtkdZ8=;
 b=O4wJmKA31xKbztMFP4JlJMIRJQ2V/uVqMJPM8eDCpEHjdaA2yN6QvFhHEobsiKf6mOFu
 5pVKOoJwep6N7LKoBvWQ/7eXFmT2rNLCj3tQ8VV+YSwH26npUqsrOFajsa5JQ+3wkeV2+
 ItxZlGztH6wGoht/6mDMf3xL26uakxE54v8bMq/y8T0gVLSBcXEjwHmpGBNFo2BRxyT0R
 EnjnNAa9KSGSF8YxIktL1ZE7vjiyAylfrRjyab3idakJNb+ah0U6X4m7Y/l8u30ueU/B7
 4x1oiFdeeT/58z8fHnPzsYYe0HHKOhu6X6HT/Hh46WIX2aRneyWMeyGzp3zSC4iay5w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ZaEmBrBX; 
 arc=none smtp.remote-ip="2a00:1450:4864:34::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:34::10; helo=mail-ej2-x10.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ZaEmBrBX
Received: from mail-ej2-x10.google.com (mail-ej2-x10.google.com
 [IPv6:2a00:1450:4864:34::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 021CC810B0
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 16:12:06 +0000 (UTC)
Received: by mail-ej2-x10.google.com with SMTP id
 a640c23a62f3a-c254f9f0b1fso173097366b.2
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789661524; x=1790266324; darn=buildroot.org;
 h=user-agent:mime-version:date:content-type:organization:references
 :in-reply-to:cc:to:from:subject:message-id:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SP9cWVHZkWIOKXEXUJe8AhZX1YUNtkRS3rnMwWtkdZ8=;
 b=ZaEmBrBXEiBMAem86le7syb862ZPqKKaGaTfN8QSksGk9aQZYZJGmPuGp6z2vouCyr
 YRujkXxw1l0RZgbNgmPEy8G99EEQTfxU2SzXNLuoqRUT3hhA1kTpkCLLzkjpLcssDJym
 R2N5S9HhL8GcCF9NB0agdDnyEDIrVJ+unv2VG0Ib85+IPnUtG4WJtE6hyRwnV4PVLU5X
 1bXu9MloFDTDJARPA5EVh/avjLi3QD6r0W64kPqoZLeeErvIop3oSvtXihpIvC0l18eY
 LfS1I8famt6Dz1ccfhdbb2ESf40c+8ZIsuH3ds5ECakUjv4+4XmQEDnyJRTZLP/tm9X1
 vKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789661524; x=1790266324;
 h=user-agent:mime-version:date:content-type:organization:references
 :in-reply-to:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=SP9cWVHZkWIOKXEXUJe8AhZX1YUNtkRS3rnMwWtkdZ8=;
 b=lu83zEprv2/tO3ODtxD8Gm4rHQ3udmaJYSc2IcZ7wSthZJElLkgn8IkdaxRIgUdnHn
 CIQ5LitMSRSfhRSnblvOnfg5+qkRFQZLwkosQAOnwPDcq2yUc2Mj3B+JrS6V7azUkLEB
 x3tsh7ppmr3M3wcAXtd120jg8m7sM9Y5TKGG0Af/AqgngH6wlGdZoYKsH+d93W8xIP85
 WdqF6//BEtLYYsLW0RUk2hkCxMt2W8lZevCEepOnOrn7HDM7b1bLPsn58xrmCuekpvQv
 zn4WLAkKI0PA3vyoXnXlpzX+WCBmE7zmIsVmynppLmN2hZL5rAHp035X6fE2xKsbTopR
 Ipug==
X-Gm-Message-State: AFuF++kEEGuF8kmfwRDPsaLnpa8siDuyzZtNcsrvlq6xfhZni7HZeisg
 wY+3Q6Yjpsa7mAadX5MVuHXZHuG4Vt1tXFfwTXwnmopwkt86toJHyZ9U/uAK+g==
X-Gm-Gg: AYBFou2/R1JBTX12eMPXy1lcw4DqDYKyygWBh6yYYlzyzEPk3rW6134i7jIOc/pDISF
 jYgBlN1WDnX8R0wBF1V4NRVl1yIMVgzS5CSykjH85rODfBJEynIILzst23SIXO78uSJP2O3hcv4
 rJ3+nCc7YsKTNWNNZgnp+5c0VEyEFR+D0EUsulUoTU8tu6Qfbku1CJuii+PTdkG94HkK59mzHQL
 ncsTel+tND8EeyP5s3qR6je6fKqZJY/zBPlrGFNwIxxE94tqc9iPsE5vNE7nzy35CNvDGQdun3U
 cFYUyYFDCluaBcHwSedMBfdGYpPNfiWmh1F7JHwhr7j2QEj94iQUITetR6ow4p5+oaQH6Y4JWMG
 eAMnaUufTO3oZBx1UrixH+14gKJl+x93UvF6qvCCjl8k/TFfQhKLYsJsts7faqvE5kqtVKIYOaw
 +fatPMTG5KTZZcEjzQMKFeC4ezX9ioPdNN1LCozEqXSYVzMbhKJWu+NbCG+1+tOHDjAO44kvkzD
 M2zVdBuWONmjrj0IT8LJve/VyXV0N5dy6yG
X-Received: by 2002:a17:907:960c:b0:c29:f5d8:9c72 with SMTP id
 a640c23a62f3a-c29f5d89db1mr294221866b.33.1789661524172; 
 Thu, 17 Sep 2026 09:12:04 -0700 (PDT)
Received: from [192.168.0.200] (h-158-174-22-6.NA.cust.bahnhof.se.
 [158.174.22.6]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c29de5e4ca9sm305962566b.42.2026.09.17.09.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 09:12:02 -0700 (PDT)
Message-ID: <827779cbc5d27660618d1389c6dca48eae00e9d1.camel@gmail.com>
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Julien Olivain <ju.o@free.fr>
In-Reply-To: <20260917160543.243218-3-troglobit@gmail.com>
References: <20260914103020.3485030-1-troglobit@gmail.com>
 <20260917160543.243218-3-troglobit@gmail.com>
Organization: wires.se
Date: Thu, 17 Sep 2026 18:12:01 +0200
MIME-Version: 1.0
User-Agent: Evolution 3.52.3-0ubuntu1.1 
Subject: Re: [Buildroot] [PATCH v2 2/2] package/lldpd: rework start script
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
Content-Type: multipart/mixed; boundary="===============3358539598436338326=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============3358539598436338326==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-hgDjTqiRPdCbmM2/4kf5"


--=-hgDjTqiRPdCbmM2/4kf5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Oups,

this has already been merged, please ignore.

Sorry for the noise this creates! I somehow messed up my patch queue.

/Joachim

On Thu, 2026-09-17 at 18:05 +0200, Joachim Wiberg wrote:
> check-package reports six warnings on S60lldpd: indentation with
> spaces, no DAEMON variable, and shellcheck complaints.
>=20
> The script also masks failures, the exit status of
> "[ $? =3D 0 ] && echo OK || echo FAIL" is the one of echo, so start and
> stop always return success.=C2=A0 Stopping does not wait for the daemon t=
o
> exit either, so a restart can race the instance on its way out.
>=20
> Rewrite it after package/busybox/S01syslogd, as the manual asks.=C2=A0
> lldpd
> daemonizes and writes the PID file itself, but does not remove it on
> exit, so pass the PID file to both start-stop-daemon and the daemon
> and
> drop the stale file once the process is gone.=C2=A0 Also pick up argument=
s
> from /etc/default/lldpd and add the customary reload alias.
>=20
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> [Julien: remove .checkpackageignore entry to fix check-package error]
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> =C2=A0.checkpackageignore=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
> =C2=A0package/lldpd/S60lldpd | 80 ++++++++++++++++++++++++++++++---------=
--
> -
> =C2=A02 files changed, 58 insertions(+), 23 deletions(-)
>=20
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 2fc8349f1e..32be4c93aa 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -550,7 +550,6 @@ package/lirc-tools/0001-plugins-devinput.c-fix-
> build-with-musl-1.2.0.patch lib_p
> =C2=A0package/lirc-tools/0002-configure-add-disable-doc-option.patch
> lib_patch.Upstream
> =C2=A0package/lirc-tools/S25lircd lib_sysv.Indent lib_sysv.Variables
> =C2=A0package/live555/0001-Add-a-pkg-config-file-for-the-shared-
> libraries.patch lib_patch.Upstream
> -package/lldpd/S60lldpd Shellcheck lib_sysv.Indent lib_sysv.Variables
> =C2=A0package/lm-sensors/0001-no-host-ldconfig.patch lib_patch.Upstream
> =C2=A0package/lmbench/0001-scripts-build-use-bin-bash-as-shell.patch
> lib_patch.Upstream
> =C2=A0package/lmbench/0002-src-Makefile-add-lmbench-to-list-of-
> executables.patch lib_patch.Upstream
> diff --git a/package/lldpd/S60lldpd b/package/lldpd/S60lldpd
> index 3dfa6c1aa1..79605c2f02 100644
> --- a/package/lldpd/S60lldpd
> +++ b/package/lldpd/S60lldpd
> @@ -1,25 +1,61 @@
> =C2=A0#!/bin/sh
> -#
> -# Controls lldpd.
> -#
> =C2=A0
> -case $1 in
> -=C2=A0=C2=A0=C2=A0 start)
> -	printf "Starting lldpd: "
> -	start-stop-daemon -S -q -p /var/run/lldpd.pid --exec
> /usr/sbin/lldpd
> -	[ $? =3D 0 ] && echo "OK" || echo "FAIL"
> -	;;
> -=C2=A0=C2=A0=C2=A0 stop)
> -	printf "Stopping lldpd: "
> -	start-stop-daemon -K -q -p /var/run/lldpd.pid
> -	[ $? =3D 0 ] && echo "OK" || echo "FAIL"
> -	;;
> -=C2=A0=C2=A0=C2=A0 restart)
> -	$0 stop
> -	$0 start
> -	;;
> -=C2=A0=C2=A0=C2=A0 *)
> -	echo "Usage: $0 {start|stop|restart}"
> -	exit 1
> -	;;
> +DAEMON=3D"lldpd"
> +PIDFILE=3D"/var/run/$DAEMON.pid"
> +
> +LLDPD_ARGS=3D""
> +
> +# shellcheck source=3D/dev/null
> +[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
> +
> +# lldpd daemonizes and creates the PID file itself, so tell it where
> to
> +# put it, but it does not remove it on exit.
> +start() {
> +	printf 'Starting %s: ' "$DAEMON"
> +	# shellcheck disable=3DSC2086 # we need the word splitting
> +	start-stop-daemon --start --pidfile "$PIDFILE" \
> +		--exec "/usr/sbin/$DAEMON" \
> +		-- -p "$PIDFILE" $LLDPD_ARGS
> +	status=3D$?
> +	if [ "$status" -eq 0 ]; then
> +		echo "OK"
> +	else
> +		echo "FAIL"
> +	fi
> +	return "$status"
> +}
> +
> +stop() {
> +	printf 'Stopping %s: ' "$DAEMON"
> +	start-stop-daemon --stop --pidfile "$PIDFILE" \
> +		--exec "/usr/sbin/$DAEMON"
> +	status=3D$?
> +	if [ "$status" -eq 0 ]; then
> +		echo "OK"
> +	else
> +		echo "FAIL"
> +		return "$status"
> +	fi
> +	while start-stop-daemon --stop --test --quiet --pidfile
> "$PIDFILE" \
> +		--exec "/usr/sbin/$DAEMON"; do
> +		sleep 0.1
> +	done
> +	rm -f "$PIDFILE"
> +	return "$status"
> +}
> +
> +restart() {
> +	stop
> +	start
> +}
> +
> +case "$1" in
> +	start|stop|restart)
> +		"$1";;
> +	reload)
> +		# Restart, since there is no true "reload" feature.
> +		restart;;
> +	*)
> +		echo "Usage: $0 {start|stop|restart|reload}"
> +		exit 1
> =C2=A0esac


--=-hgDjTqiRPdCbmM2/4kf5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEShHhOTSGNO9JnOys7Kgmo3tsdAkFAmqsEVEACgkQ7Kgmo3ts
dAng3A/8DzI7vP/1Z9HZs5G5LqxoFo2JAugAwzCbLKXjGS840el/6U+8RtLEYCZ4
FR3ZwiIdeLeE2g7X3n9PX7oVUWW8lTfXbqdRs3W5OCxB2RK1uzZtODNvbiYlqP5Q
TV8pRrrWrQ0eHz1V6TpvgB1RKFmploEsrDqNyVcHyP6uazhhsO02+t8+7iyk+k4Y
CaLLoj6rKGrvvf30dYJ5u71qVFSmCtQcfeUWOlCus869YBSS6j+NE1PkxIw1IlDU
TK6thv/eQb4L36bpHeOtfpb2MlRd4BQXFrvVZ2p3LI7ZH9RRFuq/q/3H5t8zqE+U
NoE/nOM8USx3SaV+SsyWktC8oM0b4kUP519yAQsNYRfkvkP+GY6noUQ//LGxMtmh
Iao3QU4X1gWf1u7wO4PkbzyHGDza/C0oAs8UtONj6hVDj4x8sK6BD+k3uXElnmBg
ILAc6mQ9ByCe0hcIVGh+a4fI3268bKGPM1Bi8/f0327N8Xb7T54ttABpDhGl+o5U
D9q8QPk0t9HMZSQ8kTA8p6s8GAuf0J4yvw1JB2dpjyPacTPWIObmKjyLFVkDqnHs
Rz1TMU1ykyLt2hmFoXzwRw1++HC87KHnKMkRa+EwJ71R0gX+q02JK9Sq74LUrSlR
1awuswtjqES0iDxvLpgBgDnqj/E0lF+dpOkwljO/SOByKiCDvTM=
=KDaD
-----END PGP SIGNATURE-----

--=-hgDjTqiRPdCbmM2/4kf5--

--===============3358539598436338326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3358539598436338326==--
