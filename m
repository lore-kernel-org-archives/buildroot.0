From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Apr 2016 20:27:15 +0200
Subject: [Buildroot] [PATCH v2] yajl: fix static linking in a parallel
	build
In-Reply-To: <1460240125-2981-1-git-send-email-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?= Krause"'s message of "Sun, 10 Apr 2016 00:15:25
 +0200")
References: <1460240125-2981-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <877ffyhgn0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > The yajl build system contains a race condition, which gets triggered by
 > high BR2_JLEVEL settings - It tries to link the executable gen-extra-close
 > against the shared libyajl before it is created:

 > [ 21%] Linking C executable gen-extra-close
 > [ 26%] Building C object src/CMakeFiles/yajl_s.dir/yajl_buf.c.o
 > /home/test/autobuild/instance-3/output/host/opt/ext-toolchain/bfin-uclinux/bfin-uclinux/bin/ld.real: cannot find -lyajl

 > Fix this issue by linking gen-extra-close against the shared library in a shared
 > build and the static library otherwise.
 > Apply this to all other build targets from yail who are linking against the
 > library, too.

 > Fixes:
 > http://autobuild.buildroot.net/results/a9b/a9b5209377acb51e69f376e0c008ee71fe00397a/
 > http://autobuild.buildroot.net/results/55f/55fe22463d49addb42b635d10be5176522f4a561/
 > http://autobuild.buildroot.net/results/808/808acca0cfed93465845c2aa055a7a4fc56a8a17/
 > http://autobuild.buildroot.net/results/b92/b92a9c84b71a8a2d022d307245ca6be36a000e6c/
 > http://autobuild.buildroot.net/results/55d/55df698ab53f7d94235166e8576eb681ed68668e/
 > .. and more.

 > Upstream status: Pending
 > https://github.com/lloyd/yajl/pull/187

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
 > ---
 > Changes v1 -> v2:
 >  - conditionally link gen-extra-close against the shared libyajl in a shared
 >    build and against the static libyajl otherwise (Samuel Martin)
 >  - apply this to all other build targets linking against yajl

Committed, thanks.

-- 
Bye, Peter Korsgaard
