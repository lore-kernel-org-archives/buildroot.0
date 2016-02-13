From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Feb 2016 21:37:50 +0100
Subject: [Buildroot] Issue with toolchain wrapper changes
In-Reply-To: <20160213163116.745e4507@free-electrons.com>
References: <20160213163116.745e4507@free-electrons.com>
Message-ID: <56BF941E.80008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13-02-16 16:31, Thomas Petazzoni wrote:
> Hello Arnout,
> 
> I am facing some issues with the toolchain wrapper, which I believe
> were introduced by the changes done to use the toolchain wrapper also
> for the internal toolchain backend.
> 
> As you know, Buildroot installs all its host stuff in $(HOST_DIR)/usr,
> and not directly under $(HOST_DIR). For the autobuilders, I build a
> number of toolchains with Buildroot, which are then used as pre-built
> external toolchains by the autobuilders. In order for those toolchains
> to look like conventional toolchains, at the end of their build, I do:
> 
> 	mv /path/to/host/usr/* /path/to/host/
> 	rmdir /path/to/host/usr/
> 
> Which moves everything outside of the usr/ subdirectory, and removes
> the usr/ subdirectory itself. This used to work perfectly fine, but
> now, it fails to find the .br_real equivalent of the command being
> executed. Example:
> 
> thomas at skate:~/x-tools/armv5-musl-new-2016.02-1$ ls
> arm-buildroot-linux-musleabi  bin  include  lib  libexec  share
> thomas at skate:~/x-tools/armv5-musl-new-2016.02-1$ ./bin/arm-linux-gcc -v
> /home/thomas/x-tools/usr/bin/arm-linux-gcc.br_real: No such file or directory
> 
> As you can see, it looks for arm-linux-gcc.br_real
> in /home/thomas/x-tools/usr/bin, while it is
> in /home/thomas/x-tools/armv5-musl-new-2016.02-1/bin/.

 5ce73dca5238d30b0cbfe64c1ecbaec777c6a8fe was supposed to fix this situation. I
didn't find a way to avoid hardcoding the BR_CROSS_PATH_SUFFIX/usr/bin bit in
the wrapper, so instead I reversed the logic: the _external_ toolchain wrapper
will avoid calling the wrapper and instead call the .br_real directly. So,
calling the wrapper outside the usr directory will indeed fail, but when it's
used as an external toolchain in buildroot, it should work fine.

 Obviously this is not an ideal situation, but I don't have better ideas. Well,
except to get rid of the usr part, as you point out below. The problem is that
the wrapper needs to have absbasedir to find the sysroot, and for the external
toolchain this needs to lead to opt/ext-toolchain. Well, maybe we coud use ../
in BR_SYSROOT, or we could make more than a difference between the internal and
the external toolchain, or we could add keep a bindir variable in addition to
absbasedir and use that for ccache and the internal toolchain. Right, so I do
have some ideas :-)

 Anyway it's going to be a much bigger change than the one from 5ce73dca, and I
think it's not for 2016.02.


 Regards,
 Arnout


> 
> If I move everything again under a usr/ subdirectory, it all works fine
> again:
> 
> thomas at skate:~/x-tools/armv5-musl-new-2016.02-1$ mkdir usr
> thomas at skate:~/x-tools/armv5-musl-new-2016.02-1$ mv * usr/
> mv: cannot move ?usr? to a subdirectory of itself, ?usr/usr?
> thomas at skate:~/x-tools/armv5-musl-new-2016.02-1$ ./usr/bin/arm-linux-gcc -v
> Using built-in specs.
> COLLECT_GCC=/home/thomas/x-tools/armv5-musl-new-2016.02-1/usr/bin/arm-linux-gcc.br_real
> COLLECT_LTO_WRAPPER=/home/thomas/x-tools/armv5-musl-new-2016.02-1/usr/bin/../libexec/gcc/arm-buildroot-linux-musleabi/5.3.0/lto-wrapper
> Target: arm-buildroot-linux-musleabi
> Configured with: ./configure --prefix=/build/armv5-musl-new-2016.02-1/usr --sysconfdir=/build/armv5-musl-new-2016.02-1/etc --enable-static --target=arm-buildroot-linux-musleabi --with-sysroot=/build/armv5-musl-new-2016.02-1/usr/arm-buildroot-linux-musleabi/sysroot --disable-__cxa_atexit --with-gnu-ld --disable-libssp --disable-multilib --with-gmp=/build/armv5-musl-new-2016.02-1/usr --with-mpfr=/build/armv5-musl-new-2016.02-1/usr --with-pkgversion='Buildroot 2016.02-rc1-00006-gbb13242' --with-bugurl=http://bugs.buildroot.net/ --disable-libquadmath --disable-libsanitizer --disable-tls --disable-libmudflap --enable-threads --with-mpc=/build/armv5-musl-new-2016.02-1/usr --without-isl --without-cloog --with-float=soft --disable-decimal-float --with-abi=aapcs-linux --with-cpu=arm926ej-s --with-float=soft --with-mode=arm --enable-languages=c,c++ --with-build-time-tools=/build/armv5-musl-new-2016.02-1/usr/arm-buildroot-linux-musleabi/bin --enable-shared --disable-libgomp
> Thread model: posix
> gcc version 5.3.0 (Buildroot 2016.02-rc1-00006-gbb13242) 
> 
> Now, I'm sure the problem is at the beginning of the
> toolchain-wrapper.c main() function. But I'm wondering what is the
> proper fix for this. Should I fix the toolchain-wrapper logic to
> properly work in such a situation ? Should we remove the usr/
> sub-directory completely from Buildroot, as you suggested multiple
> times already ?
> 
> Do you have some other suggestions ?
> 
> Thanks!
> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
