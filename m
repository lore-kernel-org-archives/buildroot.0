From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Feb 2021 23:16:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/fakeroot: add upstream patches
 to fix glibc 2.33 compatibility
In-Reply-To: <20210215134731.70622-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Mon, 15 Feb 2021 14:47:31 +0100")
References: <20210215134731.70622-1-joerg.krause@embedded.rocks>
Message-ID: <87im6t9dta.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Glibc 2.33 removed `_STAT_VER`. On host machines, which updated to glibc
 > 2.33, building host-fakeroot breaks:

 > ```
 > In file included from communicate.h:20,
 >                  from libfakeroot.c:60:
 > libfakeroot.c: In function ?chown?:
 > libfakeroot.c:99:40: error: ?_STAT_VER? undeclared (first use in this function)
 >    99 | #define INT_NEXT_STAT(a,b) NEXT_STAT64(_STAT_VER,a,b)
 > ```

 > The issue has been discussed on some package maintainer threads, e.g.:
 > https://bugs.archlinux.org/task/69572
 > https://bugzilla.redhat.com/show_bug.cgi?id=1889862#c13

 > A patch series was prepared by Ilya Lipnitskiy which included two other
 > patches not related to the glibc 2.33 compatibility issue and submitted as
 > merge request for upstream:
 > https://www.mail-archive.com/openwrt-devel at lists.openwrt.org/msg57280.html

 > Upstream accepted the merge request:
 > https://salsa.debian.org/clint/fakeroot/-/merge_requests/10

 > Note, that this patch series only contains the necessay patches for glibc
 > 2.33 compatibility.

 > Tested on my Arch Linux machine, building a UBIFS/OverlayFS-based root
 > filesystem for an i.MX6ULL target board.

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
 > ---
 >  ...fine-_STAT_VER-if-not-already-define.patch | 45 +++++++++++
 >  ...d-wrappers-for-new-glibc-2.33-symbol.patch | 80 +++++++++++++++++++
 >  ....ac-fix-__xmknod-at-pointer-argument.patch | 66 +++++++++++++++
 >  package/fakeroot/fakeroot.mk                  |  2 +-
 >  4 files changed, 192 insertions(+), 1 deletion(-)
 >  create mode 100644 package/fakeroot/0002-libfakeroot.c-define-_STAT_VER-if-not-already-define.patch
 >  create mode 100644 package/fakeroot/0003-libfakeroot.c-add-wrappers-for-new-glibc-2.33-symbol.patch
 >  create mode 100644 package/fakeroot/0004-configure.ac-fix-__xmknod-at-pointer-argument.patch

 > diff --git a/package/fakeroot/0002-libfakeroot.c-define-_STAT_VER-if-not-already-define.patch b/package/fakeroot/0002-libfakeroot.c-define-_STAT_VER-if-not-already-define.patch
 > new file mode 100644
 > index 0000000000..6a3842d6ca
 > --- /dev/null
 > +++ b/package/fakeroot/0002-libfakeroot.c-define-_STAT_VER-if-not-already-define.patch
 > @@ -0,0 +1,45 @@
 > +From 03bc0ee07fb6e293d081ffd8af1654788b434f6a Mon Sep 17 00:00:00 2001
 > +From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
 > +Date: Thu, 11 Feb 2021 20:59:25 -0800
 > +Subject: [PATCH 2/4] libfakeroot.c: define _STAT_VER if not already defined

NIT: Please use the -N option to git format-patch like
./utils/check-package correctly mentions:

package/fakeroot/0002-libfakeroot.c-define-_STAT_VER-if-not-already-define.patch:4: generate your patches with 'git format-patch -N'
package/fakeroot/0003-libfakeroot.c-add-wrappers-for-new-glibc-2.33-symbol.patch:4: generate your patches with 'git format-patch -N'
package/fakeroot/0004-configure.ac-fix-__xmknod-at-pointer-argument.patch:4: generate your patches with 'git format-patch -N'

I'll fix that when applying.


 > +MIME-Version: 1.0
 > +Content-Type: text/plain; charset=UTF-8
 > +Content-Transfer-Encoding: 8bit
 > +
 > +glibc 2.33 does does declare `_STAT_VER` anymore.
 > +
 > +Based on patch from Jan Pazdziora:
 > +https://lists.fedoraproject.org/archives/list/devel at lists.fedoraproject.org/message/SMQ3RYXEYTVZH6PLQMKNB3NM4XLPMNZO/
 > +
 > +Backported from: feda578ca3608b7fc9a28a3a91293611c0ef47b7

NIT: The "standard" way to mention this is with the -x option to git
cherry-pick like we do on the stable branches. It adds a note with the
upstream commit id:

(cherry picked from commit fd6f7061ca6ef8a2d1bfc67451ee3535c3814f00)

Committed, thanks.

-- 
Bye, Peter Korsgaard
