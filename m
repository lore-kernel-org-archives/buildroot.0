From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 25 Apr 2018 19:22:48 +0200
Subject: [Buildroot] EXTRA_DOWNLOADS broken when SITE_METHOD = git
In-Reply-To: <447cff1a-80c7-dde0-7991-6ecf530bdb1c@lucaceresoli.net>
References: <447cff1a-80c7-dde0-7991-6ecf530bdb1c@lucaceresoli.net>
Message-ID: <20180425172248.GA25020@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2018-04-25 10:56 +0200, Luca Ceresoli spake thusly:
> I noticed a problem with the EXTRA_DOWNLOADS for packages whose "main"
> download happens using git (most likely applies to other SCMs too).

Thanks for this report. I can indeed confirm that extra downloads are
broken on 2018.02.x and master, when the main download is from an SCM.

As I said on IRC, I think they have always been broken, but we silenly
failed so far. So, there is no "regresskion" per-se. Just a bug.

As for master, we no longer silently fail, but we do now error out.
This could be considered an improvement, no? ;-)

I am working on a fix, and I already have something that is workable
now. I jsut need a few tests, and I'll submit it later tonight (or by
the weeke-end at least).

Regards,
Yann E. MORIN.

> With the following defconfig:
> 
> BR2_TARGET_UBOOT=y
> BR2_TARGET_UBOOT_BOARDNAME="foo"
> BR2_TARGET_UBOOT_CUSTOM_GIT=y
> BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.denx.de/u-boot.git"
> BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2018.03"
> 
> and the following line added to boot/uboot/uboot.mk:
> 
> UBOOT_EXTRA_DOWNLOADS += https://buildroot.org/images/logo.png
> 
> With Buildroot 2018.02, 'make uboot-source' downloads only the main git
> sources. The URL mentioned in UBOOT_EXTRA_DOWNLOADS is ignored.
> 
> With Buildroot master (2018.02-934-gf5b14df1104c), the same command
> tries to download the UBOOT_EXTRA_DOWNLOADS using git and of course it
> fails:
> 
> Reinitialized existing Git repository in <...>/dl/uboot/git/.git/
> Doing a shallow fetch
> fatal: repository 'https://buildroot.org/images/' not found
> Shallow fetch failed, falling back to fetching all refs
> Fetching all references
> fatal: repository 'https://buildroot.org/images/' not found
> 
> I think both behaviors are wrong: EXTRA_DOWNLOADS should always use wget
> or cp, just as the manual says, and common sense suggests.
> 
> Regards,
> -- 
> Luca

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
