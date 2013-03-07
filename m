From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Mar 2013 09:30:24 +0100
Subject: [Buildroot] Problem with buildroot-2013.02 - emacs
In-Reply-To: <84EA0F7435E5F64C9B660453645DB90497AD4DEF0D@DSW350.wattens.swarovski.com>
References: <84EA0F7435E5F64C9B660453645DB90497AD4DEF0D@DSW350.wattens.swarovski.com>
Message-ID: <20130307093024.30cb7d23@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spielmann Werner,

On Wed, 6 Mar 2013 12:43:20 +0100, Spielmann Werner wrote:

> I'm a Newbie at buildroot and when I start my first trial to build a
> system with buildroot-2013.02 I run into troubles.
> 
> A few problems I was moving around and so  "make source" worked!
> 
> When I use "make" the script works for a short time, then an editor
> window is opened - I don't know  what to do.  :-(

Which editor opens up? I kind of believe the only way to get the issue
you have is that /usr/bin/emacs exists, but doesn't point to Emacs, but
to some other text editor.

> The process of the editor shown by "ps" is:
> emacs -batch -q -l script -f batch-byte-compile autoconf-mode.el
> autotest-mode.el
> 
> The status line of the editor shows (typed manual, couldn't copy):
> 
> Jove (Text)  [Main:1]  "[No file]" - <my_workspace>/buildroot-2013.02/

And this gets clear now: you don't have Emacs installed, but you have
Jove (http://en.wikipedia.org/wiki/JOVE). The thing is that Jove is
pretending to be compatible with Emacs, but it's not, so it makes the
autoconf stuff think there is Emacs, even though Emacs is not here.

As a workaround, you can apply this patch:

diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 0c36b66..daac1f2 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -15,7 +15,7 @@ AUTOCONF_CONF_ENV = EMACS="no" ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
 
 AUTOCONF_DEPENDENCIES = host-m4 perl
 
-HOST_AUTOCONF_CONF_ENV = ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
+HOST_AUTOCONF_CONF_ENV = EMACS="no" ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
                        ac_cv_prog_gnu_m4_gnu=no
 
 HOST_AUTOCONF_DEPENDENCIES = host-m4 host-libtool

-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
