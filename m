From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 21:39:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/scons: fix missing dependency
In-Reply-To: <1437932577-874-1-git-send-email-brendanheading@gmail.com>
References: <1437932577-874-1-git-send-email-brendanheading@gmail.com>
Message-ID: <20150726213943.3d3ebbe9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Brendan Heading,

On Sun, 26 Jul 2015 18:42:57 +0100, Brendan Heading wrote:
> host-scons did not depend on host-python, causing build failures in
> some instances.
> 
> Signed-off-by: Brendan Heading <brendanheading@gmail.com>
> ---
>  package/scons/scons.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/scons/scons.mk b/package/scons/scons.mk
> index 39fb258..3ad0fa5 100644
> --- a/package/scons/scons.mk
> +++ b/package/scons/scons.mk
> @@ -10,6 +10,7 @@ SCONS_LICENSE = MIT
>  SCONS_LICENSE_FILES = LICENSE.txt
>  SCONS_SETUP_TYPE = distutils
>  
> +HOST_SCONS_DEPENDENCIES = host-python
>  HOST_SCONS_NEEDS_HOST_PYTHON = python2
>  
>  HOST_SCONS_INSTALL_OPTS = \

This does not make sense: scons uses host-python-package, and the
python package infrastructure automatically adds host-python as a
dependency for host python packages. From package/pkg-python.mk:

ifeq ($(4),target)
$(2)_DEPENDENCIES += $$(if $$(BR2_PACKAGE_PYTHON3),host-python3 python3,host-python python)
else
ifeq ($$($(2)_NEEDS_HOST_PYTHON),)
$(2)_DEPENDENCIES += $$(if $$(BR2_PACKAGE_PYTHON3),host-python3,host-python)
else
ifeq ($$($(2)_NEEDS_HOST_PYTHON),python2)
$(2)_DEPENDENCIES += host-python
else ifeq ($$($(2)_NEEDS_HOST_PYTHON),python3)
$(2)_DEPENDENCIES += host-python3
else
$$(error Incorrect value '$$($(2)_NEEDS_HOST_PYTHON)' for $(2)_NEEDS_HOST_PYTHON)
endif
endif # ($$($(2)_NEEDS_HOST_PYTHON),)
endif # ($(4),target)

So, maybe there's a bug in there, or your analysis of the build failure
was wrong. But clearly the solution is not to add host-python as a
dependency in scons.mk.

I've marked your patch as Rejected. Please explain in more details what
the problem was and how we can reproduce it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
