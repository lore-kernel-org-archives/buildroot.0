From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Nov 2014 11:52:22 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-11-15
In-Reply-To: <20141116073012.7E89F101413@stock.ovh.net>
References: <20141116073012.7E89F101413@stock.ovh.net>
Message-ID: <20141116105222.GC3965@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

I'm looking at some build failures. One has caught my eyes:

On 2014-11-16 08:30 +0100, Thomas Petazzoni spake thusly:
> Detail of failures
>      powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/23aac9bb1cc48e5974bcf50256a16c67318f9ba2/
>      powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/597da58cb2fccb92d7883802c60b31264cacad08/

That's weird:

    cap_file.c: In function 'cap_get_fd':
    cap_file.c:190:33: error: 'XATTR_NAME_CAPS' undeclared (first use in this function)

XATTR_NAME_CAPS was introduced in Linux 2.6.24, and the toolchain is
from CodeSourcery, and uses headers from Linux 2.6.38. So
XATTR_NAME_CAPS ought to be present. But it is not:

    $ grep -r XATTR_NAME_CAPS freescale-2011.03
    [--nothing, zilch, nada, keudale--]

Grr... :-(

So, I would be inclined on making libcap require headers >= 3.0 anyway.
But that has to be propagated to a few packages:

    cdrkit, lxc, ofono, squid (and systemd, but it already requires
    headers >=3.7 anyway)

Thoughts?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
