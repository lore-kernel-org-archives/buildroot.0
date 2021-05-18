From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 May 2021 23:04:16 +0200
Subject: [Buildroot] [PATCH v11 4/9] package/libclc: bump version to
 11.1.0
In-Reply-To: <CANQCQpZGpLkvWwPpNPKjsygS83GBuTv6dDr63ePi0X7W+znLhg@mail.gmail.com>
References: <20210311142932.44985-1-matthew.weber@rockwellcollins.com>
 <20210311142932.44985-4-matthew.weber@rockwellcollins.com>
 <CANQCQpYpXG2_1JQp=8VJHtfmAEqXRPfQid5qeeDVYkdVVpSSBQ@mail.gmail.com>
 <CANQCQpZGpLkvWwPpNPKjsygS83GBuTv6dDr63ePi0X7W+znLhg@mail.gmail.com>
Message-ID: <dbf8d669-1d2e-4556-30f9-8a44e74942f8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Matt,

 I was going to apply this series to next...

On 11/03/2021 20:37, Matthew Weber via buildroot wrote:
[snip]
>>> -# C++ compiler is used to build a small tool (prepare-builtins) for the host.
>>> -# It must be built with the C++ compiler from the host.
>>> +# CMAKE_*_COMPILER_FORCED=ON skips testing the tools and assumes
>>> +# llvm-config provided values
>>>  #
>>> -# The headers are installed in /usr/share and not /usr/include,
>>> -# because they are needed at runtime on the target to build the OpenCL
>>> -# kernels.
>>> +# CMAKE_CXX_COMPILER has to be set to the host compiler to build a host
>>> +# 'prepare_builtins' tool used during the build process
>>>  LIBCLC_CONF_OPTS = \
>>> -       --with-llvm-config=$(HOST_DIR)/usr/bin/llvm-config \
>>> -       --prefix=/usr \
>>> -       --includedir=/usr/share \
>>> -       --pkgconfigdir=/usr/lib/pkgconfig \
>>> -       --with-cxx-compiler=$(HOSTCXX_NOCCACHE)
>>> +       -DCMAKE_CLC_COMPILER_FORCED=ON \
>>> +       -DCMAKE_LLAsm_COMPILER_FORCED=ON \
>>> +       -DCMAKE_CXX_COMPILER="$(CMAKE_HOST_CXX_COMPILER)"
> 
> Looks like I have a couple of bugs (I didn't have opencl checked in menuconfig)

... but then I saw this. So I didn't. Instead, I've marked the series as Changes
Requested. If you think it should be applied after all, please repost (or just
update patchwork if unchanged).

 Oh, and 12.0.0 has been released now...

> 
> 1) mesa3d.mk needs MESA3D_MESON_EXTRA_BINARIES +=
> llvm-config='$(STAGING_DIR)/bin/llvm-config' updated to point to the

 Normally, the foo-config programs are script, so it's OK to use the one in
staging. If it's an actual binary, we have to somehow patch it so it has target
config but compiles for host.

 I'd expect llvm and related to be cross-compile friendly though...

> HOST_DIR llvm-config because it needs to be able to execute the tool.
> However this doesn't work since then you get the
> "host/lib/libLLVM-11.so when searching for -lLLVM-11 " error which
> makes sense since that's the host llvm-config we pointed at.....
> Unsure how to solve this one and we don't notice it in x86 builds.
> When you enable the AMD Radeon to build for aarch64 you can cause this
> error.
> 
> 2) mesa3d doesn't quite build (pkgconfig can't find libclc).  I didn't
> catch that CMAKE_INSTALL_PREFIX is getting ignored (we set it in the
> pkg-cmake.mk infra) so the libclc.pc is getting installed in
> $HOST_DIR/usr/local/share vs $HOST_DIR/usr/share .  I haven't been
> able to figure out why the value doesn't take hold (ie after the
> configuration step libclc-11.1.0/CMakeCache.txt still shows /usr/local
> unless I force set the CMAKE_INSTALL_PREFIX value in
> libclc-11.1.0/CMakeList.txt before project().

 That *is* weird...

 Regards,
 Arnout

> 
> 
> Matt
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
