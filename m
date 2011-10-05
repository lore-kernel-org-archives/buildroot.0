From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Oct 2011 20:36:34 +0200
Subject: [Buildroot] Bug in pkg-stats?
In-Reply-To: <ADE657CA350FB648AAC2C43247A983F001F39DCFE877@AUSP01VMBX24.collaborationhost.net>
 (H. Hartley Sweeten's message of "Wed, 5 Oct 2011 12:09:41 -0500")
References: <ADE657CA350FB648AAC2C43247A983F001F39DC56F52@AUSP01VMBX24.collaborationhost.net>
 <ADE657CA350FB648AAC2C43247A983F001F39DCFE6AE@AUSP01VMBX24.collaborationhost.net>
 <20111005084340.204661fb@skate>
 <ADE657CA350FB648AAC2C43247A983F001F39DCFE877@AUSP01VMBX24.collaborationhost.net>
Message-ID: <87sjn7nv4d.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "H" == H Hartley Sweeten <hartleys@visionengravers.com> writes:

Hi,

 H>     version=""

 H>     if grep -m1 "_VERSION" $i > /dev/null ; then
 H> 	version=`grep -m1 "_VERSION" $i | awk '{ print $NF }'`
 H>     else
 H> 	version="unknown"
 H>     fi

 H> This works fine for the packages that have _VERSION defined like:

 H> FOO_VERSION = x.y.z

 H> But it ends up with the whole line when the spaces are missing around the
 H> '='.  Oh well...

You could simply do it awk:

version=$(awk -F'=| ' '/_VERSION/ { print $NF } END { print "unknown" } ' \
          $i | head -n 1)

But it naturally still doesn't work for packages with multiple versions
(like busybox) or where version is major.minor (like glib2).

-- 
Bye, Peter Korsgaard
