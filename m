From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 26 Sep 2014 21:11:26 +0200
Subject: [Buildroot] [PATCH 1/1] ympd: new package (version 2)
In-Reply-To: <1411504369-15582-1-git-send-email-limpens@gmail.com> (Eric
 Limpens's message of "Tue, 23 Sep 2014 22:32:49 +0200")
References: <1411504369-15582-1-git-send-email-limpens@gmail.com>
Message-ID: <87tx3uxkm9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric Limpens <limpens@gmail.com> writes:

 > Signed-off-by: Eric Limpens <limpens@gmail.com>
 > ---
 >  package/Config.in                                       |  1 +
 >  package/ympd/Config.in                                  | 10 ++++++++++
 >  package/ympd/ympd-0001-CMake-cross-compile-mkdata.patch | 16 ++++++++++++++++
 >  package/ympd/ympd.mk                                    | 16 ++++++++++++++++
 >  4 files changed, 43 insertions(+)
 >  create mode 100644 package/ympd/Config.in
 >  create mode 100644 package/ympd/ympd-0001-CMake-cross-compile-mkdata.patch
 >  create mode 100644 package/ympd/ympd.mk

 > +++ b/package/ympd/ympd-0001-CMake-cross-compile-mkdata.patch
 > @@ -0,0 +1,16 @@
 > +CMakeLists.txt: make it cross-compile friendly. Upstream is looking into a proper solution. 
 > +
 > +Signed-Off-by: Eric Limpens <Limpens@Gmail.com>
 > +
 > +--- ympd-a98d760dddff4b0dd595d977c9077f34beff05c5/CMakeLists.txt	2014-05-24 15:25:47.000000000 +0200
 > ++++ ympd-a98d760dddff4b0dd595d977c9077f34beff05c5-1/CMakeLists.txt	2014-09-23 20:04:55.491997850 +0200
 > +@@ -29,6 +29,7 @@
 > + )
 > + 
 > +-add_executable(mkdata htdocs/mkdata.c)
 > +-get_target_property(MKDATA_EXE mkdata LOCATION)
 > ++#add_executable(mkdata htdocs/mkdata.c)
 > ++#get_target_property(MKDATA_EXE mkdata LOCATION)
 > ++set(MKDATA_EXE "./mkdata")


It seems like you missed Samuels' feedback?

 > + 
 > + add_custom_command(OUTPUT ${PROJECT_BINARY_DIR}/assets.c
 > diff --git a/package/ympd/ympd.mk b/package/ympd/ympd.mk
 > new file mode 100644
 > index 0000000..33fd4ec
 > --- /dev/null
 > +++ b/package/ympd/ympd.mk
 > @@ -0,0 +1,16 @@
 > +################################################################################
 > +#
 > +# ympd
 > +#
 > +################################################################################
 > +
 > +YMPD_VERSION = a98d760dddff4b0dd595d977c9077f34beff05c5
 > +YMPD_SITE = $(call github,notandy,ympd,$(YMPD_VERSION))

What about license?

You need to add MPD_DEPENDENCIES = libmpdclient to ensure libmpdclient
gets built before ympd.

-- 
Bye, Peter Korsgaard
