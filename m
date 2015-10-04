From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 4 Oct 2015 13:38:27 +0100
Subject: [Buildroot] [PATCH v4 2/3] pkg-generic: prevent _SITE URLs with
 a trailing slash
In-Reply-To: <1443892938-17039-3-git-send-email-luca@lucaceresoli.net>
References: <1443892938-17039-1-git-send-email-luca@lucaceresoli.net>
 <1443892938-17039-3-git-send-email-luca@lucaceresoli.net>
Message-ID: <56111DC3.7030109@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03-10-15 18:22, Luca Ceresoli wrote:
> A trailing slash in FOO_SITE is useless, since Buildroot automatically adds
> a slash between FOO_SITE and the filename as appropriate.
> 
> Moreover it is potentially harmful, which led to introducing a workaround
> to strip them:
> 
>     commit 1cbffbd015106ea90fe49e27433375769dc1035b
>     Author: Shawn J. Goff <shawn7400@gmail.com>
>     Date:   Fri Apr 12 09:40:30 2013 +0000
> 
>         eliminate double slashes caused by FOO_SITE ending in a slash
> 
>         When a FOO_SITE variable ends in a slash and gets joined with a
>         FOO_SOURCE variable like $(FOO_SITE)/$(FOO_SOURCE), the resulting URI
>         has a double slash. While double-slashes are fine in unix paths, they
>         are reserved in URIs - the part following '//' must be an authority.
> 
> So let's ban trailing slashes entirely. They have all been removed in
> a 7b0e757fb85fd, now add a check to error out loudly in case a new one
> is added.
> 
> Example commands to test this check:
> 
>   $ make busybox-dirclean busybox-source
>   rm -Rf /home/murray/devel/buildroot/output/build/busybox-1.23.2
>   busybox-1.23.2.tar.bz2: OK (md5: 7925683d7dd105aabe9b6b618d48cc73)
>   busybox-1.23.2.tar.bz2: OK (sha1: 7f37193cb249f27630e0b2a2c6c9bbb7b1d24c16)
>   $
>   $ make BUSYBOX_SITE=http://www.busybox.net/downloads/ busybox-dirclean busybox-source
>   rm -Rf /home/murray/devel/buildroot/output/build/busybox-1.23.2
>   BUSYBOX_SITE (http://www.busybox.net/downloads/) cannot have a trailing slash
>   make[1]: *** [/home/murray/devel/buildroot/output/build/busybox-1.23.2/.stamp_downloaded] Error 1
>   make: *** [_all] Error 2
>   $
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Baruch Siach <baruch@tkos.co.il>

 I'm not going to give it my Rev-by tag since I partly wrote it myself but it
does look good to me.

> 
> ---
> 
> Changed v3 -> v4:
>  - Completely reimplement with make code, not shell code (Arnout actually
>    wrote this patch, I was the typing monkey).
>  - Slightly improve commit log and fix typos (Baruch, me).
> 
> Changed v2 -> v3:
>  - Simplify the check logic removing a useless "&& true".
>  - Expand commit log message. This is a pretty important change, so it
>    should be well justified.
> ---
>  package/pkg-generic.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 5201fca..de2fb07 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -847,6 +847,10 @@ endif
>  	$(1)-source \
>  	$(1)-source-check
>  
> +ifeq ($$(patsubst %/,ERROR,$$($(2)_SITE)),ERROR)

 Note that by subsituting with ERROR instead of empty, we make sure that we
don't error when _SITE is empty.

 Regards,
 Arnout

> +$$(error $(2)_SITE ($$($(2)_SITE)) cannot have a trailing slash)
> +endif
> +
>  endif # $(2)_KCONFIG_VAR
>  endef # inner-generic-package
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
