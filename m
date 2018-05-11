From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 May 2018 13:11:21 +0200
Subject: [Buildroot] [PATCH 2/3] go: honor building with V=1 for
 debugging purposes
In-Reply-To: <20180511101020.10295-3-anisse@astier.eu>
References: <20180511101020.10295-1-anisse@astier.eu>
 <20180511101020.10295-3-anisse@astier.eu>
Message-ID: <20180511131121.28481b7d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Anisse,

On Fri, 11 May 2018 12:10:19 +0200, Anisse Astier wrote:
> Signed-off-by: Anisse Astier <anisse@astier.eu>
> ---
>  package/go/go.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/go/go.mk b/package/go/go.mk
> index 37bb9801c2..bc5aca2bb7 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -76,10 +76,13 @@ HOST_GO_TARGET_CC = \
>  	CC_FOR_TARGET="$(TARGET_CC)" \
>  	CXX_FOR_TARGET="$(TARGET_CXX)"
>  
> +ifneq ($(V),)
> +VERBOSE=-v

Please name the variable GO_VERBOSE and not just VERBOSE. Remember that
Buildroot has a global namespace of make variables, so if you define
VERBOSE here, you override the value of the VERBOSE variable defined in
the main Makefile.

Also, please use VERBOSE instead of testing $(V).

Perhaps do just like cargo.mk is doing:

HOST_CARGO_SNAP_OPTS = \
        --release \
        $(if $(VERBOSE),--verbose)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
