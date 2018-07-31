From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 31 Jul 2018 17:49:48 +0200
Subject: [Buildroot] [PATCH 3/3] New <pkg>-update-last-config-fragment
 target in pkg-kconfig.mk
In-Reply-To: <20180730234643.34315d11@windsurf>
References: <20180730155153.24091-1-m.patzlaff@pilz.de>
 <20180730155153.24091-4-m.patzlaff@pilz.de>
 <20180730234643.34315d11@windsurf>
Message-ID: <20180731154948.GB8537@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Marcel, All,

On 2018-07-30 23:46 +0200, Thomas Petazzoni spake thusly:
> On Mon, 30 Jul 2018 17:51:53 +0200, Marcel Patzlaff wrote:
> > This patch adds the new target above which implements the update routine as
> > detailled in the head of this patch series.
> > 
> > Signed-off-by: Marcel Patzlaff <m.patzlaff@pilz.de>
> 
> Thanks for working on this complex topic, as Arnout said.
> 
> On my side, I find the semantic of "let's update the _last_ fragment"
> to be a bit weird and complex to understand. Why the last one, and not
> any other ?
> 
> I'm not sure it's possible to have something that updates fragments
> with a sensible semantic.
> 
> However, what would be useful would be a way to dump the difference
> between the current configuration, and what the combination of the
> defconfig+fragments provide.
> 
> I.e, you start Buildroot with omap2plus_defconfig + some specific
> fragments as the kernel configuration.
> 
> You run "make linux-show-config-diff", which returns empty.
> 
> Then you tweak the configuration with "make linux-menuconfig", and run
> "make linux-show-config-diff", which shows you the lines that you need
> to put in one of your fragments to preserve the configuration tweaks
> you have done.
> 
> Of course, the name "linux-show-config-diff" is just made up here, and
> some more thought is needed to find a good name. But overall, I believe
> the semantic would be much clearer, and doesn't make any assumption on
> whether we have one or several fragments, and whether the last fragment
> or any other fragment needs to be updated.
> 
> What do you think about this? Would this also fill your needs?

I would advocate that we do a generic solution like Thomas suggests,
because it is generic enough that it would help solve more use-cases
than this patch does.

So, I side with Thomas here.

I would just suggest that we do not add any new rule, but trying to
update the defconfig when there are fragments would fail as it currently
does, but also would display the delta if there is one. I.e.:

    $ make linux-menuconfig
    [change stuff]
    $ make linux-update-defconfig
    Unable to perform linux-update-defconfig when fragment files are set
    Configuration changes that you want to propagate to one of the fragments:
    -CONFIG_FOO=y
    +# CONFIG_BAR is unset
    linux/linux.mk:511: recipe for target 'linux-update-defconfig' failed
    make[1]: *** [linux-update-defconfig] Error 1

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
