From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 May 2015 15:08:43 +0200
Subject: [Buildroot] [PATCH 2/6] boost: do not allow boost-log on
	PowerPC with uClibc
In-Reply-To: <1431714233-24324-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 15 May 2015 20:23:49 +0200")
References: <1431714233-24324-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1431714233-24324-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87vbfsbrfo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The build of boost-log with a uClibc toolchain on PowerPC fails with
 > some weird C++ issues. Since nobody ever looked into this problem,
 > let's "fix" the autobuilder issue by not allowing to select boost-log
 > in such a situation.

 > Fixes:

 >    http://autobuild.buildroot.net/results/13b43105caf4d3952de70030b51f8d96cf6604ee/
 >    (and many, many similar build failures)

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  package/boost/Config.in | 3 +++
 >  1 file changed, 3 insertions(+)

 > diff --git a/package/boost/Config.in b/package/boost/Config.in
 > index 0ed8dd2..e1b567d 100644
 > --- a/package/boost/Config.in
 > +++ b/package/boost/Config.in
 > @@ -99,6 +99,9 @@ comment "boost-locale needs a toolchain w/ wchar"
 >  config BR2_PACKAGE_BOOST_LOG
 >  	bool "boost-log"
 >  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 > +	# for some reason, uClibc on PowerPC fails to build the boost
 > +	# log module
 > +	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
 
 >  comment "boost-log needs a toolchain w/ NPTL"
 >  	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL

You forgot to add that dependency to the comment below. Committed with
that fixed, thanks.

-- 
Bye, Peter Korsgaard
