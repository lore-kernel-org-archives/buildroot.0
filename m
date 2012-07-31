From: Will Newton <will.newton@gmail.com>
Date: Tue, 31 Jul 2012 11:31:20 +0100
Subject: [Buildroot] [PATCH] sysprof: New package.
In-Reply-To: <20120731110420.76490dd1@skate>
References: <CAFbHwiTWnB+EtB=Du5bkAa7mtKfJ7nHeyWGshpq7Rcvjf9O__g@mail.gmail.com>
 <20120730235830.27770869@skate> <20120731110420.76490dd1@skate>
Message-ID: <CAFbHwiQTT6rojCNvBNSUYierq5mrOkMmQfC95yxz1vK4gocCNA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 31, 2012 at 10:04 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

Hi Thomas,

> Hello Will,
>
> Le Mon, 30 Jul 2012 23:58:30 +0200,
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :
>
>> Le Fri, 27 Jul 2012 16:26:23 +0100,
>> Will Newton <will.newton@gmail.com> a ?crit :
>>
>> > Signed-off-by: Will Newton <will.newton@imgtec.com>
>>
>> Applied, thanks. I did some changes to the package, though:
>>
>>      - add dependencies on the supported architectures to avoid build
>>        failures on ARM and other unsupported arches
>>      - add a patch that removes an useless warning about the kernel
>>        version. This patch is present upstream. However since it
>>        modifies configure.ac, we need to autoreconf the package.
>>      - change AUTOTARGETS to autotools-package
>
> Unfortunately, the sysprof package has a number of build problems on
> x86 and ppc. See:
>
> http://autobuild.buildroot.org/results/60728435af0221548c817cc8771674cc088e4d10/build-end.log
> http://autobuild.buildroot.org/results/2d0ce96b30d32992d8f55f3a5974a81bbdb88915/build-end.log
>
> It has been causing quite a few build failures since I merged the
> package, so it would be good to fix those.

Would something like the below be acceptable? It's not very clean but
until uClibc supports this define I don't know if there is a better
alternative.


uClibc does not define NT_GNU_BUILD_ID like glibc, so add a
definition here until uClibc catches up.

Signed-off-by: Will Newton <will.newton@imgtec.com>
---
 package/sysprof/sysprof-02-uclibc-build-id.patch |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 package/sysprof/sysprof-02-uclibc-build-id.patch

diff --git a/package/sysprof/sysprof-02-uclibc-build-id.patch
b/package/sysprof/sysprof-02-uclibc-build-id.patch
new file mode 100644
index 0000000..932eba1
--- /dev/null
+++ b/package/sysprof/sysprof-02-uclibc-build-id.patch
@@ -0,0 +1,14 @@
+diff -u sysprof-1.1.8.old/elfparser.c sysprof-1.1.8/elfparser.c
+--- sysprof-1.1.8.old/elfparser.c	2012-07-23 15:32:14.076213706 +0100
++++ sysprof-1.1.8/elfparser.c	2012-07-23 15:33:49.092091443 +0100
+@@ -21,6 +21,10 @@
+ #include <sys/mman.h>
+ #include "elfparser.h"
+
++#ifndef NT_GNU_BUILD_ID
++#define NT_GNU_BUILD_ID 3
++#endif
++
+ typedef struct Section Section;
+
+ struct ElfSym
-- 
1.7.1
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-sysprof-Add-patch-to-enable-building-with-uClibc.patch
Type: application/octet-stream
Size: 1220 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120731/91c5d1ef/attachment.obj>
