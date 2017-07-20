From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jul 2017 11:19:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/python: fix building _hashlib
 of host-python
In-Reply-To: <CAO6UsjAcBxW=sxOtPyGAY823uNk8QuZFSTjxGMqEMaVMbvg1uQ@mail.gmail.com>
References: <CAO6UsjCZQUKvmA-a0votPq5AFZ6ESkwpNbLvfEymU5uy_SdggA@mail.gmail.com>
 <20170720095636.72423497@windsurf>
 <CAO6UsjBm0q9_g8_dpuA=7kPcFuzhouvM_8GV1J=+76PDfVykSw@mail.gmail.com>
 <20170720102733.2d606f02@windsurf>
 <CAO6UsjAcBxW=sxOtPyGAY823uNk8QuZFSTjxGMqEMaVMbvg1uQ@mail.gmail.com>
Message-ID: <20170720111913.0d9c9c77@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Jul 2017 17:09:52 +0800, Diankun Zhang wrote:

> I'm cross-compiling host-python on my x86_64 box on which ubuntu 16.04

You are not cross-compiling host-python. host-python is a host package,
so it is natively compiled.

> installed.
> libssl is installed whereas openssl is not installed on my box. When

In Ubuntu 16.04, the package is named libssl, but it's actually
OpenSSL, see https://packages.ubuntu.com/xenial/libssl1.0.0. Its source
package is "openssl".

> cross-compiling
> host-python, I found _hashlib.so is not compiled whereas _md5.so,
> _sha256.so, _sha512.so
> and _md5.so are compiled. I think -disable-hashlib will not decrease the
> build time and
> the size of the host-python artifacts.

--disable-hashlib will make sure that our host-python build is more
reproducible. Instead of having _hashlib built when libssl-dev is
installed on the host machine, and _hashlib not built otherwise, it
will consistently not build _hashlib, which is what we want.

> As for the hash lib use case, i am integrating a third-party python tool
> pyang
> (https://github.com/mbj4668/pyang) into our project. The pyang tool will
> take advantage of python
> _hashlib module.

It pyang meant to be run on the host or on the target ? From a quick
look, it seems like something that runs on the host indeed. If that's
the case, then we will really need to start adding hidden options for
host packages, so that other host packages can request hashlib support
from host-python, without forcing everyone to build this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
