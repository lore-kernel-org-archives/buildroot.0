From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sun, 10 Jun 2012 11:14:57 +0200
Subject: [Buildroot] [PATCH] busybox 1.20.1: add patches for ash,
 ifupdown, man and tar
In-Reply-To: <1339267126-25350-1-git-send-email-gustavo@zacarias.com.ar>
References: <1339267126-25350-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <CAAXf6LUbp3s2S22ADeUrXooMHwc2mhAz1V79r1VoEfTcVCrEqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Op 9 jun. 2012 20:39 schreef "Gustavo Zacarias" <gustavo@zacarias.com.ar>
het volgende:
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../busybox-1.20.1/busybox-1.20.1-ash.patch        |   12 +++
>  .../busybox-1.20.1/busybox-1.20.1-ifupdown.patch   |   75
++++++++++++++++++++
>  .../busybox-1.20.1/busybox-1.20.1-man.patch        |   34 +++++++++
>  .../busybox-1.20.1/busybox-1.20.1-tar.patch        |   11 +++
>  4 files changed, 132 insertions(+), 0 deletions(-)
>  create mode 100644
package/busybox/busybox-1.20.1/busybox-1.20.1-ash.patch
>  create mode 100644
package/busybox/busybox-1.20.1/busybox-1.20.1-ifupdown.patch
>  create mode 100644
package/busybox/busybox-1.20.1/busybox-1.20.1-man.patch
>  create mode 100644
package/busybox/busybox-1.20.1/busybox-1.20.1-tar.patch
>
> diff --git a/package/busybox/busybox-1.20.1/busybox-1.20.1-ash.patch
b/package/busybox/busybox-1.20.1/busybox-1.20.1-ash.patch
> new file mode 100644
> index 0000000..a012a70
> --- /dev/null
> +++ b/package/busybox/busybox-1.20.1/busybox-1.20.1-ash.patch
> @@ -0,0 +1,12 @@
> +--- busybox-1.20.1/shell/ash.c
> ++++ busybox-1.20.1-ash/shell/ash.c
> +@@ -6846,8 +6846,7 @@ evalvar(char *p, int flags, struct strli
> +               patloc = expdest - (char *)stackblock();
> +               if (NULL == subevalvar(p, /* varname: */ NULL, patloc,
subtype,
> +                               startloc, varflags,
> +-//TODO: | EXP_REDIR too? All other such places do it too
> +-                              /* quotes: */ flags & (EXP_FULL |
EXP_CASE),
> ++                              /* quotes: */ flags & (EXP_FULL |
EXP_CASE | EXP_REDIR),
> +                               var_str_list)
> +               ) {
> +                       int amount = expdest - (
> diff --git a/package/busybox/busybox-1.20.1/busybox-1.20.1-ifupdown.patch
b/package/busybox/busybox-1.20.1/busybox-1.20.1-ifupdown.patch
> new file mode 100644
> index 0000000..b2a9456
> --- /dev/null
> +++ b/package/busybox/busybox-1.20.1/busybox-1.20.1-ifupdown.patch
> @@ -0,0 +1,75 @@
> +--- busybox-1.20.1/networking/ifupdown.c
> ++++ busybox-1.20.1-ifupdown/networking/ifupdown.c
> +@@ -140,8 +140,6 @@ static const char keywords_up_down[] ALI
> +       "up\0"
> +       "down\0"
> +       "pre-up\0"
> +-      "pre-down\0"
> +-      "post-up\0"
> +       "post-down\0"
> + ;
> +
> +@@ -895,6 +893,11 @@ static struct interfaces_file_t *read_in
> +                               if (rest_of_line[0] == '\0')
> +                                       bb_error_msg_and_die("option with
empty value \"%s\"", buf);
> +
> ++                              if (strcmp(first_word, "post-up") == 0)
> ++                                      first_word += 5; /* "up" */
> ++                              else if (strcmp(first_word, "pre-down")
== 0)
> ++                                      first_word += 4; /* "down" */
> ++
> +                               /* If not one of "up", "down",...
words... */
> +                               if (index_in_strings(keywords_up_down,
first_word) < 0) {
> +                                       int i;
> +@@ -963,7 +966,7 @@ static char *setlocalenv(const char *for
> +       return result;
> + }
> +
> +-static void set_environ(struct interface_defn_t *iface, const char
*mode)
> ++static void set_environ(struct interface_defn_t *iface, const char
*mode, const char *opt)
> + {
> +       int i;
> +       char **pp;
> +@@ -976,7 +979,7 @@ static void set_environ(struct interface
> +       }
> +
> +       /* note: last element will stay NULL: */
> +-      G.my_environ = xzalloc(sizeof(char *) * (iface->n_options + 6));
> ++      G.my_environ = xzalloc(sizeof(char *) * (iface->n_options + 7));
> +       pp = G.my_environ;
> +
> +       for (i = 0; i < iface->n_options; i++) {
> +@@ -990,6 +993,7 @@ static void set_environ(struct interface
> +       *pp++ = setlocalenv("%s=%s", "ADDRFAM",
iface->address_family->name);
> +       *pp++ = setlocalenv("%s=%s", "METHOD", iface->method->name);
> +       *pp++ = setlocalenv("%s=%s", "MODE", mode);
> ++      *pp++ = setlocalenv("%s=%s", "PHASE", opt);
> +       if (G.startup_PATH)
> +               *pp++ = setlocalenv("%s=%s", "PATH", G.startup_PATH);
> + }
> +@@ -1044,21 +1048,21 @@ static int check(char *str)
> + static int iface_up(struct interface_defn_t *iface)
> + {
> +       if (!iface->method->up(iface, check)) return -1;
> +-      set_environ(iface, "start");
> ++      set_environ(iface, "start", "pre-up");
> +       if (!execute_all(iface, "pre-up")) return 0;
> +       if (!iface->method->up(iface, doit)) return 0;
> ++      set_environ(iface, "start", "post-up");
> +       if (!execute_all(iface, "up")) return 0;
> +-      if (!execute_all(iface, "post-up")) return 0;
> +       return 1;
> + }
> +
> + static int iface_down(struct interface_defn_t *iface)
> + {
> +       if (!iface->method->down(iface,check)) return -1;
> +-      set_environ(iface, "stop");
> +-      if (!execute_all(iface, "pre-down")) return 0;
> ++      set_environ(iface, "stop", "pre-down");
> +       if (!execute_all(iface, "down")) return 0;
> +       if (!iface->method->down(iface, doit)) return 0;
> ++      set_environ(iface, "stop", "post-down");
> +       if (!execute_all(iface, "post-down")) return 0;
> +       return 1;
> + }
> diff --git a/package/busybox/busybox-1.20.1/busybox-1.20.1-man.patch
b/package/busybox/busybox-1.20.1/busybox-1.20.1-man.patch
> new file mode 100644
> index 0000000..f382e07
> --- /dev/null
> +++ b/package/busybox/busybox-1.20.1/busybox-1.20.1-man.patch
> @@ -0,0 +1,34 @@
> +--- busybox-1.20.1/miscutils/man.c
> ++++ busybox-1.20.1-man/miscutils/man.c
> +@@ -129,27 +129,21 @@ static int show_manpage(const char *page
> + #endif
> + #if ENABLE_FEATURE_SEAMLESS_XZ
> +       strcpy(ext, "xz");
> +-      if (run_pipe(pager, man_filename, man, level))
> ++      if (run_pipe(pager, filename_with_zext, man, level))
> +               return 1;
> + #endif
> + #if ENABLE_FEATURE_SEAMLESS_BZ2
> +       strcpy(ext, "bz2");
> +-      if (run_pipe(pager, man_filename, man, level))
> ++      if (run_pipe(pager, filename_with_zext, man, level))
> +               return 1;
> + #endif
> + #if ENABLE_FEATURE_SEAMLESS_GZ
> +       strcpy(ext, "gz");
> +-      if (run_pipe(pager, man_filename, man, level))
> ++      if (run_pipe(pager, filename_with_zext, man, level))
> +               return 1;
> + #endif
> +
> +-#if SEAMLESS_COMPRESSION
> +-      ext[-1] = '\0';
> +-#endif
> +-      if (run_pipe(pager, man_filename, man, level))
> +-              return 1;
> +-
> +-      return 0;
> ++      return run_pipe(pager, man_filename, man, level);
> + }
> +
> + int man_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
> diff --git a/package/busybox/busybox-1.20.1/busybox-1.20.1-tar.patch
b/package/busybox/busybox-1.20.1/busybox-1.20.1-tar.patch
> new file mode 100644
> index 0000000..4129b65
> --- /dev/null
> +++ b/package/busybox/busybox-1.20.1/busybox-1.20.1-tar.patch
> @@ -0,0 +1,11 @@
> +--- busybox-1.20.1/archival/libarchive/get_header_tar.c
> ++++ busybox-1.20.1-tar/archival/libarchive/get_header_tar.c
> +@@ -84,7 +84,7 @@ static unsigned long long getOctal(char
> +               first >>= 1; /* now 7th bit = 6th bit */
> +               v = first;   /* sign-extend 8 bits to 64 */
> +               while (--len != 0)
> +-                      v = (v << 8) + (unsigned char) *str++;
> ++                      v = (v << 8) + (uint8_t) *++str;
> +       }
> +       return v;
> + }

Shouldn't there be some comments and signed-off-by lines in these patches?

Now it's a bit magical...

Best regards,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120610/f9cdc8ed/attachment.html>
