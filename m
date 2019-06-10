From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Jun 2019 13:53:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-golang: add cflags/ldflags
 to GO_HOST_ENV
In-Reply-To: <20190603092101.8658-1-mirza.krak@northern.tech>
References: <20190603092101.8658-1-mirza.krak@northern.tech>
Message-ID: <7ccf0442-d03f-05f8-c9c5-338f975b5d3b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/06/2019 11:21, Mirza Krak wrote:
> If a go host package is built using cgo, it needs access
> to HOST_CFLAGS/HOST_LDFLAGS to utilize host packages it
> might depend on.
> 
> Signed-off-by: Mirza Krak <mirza.krak@northern.tech>

 I apparently forgot to mention that I applied this to master, thanks. However...

> ---
> 
> This fixes current build errors of mender-artifact-3.0.0:
> 
> http://autobuild.buildroot.net/results/dd1a6dac03dd3b68ee63761c33dbb01c328d4f14/build-end.log

 Still failing:

http://autobuild.buildroot.net/results/f9b/f9ba64ab4c8d7fa6cb301fab37ee4141ba442f61/build-end.log

 I think the problem is that it is being linked statically, but host-xz only
builds the shared library...

 Regards,
 Arnout

> 
>  package/pkg-golang.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
> index b4e8a53065..72e8f6b7af 100644
> --- a/package/pkg-golang.mk
> +++ b/package/pkg-golang.mk
> @@ -35,6 +35,8 @@ GO_TARGET_ENV = \
>  	$(GO_COMMON_ENV)
> 
>  GO_HOST_ENV = \
> +	CGO_CFLAGS="$(HOST_CFLAGS)" \
> +	CGO_LDFLAGS="$(HOST_LDFLAGS)" \
>  	$(GO_COMMON_ENV)
> 
>  ################################################################################
> --
> 2.11.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
