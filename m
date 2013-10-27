From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 27 Oct 2013 22:40:09 +0100
Subject: [Buildroot] [PATCH 2/4] pkg-infra: introduce pre/post-step hooks
In-Reply-To: <a89033d9a1639d8899191cae05b772b1646b6ddd.1382894622.git.yann.morin.1998@free.fr>
References: <a356a9112eac610a00a35e48fa9a04a81a460fe0.1382894622.git.yann.morin.1998@free.fr><cover.1382894622.git.yann.morin.1998@free.fr>
 <a89033d9a1639d8899191cae05b772b1646b6ddd.1382894622.git.yann.morin.1998@free.fr>
Message-ID: <867c8550-360d-40e7-96d1-9391ed121afc@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
>From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
>This hooks will let us instrument the build process in many ways:
>  - log current step to see what broke
>  - time each step to see what is worth optimising
>  - sanity-check installed files (rpath, overwritten files...)
>  - call user-provided script
>  - ...
>
>The steps are coarse-grain, and all have a 'start' and a 'end' hooks.
>Here is the list of available steps (8 total):
>  - extract
>  - patch
>  - configure
>  - build
>  - install-host
>  - install-staging
>  - install-image
>  - install-target
>
>The download, clean and uninstall steps are not instrumented on purpose.
>
>Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>---
> package/pkg-generic.mk | 39 +++++++++++++++++++++++++++++++++++++++
> 1 file changed, 39 insertions(+)
>
>diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>index 4bba4b5..799555c 100644
>--- a/package/pkg-generic.mk
>+++ b/package/pkg-generic.mk
>@@ -21,6 +21,29 @@
> ################################################################################
> 
> ################################################################################
>+# Helper functions to catch start/end of each steps

each step

>+################################################################################
>+
>+# Those two functions are called by each steps below.

each step

>+# They are responsible for calling all hooks defined in $(STEP_HOOKS)

I personally find the name STEP_HOOKS pretty vague, if you don't know the context you have no clue what it could be. The other hooks POST_EXTRACT etc are clear from their name.
Maybe, GLOBAL_INSTRUMENTATION_HOOKS?

Best regards,
Thomas
