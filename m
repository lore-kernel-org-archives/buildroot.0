From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Sun, 13 Aug 2017 10:46:33 -0400
Subject: [Buildroot] [PATCH v7 0/3] Qt WebEngine support
In-Reply-To: <20170813160157.5819cf80@windsurf>
References: <20170813135650.14067-1-gael.portay@savoirfairelinux.com>
 <20170813160157.5819cf80@windsurf>
Message-ID: <20170813144633.5wo5xsvkg27ezgtx@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sun, Aug 13, 2017 at 04:01:57PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 13 Aug 2017 09:56:47 -0400, Ga?l PORTAY wrote:
> 
> > The last patch is a special defconfig that provides a Qt WebEngine setup on
> > raspberrypi3.
> > 
> > With this patchset, one can run the Qt quicknanobrowser sample on a rpi3 with
> > the following options:
> >   - BR2_TOOLCHAIN_BUILDROOT_LIBC="glibc" and
> >     BR2_TOOLCHAIN_BUILDROOT_CXX=y (Qt 5 needs a toolchain w/ wchar, NPTL, C++,
> >     dynamic library)
> >   - BR2_PACKAGE_LIBERATION (Qt 5.8 requires a least one font)
> >   - BR2_PACKAGE_RPI_USERLAND (to enable OpenGL backend)
> >   - BR2_PACKAGE_QT5BASE_EXAMPLES (to install quicknanobrowser sample)
> >   - BR2_PACKAGE_QT5QUICKCONTROLS (needed by quicknanobrowser)
> >   - BR2_PACKAGE_QT5WEBENGINE (because it is what we want :))
> > 
> > To browse for HTTPS websites, please consider adding the following options as
> > well:
> >   - BR2_PACKAGE_CA_CERT (for certificates)
> >   - BR2_PACKAGE_NTPD (to sync date)
> > 
> > To run quicknanobrowser:
> > 	# cd /usr/lib/qt/examples/webengine/quicknanobrowser/
> > 	# ./quicknanobrowser
> 
> These details would be good to have in the commit log of the
> qtwebengine package.
> 
> > Note: For now, quicknanobrowser will just display the qt website without any
> > input backend.
> > 
> > Note 2: Since bump to 5.9.1, the chromium's copy of opus fails with neon [7].
> > BR2_PACKAGE_QT5WEBENGINE_SYSTEM_FFMPEG option allows one to use buildroot copy
> > (which compiles fine).
> > 
> > 	In file included from ../../3rdparty/chromium/third_party/opus/src/silk/arm/NSQ_neon.c:31:0:
> > 	/home/gportay/src/buildroot/output-rpi3-qt5.9/host/lib/gcc/arm-buildroot-linux-gnueabihf/6.4.0/include/arm_neon.h:8997:1: error: inlining failed in call to always_inline ?vld1q_s32?: target specific option mismatch
> > 	 vld1q_s32 (const int32_t * __a)
> > 	 ^~~~~~~~~
> > 	../../3rdparty/chromium/third_party/opus/src/silk/arm/NSQ_neon.c:40:15: note: called from here
> > 	     int32x4_t coef0 = vld1q_s32(coef32);
> > 		       ^~~~~
> > 	../../3rdparty/chromium/third_party/opus/src/silk/arm/NSQ_neon.c: At top level:
> > 	cc1: warning: unrecognized command line option ?-Wno-#pragma-messages?
> 
> Those notes too.
> 
> > 
> > Note 3: Since bump to 5.9.1, chromium requires udev.
> > 
> > Note 4: Tested against:
> >         - GCC 6.x and binutils 2.27 on rpi 3.
> >         - GCC 7.x and binutils 2.28 on rpi 3.
> > 
> > Note 5: Version 5.6.2 causes a build issue while building chromium. I disabled
> >         the build against this version and am waiting for the release 5.6.3.
> 
> This note too.
> 

Indeed, I will reword the commit message.

> > Changes since v6:
> >  - rpi-userland commit message:
> >    fix output of ls -l snippet
> >    update url to link to qtwe-5.9.1
> >    add upstream-status
> >  - qtwe:
> >    add missing host-bison, host-flex and host-pkgconf dependencies
> >    select BR2_HOSTARCH_NEEDS_IA32_COMPILER for 32-bit targets
> 
> BR2_HOSTARCH_NEEDS_IA32_COMPILER has nothing to do with 32-bit targets.
> It has to do with the fact that qtwebengine builds programs for the
> *host* (and not the target) using -m32. Therefore, on x86-64 machines,
> it requires multilib support, in order to build (and run) 32 bits
> programs.
> 
> Or, do you have some evidence/explanation that qtwebengine builds its
> host programs 32 bits when the target is 32 bits, and builds its host
> programs 64 bits when the target is 64 bits ?
> 

Sorry if the changelog was not clear enough.

Does the comment I added in the Config.in is more clear?

	# For 32-bits targets, v8 (a chromium 3rd-party) adds -m32 flag to build
	# internal host-tools.
	# https://github.com/v8/v8/blob/5.6.326.55/gypfiles/toolchain.gypi#L1036-L1037

I had a quick look to where v8 adds the -m32 flag and I found this [1].

My understanding is that v8 adds this flag when target is 32-bits and when host
compiler is biarch:

      ['(OS=="linux" or OS=="freebsd" or OS=="openbsd" or OS=="solaris" \
         or OS=="netbsd" or OS=="mac" or OS=="android" or OS=="qnx") and \
        (v8_target_arch=="arm" or v8_target_arch=="ia32" or \
         v8_target_arch=="x87" or v8_target_arch=="mips" or \
         v8_target_arch=="mipsel" or v8_target_arch=="ppc" or \
         v8_target_arch=="s390")', {
        'target_conditions': [
          ['_toolset=="host"', {
            'conditions': [
              ['host_cxx_is_biarch==1', {
                'conditions': [
                  ['host_arch=="s390" or host_arch=="s390x"', {
                    'cflags': [ '-m31' ],
                    'ldflags': [ '-m31' ]
                  },{
                   'cflags': [ '-m32' ],
                   'ldflags': [ '-m32' ]
                  }],
                ],
              }],
            ],
            'xcode_settings': {
              'ARCHS': [ 'i386' ],
            },
           ...
      }],

biarch is set when host is x86[-64], PPC[64] or s390[x] (see [2]).

    ['host_arch=="ia32" or host_arch=="x64" or \
      host_arch=="ppc" or host_arch=="ppc64" or \
      host_arch=="s390" or host_arch=="s390x" or \
      clang==1', {
      'variables': {
        'host_cxx_is_biarch%': 1,
       },
     }, {
      'variables': {
        'host_cxx_is_biarch%': 0,
      },
    }],

So v8 seems to add -m32 flag to build its host-tools if host is intel/ppc/s390
(32/64-bits) and the target is 32-bits.

Also, it seems to apply the -m64 flag for 64-bits targets [3].

      ['(OS=="linux" or OS=="android") and \
        (v8_target_arch=="x64" or v8_target_arch=="arm64" or \
         v8_target_arch=="ppc64" or v8_target_arch=="s390x")', {
        'target_conditions': [
          ['_toolset=="host"', {
            'conditions': [
              ['host_cxx_is_biarch==1', {
                'cflags': [ '-m64' ],
                'ldflags': [ '-m64' ]
              }],
             ],
           }],
           ...,
         ],
      }],

[1] https://github.com/v8/v8/blob/5.6.326.55/gypfiles/toolchain.gypi#L1021-L1045
[2] https://github.com/v8/v8/blob/5.6.326.55/gypfiles/toolchain.gypi#L138-L150
[3] https://github.com/v8/v8/blob/5.6.326.55/gypfiles/toolchain.gypi#L1066-L1087

Best regards,
Gael
