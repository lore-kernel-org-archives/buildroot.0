From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Mar 2016 23:35:18 +0100
Subject: [Buildroot] [PATCH v2] putty: add new package
In-Reply-To: <1457861436-16499-1-git-send-email-post@lespocky.de> (Alexander
 Dahl's message of "Sun, 13 Mar 2016 10:30:36 +0100")
References: <1457861436-16499-1-git-send-email-post@lespocky.de>
Message-ID: <871t7cd6xl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexander" == Alexander Dahl <post@lespocky.de> writes:

 > Signed-off-by: Alexander Dahl <post@lespocky.de>
 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 > ---
 > This is the first patch in a series trying to get packages upstream
 > created for and used by fli4l [1], in some cases for a long time.

 > I start with putty, because it got a security update this week anyway.

 > v1 -> v2:
 >   - added a hint to help text which tools are built without GTK
 >   - removed weak md5 and sha1 hashes

 > [1] http://www.fli4l.de/
 > ---
 >  package/Config.in        |  1 +
 >  package/putty/Config.in  | 14 ++++++++++++++
 >  package/putty/putty.hash |  3 +++
 >  package/putty/putty.mk   | 22 ++++++++++++++++++++++
 >  4 files changed, 40 insertions(+)
 >  create mode 100644 package/putty/Config.in
 >  create mode 100644 package/putty/putty.hash
 >  create mode 100644 package/putty/putty.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index 35a24ba..2e00fbb 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -1465,6 +1465,7 @@ endif
 >  	source "package/ptpd/Config.in"
 >  	source "package/ptpd2/Config.in"
 >  	source "package/pure-ftpd/Config.in"
 > +	source "package/putty/Config.in"
 >  	source "package/quagga/Config.in"
 >  	source "package/radvd/Config.in"
 >  	source "package/rp-pppoe/Config.in"
 > diff --git a/package/putty/Config.in b/package/putty/Config.in
 > new file mode 100644
 > index 0000000..420a753
 > --- /dev/null
 > +++ b/package/putty/Config.in
 > @@ -0,0 +1,14 @@
 > +config BR2_PACKAGE_PUTTY
 > +	bool "putty"
 > +	depends on BR2_USE_MMU # fork()
 > +	depends on BR2_USE_WCHAR
 > +	help
 > +	  PuTTY is a free SSH and Telnet client. Without GTK2 activated,
 > +	  only the commandline tools plink, pscp, psftp, and puttygen are
 > +	  built; enable GTK2 for the graphical client.
 > +
 > +	  http://www.chiark.greenend.org.uk/~sgtatham/putty/
 > +
 > +comment "putty needs a toolchain w/ wchar"
 > +	depends on BR2_USE_MMU
 > +	depends on !BR2_USE_WCHAR

As far as I can see, all the code using wchar is only compiled when
built with --with-gtk (and libgtk2 already depends on wchar) - And a
quick test build with a minimal toolchain confirms this, so I've dropped
the wchar dependency here.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
