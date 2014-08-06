From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Aug 2014 22:14:49 +0200
Subject: [Buildroot] [v2 1/2] caps: new package
In-Reply-To: <1407283327-5150-1-git-send-email-martin@barkynet.com>
References: <1407283327-5150-1-git-send-email-martin@barkynet.com>
Message-ID: <20140806221449.2aff1359@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Martin Bark,

On Wed,  6 Aug 2014 01:02:06 +0100, Martin Bark wrote:
> CAPS is a collection of audio plugins comprising virtual guitar
> amplification and a small range of basic classic effects, signal
> processors and generators of often elementary and occasionally
> exotic nature.
> 
> The plugins aim to satisfy the highest demands in sound quality
> with maximal computational efficiency and zero latency.
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
> CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> ---
> 
> Changes v1 -> v2:
>   - Added dependency to BR2_INSTALL_LIBSTDCPP (Thomas Petazzoni)
>   - Add description and Signed-off-by to patch (Thomas Petazzoni)
>   - Fixed use of $(TARGET_CONFIGURE_OPTS) and $(TARGET_MAKE_ENV) (Thomas Petazzoni)

Thanks for this new version. Review-wise, it looks good, but
unfortunately, it doesn't build here:

/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-g++  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -fPIC -DPIC  -o Eq.o -c Eq.cc
In file included from dsp/Oversampler.h:35:0,
                 from Amp.h:35,
                 from Amp.cc:30:
dsp/windows.h: In function ?void DSP::kaiser(sample_t*, int, double, double)?:
dsp/windows.h:165:17: error: there are no arguments to ?finite? that depend on a template parameter, so a declaration of ?finite? must be available [-fpermissive]
dsp/windows.h:165:17: note: (if you use ?-fpermissive?, G++ will accept your code, but allowing the use of an undeclared name is deprecated)
In file included from Eq.h:36:0,
                 from Eq.cc:33:
dsp/v4f_BiQuad.h: In member function ?void DSP::BiQuad4f::set_eq(v4f_t, v4f_t, v4f_t)?:
dsp/v4f_BiQuad.h:145:17: error: ?pow10f? was not declared in this scope
dsp/v4f_BiQuad.h:145:27: error: no matching function for call to ?v4f_map(v4f_t&)?
dsp/v4f_BiQuad.h:145:27: note: candidate is:
In file included from Eq.h:35:0,
                 from Eq.cc:33:
dsp/v4f.h:74:7: note: template<float (* fn)(float)> v4f_t v4f_map(v4f_t)
dsp/v4f.h:74:7: note:   template argument deduction/substitution failed:
In file included from Eq.h:36:0,
                 from Eq.cc:33:
dsp/v4f_BiQuad.h:145:27: error: template argument 1 is invalid
In file included from Compress.h:36:0,
                 from Compress.cc:28:
dsp/windows.h: In function ?void DSP::kaiser(sample_t*, int, double, double)?:
dsp/windows.h:165:17: error: there are no arguments to ?finite? that depend on a template parameter, so a declaration of ?finite? must be available [-fpermissive]dsp/v4f_BiQuad.h: In member function ?void DSP::BiQuad4fBank<N>::set_eq(v4f_t*, v4f_t*, v4f_t*)?:
dsp/v4f_BiQuad.h:432:18: error: ?pow10f? was not declared in this scope

dsp/windows.h:165:17: note: (if you use ?-fpermissive?, G++ will accept your code, but allowing the use of an undeclared name is deprecated)
dsp/windows.h: In instantiation of ?void DSP::kaiser(sample_t*, int, double, double) [with void (* F)(sample_t&, sample_t) = DSP::apply_window; sample_t = float]?:
dsp/Oversampler.h:73:5:   required from ?void DSP::Oversampler<Oversample, FIRSize>::init(float) [with int Oversample = 2; int FIRSize = 32]?
dsp/Oversampler.h:65:6:   required from ?DSP::Oversampler<Oversample, FIRSize>::Oversampler() [with int Oversample = 2; int FIRSize = 32]?
Amp.h:44:7:   required from ?static void* Descriptor<T>::_instantiate(const _LADSPA_Descriptor*, ulong) [with T = AmpVTS; LADSPA_Handle = void*; _LADSPA_Descriptor = _LADSPA_Descriptor; ulong = long unsigned int]?
Descriptor.h:123:5:   required from ?void Descriptor<T>::autogen() [with T = AmpVTS]?
Amp.cc:222:2:   required from here
dsp/windows.h:165:3: error: ?finite? was not declared in this scope
dsp/windows.h: In instantiation of ?void DSP::kaiser(sample_t*, int, double, double) [with void (* F)(sample_t&, sample_t) = DSP::apply_window; sample_t = float]?:
Compress.h:53:5:   required from ?void CompSaturate<Over, FIRSize>::init(double) [with int Over = 2; int FIRSize = 32]?
Compress.h:123:6:   required from ?void CompressStub<Channels>::init() [with int Channels = 1]?
Descriptor.h:150:5:   required from ?static void* Descriptor<T>::_instantiate(const _LADSPA_Descriptor*, ulong) [with T = Compress; LADSPA_Handle = void*; _LADSPA_Descriptor = _LADSPA_Descriptor; ulong = long unsigned int]?
Descriptor.h:123:5:   required from ?void Descriptor<T>::autogen() [with T = Compress]?
Compress.cc:157:2:   required from here
dsp/windows.h:165:3: error: ?finite? was not declared in this scope
make[1]: *** [Eq.o] Erreur 1
make[1]: *** Attente des t?ches non termin?es....
make[1]: *** [Amp.o] Erreur 1
In file included from dsp/Oversampler.h:35:0,
                 from Cabinet.h:42,
                 from Click.cc:158:
dsp/windows.h: In function ?void DSP::kaiser(sample_t*, int, double, double)?:
dsp/windows.h:165:17: error: there are no arguments to ?finite? that depend on a template parameter, so a declaration of ?finite? must be available [-fpermissive]
dsp/windows.h:165:17: note: (if you use ?-fpermissive?, G++ will accept your code, but allowing the use of an undeclared name is deprecated)
In file included from Cabinet.h:45:0,
                 from Click.cc:158:
dsp/v4f_BiQuad.h: In member function ?void DSP::BiQuad4f::set_eq(v4f_t, v4f_t, v4f_t)?:
dsp/v4f_BiQuad.h:145:17: error: ?pow10f? was not declared in this scope
dsp/v4f_BiQuad.h:145:27: error: no matching function for call to ?v4f_map(v4f_t&)?
dsp/v4f_BiQuad.h:145:27: note: candidate is:
In file included from Cabinet.h:43:0,
                 from Click.cc:158:
dsp/v4f.h:74:7: note: template<float (* fn)(float)> v4f_t v4f_map(v4f_t)
dsp/v4f.h:74:7: note:   template argument deduction/substitution failed:
In file included from Cabinet.h:45:0,
                 from Click.cc:158:
dsp/v4f_BiQuad.h:145:27: error: template argument 1 is invalid
dsp/v4f_BiQuad.h: In member function ?void DSP::BiQuad4fBank<N>::set_eq(v4f_t*, v4f_t*, v4f_t*)?:
dsp/v4f_BiQuad.h:432:18: error: ?pow10f? was not declared in this scope
make[1]: *** [Compress.o] Erreur 1
In file included from dsp/Oversampler.h:35:0,
                 from Cabinet.h:42,
                 from Cabinet.cc:29:
dsp/windows.h: In function ?void DSP::kaiser(sample_t*, int, double, double)?:
dsp/windows.h:165:17: error: there are no arguments to ?finite? that depend on a template parameter, so a declaration of ?finite? must be available [-fpermissive]
dsp/windows.h:165:17: note: (if you use ?-fpermissive?, G++ will accept your code, but allowing the use of an undeclared name is deprecated)
In file included from Cabinet.h:45:0,
                 from Cabinet.cc:29:
dsp/v4f_BiQuad.h: In member function ?void DSP::BiQuad4f::set_eq(v4f_t, v4f_t, v4f_t)?:
dsp/v4f_BiQuad.h:145:17: error: ?pow10f? was not declared in this scope
dsp/v4f_BiQuad.h:145:27: error: no matching function for call to ?v4f_map(v4f_t&)?
dsp/v4f_BiQuad.h:145:27: note: candidate is:
In file included from Cabinet.h:43:0,
                 from Cabinet.cc:29:
dsp/v4f.h:74:7: note: template<float (* fn)(float)> v4f_t v4f_map(v4f_t)
dsp/v4f.h:74:7: note:   template argument deduction/substitution failed:
In file included from Cabinet.h:45:0,
                 from Cabinet.cc:29:
dsp/v4f_BiQuad.h:145:27: error: template argument 1 is invalid
dsp/v4f_BiQuad.h: In member function ?void DSP::BiQuad4fBank<N>::set_eq(v4f_t*, v4f_t*, v4f_t*)?:
dsp/v4f_BiQuad.h:432:18: error: ?pow10f? was not declared in this scope
make[1]: *** [Click.o] Erreur 1
In file included from dsp/Oversampler.h:35:0,
                 from Cabinet.h:42,
                 from Cabinet.cc:29:
dsp/windows.h: In instantiation of ?void DSP::kaiser(sample_t*, int, double, double) [with void (* F)(sample_t&, sample_t) = DSP::apply_window; sample_t = float]?:
dsp/Oversampler.h:73:5:   required from ?void DSP::Oversampler<Oversample, FIRSize>::init(float) [with int Oversample = 4; int FIRSize = 64]?
Cabinet.cc:251:31:   required from here
dsp/windows.h:165:3: error: ?finite? was not declared in this scope
make[1]: *** [Cabinet.o] Erreur 1
make[1]: quittant le r?pertoire ? /home/thomas/projets/buildroot/output/build/caps-0.9.23 ?
make: *** [/home/thomas/projets/buildroot/output/build/caps-0.9.23/.stamp_built] Erreur 2

You can use this defconfig to reproduce the problem:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2014.05-rc1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_14=y
BR2_TOOLCHAIN_EXTERNAL_LARGEFILE=y
BR2_TOOLCHAIN_EXTERNAL_INET_IPV6=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_CAPS=y
# BR2_TARGET_ROOTFS_TAR is not set

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
