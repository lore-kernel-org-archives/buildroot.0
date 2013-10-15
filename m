From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Tue, 15 Oct 2013 11:35:02 -0500
Subject: [Buildroot] [PATCH 1/2] python-thrift: fix cross building
In-Reply-To: <1381853269-25617-1-git-send-email-gustavo@zacarias.com.ar>
References: <1381853269-25617-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <OFF9519787.DE83E1FB-ON86257C05.0059A05A-86257C05.005B1951@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

I recently submitted some patches for new python packages to buildroot
however, I haven't gotten any feedback yet. I've got a few comments
and questions in regards to this. Please see below.

Gustavo Zacarias <gustavo@zacarias.com.ar>t wrote on 10/15/2013 11:07:48 
AM:

> The C code (fastbinary.so) wasn't built using the cross compiler, hence
> it was unusable. Fix it.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/python-thrift/python-thrift.mk | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-thrift/python-thrift.mk 
b/package/python-thrift/python-thrift.mk
> index 4cd35e5..4e86ece 100644
> --- a/package/python-thrift/python-thrift.mk
> +++ b/package/python-thrift/python-thrift.mk
> @@ -9,13 +9,18 @@ PYTHON_THRIFT_SOURCE = 
thrift-$(PYTHON_THRIFT_VERSION).tar.gz
>  PYTHON_THRIFT_SITE = http://pypi.python.org/packages/source/t/thrift
>  PYTHON_THRIFT_LICENSE = Apache-2.0
>  PYTHON_THRIFT_LICENSE_FILES = README
> -
>  PYTHON_THRIFT_DEPENDENCIES = python
> 
>  define PYTHON_THRIFT_BUILD_CMDS
>     (cd $(@D); \
> -      PYTHONXCPREFIX="$(STAGING_DIR)/usr/" \
> -      LDFLAGS="-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib" \

I believe it is preferred that there be one space and then '\' at the 
end of the lines. So

CC="$(TARGET_CC)"               \

should be

CC="$(TARGET_CC)" \

> +      CC="$(TARGET_CC)"               \
> +      CFLAGS="$(TARGET_CFLAGS)"            \
> +      LDSHARED="$(TARGET_CROSS)gcc -shared"         \
> +      CROSS_COMPILING=yes               \
> +      _python_sysroot=$(STAGING_DIR)            \
> +      _python_srcdir=$(BUILD_DIR)/python$(PYTHON_VERSION)   \
> +      _python_prefix=/usr               \
> +      _python_exec_prefix=/usr            \

I would imagine that the _python_sysroot variable corrects the location
of where the python distutils looks for the header files to be the
staging directory instead of the host directory. So my one concern is
that the header files might pull from the host dir instead of staging.
I will hopefully answer that question myself from pulling in this
patch and testing it out for myself.

If this way ensures that setup.py does correctly cross-compile python
modules, I would like to see this be the standard way we python modules
are done. As you mentioned on the IRC channel, creating a PYTHON_MAKE_ENV
variable would be useful which would do the above defines. This way we
could standardize the way python libraries are build to help ensure
cross compiling is done correctly.

It seems that every python module does things just a little bit 
differently.

>        $(HOST_DIR)/usr/bin/python setup.py build)
>  endef
> 
> -- 
> 1.8.1.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
