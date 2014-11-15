From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 15 Nov 2014 19:20:49 +0100
Subject: [Buildroot] [PATCH 1/1] pkg-cmake.mk: Set
	CMAKE_SYSTEM_PROCESSOR.
In-Reply-To: <546792E3.5060007@openwide.fr>
References: <1416067219-30211-1-git-send-email-volker.krause@kdab.com>
 <CAHXCMM+WdJe+pHi4GNi7QT9Vd=43LoRzXhU05byPPZ5uLRT=Ww@mail.gmail.com>
 <546792E3.5060007@openwide.fr>
Message-ID: <CAHXCMMKm5G9VgK4Jj5z711fcPdjLFdhbvFVO0iBaduFT8pCq1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, Volker,

On Sat, Nov 15, 2014 at 6:52 PM, Romain Naour <romain.naour@openwide.fr> wrote:
> Hi Volker,
>
> Le 15/11/2014 18:26, Samuel Martin a ?crit :
>> Hi Volker,
>>
>> On Sat, Nov 15, 2014 at 5:00 PM, Volker Krause <volker.krause@kdab.com> wrote:
>>> This is rarely needed by packages, but convenient to have when it is.
>>>
>
> There is only one package (openpowerlink) that set this variable in buildroot
> and the expected value is "x86" or "x86_64".

Hmm... this is in the openpowerlink source?
I think it'd better do (to be more robust):
---
string(REGEX REPLACE "i*86" "x86" CMAKE_SYSTEM_PROCESSOR
${CMAKE_SYSTEM_PROCESSOR})
---
But that's another story ;-)

>
> Are you sure that the BR2_ARCH can be used by other packages that need
> CMAKE_SYSTEM_PROCESSOR ?

According to CMake doc [1], CMAKE_SYSTEM_PROCESSOR is set to the
output of the command "uname -p" (in fact it is the output of "uname
-m").
This is only true for native compilation.

In the case of cross-compilation, the CMake code does not set anything
[2], it just expects the CMAKE_SYSTEM_* variables to be set in the
toolchain file.

> If so, I can send a patch for openpowerlink to fix that.
>
> Best regards,
> Romain Naour

Regards,


[1] http://www.cmake.org/cmake/help/v3.0/variable/CMAKE_SYSTEM_PROCESSOR.html
[2] http://www.cmake.org/gitweb?p=cmake.git;a=blob;f=Modules/CMakeDetermineSystem.cmake;hb=HEAD#l110

-- 
Samuel
