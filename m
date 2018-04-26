From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Thu, 26 Apr 2018 11:03:14 +0530
Subject: [Buildroot] [PATCH 0/3] Fix udftools in static linking scenarios
In-Reply-To: <20180422212005.13062-1-thomas.petazzoni@bootlin.com>
References: <20180422212005.13062-1-thomas.petazzoni@bootlin.com>
Message-ID: <CA+NV+Vkr04dq4b78zXPMG1mV7Trz8KQP3=6si+7LJjJsrwmpfg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 23, 2018 at 2:50 AM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> This set of 3 patches aim at fixing the build of udftools in static
> linking scenarios.
>
> The first patch is a somewhat unrelated fix, which is really trivial,
> and not specific to static linking.
>
> The second patch fixes the readline package to install a pkg-config
> file.
>
> The third patch fixes the udftools package to use the readline
> pkg-config file.
>
> The overall solution is I believe the most correct one (use a
> pkg-config file), but is admittedly a bit complex and requires to
> autoreconf two more packages. If people don't like it, I'll be happy
> to change it to just pass "-lncurses" when building udftools, which
> would achieve the same effect.

Using pkg-config file is indeed a correct fix. But I think we should
understand why readline doesn't install .pc file by default. This
might be a reason that it is outdated and incorrect. Yes, in past we
have fixed static linking with readline for many packages by passing
it's private libraries.

May be if we first upstream readline changes with .pc installation in
autotools files, it would be nice to use fix. Otherwise, we need to
maintain patch and .pc file updated (in case of any changes in list of
private libraries).

Thanks,
Rahul

>
> Thanks,
>
> Thomas
>
> Thomas Petazzoni (3):
>   udftool: add missing dependency on readline
>   readline: install a .pc file
>   udftools: fix static linking against readline
>
>  ...c-readline.pc.in-fix-Requires.private-val.patch | 62 ++++++++++++++++++++++
>  package/readline/readline.mk                       | 17 +++++-
>  ...c-detect-readline-via-pkg-config-when-pos.patch | 60 +++++++++++++++++++++
>  package/udftools/udftools.mk                       |  2 +
>  4 files changed, 139 insertions(+), 2 deletions(-)
>  create mode 100644 package/readline/0001-configure.ac-readline.pc.in-fix-Requires.private-val.patch
>  create mode 100644 package/udftools/0002-configure.ac-detect-readline-via-pkg-config-when-pos.patch
>
> --
> 2.14.3
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
