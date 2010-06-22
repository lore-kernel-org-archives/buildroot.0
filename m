From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 22 Jun 2010 16:41:56 +0200
Subject: [Buildroot] sdl demo app install problem
In-Reply-To: <0D753D10438DA54287A00B027084269763715D5D31@AUSP01VMBX24.collaborationhost.net>
	(H. Hartley Sweeten's message of "Mon, 21 Jun 2010 18:25:24 -0500")
References: <0D753D10438DA54287A00B027084269763715D5D31@AUSP01VMBX24.collaborationhost.net>
Message-ID: <87hbkv6sej.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "H" == H Hartley Sweeten <hartleys@visionengravers.com> writes:

 H> Hello all,
 H> I'm trying to create package for one of the SDL demo apps in order to
 H> verify that sdl is working on my i.MX35 system.  Here is my *.mk for it:


 H> #############################################################
 H> #
 H> # fire
 H> #
 H> #############################################################

 H> FIRE_VERSION:=1.0
 H> FIRE_SOURCE:=fire-$(FIRE_VERSION).tar.gz
 H> FIRE_SITE:=http://www.libsdl.org/projects/fire/src
 H> FIRE_INSTALL_TARGET:=YES
 H> FIRE_CONF_OPT:=--with-sdl-prefix=$(STAGING_DIR)/usr \
 H> 		--with-sdl-exec-prefix=$(STAGING_DIR)/usr

 H> FIRE_DEPENDENCIES:=sdl

 H> $(eval $(call AUTOTARGETS,package/customize,fire))


 H> BTW, I hijacked the package/customize directory to use for my non
 H> buildroot packages.  This has been working for other stuff so I don't
 H> think it's the problem.

 H> The package gets all the way thru the build stage but it dies
 H> during the install.  Following is the log of the install stage:


 >>>> fire 1.0 Installing to target
 H> /usr/bin/make -j2 DESTDIR=/home/bigguiness/extratech/buildroot/output/target  install-strip -C /home/bigguiness/extratech/buildroot/output/build/fire-1.0/
 H> make[1]: Entering directory `/home/bigguiness/extratech/buildroot/output/build/fire-1.0'
 H> /usr/bin/make  AM_INSTALL_PROGRAM_FLAGS=-s install
 H> make[2]: Entering directory `/home/bigguiness/extratech/buildroot/output/build/fire-1.0'
 H> make[3]: Entering directory `/home/bigguiness/extratech/buildroot/output/build/fire-1.0'
 H> /bin/sh ./mkinstalldirs /home/bigguiness/extratech/buildroot/output/target/usr/bin
 H> make[3]: Nothing to be done for `install-data-am'.
 H>   /usr/bin/install -c -s fire /home/bigguiness/extratech/buildroot/output/target/usr/bin/fire
 H> strip: Unable to recognise the format of the input file `/home/bigguiness/extratech/buildroot/output/target/usr/bin/fire'

install -s calls strip, and it most likely end up using your host strip
rather than your cross-strip.

-- 
Bye, Peter Korsgaard
