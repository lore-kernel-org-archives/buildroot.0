From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 06 May 2018 22:18:05 +0200
Subject: [Buildroot] [PATCH] binutils: replace hard-links with
 soft-links to fix rpath
In-Reply-To: <20180422122350.16293-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 22 Apr 2018 14:23:50 +0200")
References: <20180422122350.16293-1-thomas.petazzoni@bootlin.com>
Message-ID: <876040pmgy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > binutils installs its binaries both as bin/<tuple>-<tool> and as
 > <tuple>/bin/<tool>, and hardlinks are used to reduce disk space
 > consumption. This causes a problem for host-binutils with our rpath
 > fixing logic done by "make sdk".

 > Indeed, the fix-rpath script starts by fixing up the rpath of
 > bin/<tuple>-<tool>, and sets the RPATH to $ORIGIN/../lib/. Then
 > fix-rpath moves on to <tuple>/bin/<tool>, and doesn't find the library
 > the tool depends on, and clears the RPATH. The result is that the
 > binutils tool are not usable.

 > Note that this is only visible currently on the ARC architecture,
 > because on this architecture, binutils is fetched from git, which
 > causes host-flex to be built, and some binutils tools to use the libfl
 > shared library. Therefore, the binutils tools don't use just the
 > standard C library (which is provided by the system) but also libfl
 > from $(HOST_DIR)/lib, and therefore if the RPATH isn't set correctly,
 > those tools don't work properly.

 > In order to address this, this comit adds a post-install hook to
 > host-binutils that replaces those hard links by symbolic links. It is
 > worth mentioning that library loading and RPATH usage occurs *after*
 > resolving the symbolic links, which makes this solution work.

 > Fixes:

 >   http://autobuild.buildroot.net/results/b2562b05d397d4e1ffe0f8d2f4ce4c84ab6feae1/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
