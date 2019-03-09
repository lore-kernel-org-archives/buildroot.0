From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Mar 2019 15:00:11 +0100
Subject: [Buildroot] [PATCH v2,1/1] package/mongodb: needs host-python2
In-Reply-To: <20190308194411.8573-1-fontaine.fabrice@gmail.com>
References: <20190308194411.8573-1-fontaine.fabrice@gmail.com>
Message-ID: <20190309150011.3968dca9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

+Arnout in Cc.

On Fri,  8 Mar 2019 20:44:11 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> mongodb (like gnuradio) needs host-python2 however there is no way to
> enforce this so add a dependency on !BR2_PACKAGE_PYTHON3.
> Indeed, if BR2_PACKAGE_PYTHON3 is selected, then buildroot will only
> build and install host-python-typing for host-python3.
> 
> This issue was not raised in the previous version of mongodb as
> host-scons was the only dependency however we now have
> host-python-typing and host-python-pyyaml dependencies and it
> does not seem right to enforce python2 on those packages
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/693bdba2c01a1b69f56d6ee75094a6a0fc3f40b4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

You forgot to propagate the !BR2_PACKAGE_PYTHON3 dependency to the
Config.in comment of mongodb, so I did that and applied.

However, in fact I'm not sure to agree with your statement that it does
not seem right to enforce python2 on host-python-typing and
host-python-pyyaml. The only package using them *is* mongodb. So
perhaps for those packages we could have the same principle as
python-setuptools, where python-setuptools is a target package for
python2/python3 but only a host package for python2, and there is a
separate python3-setuptools package to install host setuptools for
python3. It's not great, but it works. I don't know if it's worth it
doing that for mongodb though.

Thoughts ?

Life will be easier when there'll be only one Python version to
support...

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
