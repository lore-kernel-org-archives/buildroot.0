From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 9 Oct 2016 16:32:49 +0200
Subject: [Buildroot] [PATCH v2 1/3] gdb: get rid of host-texinfo
 dependency
In-Reply-To: <CAAXf6LXFxtsSONURriXdwWj2q03pK01yQ8_FrUfunTJuMOCsHQ@mail.gmail.com>
References: <1475953413-1950-1-git-send-email-patrickdepinguin@gmail.com>
 <20161009135552.5dd553fe@free-electrons.com>
 <20161009150451.404e6641@free-electrons.com>
 <CAAXf6LXFxtsSONURriXdwWj2q03pK01yQ8_FrUfunTJuMOCsHQ@mail.gmail.com>
Message-ID: <20161009143249.GQ2052@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas De Schampheleire wrote,

> On Oct 9, 2016 15:05, "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> wrote:
> >
> > Hello,
> >
> > On Sun, 9 Oct 2016 13:55:52 +0200, Thomas Petazzoni wrote:
> >
> > > All three patches applied to master. Thanks!
> >
> > And I reverted the texinfo patch and the binutils patch. The binutils
> > patch badly breaks the build of the toolchain. See:
> >
> > ? http://autobuild.buildroot.net/results/90d/
> 90d0537bc12cbb2a7c6d344b3c6c9e1a5046d791/build-end.log
> > ? http://autobuild.buildroot.net/results/9a2/
> 9a2b30bfd08c3a4af43f0523276eb5f799699aaa/build-end.log
> > ? http://autobuild.buildroot.net/results/d8a/
> d8a4afeeec8d6b070b17a067d0ded5aefe4e3f6a/build-end.log
> >
> > Please do a toolchain build before sending the next iterations of the
> > patches. A basic ARM toolchain would not even build with your
> > patches :-/
> 
> Will check, sorry...

Binutils isn't installed into output/host.
May be try something like this:
diff --git a/package/binutils/binutils.mk
b/package/binutils/binutils.mk
index 4e87fcb..8aa3fc7 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -59,10 +59,8 @@ endif
 # and sometimes needs specific makeinfo versions to work
 BINUTILS_CONF_ENV += MAKEINFO=true
 BINUTILS_MAKE_OPTS += MAKEINFO=true
-BINUTILS_INSTALL_TARGET_OPTS += MAKEINFO=true
 HOST_BINUTILS_CONF_ENV += MAKEINFO=true
 HOST_BINUTILS_MAKE_OPTS += MAKEINFO=true
-HOST_BINUTILS_INSTALL_OPTS += MAKEINFO=true
 
 # gcc bug with Os/O2/O3, PR77311
 # error: unable to find a register to spill in class 'CCREGS'

It seem binutils get confused and just do true make install...

best regards
 Waldemar
