From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Feb 2014 15:41:16 +0100
Subject: [Buildroot] [PATCH] package/joe: Add package for the JOE editor
In-Reply-To: <1391301769-28263-1-git-send-email-alan@signal11.us> (Alan Ott's
 message of "Sat, 1 Feb 2014 19:42:49 -0500")
References: <1391301769-28263-1-git-send-email-alan@signal11.us>
Message-ID: <878uttr303.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alan" == Alan Ott <alan@signal11.us> writes:

 > JOE is an easy-to-use, full-screen, terminal-based text editor.
 > http://joe-editor.sf.net

Thanks, see below for a few comments.


 > Signed-off-by: Alan Ott <alan@signal11.us>
 > ---
 >  package/joe/Config.in | 20 ++++++++++++++++++++
 >  package/joe/joe.mk    | 22 ++++++++++++++++++++++

You forgot to add it to package/Config.in


 >  2 files changed, 42 insertions(+)
 >  create mode 100644 package/joe/Config.in
 >  create mode 100644 package/joe/joe.mk

 > diff --git a/package/joe/Config.in b/package/joe/Config.in
 > new file mode 100644
 > index 0000000..e15b0f2
 > --- /dev/null
 > +++ b/package/joe/Config.in
 > @@ -0,0 +1,20 @@
 > +config BR2_PACKAGE_JOE
 > +	bool "joe"
 > +	help
 > +	  Joe's Own Editor
 > +
 > +	  JOE is an easy-to-use, full featured terminal-based screen editor.
 > +	  Its behavior is a blending of WordStar and GNU-EMACS (but it does
 > +	  not use code from either program).  It is a great editor for new
 > +	  users or as an alternative to vi.
 > +
 > +	  http://joe-editor.sf.net
 > +
 > +config BR2_PACKAGE_JOE_FULL
 > +	bool "full install of rc and syntax highlighting files"
 > +	depends on BR2_PACKAGE_JOE
 > +	default y
 > +	help
 > +	  Install all rc and syntax highlighting files. Without this option
 > +	  only the joe binary is installed, which contains a default
 > +	  configuration.
 > diff --git a/package/joe/joe.mk b/package/joe/joe.mk
 > new file mode 100644
 > index 0000000..9725dc7
 > --- /dev/null
 > +++ b/package/joe/joe.mk
 > @@ -0,0 +1,22 @@
 > +################################################################################
 > +#
 > +# joe - Joe's Own Editor

We normally only have the package name here.

 > +#
 > +################################################################################
 > +
 > +JOE_VERSION = 3.7
 > +JOE_SITE = http://downloads.sourceforge.net/project/joe-editor/JOE%20sources/joe-$(JOE_VERSION)
 > +JOE_LICENSE = GPLv1+
 > +JOE_LICENSE_FILES = COPYING
 > +JOE_MAKE_ENV =
 > +JOE_CONF_OPT = --disable-curses
 > +JOE_CONF_ENV =
 > +JOE_DEPENDENCIES =

undefined variables in make expands to nothing, so you can drop these.

We do have ncurses in buildroot, so it should enable support for it if
ncurses is enabled.


I did a test build for uClibc and I see it uses the XSI math bessel
functions which are not enabled for default, so I added a patch to
disable those if needed.

Committed with these issues fixed, thanks.

-- 
Bye, Peter Korsgaard
