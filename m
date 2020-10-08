From: Qais Yousef <qais.yousef@arm.com>
Date: Thu, 8 Oct 2020 23:48:51 +0100
Subject: [Buildroot] [PATCH 2/2] package/bcc: new package
In-Reply-To: <20201004181215.2w225cjecin4pm6r@e107158-lin.cambridge.arm.com>
References: <20200824181740.12878-1-jugurtha.belkalem@smile.fr>
 <20200824181740.12878-2-jugurtha.belkalem@smile.fr>
 <20201004181215.2w225cjecin4pm6r@e107158-lin.cambridge.arm.com>
Message-ID: <20201008224850.budzpxeparlt2osm@e107158-lin.cambridge.arm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jugurtha

On 10/04/20 19:12, Qais Yousef wrote:

[...]

> > +---
> > +v2: Do the same for other architecture supported by LuaJIT.
> > +https://github.com/iovisor/bcc/pull/2480
> > +---
> > + src/lua/CMakeLists.txt | 29 ++++++++++++++++++++++++++++-
> > + 1 file changed, 28 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/src/lua/CMakeLists.txt b/src/lua/CMakeLists.txt
> > +index 7541d48df..226e1b1d2 100644
> > +--- a/src/lua/CMakeLists.txt
> > ++++ b/src/lua/CMakeLists.txt
> > +@@ -13,9 +13,36 @@ if (LUAJIT_LIBRARIES AND LUAJIT)
> > + 		DEPENDS ${SRC_LUA} ${CMAKE_CURRENT_SOURCE_DIR}/squishy
> > + 	)
> > + 
> > ++	# LuaJIT doesn't use usual arch naming, so we have to convert
> > ++	# between CMake and Luajit while cross-compiling.
> > ++	if (CMAKE_CROSSCOMPILING)
> > ++		SET (LUAJIT_TARGET_ARCH "-a")
> > ++		# https://github.com/LuaJIT/LuaJIT/blob/f0e865dd4861520258299d0f2a56491bd9d602e1/src/jit/bcsave.lua#L30
> > ++		# https://github.com/LuaJIT/LuaJIT/blob/f0e865dd4861520258299d0f2a56491bd9d602e1/src/jit/bcsave.lua#L65
> > ++		if (CMAKE_SYSTEM_PROCESSOR STREQUAL "aarch64")
> > ++			SET (LUAJIT_TARGET_ARCH ${LUAJIT_TARGET_ARCH} "arm64")
> > ++		elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "aarch64_be")
> > ++			SET (LUAJIT_TARGET_ARCH ${LUAJIT_TARGET_ARCH} "arm64be")
> > ++		elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "arm")
> > ++			SET (LUAJIT_TARGET_ARCH ${LUAJIT_TARGET_ARCH} "arm")
> > ++		elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^(i.86)$")
> > ++			SET (LUAJIT_TARGET_ARCH ${LUAJIT_TARGET_ARCH} "x86")
> > ++		elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "mips")
> > ++			SET (LUAJIT_TARGET_ARCH ${LUAJIT_TARGET_ARCH} "mips")
> > ++		elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "mipsel")
> > ++			SET (LUAJIT_TARGET_ARCH ${LUAJIT_TARGET_ARCH} "mipsel")
> > ++		elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "powerpc")
> > ++			SET (LUAJIT_TARGET_ARCH ${LUAJIT_TARGET_ARCH} "ppc")
> > ++		elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "x86_64")
> > ++			SET (LUAJIT_TARGET_ARCH ${LUAJIT_TARGET_ARCH} "x64")
> > ++		else()
> > ++			MESSAGE(FATAL_ERROR "${CMAKE_SYSTEM_PROCESSOR} is not supported by LuaJIT")
> > ++		endif()
> > ++	endif()
> > ++
> > + 	ADD_CUSTOM_COMMAND(
> > + 		OUTPUT bcc.o
> > +-		COMMAND ${LUAJIT} -bg bcc.lua bcc.o
> > ++		COMMAND ${LUAJIT} -bg bcc.lua ${LUAJIT_TARGET_ARCH} bcc.o
> > + 		DEPENDS bcc.lua
> > + 	)
> > + 

With the attached patch where I remove some of the dependencies I could compile
and use bcc and apply my bpftrace patch on top and use it.

Maybe I missed trying something that you do that could make this dependency
obvious. As it stands, it seems this lua front-end support requires this
functionality + a specific use case. iperf3 dependency particularly looks
strange to me as I can't think why bcc would need that.

I suggest wrapping wrapping the lua front-end support with its own config
option and keep it in a separate patch.

We can remove PYTHON_BCC copying if we apply a fixup patch (included in the
attached patch). I'll try to find a proper solution that can be upstreamed
back. If you know the right solution, please go ahead and do it of course :-)

Thanks!

--
Qais Yousef
-------------- next part --------------
A non-text attachment was scrubbed...
Name: bcc.fixup.patch
Type: text/x-diff
Size: 3757 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201008/650be8ba/attachment.patch>
