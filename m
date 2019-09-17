From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 17 Sep 2019 20:02:10 +0000
Subject: [Buildroot] [Bug 12211] host-nodejs 10.15.3 package fail to build
In-Reply-To: <bug-12211-163@https.bugs.busybox.net/>
References: <bug-12211-163@https.bugs.busybox.net/>
Message-ID: <bug-12211-163-1QKJXLHCS0@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12211

--- Comment #2 from Arnout Vandecappelle <arnout@mind.be> ---
Looks like it gets linked with our host-openssl, but the RPATH is missing...

We try to fix this by explicitly adding the rpath in nodejs.mk (cfr. commit
2ebc2219d5716f81789f29dcbb6b05d0c9d886dd), but unfortunately that is apparently
too late because torque does get used during the build of host-nodejs itself...

Short of fixing the horrible nodejs build system, I can't think of an easy way
to get around this issue :-/

Oh, hang on: the call to torque seems to set LD_LIBRARY_PATH to
$(HOST_NODEJS_BUILDDIR)/out/Release/lib.host. So we can copy/symlink the
openssl libraries to that directory before the build...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
