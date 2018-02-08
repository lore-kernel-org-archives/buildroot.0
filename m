From: Alex Baldwin <alexbaldwinmusic@gmail.com>
Date: Thu, 8 Feb 2018 18:00:31 +0100
Subject: [Buildroot] [PATCH 1/1] Bumping liblo from 0.26 to 0.29. C++
 wrappers for this lib started appearing in 0.28 so I think this is valid.
In-Reply-To: <4d63d250-e077-a04c-76c6-dbbbb170a9cc@mind.be>
References: <1518098606-2865-1-git-send-email-alexbaldwinmusic@gmail.com>
 <4d63d250-e077-a04c-76c6-dbbbb170a9cc@mind.be>
Message-ID: <CA+bRTvDcf+FuGZunyw5-fNKCXVRtJeswA7_9BgyzeqnYvzc5CA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the corrections Arnout, I will go about ammeding them for the
next patch submission.

As to :

LIBLO_CONF_OPTS += --disable-ipv6

I am doubtfull if this will work (i will try anyway!), there only seems to
be an option to enable ipv6. If this --enable-ipv6 is not provided then
liblo assumes you do not want it. Is there a way to remove options for a
specific package?

Alex

On 8 February 2018 at 17:45, Arnout Vandecappelle <arnout@mind.be> wrote:

>  Hi Alex,
>
>  Thanks for your contribution! Unfortunately it cannot be applied as is.
> Here
> are some comments.
>
>  First of all, the commit message should start with a single short summary
> line
> (the "Subject line"):
>
> liblo: bump version to 0.29
>
>  The sentence "C++ wrappers for this lib started appearing in 0.28 so I
> think
> this is valid." isn't appropriate for the commit message, especially since
> you
> make no changes relevant to this. Perhaps:
>
> "
> Starting from version 0.28, C++ wrappers are provided as well. The
> configure
> script appropriately detects the availability of a C++ compiler so no
> Buildroot
> changes are needed for this.
> "
>
>
> On 08-02-18 15:03, Alex B wrote:
> > From: Alex <alexbaldwinmusic@gmail.com>
> >
> > Package patch 0000-disableIPV6-config is needed to explicity disable
>                                                      explicitly
>
> > IPV6 support, this is actually recomeneded by the library developer but
>                                  recommended
>
> > for some reason the --enable-ipv6 still shows up. Without this the
>
>  Indeed, Buildroot will pass --enable-ipv6 to configure by default, since
> for
> almost all packages we do want to enable ipv6 support.
>
>  Patching the package is not the correct approach, however. Could you try
> to add
> the following to liblo.mk and see if that fixes the issue?
>
> LIBLO_CONF_OPTS += --disable-ipv6
>
> > package fails build.>
> > Included hash for license files.
> >
> > Signed-off-by: Alex <alexbaldwinmusic@gmail.com>
>
>  Your Signed-off-by line should have your full name
>
>
>
> > ---
> >  package/liblo/0000-disableIPV6-config.patch | 24
> ++++++++++++++++++++++++
> >  package/liblo/liblo.hash                    | 10 +++++++---
> >  package/liblo/liblo.mk                      |  2 +-
> >  3 files changed, 32 insertions(+), 4 deletions(-)
> >  create mode 100644 package/liblo/0000-disableIPV6-config.patch
> >
> > diff --git a/package/liblo/0000-disableIPV6-config.patch
> b/package/liblo/0000-disableIPV6-config.patch
> > new file mode 100644
> > index 0000000..cf3503c
> > --- /dev/null
> > +++ b/package/liblo/0000-disableIPV6-config.patch
> > @@ -0,0 +1,24 @@
> > +--- a/configure      2017-08-11 17:37:13.000000000 +0200
> > ++++ b/configure      2018-02-08 13:54:16.002048928 +0100
> > +@@ -3233,15 +3233,15 @@
> > +
> > + # disable support for ipv6.
> > + # Check whether --enable-ipv6 was given.
> > +-if test "${enable_ipv6+set}" = set; then :
> > +-  enableval=$enable_ipv6; want_ipv6=$enableval
> > +-fi
> > +-
> > +-if test "$want_ipv6" = "yes"; then
> > +-
> > +-$as_echo "#define ENABLE_IPV6 1" >>confdefs.h
> > +-
> > +-fi
> > ++# if test "${enable_ipv6+set}" = set; then :
> > ++#   enableval=$enable_ipv6; want_ipv6=$enableval
> > ++# fi
> > ++#
> > ++# if test "$want_ipv6" = "yes"; then
> > ++#
> > ++# $as_echo "#define ENABLE_IPV6 1" >>confdefs.h
> > ++#
> > ++# fi
> > diff --git a/package/liblo/liblo.hash b/package/liblo/liblo.hash
> > index a4e01a6..60fa5d6 100644
> > --- a/package/liblo/liblo.hash
> > +++ b/package/liblo/liblo.hash
> > @@ -1,3 +1,7 @@
> > -# From http://sourceforge.net/projects/liblo/files/liblo/0.26/
> > -sha1 21942c8f19e9829b5842cb85352f98c49dfbc823  liblo-0.26.tar.gz
> > -md5  5351de14262560e15e7f23865293b16f  liblo-0.26.tar.gz
> > +# From http://sourceforge.net/projects/liblo/files/liblo/0.29/
> > +sha1 6aa69456787d3d6ef915281b4a0f8f2c79548ce3  liblo-0.29.tar.gz
> > +md5  b0e70bc0fb2254addf94adddf85cffd3  liblo-0.29.tar.gz
> > +
> > +# Locally computed
> > +sha1    caeb68c46fa36651acf592771d09de7937926bb3  COPYING
> > +md5 fbc093901857fcd118f065f900982c24  COPYING
> > diff --git a/package/liblo/liblo.mk b/package/liblo/liblo.mk
> > index 3c852be..46f1ce5 100644
> > --- a/package/liblo/liblo.mk
> > +++ b/package/liblo/liblo.mk
> > @@ -4,7 +4,7 @@
> >  #
> >  ############################################################
> ####################
> >
> > -LIBLO_VERSION = 0.26
> > +LIBLO_VERSION = 0.29
> >  LIBLO_SITE = http://downloads.sourceforge.net/project/liblo/liblo/$(
> LIBLO_VERSION)
> >
> >  LIBLO_LICENSE = LGPL-2.1+
> > --
> > 2.7.4
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> >
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180208/32379ac4/attachment.html>
