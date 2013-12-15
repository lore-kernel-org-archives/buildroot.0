From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Dec 2013 21:15:20 +0100
Subject: [Buildroot] [PATCH 1/1] smcroute: new package
In-Reply-To: <1386872059-28046-1-git-send-email-mlweber1@rockwellcollins.com>
 (Matt Weber's message of "Thu, 12 Dec 2013 12:14:19 -0600")
References: <1386872059-28046-1-git-send-email-mlweber1@rockwellcollins.com>
Message-ID: <8738ltvpk7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <mlweber1@rockwellcollins.com> writes:

 > Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
 > Signed-off-by: Sean Gerhardt <sagerhar@rockwellcollins.com>
 > ---
 >  package/Config.in            |    1 +
 >  package/smcroute/Config.in   |   11 +++++++++++
 >  package/smcroute/smcroute.mk |   15 +++++++++++++++
 >  3 files changed, 27 insertions(+), 0 deletions(-)
 >  create mode 100755 package/smcroute/Config.in
 >  create mode 100755 package/smcroute/smcroute.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index 40c9e31..fd04224 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -880,6 +880,7 @@ source "package/rtptools/Config.in"
 >  source "package/samba/Config.in"
 >  source "package/sconeserver/Config.in"
 >  source "package/ser2net/Config.in"
 > +source "package/smcroute/Config.in"
 >  source "package/socat/Config.in"
 >  source "package/socketcand/Config.in"
 >  source "package/spawn-fcgi/Config.in"
 > diff --git a/package/smcroute/Config.in b/package/smcroute/Config.in
 > new file mode 100755
 > index 0000000..a66cb94
 > --- /dev/null
 > +++ b/package/smcroute/Config.in
 > @@ -0,0 +1,11 @@
 > +config BR2_PACKAGE_SMCROUTE
 > +	bool "smcroute"
 > +	help
 > +	  SMCRoute is a command line tool to manipulate the multicast
 > +	  routes of a UNI kernel. It supports both IPv4 and IPv6 multicast

I guess that 'UNI' should be 'UNIX'?

 > +	  routing.  SMCRoute can be  used as an alternative to dynamic
 > +	  multicast routers like mrouted or pimd in setups where static
 > +	  multicast routes should be maintained and/or no proper IGMP or
 > +	  MLD signaling exists.
 > +
 > +	  https://github.com/troglobit/smcroute

It looks like it needs to depend on BR2_INET_IPV6:

  CC      mcgroup.o
mcgroup.c: In function 'mcgroup_join_leave_ipv6':
mcgroup.c:119:31: error: 'IPV6_JOIN_GROUP' undeclared (first use in this function)
mcgroup.c:119:31: note: each undeclared identifier is reported only once for each function it appears in
mcgroup.c:119:49: error: 'IPV6_LEAVE_GROUP' undeclared (first use in this function)
make[2]: *** [mcgroup.o] Error 1
make[2]: Leaving directory `/home/peko/source/buildroot/output/build/smcroute-1.99.2/src'

Also don't forget to add a comment if IPV6 isn't available.

-- 
Bye, Peter Korsgaard
