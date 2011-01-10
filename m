From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Mon, 10 Jan 2011 21:14:20 +0100
Subject: [Buildroot] [PATCH 1/4] Add CMAKETARGETS infrastructure for
	CMake packages
In-Reply-To: <20110110185127.65bdb2e2@surf>
References: <1292182155-29576-1-git-send-email-bjorn.forsman@gmail.com>
	<1292182155-29576-2-git-send-email-bjorn.forsman@gmail.com>
	<20110110185127.65bdb2e2@surf>
Message-ID: <AANLkTi=tqJhKvj8qpn-fyzC+r-VcdY3_9C4uSpzsJpBN@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 10 January 2011 18:51, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Sun, 12 Dec 2010 20:29:12 +0100
> Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:
>
>> + ? ? ? ? ? ? -DCMAKE_SYSTEM_NAME:STRING="Linux" \
>> + ? ? ? ? ? ? -DCMAKE_C_COMPILER:FILEPATH="$$(CMAKE_TARGET_CC)" \
>> + ? ? ? ? ? ? -DCMAKE_CXX_COMPILER:FILEPATH="$$(CMAKE_TARGET_CXX)" \
>> + ? ? ? ? ? ? -DCMAKE_C_FLAGS:STRING="$$(CMAKE_TARGET_CFLAGS)" \
>> + ? ? ? ? ? ? -DCMAKE_CXX_FLAGS:STRING="$$(CMAKE_TARGET_CXXFLAGS)" \
>> + ? ? ? ? ? ? -DCMAKE_EXE_LINKER_FLAGS:STRING="$$(TARGET_LDFLAGS)" \
>> + ? ? ? ? ? ? -DCMAKE_MODULE_LINKER_FLAGS:STRING="$$(TARGET_LDFLAGS)" \
>> + ? ? ? ? ? ? -DCMAKE_SHARED_LINKER_FLAGS:STRING="$$(TARGET_LDFLAGS)" \
>> + ? ? ? ? ? ? -DCMAKE_FIND_ROOT_PATH:PATH="$$(STAGING_DIR)" \
>> + ? ? ? ? ? ? -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM:STRING="NEVER" \
>> + ? ? ? ? ? ? -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY:STRING="ONLY" \
>> + ? ? ? ? ? ? -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE:STRING="ONLY" \
>> + ? ? ? ? ? ? -DCMAKE_INSTALL_PREFIX:PATH="/usr" \
>
> We lack CMAKE_PROGRAM_PATH and CMAKE_INSTALL_SO_NO_EXE in this list. As
> pointed out by others, it'd be great if the infrastructure could use
> the generated CMake toolchain file.

Yes, next version uses the toolchain-file internally. Regarding
CMAKE_PROGRAM_PATH, I'm adding that for target configuration. But for host
configuration I'm trying to use this instead:

CMAKE_FIND_ROOT_PATH=$(HOST_DIR)
CMAKE_FIND_ROOT_PATH_MODE_PROGRAM=BOTH
CMAKE_FIND_ROOT_PATH_MODE_LIBRARY=BOTH
CMAKE_FIND_ROOT_PATH_MODE_INCLUDE=BOTH

Setting CMAKE_PROGRAM_PATH only affects FIND_PROGRAM but the above affects
all of FIND_{PROGRAM,LIBRARY,PATH,FILE} which I think is the right thing
here. What do you think?

> Could you update your patch set and resend ?

Yes, it's on my TODO list :-) But there are some issues I'm still working
on.

I've been experimenting with removing the following flags:

-DCMAKE_EXE_LINKER_FLAGS:STRING="$$(TARGET_LDFLAGS)" \
-DCMAKE_MODULE_LINKER_FLAGS:STRING="$$(TARGET_LDFLAGS)" \
-DCMAKE_SHARED_LINKER_FLAGS:STRING="$$(TARGET_LDFLAGS)" \

as I feel it is not the "CMake"-way of doing it. I mean that
CMAKE_FIND_ROOT_PATH and friends should be enough and that there should be
no need to "micro manage" CMake. However, the only package I've got for
testing which has any sort of external dependency is the cdrkit package and
it fails to build without explicitly adding -Lpath/to/lib to the command
line (which the above does). cdrkit doesn't use FIND_LIBRARY, it just adds
libs as dependencies without looking for them and assumes they will be
found during linking. This must be wrong of cdrkit.

Maybe the linker flags should go only in cdrkit.mk and not in CMAKETARGETS?
A part of me feels that having these extra flags in the framework may hide
bugs in a package CMakeLists.txt file...

If it matters, OE doesn't have linker flags to its cmake.bbclass.

Oh, and speaking of OE (thanks for reminding me of their cmake.bbclass),
they have some interresting settings:

  echo "set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST}
${STAGING_DIR_NATIVE}
${STAGING_DIR_NATIVE}${prefix_native}/${BASE_PACKAGE_ARCH} )" >>
${WORKDIR}/toolchain.cmake
  echo "set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY )" >>
${WORKDIR}/toolchain.cmake
  echo "set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )" >>
${WORKDIR}/toolchain.cmake
  echo "set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )" >>
${WORKDIR}/toolchain.cmake

And they disable ccache. Maybe we should too, as there are issues with
ccache in the current CMAKETARGETS implementation. Or we could symlink
gcc->ccache which I think should fix the issue.

Best regards,
Bj?rn Forsman
