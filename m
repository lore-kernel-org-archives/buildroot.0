From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 05 Jun 2010 21:20:01 +0200
Subject: [Buildroot] make xconfig on Fedora 13 and buildroot-2010.05
In-Reply-To: <AANLkTinF5cJ0T_ALpJN6uqlj9-E2fIjzLqYH0pcxWan0@mail.gmail.com>
	(Chris Kerios's message of "Sat, 5 Jun 2010 07:10:09 -0400")
References: <AANLkTinF5cJ0T_ALpJN6uqlj9-E2fIjzLqYH0pcxWan0@mail.gmail.com>
Message-ID: <87vd9xnv6m.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chris" == Chris Kerios <ckerios@gmail.com> writes:

 Chris> Hey guys,

 Chris> I just upgraded my laptop to Fedora 13 and ran into a problem with the
 Chris> make configurator.  I have all the QT3 and libstdc++ compatibility
 Chris> libraries installed.  Anyone else run into this yet?  Works fine on my
 Chris> Fedora 12 box.

I cannot reproduce it here, but I did see that we are doing something
odd for xconfig (E.G. doing the linking step with gcc instead of
g++). I've just committed a cleanup of it to git. Could you give it a
try to see if it fixes your issue?

commit e0197d64b5c598534b8f805174ef312398a0c48b
Author: Peter Korsgaard <jacmet@sunsite.dk>
Date:   Sat Jun 5 20:46:55 2010 +0200

    kconfig: fix qconf (make xconfig) linking
    
    qconf is written in C++, so use HOSTCXX instead of HOSTCC, and pass the
    correct flags.
    
    Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

diff --git a/package/config/Makefile b/package/config/Makefile
index a2184fa..66b54cd 100644
--- a/package/config/Makefile
+++ b/package/config/Makefile
@@ -26,7 +26,7 @@ $(host-cmulti): %: $(host-cobjs) $(host-cshlib)
        $(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) $($@-objs) $(HOST_LOADLIBES) -o $@
 
 $(host-cxxmulti): %: $(host-cxxobjs) $(host-cobjs) $(host-cshlib)
-       $(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) $($@-objs) $($@-cxxobjs) $(HOSTLOADLIBES_$@) -o $@
+       $(HOSTCXX) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCXXFLAGS_$@) $($@-objs) $($@-cxxobjs) $(HOSTLOADLIBES_$@) -o $@
 
 $(host-cobjs): %.o: %.c
        $(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) -c $< -o $@

-- 
Bye, Peter Korsgaard
