From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Jul 2018 21:52:19 +0200
Subject: [Buildroot] [PATCH] ncurses: make host-ncurses use host terminfo
In-Reply-To: <5f7fe697b92ac0145674.1531241163@cveaol6qa08.wv.mentorg.com>
References: <5f7fe697b92ac0145674.1531241163@cveaol6qa08.wv.mentorg.com>
Message-ID: <16ee7c33-4e5d-63d2-3778-cf362d4473b1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-07-18 18:46, Hollis Blanchard wrote:
> # HG changeset patch
> # User Hollis Blanchard <hollis_blanchard@mentor.com>
> # Date 1531239381 25200
> #      Tue Jul 10 09:16:21 2018 -0700
> # Node ID 5f7fe697b92ac0145674a6c96aad0f787b4bae32
> # Parent  d71314cdccf1993ccdb05cddb16a5491f0bf723e
> ncurses: make host-ncurses use host terminfo
> 
> Host GDB suffers a serious problem: pressing backspace (or ^W ^U or any other
> "delete" key) results in a plain space being printed instead, making the
> command prompt almost completely unusable.
> 
> That's because it's using host-ncurses, which embeds a path for the terminfo
> database into the library itself. That path ends up being something like
> /home/hollisb/buildroot.git/output/host/share/terminfo, which obviously doesn't
> generally exist other hosts. ('relocate-sdk.sh' cannot and does not edit
> binaries like libncurses.so.6, so doesn't resolve this problem.)
> 
> /usr/share/terminfo is a far better path to use, since it almost certainly
> exists on the host. Theoretically, it could be from a different ncurses version
> with incompatible terminfo database format, but this doesn't seem to be a
> problem in practice. (Future patches could address the theoretical problem if
> it actually appears in real life.)

 Indeed, the terminfo information is standardized AFAIU so this should indeed work.

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> This change allows buildroot's host gdb, which uses ncurses 6.x, to work on
> RHEL5, RHEL6, and RHEL7, which all provide terminfo from ncurses 5.x.
> 
> Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
> 
> diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
> --- a/package/ncurses/ncurses.mk
> +++ b/package/ncurses/ncurses.mk
> @@ -153,6 +153,7 @@ HOST_NCURSES_CONF_OPTS = \
>  	--without-cxx \
>  	--without-cxx-binding \
>  	--without-ada \
> +	--with-default-terminfo-dir=/usr/share/terminfo \
>  	--without-normal
>  
>  $(eval $(autotools-package))
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
