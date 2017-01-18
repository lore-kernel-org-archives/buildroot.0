From: William Kennington <wak@google.com>
Date: Wed, 18 Jan 2017 18:59:52 +0000
Subject: [Buildroot] [PATCH v2 2/3] nanopb: new package
In-Reply-To: <20170115215140.GE4277@free.fr>
References: <20161209011313.9549-1-wak@google.com>
 <20170112191523.23814-1-wak@google.com>
 <20170112191523.23814-3-wak@google.com> <20170115215140.GE4277@free.fr>
Message-ID: <CAPnigKnhi5zGLWgNxF1NEqdEpvudB=kBFAS9EQ1zmLezLzQqYQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm working on cleaning up the nanopb build system as it previously didn't
install any of the protoc generator scripts so you always had to reference
the source directory if you were trying to invoke the protoc plugin. I've
incorporated all of your changes that make sense given the refactoring I'm
doing as nanopb will now be a cmake package. Once I get all of the changes
upstream I'll submit v3.

On Sun, Jan 15, 2017 at 1:51 PM Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> William, All,
>
> On 2017-01-12 11:15 -0800, William A. Kennington III spake thusly:
> > We chose not to use a stable version so that our version of nanopb
> > is compatible with pblog. In the future a stable version should be used.
>
> From this description, it looks like nanopb is only really usefull as a
> host tool. Yet, you also made it a target package. Is it intentional?
>
> If it is only a host tool that does not have a reason to be selected on
> its own, then do [**] below...
>
> > Signed-off-by: William A. Kennington III <wak@google.com>
> > ---
> >  package/Config.in          |  1 +
> >  package/nanopb/Config.in   |  8 ++++++++
> >  package/nanopb/nanopb.hash |  2 ++
> >  package/nanopb/nanopb.mk   | 25 +++++++++++++++++++++++++
> >  4 files changed, 36 insertions(+)
> >  create mode 100644 package/nanopb/Config.in
> >  create mode 100644 package/nanopb/nanopb.hash
> >  create mode 100644 package/nanopb/nanopb.mk
> >
> > diff --git a/package/Config.in b/package/Config.in
> > index 8c8c33ec3..625315c1c 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -1362,6 +1362,7 @@ endif
> >       source "package/msgpack/Config.in"
> >       source "package/mtdev2tuio/Config.in"
> >       source "package/musl-compat-headers/Config.in"
> > +     source "package/nanopb/Config.in"
>
> [**] Move that to package/Config.in/host
>
> >       source "package/openblas/Config.in"
> >       source "package/orc/Config.in"
> >       source "package/p11-kit/Config.in"
> > diff --git a/package/nanopb/Config.in b/package/nanopb/Config.in
> > new file mode 100644
> > index 000000000..4c5779f58
> > --- /dev/null
> > +++ b/package/nanopb/Config.in
> > @@ -0,0 +1,8 @@
> > +config BR2_PACKAGE_NANOPB
> > +     bool "nanopb"
> > +     help
> > +       Nanopb is a small code-size Protocol Buffers implementation in
> ansi C.
> > +       It is especially suitable for use in microcontrollers,
> > +       but fits any memory restricted system.
> > +
> > +       https://github.com/nanopb/nanopb
>
> [**] Don't give it a prompt; don't add help.
>
> > diff --git a/package/nanopb/nanopb.hash b/package/nanopb/nanopb.hash
> > new file mode 100644
> > index 000000000..0a9224777
> > --- /dev/null
> > +++ b/package/nanopb/nanopb.hash
> > @@ -0,0 +1,2 @@
> > +# Locally calculated
> > +sha256 d29305a235f9a58c95ffd999d258d7dd2c2cbb8b81312a4138dfe5802ff2c8e8
> nanopb-afdbca39edfaef58073f661d23300e1133c4e8af.tar.gz
> > diff --git a/package/nanopb/nanopb.mk b/package/nanopb/nanopb.mk
> > new file mode 100644
> > index 000000000..0e3d8cf55
> > --- /dev/null
> > +++ b/package/nanopb/nanopb.mk
> > @@ -0,0 +1,25 @@
> >
> +################################################################################
> > +#
> > +# nanopb
> > +#
> >
> +################################################################################
> > +
> > +NANOPB_VERSION = afdbca39edfaef58073f661d23300e1133c4e8af
> > +NANOPB_SITE = $(call github,nanopb,nanopb,$(NANOPB_VERSION))
> > +NANOPB_LICENSE = BSD-3c
> > +NANOPB_LICENSE_FILES = LICENSE.txt
> > +
> > +NANOPB_DEPENDENCIES = protobuf python-protobuf
> > +
> > +define HOST_NANOPB_BUILD_CMDS
> > +     $(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C
> $(@D)/generator/proto
> > +endef
> > +
> > +define NANOPB_BUILD_CMDS
> > +     $(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C
> $(@D)/generator/proto
> > +endef
> > +
> > +# We don't actually need to install anything as you include the library
> files
> > +# directly.
>
> Well, this is not clear at all.
>
> We do want packages to install their devel files in staging/ (for target
> packages) or in host/ (for host package).
>
> However, looking at the pblog package (next patch), it looks like pblog
> does not have a way to use instaleld files from nanopb... Sigh...
>
> What about this comment instead:
>
>     # The only user of host-nanopb is pblog, which can only use nanopb
>     # files from its build directory. So there is nothing to install.
>
> .. and then in pblog itself:
>
>     # pblog can not use installed files from nanopb; it really wants to
>     # use those from the build directory of nanopb. So we point it there.
>
> Yet, that is still a bit ugly... :-(
>
> Since you're the author of pblog, you may iwant to fix it to be able to
> use files the standard way (i.e. see of the toolchain can find them,
> like any other header/lib) and only revert to use a non-installed
> version as a last resort? ;-)
>
> > +$(eval $(host-generic-package))
> > +$(eval $(generic-package))
>
> If the target variant is really required, then this should be reversed.
>
> Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170118/ee3500b8/attachment.html>
