From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 31 Jul 2016 23:25:54 +0200
Subject: [Buildroot] Analysis of build results for 2016-07-29
In-Reply-To: <20160730232322.4eca1a53@free-electrons.com>
References: <20160730063032.3A6FE10161A@stock.ovh.net>
 <20160730232322.4eca1a53@free-electrons.com>
Message-ID: <20160731212554.GA5611@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-07-30 23:23 +0200, Thomas Petazzoni spake thusly:
[--SNIP--]
> >     mips64el | dtv-scan-tables-0c92e5e5d35... | NOK | http://autobuild.buildroot.net/results/2aef6e3f7e6b4f403e3b978229f9d92e8df685cb/
> >         i686 | dtv-scan-tables-0c92e5e5d35... | NOK | http://autobuild.buildroot.net/results/facc228a501e5ffc898078103eaf0c9f4dc70bfe/
> >      powerpc | dtv-scan-tables-0c92e5e5d35... | NOK | http://autobuild.buildroot.net/results/20fd76d2256eee81837f7e9bbaefbe79d7645ae9/
> >      powerpc | dtv-scan-tables-0c92e5e5d35... | NOK | http://autobuild.buildroot.net/results/6c39e827c58e1969b26eefd74a64c7e3d20026a3/
> Corrupted tarball. Yann, can we enable hash checking for Git-fetched packages?

Yes, we should.

> >     mips64el | edid-decode-681153145d5e05e... | NOK | http://autobuild.buildroot.net/results/0f7e5495aec809754b496173a316b8eb19ba302e/
> Weird corrupted tarball issue that occurs only on Yann's machine.

I have removed all locally cache targballs to get rid of the broken
ones, and restarted my autobuilder instance.

Alas, the corruption occured again soon after. :-/

I have now stopped my instance until further investigation...

all issues happen when using the git protocol; our git wrapper seem to
be having issues of some kind when creating the tarball: all issues
happen when running tar.

For a bit of background, here's how we generate the archives in the git
wrapper:

    tar cf - --numeric-owner --owner=0 --group=0 --mtime="${date}" \
             -T <(find "${basename}" -not -type d |LC_ALL=C sort) \
    |gzip -n >"${output}"

In most of the failrues, tar complains that it can't stat /dev/fd/63,
which is the fd of the process substitution for the find command:

    http://autobuild.buildroot.net/results/2ae/2aef6e3f7e6b4f403e3b978229f9d92e8df685cb/build-end.log
    [--SNIP--]
    tar: /dev/fd/63: Cannot stat: No such file or directory
    tar: Error is not recoverable: exiting now
    sort: write failed: standard output: Broken pipe
    sort: write error

In one of the failures, the find command complains that each files it
finds does not exist:

    http://autobuild.buildroot.net/results/20f/20fd76d2256eee81837f7e9bbaefbe79d7645ae9/build-end.log
    [--SNIP--]
    find: `dtv-scan-tables-0c92e5e5d3590da60acb4bcc92c19f041dc7e481/Makefile': No such file or directory
    find: `dtv-scan-tables-0c92e5e5d3590da60acb4bcc92c19f041dc7e481/.gitignore': No such file or directory
    find: `dtv-scan-tables-0c92e5e5d3590da60acb4bcc92c19f041dc7e481/COPYING.LGPL': No such file or directory
    sort: write failed: standard output: Broken pipe
    sort: write error

So, I'll look at making the wrapper more robust. We want to catch all
failures, but:

  - we pipe the output of tar into gzip, we can't catch any failure of
    tar,

  - we use process substitution, we can't catch the failure of the find
    command.

I've already sent a patch: https://patchwork.ozlabs.org/patch/654339/
but I'll withdraw it, as it is not complete: we still pipe the output of
find, so we'd still miss failures from find.

Ultimately, I'd like to understand what is so special about my machine
that those failures only occur on it, and on no other autobuilder...
That is proving really tricky: I have had a loop iterate over
linux-zigbee to try and reproduce the issue, but after 2275 iterations
of the loop, still no failure... :-/

Probably hardware issues, but I have no clue what kind: HDD? CPU? mem?
What does not help is the fact that the machine is 'somewhere', that I
can't reach it, so no easy way to run memtest86. smartctl does not
provide much either. I'll try to run some cpuburn soon...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
