From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 16 Nov 2017 22:24:47 +0100
Subject: [Buildroot] musl static pie
In-Reply-To: <CABukmmPJ0MbOF9YP+DoA15OCHU_8B9dEXYFz3X0194qcjSGcbg@mail.gmail.com>
References: <CABukmmPJ0MbOF9YP+DoA15OCHU_8B9dEXYFz3X0194qcjSGcbg@mail.gmail.com>
Message-ID: <29422da9-526a-1140-3614-47a98abc5648@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-11-17 14:31, Arvid Picciani wrote:
> Hi,
> 
> musl does support static pie, which we need for implement linking with korhal
> bolter.
> Is there any general resistance against implement that?
> 
> as far as i understand this requires adding a .spec file, since gcc does not
> natively understand static pie yet. A different crt needs to be added for
> self-relocation without an ldso.
> https://gcc.gnu.org/ml/gcc-patches/2017-11/msg00247.html
> <https://gcc.gnu.org/ml/gcc-patches/2017-11/msg00247.html>

 I took the autobuilder's musl toolchain [1] and built a simple main(){} with
-static -pie -fPIE and that seemed to work fine. So I'm not sure we need to hack
spec files. It does request /usr/lib/ld.so.1 as the program interpreter, and
that file doesn't exist. I haven't done a runtime test.

> it would also involve adding -fPIC to TARGET_CFLAGS.
> 
> i'd suggest adding it as Build options -> position independant executables
                                                     independent

> 
> but behind !BR2_STATIC_LIBS ||?BR2_TOOLCHAIN_USES_MUSL

 That looks like a good idea.

 You'll want to add -fPIE (or -fpie?) -pie in the toolchain wrapper. But I don't
know if this might have detrimental effects for bootloader/kernel/... packages
that require special linking...

 Regards,
 Arnout


[1]
http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2016.08-613-ge98b4dd.tar.bz2

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
