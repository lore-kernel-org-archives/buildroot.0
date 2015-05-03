From: Carlos Soto <csotoalonso@gmail.com>
Date: Sun, 3 May 2015 18:11:01 +0200
Subject: [Buildroot] [PATCH] autotools-package: also handle
 pre-installed external toolchain in .la fixup
In-Reply-To: <1430603450-17855-1-git-send-email-arnout@mind.be>
References: <1430603450-17855-1-git-send-email-arnout@mind.be>
Message-ID: <CAD7j7Q_wnis38K8pMdDN6h=zZ6cpD5wnwdey1bExFcqMbFL8jg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-05-02 23:50 GMT+02:00 Arnout Vandecappelle (Essensium/Mind) <
arnout@mind.be>:

> The .la fixup handling looks for paths starting with /usr and assumes
> that they are missing the installation prefix (i.e. $(STAGING_DIR)). It
> already handles the cases that $(STAGING_DIR) itself and $(BASE_DIR)
> are under /usr, but it does not yet handle the case that a
> pre-installed external toolchain is under /usr (and tracks that fact
> in some .la file). For instance, if you use buildroot to generate a
> toolchain with HOST_DIR=/usr/local/some_path, this problem will occur.
>
> Fix this in the same way as $(STAGING_DIR) and $(BASE_DIR), but in
> addition check that TOOLCHAIN_EXTERNAL_INSTALL_DIR is non-empty. For
> internal toolchains, it is empty and the sed expression would fail.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Reported-by: Carlos Soto <csotoalonso@gmail.com>
> Cc: Carlos Soto <csotoalonso@gmail.com>
> ---
> I haven't been able to test this very extensively because it's not so
> easy to find .la files where it goes wrong.
>
> Carlos, can you check if this patch solves the problem for you?
>

Hi Arnout,
I'm afraid it does not work. I've tried patching buildroot but it gave me
errors. So I've applied manually the changes to pkg-autotools.mk and that's
what happened after a make clean && make
find
/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib*
-name "*.la" | xargs --no-run-if-empty /bin/sed -i -e
"s:/home/starsl/iMX6/buildroot/output:@BASE_DIR@:g" -e
"s:/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot:@STAGING_DIR@:g"
-e
"s:/usr/local/xtools/arm-cortexa9_neon-linux-gnueabihf:@TOOLCHAIN_EXTERNAL_INSTALL_DIR@:g"
-e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g"  -e
"s:@TOOLCHAIN_EXTERNAL_INSTALL_DIR@:/usr/local/xtools/arm-cortexa9_neon-linux-gnueabihf:g"
\
/bin/sed: can't read     : No such file or directory
make: ***
[/home/starsl/iMX6/buildroot/output/build/alsa-lib-1.0.28/.stamp_staging_installed]
Error 123





> ---
>  package/pkg-autotools.mk | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index 49b42d4..9dea08a 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -304,10 +304,13 @@ endif
>  # needs to be applied to any path that starts with /usr.
>  #
>  # To protect against the case that the output or staging directories
> -# themselves are under /usr, we first substitute away any occurrences
> -# of these directories as @BASE_DIR@ and @STAGING_DIR at . Note that
> -# STAGING_DIR can be outside BASE_DIR when the user sets BR2_HOST_DIR
> -# to a custom value.
> +# or the pre-installed external toolchain themselves are under /usr,
> +# we first substitute away any occurrences of these directories as
> +# @BASE_DIR@, @STAGING_DIR@ and @TOOLCHAIN_EXTERNAL_INSTALL_DIR@
> respectively.
> +# Note that STAGING_DIR can be outside BASE_DIR when the user sets
> +# BR2_HOST_DIR to a custom value. Note that TOOLCHAIN_EXTERNAL_INSTALL_DIR
> +# can be under @BASE_DIR@ when it's a downloaded toolchain, and can be
> empty
> +# when we use an internal toolchain.
>  #
>  ifndef $(2)_INSTALL_STAGING_CMDS
>  define $(2)_INSTALL_STAGING_CMDS
> @@ -315,7 +318,11 @@ define $(2)_INSTALL_STAGING_CMDS
>         find $$(STAGING_DIR)/usr/lib* -name "*.la" | xargs
> --no-run-if-empty \
>                 $$(SED) "s:$$(BASE_DIR):@BASE_DIR@:g" \
>                         -e "s:$$(STAGING_DIR):@STAGING_DIR@:g" \
> +                       $$(if $$(TOOLCHAIN_EXTERNAL_INSTALL_DIR),\
> +                               -e
> "s:$$(TOOLCHAIN_EXTERNAL_INSTALL_DIR):@TOOLCHAIN_EXTERNAL_INSTALL_DIR@:g")
> \
>                         -e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g" \
> +                       $$(if $$(TOOLCHAIN_EXTERNAL_INSTALL_DIR),\
> +                               -e "s:@TOOLCHAIN_EXTERNAL_INSTALL_DIR@:$$(TOOLCHAIN_EXTERNAL_INSTALL_DIR):g")
> \
>                         -e "s:@STAGING_DIR@:$$(STAGING_DIR):g" \
>                         -e "s:@BASE_DIR@:$$(BASE_DIR):g"
>  endef
> --
> 2.1.4
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150503/6ac25091/attachment.html>
