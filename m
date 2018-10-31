From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Oct 2018 12:51:21 +0100
Subject: [Buildroot] [PATCH v2] uclibc: fix mkostemp
In-Reply-To: <20181031110948.6791-1-casantos@datacom.com.br> (Carlos Santos's
 message of "Wed, 31 Oct 2018 08:09:48 -0300")
References: <20181031051918.6obvzpncii5dl3lx@sapphire.tkos.co.il>
 <20181031110948.6791-1-casantos@datacom.com.br>
Message-ID: <87muqubah2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.com.br> writes:

 > Pull a patch already submitted upstream[1] that fixes mkostemp when
 > _LARGEFILE64_SOURCE is defined. This is required to prevent failures
 > on eudev[2]:

 >     # udevadm hwdb --update
 >     Failure writing database //etc/udev/hwdb.bin: Invalid argument

 > 1. https://patchwork.ozlabs.org/patch/990045/
 > 2. https://patchwork.ozlabs.org/patch/984848/

 > Signed-off-by: Carlos Santos <casantos@datacom.com.br>
 > ---
 > Changes v1->v2:
 > - Fix commit message error reported by Baruch Siach.
 > - Improve example.

>  ...4-mkostemp64-clear-flags-as-mkostemp-does.patch | 38 ++++++++++++++++++++++
 >  1 file changed, 38 insertions(+)
 >  create mode 100644 package/uclibc/0004-mkostemp64-clear-flags-as-mkostemp-does.patch

 > diff --git a/package/uclibc/0004-mkostemp64-clear-flags-as-mkostemp-does.patch b/package/uclibc/0004-mkostemp64-clear-flags-as-mkostemp-does.patch
 > new file mode 100644
 > index 0000000000..f87abd8849
 > --- /dev/null
 > +++ b/package/uclibc/0004-mkostemp64-clear-flags-as-mkostemp-does.patch
 > @@ -0,0 +1,38 @@
 > +From 09a776103e4aa75f95c9ad44554a9c2b56de3535 Mon Sep 17 00:00:00 2001
 > +From: Carlos Santos <casantos@datacom.com.br>
 > +Date: Mon, 29 Oct 2018 01:17:38 -0300
 > +Subject: [PATCH] mkostemp64: clear flags, as mkostemp does
 > +
 > +This should have been made in commit 9649721950 but was forgotten.
 > +
 > +Signed-off-by: Carlos Santos <casantos@datacom.com.br>
 > +---
 > + libc/stdlib/mkostemp64.c | 3 ++-
 > + 1 file changed, 2 insertions(+), 1 deletion(-)
 > +
 > +diff --git a/libc/stdlib/mkostemp64.c b/libc/stdlib/mkostemp64.c
 > +index aa9736cd6..f4674bb0c 100644
 > +--- a/libc/stdlib/mkostemp64.c
 > ++++ b/libc/stdlib/mkostemp64.c
 > +@@ -15,9 +15,9 @@
 > +    License along with the GNU C Library; if not, see
 > +    <http://www.gnu.org/licenses/>.  */
 > + 
 > +-#include <fcntl.h>
 > + #include <stdio.h>
 > + #include <stdlib.h>
 > ++#include <fcntl.h>
 > + #include "../misc/internals/tempname.h"
 > + 
 > + /* Generate a unique temporary file name from TEMPLATE.
 > +@@ -27,6 +27,7 @@
 > + int
 > + mkostemp64 (char *template, int flags)
 > + {
 > ++  flags -= flags & O_ACCMODE; /* Remove O_RDONLY, O_WRONLY, and O_RDWR. */

I find the -= instead of &= ~O_ACCMODE kind of odd, but ok - That is
whas the existing code does.

Committed, thanks.

-- 
Bye, Peter Korsgaard
