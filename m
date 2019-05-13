From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 May 2019 22:27:49 +0200
Subject: [Buildroot] problems compiling nodejs 10.15.3 and suggested fix
In-Reply-To: <a8114d08-6afa-95eb-0152-ce47cc923921@nebel.de>
References: <a8114d08-6afa-95eb-0152-ce47cc923921@nebel.de>
Message-ID: <20190513222749.6289dbed@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Michael,

Thanks for your e-mail and bug report. I'm adding in Cc Daniel and
Martin, who take care of the nodejs package in Buildroot. Martin has
done the recent update of nodejs that probably introduced this
regression. See below for some comment.

On Fri, 10 May 2019 19:27:21 +0200
Michael Nebel <michael@nebel.de> wrote:

> Hello,
> 
> I started to evaluate buildroot some days ago. The "make menuconfig" was
> very intriguing for me. It felt like coming home again :-) Cool and
> thanks for this project!
> 
> After first successful experiments with buildroot-2019.02.2, I switched
> to the git-version. Here I ran into some troubles to compile nodejs for
> x86_64. It failed with
> 
>   output/build/host-nodejs-10.15.3/out/Release/torque:
>         error while loading shared libraries: libcrypto.so.1.1:

This normally should not happen because our host binaries should be
built with a RPATH that points to $(HOST_DIR)/lib.

However, as explained in commit 2ebc2219d5716f81789f29dcbb6b05d0c9d886dd:

    The host tool "torque" is unfortunately not built by complying to our
    LDFLAGS, so it is not built with the proper RPATH. We fix that using
    patchelf, and install it to $(HOST_DIR) to make it available during
    the build of the target nodejs.

But unfortunately, it seems like this "torque" tool is being executed
*during* the host-nodejs build, i.e after it has been compiled, but
before its RPATH is fixed up by patchelf.

> nebel at tyche ~/src/buildroot $ git diff
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 2577239e19..abf51a3f9c 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -72,6 +72,7 @@ define HOST_NODEJS_BUILD_CMDS
>         $(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
>                 $(MAKE) -C $(@D) \
>                 $(HOST_CONFIGURE_OPTS) \
> +               LD_LIBRARY_PATH="$(LD_LIBRARY_PATH):$(HOST_DIR)/lib/" \

This is most likely not really how we want to fix it. I think we really
want to build the torque program with the proper RPATH from the start.

Martin, any idea about this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
