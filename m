From: Volker Krause <volker.krause@kdab.com>
Date: Sun, 16 Nov 2014 12:25:02 +0100
Subject: [Buildroot] [PATCH 1/1] pkg-cmake.mk: Set
	CMAKE_SYSTEM_PROCESSOR.
In-Reply-To: <CAHXCMMKm5G9VgK4Jj5z711fcPdjLFdhbvFVO0iBaduFT8pCq1w@mail.gmail.com>
References: <1416067219-30211-1-git-send-email-volker.krause@kdab.com>
 <546792E3.5060007@openwide.fr>
 <CAHXCMMKm5G9VgK4Jj5z711fcPdjLFdhbvFVO0iBaduFT8pCq1w@mail.gmail.com>
Message-ID: <1923063.8CRfa0qM7P@vkpc9>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Saturday 15 November 2014 19:20:49 Samuel Martin wrote:
> On Sat, Nov 15, 2014 at 6:52 PM, Romain Naour <romain.naour@openwide.fr> 
wrote:
> > Le 15/11/2014 18:26, Samuel Martin a ?crit :
> >> On Sat, Nov 15, 2014 at 5:00 PM, Volker Krause <volker.krause@kdab.com> 
wrote:
> >>> This is rarely needed by packages, but convenient to have when it is.
> > 
> > There is only one package (openpowerlink) that set this variable in
> > buildroot and the expected value is "x86" or "x86_64".

My use-case is packaging GammaRay (https://github.com/KDAB/GammaRay), which 
relies on CMAKE_SYSTEM_PROCESSOR. Setting it via the cmake command line is of 
course possible, but that didn't look like the "clean" solution.

> Hmm... this is in the openpowerlink source?
> I think it'd better do (to be more robust):
> ---
> string(REGEX REPLACE "i*86" "x86" CMAKE_SYSTEM_PROCESSOR
> ${CMAKE_SYSTEM_PROCESSOR})
> ---
> But that's another story ;-)

Right, the usual value of CMAKE_SYSTEM_PROCESSOR for x86 32bit seems to be far 
from well defined. "i*86" is the most common one I've seen on Linux, so 
BR2_ARCH should be fine there in general.

> > Are you sure that the BR2_ARCH can be used by other packages that need
> > CMAKE_SYSTEM_PROCESSOR ?
> 
> According to CMake doc [1], CMAKE_SYSTEM_PROCESSOR is set to the
> output of the command "uname -p" (in fact it is the output of "uname
> -m").
> This is only true for native compilation.
> 
> In the case of cross-compilation, the CMake code does not set anything
> [2], it just expects the CMAKE_SYSTEM_* variables to be set in the
> toolchain file.

I'll submit an updated patch that adds qstrip, and that sets the correct arm 
variant as shown in the x265 patch that Bernd mentioned.

regards,
Volker
