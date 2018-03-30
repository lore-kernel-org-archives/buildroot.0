From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 30 Mar 2018 21:57:26 +0200
Subject: [Buildroot] Make C and CXX compiler cache in
 toolchainfile.cmake.in
In-Reply-To: <000001d3c425$31ba3fc0$952ebf40$@gmx.de>
References: <000001d3c425$31ba3fc0$952ebf40$@gmx.de>
Message-ID: <8fa283f1-a304-5f8f-54a2-24fc103afc8c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-03-18 12:36, Michael Dick wrote:
> Hello,
> 
> I am using buildroot to create my custom gcc toolchain and sysroot for a
> raspberry pi.
> 
> ?
> 
> Therefore, I call cmake with a script to configure my project. After that, I
> import the project into qtcreator.
> 
> The problem is, that C and CXX compiler variables are not cached into cmake
> cache, so when importing the project, qtcreator calling cmake is not aware oft
> he configured compiler.
> 
> ?
> 
> My suggestion ist o use this patch. Is there any reason why the compilers are
> not cached?

 Sounds to me like a good idea.

 Let's add Yann, Samuel and Luca in Cc as CMake experts :-P For their
convenience, here is the patch inline:

> --- /tmp/toolchainfile.cmake.in.orig    2018-03-25 12:32:03.353000419 +0200
> +++ /tmp/toolchainfile.cmake.in 2018-03-25 12:32:52.647000419 +0200
> @@ -58,8 +58,8 @@
>  set(ENV{PKG_CONFIG_SYSROOT_DIR} "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
>  
>  # This toolchain file can be used both inside and outside Buildroot.
> -set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC@@")
> -set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX@@")
> +set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC@@" CACHE STRING "C Compiler")
> +set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX@@" CACHE STRING "CXX Compiler")
>  if(@@TOOLCHAIN_HAS_FORTRAN@@)
>    set(CMAKE_Fortran_FLAGS_DEBUG "" CACHE STRING "Debug Fortran FLAGS")
>    set(CMAKE_Fortran_FLAGS_RELEASE " -DNDEBUG" CACHE STRING "Release Fortran FLAGS")


 Michael, could you resubmit as a proper patch with commit log and
Signed-off-by? See [1].

 Regards,
 Arnout

[1] https://buildroot.org/downloads/manual/manual.html#submitting-patches

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
