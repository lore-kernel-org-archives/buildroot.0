From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Feb 2017 21:03:52 +0100
Subject: [Buildroot] [PATCH] mpd: fix build for ARC
In-Reply-To: <1488301853-24154-1-git-send-email-vzakhar@synopsys.com> (Vlad
 Zakharov's message of "Tue, 28 Feb 2017 20:10:53 +0300")
References: <1488301853-24154-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <87h93ehyl3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vlad" == Vlad Zakharov <Vladislav.Zakharov@synopsys.com> writes:

 > mpd package fails for both internal and external ARC toolchain as check
 > for pthread support fails. Such checks fails because _REENTRANT flag is
 > not defined in gcc even when -pthread is passed.

 > So we add patch to gcc that defines _REENTRANT  on ARC when -pthread is
 > passed.

 > Also it disables mpd package for external ARC toolchain as it fails due
 > to the same issue.

 > This patch should be reverted as soon as the patch for GCC becomes a
 > part of ARC toolchain.

 > Fixes:
 >   http://autobuild.buildroot.net/results/7d7/7d70b62ad996830fbeca46dffcc7a1dc030e575d//

 > Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
 > ---
 >  ...-define-_REENTRANT-when-pthread-is-passed.patch | 33 ++++++++++++++++++++++
 >  package/mpd/Config.in                              |  3 ++
 >  2 files changed, 36 insertions(+)
 >  create mode 100644 package/gcc/arc-2016.09-release/895-arc-define-_REENTRANT-when-pthread-is-passed.patch

 > diff --git a/package/gcc/arc-2016.09-release/895-arc-define-_REENTRANT-when-pthread-is-passed.patch b/package/gcc/arc-2016.09-release/895-arc-define-_REENTRANT-when-pthread-is-passed.patch
 > new file mode 100644
 > index 0000000..28e6a2d
 > --- /dev/null
 > +++ b/package/gcc/arc-2016.09-release/895-arc-define-_REENTRANT-when-pthread-is-passed.patch
 > @@ -0,0 +1,33 @@
 > +From 4c6367c99461fdd7bd5613483f2582d7f08fba87 Mon Sep 17 00:00:00 2001
 > +From: Vlad Zakharov <vzakhar@synopsys.com>
 > +Date: Tue, 28 Feb 2017 17:41:11 +0300
 > +Subject: [PATCH] arc: define _REENTRANT when -pthread is passed
 > +
 > +The compiler is supposed to have the builtin defined _REENTRANT defined
 > +when -pthread is passed, which wasn't done on the ARC architecture.
 > +
 > +When _REENTRANT is not passed, the C library will not use reentrant
 > +functions, and the latest version of ax_pthread.m4 from the
 > +autoconf-archive will no longer detect that thread support is
 > +available (see https://savannah.gnu.org/patch/?8186).

Hmm, who is the author of this? You or Thomas? In any case you should
also sign off on it.

-- 
Bye, Peter Korsgaard
