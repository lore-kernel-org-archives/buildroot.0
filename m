From: Will Newton <will.newton@gmail.com>
Date: Tue, 6 May 2014 09:57:39 +0100
Subject: [Buildroot] The aarch64 glibc failure
In-Reply-To: <20140506092357.000b7903@skate>
References: <20140506063010.AD7E9101299@stock.ovh.net>
 <20140506092357.000b7903@skate>
Message-ID: <CAFbHwiSGYKtnXNZr=evLcib4tcjbSyhE+vQw663D4hboSC4Weg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 6, 2014 at 8:23 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

Hi Thomas,

> On Tue,  6 May 2014 08:30:10 +0200 (CEST), Thomas Petazzoni wrote:
>
>>    aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/ff63f70812eb8ab3ceae4efc8754865479ac1a27/
>>    aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/dd04d058bb26343c9dfded76608929942d83db5a/
>>    aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/4244da86604fbe1e51da2e7269bd373e8940a178/
>>    aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/65471a371199f79a60f3a8b881cdf2bdac633336/
>>    aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/7a828d00f062d33f3fd9df0be6e00f0c4e2459b7/
>
> So, I tried to reproduce dd04d058bb26343c9dfded76608929942d83db5a on
> the build server (the exact same build server)... and the build worked
> fine. So it would look like a spurious build issue. Except that
> according to http://autobuild.buildroot.org/?arch=aarch64, all aarch64
> builds since April 24th have failed because of this.
>
> I was thinking that maybe the problem would have been solved by the
> switch from the old build server to the new one. But the latest builds
> are clearly done at date/times that indicate they were done on the new
> build server (on which I did the test build which was successful).
>
> So for now, I'm a bit unsure on how to attack this problem. I believe
> I'll let the build runs for a little more, and see if it continues to
> happen again.

I can't reproduce it either, but valgrind does show some invalid
memory accesses with that linker. They are fixed by this patch:

commit 99d190fac4d2aab238cfc798dc5c28ab41456882
Author: Alan Modra <amodra@gmail.com>
Date:   Fri Dec 20 23:57:52 2013 +1030

    Don't segv on cie.initial_instructions[] overflow.

    Don't attempt to merge CIEs with a larger number of insns than will
    fit in the buffer.

        * elf-eh-frame.c (cie_eq): Return false when initial_insn_length
        is too large.
        (cie_compute_hash): Don't exceed bounds of initial_instructions.
        (_bfd_elf_parse_eh_frame): Always set initial_insn_length, and
        save as much of insns to initial_instructions[] as will fit.

So if the problem persists it may be worth trying to add that patch to
see if it helps.
