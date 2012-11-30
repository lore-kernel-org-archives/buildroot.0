From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 30 Nov 2012 09:18:08 +0100
Subject: [Buildroot] [PATCH 2/2] libsigc: Don't copy devel documentation
 onto target
In-Reply-To: <1354239752-18102-1-git-send-email-cdhmanning@gmail.com>
References: <1354239752-18102-1-git-send-email-cdhmanning@gmail.com>
Message-ID: <50B86BC0.5070107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/11/12 02:42, Charles Manning wrote:
> The libsigc++ developer documentation was being copied onto the target.
> Add a clean-up to fix that.
>
> There is probably a better way to do this but I still have training wheels.

  A command like that should typically go below ---, otherwise it will
appear in the git log for all eternity...

>
> Signed-off-by: Charles Manning<cdhmanning@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


> ---
>   package/libsigc/libsigc.mk |    6 ++++++
>   1 files changed, 6 insertions(+), 0 deletions(-)
>
> diff --git a/package/libsigc/libsigc.mk b/package/libsigc/libsigc.mk
> index 92d1d8b..10f5803 100644
> --- a/package/libsigc/libsigc.mk
> +++ b/package/libsigc/libsigc.mk
> @@ -8,4 +8,10 @@ LIBSIGC_SOURCE = libsigc++-$(LIBSIGC_VERSION).tar.bz2
>   LIBSIGC_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.2
>   LIBSIGC_INSTALL_STAGING = YES
>
> +define LIBSIGC_INSTALL_TARGET_FIXUP
> +	rm -rf $(TARGET_DIR)/usr/share/devhelp/books/libsigc++*

  Perhaps we should globally remove devhelp together with man and doc?
OTOH this is currently the only package that installs anything in
devhelp.

  BTW, if someone wanted to remark that this shouldn't be done if
BR2_HAVE_DOCUMENTATION is y: we don't have a devhelp reader, so installing
the devhelp texts is always pointless.


  Regards,
  Arnout

> +endef
> +
> +LIBSIGC_POST_INSTALL_TARGET_HOOKS += LIBSIGC_INSTALL_TARGET_FIXUP
> +
>   $(eval $(autotools-package))

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
