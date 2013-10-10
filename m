From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Oct 2013 19:27:48 +0200
Subject: [Buildroot] [PATCHv3 20/20] package: remove useless
 SHOW_EXTERNAL_DEPS support
In-Reply-To: <1381256237-27948-21-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1381256237-27948-21-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <5256E394.7000600@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/10/13 20:17, Thomas Petazzoni wrote:
> Now that a package-based 'make external-deps' support has been added,
> the DL_MODE=SHOW_EXTERNAL_DEPS mechanism is no longer needed, so some
> clean up is done in this commit.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

  Looks good. Except:

[snip]
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index bd6169c..1e09efb 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -71,13 +71,10 @@ $(BUILD_DIR)/%/.stamp_rsynced:
>   	rsync -au --cvs-exclude --include core $(SRCDIR)/ $(@D)
>   	$(Q)touch $@
>
> -# Handle the SOURCE_CHECK and SHOW_EXTERNAL_DEPS cases for rsynced
> -# packages
> +# Handle the SOURCE_CHECK case for rsynced packages
>   $(BUILD_DIR)/%/.stamp_rsync_sourced:
>   ifeq ($(DL_MODE),SOURCE_CHECK)
>   	test -d $(SRCDIR)
> -else ifeq ($(DL_MODE),SHOW_EXTERNAL_DEPS)
> -	echo "file://$(SRCDIR)"

  This implies that you did the wrong thing in your previous patch. the 
-show-external-deps target should contain a check for _OVERRIDE_SRCDIR.

  Regards,
  Arnout

>   else
>   	@true # Nothing to do to source a local package
>   endif
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
