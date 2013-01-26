From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 26 Jan 2013 23:03:21 +0100
Subject: [Buildroot] [RFC v1 05/14] autotools infrastructure: do the
 autoreconf as a post patch step
In-Reply-To: <1358725943-31485-6-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1358725943-31485-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <510452A9.4050805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/21/13 00:52, Thomas Petazzoni wrote:
> Doing the autoreconf step as a pre-configure hook doesn't work
> properly, because the source directory is read-only during the
> configure step. And in fact, the autoreconf process modifies the
> source code, so it is quite logical to do it as part of the patching
> process rather than the configuration process.

  It was in fact moved from POST_PATCH to PRE_CONFIGURE in commit 
89d1ad91fe4b1b65f0e902f94aba99a6cefbf631, and the PRE_CONFIGURE_HOOKS 
were added specifically for this purpose. Unfortunately, the commit gives 
no explanation as to why it was needed.


  Regards,
  Arnout

>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
> ---
>   package/pkg-autotools.mk |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index bd87253..ec394fd 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -214,7 +214,7 @@ $(2)_DEPENDENCIES ?= $(filter-out host-automake host-autoconf host-libtool $(1),
>
>
>   ifeq ($$($(2)_AUTORECONF),YES)
> -$(2)_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK
> +$(2)_POST_PATCH_HOOKS += AUTORECONF_HOOK
>   $(2)_DEPENDENCIES += host-automake host-autoconf host-libtool
>   endif
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
