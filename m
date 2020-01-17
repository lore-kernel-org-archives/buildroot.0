From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Jan 2020 21:29:49 +0100
Subject: [Buildroot] [PATCH] package/gettext-tiny: fix install failure
 if path contains "m4/" string
In-Reply-To: <20200117175321.104000-1-giulio.benetti@benettiengineering.com>
References: <20200117175321.104000-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200117202949.GL22540@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Giulio, All,

On 2020-01-17 18:53 +0100, Giulio Benetti spake thusly:
> When building with path containing "m4/" occurence(i.e. make
> O=output-m4) gettext-tiny install recipe copies files to wrong place and
> later some package using autotools fail to autoreconf(i.e. minicom).
> This is due to buggy gettext-tiny Makefile install recipe where they
> substitute every "m4/" in INSTALL destination path, including the "m4/"
> part of our build folder. Add patch to fix this by using sed instead of
> $(subst ...) to substitute only last "m4/" occurence in path.
> 
> Fixes:
> https://bugs.busybox.net/show_bug.cgi?id=12481
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...tall-failure-if-path-contains-m4-str.patch | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/gettext-tiny/0001-Makefile-fix-install-failure-if-path-contains-m4-str.patch
> 
> diff --git a/package/gettext-tiny/0001-Makefile-fix-install-failure-if-path-contains-m4-str.patch b/package/gettext-tiny/0001-Makefile-fix-install-failure-if-path-contains-m4-str.patch
> new file mode 100644
> index 0000000000..e607f9ea2a
> --- /dev/null
> +++ b/package/gettext-tiny/0001-Makefile-fix-install-failure-if-path-contains-m4-str.patch
> @@ -0,0 +1,31 @@
> +From c9440e55e1179e7ce29cceae2ddb089b11c00f07 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Fri, 17 Jan 2020 18:34:42 +0100
> +Subject: [PATCH] Makefile: fix install failure if path contains "m4/" string
> +
> +Actually Makefile install recipe substitutes every occurence of "m4/" in
> +file name of the target of the rule($@), in an absolute path there could
> +more than one "m4/" occurence, so install will fail. Let's change
> +$(susbst ...) call with a call to sed substituting only last occurence
> +of "m4/".
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 4a3c3f6..1f925a3 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -88,6 +88,6 @@ $(DESTDIR)$(datadir)/%: %
> + 	$(INSTALL) -D -m 644 $< $@
> + 
> + $(DESTDIR)$(acdir)/%: %
> +-	$(INSTALL) -D -l ../$(subst $(datarootdir)/,,$(datadir))/$< $(subst m4/,,$@)
> ++	$(INSTALL) -D -l ../$(subst $(datarootdir)/,,$(datadir))/$< $(shell echo $@ | sed 's,\(.*\)m4/,\1,')

As I suggested on your upstream pull-request, what about:

    -	$(INSTALL) -D -l ../$(subst $(datarootdir)/,,$(datadir))/$< $(subst m4/,,$@)
    +	$(INSTALL) -D -l ../$(subst $(datarootdir)/,,$(datadir))/$< $(patsubst %m4/,%,$@)

Regards,
Yann E. MORIN.

> + .PHONY: all clean install
> +-- 
> +2.20.1
> +
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
