Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F49BC05027
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 04:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B39B460ECA;
	Sun, 19 Feb 2023 04:26:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B39B460ECA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sd6PgF0W5tq9; Sun, 19 Feb 2023 04:26:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E955C60FAC;
	Sun, 19 Feb 2023 04:26:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E955C60FAC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 02FEF1BF47F
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 04:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFD6381F8A
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 04:26:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFD6381F8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oSkwhecHDShs for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 04:26:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D954B81F79
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D954B81F79
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 04:26:30 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 gt5-20020a17090af2c500b00233d7314c1cso1855304pjb.5
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 20:26:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KN3WFenlcv3UBbyK7uH6dQicRfdObG+l54yEVsGeLZM=;
 b=zrodCtcqioUnXaTEbwlDBZ09wn1VpQTHW3irdMo/tl3X8c4m3JinMHK1Ssvt3DjB+O
 1uUWg8Pf+tQZHAfwsQx0+GNMy7IkiQEotLkXlDQIF23Hg4kn5pYjxTg/XfojjRFqOuST
 l9MA1W2UFoRsN+aHwjUMDphF0DKvnzWDCum3U4rLDa+ed9ju/JeSHZjZnqGjqeyzeoqr
 MG4CxJg8gYv2O35fwzrztST/+jjqbY1Esd3I+/h/2kdXZNnvJk7/G5hYFXD2S2oeLLj3
 5h+KQJcQNO+UNdhfRDV8CeDE1BouZ72Zk5nUq/gZ173V6SbgaclXedEr8zDkpjgoJNUt
 JwmA==
X-Gm-Message-State: AO0yUKWFMcvK8MkuR7LCLdDTCzQVJsUnjrLJChhRLtpyoe445rYd5BuY
 cHL7+ollzr6Hh1onV/I6nK4=
X-Google-Smtp-Source: AK7set+rQzE7BSt4qbrwGz9WcQ2TzgWWvihSMuwAGhHy/YXy8EbN664weWCADjB8ghSTFGFDVT4Pkg==
X-Received: by 2002:a17:90b:4a03:b0:235:b712:4179 with SMTP id
 kk3-20020a17090b4a0300b00235b7124179mr314408pjb.5.1676780790179; 
 Sat, 18 Feb 2023 20:26:30 -0800 (PST)
Received: from debian.me (subs02-180-214-232-3.three.co.id. [180.214.232.3])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a17090a284900b00233d5552320sm450468pjf.32.2023.02.18.20.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Feb 2023 20:26:29 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
 id C3D39103C92; Sun, 19 Feb 2023 11:26:26 +0700 (WIB)
Date: Sun, 19 Feb 2023 11:26:26 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <Y/Gk8rzGwX1O+vWa@debian.me>
References: <20230218101426.630874-1-bagasdotme@gmail.com>
 <20230218113939.526f0a76@windsurf>
 <96015d0268df72d3cdd58e7db09c1333@free.fr>
 <b5fef166-72c3-25ac-2427-e4255b68f2db@gmail.com>
 <1852709c493974b2588cc7c9c28bba7e@free.fr>
MIME-Version: 1.0
In-Reply-To: <1852709c493974b2588cc7c9c28bba7e@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KN3WFenlcv3UBbyK7uH6dQicRfdObG+l54yEVsGeLZM=;
 b=TNqrHU8vIp2vO9PTqi63RXjXJN70itm+iVFnsUnuCO2dl6J08QpYOLddjhFYQk2iB7
 zOQ4pDLt3+Lrof0Rg/cYAJuSoCB3Q/vFwj9faL6YB6tKzdnFhIW3erSjMpumzAxAJSli
 8IMlPSjcv0HCuu0thn9duiC9dpMM97NMtLvl0R12zyRxQkLiA7ZqgTgjrd5FE3MFyJ5j
 ku4PC/RwMMuHlPb7BNCaSkmwXlQrGPGHv+R6rYaOhOKX8oDn9wE22Yp5R13SYmbrmkt2
 6QDOE9zvF01uXNq0IgARJ6nYJ3SQrrV7LmsOfvF5V7ZIPpBPit7CaVxe+0dcKIYTLeRA
 u/JQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TNqrHU8v
Subject: Re: [Buildroot] Debugging gnupg2 unsafe search path error (was Re:
 [PATCH] Revert "package/gnupg2: bump to version 2.4.0")
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============8957904242286731954=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============8957904242286731954==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hzYMvlTmNoOG/2+C"
Content-Disposition: inline


--hzYMvlTmNoOG/2+C
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 18, 2023 at 06:40:35PM +0100, Julien Olivain wrote:
> Thank you for testing.
>=20
> I still can't reproduce the issue on my side.  Compilation works fine on =
my
> system
> (with and without a /usr/bin/gpgrt-config script), and also in the Buildr=
oot
> utils/docker-run (which does not include a /usr/bin/gpgrt-config script).=
 My
> system
> has the same libgpg-error version 1.46 as Buildroot.
>=20
> Could you tell me what is the distribution of your host system (or what is
> the version
> of the libgpg-error on the host)?  I'll try the same environment in a
> docker.
>=20
> Another way to force the gpgrt-config path without putting the full stagi=
ng
> usr bin
> in the PATH (as Thomas recommended not to do) would be to add the followi=
ng:
>=20
>    GNUPG2_CONF_ENV +=3D GPGRT_CONFIG=3D$(STAGING_DIR)/usr/bin/gpgrt-config
>=20

Hi Julien,

My setup is Debian 11.

For the host GnuPG, I compiled GnuPG 2.4.0 with libgpg-error 1.46. I
source a script (gnupg-setup) to initialize the compiled version into my
~/.bashrc.

The script is:

---- >8 ----
if ! (systemctl --user is-active -q dirmngr-local.socket); then
    systemctl --user start {dirmngr,gpg-agent,gpg-agent-ssh,gpg-agent-brows=
er,gpg-agent-extra}-local.socket
fi

export PATH=3D$HOME/.local/gnupg/bin:$PATH

The actual .socket unit files are copied from GnuPG sources but I add
Conflicts=3D against corresponding system-provided socket units.

For your suggestion above, the build successed only when the initialization
script above isn't sourced. However, when the script is sourced, the build
search for host version of libraries instead (and thus FTBFS).

> While compiling gnupg2 in Buildroot, you should see in the configuration
> log:
>=20
>     ...
>     checking for gpg-error-config... /path/to/buildroot/output/host/aarch=
64-buildroot-linux-gnu/sysroot/usr/bin/gpg-error-config
>     checking for gpgrt-config... /path/to/buildroot/output/host/aarch64-b=
uildroot-linux-gnu/sysroot/usr/bin/gpgrt-config
>     ...
>=20
> Without this line, if the host contains a gpgrt-config, you should see:
>=20
>     checking for gpg-error-config... /path/to/buildroot/output/host/aarch=
64-buildroot-linux-gnu/sysroot/usr/bin/gpg-error-config
>     checking for gpgrt-config... /usr/bin/gpgrt-config
>=20
> and if the host does not not contain a gpgrt-config, you should see:
>=20
>     checking for gpg-error-config... /path/to/buildroot/output/host/aarch=
64-buildroot-linux-gnu/sysroot/usr/bin/gpg-error-config
>     checking for gpgrt-config... no

Yes, I see the message above in my build log.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--hzYMvlTmNoOG/2+C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABMIAB0WIQQJRmM4Nl+8BKPNGvtCNk3+7YYOdAUCY/Gk6wAKCRBCNk3+7YYO
dHM4AQCl4JYrpHZlon6WCS/CxYv5DJCj61lZiNQ0h2qctfOdMwD/ccXAgLbtOoE2
sh6W0GeIfOOIPHAgL85/yzwRdqQ4LaQ=
=h0x7
-----END PGP SIGNATURE-----

--hzYMvlTmNoOG/2+C--

--===============8957904242286731954==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8957904242286731954==--
