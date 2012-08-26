From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 Aug 2012 00:05:30 +0200
Subject: [Buildroot] relative DL_DIR okay?
In-Reply-To: <CANxTyt6qz5eUv54zyJXBsg_jVZjKjc+vETz905P-L9ST45j7bQ@mail.gmail.com>
References: <CANxTyt6qz5eUv54zyJXBsg_jVZjKjc+vETz905P-L9ST45j7bQ@mail.gmail.com>
Message-ID: <503A9DAA.9000007@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/23/12 05:03, Danomi Manchego wrote:
[snip]
> So, if DL_DIR must be an absolute path, then I think that I can fix this
> problem by setting DL_DIR to "$(CURDIR)/../../../packages" in my menuconfig.

  Better set it to $(TOPDIR)/../../../packages.  Note that the default is
$(TOPDIR)/dl, which should give a hint that it should be an absolute path :-)

>
> If an absolute path requirement was not intended, then I believe that this
> problem can be fixed with the following mod to DOWNLOAD_GIT:
>
> diff --git a/package/pkg-download.mk <http://pkg-download.mk/> b/package/pkg-download.mk <http://pkg-download.mk/>
> index 9e98581..e1b1bed 100644
> --- a/package/pkg-download.mk <http://pkg-download.mk/>
> +++ b/package/pkg-download.mk <http://pkg-download.mk/>
> @@ -68,10 +68,10 @@ define DOWNLOAD_GIT
>          test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
>          (pushd $(DL_DIR) > /dev/null && \
>          $(GIT) clone --bare $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
> -       pushd $($(PKG)_BASE_NAME) > /dev/null && \
> +       cd $($(PKG)_BASE_NAME) && \
>          $(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/ $($(PKG)_DL_VERSION) | \
> -               gzip -c > $(DL_DIR)/$($(PKG)_SOURCE) && \
> -       popd > /dev/null && \
> +               gzip -c > ../$($(PKG)_SOURCE) && \
> +       cd .. && \
>          rm -rf $($(PKG)_DL_DIR) && \
>          popd > /dev/null)
>   endef
>
> (The pushd/popd don't have to change to cd, but I think it emphasizes the
> relationship to the "../".)

  Patch looks good.  Care to resubmit as a proper patch (sent with
git send-email, with a proper Signed-off-by tag and a commit message)?
Is something similar needed for other VCSes?

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
