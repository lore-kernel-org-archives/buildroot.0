From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 May 2018 23:47:36 +0200
Subject: [Buildroot] [PATCH v3 1/1] flatcc: new package
In-Reply-To: <1527714848-31074-1-git-send-email-joel.carlson@cosmicaes.com>
References: <1527714848-31074-1-git-send-email-joel.carlson@cosmicaes.com>
Message-ID: <5107fb5a-50f6-d1c2-b449-cf153c8c1a75@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Joel,

 Thank you for your contribution!

 I have a few minor comments:


On 30-05-18 23:14, Joel Carlson wrote:
> This adds flatcc as a new package, pulling v0.5.1 from github. flatcc
> has both a host tool (the compiler), and libraries for the target.
> 
> Signed-off-by: Joel Carlson <joel.carlson@cosmicaes.com>

 Since it's still fairly close to the original submission, you really should
keep Steve's Sob.

> 
> ---
> First time submitting a patch, so please bear with me.
> This is a follow-up to a patch from 2016 that did not get in.
> My understanding is since I'm not the original submitter, I can't mark
> the old patch as superseded.
> 
> v2: https://patchwork.ozlabs.org/patch/617306/
> Changes v2 -> v3:
>   - Updated to v0.5.1 of flatcc
>   - Removed patches and shared/static magic, as upstream seems to work

 I think it's mostly because we fixed shared/static handling in our cmake-package.

[snip]
> +define FLATCC_HOST_REMOVE_LIBS_AND_HEADERS
> +	rm $(HOST_DIR)/lib/libflatcc*
> +	rm -fr $(HOST_DIR)/include/flatcc/
> +endef

 This is not really needed, we don't care about the size of the host (except if
it is *really* large). And maybe at some point some host package will want to
link with the actual library.

 By the way, does it still work correctly if host and target endianness and/or
bitness are different? (That's a typical issue with code generators; it's
probably OK, but just to be sure.)


 These are all minor nits, can be fixed while applying. Or if you respin, you
can add my
 Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> +
> +define FLATCC_TARGET_REMOVE_FLATCC_COMPILER
> +	rm $(TARGET_DIR)/usr/bin/flatcc
> +endef
> +
> +HOST_FLATCC_POST_INSTALL_HOOKS += FLATCC_HOST_REMOVE_LIBS_AND_HEADERS
> +FLATCC_POST_INSTALL_TARGET_HOOKS += FLATCC_TARGET_REMOVE_FLATCC_COMPILER
> +
> +$(eval $(cmake-package))
> +$(eval $(host-cmake-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
