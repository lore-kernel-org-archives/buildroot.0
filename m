From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 11 Feb 2021 19:39:22 +0100
Subject: [Buildroot] [PATCH 1/2] package/netopeer2: set
 SYSREPO_SHM_PREFIX and cleanup shm files after installation
In-Reply-To: <e3a208c6-a577-4057-8c42-fbdf9f0c2196@cesnet.cz>
References: <20210206105736.29429-1-heiko.thiery@gmail.com>
 <20210207123946.14105766@gmx.net>
 <e3a208c6-a577-4057-8c42-fbdf9f0c2196@cesnet.cz>
Message-ID: <20210211183922.GI1679218@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jan, All,

On 2021-02-11 14:56 +0100, Jan Kundr?t spake thusly:
> On ned?le 7. ?nora 2021 12:39:46 CET, Peter Seiderer wrote:
> >Still the question, are the shm files needed at runtime? If so they should
> >belong in the target directory (or created by a startup script), of not why
> >create them at first (why not skip the setup.sh/sysrepoctl step)? Are there
> >any other products/output of the setup.sh/sysrepoctl step?
> >
> >The setup.sh is called with the following environment variables:
> >
> >	NP2_MODULE_DIR /usr/share/yang/modules/netopeer2
> >	NP2_MODULE_PERMS 600
> >	NP2_MODULE_OWNER seiderer
> >	NP2_MODULE_GROUP users
> >
> >A (quick) strace check of setup.sh run shows no other output than the shm
> >files...
> 
> Disclaimer: While I work for the same company as the sysrepo+netopeer2
> maintainers, I'm not upstream. On the other hand, we've been using
> sysrepo+netopeer2 on ARM via Buildroot for a few years. Here's what we're
> doing. Our use case is having a common buildroot build image for several
> appliances that each use a slightly different set of YANG modules. We also
> have a read-only rootfs, with a separate partitions for stateful data, and
> we're using the A/B boot slots via RAUC.

Thank you for these extensive explanations; very interesting! ?

I eventually decided to apply the patch from Heiko, because it does fix
an issue we have currently.

Also, even though your experience suggests not installing things at build
time, but only at run time (and I have no argument against that), I
believe Heiko is actually using netopeer2, and that the way it is packaged
in Buildroot at least works for him, in his very particular case.

So, even if what we have now is not perfect, it seems to work
well-enough to be usable, especially now that we can avoid conflicts
when installing the YANG modules at build/install time.

Again, thank you very much for your extensive and very valuable feedback!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
