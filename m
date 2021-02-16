From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Feb 2021 09:27:20 +0100
Subject: [Buildroot] [git commit] package/ply: needs dynamic library
In-Reply-To: <875z2sa0k0.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Tue, 16 Feb 2021 09:17:51 +0100")
References: <20210213211246.51E7D8157B@busybox.osuosl.org>
 <875z2sa0k0.fsf@dell.be.48ers.dk>
Message-ID: <871rdga047.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
 >> commit: https://git.buildroot.net/buildroot/commit/?id=debe9eb13ebd8b8d5596832030ec61032bdc99b3
 >> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 >> ply builds and installs a library. Some objects that go in that library
 >> are tagged with a 'section' attribute (excerpt):

 >> __attribute__((section("providers")))

 >> Later on, it references the bounds of that section, with the canonical
 >> __start and __stop markers, which will eventually be created by the
 >> linker:

 >> extern struct provider __start_providers;
 >> extern struct provider __stop_providers;

 >> Sections only exists in an ELF file, and a static library id not an ELF.
 >> So, when creating a static library, the markers are not created. Thus,
 >> when linking the final executable, the link fails because of missing
 >> symbols:

 >> .../powerpc-buildroot-linux-uclibc/bin/ld: ../libply/.libs/libply.a(libply_la-provider.o): in function `provider_get':
 >> provider.c:(.text+0xe): undefined reference to `__start_providers'
 >> .../powerpc-buildroot-linux-uclibc/bin/ld: provider.c:(.text+0x12): undefined reference to `__stop_providers'
 >> .../powerpc-buildroot-linux-uclibc/bin/ld: provider.c:(.text+0x2a): undefined reference to `__start_providers'
 >> .../powerpc-buildroot-linux-uclibc/bin/ld: provider.c:(.text+0x32): undefined reference to `__stop_providers'

 >> So, conceptually, ply can not build in static-only.

 >> Fixes:
 >> - http://autobuild.buildroot.net/results/3a586241d37614b644ff6c4674ae28df2b22fdf8

 > Is that true? Aren't those symbols created by the linker when the final
 > application is linked? If not, how does custom sections work with U-Boot
 > and the Linux kernel that also do static linking?

 > Hacking a bit around, I see that linking does work if I explicitly pass
 > the libply/provider/*.o files to the linker and not just the .a
 > file.

 > Perhaps it is because nothing directly references those symbols, so the
 > linker thinks it can drop them? Maybe it just needs to be told not to do that?

Looking further, it looks like you really need to explicitly reference
those symbols to get them pulled in:

https://stackoverflow.com/questions/46794422/how-do-i-propagate-unused-symbols-and-sections-across-static-libraries

Anyway, just doing dynamic linking is fine for 2021.02.

-- 
Bye, Peter Korsgaard
