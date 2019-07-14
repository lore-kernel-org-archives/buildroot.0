From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jul 2019 16:21:10 +0200
Subject: [Buildroot] [PATCH 2/2] arch/arc: arc7x0 always needs -matomic
In-Reply-To: <CY4PR1201MB0120ACABE84E384C36A492A5A1140@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <cover.1559421222.git.yann.morin.1998@free.fr>
 <16241cb355b045ba585ba806f0f4c829f5aea9f8.1559421222.git.yann.morin.1998@free.fr>
 <20190601223735.4057b840@windsurf> <20190601205046.GI3407@scaer>
 <CY4PR1201MB0120ACABE84E384C36A492A5A1140@CY4PR1201MB0120.namprd12.prod.outlook.com>
Message-ID: <20190714142110.GB25166@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey, All,

On 2019-06-03 05:42 +0000, Alexey Brodkin spake thusly:
> > Alexey, last time I asked [0], you did not reply, so here goes again: what
> > variants of ARC really require -matomic, as you reported on [2] [3].
> > 
> > From [1], I understood that only arc700 was impacted, but the existing
> > condition to add -matomic for arc [4] is not the same.
> > 
> > So, quid?
> 
> That's indeed not super straight-forward.
> 
> As of today we have 2 families of cores capable of running full-scale OS,
> i.e. with MMU at least. These are ARC700 [1] and ARC HS [2].
> 
> And while all ARC HS cores have support of atomic instructions in their
> base configurations in case of ARC700 they were not included in base configs
> (I guess because back in the day in absence of SMP everybody was happy with
> compare-exchange). What's worse those atomic-less configurations really exist
> and that's why I'd still prefer to support them.
> 
> Speaking about atomics support in the toolchain we keep "-matomic" disabled
> for "-mcpu=arc700" and have it enabled for all ARC HS varieties
> (hs, hs38, hs38_linux etc), see:
> 
> | # arc-linux-gcc -mcpu=arc700 -Q --help=target | grep matomic
> |   -matomic                              [disabled]
> | #?arc-linux-gcc -mcpu=archs -Q --help=target | grep matomic
> |   -matomic                              [enabled]
> 
> I.e. passing "-matomic" for ARC HS makes not much sense - it's enabled already
> implicitly due to either "-mcpu" on GCC invocation or "--with-cpu" on GCC
> configuration.
> 
> Now answering your and Tomas' questions:
> 1. In theory ARC750 is exactly that legacy configuration w/o atomics so we
>    may just depend on "BR2_arc750d".
> 2. In practice given atomics might be disabled (or enabled) during core
>    configuration [while designing the chip based on ARC700 family] it
>    might still be a better option to rely on "BR2_ARC_ATOMIC_EXT" which:
>      a) Gets pre-set of !BR2_arc750d
>      b) Might be changed by a user
> 
> That said I don't have a firm preference here.
> 
> If you feel that dropping BR2_ARC_ATOMIC_EXT and relying on "BR2_arc750d"
> for disabling atomics makes BR code cleaner let's go that way.

Thank you very much for these detailed explanations.

However, I am still unsure what to do, and under which conditions we
want to force -matomic...

So, I'll respin this series with what I think I have understood. If I
still messed things up, then you'll have to grab the patches and fix
them.

Thanks again! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
