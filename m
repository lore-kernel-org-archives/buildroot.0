From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Wed, 22 Jul 2015 09:49:06 -0500
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150722094349.424e7a3e@free-electrons.com>
References: <20150722063018.99E6B101957@stock.ovh.net>
 <20150722094349.424e7a3e@free-electrons.com>
Message-ID: <CANn-YGQs3Sb6k3fyn7-Psfg11JtPbpXM-WM0pEuJ5mLaNtKZMQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas and All,

On Wed, Jul 22, 2015 at 2:43 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Brendan, Alexey, Clayton, Gustavo, J?rg, Guillaume, Marcin, Waldemar,
> Nicolas, Bernd, Johan, R?mi, Paul, Max,Samuel, Vicente, Yegor, Yann,
> please have a look below. Some of the build failures need your
> help/attention. Thanks!
[..]
>>      powerpc |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/3e85c2253f6bd4cfe6ac1dde947eb6d5afc78cfe/
>>      powerpc |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/d0f0f7e7462d68331d4a2f87b1df05cc9a6fecfd/
>>      powerpc |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/114de2422c56071141284fb2eb8044ffa48e77f4/
>>      powerpc |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/0862cf008e7e4b52c46c40257adeda954afee394/
>
> This is an audit problem: it is building stuff for the host, but using
> CFLAGS for the target. Clayton, can you have a look?

I have a fix for it that I will be sending out shortly.

>>        nios2 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/e67ef47ea9ff4cbb012d374b3b290fb7bddf7ef3/
>
> /home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/4.8.3/../../../../nios2-linux-gnu/bin/ld: indexcon: No symbol version section for versioned symbol `qpol_policy_rebuild@@VERS_1.3'
> /home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/4.8.3/../../../../nios2-linux-gnu/bin/ld: final link failed: Nonrepresentable section on output
> collect2: error: ld returned 1 exit status
> Makefile:599: recipe for target 'indexcon' failed
>
> Probably some toolchain issue. Easiest solution is to exclude setools
> from NIOS II. Clayton?
>
>>         bfin |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/2ee84c0dc027912e059ca4ae518d6f11fd8317a7/
>>         bfin |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/401e4c48f4d865b2722f284f1038e25c5d420f43/
>
> Probably the infamous _ prefix used in Blackfin symbols. Maybe we can
> also just exclude setools on Blackfin. Who would want SELinux on a
> Blackfin DSP with noMMU anyway?

I think that would be the most reasonable thing to do. Would we want
to disable just setools or all of SELinux for both NIOS II and
Blackfin?

>>          arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/0e114a9b6289cbced6be94a218383fb012284853/
>
> ustr-cmp-code-so-dbg.o: In function `ustr_pool_make_subpool':
> ustr-cmp-dbg-code.c:(.text+0x0): multiple definition of `ustr_pool_make_subpool'
> ustr-b-code-so-dbg.o:ustr-b-dbg-code.c:(.text+0x0): first defined here
>
> Smells like a GCC 5.x issue.
>
> Clayton, this is for you :-)

I'll see what I can do.

Thanks,
Clayton

Clayton Shotwell
Senior Software Engineer, Rockwell Collins
clayton.shotwell at rockwellcollins.com
