From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 15 Jul 2015 17:52:16 +0000
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] arc build
 results for 2015-07-14
In-Reply-To: <20150715063016.118A21016B5@stock.ovh.net>
References: <20150715063016.118A21016B5@stock.ovh.net>
Message-ID: <1436982736.3682.16.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, 2015-07-15 at 08:30 +0200, Thomas Petazzoni wrote:
> Those results are limited to the arc architecture.
> 
> Build statistics for 2015-07-14
> ===============================
> 
>         success : 6  
>        failures : 23 
>        timeouts : 0  
>           TOTAL : 29 
> 
> Classification of failures by reason
> ====================================
> 
>                   zeromq-4.0.5 | 9 
>              util-linux-2.26.2 | 5 
>                   boost-1.58.0 | 3 
>                alsa-lib-1.0.29 | 3 
>              btrfs-progs-4.1.1 | 1 
>              libselinux-2.1.13 | 1 
>                    tinc-1.0.24 | 1 
> 
> Detail of failures
> ===================
> 
>          arc |                alsa-lib-1.0.29 | NOK | 
> http://autobuild.buildroot.net/results/af9596843794610560a77374408fbdfab21aa891/
>          arc |                alsa-lib-1.0.29 | NOK | 
> http://autobuild.buildroot.net/results/ec53d93c116441c84105f3a27d250554630ce553/
>          arc |                alsa-lib-1.0.29 | NOK | 
> http://autobuild.buildroot.net/results/519934a75cbe6bfdd522fe33b66dfe0522956046/

Probably still unsolved problem in uClibc?
http://lists.uclibc.org/pipermail/uclibc/2014-August/048535.html

Interesting enough something similar was fixed a while back for "vfork",
see http://patchwork.ozlabs.org/patch/329893/,
http://git.uclibc.org/uClibc/commit/?id=00b07e8ca5664985bbbbdc1d375407ac36124317

>          arc |                   boost-1.58.0 | NOK | 
> http://autobuild.buildroot.net/results/596c2eb1378946b8c0fea6b3ebcf80ee7e14995a/
>          arc |                   boost-1.58.0 | NOK | 
> http://autobuild.buildroot.net/results/0585f6c926042d7c859150dbf7b33928c4687273/
>          arc |                   boost-1.58.0 | NOK | 
> http://autobuild.buildroot.net/results/16fd658176b4e4927f7c7dbe5598b7a38b819af9/

Looks like an issue with boost that for some reason
uses syscall (non-existent on some arches including ARC)
directly instead of libc's eventfd().
----------------->8-------------------
"syscall(__NR_eventfd, 0);"
----------------->8-------------------

>          arc |              btrfs-progs-4.1.1 | NOK | 
> http://autobuild.buildroot.net/results/e48c8b7ce150a70af175f78d67f90056faa6fd3b/

Internal compiler's issue on handling of TLS data.
Internal bug-report was filed, waiting for an action.
----------------->8-------------------
undefined reference to `.tdata'
----------------->8-------------------

>          arc |              libselinux-2.1.13 | NOK | 
> http://autobuild.buildroot.net/results/40bdee839acd8dfb5c78aead953a690dbfc461d8/

That's something new, need to look at this one in depth.
----------------->8-------------------
/tmp/ccyYpeOv.s: Assembler messages:
/tmp/ccyYpeOv.s:475: Error: internal error: fixup not contained within frag
----------------->8-------------------

>          arc |                    tinc-1.0.24 | NOK | 
> http://autobuild.buildroot.net/results/60319063757340810fc6545f5da94e45f9b6c811/

Another case of PIE usage. Will send a patch for it soon.

>          arc |              util-linux-2.26.2 | NOK | 
> http://autobuild.buildroot.net/results/bc7995f1e4e0d103c83c8e43703b93ea50829899/
>          arc |              util-linux-2.26.2 | NOK | 
> http://autobuild.buildroot.net/results/d82f06660557d3d43a7f7c806d51217f607ce8c9/
>          arc |              util-linux-2.26.2 | NOK | 
> http://autobuild.buildroot.net/results/eb2182939f223ceb697145e3b450113ad770ad21/
>          arc |              util-linux-2.26.2 | NOK | 
> http://autobuild.buildroot.net/results/94c0185c88b0a8107bda5e0a590f2f77153860d5/
>          arc |              util-linux-2.26.2 | NOK | 
> http://autobuild.buildroot.net/results/d60738b7ef7a266d112b19006bcabd7a818213ad/

The same as with "libselinux".
----------------->8-------------------
randutils.c:(.text+0x138): undefined reference to `.tdata'
----------------->8-------------------

>          arc |                   zeromq-4.0.5 | NOK | 
> http://autobuild.buildroot.net/results/621c2b77197963d229a3b322ee35ce85ecfc01cd/
>          arc |                   zeromq-4.0.5 | NOK | 
> http://autobuild.buildroot.net/results/a2891e9ef98f5505d88d9a2f84e0fa3e81ca779c/
>          arc |                   zeromq-4.0.5 | NOK | 
> http://autobuild.buildroot.net/results/506e2903b9ac5f2027d8edbe2ae9f90ba04991ba/
>          arc |                   zeromq-4.0.5 | NOK | 
> http://autobuild.buildroot.net/results/021d3efeb0dab244885e9159d6f579f3eb04ffcf/
>          arc |                   zeromq-4.0.5 | NOK | 
> http://autobuild.buildroot.net/results/50e9be0896da86c042f3f4eae1cdd329dddc9e2a/
>          arc |                   zeromq-4.0.5 | NOK | 
> http://autobuild.buildroot.net/results/17ba855ba6286c202d032667e6b14fcf5d697ebf/
>          arc |                   zeromq-4.0.5 | NOK | 
> http://autobuild.buildroot.net/results/409cc6a54937b72b0524d7466472d9178e6b07e4/
>          arc |                   zeromq-4.0.5 | NOK | 
> http://autobuild.buildroot.net/results/705b82af4951779a7c672e51461db4624df8436f/
>          arc |                   zeromq-4.0.5 | NOK | 
> http://autobuild.buildroot.net/results/77c9fb8ab581c9ed70fbb3d29ad1cccef291a84c/

Should be fixed with arc-2015.06 release, please consider applying
http://patchwork.ozlabs.org/patch/495837/
----------------->8-------------------
socket_base.cpp:1157:1: error: Internal consistency failure: cfi row mismatch [-Werror]
----------------->8-------------------

-Alexey
