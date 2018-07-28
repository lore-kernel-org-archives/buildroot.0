From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 29 Jul 2018 00:04:36 +0200
Subject: [Buildroot] ghostscript: wrong fonts path set in target
 application
In-Reply-To: <1532595453473-0.post@n4.nabble.com>
References: <1532519188355-0.post@n4.nabble.com>
 <20180725163732.66eb4956@windsurf> <1532594669999-0.post@n4.nabble.com>
 <1532595453473-0.post@n4.nabble.com>
Message-ID: <0ecb214c-827d-a880-1096-9e7caf8afa7e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26-07-18 10:57, Thomas Ehrhardt wrote:
> Signed-off-by: Thomas Ehrhardt <tehrhardt@innovaphone.com> 
> ---
> --- a/package/ghostscript/ghostscript.mk
> +++ b/package/ghostscript/ghostscript.mk
> @@ -40,7 +40,7 @@
>         --disable-compile-inits \
>         --disable-cups \
>         --enable-fontconfig \
> -       --with-fontpath=$(GHOSTSCRIPT_FONTS_TARGET_DIR) \
> +       --with-fontpath=/usr/share/fonts \

 This diff was containing spaces instead of tabs, so it didn't apply. Please
send patches using git send-email in the future, as explained in the manual.

 I've made this change manually and applied. I've also improved the commit
message with the information you gave in your earlier mail:

    ghostscript: set correct font path on target

    GHOSTSCRIPT_FONTS_TARGET_DIR is set to $(TARGET_DIR)/usr/share/fonts/gs
    in ghostscript-fonts.mk. If we pass this full path to ghostscript, it
    will look for fonts in $(TARGET_DIR), which doesn't exist on the
    target.

    Instead of /usr/share/fonts/gs, use /usr/share/fonts so ghostscript can
    also access other fonts than the ones installed by ghostscript-fonts.


 Can you double-check that commit a76eab228f0bde8597bb6431733e3e1a8d25f806 works
for you?

 Regards,
 Arnout

>         --enable-freetype \
>         --disable-gtk \
>         --without-jbig2dec \
> 
> 
> 
> 
> 
> --
> Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
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
