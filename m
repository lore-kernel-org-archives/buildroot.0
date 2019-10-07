From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 7 Oct 2019 23:59:54 +0200
Subject: [Buildroot] [PATCH v2 00/13] Improve alphabetical order
 checking of Config.in files
In-Reply-To: <20191005122227.7297-1-jerzy.m.grzegorek@gmail.com>
References: <20191005122227.7297-1-jerzy.m.grzegorek@gmail.com>
Message-ID: <1d755944-b97c-27df-9e81-cdf96c310bda@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05/10/2019 14:22, Jerzy Grzegorek wrote:
> The main purpose of this patch series is to improve alphabetical order
> checking of comments, menus and packages in Config.in files.
> Patches 1-6 are preliminary ones and add small improvements.
> Patches 7, 9, 10 do the main work.
> Patches 8, 11-13 fix issues in Config.in files.
> 
> Changes v1 -> v2:
>   - change the subject prefix checkpackagelib/lib_config.py to utils/checkpackagelib
>     in all patches (Ricardo)
>   - drop patch: 
>     utils/checkpackagelib: CommentsMenusPackagesOrder: drop function get_line (Ricardo) 
>   - use package arrays initialize in before() (Ricardo)
>   - improve the commit message of patch 5 (Ricardo)
> 
> Regards,
> Jerzy
> 
> Jerzy Grzegorek (13):
>   utils/checkpackagelib: CommentsMenusPackagesOrder: remove '-comment'
>     state before the '-menu' one
>   utils/checkpackagelib: CommentsMenusPackagesOrder: separate the lines
>     support
>   utils/checkpackagelib: CommentsMenusPackagesOrder: use '-' to describe
>     state
>   utils/checkpackagelib: CommentsMenusPackagesOrder: use package arrays
>     initialize in before()
>   utils/checkpackagelib: CommentsMenusPackagesOrder: initialize
>     'menu_of_packages' array

 I applied these to master, sometimes with small improvements to the commit message.

>   utils/checkpackagelib: CommentsMenusPackagesOrder: add more Config.in
>     files to check

 I applied this one as well, with one exception: I removed boot/Config.in
because it is currently NOT correctly sorted (arm-trusted-firmware should come
before the at91 packages).

 Just for kicks, I removed the whitelist entirely and ran check-package on all
Config.in files. It turned up quite a few errors still, and some of these are in
fact relevant (in qt5 and in toolchain-external). So I'm thinking, it may be
useful to turn the whitelist into a blacklist (after fixing the incorrect
ordering, of course). And instead of maintaining the blacklist in
checkpackagelib, it is probably better to do it with comments in the files
themselves:

# CommentsMenusPackagesOrder off


and set some class variable to False if that comment is found.

 There are a few menus where we can still bikeshed on the proper ordering, e.g.
gstreamer1.


>   utils/checkpackagelib: CommentsMenusPackagesOrder: check package
>     ordering just before 'if ' statement

 These and the following I have marked as Rejected in patchwork as I believe we
shouldn't do this kind of check automatically.

 Regards,
 Arnout

>   package/Config.in: fix packages ordering
>   utils/checkpackagelib: CommentsMenusPackagesOrder: check the order of
>     comments menu
>   utils/checkpackagelib: CommentsMenusPackagesOrder: check the order of
>     menu of menus
>   package/Config.in: fix menus ordering
>   package/kodi/Config.in: fix menus ordering
>   package/kodi/Config.in: fix menus ordering
> 
>  package/Config.in                   |  58 ++++++------
>  package/kodi/Config.in              |  12 +--
>  utils/checkpackagelib/lib_config.py | 133 ++++++++++++++++++++++++----
>  3 files changed, 150 insertions(+), 53 deletions(-)
> 
