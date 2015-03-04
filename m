From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 23:56:06 +0100
Subject: [Buildroot] [PATCH] pkg-generic: Fix host _DL_VERSION corner
 case
In-Reply-To: <1424816770-14271-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1424816770-14271-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <20150304235606.23277563@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Tue, 24 Feb 2015 16:26:10 -0600, Clayton Shotwell wrote:
> In the case when a package has a host version, the package is dependent
> on the host version, and the version contains a '/', the host version
> does not evaluate properly. The host version will contain a '_' instead
> of a '/', resulting in a failed download. To solve this corner case, add
> a check to see if the _DL_VERSION of the package has been defined before
> defining the host _DL_VERSION. If the package _DL_VERSION has not been
> defined yet, then the version string has not been formatted yet and is
> still good to use.
> 
> This error occured on a package in a BR2_EXTERNAL that uses a git repo
> for its remote storage with '/' in the tag names. I do not believe this
> affects any packages in the Buildroot mainline but it could in the
> future.
> 
> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>

So, I had a look at the issue, and I can confirm it. I did the
following stupid change:

-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).0
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).0/bar

(which obviously doesn't work, but we don't care)

And then dumped the interesting variables:

$ make printvars 2> /dev/null | grep LIBGLIB2 | grep VERSION
HOST_LIBGLIB2_DL_VERSION=2.42.0_bar (2.42.0_bar)
HOST_LIBGLIB2_VERSION=2.42.0_bar (2.42.0_bar)
LIBGLIB2_DL_VERSION=2.42.0/bar (2.42.0/bar)
LIBGLIB2_VERSION=2.42.0_bar (2.42.0_bar)

So indeed, HOST_LIBGLIB2_DL_VERSION is wrong, it should be '2.42.0/bar'.

> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 1b09955..fcef461 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -323,7 +323,11 @@ $(2)_RAWNAME			=  $$(patsubst host-%,%,$(1))
>  # version control system branch or tag, for example remotes/origin/1_10_stable.
>  ifndef $(2)_VERSION
>   ifdef $(3)_VERSION
> -  $(2)_DL_VERSION := $$(strip $$($(3)_VERSION))
> +  ifdef $(3)_DL_VERSION
> +   $(2)_DL_VERSION := $$(strip $$($(3)_DL_VERSION))
> +  else
> +   $(2)_DL_VERSION := $$(strip $$($(3)_VERSION))
> +  endif

However, I haven't yet made up my mind on whether this proposed
solution is the best one, or if we have a chance of doing something
clearer/nicer for this _VERSION vs. _DL_VERSION thing.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
