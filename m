From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 May 2018 22:19:51 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/exim: remove libnsl linking
 and fix native tools build
In-Reply-To: <20180517072140.6432-1-romain.naour@gmail.com>
References: <20180517072140.6432-1-romain.naour@gmail.com>
Message-ID: <20180517221951.5f101b52@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 May 2018 09:21:39 +0200, Romain Naour wrote:
> glibc now considers its built-in libnsl as being obsolete, and requires
> passing --enable-obsolete-libnsl to have it built and installed. libnsl
> is now provided as a separate project [1], but it isn't packaged yet in
> Buildroot.
> 
> In preparation for dropping --enable-obsolete-libnsl from the glibc
> package, this commit ensures that exim doesn't use libnsl. It was
> already the case for uclibc and musl toolchains, so this commit simply
> extends that to make sure libnsl is also not used with glibc toolchains.
> 
> Only Exim's nis.so and nisplus.so lookup modules require libnsl,
> but they are not build by default. So we can safely remove -lnsl
> from the Makefile-Linux. If someone want these modules, a new libnsl
> package must be added first to provide nsl library.
> 
> This also fixes the following build error on recent distributions where
> libnsl is not installed (e.g. Fedora 28 which has switched to the new
> libnsl library that brings IPV6 support. [2]):
> 
>   /bin/sh ../scripts/Configure-os.c
>   /usr/bin/gcc buildconfig.c
>   /usr/bin/ld: cannot find -lnsl
>   collect2: error: ld returned 1 exit status

I don't really agree that this patch is the good solution for this
specific problem. The good approach is to not use $(LIBS) at all when
building the buildconfig host program. I've committed this:

  https://git.buildroot.org/buildroot/commit/?id=b872d829d092059ae8d5e86115d1515164d01a74

That being said, I believe your change is still useful, but doing it as
a patch to exim like Baruch proposed is a better solution.

Could you rework your patch, and its commit log, according to this ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
