From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 22:41:12 +0100
Subject: [Buildroot] [PATCH] azure-iot-sdk-c: Bump to version 2018-12-13
In-Reply-To: <20181221173729.41870-1-Nikita.Sobolev@synopsys.com>
References: <20181221173729.41870-1-Nikita.Sobolev@synopsys.com>
Message-ID: <20181230224112.7884333e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Dec 2018 20:37:29 +0300, Nikita Sobolev wrote:
> From: NikitaSobolev <Nikita.Sobolev@synopsys.com>
> 
> Bump azure-iot-sdk-c to 2018-12-13 release.
> Add patch, that removes Windows specified variables from
> azure-iot-sdk-c-2018-12-13 release. That variables cause
> build errors.
> 
> Signed-off-by: Nikita Sobolev <Nikita.Sobolev@synopsys.com>

So, I looked into this. Indeed, without the patch, the build fails with:

CMake Error at c-utility/CMakeLists.txt:267 (if):
  if given arguments:

    "WIN32" "AND" "(" "VERSION_EQUAL" "10.0.17763.0" "OR" "VERSION_GREATER" "10.0.17763.0" ")"

  Unknown arguments specified

The problem comes from the fact that ${CMAKE_SYSTEM_VERSION} is empty.
And the CMake documentation
(https://cmake.org/cmake/help/v3.4/variable/CMAKE_SYSTEM_VERSION.html)
explains why:

  When the CMAKE_SYSTEM_NAME variable is set explicitly to enable cross
  compiling then the value of CMAKE_SYSTEM_VERSION must also be set
  explicitly to specify the target system version.

We are defining CMAKE_SYSTEM_NAME in our toolchain file, but not
CMAKE_SYSTEM_VERSION.

So for now, I simply defined CMAKE_SYSTEM_VERSION locally in
azure-iot-sdk-c, and dropped the patch. Long term, perhaps we should
define CMAKE_SYSTEM_VERSION in our toolchain file. I'm not sure who is
maintaining our CMake infrastructure these days, Samuel Martin used to
do it, but he is no longer very active.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
