From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 Oct 2019 22:18:43 +0100
Subject: [Buildroot] crda and python-pycrypto build issues
In-Reply-To: <CAMQcK5KNoRnCF-cJUVCAC-+qFc=bpsWxXP05xkfXx8CntHNspg@mail.gmail.com>
References: <CAMQcK5KNoRnCF-cJUVCAC-+qFc=bpsWxXP05xkfXx8CntHNspg@mail.gmail.com>
Message-ID: <20191031221843.6800eee5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 31 Oct 2019 10:05:22 -0500
Ryan Barnett <ryan.barnett@rockwellcollins.com> wrote:

> Investigation into this issue leads to the conclusion that
> host-python-pycrypto is attempting to link against libgmp and is
> trying to using the shared library object. For the host-libgmp build,
> only the static library is compiled as only 'host/usr/lib/libgmp.a' is
> in the host folder.

This is not what happens here:

$ ls output/host/lib
libgmp.la  libgmp.so  libgmp.so.10  libgmp.so.10.3.2

> There is no configure option to use static libraries only so it looks
> like this package depends on shared libraries.

I don't follow you here. What is "this package" ? gmp ? python-pycrypto?

> For host-python packages/host packages in general, are they required
> to be statically linked?

No.

> This leads into the second issue that we have found, why is working on
> some build machines and not others. Further investigation showed that
> the python distutils configure does not work properly as it is using
> the host's library paths for it's tests. On the build machines that
> this failed on, the following is outputted in the config.log:
> 
> configure:3110: checking for __gmpz_init in -lgmp
> configure:3135: gcc -o conftest -g -O2   conftest.c -lgmp   >&5
> configure:3135: $? = 0
> configure:3144: result: yes
> 
> However on the build machines that it does work, the following is
> found:
> 
> configure:3135: gcc -o conftest -g -O2   conftest.c -lgmp   >&5
> /usr/bin/ld: cannot find -lgmp
> collect2: error: ld returned 1 exit status
> configure:3135: $? = 1
> 
> This is due to the fact that libgmp.a is not found the build machine
> where the compilation works. The difference is that libgmp-dev is
> installed on machine where the build fails and only libgmp is
> installed on where it succeeds. libgmp package does not include the
> static library.
> 
> How do we ensure that host-python packages that use distutils are
> running their configure checks against the host folder and not the
> host machines installed libraries?

Python is obviously complicated when it comes to mixing host and target
stuff. Do you have a way to reproduce the issue you're seeing ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
