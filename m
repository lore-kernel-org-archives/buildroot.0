From: Trent Piepho <tpiepho@impinj.com>
Date: Tue, 2 Jan 2018 22:27:54 +0000
Subject: [Buildroot] [PATCH 4/8] pkg-waf.mk: check host-python version
In-Reply-To: <20180102152807.31470-5-aduskett@gmail.com>
References: <20180102152807.31470-1-aduskett@gmail.com>
 <20180102152807.31470-5-aduskett@gmail.com>
Message-ID: <1514932073.26695.192.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2018-01-02 at 10:28 -0500, Adam Duskett wrote:
>  
> +# We need a host-python to run waf
> +ifeq ($(BR2_PACKAGE_HOST_PYTHON3),y)
> +$(2)_DEPENDENCIES += host-python3
> +$(2)_WAF_PYTHON_PATH ?= $$(HOST_DIR)/bin/python3
> +else
> +$(2)_DEPENDENCIES += host-python
> +$(2)_WAF_PYTHON_PATH ?= $$(HOST_DIR)/bin/python2
> +endif

PYTHON_PATH above is called PYLIBVER in the five existing definitions
of this variable.   PYTHON_PATH already exists, and it the absolute
path in the target dir of sysconfigdata.

So it would be a lot more consistent to name this PYLIBVER.

It also seems like this variable will be re-created in a lot of
packages, if every package that needs to correctly call the host python
must define it.  I wonder if there could be an easier way for python
package files to call the host python correctly.  Like:

$(HOST_PYTHON_EXE)  Program to run for host python, 2 or 3 as selected.
$(HOST_PYTHON2_EXE) If you must have python 2
$(HOST_PYTHON3_EXE) If you must have python 3
