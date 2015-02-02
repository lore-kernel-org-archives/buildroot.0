From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 02 Feb 2015 18:35:09 +0100
Subject: [Buildroot] [PATCH 3/3] qt: Force arm mode instead of Thumb1
 mode
In-Reply-To: <1421753079-27665-3-git-send-email-richard.genoud@gmail.com>
References: <1421753079-27665-1-git-send-email-richard.genoud@gmail.com>
 <1421753079-27665-3-git-send-email-richard.genoud@gmail.com>
Message-ID: <54CFB54D.6070207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/01/15 12:24, Richard Genoud wrote:
> Qt has some assembly that doesn't exist in thumb1 mode.
> So, force arm mode for Qt
>
> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>

Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 It fails when the patch is not applied even on the most minimal
config. It succeeds with the patch applied.


 Regards,
 Arnout

> ---
>  package/qt/qt.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/package/qt/qt.mk b/package/qt/qt.mk
> index 255d6d2ab0e4..80605ca514d5 100644
> --- a/package/qt/qt.mk
> +++ b/package/qt/qt.mk
> @@ -52,6 +52,14 @@ endif
>  
>  endif
>  
> +# Qt has some assembly function that are not present in thumb1 mode:
> +# Error: selected processor does not support Thumb mode `swp r3,r7,[r4]'
> +# so, we desactivate thumb mode
> +ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
> +QT_CFLAGS += -marm
> +QT_CXXFLAGS += -marm
> +endif
> +
>  ifeq ($(BR2_PACKAGE_QT_QT3SUPPORT),y)
>  QT_CONFIGURE_OPTS += -qt3support
>  else


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
