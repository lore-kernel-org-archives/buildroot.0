From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 4 Aug 2016 22:34:35 +0200
Subject: [Buildroot] [PATCH] package/lshw: fix musl build
In-Reply-To: <20160804200947.64225ece@free-electrons.com>
References: <1470327886-29273-1-git-send-email-romain.naour@gmail.com>
 <20160804183732.7319a9c8@free-electrons.com>
 <e2ca8dfa-5826-a478-7cec-c53a2da44df5@gmail.com>
 <20160804200947.64225ece@free-electrons.com>
Message-ID: <424edffc-502e-c9f5-d5cb-b951b0c62832@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 04/08/2016 ? 20:09, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Thu, 4 Aug 2016 19:09:25 +0200, Romain Naour wrote:
> 
>> Actually, I get an error on basename from sysfs.cc
>>
>> sysfs.cc: In function ?std::string sysfs_getbustype(const string&)?:
>> sysfs.cc:103:41: error: invalid conversion from ?const char*? to ?char*?
>> [-fpermissive]
>>        "/devices/" + basename(path.c_str());
>>
>> The cast in dasd is not necessary.
> 
> Are you sure it's musl related, and not gcc version related? A
> -fpermissive error typically indicates that the compiler has become
> stricter than it used to be.

It seems related to musl. lshw build fine with a toolchain with gcc 5.

I'm not a glibc expert but it seems that glibc accept a char * or const char *
as filename argument, see string.h from glibc:

#  ifdef __CORRECT_ISO_CPP_STRING_H_PROTO
extern "C++" char *basename (char *__filename)
     __THROW __asm ("basename") __nonnull ((1));
extern "C++" const char *basename (const char *__filename)
     __THROW __asm ("basename") __nonnull ((1));
#  else
extern char *basename (const char *__filename) __THROW __nonnull ((1));
#  endif
# endif

The musl version doesn't support the const char * prototype.

Also, the lshw code expect the GNU version of basename(). But this version is
not available from string.h when C++ is used.

See string.h from musl:
#ifndef __cplusplus
char *basename();
#endif

That's the issue reported by autobuilders, so the only way is to use the POSIX
basename() if we want to use lshw with musl.

Upstream fixed a similar issue in src/core/pci.cc using the POSIX basename() [1]
and a cast from const char * to char * to avoid invalid conversion.

Thought ?

Best regards,
Romain

[1] https://github.com/lyonel/lshw/commit/cd690bff1516b40fecd5ec4a7f6619e5bffc3cf0

> 
> Thomas
> 
