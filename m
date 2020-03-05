From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Mar 2020 23:01:05 +0100
Subject: [Buildroot] [PATCH] package/python3: bump to 3.6.2
In-Reply-To: <20170918223441.2129-1-andrew.smirnov@gmail.com>
References: <20170918223441.2129-1-andrew.smirnov@gmail.com>
Message-ID: <20200305230105.717fbebf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm getting back to this old patch.

On Mon, 18 Sep 2017 15:34:41 -0700
Andrey Smirnov <andrew.smirnov@gmail.com> wrote:

> +# Some of CPython's source code is generated using Python interpreter
> +# and some helper tools such as "Programs/_freeze_importlib" or
> +# "Parser/pgen" (look for regen-* targets in Makefile.pre.in for more
> +# info). Normally CPython codebase ships with those files
> +# pre-generated, so just regular "make" with no additional steps
> +# should be sufficient for a succesfull build, however due to
> +# Buildroot's "Add importlib fix for PEP 3147 issue" custom patch we
> +# end up modifying "Lib/importlib/_bootstrap_external.py" which means
> +# we have to do "regen-importlib" step before building CPython
> +# (Importlib is a builtin module that needs to be "frozen"/converted
> +# to a C array of bytecode using "Programs/_freeze_importlib")
> +#
> +# To achive that we add pre-build steps to host-python3 as well as
> +# python3 that execute "regen-importlib" target.
> +#
> +# Unfortunately, for the target Python, "Programs/_freeze_importlib"
> +# is built for the target, while we need to run them at build time. So
> +# when installing host-python3, we copy them to $(HOST_DIR)/bin...
> +#
> +define HOST_PYTHON3_MAKE_REGEN_IMPORTLIB
> +	$(HOST_MAKE_ENV) $(PYTHON3_CONF_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) regen-importlib

Unfortunately, this breaks the build when python3 is not available on
the build machine:

# Regenerate Python/importlib_external.h
# from Lib/importlib/_bootstrap_external.py using _freeze_importlib
./Programs/_freeze_importlib importlib._bootstrap_external \
    ./Lib/importlib/_bootstrap_external.py \
    ./Python/importlib_external.h.new
python3 ./Tools/scripts/update_file.py ./Python/importlib_external.h ./Python/importlib_external.h.new
make[1]: python3: Command not found
Makefile:724: recipe for target 'regen-importlib' failed
make[1]: *** [regen-importlib] Error 127
make[1]: Leaving directory '/root/buildroot/output/build/host-python3-3.8.2'

Indeed, the regen-importlib target uses python3... while building
host-python3. This clearly cannot work.

I believe we don't need to regenerate importlib for the host python, we
probably only need it for the target.

Do you think you could have a look ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
