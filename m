From: Spielmann Werner <Werner.Spielmann@SWAROVSKI.COM>
Date: Thu, 7 Mar 2013 13:47:39 +0100
Subject: [Buildroot] Problem with buildroot-2013.02 - emacs
In-Reply-To: <20130307093024.30cb7d23@skate>
References: <84EA0F7435E5F64C9B660453645DB90497AD4DEF0D@DSW350.wattens.swarovski.com>
 <20130307093024.30cb7d23@skate>
Message-ID: <84EA0F7435E5F64C9B660453645DB90497AD52A6B0@DSW350.wattens.swarovski.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Many thanks for your explanation. You are right, emacs was not really installed. There were only Links:

  /usr/bin/emacs -> /etc/alternatives/emacs
  /etc/alternatives/emacs -> /usr/bin/jove

=> strange!

The Patch didn't work at the first attempt, as far as I can see the line numbers of autoconf.mk do not match (I have installed the buildroot-2013.02 from the download directory - perhaps do you use newer versions from the repository?).
So I installed emacs - seemed to be the fastest solution!  ;-)

Now the build process has gone on...

Your help was very nice and very helpful! Thank you very much!

Werner

-----Original Message-----
From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
Sent: Thursday, March 07, 2013 9:30 AM
To: Spielmann Werner
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] Problem with buildroot-2013.02 - emacs

Dear Spielmann Werner,

On Wed, 6 Mar 2013 12:43:20 +0100, Spielmann Werner wrote:

> I'm a Newbie at buildroot and when I start my first trial to build a 
> system with buildroot-2013.02 I run into troubles.
> 
> A few problems I was moving around and so  "make source" worked!
> 
> When I use "make" the script works for a short time, then an editor 
> window is opened - I don't know  what to do.  :-(

Which editor opens up? I kind of believe the only way to get the issue you have is that /usr/bin/emacs exists, but doesn't point to Emacs, but to some other text editor.

> The process of the editor shown by "ps" is:
> emacs -batch -q -l script -f batch-byte-compile autoconf-mode.el 
> autotest-mode.el
> 
> The status line of the editor shows (typed manual, couldn't copy):
> 
> Jove (Text)  [Main:1]  "[No file]" - <my_workspace>/buildroot-2013.02/

And this gets clear now: you don't have Emacs installed, but you have Jove (http://en.wikipedia.org/wiki/JOVE). The thing is that Jove is pretending to be compatible with Emacs, but it's not, so it makes the autoconf stuff think there is Emacs, even though Emacs is not here.

As a workaround, you can apply this patch:

diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk index 0c36b66..daac1f2 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -15,7 +15,7 @@ AUTOCONF_CONF_ENV = EMACS="no" ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
 
 AUTOCONF_DEPENDENCIES = host-m4 perl
 
-HOST_AUTOCONF_CONF_ENV = ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
+HOST_AUTOCONF_CONF_ENV = EMACS="no" 
+ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
                        ac_cv_prog_gnu_m4_gnu=no
 
 HOST_AUTOCONF_DEPENDENCIES = host-m4 host-libtool

--
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux development, consulting, training and support.
http://free-electrons.com
