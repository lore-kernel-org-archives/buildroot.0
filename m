From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Fri, 7 Feb 2014 14:00:39 +0000
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140207135324.4c7cbe3f@skate>
References: <20140207073009.C5A85100E3A@stock.ovh.net>
 <20140207135324.4c7cbe3f@skate>
Message-ID: <39A54937CC95F24AA2F794E2D2B66B1356C64BD3@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> 
> >        arc |              dmraid-1.0.0.rc15 | NOK |
> http://autobuild.buildroot.net/results/ef6a0e2d382ae202bb8f0e9fc9f5e48c9
> 0119faf/
> 
> Internal compiler error. Ryan has sent a patch to disable the dmraid
> build on ARC for now, but it would be good if the ARC team could have a
> look at this. Cc'ing Anton.

We have two compiler patches internally which resolve several failures in autobuild. I'm waiting for compiler engineer to merge those patches into main branch, so I can update commit referenced in Buildroot. I expect this to happen next week.

> 
> >        arc |                  libpfm4-4.3.0 | NOK |
> http://autobuild.buildroot.net/results/59cefaba9d382f0de17b5dccb2d88fc74
> d36f520/
> 
> task.c: In function 'read_groups':
> task.c:110:5: error: format '%zd' expects argument of type 'signed size_t', but
> argument 4 has type 'ssize_t' [-Werror=format=]
>      evt, new_sz, ret);
>      ^
> cc1: all warnings being treated as errors
> make[2]: *** [task.o] Error 1
> 
>  -> We should build this package without treating warning as error.

However variables of type "signed size_t" cannot be declared (at least for ARC) so there is a misinformation from GCC, and on the same test case GCC for x86_64 doesn't emit a warning at all, while ARC emits. Both GCC's are version 4.8. So it seems to be something ARC-specific. I've filed an internal bug report to investigate. Though I also have no objections if this package will be compiled without -Werror.

Anton Kolesov


> 
> Thanks for your help!
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
