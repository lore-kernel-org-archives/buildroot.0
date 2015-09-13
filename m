From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Sep 2015 22:49:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/valgrind: disable for
	static-only builds
In-Reply-To: <1441738339-2011-1-git-send-email-brendanheading@gmail.com>
 (Brendan Heading's message of "Tue, 8 Sep 2015 19:52:19 +0100")
References: <1441738339-2011-1-git-send-email-brendanheading@gmail.com>
Message-ID: <87si6iavta.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Brendan" == Brendan Heading <brendanheading@gmail.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/3b6/3b6f253f30afaee428ea0fc559be210dcec61dae
 > http://autobuild.buildroot.net/results/60e/60e5a49360e2ee9482b4d548789f874a6502c429
 > http://autobuild.buildroot.net/results/5cc/5ccc2e48fa4deb90ab214c82e8921ec494555457
 > http://autobuild.buildroot.net/results/452/4524184b407bb6f9b55f8f85c8e0b475ff105420

 > Valgrind ordinarily works by preloading a shared object to replace malloc,
 > free and friends. Some combinations of toolchain/libc allow this to build
 > with -static, but others complain.

 > Since it makes little sense to try to build this on a static-only system,
 > this patch disables it on static platforms entirely.

 > Signed-off-by: Brendan Heading <brendanheading@gmail.com>
 > ---
 > v1 - theoretically we could try to support valgrind static builds on
 > platforms where it appears to work (eg i686). However this would add a lot
 > of conditional stuff, so I figured it would be easier just to disable it
 > outright.
 > ---
 >  package/valgrind/Config.in | 4 ++++
 >  1 file changed, 4 insertions(+)

 > diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
 > index 8da007b..5635ada 100644
 > --- a/package/valgrind/Config.in
 > +++ b/package/valgrind/Config.in
 > @@ -4,11 +4,15 @@ config BR2_PACKAGE_VALGRIND
 >  		   BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
 >  		   BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
 >  		   BR2_x86_64
 > +	depends on !BR2_STATIC_LIBS
 >  	help
 >  	  Tool for debugging and profiling Linux programs.
 
 >  	  http://valgrind.org/
 
 > +comment "valgrind needs a toolchain w/ dynamic library"
 > +	depends on BR2_STATIC_LIBS
 > +

If the comment is placed here then menuconfig no longer thinks the
suboptions should be indented under valgrind, so comments should always
go all the way at the top or the bottom of the file.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
