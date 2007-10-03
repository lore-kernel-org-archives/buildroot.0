From: Karl Auerbach <karl@cavebear.com>
Date: Wed, 03 Oct 2007 15:32:13 -0700
Subject: [Buildroot] Several issues by a buildroot newbie...
Message-ID: <4704186D.6070303@cavebear.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm fairly new to buildroot so please excuse me if I inadvertently touch 
something that has been raised previously:

1. Undefined reference in uClibc:
    In function `__libc_pthread_init':
    libc_pthread_init.c:(.text+0xf): undefined reference to
    `__libc_multiple_threads'

    I dug through the code and it appears that the missing variable is 
used as a return value for __libc_pthread_init() but that that return 
value appears to be squirreled away and perhaps never used.

   In any event, this is, I suspect the cause of the next item, below.

2. Python segfaults when being loaded.  For various reasons I'm very 
suspicions that the uClibc dynamic library loader is segfaulting.  I've 
tried to build a static image of Python but I can't because of the 
unresolved in the prior item.

I had a similar problem with sudo and all the openssh tools with the 
stable version of uClibc.  The segfaulting of those, but not of Python, 
went away with the snapshot version of uClibc.

   Python did compile and run quite nicely on my year old snapshot of 
buildroot, but it's effectively dead now.

3. The sudo sources aren't available via the URL given in the 
package/sudo/sudo.mk.  The site, http://www.courtesan.com/sudo/dist, has 
upgraded to a newer version and the older one to be downloaded appears 
no longer on that site.

4. The lockfile-progs.c (in package lockfile-progs) uses rindex() but 
does not include the correct header file that defines it.  This can be 
repaired by a patch that either changes rindex() to strrchr() or 
including the correct header.  (I did the former.)

		--karl--
