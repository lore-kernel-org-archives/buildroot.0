From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 22:09:40 +0200
Subject: [Buildroot] [PATCH 08/08] package/python-channels-redis: new
 package
In-Reply-To: <20190804011631.86261-9-aduskett@gmail.com>
References: <20190804011631.86261-1-aduskett@gmail.com>
 <20190804011631.86261-9-aduskett@gmail.com>
Message-ID: <20190930220940.386dbcb0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Yegor here as well, as I have a Python packaging question.

On Sat,  3 Aug 2019 21:16:31 -0400
aduskett at gmail.com wrote:

> diff --git a/package/python-channels-redis/Config.in b/package/python-channels-redis/Config.in
> new file mode 100644
> index 0000000000..75b90837e5
> --- /dev/null
> +++ b/package/python-channels-redis/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_PYTHON_CHANNELS_REDIS
> +	bool "python-channels-redis"
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC # redis
> +	select BR2_PACKAGE_PYTHON_AIOREDIS # runtime
> +	select BR2_PACKAGE_PYTHON_MSGPACK # runtime
> +	select BR2_PACKAGE_PYTHON_ASGIREF # runtime
> +	select BR2_PACKAGE_PYTHON_CHANNELS # runtime
> +	select BR2_PACKAGE_REDIS

Here as well, we don't need this BR2_PACKAGE_REDIS dependency. The
other dependencies should be ordered alphabetically, and the
BR2_PACKAGE_PYTHON3 dependency was missing. I fixed all that and
applied.

Now, the question for which Yegor's input would also be useful. The
setup.py for this package goes like this:

crypto_requires = ["cryptography>=1.3.0"]

test_requires = crypto_requires + [
    "pytest~=3.6.0",
    "pytest-asyncio~=0.8",
    "async_generator~=1.8",
    "async-timeout~=2.0",
]


setup(
    [...]
    install_requires=[
        "aioredis~=1.0",
        "msgpack~=0.6.0",
        "asgiref~=3.0",
        "channels~=2.2",
    ],
    extras_require={"cryptography": crypto_requires, "tests": test_requires},
)

The question is how do these "extras_require" work ? While we don't
care much about the tests, the cryptography stuff maybe be useful. How
does it work ? Does it say "I'm able to use python-cryptography>1.3.0
if it's available" ? Is there anything that needs to be done to
'enable' this dependency ? Should we have a sub-option for this ? Or
make it an automatic dependency, which means basically do nothing since
these are pure runtime dependencies anyway ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
