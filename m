From: Jan Heylen <heyleke@gmail.com>
Date: Thu, 2 Apr 2015 09:12:53 +0200
Subject: [Buildroot] [PATCH 1/1] elfutils: Add a --{enable,
 disable}-backends option
In-Reply-To: <20150401214323.4e340217@free-electrons.com>
References: <1427911925-7424-1-git-send-email-heyleke@gmail.com>
 <20150401214323.4e340217@free-electrons.com>
Message-ID: <CAGszK3hLApL5Pu383ywUppoApVSwZWDp026dZ11_tphCQ3469A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 1, 2015 at 9:43 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Jan Heylen,
>
> On Wed,  1 Apr 2015 20:12:05 +0200, Jan Heylen wrote:
>
>> diff --git a/package/elfutils/0007-backends-configurable.patch b/package/elfutils/0007-backends-configurable.patch
>> new file mode 100644
>> index 0000000..b93e2da
>> --- /dev/null
>> +++ b/package/elfutils/0007-backends-configurable.patch
>
> Patches should have a description and a Signed-off-by line.
Ah, I didn`t realise that on that level it was required, I'll fix it

>
> Also, could you submit this patch upstream? I'd like to see if upstream
> is willing to accept such a patch, since it is more or less a "feature"
> patch, and we prefer to not have to carry such patches forever.
This is based on 0002-disable-progs.patch, so it belongs in buildroot?
I'll try to upstream it to the elfutils package.

>
>> +config BR2_PACKAGE_ELFUTILS_BACKENDS
>> +     bool "Build and install backend shared libraries"
>> +     default y
>> +     help
>> +       This option tells elfutils to not only install the libelf
>> +       libraries, but also the libebl backend shared libraries
>> +       with architecture specific code to read elf files. If you
>> +       intend to use libelf/libebl at-runtime, say 'y' here.
>> +       If you only need to link against libelf at-compile-time,
>> +       but not really using it, you can leave the architecture
>> +       specific backends uninstalled. Loading of the backend library
>> +       by libebl will fail in that case.
>
> This explanation seems weird: why would you link against libelf and not
> use it?

The backends are plaform specific implementations, for every supported
platform. And, e.g. perf package which sources come with the Linux
kernel has a compile time dependency on it.On older kernels (<= 3,7),
the perf package requires libelf, from the eflutils package. But for
plenty of the features of perf, elfutils backends (libebl) are not
required@runtime. As backporting patches for not depending on
elfutils for all former kernel version is obviously not the best
method, I believe making it possible to not compile/install the
backends of libebl in your rootfs is a legitimate option (saves >300K
(stripped)).

I'll update the patch and resubmit,

br,

Jan

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
