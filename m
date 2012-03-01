From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  1 Mar 2012 10:46:23 +0000 (UTC)
Subject: [Buildroot] [Bug 4808] ccache may build against wrong zlib
In-Reply-To: <bug-4808-163@https.bugs.busybox.net/>
References: <bug-4808-163@https.bugs.busybox.net/>
Message-ID: <20120301104623.7CAF790BF5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4808

--- Comment #4 from Ra?l S?nchez Siles <rsanchezs@infoglobal.es> 2012-03-01 10:46:23 UTC ---
Hello:

I think I have a more consistent theory about this problem. But I'm not sure by
now how to solve it correctly.
The thing is that as I've mentioned before, host-ccache is build using rpath
that points to the buildroot host-zlib, so buildroot zlib is preferred over the
system one. Once I removed the rpath it didn't work as well, since the
configure command enviroment includes:
LD_LIBRARY_PATH="/home/rasasi/repos/mcv_buildroot/output/host/usr/lib:" which
again preferres buildroot host-zlib.

This problem arises when your system zlib is newer than the one provided in
buildroot because ccache is built against system zlib and not against buildroot
zlib (it wasn't ready yet).

When ccache is not working, the host build system detection fails. config.guess
returned x86_64-unknown-linux-, the part missing after the last dash should
have been gnu (or uCLinux for target system in our case). Without this latter
part config.sub failed. This is what can be seen in my previous log.

The easiest solution I may think of is backporting the zlib upgrade to the
buildroot version I'm using 2011.8. But this is odd, since we are expecting
this buildroot is able to build (and work) for a certain product lifetime.

Other options would be:
  ? Forcing host-zlib to be build on a early stage without using ccache, as
Thomas suggested
  ? Rebuilding ccache once host-zlib is build

HTH,

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
