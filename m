From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 19 May 2020 21:26:51 +0200
Subject: [Buildroot] [PATCH] package/bison: make installation relocatable
In-Reply-To: <20200518062648.1744905-1-thomas.petazzoni@bootlin.com>
References: <20200518062648.1744905-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200519192651.GI27030@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-05-18 08:26 +0200, Thomas Petazzoni spake thusly:
> Our current host-bison installation is not relocatable, so if you
> generate the SDK, and install it in a different location, bison will
> no longer work with failures such as:
> 
> bison: /home/user/buildroot/output/host/share/bison/m4sugar/m4sugar.m4: cannot open: No such file or directory
> 
> This particular issue is already resolved upstream by the addition of
> "relocatable" support, which we enable using --enable-relocatable.
> 
> Once this issue is fixed, a second one pops up: the path to the m4
> program itself is also hardcoded. So we add a patch to fix that as
> well. The patch has been submitted upstream.
> 
> Fixes:
> 
>   https://bugs.busybox.net/show_bug.cgi?id=12656
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, after:
  - I added a reference to the upstream mailing list
  - expanded the commit log that upstream requested some changes

Regards,
Yann E. MORIN.

> ---
>  ...0001-src-make-path-to-m4-relocatable.patch | 69 +++++++++++++++++++
>  package/bison/bison.mk                        |  1 +
>  2 files changed, 70 insertions(+)
>  create mode 100644 package/bison/0001-src-make-path-to-m4-relocatable.patch
> 
> diff --git a/package/bison/0001-src-make-path-to-m4-relocatable.patch b/package/bison/0001-src-make-path-to-m4-relocatable.patch
> new file mode 100644
> index 0000000000..730fbbfe89
> --- /dev/null
> +++ b/package/bison/0001-src-make-path-to-m4-relocatable.patch
> @@ -0,0 +1,69 @@
> +From 50c8a3af1661c3950b9743d673fd46872860aa08 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Mon, 18 May 2020 07:53:20 +0200
> +Subject: [PATCH] src: make path to m4 relocatable
> +
> +Commit a4ede8f85b0c9a254fcb01e5888cee1983095669 ("package: make bison
> +a relocatable package") made Bison relocatable, but in fact it still
> +contains one absolute reference: the M4 variable, which points to the
> +M4 program. Let's fix that by using relocate().
> +
> +We don't use relocate2() to store the temporary buffer and re-use it,
> +because m4path() is only called once.
> +
> +Upstream: submitted to the bison-patches at gnu.org mailing list
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + src/files.c  | 7 +++++++
> + src/files.h  | 3 +++
> + src/output.c | 2 +-
> + 3 files changed, 11 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/files.c b/src/files.c
> +index 71c10e34..b8b43230 100644
> +--- a/src/files.c
> ++++ b/src/files.c
> +@@ -421,6 +421,13 @@ pkgdatadir (void)
> +     }
> + }
> + 
> ++char const *
> ++m4path (void)
> ++{
> ++  char const *m4 = getenv("M4");
> ++  return m4 ? m4 : relocate(M4);
> ++}
> ++
> + void
> + output_file_names_free (void)
> + {
> +diff --git a/src/files.h b/src/files.h
> +index 00814ad0..64b6f8b5 100644
> +--- a/src/files.h
> ++++ b/src/files.h
> +@@ -64,6 +64,9 @@ extern char *all_but_ext;
> + /* Where our data files are installed.  */
> + char const *pkgdatadir (void);
> + 
> ++/* Where the m4 program is installed.  */
> ++char const *m4path (void);
> ++
> + void compute_output_file_names (void);
> + void output_file_names_free (void);
> + 
> +diff --git a/src/output.c b/src/output.c
> +index 1871fd75..ebe75095 100644
> +--- a/src/output.c
> ++++ b/src/output.c
> +@@ -682,7 +682,7 @@ static void
> + output_skeleton (void)
> + {
> +   /* Compute the names of the package data dir and skeleton files.  */
> +-  char const *m4 = (m4 = getenv ("M4")) ? m4 : M4;
> ++  char const *m4 = m4path ();
> +   char const *datadir = pkgdatadir ();
> +   char *skeldir = xpath_join (datadir, "skeletons");
> +   char *m4sugar = xpath_join (datadir, "m4sugar/m4sugar.m4");
> +-- 
> +2.26.2
> +
> diff --git a/package/bison/bison.mk b/package/bison/bison.mk
> index 2174a9061c..4cc635c445 100644
> --- a/package/bison/bison.mk
> +++ b/package/bison/bison.mk
> @@ -12,5 +12,6 @@ BISON_LICENSE_FILES = COPYING
>  # parallel build issue in examples/c/reccalc/
>  BISON_MAKE = $(MAKE1)
>  HOST_BISON_DEPENDENCIES = host-m4
> +HOST_BISON_CONF_OPTS = --enable-relocatable
>  
>  $(eval $(host-autotools-package))
> -- 
> 2.26.2
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
