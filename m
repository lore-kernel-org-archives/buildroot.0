From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 10 Jun 2021 16:21:03 +0300
Subject: [Buildroot] [PATCH 1/1] package/libsoup: always disable
 tls_check
In-Reply-To: <CAPi7W82QYMwJGjfKJ0c-gqw8gvPLBEBUpEwMrD4FX4OVHEvNuQ@mail.gmail.com>
References: <20210609212503.1580411-1-fontaine.fabrice@gmail.com>
 <20210610063627.GD135851@momiji>
 <CAPi7W82QYMwJGjfKJ0c-gqw8gvPLBEBUpEwMrD4FX4OVHEvNuQ@mail.gmail.com>
Message-ID: <20210610162103.GB319559@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 10 Jun 2021 07:34:40 +0200 Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> Hi,
> 
> Le jeu. 10 juin 2021 ? 05:36, Adrian Perez de Castro
> <aperez@igalia.com> a ?crit :
> >
> > Hi,
> >
> > On Wed, 09 Jun 2021 23:25:03 +0200 Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> > > Always disable tls_check to avoid the following build failure since bump to
> > > version 2.72.0 in commit 8e5f7f1cfc8fd7a9d5270f6a9707eb9eecfd21da:
> > >
> > > ../output-1/build/libsoup-2.72.0/meson.build:184:4: ERROR: Can not run test applications in this cross environment.
> > >
> > > tls_check will run code since
> > > https://gitlab.gnome.org/GNOME/libsoup/-/commit/5c45253243a2deca4880d4f614f2932373445cf9
> >
> > I wonder how this check passed locally when doing test builds of the update
> > before submitting the patch (I did a few cross-builds targeting 64-bit ARM)
> > ?\_(?)_/?
>
> I assume that BR2_PACKAGE_LIBSOUP_SSL was not set in your tests.
> However, I'm now wondering if we should also drop BR2_PACKAGE_LIBSOUP_SSL.
> From my understanding, glib-networking is a runtime dependency that
> was only needed at compile-time to pass tls_check.

I still had the ?.config? file around... You are right actually, I did not
have BR2_PACKAGE_LIBSOUP_SSL enabled. My bad.

It is true that glib-networking is a pure runtime dependency, and not even
needed at build time at all, except for the sanity check that can be turned
off with -Dtls_check=false. The actual GTlsConnection types are defined in
GLib itself, but to avoid linking any particular TLS implementation (which
might result in accidental license incompatibilities) the actual
implementation is inside glib-networking, which is a plug-in for GLib.
Currently it's possible to build glib-networking against both GnuTLS and
OpenSSL, but the latter is newer and less battle tested, which is the reason
why I have not yet sent a patch to allow building against OpenSSL ;-)

I do not have much of an opinion about removing BR2_PACKAGE_LIBSOUP_SSL;
probably it's fine to remove the check for it in ?libsoup.mk?, but I would
still leave the option in ?Config.in? to make sure that glib-networking will
be built and installed. Otherwise I am afraid that we may get people reporting
that TLS does not work with GLib sockets, and it will turned out that they
forgot to enable building glib-networking.

How does the above approach sound?

Cheers,
-Adrian

-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210610/ad18576d/attachment.asc>
