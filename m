From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 12 May 2012 22:07:16 +0200
Subject: [Buildroot] [PATCH] gnutls: Fix search path for libgcrypt
In-Reply-To: <20120512210755.672039a4@skate>
References: <1336847275-21899-1-git-send-email-arnout@mind.be>
 <20120512210755.672039a4@skate>
Message-ID: <4FAEC2F4.1060802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/12/12 21:07, Thomas Petazzoni wrote:
> Le Sat, 12 May 2012 20:27:55 +0200,
> "Arnout Vandecappelle (Essensium/Mind)"<arnout@mind.be>  a ?crit :
>
>> >  In some configurations, the --with-libgcrypt-prefix configure option
>> >  causes the default library search path to be disabled completely,
>> >  so the compiler can't find libc etc.
>> >  
>> >  Fixeshttp://autobuild.buildroot.net/results/52a227e8a8723b7914a37d9b3519da5fd2a2844a/
>> >  
>> >  Signed-off-by: Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>
> Are you sure it fixes the problem?
  Alas, no.  I built it and it failed.  Then I patched it, rebuilt it and it worked.
I guess make decided to reorder things for whatever reason.

> Last WE, I started investigating the problem, and found out that just
> compiling gnutls wasn't enough to reproduce the problem. The problem
> was starting to occur when libintl was built before libgcrypt. In this
> case, libgcrypt.la had -lintl in its dependencies, and in turn,
> libintl.la had -lc in its dependencies. Then, libtool expands this -lc
> into the full path to libc.so.
  After the patch, that doesn't seem to make a difference for me.
I did the following after a successful build:
make libgcrypt-dirclean gnutls-dirclean; make

  That succeeded.  Then I did
rm -f {staging,target}/{usr/,}lib/*intl*
rm -rf build/gettext*
make libgpg-error-dirclean libgcrypt-dirclean gnutls-dirclean
make gnutls; make

  That still succeeded.  (It looks like libgpg-error is missing a
dependency on gettext/libintl, though.)  And finally, just to
be sure:
rm -f {staging,target}/{usr/,}lib/*intl*
rm -rf build/gettext*
make libgpg-error-dirclean libgcrypt-dirclean gnutls-dirclean
make libintl; make

  Also succeeded. That pretty much covers the libintl dependency,
right?

  This is BTW from one of the broken configs reported in the
autobuild, from which I also had to remove some more broken
packages (ltp-testsuite, ndisc6).  It's a generic powerpc internal
toolchain.


>
> However, libc.so is a linker script which contains a reference
> to /lib/libc.so.0. And unfortunately, there is a binutils bug that
> makes it behave differently:
>
>   * If a linker script is referenced using -lc, then it correctly
>     prepends the paths in the linker script by the sysroot path;
>
>   * If a linker script is referenced using its full path (as is done by
>     libtool), then binutils do not prepend the paths in the linker
>     script by the sysroot path, which leads the gnutls ./configure to
>     try to link against /lib/libc.so.0, which obviously doesn't exist.
>
> Gustavo has patches for binutils that solve this bug, but the problem
> remains for external toolchains. I am not sure how to fix the problem
> properly.
  A heavy-handed approach would be to generate the patched
binutils for known-to-be-faulty external toolchains.

  A simple approach would be to use the patched binutils on the test
machines :-)

  BTW, how come this problem doesn't manifest itself more often?
There are many packages with -lintl in their .la dependencies, so all
of them should fail regularly, no?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
