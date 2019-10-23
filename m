From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 23 Oct 2019 20:47:24 +0000
Subject: [Buildroot] [Bug 12276] make clean/distclean does not remove
 BR2_DL_DIR and BR2_HOST_DIR
In-Reply-To: <bug-12276-163@https.bugs.busybox.net/>
References: <bug-12276-163@https.bugs.busybox.net/>
Message-ID: <bug-12276-163-poNFLM18yg@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12276

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WORKSFORME
             Status|NEW                         |RESOLVED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
For BR2_DL_DIR, this is clearly an intended behavior.

However, for BR2_HOST_DIR, it does remove it properly. See:

$ grep ^BR2_HOST_DIR .config
BR2_HOST_DIR="/tmp/foobar-host"

$ ls /tmp/foobar-host/
arm-buildroot-linux-uclibcgnueabi  bin  etc  include  lib  lib64  opt  share 
usr

$ make clean
rm -rf /home/thomas/projets/buildroot/output/target
/home/thomas/projets/buildroot/output/images /tmp/foobar-host
/home/thomas/projets/buildroot/output/host \
        /home/thomas/projets/buildroot/output/build
/home/thomas/projets/buildroot/output/staging \
        /home/thomas/projets/buildroot/output/legal-info
/home/thomas/projets/buildroot/output/graphs

$ ls /tmp/foobar-host/
ls: cannot access '/tmp/foobar-host/': No such file or directory

I used "make clean", but "make distclean" implies "make clean".

So I think it all works as intended.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
