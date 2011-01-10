From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Mon, 10 Jan 2011 19:30:16 +0100
Subject: [Buildroot] [PATCH 3/4] Makefile: generate CMake toolchain file
 in $(O)
In-Reply-To: <20110110185013.331f5af1@surf>
References: <1292182155-29576-1-git-send-email-bjorn.forsman@gmail.com>
	<1292182155-29576-4-git-send-email-bjorn.forsman@gmail.com>
	<20110107181536.53713c9a@surf> <20110110185013.331f5af1@surf>
Message-ID: <AANLkTimq86Kw6oCyacEhwE+YpcQa4H8etr49hCAyNz4y@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 10 January 2011 18:50, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello Bjorn,
>
> On Fri, 7 Jan 2011 18:15:36 +0100
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
>
>> diff --git a/Makefile b/Makefile
>> index 831b424..994dd52 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -375,8 +375,11 @@ world: prepare dependencies dirs $(BASE_TARGETS)
>> $(TARGETS_ALL) $(O)/toolchainfile.cmake:
>> ? ? ? ? @echo -en "\
>> ? ? ? ? set(CMAKE_SYSTEM_NAME Linux)\n\
>> + ? ? ? set(CMAKE_PROGRAM_PATH $(HOST_DIR)/usr/bin)\n\
>> ? ? ? ? set(CMAKE_C_COMPILER $(CMAKE_TARGET_CC))\n\
>> ? ? ? ? set(CMAKE_CXX_COMPILER $(CMAKE_TARGET_CXX))\n\
>> + ? ? ? set(CMAKE_C_FLAGS \"$(CMAKE_TARGET_CFLAGS)\")\n\
>> + ? ? ? set(CMAKE_CXX_FLAGS \"$(CMAKE_TARGET_CXXFLAGS)\")\n\
>> ? ? ? ? set(CMAKE_FIND_ROOT_PATH $(STAGING_DIR))\n\
>> ? ? ? ? set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)\n\
>> ? ? ? ? set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)\n\
>>
>> With those, I can successfully use the CMake toolchain file to build a
>> Qt application against the Buildroot libraries.
>>
>> If you agree, could you merge those modifications into your patch ?
>
> It'd be great if you could also add
>
> ? ? ? ?set(CMAKE_INSTALL_SO_NO_EXE 0)
>
> This is related to the executable permission of the shared libraries
> installed by CMake. As explained in Modules/Platform/Linux.cmake, the
> behaviour of CMake depends on the host system: on Debian systems, it
> installs shared libraries without executable permissions, and on Fedora
> systems it installs shared libraries with executable permissions.
>
> In Buildroot, all shared libraries are installed with executable
> permissions, and this fact is used to support stripping of shared
> libraries in the target-finalize target of the main Makefile.
>
> Therefore, we should not rely on CMake default behaviour, and instead
> tell CMake what to do: set the executable permission on the installed
> shared libraries. Which is what is done by setting the above variable.
>
> For reference, this issue has also been raised on OpenEmbedded:
> http://www.mail-archive.com/openembedded-devel at lists.openembedded.org/msg04736.html.

Yes, I'll add that, thanks! I guess it only matters for the target build and
not native build (we don't strip HOST_DIR do we?), but I think I'll add
it to native build anyway, for consistency.

Best regards,
Bj?rn Forsman
