Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBC7C54EAA
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 08:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 812C08283D;
	Fri, 27 Jan 2023 08:59:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 812C08283D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aEAWVPBkjEn5; Fri, 27 Jan 2023 08:59:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAFFD822DD;
	Fri, 27 Jan 2023 08:59:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAFFD822DD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C47061BF289
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 08:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAC9A61217
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 08:59:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAC9A61217
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ze4Dl9xZi09v for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 08:59:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E22CF61215
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E22CF61215
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 08:59:32 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id d14so4300277wrr.9
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 00:59:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AdFOBcL9YZQxFJVGIb4y3kyOm3QQwr+Odz9hmSBa3jY=;
 b=66K60Om143tR3wfoP8wvS9zTOZ3ZXaT+AzcZDotMWTDoPbU/9lDONGQvqVThneAOA1
 3sX/A+Jz4KkZYOJVaZ0QzYP52caSP1QF4r/lsZScBZqxblksG1Gl6FN4RHVjfyMc7ni2
 +vhGBPMJf8hfWh+fPkQHHt6P51hJW36tHZEorTMcSwEIWo0zCDBv0YFvwvqr3KvEo5bY
 39AVkz36vzMcmT96Nyvk7Xjac2WmrMHI4R5jG+aEU29z11DsWRmheFzIWWiEiV41YMEp
 fHuTEqJ2eY5EpWaitfQtLpXEgCx3qudP3qzIYaAX6rCbvZtUfJJIl/Mf1MLKiFWK27PQ
 Uv2w==
X-Gm-Message-State: AFqh2kojg2UPJoOCrr47M8gJUXf+1pqqvRzHzE7ZTFymTZv65eUihsTU
 09yhH9j94eE19pHoQ0mwthJlApYKMxbBPQ==
X-Google-Smtp-Source: AMrXdXvKXSZcUurCf5QZoq4YxJ8mQrtEPJzXH2d93HTuHDCa3I4O8euEuNifXhBbUjqTL6vPLTy3tg==
X-Received: by 2002:a5d:591b:0:b0:2bf:65ac:ebcc with SMTP id
 v27-20020a5d591b000000b002bf65acebccmr23505425wrd.17.1674809970998; 
 Fri, 27 Jan 2023 00:59:30 -0800 (PST)
Received: from gmail.com (82-209-154-112.cust.bredband2.com. [82.209.154.112])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a5d610c000000b0028965dc7c6bsm3416721wrt.73.2023.01.27.00.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 00:59:30 -0800 (PST)
Date: Fri, 27 Jan 2023 09:59:28 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Daniel Semkowicz <dse@thaumatec.com>
Message-ID: <Y9OScCkKs32SNWig@gmail.com>
References: <20230119143408.1911081-1-dse@thaumatec.com>
MIME-Version: 1.0
In-Reply-To: <20230119143408.1911081-1-dse@thaumatec.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AdFOBcL9YZQxFJVGIb4y3kyOm3QQwr+Odz9hmSBa3jY=;
 b=idem+zNsecNXyh15pjEmgr5NdGytyvHT/5Wvj4pWEyghL9x6VgOyQjwKEhKO66hpjD
 mWxKVN/09XmfGjAkF3npsLPtJ2hlyVIO51u/Hdf1ghWaCe3cW1SvR9eSDRukqI7QKgf5
 m5K9i88G3RmDmjQ0A8RKCZz8QloYDv6UqKRUzC4Qkw4VmYtmDLypMq2dg5+roqtb7jaT
 brnQvjEEPeaSjUvj0yN9Wn6hHVMfY4E4VjgRI5KbSCtyEU2Va6WNF0/POQkoDykO3lSE
 ry7p2+2Re9yEUij/bmL0FPYJDmeA+eVbnRXhzHa1qfJahs+icTaay0CPzPMdGYn/UfBv
 nciA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=idem+zNs
Subject: Re: [Buildroot] [PATCH] package/libcamera: Bump to version 0.0.3
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============9147708102008891104=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============9147708102008891104==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VjWVSPHy9QaPYiVY"
Content-Disposition: inline


--VjWVSPHy9QaPYiVY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jan 19, 2023 at 03:34:08PM +0100, Daniel Semkowicz wrote:
> Libcamera recently started to version the software, so use the
> version tag instead of raw commit hash.
>=20
> Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
> ---

Sorry, I was not aware of that you already had sent this patch when I
did send out my series.

Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>


--VjWVSPHy9QaPYiVY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmPTkmgACgkQiIBOb1ld
UjI1UA/9GWbsLV3d/KI8pjSc2O2CrizOEgi2pfVEFVV9gjjMpt7HqNth9n5nw5gh
XTm6DlWQ4KEQewgJESm08gv4qfWbvLci+aNtseeZ0qMtMGkwdYSoIPo16dHSYi6q
1ot4bslnTDsgSWWpvYtLy06kiW4Y6t9te9R3P2AZOQ7ugnRviwCg9hq7N7N1HMKo
3Wss55LqcBn/wup5/9RSgpEjQjNdRNQjjIKvBCVgzlHKDWT4ff5tmUDrobl326rC
iiz60NqkXPa0cwgnCHWA1brcY7rKSid84nXfY6gylnWR4LtTDvU8lvvlg54unO0F
SmhaIhVDPc4T/vkxNeyX30iQnZzDXgR08PbchUsaQQpT9i6EEe4uuNNUPo2Lbts3
7wpUjz4TPFfnVWJXwXA0gGFU6qhFCFFP4hAxh94v1rPSME2nBM7w/LfmRvC54zXf
8RPOK47+ijj3BSilQ/r/Xx1W1EvB77HBIpJhyn3c3PpLXb2IxTLAeQvbQR3aYybt
5yJ2oqn8ifEHuk2Mec72+pco6iqrX1Y1EUhD+58zuoDThbcfddU1LfZ5wWAh3XiT
+6JpHQOgSVPIkPdgMr35xZ/MvZWV28Ut2j+PJc7SHN1e0XbXKIuDJTByzWgZI0fj
koEqc/vRVtgcrhFsmtDVo3kQ4zZhWRg8m5LD/4jqwG+RSID82IE=
=3krc
-----END PGP SIGNATURE-----

--VjWVSPHy9QaPYiVY--

--===============9147708102008891104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9147708102008891104==--
