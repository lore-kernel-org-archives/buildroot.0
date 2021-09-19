Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F1C2C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 08:23:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48336610A8
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 08:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 48336610A8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C059E401B1;
	Sun, 19 Sep 2021 08:22:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DG2_tvR2Hu8b; Sun, 19 Sep 2021 08:22:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F12540182;
	Sun, 19 Sep 2021 08:22:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 116231BF2AB
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 08:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3B2140182
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 08:22:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 343hkiwfe1Qn for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 08:22:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3A09400D1
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 08:22:53 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([92.117.59.114]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MQMm9-1mErNp2t29-00MKb8; Sun, 19 Sep 2021 10:22:48 +0200
Received: from falbala.internal.home.lespocky.de ([192.168.243.94])
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <post@lespocky.de>)
 id 1mRs5w-00016l-DJ; Sun, 19 Sep 2021 10:22:42 +0200
Date: Sun, 19 Sep 2021 10:22:31 +0200
From: Alexander Dahl <post@lespocky.de>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20210919082230.4gc2l336p25re3v7@falbala.internal.home.lespocky.de>
Mail-Followup-To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 yegorslists@googlemail.com,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Aleksander Morgado <aleksander@aleksander.es>,
 buildroot@buildroot.org
References: <20210918203023.24093-1-yegorslists@googlemail.com>
 <20210919073319.GG1053080@scaer>
MIME-Version: 1.0
In-Reply-To: <20210919073319.GG1053080@scaer>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Scan-Signature: 6b03a241deecb23831faefb76f476838
X-Provags-ID: V03:K1:MIzlNtDbv8ISHXxb386j0YPaIx/KatKwqYOewF8kw/hOXZZDAcW
 wIJd1RZdDFsOQe+Taxe4ToEYG8PMHCW4tZt6gM2CPly5zHNpNmB5aQgQ/mpesaR9IiUwM4B
 VnecZwgfNHMuBWv+nPedeqbKhRparCg6len/hT8mjLjhK6uplkHT+O/OjtpgvXR7lodKDxh
 ySrDiZx0Zp5viFUd07gNQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:P+q06tKlWU4=:vf6tivKEgvI+hsqcMx5AmX
 ZlEkLRmfVQziVgBChu5IqmwxSmtVCarJK6+fonsi1CeKcZ+HcRa8QtaLxyYXjPr1D1QDb1sE9
 ry4qaHLd7G3gBOD7obTQNvh3W79WLy3sO0u0evBnyN7zsu0rOair9+OLNNq2GwUIaFE7C6GuB
 gvkCuv+dIC2hn/f0zzKmdqeK4hfCEzXNBR3kQDY9bCXVf8NImJM0dLs1JpTCOFc4QwKdixXy4
 yYKdy2TkgDCM/QCZVuENtlfFg4B5gJ4h3fVZ0yRvsnVz3JXYLHnDPCQf7+xNusjsZQ+Jbk6yJ
 2XmCnML/WrOqB4VJiB7LKFp7PSkjoO8wUZ8N4btoUGg196Q3JZ2yfv6CX+zDgGR6dYmb+lWpw
 vC7FHs3XkYHWviJz2PEdZUsqWY7o+LdrKEFrdCGywzdFqLlzzOvlm3NvVdZLxp62bKcGyw9tD
 rxjTiw2fHV7Tlye/nqxdZ3LhDx0ilvhJokgZ1sAiZX35hZq05MmnZLw0GbGKLAAvIYYXpF5zh
 37fEApsC0ZgWIxEL06HQLF26iWpvCHrYC+JfsbAHvcbp9Xn/K7qaEW39zcWtKgoXky2RlRFek
 gwRZsVdpIx12EzR3Kni3RVjkLKsBFTZyXW6juXjB0vJkgTOKb0k8pM1tnCPjzkXHgpGIK3J2N
 9EK0ePQ1ohbuDHi2yDlUnd94bEcS3rggHfD+UdYFKlzAQs0jynd70qqXz4e7OaMx7f/d/g57G
 VvPaOt2Xy8XD3fsFIUT8gfzjqpaQ2yyNcSVBWQ==
Subject: Re: [Buildroot] [PATCH] package/modem-manager: bump to version
 1.18.2
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org,
 Aleksander Morgado <aleksander@aleksander.es>
Content-Type: multipart/mixed; boundary="===============2960104579617025362=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>


--===============2960104579617025362==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="towyttbqld4hdeve"
Content-Disposition: inline


--towyttbqld4hdeve
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hei hei,

On Sun, Sep 19, 2021 at 09:33:19AM +0200, Yann E. MORIN wrote:
> Yegor, All,
>=20
> On 2021-09-18 22:30 +0200, yegorslists--- via buildroot spake thusly:
> > From: Yegor Yefremov <yegorslists@googlemail.com>
> >=20
> > This release introduces meson build system support.
>=20
> No, the release itself does not introduce meson buildsystem support:
>=20
> > As meson files are only available in git, switch the location to
> > https://gitlab.freedesktop.org.
>=20
> as you say, the support for meson is only in git, and not part of the
> released tarball. As such, I don't think it should be considered usable,
> so we should not use ir.
>=20
> When upstream does an actual release that contains the meson stuff, then
> we can consider switching over. Until then, I think we should stick to
> using the buildsystem in the released tarball, autotools.

Actually upstream wrote in the announcement meson support is not
complete (yet):
https://lists.freedesktop.org/archives/modemmanager-devel/2021-September/00=
8826.html

Greets
Alex

> Regards,
> Yann E. MORIN.
>=20
> > Add support for bash-completion.
> >=20
> > dbus is now a build-time dependency.
> >=20
> > Also add support for systemd and polkit and disable the manpage
> > generation.
> >=20
> > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> > ---
> >  package/modem-manager/Config.in          |  2 +-
> >  package/modem-manager/modem-manager.hash |  2 +-
> >  package/modem-manager/modem-manager.mk   | 50 +++++++++++++++++-------
> >  3 files changed, 38 insertions(+), 16 deletions(-)
> >=20
> > diff --git a/package/modem-manager/Config.in b/package/modem-manager/Co=
nfig.in
> > index c4c723776d..d211d68ee1 100644
> > --- a/package/modem-manager/Config.in
> > +++ b/package/modem-manager/Config.in
> > @@ -3,7 +3,7 @@ config BR2_PACKAGE_MODEM_MANAGER
> >  	depends on BR2_USE_WCHAR # libglib2 and gnutls
> >  	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
> >  	depends on BR2_USE_MMU # dbus
> > -	select BR2_PACKAGE_DBUS # runtime dependency
> > +	select BR2_PACKAGE_DBUS
> >  	select BR2_PACKAGE_LIBGLIB2
> >  	select BR2_PACKAGE_LIBGUDEV if BR2_PACKAGE_HAS_UDEV
> >  	help
> > diff --git a/package/modem-manager/modem-manager.hash b/package/modem-m=
anager/modem-manager.hash
> > index 14597215df..fb0ddec4a5 100644
> > --- a/package/modem-manager/modem-manager.hash
> > +++ b/package/modem-manager/modem-manager.hash
> > @@ -1,4 +1,4 @@
> >  # Locally computed
> > -sha256  2ccf1f716c2d121e8e6709bcf8af29ee86971a90adacca2e8d6288b3027886=
2e  ModemManager-1.16.10.tar.xz
> > +sha256  79e83f7082d02e72a5c5e7fdf9b67bd3dd71da0da3d02607dee76ae06b9d4a=
a9  ModemManager-1.18.2.tar.bz2
> >  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b8806=
43  COPYING
> >  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe5=
51  COPYING.LIB
> > diff --git a/package/modem-manager/modem-manager.mk b/package/modem-man=
ager/modem-manager.mk
> > index a881edc272..7a7bd3bb4c 100644
> > --- a/package/modem-manager/modem-manager.mk
> > +++ b/package/modem-manager/modem-manager.mk
> > @@ -4,42 +4,64 @@
> >  #
> >  ######################################################################=
##########
> > =20
> > -MODEM_MANAGER_VERSION =3D 1.16.10
> > -MODEM_MANAGER_SOURCE =3D ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
> > -MODEM_MANAGER_SITE =3D http://www.freedesktop.org/software/ModemManager
> > +MODEM_MANAGER_VERSION =3D 1.18.2
> > +MODEM_MANAGER_SOURCE =3D ModemManager-$(MODEM_MANAGER_VERSION).tar.bz2
> > +MODEM_MANAGER_SITE =3D https://gitlab.freedesktop.org/mobile-broadband=
/ModemManager/-/archive/$(MODEM_MANAGER_VERSION)
> >  MODEM_MANAGER_LICENSE =3D GPL-2.0+ (programs, plugins), LGPL-2.0+ (lib=
mm-glib)
> >  MODEM_MANAGER_LICENSE_FILES =3D COPYING COPYING.LIB
> >  MODEM_MANAGER_SELINUX_MODULES =3D modemmanager
> > -MODEM_MANAGER_DEPENDENCIES =3D host-pkgconf libglib2 $(TARGET_NLS_DEPE=
NDENCIES)
> > +MODEM_MANAGER_DEPENDENCIES =3D host-pkgconf libglib2 dbus $(TARGET_NLS=
_DEPENDENCIES)
> >  MODEM_MANAGER_INSTALL_STAGING =3D YES
> > -MODEM_MANAGER_CONF_OPTS =3D --disable-more-warnings
> > +
> > +MODEM_MANAGER_CONF_OPTS =3D -Dman=3Dfalse
> > =20
> >  ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBQMI),y)
> >  MODEM_MANAGER_DEPENDENCIES +=3D libqmi
> > -MODEM_MANAGER_CONF_OPTS +=3D --with-qmi
> > +MODEM_MANAGER_CONF_OPTS +=3D -Dqmi=3Denabled
> > +else
> > +MODEM_MANAGER_CONF_OPTS +=3D -Dqmi=3Ddisabled
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> > +MODEM_MANAGER_DEPENDENCIES +=3D systemd
> > +MODEM_MANAGER_CONF_OPTS +=3D -Dsystemd_suspend_resume=3Dtrue -Dsystemd=
_journal=3Dtrue
> > +else
> > +MODEM_MANAGER_CONF_OPTS +=3D -Dsystemdsystemunitdir=3Dno -Dsystemd_sus=
pend_resume=3Dfalse -Dsystemd_journal=3Dfalse
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_POLKIT),y)
> > +MODEM_MANAGER_DEPENDENCIES +=3D polkit
> > +MODEM_MANAGER_CONF_OPTS +=3D -Dpolkit=3Dstrict
> >  else
> > -MODEM_MANAGER_CONF_OPTS +=3D --without-qmi
> > +MODEM_MANAGER_CONF_OPTS +=3D -Dpolkit=3Dno
> >  endif
> > =20
> >  ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
> >  MODEM_MANAGER_DEPENDENCIES +=3D libgudev
> > -MODEM_MANAGER_CONF_OPTS +=3D --with-udev
> > +MODEM_MANAGER_CONF_OPTS +=3D -Dudev=3Denabled
> >  else
> > -MODEM_MANAGER_CONF_OPTS +=3D --without-udev
> > +MODEM_MANAGER_CONF_OPTS +=3D -Dudev=3Ddisabled
> >  endif
> > =20
> >  ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBMBIM),y)
> >  MODEM_MANAGER_DEPENDENCIES +=3D libmbim
> > -MODEM_MANAGER_CONF_OPTS +=3D --with-mbim
> > +MODEM_MANAGER_CONF_OPTS +=3D -Dmbim=3Denabled
> >  else
> > -MODEM_MANAGER_CONF_OPTS +=3D --without-mbim
> > +MODEM_MANAGER_CONF_OPTS +=3D -Dmbim=3Ddisabled
> >  endif
> > =20
> >  ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> >  MODEM_MANAGER_DEPENDENCIES +=3D gobject-introspection
> > -MODEM_MANAGER_CONF_OPTS +=3D --enable-introspection
> > +MODEM_MANAGER_CONF_OPTS +=3D -Dintrospection=3Denabled
> > +else
> > +MODEM_MANAGER_CONF_OPTS +=3D -Dintrospection=3Ddisabled
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
> > +MODEM_MANAGER_DEPENDENCIES +=3D bash-completion
> > +MODEM_MANAGER_CONF_OPTS +=3D -Dbash_completion=3Dtrue
> >  else
> > -MODEM_MANAGER_CONF_OPTS +=3D --disable-introspection
> > +MODEM_MANAGER_CONF_OPTS +=3D -Dbash_completion=3Dfalse
> >  endif
> > =20
> >  define MODEM_MANAGER_INSTALL_INIT_SYSV
> > @@ -47,4 +69,4 @@ define MODEM_MANAGER_INSTALL_INIT_SYSV
> >  		$(TARGET_DIR)/etc/init.d/S44modem-manager
> >  endef
> > =20
> > -$(eval $(autotools-package))
> > +$(eval $(meson-package))
> > --=20
> > 2.17.0
> >=20
> > _______________________________________________
> > buildroot mailing list
> > buildroot@lists.buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>=20
> --=20
> .-----------------.--------------------.------------------.--------------=
------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspi=
racy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___         =
      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There i=
s no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspir=
acy.  |
> '------------------------------^-------^------------------^--------------=
------'
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

--=20
/"\ ASCII RIBBON | =BBWith the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.=AB
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)

--towyttbqld4hdeve
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEwo7muQJjlc+Prwj6NK3NAHIhXMYFAmFG80IACgkQNK3NAHIh
XMaVpg//deW+Jpwt5ZqPMPwuTobj7CUT6NQMjzNOw/B+11cgb2jIejW9MX45Euu3
ophj6SKpVLmCqoWh22d7sHjKiTK7tIjZx6dmpsK0W6QvdKFIjXsgMwmTifWiUphV
ehemtTfMkwdhKM8tseZTt07aMwon6xrQAYPOFe5xs0lYgq2S6+9l7+dLKpdqeYbH
ynUINxbVkGFqRA2IuTmhmINQ9R1ynTiUWvapFbG8LAMwBPL9w6qSwxvW+1DrM8SZ
LgYio6UPWJjk8bWYJrUWYGjBZI5wvuAJOmDGefUZun/zMBPJB45d+VVGqD4ODNHA
qHuw8uTVXPqW2qJGs0ltGdkIN0383dr8Ocn9J4ujSDiq+uVOAV7ebiTQiMeWK8lJ
w1wyXZTjFbZgNNASoDfe8CHLQ+ZmBkz4H5pypPNqjS7WTfqN+2cjpNXG4wKsJRv9
3E48J3eFJ5zJN1wKH9je4dOHdC2q6dzjrE7WyhIuHoGqoHiccgsZ8zV8nuexWS2v
EoSN6mhkPqbi1khXRIovun9IdsoaOVr0WZE29w554B8qurdMXMwJ4Cs6sIdPgyAP
u/NZUb4rHvycKVeIEpEnDOqte/VHEuvCpvBn2zHJmCoJNMJz27hlc6IzW2eEOJaF
FALs3OLVpSmpdiHpEOMkSGQdd4wR1tQ3gZo39Y1oEWj93cp0cLY=
=5cqJ
-----END PGP SIGNATURE-----

--towyttbqld4hdeve--

--===============2960104579617025362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2960104579617025362==--
