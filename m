From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 11 Jun 2014 21:36:59 +0000 (UTC)
Subject: [Buildroot] [Bug 7172] Name collision of rpath token expansion and
 internal variables
In-Reply-To: <bug-7172-163@https.bugs.busybox.net/>
References: <bug-7172-163@https.bugs.busybox.net/>
Message-ID: <20140611213659.E93039CFBE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7172

--- Comment #11 from Mike Z <minimod@morethan.org> 2014-06-11 21:36:58 UTC ---
Printing the shell significant character(s) into a variable is confirmed
to work at the manual entry shell level.

The Cliff's Notes example:

bin # export INT=`printf '%s'
'/mnt/us/extensions/system/lib/ld-linux-armhf.so.3'`
bin # echo $INT
/mnt/us/extensions/system/lib/ld-linux-armhf.so.3
core2quad bin # patchelf --set-interpreter $INT busybox

bin # export LIB=`printf '%s' '$' 'ORIGIN/../lib' '$' 'ORIGIN/../usr/lib'`
bin # echo $LIB
$ORIGIN/../lib:$ORIGIN/../usr/lib
bin # patchelf --set-rpath $LIB busybox

====

bin # readelf -dl busybox
- - - -
Dynamic section at offset 0x13a180 contains 24 entries:
  Tag        Type                         Name/Value
 0x0000001d (RUNPATH)                    Library runpath:
[$ORIGIN/../lib:$ORIGIN/../usr/lib]

====

[root at kindle root]# echo $PATH
/mnt/us/extensions/system/bin:/usr/local/bin:/bin:/usr/bin:/usr/sbin:/sbin:/usr/local/python/bin

[root at kindle root]# LD_DEBUG=libs busybox
     27571:     find library=libc.so.6 [0]; searching
- - - -
     27571:     calling init: /mnt/us/extensions/system/bin/../lib/libc.so.6
- - - -
BusyBox v1.22.1 (2014-06-11 02:23:01 CDT) multi-call binary.
BusyBox is copyrighted by many authors between 1998-2012.
etc.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
