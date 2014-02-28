From: Thierry Bultel <tbultel@free.fr>
Date: Fri, 28 Feb 2014 11:42:54 +0100
Subject: [Buildroot] Using same headers as kernel
Message-ID: <5310682E.7050504@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

currently, it is possible to select the kernel version as same as 
headers, through the BR2_LINUX_KERNEL_SAME_AS_HEADERS
I would like to invert that logic, I found more convenient and intuitive 
to aim a kernel version, and say that the toolchain
is built with the headers for that version.

Moreover, it is currently not feasible to choose kernel headers from a 
git location, thus the user has to manually create a snapshot.

I have a patch, that works ... almost.
It consists of adding a BR2_LINUX_HEADERS_SAME_AS_KERNEL (that makes the 
BR2_LINUX_KERNEL_SAME_AS_HEADERS unselectable of course),
copying dl/source/version definitions from linux.mk,
and add a dependency to linux-patch in linux-headers.mk, a little glue, 
and it basically does the job.

But, when the Xenomai extension is selected, then "linux" depends on it, 
and things are doing bad.
Namely xenomai (indirectly) depends on linux-headers (the chain is 
xenomai->udev->linux-utils->busybox),
leading to a chicken and egg situation.

I would not have that problem, if the dependencies were more ~layered~, 
I mean, if linux-patch was depending on xenomai-patch
instead of the whole package build.

By the way, why is the order for execution:

source, depends, extract, patch

Could that be:

source, extract, patch, depends

instead ?

How could I workaround the problem I have, without being to intrusive in 
the existing logics ?

Regards
Thierry

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140228/a7366465/attachment.html>
