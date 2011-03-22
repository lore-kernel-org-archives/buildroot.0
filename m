From: Eric BENARD <ebenard@free.fr>
Date: Tue, 22 Mar 2011 15:59:22 +0100
Subject: [Buildroot] Compiling Apache
In-Reply-To: <4D89170F.7080305@michaelburghart.de>
References: <4D89170F.7080305@michaelburghart.de>
Message-ID: <4D88B94A.1060609@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 22/03/2011 22:39, Michael Burghart wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> I am new to this list. Nevertheless I am really happy about the
> buildroot tool. Great Work!!
>
> Unfortunately I ran into trouble which I don't understand. I produced a
> working toolchain and managed to post-install things. Now I need to add
> a "httpd-2.3.8" package. But it fails to  build with the following error:
>
> make[4]: Entering directory
> `/LFS/buildroot-2011.02/output/build/httpd-2.2.17/srclib/pcre'
> ./dftables
> /LFS/buildroot-2011.02/output/build/httpd-2.2.17/srclib/pcre/chartables.c
> make[4]: ./dftables: Kommando nicht gefunden
> make[4]: ***
> [/LFS/buildroot-2011.02/output/build/httpd-2.2.17/srclib/pcre/chartables.c]
> Fehler 127
> make[4]: Leaving directory
> `/LFS/buildroot-2011.02/output/build/httpd-2.2.17/srclib/pcre'
> make[3]: *** [all-recursive] Fehler 1
> make[3]: Leaving directory
> `/LFS/buildroot-2011.02/output/build/httpd-2.2.17/srclib/pcre'
> make[2]: *** [all-recursive] Fehler 1
> make[2]: Leaving directory
> `/LFS/buildroot-2011.02/output/build/httpd-2.2.17/srclib'
> make[1]: *** [all-recursive] Fehler 1
> make[1]: Leaving directory
> `/LFS/buildroot-2011.02/output/build/httpd-2.2.17'
> make: ***
> [/LFS/buildroot-2011.02/output/build/httpd-2.2.17/.stamp_built] Fehler 2
>
> ("Fehler" =>>  "Error" :)))
>
> This is my mk file for httpd
>
> HTTPD_VERSION=2.3.8
> HTTPD_SOURCE=httpd-${HTTPD_VERSION}.tar.gz
> HTTPD_SITE=http://ftp-stud.hs-esslingen.de/pub/Mirrors/ftp.apache.org/dist/httpd/
> HTTPD_INSTALL_TARGET=YES
> HTTPD_AUTORECONF=YES
> HTTPD_LIBTOOL_PATCH=YES
> HTTPD_AUTORECONF=YES
> HTTPD_CONF_OPT=  --enable-ldap=no  --enable-ssl --with-pcre=/usr
> - --with-ssl=/usr ap_cv_void_ptr_lt_long=no
> HTTPD_DEPENDENCIES=pcre
>
> Does anybody know about this problem? What am I doing wrong?
>
dftables is a tool which should be compiled for your host as it's used to 
generate pcre_chartables.c . In the present case, it seems dftables can't be 
executed so either it's compiled for your target (but in that cas you would 
get a log saying it has a wrong binary format) or it's not present at all.

Moreover you have HTTPD_VERSION=2.3.8 in your .mk and the log says 
httpd-2.2.17 so there may be something wrong here.

apache is not easy to cross compile, you can check the recipes in OpenEmbedded 
to see what we do there :
http://cgit.openembedded.net/cgit.cgi/openembedded/tree/recipes/apache2/apache2_2.2.17.bb
http://cgit.openembedded.net/cgit.cgi/openembedded/tree/recipes/libpcre/libpcre_8.10.bb
http://cgit.openembedded.net/cgit.cgi/openembedded/tree/recipes/apr/apr_1.4.2.bb
http://cgit.openembedded.net/cgit.cgi/openembedded/tree/recipes/apr/apr-util_1.3.10.bb

Eric
