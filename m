From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Feb 2020 20:03:27 +0100
Subject: [Buildroot] [PATCH] package/sdl_mixer: fix build after aclocal
 include revamp
In-Reply-To: <20200208182611.16087-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sat, 8 Feb 2020 19:26:11 +0100")
References: <20200208182611.16087-1-yann.morin.1998@free.fr>
Message-ID: <875zggvr40.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > After d255b67972 (autotools: do not overwrite first include path), the
 > ordering of include paths has changed: the system directories are
 > specified with explicit options passed to autoreconf, which means that
 > any directory specified in the package _AUTORECONF_OPTS are no longer
 > first:

 >   - in package/autoconf/autoconf.mk, we define AUTORECONF as:
 >     AUTOCONF = $(HOST_DIR)/bin/autoconf -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"

 >   - in package/pkg-autotools.mk, we call AUTORECONF with:
 >     $($(PKG)_AUTORECONF_ENV) $(AUTORECONF) $($(PKG)_AUTORECONF_OPTS)

 > So, the include directory specified by SDL_MIXER_AUTORECONF_OPTS is now
 > lagging behind the system headers, and the very issue that d255b67972
 > was suposed to fix in a generic way, pops up back for this specific
 > case.

 > We fix that by patching sdl_mixer so that it uses the bog-down standard
 > mechanisms, to specify the macro directory from within configure.in,
 > instead of specifying it on the command line, so that the magic
 > introduced by d255b67972 does happen.

 > Reported-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Michael Walle <michael@walle.cc>
 > ---
 >  .../0004-configure__set_macro_directory.patch | 34 +++++++++++++++++++
 >  package/sdl_mixer/sdl_mixer.mk                |  1 -
 >  2 files changed, 34 insertions(+), 1 deletion(-)
 >  create mode 100644 package/sdl_mixer/0004-configure__set_macro_directory.patch

 > diff --git a/package/sdl_mixer/0004-configure__set_macro_directory.patch b/package/sdl_mixer/0004-configure__set_macro_directory.patch
 > new file mode 100644
 > index 0000000000..32089efe8f
 > --- /dev/null
 > +++ b/package/sdl_mixer/0004-configure__set_macro_directory.patch
 > @@ -0,0 +1,34 @@
 > +# HG changeset patch
 > +# User "Yann E. MORIN" <yann.morin.1998@free.fr>
 > +# Date 1581183281 -3600
 > +#      Sat Feb 08 18:34:41 2020 +0100
 > +# Node ID 753a1f394620056c35790a571ff5f7c248445943
 > +# Parent  eb5f08bf9994bf5164ca68015f2e030c2c9dddcd
 > +configure: set macro directory
 > +
 > +Setting the macro directory in configure.in, rather than sepcifying it

specifying

Committed, thanks.

Most likely we also need to fix a number of other packages:

git grep '_AUTORECONF_OPTS ='
package/asterisk/asterisk.mk:ASTERISK_AUTORECONF_OPTS = -Iautoconf -Ithird-party -Ithird-party/pjproject -Ithird-party/jansson
package/gstreamer/gst-plugin-x170/gst-plugin-x170.mk:GST_PLUGIN_X170_AUTORECONF_OPTS = -Im4/
package/log4cpp/log4cpp.mk:LOG4CPP_AUTORECONF_OPTS = -I m4
package/sdbusplus/sdbusplus.mk:SDBUSPLUS_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive

-- 
Bye, Peter Korsgaard
