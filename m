From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 1 Apr 2018 14:26:47 +0200
Subject: [Buildroot] [PATCH 1/2] package/pkg-golang: use 'build' instead
 of 'install'
In-Reply-To: <20180401115136.1345-1-thomas.petazzoni@bootlin.com>
References: <20180401115136.1345-1-thomas.petazzoni@bootlin.com>
Message-ID: <14f910b9-da10-954d-2d40-13e4b6237b99@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Minor nit...

On 01-04-18 13:51, Thomas Petazzoni wrote:
> @@ -102,7 +102,9 @@ define $(2)_BUILD_CMDS
>  		$$(GO_TARGET_ENV) \
>  			GOPATH="$$(@D)/$$($(2)_WORKSPACE)" \
>  			$$($(2)_GO_ENV) \
> -			$$(GO_BIN) install -v $$($(2)_BUILD_OPTS) ./$$(d)
> +			$$(GO_BIN) build -v $$($(2)_BUILD_OPTS) \
> +			-o $$(@D)/$$($(2)_BINDIR)/$$(if $$($(2)_BIN_NAME),$$($(2)_BIN_NAME),$$(notdir $$(d))) \

 I find the $(or ...) construct to be more readable:

			-o $$(@D)/$$($(2)_BINDIR)/$$(or $$($(2)_BIN_NAME),$$(notdir $$(d))) \

 Regards,
 Arnout


> +			./$$(d)
>  	)
>  endef
>  endif

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
