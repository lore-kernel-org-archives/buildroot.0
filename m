From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Nov 2020 21:37:04 +0100
Subject: [Buildroot] [PATCH next 05/12]
 support/download/go-post-process: implement Go vendoring support
In-Reply-To: <CA+h8R2rY05=7NZbOf+fU30qV+xdq0g2GhBpZSMBfg5uRm4x9XA@mail.gmail.com>
References: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
 <20201119213658.1232531-6-thomas.petazzoni@bootlin.com>
 <CA+h8R2rY05=7NZbOf+fU30qV+xdq0g2GhBpZSMBfg5uRm4x9XA@mail.gmail.com>
Message-ID: <20201125213704.569c52dc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christian,

Thanks for the feedback!

On Wed, 25 Nov 2020 12:28:31 -0800
Christian Stewart <christian@paral.in> wrote:

> This looks good. There's only one problem - if the package does not
> come with a go.mod file (which is the case with
> nvidia-container-toolkit).
> 
> In this case we need to run the $(2)_GEN_GOMOD script before running
> the download post-process.
> 
> Today, this is written as so and creates a go.mod if it doesn't already exist:
> 
> # Generate a go.mod file if it doesn't exist. Note: Go is configured
> # to use the "vendor" dir and not make network calls.
> define $(2)_GEN_GOMOD
> if [ ! -f $$(@D)/go.mod ]; then \
>   printf "module $$($(2)_GOMOD)\n" > $$(@D)/go.mod; \
> fi
> endef
> $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD

Ah, good point. Do you have an example of such a package (publicly
available)? That would help testing a solution.

I guess the best solution is to modify the POST_PATCH_HOOKS to be done
by the download post-process script ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
