From: Karl Auerbach <karl@cavebear.com>
Date: Sun, 07 Oct 2007 12:19:41 -0700
Subject: [Buildroot] Several issues by a buildroot newbie...
In-Reply-To: <20071007163500.GK20951@aon.at>
References: <4704186D.6070303@cavebear.com> <20071007163500.GK20951@aon.at>
Message-ID: <4709314D.1080000@cavebear.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:
> On Wed, Oct 03, 2007 at 03:32:13PM -0700, Karl Auerbach wrote:
>> I'm fairly new to buildroot so please excuse me if I inadvertently touch 
>> something that has been raised previously:
>>
>> 1. Undefined reference in uClibc:
>>    In function `__libc_pthread_init':
>>    libc_pthread_init.c:(.text+0xf): undefined reference to
>>    `__libc_multiple_threads'
> 
> Which version of pthreads do you use?

I've used uClibc-0.9.29.tar.bz2 and also the uClibc snapshot (from Oct 
2.)  Is that what you are asking for?

Both versions gave the same problem with Python, but the snapshot 
version fixed similar problems with sudo and the ssh family of executables.

>> 3. The sudo sources aren't available via the URL given in the 
>> package/sudo/sudo.mk.  The site, http://www.courtesan.com/sudo/dist, has 
>> upgraded to a newer version and the older one to be downloaded appears 
>> no longer on that site.
> 
> It should be updated, yes. Please submit a tested patch. TIA.

Hmmm, I just scrounged around and manually downloaded the old version 
from somewhere.

I'm not at all sure that I'm ready, much less sufficiently experienced 
in the buildroot world, to advance the patches and stuff for sudo to the 
current version from the www.courtesan.com site.

>> 4. The lockfile-progs.c (in package lockfile-progs) uses rindex() but 
>> does not include the correct header file that defines it.  This can be 
>> repaired by a patch that either changes rindex() to strrchr() or 
>> including the correct header.  (I did the former.)
> 
> Please submit a patch to use strrchr.

Here's what I've been using, assuming that email doesn't word wrap it 
into oblivion:

karl at klack(24): cat lockfile-progs-iwl-alix.patch
--- lockfile-progs-0.1.10/lockfile-progs.c      2001-07-17 
10:40:06.000000000 -0700
+++ lfp/lockfile-progs.c     2007-09-25 14:41:22.000000000 -0700
@@ -70,7 +70,7 @@
      { NULL, 0, NULL, 0 }
    };

-  char *cmd_name = rindex(argv[0], '/');
+  char *cmd_name = strrchr(argv[0], '/');
    int mail_cmd_p = 0;

    if(cmd_name != NULL) {
