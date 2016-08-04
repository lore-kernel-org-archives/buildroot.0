From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 4 Aug 2016 19:09:25 +0200
Subject: [Buildroot] [PATCH] package/lshw: fix musl build
In-Reply-To: <20160804183732.7319a9c8@free-electrons.com>
References: <1470327886-29273-1-git-send-email-romain.naour@gmail.com>
 <20160804183732.7319a9c8@free-electrons.com>
Message-ID: <e2ca8dfa-5826-a478-7cec-c53a2da44df5@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 04/08/2016 ? 18:37, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Thu,  4 Aug 2016 18:24:46 +0200, Romain Naour wrote:
> 
>> +diff --git a/src/core/dasd.cc b/src/core/dasd.cc
>> +index 626b8a8..18d19c3 100644
>> +--- a/src/core/dasd.cc
>> ++++ b/src/core/dasd.cc
>> +@@ -4,6 +4,7 @@
>> + #include <glob.h>
>> + #include <string.h>
>> + #include <fcntl.h>
>> ++#include <libgen.h>
> 
> Is this related?

Yes it is.

Upstream seems to use the POSIX variant of basename which require libgen.h

https://github.com/lyonel/lshw/commit/cd690bff1516b40fecd5ec4a7f6619e5bffc3cf0

> 
>> + #include <unistd.h>
>> + #include <inttypes.h>
>> + #include <sys/ioctl.h>
>> +@@ -42,7 +43,7 @@ bool scan_dasd(hwNode & n)
>> +   {
>> +     for(dev_num=0;dev_num<devices.gl_pathc;dev_num++)
>> +     {
>> +-      dev_name = basename(devices.gl_pathv[dev_num]);
>> ++      dev_name = basename(const_cast<char *>(devices.gl_pathv[dev_num]));
> 
> I'm not super familiar with C++ stuff, but why is this problem musl
> specific? The basename() function is "char *basename(char *)"
> regardless of the C library being used. What makes it error out with
> musl and not with other C libraries?

Actually, I get an error on basename from sysfs.cc

sysfs.cc: In function ?std::string sysfs_getbustype(const string&)?:
sysfs.cc:103:41: error: invalid conversion from ?const char*? to ?char*?
[-fpermissive]
       "/devices/" + basename(path.c_str());

The cast in dasd is not necessary.

Best regards,
Romain

> 
> Thanks,
> 
> Thomas
> 
