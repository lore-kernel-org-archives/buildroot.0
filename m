From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 20 Apr 2018 22:13:12 +0200
Subject: [Buildroot] [PATCH] package/flann: fix build with cmake >= 3.11
In-Reply-To: <20180419225408.2ba57fb6@windsurf.numericable.fr>
References: <20180418191912.25410-1-romain.naour@gmail.com>
 <20180419225408.2ba57fb6@windsurf.numericable.fr>
Message-ID: <4898adb0-1253-6636-2b4b-f45ec48ac844@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 19/04/2018 ? 22:54, Thomas Petazzoni a ?crit?:
> Hello Romain,
> 
> On Wed, 18 Apr 2018 21:19:12 +0200, Romain Naour wrote:
> 
>> From [1]:
>> "add_library() and add_executable() commands can now be called without
>>  any sources and will not complain as long as sources are added later
>>  via the target_sources() command."
> 
> I must be misunderstanding something then. The code currently is:
> 
> add_library(flann_cpp SHARED "")
> 
> So it has no source code, and this works fine with CMake < 3.11. And
> you're saying that it's only in CMake >= 3.11 that having no source
> code is valid.

Well, it seems a bug in CMake < 3.11.

> 
> And you fix that by adding a dummy source code file. I'm totally
> confused here.

So do I. I don't understand how it can work with older CMake.

> Also, why do they build a library with nothing inside ? Does it make
> sense ?

The library is created by linking with the flann_cpp_s static library with this
line:

target_link_libraries(flann_cpp -Wl,-whole-archive flann_cpp_s
-Wl,-no-whole-archive)

If you try to use "add_library(flann_cpp SHARED ${CPP_SOURCES})" (as it should
be normally done), the link fail due to already defined symbol.

They are building the shared version using the static library "to speedup the
build time":

https://github.com/mariusmuja/flann/commit/0fd62b43be2fbb0b8d791ee36290791224dc030c

Alpinelinux removed/commented retentively this part of the CMake code:
https://github.com/alpinelinux/aports/commit/fe5137a340af202cefe6b67601af0133b6b660bd

Best regards,
Romain

> 
> Thanks,
> 
> Thomas
> 
