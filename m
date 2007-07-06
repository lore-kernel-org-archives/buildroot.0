From: Allan Clark <allanc@chickenandporn.com>
Date: Fri, 6 Jul 2007 10:25:34 -0400
Subject: [Buildroot] MacOSX-10.4.10 buildroot works, one final issue
Message-ID: <37c712e0707060725o455c1d8ay8903ff378459e057@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

with the 5 changes I mentioned in the "please check my patch as a
resolver for bug 1415" thread, and one other change, I'm able to
successfully do a relatively simple buildroot (defaults configured) on
MacOSX-10.4.10 (intel), have not been able to check on PPC 10.4.10.

The one remaining issue:  can anyone tell me why rmdir is used below?

target/ext2/ext2root.mk rev 19006 (18834) @91:
$(EXT2_BASE): host-fakeroot makedevs genext2fs
        - at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIP)
2>/dev/null || true;
        @rm -rf $(TARGET_DIR)/usr/man
        @rm -rf $(TARGET_DIR)/usr/share/man
        @rm -rf $(TARGET_DIR)/usr/info
        @rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
        -/sbin/ldconfig -r $(TARGET_DIR) 2>/dev/null

This seems to be just trying to remove usr/share if it's empty or only
has empty directories to reduce unnecessary dirs on the system.

Is it safe to do this?
        - at rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share

BSD variants don't accept "--ignore-fail-on-non-empty" as a parameter :o(

I appreciate your advice, if anyone knows...

Allan



On 7/5/07, Allan Clark <allanc@chickenandporn.com> wrote:
> On 7/5/07, Steven J. Hill <sjhill@realitydiluted.com> wrote:
> > > I posted a patch for bug #1415; file 1071 seems to resolve for me
> > [...]
> > This is too complicated for me to get your changes. Please send an
> > actual patch to the mailing list. Thanks.
>
> OK; I sent what I used to cut-n-paste into a terminal, it did the
> whole pull/patch/build for me.  Instead, this is the content of the
> file attached to the bug report which resolves 001415 for me.  If you
> or anyone can give some feedback, I'd appreciate it.
>
> Allan
> --
> (http://bugs.uclibc.org/file_download.php?file_id=1071&type=bug follows)
>
> Response to bug #1415 (menuconfig fails), I found that the Kconfig
> import is still wanting to create some deep files without creating the
> subdirectories -- I presume because these directories pre-exist in the
> linux kernel, so don't need to be created.  Since we need them, I mved
> code from the conf_split_function to be visible and usable outside the
> function.  The previous version inside conf_split_config can be
> altered to use mkdirhier, but it currently hasn't been.
>
> The code was originally under buildroot's license, so this patch is
> obviously the same license, if there's any question.
>
> Allan Clark <allanc@chickenandporn.com> 2007-07-05
>
>
> Index: package/config/confdata.c
> ===================================================================
> --- package/config/confdata.c   (revision 19002)
> +++ package/config/confdata.c   (working copy)
> @@ -527,6 +527,44 @@
>         return 0;
>  }
>
> +/** This function creates all parts of the pathname except the last
> item, separated by slashes, as subdirectories */
> +int mkdirhier(char *path)
> +{
> +       /* code originally taken from conf_split_config,
> confdata.c at 614 (rev 18992) */
> +
> +       char *d;
> +       struct stat sb;
> +
> +       /*
> +        * Create directory components,
> +        * unless they exist already.
> +        */
> +       d = path;
> +       while ((d = strchr(d, '/'))) {
> +               *d = 0;
> +               if (stat(path, &sb) && mkdir(path, 0755))
> +                       return 1;
> +               *d++ = '/';
> +       }
> +
> +       return 0;
> +}
> +
> +/** Simply mallocs a copy of the string so that mkdirhier can alter
> it on-the-fly without segfaulting */
> +int const_mkdirhier(const char *path)
> +{
> +       char *p = strdup (path);
> +       int ret;
> +
> +       if (NULL == p)
> +               return 1;
> +
> +       ret = mkdirhier (p);
> +       free (p);
> +       return ret;
> +}
> +
> +
>  int conf_split_config(void)
>  {
>         char *name, path[128];
> @@ -540,6 +578,8 @@
>                 name = "include/config/auto.conf";
>         conf_read_simple(name, S_DEF_AUTO);
>
> +       if (0 != const_mkdirhier ("include/config/xxx"))
> +               return 1;
>         if (chdir("include/config"))
>                 return 1;
>
> @@ -742,6 +782,8 @@
>         name = getenv("KCONFIG_AUTOHEADER");
>         if (!name)
>                 name = "include/linux/autoconf.h";
> +       if (0 != const_mkdirhier (name))
> +               return 1;
>         if (rename(".tmpconfig.h", name))
>                 return 1;
>         name = getenv("KCONFIG_AUTOCONFIG");
>


-- 
allanc at chickenandporn.com  "??" http://linkedin.com/in/goldfish
please, no proprietary attachments (http://tinyurl.com/cbgq)
