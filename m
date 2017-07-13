From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 14 Jul 2017 00:10:39 +0200
Subject: [Buildroot] [PATCH] package/lshw: fix the build with glibc
	without NLS
In-Reply-To: <20170713232813.4fd0c83e@windsurf>
References: <20170713210424.18934-1-romain.naour@gmail.com>
 <20170713232813.4fd0c83e@windsurf>
Message-ID: <18d648a6-f276-da68-d99a-62cf2e54d33a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 13/07/2017 ? 23:28, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Thu, 13 Jul 2017 23:04:24 +0200, Romain Naour wrote:
>> Since [1], NONLS is added to LSHW_CFLAGS even for glibc based toolchain.
>> Previously it was not the case since BR2_ENABLE_LOCALE is always
>> selected for glibc based toolchain.
>>
>> With NONLS, config.h try to redefine two Intl function (textdomain and
>> bindtextdomain) that are used by glibc internally.
>>
>> This break the build with the following error:
>> sysroot/usr/include/libintl.h:82:52: error: expected unqualified-id before 'throw'
>>  extern char *textdomain (const char *__domainname) __THROW;
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/9bf/9bf5437b4348ea8077013b80a51ce05fa328247d
>>
>> [1] 3acd9f845de0489071719d52d774aab48d7f9c33
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> 
> I also had a look at this issue, and I'm not sure this is the most
> appropriate fix.
> 
> Indeed, the NONLS mode is really for cases where the C library does not
> provide *any* gettext implementation, as would be the case with uClibc
> without intl stubs enabled.
> 
> But in the context of Buildroot, all C libraries provide a gettext
> implementation. It might be full-featured or minimal, but it always
> exists.
> 
> Therefore, I believe the appropriate fix is to in fact never pass
> -DNONLS, because we are never in a situation where we don't have any
> NLS support at all. So I believe the right fix is to remove the
> following three lines:
> 
> ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
> LSHW_CFLAGS += -DNONLS
> endif

Indeed, that's the first thing I removed during investigation.

I find misleading that BR2_SYSTEM_ENABLE_NLS not set does not mean NONLS for lshw.

I'm wondering if lshw build fine with a toolchain with wchar but without locale
(ok it's a corner case).

See src/lshw.cc:#ifndef NONLS

#ifndef NONLS
#include <locale.h>
#endif

...

#ifndef NONLS
  setlocale (LC_ALL, "");
  ...
#endif

Best regards,
Romain

> 
> Best regards,
> 
> Thomas
> 
