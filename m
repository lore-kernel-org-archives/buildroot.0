From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Aug 2015 15:39:32 +0200
Subject: [Buildroot] [PATCH v2] pacakge/qt5/qt5base: fix build with
 ccache
In-Reply-To: <1440755211-46875-1-git-send-email-benoit@wsystem.com>
References: <1440755211-46875-1-git-send-email-benoit@wsystem.com>
Message-ID: <20150828153932.632bed5e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Fri, 28 Aug 2015 11:46:51 +0200, Beno?t Th?baudeau wrote:
> Building with ccache failed with:
> 
>     Running configuration tests...
>     Failed to process makespec for platform 'devices/linux-buildroot-g++'
>     Project ERROR: Compiler <path_to_output_dir>/host/usr/bin/ccache <path_to_output_dir>/host/usr/bin/<cross_compile>-g++ not found. Check the value of CROSS_COMPILE -device-option
>     Could not read qmake configuration file <path_to_output_dir>/build/qt5base-5.5.0/mkspecs/devices/linux-buildroot-g++/qmake.conf.
>     Error processing project file: /dev/null
> 
> This was caused by Buildroot setting this in
> qt5base-5.5.0/mkspecs/devices/linux-buildroot-g++/qmake.conf:
> 
>     QMAKE_CXX               = $${BR_CCACHE} $${CROSS_COMPILE}g++
> 
> But qt5base-5.5.0/mkspecs/features/device_config.prf expects QMAKE_CXX
> to be a single valid (absolute or QMAKE_PATH_ENV-relative) path to an
> existing file, which is not possible if using ccache as above.
> 
> Add a patch fixing this by testing only the first value in QMAKE_CXX.
> 
> Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
> ---
> Changes v1 -> v2:
>  - Use the first value in QMAKE_CXX instead of removing the whole test.
> ---
>  .../qt5/qt5base/0009-fix-build-with-ccache.patch   | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 package/qt5/qt5base/0009-fix-build-with-ccache.patch

Applied to master after fixing the typo in the commit title. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
