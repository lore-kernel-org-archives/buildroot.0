From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Apr 2019 09:02:43 +0200
Subject: [Buildroot] [PATCH v2] package/go: fix building host go
 toolchain when target isn't supported
In-Reply-To: <20190415204951.18744-1-arnout@mind.be>
References: <20190415204951.18744-1-arnout@mind.be>
Message-ID: <20190417090243.64dec40e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 Apr 2019 22:49:51 +0200
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> wrote:

> From: Anisse Astier <anisse@astier.eu>
> 
> The go toolchain can cross-compile by default. So most of the time,
> building a toolchain that supports a target, allows us to also build go
> binaries for the host. This is how support for host go packages was
> added: we use the same toolchain that was initially built only for
> target.
> 
> But we might want to build a go binary for the host, when compiling a
> target for which go isn't supported. Then, building host-go will fail:
> by default, we build go for a specific target, and give the toolchain
> bootstrap scripts the cross compiler we'll use.
> 
> This change modifies this behaviour: we only assume the go toolchain is
> cross-capable if we know the current target is supported. Otherwise this
> is a simple host go tool. We don't need to set any of the options needed
> for cross-compilation in that case.
> 
> Thus, only set all the target-specific go options under a condition that
> the target arch is supported. The only option we still set is
> HOST_GO_CGO_ENABLED, and we always set it to enabled.

I have applied to master, but I do have a question related to
HOST_GO_CGO_ENABLED. Right now, we have the following:

if Go supports target architecture
	if target supports thread
		HOST_GO_CGO_ENABLED=1
	else
		HOST_GO_CGO_ENABLED=0
else
	HOST_GO_CGO_ENABLED=1
endif

What is a bit strange here is that if you build for a target that isn't
supported by Go, you always get CGO support in the host go. However, if
the target is support by Go, but thread support is not available, you
don't have CGO support in the host go.

I.e when compiling host go programs, the availability of CGO depends on
whether the target is supported + has threads, which is a bit weird.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
