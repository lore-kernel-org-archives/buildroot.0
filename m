From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 May 2020 23:23:39 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/mfgtools: bump to version
 1.3.154
In-Reply-To: <20200519230845.447c80c6@windsurf.home>
References: <20200413214249.206017-1-joerg.krause@embedded.rocks>
 <20200519230845.447c80c6@windsurf.home>
Message-ID: <20200519232339.7ceb0228@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 19 May 2020 23:08:45 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> This is missing host-bzip2, otherwise the build fails with:
> 
> CMake Error at /home/br-user/output/host/share/cmake-3.15/Modules/FindPackageHandleStandardArgs.cmake:137 (message):
>   Could NOT find BZip2 (missing: BZIP2_LIBRARIES BZIP2_INCLUDE_DIR)
> Call Stack (most recent call first):
>   /home/br-user/output/host/share/cmake-3.15/Modules/FindPackageHandleStandardArgs.cmake:378 (_FPHSA_FAILURE_MESSAGE)
>   /home/br-user/output/host/share/cmake-3.15/Modules/FindBZip2.cmake:63 (FIND_PACKAGE_HANDLE_STANDARD_ARGS)
>   libuuu/CMakeLists.txt:6 (find_package)
> 
> It also fails to build without host-openssl:
> 
> -- Could NOT find OpenSSL, try to set the path to OpenSSL root folder in the system variable OPENSSL_ROOT_DIR (missing: OPENSSL_CRYPTO_LIBRARY OPENSSL_INCLUDE_DIR) 
> CMake Error: The following variables are used in this project, but they are set to NOTFOUND.
> Please set them or make sure they are set and tested correctly in the CMake files:
> OPENSSL_CRYPTO_LIBRARY (ADVANCED)
>     linked by target "uuu" in directory /home/br-user/output/build/host-mfgtools-1.3.154/uuu
> OPENSSL_SSL_LIBRARY (ADVANCED)
>     linked by target "uuu" in directory /home/br-user/output/build/host-mfgtools-1.3.154/uuu
> 
> But looking more at the source code, uuu/CMakeLists.txt is checking for
> openssl, but the code in uuu/ does not use it. libuuu/ is using it, and
> makes it conditional.
> 
> This all seems to be pretty broken :-/

Another issue is that mfgtools overwrites CMAKE_CXX_FLAGS:

libuuu/CMakeLists.txt:set(CMAKE_CXX_FLAGS "-O2 ${UUUSSL}")

due to this, we lose the CMAKE_CXX_FLAGS passed on the command line by
Buildroot, which includes -I$(HOST_DIR)/include, and the build of
host-mfgtools does not find the libraries installed in $(HOST_DIR).

I would recommend you to build in a more minimal environment to detect
such issues. Indeed, you have not noticed any of the issue I have
reported because you have bzip2 and openssl installed system-wide.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
