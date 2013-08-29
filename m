From: rjbarnet at rockwellcollins.com <rjbarnet@rockwellcollins.com>
Date: Thu, 29 Aug 2013 16:39:21 -0500
Subject: [Buildroot] [PATCH 2/2] libcurl: remove man and static lib from
	target
In-Reply-To: <521FBF1D.7010000@mind.be>
References: <1377806833-31991-1-git-send-email-rjbarnet@rockwellcollins.com>
 <1377806833-31991-3-git-send-email-rjbarnet@rockwellcollins.com>
 <521FBF1D.7010000@mind.be>
Message-ID: <OFA4C82732.EC00E34B-ON86257BD6.0076DE78-86257BD6.0076F564@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout - 

As stated in my previous email - I didn't realize target finalize takes 
care of this. I will resubmit with just upgrading the libcurl version.

Thanks,
-Ryan



Ryan J Barnett / Software Engineer / Platform SW 
MS 137-157, 855 35th St NE, Cedar Rapids, IA, 52498-3161, US
Phone: 319-263-3880 / VPN: 263-3880 
rjbarnet at rockwellcollins.com
www.rockwellcollins.com 




From:   Arnout Vandecappelle <arnout@mind.be>
To:     Ryan Barnett <rjbarnet@rockwellcollins.com>
Cc:     buildroot at busybox.net
Date:   08/29/2013 04:37 PM
Subject:        Re: [Buildroot] [PATCH 2/2] libcurl: remove man and static 
lib from target



On 08/29/13 22:07, Ryan Barnett wrote:
> Remove the documentation that libcurl installs on the target along
> with removing the static libraries on the target. The documentation
> and static library will only exist in the sysroot.

  This shouldn't be needed as it is done by target-finalize. Or doesn't 
that work for you?

  Regards,
  Arnout

>
> Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> ---
>   package/libcurl/libcurl.mk |   20 ++++++++++++++++++++
>   1 files changed, 20 insertions(+), 0 deletions(-)
>
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 79c16eb..caf355d 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -54,6 +54,26 @@ endef
>   LIBCURL_POST_INSTALL_TARGET_HOOKS += LIBCURL_TARGET_CLEANUP
>   endif
>
> +# Remove unneeded files/directories from target
> +LIBCURL_UNNEEDED_FILES = \
> +              usr/lib/libcurl.a \
> +              usr/lib/libcurl.la \
> +              usr/include/curl \
> +              usr/lib/pkgconfig/libcurl.pc
> +define LIBCURL_REMOVE_UNNEEDED_FILES
> +              rm -rf $(addprefix $(TARGET_DIR)/, 
$(LIBCURL_UNNEEDED_FILES))
> +endef
> +LIBCURL_POST_INSTALL_TARGET_HOOKS += LIBCURL_REMOVE_UNNEEDED_FILES
> +
> +# Remove Documentation
> +ifneq ($(BR2_HAVE_DOCUMENTATION),y)
> +define LIBCURL_TARGET_REMOVE_DOCUMENTATION
> +              rm -f $(TARGET_DIR)/usr/share/man/man3/*curl*
> +              rm -f $(TARGET_DIR)/usr/share/man/man1/*curl*
> +endef
> +LIBCURL_POST_INSTALL_TARGET_HOOKS += 
LIBCURL_TARGET_REMOVE_DOCUMENTATION
> +endif
> +
>   $(eval $(autotools-package))
>
>   curl: libcurl
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130829/0233203c/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: image/gif
Size: 2004 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130829/0233203c/attachment.gif>
