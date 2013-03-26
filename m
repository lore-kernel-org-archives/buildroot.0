From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Mar 2013 17:50:14 +0100
Subject: [Buildroot] No core dump when killed with ABRT, SEGV, etc.
In-Reply-To: <kisi6i$srj$1@ger.gmane.org> (Grant Edwards's message of "Tue, 26
 Mar 2013 16:25:54 +0000 (UTC)")
References: <kisi6i$srj$1@ger.gmane.org>
Message-ID: <87obe685rt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:

 Grant> I get a proper core dump if a program actually causes a segfault, but
 Grant> I can't figure out how to force a coredump by killing a running
 Grant> process.

 Grant> On my desktop machines with glibc, this generates a core dump:

 Grant> tty1:

 Grant>    $ ulimit -c 9999999
 Grant>    $ <start program>

 Grant> tty2:    
 Grant>    $ kill -ABRT <pid>
 
 Grant> On my buildroot system, there's no core dump.  The program is aborted
 Grant> as expected, but it doesn't dump a core file.  If the same program
 Grant> tries to actually dereference a NULL pointer there is a core dump.

 Grant> Why doesn't killing a process with SIGABRT or SIGSEGV cause a core
 Grant> dump?

Are you using busybox init? If so, ensure you have
FEATURE_INIT_COREDUMPS enabled and a /.init_enable_core file in your
rootfs:

config FEATURE_INIT_COREDUMPS
        bool "Support dumping core for child processes (debugging only)"
        default y
        depends on INIT
        help
          If this option is enabled and the file /.init_enable_core
          exists, then init will call setrlimit() to allow unlimited
          core file sizes. If this option is disabled, processes
          will not generate any core files.

-- 
Bye, Peter Korsgaard
