From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Mar 2019 18:09:55 +0100
Subject: [Buildroot] [PATCH v5] package/optee-client: fix build warnings
 from 3.4.0
In-Reply-To: <20190325105251.5914-1-etienne.carriere@linaro.org>
References: <20190325105251.5914-1-etienne.carriere@linaro.org>
Message-ID: <20190325180955.179bcc55@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Etienne,

On Mon, 25 Mar 2019 11:52:51 +0100
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> Add a patch over current optee-client 3.4.0 to fix build issues
> reported by some toolchains with traces like:
> 
>   /path/to/build/optee-client-3.4.0/libteec/src/tee_client_api.c: In function 'TEEC_InitializeContext':
>   /path/to/build/optee-client-3.4.0/libteec/src/tee_client_api.c:149:28: error: 'gen_caps' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>     ctx->reg_mem = gen_caps & TEE_GEN_CAP_REG_MEM;
>                             ^
>   /path/to/build/optee-client-3.4.0/libteec/src/tee_client_api.c: In function ?TEEC_OpenSession?:
>   /path/to/build/optee-client-3.4.0/libteec/src/tee_client_api.c:507:8: error: cast increases required alignment of target type [-Werror=cast-align]
>     arg = (struct tee_ioctl_open_session_arg *)buf;
>           ^
>   /path/to/build/optee-client-3.4.0/libteec/src/tee_client_api.c: In function ?TEEC_InvokeCommand?:
>   /path/to/build/optee-client-3.4.0/libteec/src/tee_client_api.c:581:8: error: cast increases required alignment of target type [-Werror=cast-align]
>     arg = (struct tee_ioctl_invoke_arg *)buf;
> 
> The optee-client patches have been in the OP-TEE project [1] & [2] and
> will be available in the OP-TEE next release planned 3.5.0.
> 
> Fixes [3], [4], [5] and other failing builds reported by autobuild tests.
> 
> [1] https://github.com/OP-TEE/optee_client/pull/146
> [2] https://github.com/OP-TEE/optee_client/pull/153
> [3] http://autobuild.buildroot.net/results/80e78cb0bb955e912d6cbe5b30c9b024e7efc802
> [4] http://autobuild.buildroot.net/results/a42c19897d03beb02fde2e7e6da25532be27d5ca
> [5] http://autobuild.buildroot.net/results/827087f91b7481d1c3effd615172bbee86317962

Thanks for working on this. However, sorry for being picky, but there
are still a few things that could be done better.

First of all the pull request
https://github.com/OP-TEE/optee_client/pull/146 has been superseded by
https://github.com/OP-TEE/optee_client/pull/150, which has been merged
in commit
https://github.com/OP-TEE/optee_client/commit/9dbc61b3767ab1c3dfd0a19af02926b92ae09247

Your second pull request has been merged in commit
https://github.com/OP-TEE/optee_client/commit/16c8f548786c70df04d3a1e61bf89abce9b92389.

So referencing the pull requests is not really appropriate, referencing
the commits is much better.

Then, you squashed both changes in a single patch, this is not great.
We really prefer to have the upstream commits as-is, it makes things a
lot easier/clearer when bumping the package version.

Basically, to generate the patches, you should ideally do:

	git checkout v3.4.0
	git cherry-pick 9dbc61b3767ab1c3dfd0a19af02926b92ae09247
	git cherry-pick 16c8f548786c70df04d3a1e61bf89abce9b92389
	git format-patch -N HEAD~2

And use the two patches that have been generated.

However, I am a bit skeptical about the second commit: the commit log
says it fixes build issues with Clang, but Buildroot doesn't support
using Clang as a compiler, so why do we care ? Of course, the patch is
small, so it's not a big deal, but what is the reason for having this
patch ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
