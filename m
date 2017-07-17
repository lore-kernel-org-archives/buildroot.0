From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Jul 2017 22:52:31 +0200
Subject: [Buildroot] [PATCH] package/Makefile.in: export O= to
 post-build/image scripts for out-of-tree builds
In-Reply-To: <20170714130417.18857-1-peter@korsgaard.com>
References: <20170714130417.18857-1-peter@korsgaard.com>
Message-ID: <7d2448b0-800c-cb14-657b-907d380787f8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-07-17 15:04, Peter Korsgaard wrote:
> Sometimes it can be interesting to call back into buildroot from a
> post-build/image script (E.G. make printvars or similar). For this to work
> correctly with out-of-tree builds we need to pass O= to make, but this is
> currently not available in the environment of post-build/image scripts.
> 
> In concept, O could be derrived from BUILD_DIR (E.G. by stripping /build),
> but directly exporting O is cleaner.
> 
> O= cannot be exported globally as it interferes with various build systems,
> so instead add it to EXTRA_ENV.

 I'm too late with this comment, but why is BASE_DIR not sufficient? It is
already exported, and it is set to:

BASE_DIR := $(CANONICAL_O)

 O has the problem that it's too risky to lead to conflicts IMO.

 IOW I vote for a revert of this patch.

 Regards,
 Arnout


> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/Makefile.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index b95e5e3fa8..a2b0d90f32 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -309,7 +309,8 @@ HOST_CONFIGURE_OPTS = \
>  EXTRA_ENV = \
>  	PATH=$(BR_PATH) \
>  	BR2_DL_DIR=$(BR2_DL_DIR) \
> -	BUILD_DIR=$(BUILD_DIR)
> +	BUILD_DIR=$(BUILD_DIR) \
> +	O=$(CANONICAL_O)
>  
>  ################################################################################
>  # settings we need to pass to configure
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
