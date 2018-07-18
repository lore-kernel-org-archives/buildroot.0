From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jul 2018 23:47:17 +0200
Subject: [Buildroot] [PATCH v3 1/5] package/gdb: rework dependency for
 C++11
In-Reply-To: <20180624135310.16514-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 24 Jun 2018 15:53:06 +0200")
References: <20180624135310.16514-1-thomas.petazzoni@bootlin.com>
 <20180624135310.16514-2-thomas.petazzoni@bootlin.com>
Message-ID: <87h8kwgqsa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > As we are about to switch to 8.0 as the default gdb dependency, we
 > need to adjust how the gdb dependencies are handled. Indeed, from 8.0
 > onwards, gdb needs a C++11 capable compiler, i.e at least gcc 4.8.

 > Until now, Config.in.host was making sure that gdb 8.0 was not
 > selectable if the cross-compilation toolchain did not have C++ support
 > with gcc >= 4.8. This worked fine because the default version of gdb,
 > used as the target gdb version when no host gdb is built, was 7.11,
 > and did not require C++11.

 > With the switch to 8.0 as the default version, when target gdb is
 > enabled but not host gdb, 8.0 is used, which means we need a C++11
 > capable compiler. The dependencies in Config.in.host are no longer
 > sufficient.

 > So instead, we remove the target-related dependencies from
 > Config.in.host and move them properly to Config.in. The overall logic
 > is the following:

 >  - In Config.in.host, BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS ensures that
 >    we have at least host gcc 4.8 if we're on ARC, because the ARC gdb
 >    needs C++11. We remove the target toolchain related dependencies
 >    from here.

 >  - In Config.in.host, the version selection ensures that 8.0 cannot be
 >    selected if the host toolchain does not have at least gcc 4.8. We
 >    remove the target toolchain related dependencies from here.

 >  - In Config.in.host, we introduce a BR2_PACKAGE_GDB_NEEDS_CXX11
 >    option, that indicates whether the currently selected version of
 >    gdb requires C++11 support in the toolchain to build the target
 >    variant. Even though this option is more related to the target
 >    variant of gdb, we keep it in Config.in.host so that it appears
 >    next to the definition of BR2_GDB_VERSION, to make sure they are
 >    kept in sync.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
