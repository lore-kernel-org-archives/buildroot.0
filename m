From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Mar 2016 16:49:43 +0100
Subject: [Buildroot] [rpi-firmware] I can't find the file
	/usr/sbin/vcdbg after compiling
In-Reply-To: <CALtfCQYaW4JsQiBOC+paK2+gzPVfdOSsKWXr-qBqkv_tXC23sA@mail.gmail.com>
 (=?utf-8?B?IsOTc2NhciBHw7NtZXo=?= Fuente"'s message of "Tue, 15 Mar 2016
 16:07:28 +0100")
References: <CALtfCQYaW4JsQiBOC+paK2+gzPVfdOSsKWXr-qBqkv_tXC23sA@mail.gmail.com>
Message-ID: <87d1qvbv1k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "?scar" == ?scar G?mez Fuente <oscargomezf@gmail.com> writes:

 > Yes, I did both, but I've just checked again and It doesn't work.
 > ../output/target/usr/sbin$ ls
 > addgroup  chroot    deluser   ether-wake  i2cdetect  i2cset    loadfont
 > setlogcons
 > adduser   crond     dnsd      fbset       i2cdump    inetd     rdate
 >  vcfiled
 > arping    delgroup  dropbear  fdformat    i2cget     killall5  readprofile

Sorry, I just had a closer look, and the vcdbg handling logic is broken
:/ I've pushed a fix to current git to correct it:

commit 41276ae12aefb8a3e69df365aa2240d29ddca776
Author: Peter Korsgaard <peter@korsgaard.com>
Date:   Tue Mar 15 16:43:10 2016 +0100

    rpi-firmware: unbreak _INSTALL_VCDBG logic
    
    Commit d16b32a401 (package/rpi-firmware: add option to install vcdbg) added
    a sub option to install the vcdbg tool, but the commit unfortunately
    contained two errors:
    
    - The package sets _INSTALL_TARGET = NO, so the _TARGET_CMDS are never used
    - The install command used -d (handle arguments as directories) instead of
      -D (create needed directories)
    
    Fix these issues.
    
    Cc: yann.morin.1998 at free.fr
    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Venlig hilsen,
Peter Korsgaard 
