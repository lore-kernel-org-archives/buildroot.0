From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jun 2016 21:54:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/libmicrohttpd: Fix pthread
	detection on bfin and arc
In-Reply-To: <1466079586.18286.17.camel@synopsys.com> (Vlad Zakharov's message
 of "Thu, 16 Jun 2016 12:19:46 +0000")
References: <1465846126-19316-1-git-send-email-bernd.kuhls@t-online.de>
 <1466079586.18286.17.camel@synopsys.com>
Message-ID: <87wpl9ks1j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vlad" == Vlad Zakharov <Vladislav.Zakharov@synopsys.com> writes:

Hi,

 >> +++ b/package/libmicrohttpd/0001-pthread-reentrant.patch
 >> @@ -0,0 +1,31 @@
 >> +Fix pthread detection
 >> +
 >> +The latest version bump included an update to m4/ax_pthread.m4 from
 >> +GNU autoconf which changed the way configure looks for pthread support.
 >> +
 >> +On Linux the macro _REENTRANT is now being searched for:
 >> +https://github.com/peti/autoconf-archive/commit/39683064bbccb4008f239262cb681a970bf53603#diff-851a07ee321dc42003ac94cf4a9628faR211
 >> +which fails at least on arc and blackfin.
 >> +
 >> +Before the autoconf update _REENTRANT was not searched on Linux:
 >> +https://github.com/peti/autoconf-archive/commit/39683064bbccb4008f239262cb681a970bf53603#diff-851a07ee321dc42003ac94cf4a9628faL273
 >> +
 >> +This patch removes the check for the Linux platform by patching the
 >> +configure script directly to avoid an autoreconf run.
 >> +
 >> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 >> +(Problem reported upstream:
 >> + https://savannah.gnu.org/patch/?8186#comment24)
 >> +
 >> +diff -uNr libmicrohttpd-0.9.50.org/configure libmicrohttpd-0.9.50/configure
 >> +--- libmicrohttpd-0.9.50.org/configure	2016-06-02 10:03:29.000000000 +0200
 >> ++++ libmicrohttpd-0.9.50/configure	2016-06-13 21:11:36.688144929 +0200
 >> +@@ -13761,7 +13761,7 @@
 >> + # correctly enabled
 >> +?
 >> + case $host_os in
 >> +-????????darwin* | hpux* | linux* | osf* | solaris*)
 >> ++????????darwin* | hpux* | osf* | solaris*)
 >> +?????????ax_pthread_check_macro="_REENTRANT"
 >> +?????????;;
 >> +?

 > I applied this patch on upstream master (git-id:
 > 55bf6034d440ccc91c7d7c914dbc040c8264b6bf). The problem with
 > libmicrohttpd build is fixed by
 > this patch.

 > Are there any comments or remarks about the patch??

It is pretty icky to directly patch configure (E.G. what to do if we
need to autoreconf it in the future?)

The comment upstream (https://savannah.gnu.org/patch/?8186#comment25)
hints that it is rather a bug in the arc compiler. Do you know why gcc
for arc doesn't define _REENTRANT when -pthread is passed?

-- 
Venlig hilsen,
Peter Korsgaard 
