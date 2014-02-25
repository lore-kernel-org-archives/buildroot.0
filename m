From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 25 Feb 2014 15:11:10 +0100
Subject: [Buildroot] Few questions external toolchain
In-Reply-To: <530C6DD2.4070605@gmail.com>
References: <530B8CEA.90306@gmail.com> <530C6DD2.4070605@gmail.com>
Message-ID: <CAAXf6LUbFzxUgz+kkes-f7TO0as40kDuaF+v6BG2neWEBeR-hw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marco,

On Tue, Feb 25, 2014 at 11:17 AM, Marco Trapanese
<marcotrapanese@gmail.com> wrote:
>
> After digging a bit more I found the following:
>
> ls -l ~/dev/buildroot/output/host/usr/bin/*gcc
>
> lrwxrwxrwx 1 marco marco     21 feb 25 11:00 arm-fsl-linux-gnueabi-gcc ->
> ext-toolchain-wrapper
> -rwxr-xr-x 1 marco marco   5908 feb 25 11:00 ext-toolchain-wrapper
>
>
> ./arm-fsl-linux-gnueabi-gcc
> arm-fsl-linux-gnueabi-gcc: fatal error: no input files
>
> it's ok, but:
>
> ./ext-toolchain-wrapper
> /home/marco/dev/fsl-linaro-toolchain/bin/ext-toolchain-wrapper: No such file
> or directory
>

I now understand your problem better. The toolchain wrapper is not
supposed to be called directly like that, but rather always through a
symbolic link, like the 'arm-fsl-linux-gnueabi-gcc' one. The wrapper
uses the name of the link (how it was called) to know which tool to
call in the real toolchain installation.
So the behavior you are seeing above is normal.

Regarding the usage of a git repo as toolchain: did you try to set the
URL as 'git://URL_of_repo/' ?

Finally, to understand the cause of the problem you were experiencing:
checking for arm-buildroot-linux-gnueabi-gcc...
/home/marco/dev/buildroot/output/host/usr/bin/arm-fsl-linux-gnueabi-gcc
checking whether the C compiler works... no
configure: error: in `/home/marco/dev/buildroot/output/build/alsa-lib-1.0.26'

you should look in the 'config.log' file inside
/home/marco/dev/buildroot/output/build/alsa-lib-1.0.26. The file may
be long, and the error will not be entirely at the end. You should
look for the string 'checking whether the C compiler works', and see
what the error is that caused the 'no'.

Best regards,
Thomas
