From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Fri, 14 Dec 2012 23:01:33 +0200
Subject: [Buildroot] [PATCH] gettext: bump to version 0.18.1.1
In-Reply-To: <A30A1B4688B14FF0A9174D8D473754CD@JohanW7>
References: <1355428977-8297-1-git-send-email-gustavo@zacarias.com.ar>
 <871ueskiar.fsf@dell.be.48ers.dk> <A30A1B4688B14FF0A9174D8D473754CD@JohanW7>
Message-ID: <50CB93AD.20303@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Johan

14.12.2012 20:08, Sagaert Johan kirjoitti:
> Hi
>
> After pulling the latest commits : 
>
> libtool: compile:  /home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -c
> -DLOCALEDIR=\"/usr/share/locale\" -DLOCALE_ALIAS_PATH=\"/usr/share/locale\" -DLIBDIR=\"/usr/lib\" -DBUILDING_LIBINTL -DBUILDING_DLL
> -DIN_LIBINTL -DENABLE_RELOCATABLE=1 -DIN_LIBRARY -DINSTALLDIR=\"/usr/lib\" -DNO_XMALLOC
> -Dset_relocation_prefix=libintl_set_relocation_prefix -Drelocate=libintl_relocate -DDEPENDS_ON_LIBICONV=1 -DHAVE_CONFIG_H -I. -I.
> -I.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64 -pipe -Os -fvisibility=hidden ./printf.c -o printf.o >/dev/null 2>&1
> ./localename.c: In function '_nl_locale_name_thread_unsafe':
> ./localename.c:2619:31: error: dereferencing pointer to incomplete type
> make[4]: *** [localename.lo] Error 1
> make[4]: *** Waiting for unfinished jobs....
>
> Using uClibc 0.9.33.1 (NTPL)
>
> Regards , Johan
>  
Hmmm...
That sounds familiar. If I remember correctly I hit exactly into same
problem in my own Linux distro
some time ago.

Could you please try the following lil patch ?
(I will include it as an separete attachment here also)

diff --git a/gettext-runtime/intl/localename.c
b/gettext-runtime/intl/localename.c
index 89a9692..5e86bc4 100644
--- a/gettext-runtime/intl/localename.c
+++ b/gettext-runtime/intl/localename.c
@@ -2607,7 +2607,7 @@ gl_locale_name_thread_unsafe (int category, const
char *categoryname)
     locale_t thread_locale = uselocale (NULL);
     if (thread_locale != LC_GLOBAL_LOCALE)
       {
-#  if __GLIBC__ >= 2
+#  if __GLIBC__ >= 2 && !defined __UCLIBC__
         /* Work around an incorrect definition of the _NL_LOCALE_NAME
macro in
            glibc < 2.12.
            See <http://sourceware.org/bugzilla/show_bug.cgi?id=10968>.  */
diff --git a/gettext-tools/gnulib-lib/localename.c
b/gettext-tools/gnulib-lib/localename.c
index dab5e5b..85149ac 100644
--- a/gettext-tools/gnulib-lib/localename.c
+++ b/gettext-tools/gnulib-lib/localename.c
@@ -2607,7 +2607,7 @@ gl_locale_name_thread_unsafe (int category, const
char *categoryname)
     locale_t thread_locale = uselocale (NULL);
     if (thread_locale != LC_GLOBAL_LOCALE)
       {
-#  if __GLIBC__ >= 2
+#  if __GLIBC__ >= 2 && !defined __UCLIBC__
         /* Work around an incorrect definition of the _NL_LOCALE_NAME
macro in
            glibc < 2.12.
            See <http://sourceware.org/bugzilla/show_bug.cgi?id=10968>.  */

Regards
Stefan


>
> -----Oorspronkelijk bericht-----
> Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Peter Korsgaard
> Verzonden: vrijdag 14 december 2012 12:03
> Aan: Gustavo Zacarias
> CC: buildroot at busybox.net
> Onderwerp: Re: [Buildroot] [PATCH] gettext: bump to version 0.18.1.1
>
>>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:
>  Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>
> Committed, thanks.
>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
diff --git a/gettext-runtime/intl/localename.c b/gettext-runtime/intl/localename.c
index 89a9692..5e86bc4 100644
--- a/gettext-runtime/intl/localename.c
+++ b/gettext-runtime/intl/localename.c
@@ -2607,7 +2607,7 @@ gl_locale_name_thread_unsafe (int category, const char *categoryname)
     locale_t thread_locale = uselocale (NULL);
     if (thread_locale != LC_GLOBAL_LOCALE)
       {
-#  if __GLIBC__ >= 2
+#  if __GLIBC__ >= 2 && !defined __UCLIBC__
         /* Work around an incorrect definition of the _NL_LOCALE_NAME macro in
            glibc < 2.12.
            See <http://sourceware.org/bugzilla/show_bug.cgi?id=10968>.  */
diff --git a/gettext-tools/gnulib-lib/localename.c b/gettext-tools/gnulib-lib/localename.c
index dab5e5b..85149ac 100644
--- a/gettext-tools/gnulib-lib/localename.c
+++ b/gettext-tools/gnulib-lib/localename.c
@@ -2607,7 +2607,7 @@ gl_locale_name_thread_unsafe (int category, const char *categoryname)
     locale_t thread_locale = uselocale (NULL);
     if (thread_locale != LC_GLOBAL_LOCALE)
       {
-#  if __GLIBC__ >= 2
+#  if __GLIBC__ >= 2 && !defined __UCLIBC__
         /* Work around an incorrect definition of the _NL_LOCALE_NAME macro in
            glibc < 2.12.
            See <http://sourceware.org/bugzilla/show_bug.cgi?id=10968>.  */
