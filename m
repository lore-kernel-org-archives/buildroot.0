From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 10 Sep 2016 01:01:29 +0200
Subject: [Buildroot] [PATCH 1/2 v2] package/libssh: fix dependency on
	libgcrypt
In-Reply-To: <20160909211144.GG5740@free.fr>
References: <cover.1473369033.git.yann.morin.1998@free.fr>
 <35cb1a1a8f3d459ffdd0a66b14db4ee4f92b329c.1473369033.git.yann.morin.1998@free.fr>
 <dc3ef2bd-18a6-ac59-e290-9fd108889b56@mind.be>
 <20160909211144.GG5740@free.fr>
Message-ID: <e17d93b1-3590-03f1-c9cb-9d15a15aa64c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 09-09-16 23:11, Yann E. MORIN wrote:
> Arnout, All,
>
> On 2016-09-09 22:58 +0200, Arnout Vandecappelle spake thusly:
[snip]
> >  Well, there are still some that prefer a different crypto backend: mosh prefers
> > nettle over openssl, shairport-sync prefers polarssl. But those packages don't
> > depend on anything so no problem.
>
> Depending is not a problem; it's the select that is a problem.
>
> What we must be very careful is to always do the select-if in the same
> order for all packages.
>
> For example, the following is wrong:
>
>     config BR2_PKG_FOO
>         select BR2_PKG_OPENSSL if !BR2_PKG_NETTLE
>
>     config BR2_PKG_BAR
>         select BR2_PKG_NETTLE if !BR2_PKG_OPENSSL
>
> This would cause quite some issue for Kconfig...

 Yes, that kind of situation should be avoided.

>
> And I don't know how I did my previous check, but we have quite a few
> different ordering:
>
>     $ git grep -E 'select
> (.*BR2_PACKAGE_(OPENSSL|NETTLE|GNUTLS|LIBGCRYPT|LIBNSS)){2,}'
 Great regexp! But you missed polarssl. And libtomcrypt but nobody uses that.
And beecrypt but only rpm uses it.

>     package/flickcurl/Config.in:select BR2_PACKAGE_OPENSSL if
> !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_LIBNSS)
>     package/gstreamer1/gst1-plugins-bad/Config.in:select BR2_PACKAGE_NETTLE if
> !(BR2_PACKAGE_LIBGCRYPT || BR2_PACKAGE_OPENSSL)
>     package/lftp/Config.in:select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
>     package/libssh/Config.in:select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
>     package/libssh2/Config.in:select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
>     package/mosh/Config.in:select BR2_PACKAGE_NETTLE if !BR2_PACKAGE_OPENSSL
package/shairport-sync/Config.in:select BR2_PACKAGE_POLARSSL if !BR2_PACKAGE_OPENSSL
>     package/x11r7/xserver_xorg-server/Config.in:select BR2_PACKAGE_LIBSHA1 if
> (!BR2_PACKAGE_OPENSSL && !BR2_PACKAGE_LIBGCRYPT)
>
> We should fix that, I think...
>
> My proposal is that, unless a "better" backend is selected, we always
> fallback to openssl, in Kconfig at least.

 I disagree. openssl is big. So something like this, rather:

nettle < polarssl < openssl < gnutls < libgcrypt < libnss

(nettle has an LGPLv3 option, polarssl is only GPLv2, gnutls needs wchar, libnss
a lot more).

Oh, and libsha1 is a special case of course.

 So actually, the current situation is OK except for libssh{,2}.

 Regards,
 Arnout


>
> Then in the .mk, we can order the if-blocks to start with the prefered
> backend, in case more than one are enabled.
>
> Regards,
> Yann E. MORIN.
>
> > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> >
> >  Regards,
> >  Arnout
> >
> >> This also allows us to drop the propagated dependency on the arch
> >> condition.
> >>
> >> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >> Cc: Arnout Vandecappelle <arnout@mind.be>
> >> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> >> Cc: J?rg Krause <joerg.krause@embedded.rocks>
> >> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> >> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> >> Cc: Romain Naour <romain.naour@openwide.fr>
> >>
> >> ---
> >> Changes v1 -> v2:
> >>   - invert the selection to use openssl as a fallback  (Thomas)
> >>   - drop the arch dependency  (Thomas)
> >> ---
> >>  package/libssh/Config.in | 3 +--
> >>  package/libssh/libssh.mk | 4 ++--
> >>  2 files changed, 3 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/package/libssh/Config.in b/package/libssh/Config.in
> >> index 6029f45..3dbfa7d 100644
> >> --- a/package/libssh/Config.in
> >> +++ b/package/libssh/Config.in
> >> @@ -4,8 +4,7 @@ config BR2_PACKAGE_LIBSSH
> >>      depends on !BR2_STATIC_LIBS
> >>      depends on BR2_TOOLCHAIN_HAS_THREADS
> >>      # Either OpenSSL or libgcrypt are mandatory
> >> -    depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS &&
> !BR2_PACKAGE_OPENSSL # libgcrypt
> >> -    select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
> >> +    select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBGCRYPT
> >>      help
> >>        libssh is a multiplatform C library implementing the SSHv2
> >>        and SSHv1 protocol on client and server side. With libssh,
> >> diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
> >> index 29bbf4e..429e3c1 100644
> >> --- a/package/libssh/libssh.mk
> >> +++ b/package/libssh/libssh.mk
> >> @@ -23,14 +23,14 @@ else
> >>  LIBSSH_CONF_OPTS += -DWITH_ZLIB=OFF
> >>  endif
> >>  
> >> +# Dependency is either on libgcrypt or openssl, guaranteed in Config.in.
> >> +# Favour libgcrypt.
> >>  ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
> >>  LIBSSH_CONF_OPTS += -DWITH_GCRYPT=ON
> >>  LIBSSH_DEPENDENCIES += libgcrypt
> >>  else
> >>  LIBSSH_CONF_OPTS += -DWITH_GCRYPT=OFF
> >> -ifeq ($(BR2_PACKAGE_OPENSSL),y)
> >>  LIBSSH_DEPENDENCIES += openssl
> >>  endif
> >> -endif
> >>  
> >>  $(eval $(cmake-package))
> >>
> >
> > --
> > Arnout Vandecappelle                          arnout at mind be
> > Senior Embedded Software Architect            +32-16-286500
> > Essensium/Mind                                http://www.mind.be
> > G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> > LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> > GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>

-- 
Arnout Vandecappelle arnout at mind be
Senior Embedded Software Architect +32-16-286500
Essensium/Mind http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint: 7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
