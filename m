From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 May 2021 23:02:14 +0200
Subject: [Buildroot] [PATCHv6 5/5] package/bcc: add optional luajit
 dependency
In-Reply-To: <20201220151203.2206747-5-romain.naour@gmail.com>
References: <20201220151203.2206747-1-romain.naour@gmail.com>
 <20201220151203.2206747-5-romain.naour@gmail.com>
Message-ID: <4f8ab746-d20f-844a-b602-2858cabfaf29@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/12/2020 16:12, Romain Naour wrote:
> ++		SET (LUAJIT_TARGET_ARCH "-a")
> ++		# https://github.com/LuaJIT/LuaJIT/blob/f0e865dd4861520258299d0f2a56491bd9d602e1/src/jit/bcsave.lua#L30
> ++		# https://github.com/LuaJIT/LuaJIT/blob/f0e865dd4861520258299d0f2a56491bd9d602e1/src/jit/bcsave.lua#L65
> ++		if (CMAKE_SYSTEM_PROCESSOR STREQUAL "aarch64")
> ++			SET (LUAJIT_TARGET_ARCH ${LUAJIT_TARGET_ARCH} "arm64")

 This is a very weird way of adding the -a. Why not just:

		SET (LUAJIT_TARGET_ARCH "arm64")
> ++		elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "aarch64_be")
> ++			SET (LUAJIT_TARGET_ARCH ${LUAJIT_TARGET_ARCH} "arm64be")
> ++		elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "arm")
> ++			SET (LUAJIT_TARGET_ARCH ${LUAJIT_TARGET_ARCH} "arm")
> ++		elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^(i.86)$")
> ++			SET (LUAJIT_TARGET_ARCH ${LUAJIT_TARGET_ARCH} "x86")
> ++		elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "mips")
> ++			SET (LUAJIT_TARGET_ARCH ${LUAJIT_TARGET_ARCH} "mips")
> ++		elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "mipsel")
> ++			SET (LUAJIT_TARGET_ARCH ${LUAJIT_TARGET_ARCH} "mipsel")
> ++		elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "powerpc")
> ++			SET (LUAJIT_TARGET_ARCH ${LUAJIT_TARGET_ARCH} "ppc")
> ++		elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "x86_64")
> ++			SET (LUAJIT_TARGET_ARCH ${LUAJIT_TARGET_ARCH} "x64")
> ++		else()
> ++			MESSAGE(FATAL_ERROR "${CMAKE_SYSTEM_PROCESSOR} is not supported by LuaJIT")
> ++		endif()
> ++	endif()
> ++
> + 	ADD_CUSTOM_COMMAND(
> + 		OUTPUT bcc.o
> +-		COMMAND ${LUAJIT} -bg bcc.lua bcc.o
> ++		COMMAND ${LUAJIT} -bg bcc.lua ${LUAJIT_TARGET_ARCH} bcc.o

 and here

		COMMAND ${LUAJIT} -bg bcc.lua -a ${LUAJIT_TARGET_ARCH} bcc.o


 Also, has this patch been sent upstream?

 Regards,
 Arnout


> + 		DEPENDS bcc.lua
> + 	)
> +
