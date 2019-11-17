From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 17 Nov 2019 14:45:13 +0100
Subject: [Buildroot] SDL2 depends on shared libraries,
 but Config.in depends on BR2_STATIC_LIBS ?
In-Reply-To: <20191117133755.GB13372@coltrane>
References: <20191117133755.GB13372@coltrane>
Message-ID: <2ca350a6-134b-6149-dd4f-e7cbd790e115@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17/11/2019 14:37, Koen Martens wrote:
> Hi,
> 
> I'm updating linuxconsoletools. However, I'm running into issues
> with test-pkg. There is an optional binary for force-feedback 
> testing that requires SDL2.
> 
> SDL2 seems to require shared library support (in that it includes
> dlfcn.h somewhere along the line), however this is not declared
> in package/sdl2/Config.in.

 Yes it is, line 3 of this file has:

depends on !BR2_STATIC_LIBS

(not static means dynamic. It's put that way because it covers both the SHARED
and the STATIC_SHARED options.)

> In fact, there is an odd comment 
> at the bottom of that file:
> 
> comment "sdl2 needs a toolchain w/ dynamic library"
>     depends on BR2_STATIC_LIBS
> 
> Isn't it contradictory to say 'needs dynamic library' but then depend
> on BR2_STATIC_LIBS??

 The *comment* is only shown when you don't have dynamic library support. The
early condition hides the package completely in menuconfig when dynamic library
is not available, so it would look as if Buildroot doesn't have this package.
That's why we add the comment (and to make it easy for people to see what htey
need to change in the toolchain to have support for it).


> As a work-around, in my linuxconsoletools Config.in i've added
> 'depends on BR2_SHARED_LIBS' to prevent the build failures

 You should add this dependency to BR2_PACKAGE_LINUXCONSOLETOOLS_FORCEFEEDBACK
only, and you should make it 'depends on !BR2_STATIC_LIBS'. Also, you should add
a comment like sdl2 has. So, you should end up with:

config BR2_PACKAGE_LINUXCONSOLETOOLS_FORCEFEEDBACK
	bool "force-feedback utilities"
	depends on !BR2_STATIC_LIBS
	select BR2_PACKAGE_SDL2
	help
	  Build force-feedback driver utilities (fftest,
	  ffmvforce, ffset, ffcfstress).

comment "force-feedback utilities needs a toolchain w/ dynamic library"
	depends on BR2_STATIC_LIBS

 Regards,
 Arnout

> with test-pkg, but that feels like an ugly way to fix this. It
> feels like SDL2 should declare its dependency on BR2_SHARED_LIBS
> instead of me declaring it?
> 
> This has left me a bit confused.
> 
> Cheers,
> 
> Koen
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
