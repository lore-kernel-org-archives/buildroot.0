From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 08 Aug 2017 20:33:49 +0000
Subject: [Buildroot] [Bug 10141] Squashfs extended attribute failures
In-Reply-To: <bug-10141-163@https.bugs.busybox.net/>
References: <bug-10141-163@https.bugs.busybox.net/>
Message-ID: <bug-10141-163-E5PqiZMv5g@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10141

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|unassigned at buildroot.uclibc |yann.morin.1998 at free.fr
                   |.org                        |
             Status|NEW                         |ASSIGNED

--- Comment #5 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Clayton, All,

So I've made a little Makefile to help investigate the issue. Usign a
Makefile is definitely not required, but it help with parallel stuff,
just to create the files (note that it takes quite a lot of space on
the disk, more than 4GiB):

    MKSQUASHFS ?= mksquashfs
    SQSH_JOBS ?= 512

    FILES := $(patsubst %,toto/%,$(shell seq 1 1024))
    DIRS := $(patsubst %,titi/%,$(shell seq 1 1024))

    all: titi.sqsh
    rules: $(FILES)

    titi.sqsh: $(DIRS)
        $(MKSQUASHFS) titi $(@) -noappend -processors $(SQSH_JOBS) >/dev/null

    toto/%:
        @mkdir -p toto
        @dd if=/dev/urandom of=$(@) bs=4096 count=1 2>/dev/null

    $(DIRS): $(FILES)

    titi/%:
        @mkdir -p titi
        @cp -a toto $(@)
        @chattr -R +A $(@)


And I call it like that (where 'O' is my out-of-tree build directory):

    ~/dev/O/host/bin/fakeroot make -j 1000
MKSQUASHFS=~/dev/O/host/bin/mksquashfs

It is using the fakeroot and the mksquashfs as built by Buildroot, and
I'm able to reproduce the issue; the failing files change with each run,
due to scheduling ordering, but the number of failures is roughly always
the same, around 10 failures for each runs, sometimes one or two less,
sometimes a few more, but rarely above 12 or under 9.

    llistxattr for titi/214/419 failed in read_attrs, because Unknown error
-193619184.  Ignoring
    llistxattr for titi/321/41 failed in read_attrs, because Unknown error
-193619184.  Ignoring
    llistxattr for titi/381/586 failed in read_attrs, because Unknown error
-193619184.  Ignoring
    llistxattr for titi/461/579 failed in read_attrs, because Unknown error
-193619184.  Ignoring
    llistxattr for titi/491/992 failed in read_attrs, because Unknown error
-193619184.  Ignoring
    llistxattr for titi/558/989 failed in read_attrs, because Unknown error
-193619184.  Ignoring
    llistxattr for titi/608/1022 failed in read_attrs, because Unknown error
-193619184.  Ignoring
    llistxattr for titi/769/843 failed in read_attrs, because Unknown error
-193619184.  Ignoring
    llistxattr for titi/816/899 failed in read_attrs, because Unknown error
-193619184.  Ignoring
    llistxattr for titi/832/714 failed in read_attrs, because Unknown error
-193619184.  Ignoring


                     |        fakeroot    |
                     | Buildroot | Ubuntu | no fakeroot
---------------------+----------------------------------
mksquashfs Buildroot |   KO      |   KO   |    OK
mksquashfs Ubuntu    |   KO      |   KO   |    OK

So it really is fakeroot that is causing the issues... :-/
No idea how to investigate further for now...

Note: I was never able to run with more than about -processors 1019, or
mksquashfs would fail at startup. 512 is anyway way above the 8 CPUs I
have... Yet, it's enough to cause the failures, so job done.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
