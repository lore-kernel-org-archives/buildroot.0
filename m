From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 16:49:49 +0100
Subject: [Buildroot] [PATCH v2] infra/pkg-cmake: use an
 obviously-invalid value for CMAKE_SYSTEM_VERSION
In-Reply-To: <20190115210729.6014-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Tue, 15 Jan 2019 22:07:29 +0100")
References: <20190115210729.6014-1-yann.morin.1998@free.fr>
Message-ID: <87womudpia.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > In 36568732e4, we expanded toolchain.cmake to also define the value for
 > CMAKE_SYSTEM_VERSION, as the cmake documentation states that it must be
 > manually defined when doing cross-compilation [0]:

 >     When the CMAKE_SYSTEM_NAME variable is set explicitly to enable
 >     cross compiling then the value of CMAKE_SYSTEM_VERSION must also
 >     be set explicitly to specify the target system version.

 > However, the fix in 36568732e4 uses the version of the kernel headers,
 > assuming that would be the oldest kernel we could run on. Yet, this is
 > not the case, because glibc (for example) has fallbacks to support
 > running on kernels older than the headers it was built against.

 > The cmake official wiki [1] additionally states:

 >   * CMAKE_SYSTEM_VERSION : optional, version of your target system, not
 >     used very much.

 > Folllowed a little bit below, by:

 >   * CMAKE_TOOLCHAIN_FILE : absolute or relative path to a cmake script
 >     which sets up all the toolchain related variables mentioned above

 >     For instance for crosscompiling from Linux to Embedded Linux on PowerPC
 >     this file could look like this:

 >         # this one is important
 >         SET(CMAKE_SYSTEM_NAME Linux)
 >         #this one not so much
 >         SET(CMAKE_SYSTEM_VERSION 1)

 >     [...]

 > Furthermore, using the kernel headers version can be a bit misleading (as
 > it really looks like is is the correct version to use when it is not),
 > while it is obvious that 1 is not really the output of `uname -r` and
 > thus is definitely not misleading.

 > Finally, random searches [2] about CMAKE_SYSTEM_VERSION, mostly only
 > turns up issues related with Windows, Mac-OS, and to a lesser extent,
 > Android (where it is forcibly set to 1), with issues realted to running
 > under just Linux (as opposed to Adnroid) mostly non-existent.

 > Consequently, we revert to using the value that is suggested in the
 > cmake WiKi, i.e. 1, and which is basically what we also used as a
 > workaround in the azure-iot-sdk-c paclkage up until d300b1d3b1.

 > A case were we will need to have a real kernel version, is if we one day
 > have a cmake-based pacakge that builds and installs a kernel module [3],
 > because it will need the _running_ kernel version to install it in
 > /lib/modules/VERSION/, but in that case it will anyway most probably
 > not be the headers version.

 > [0] https://cmake.org/cmake/help/v3.8/variable/CMAKE_SYSTEM_VERSION.html
 > [1] https://gitlab.kitware.com/cmake/community/wikis/doc/cmake/CrossCompiling
 > [2] https://duckduckgo.com/?q=CMAKE_SYSTEM_VERSION
 > [3] https://stackoverflow.com/questions/38205745/cmake-system-version-not-updated-for-new-kernel

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Samuel Martin <s.martin49@gmail.com>
 > Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 > ---
 > Changes v1 -> v2:
 >   - directly hard-code the condtant in toolchainfile.cmake.in  (Thomas)

 > Arnout, despite the change, I kept your acked-by tag; I believe that was
 > appropriate, as you explained why you acked it, and that condition has
 > not changed. I hope that is OK.

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
