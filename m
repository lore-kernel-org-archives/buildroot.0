From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Apr 2015 19:21:00 +0200
Subject: [Buildroot] [git commit] boot/at91bootstrap3: migrate to
 pkg-kconfig
In-Reply-To: <2107652.0TfdOuBi1l@noffke.mortara.com>
References: <20150406213231.634BE817D2@busybox.osuosl.org>
 <2107652.0TfdOuBi1l@noffke.mortara.com>
Message-ID: <20150407172100.GF4216@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patrick, All,

[Please, wrap lines to ~72 chars; ultra-long lines are a pain to read.]

On 2015-04-07 10:25 -0500, Patrick Noffke spake thusly:
> Hi,
> 
> I just did a rebase to prepare for submitting a patch, and now
> at91bootstrap3 doesn't build.  I am using a custom config based on an
> existing board (at91sam9m10g45ek).  Buildroot copies my custom config
> to output/build/at91bootstrap3.7.1/.config, then appears to be running
> make defconfig prior to running make.

CAn you share the last 100-or-so lines of the build log (what's on the
console), because the pkg-kconfig infra does not run defconfig. You can
see what it's doing in: package/pkg-kconfig.mk , and it's basically:

    cp $(YOUR_CONFIG_FILE)  $(AT91BOOTSTRAP3_DIR)/.config
    make oldconfig

So, if htere's a defconfig run, it's not Buildroot doing it...

I'll try to see if I can reproduce a failure here. Results to come
later...

>  make defconfig results in
> replacing some of my CONFIG_XX settings.  If I manually copy the
> config and then manually run make (thus skipping make defconfig), then
> it builds as I expect.
> 
> I am not sure if this patch is the cause, or something else.  I may be
> using at91bootstrap3 incorrectly (perhaps I needed to make a custom
> board), but I don't see why defconfig should be done with a custom
> config.

Well, it's pretty easy to see if this patch is the culprit:

    git checkout 2016cb30f103024a8dfb50bcfe9a68bfac2f1118^

then test your config and see if it works. If it does, then the patch
may be the culprit (i.e. uncover a bug somewhere, maybe in Buildroot,
maybe in at91bootstrap3 itself); if the config does not work, then the
bug pre-existed that patch.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
