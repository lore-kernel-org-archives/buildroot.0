From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 May 2021 18:59:05 +0200
Subject: [Buildroot] [PATCH v3 3/4] lmbench: emulate --prefix to avoid
 scattering binaries all over
In-Reply-To: <e39b28e8-79c9-df44-5113-82af630ebdfb@synopsys.com>
References: <20210510180049.61421-1-vgupta@synopsys.com>
 <20210510180049.61421-5-vgupta@synopsys.com>
 <20210510220931.1dc78bde@windsurf>
 <e39b28e8-79c9-df44-5113-82af630ebdfb@synopsys.com>
Message-ID: <20210517165905.GB2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vineet, All,

On 2021-05-10 20:22 +0000, Vineet Gupta via buildroot spake thusly:
> On 5/10/21 1:09 PM, Thomas Petazzoni wrote:
> > On Mon, 10 May 2021 11:00:48 -0700
> > Vineet Gupta via buildroot <buildroot@busybox.net> wrote:
> >
> >>   - moves all lmbench binaries to <target>/lmbench/bin/<ARCH>
> >>   - scripts copied to <target>/lmbench/scripts
> >>   - scripts/os overwritten to setup "OS" as expected by LMBench runtime scripts
> >>
> >> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> > Where are lmbench binaries currently installed? Because /lmbench/ looks
> > really really odd as an installation location.
> 
> They are currently scattered over in /usr/sbin I think.

    $ cat output/cat build/lmbench-3.0-a9/.files-list.txt
    lmbench,./usr/bin/bw_file_rd
    lmbench,./usr/bin/bw_mem
    lmbench,./usr/bin/bw_mmap_rd
    [...]
    lmbench,./usr/bin/stream
    lmbench,./usr/bin/timing_o
    lmbench,./usr/bin/tlb
    lmbench,./usr/lib/libmbench.a

That is, everything is in /usr/bin, except for the static library
(which gets trimmed away during tsarget-finalize anyway) which is in
/usr/lib/.

And apart from the tools and the static library, nothing else is
installed, not even a header, so the the static library is only private
to lmbench anyway.

> Indeed /lmbench is non LSB etc, but it is one stop shop if one wanted to 
> remove everything lmbench specific from target rootfs.
> I guess one could do /usr/sbin/lmbench/{bin,scripts}

But why would you want to enable lmbench, and remove it from target?

So, for me, there is no reason for this patch: lmbench already installs
everything in standard locations, and if one does not want lmbench tools
on the target, just do not enable the lmbench package to begin with.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
