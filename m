From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Mar 2020 22:57:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/libostree: disable introspection
In-Reply-To: <20200320172948.1971589-1-fontaine.fabrice@gmail.com>
References: <20200320172948.1971589-1-fontaine.fabrice@gmail.com>
Message-ID: <20200321215713.GO4290@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-03-20 18:29 +0100, Fabrice Fontaine spake thusly:
> Build fails if gobject-introspection is built before libostree:
> 
> ./.libs/libostree-1.so: error adding symbols: File in wrong format
> collect2: error: ld returned 1 exit status
> src/libostree/ostree-repo-deprecated.h:28: Warning: OSTree: symbol='G_GNUC_DEPRECATED_FOR': Skipping foreign symbol from namespace Gio
> linking of temporary binary failed: Command '['/bin/bash', './libtool', '--mode=link', '--tag=CC', '--silent', 'gcc', '-o', '/home/buildroot/autobuild/instance-2/output-1/build/libostree-2019.6/tmp-introspectvtkql2xj/OSTree-1.0', '-export-dynamic', '-D_LARGEFILE_SOURCE', '-D_LARGEFILE64_SOURCE', '-D_FILE_OFFSET_BITS=64', '-D_LARGEFILE_SOURCE', '-D_LARGEFILE64_SOURCE', '-D_FILE_OFFSET_BITS=64', '-Os', '/home/buildroot/autobuild/instance-2/output-1/build/libostree-2019.6/tmp-introspectvtkql2xj/OSTree-1.0.o', '-L.', 'libostree-1.la', '-L/home/buildroot/autobuild/instance-2/output-1/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib', '-lgio-2.0', '-lgobject-2.0', '-Wl,--export-dynamic', '-lgmodule-2.0', '-pthread', '-lglib-2.0', '-lglib-2.0']' returned non-zero exit status 1.
> /home/buildroot/autobuild/instance-2/output-1/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/../share/gobject-introspection-1.0/Makefile.introspection:155: recipe for target 'OSTree-1.0.gir' failed
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f8a14307e6feff61acd963d6cd2aac289e6d1647
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

However, I'd like to point out that we should now have proper introspection
support in Buildroot; if we explicitly disable it in all packages, that
does not help much. It would be nice to lend a hand to Adam to help
bring introspection support in packages that are supposed to be able to
support it.

Yes, I already said that I'd take any patch that explicitly disables it,
but this should be more motivated than just "the build breaks". Here the
real motivation should not be just about reporting the build failure,
but also anylsing it and concluding, as an example, that "libostree is
borked for GOI and corss-compilation because it forcibly uses the host
compiler to link with target libs".

Of course, the above explanation in itself hints at fixing this
hard-coded call, but that;s just an example of a better justification of
a change.

And note that this is not only about GOI; it's about all patches: they
should not just report the build failure; they should explain it.

And last but not least, this is not just for you. The above is valid for
everyone. You just happened to be the one to take the hit; sorry.

Regards,
Yann E. MORIN.

> ---
>  package/libostree/libostree.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
> index bdbe6b5aba..ff763b20f9 100644
> --- a/package/libostree/libostree.mk
> +++ b/package/libostree/libostree.mk
> @@ -21,6 +21,7 @@ LIBOSTREE_CONF_OPTS += \
>  	--disable-gtk-doc \
>  	--disable-gtk-doc-html \
>  	--disable-gtk-doc-pdf \
> +	--disable-introspection \
>  	--disable-man
>  
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
> -- 
> 2.25.1
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
