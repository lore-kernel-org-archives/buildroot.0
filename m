From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 23 Jul 2015 18:57:21 +0200
Subject: [Buildroot] [PATCH] package/cython: new host package
In-Reply-To: <20150720181825.GQ13027@tarshish>
References: <1437414949-16978-1-git-send-email-romain.naour@openwide.fr>
 <20150720181825.GQ13027@tarshish>
Message-ID: <55B11CF1.1040005@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Le 20/07/2015 20:18, Baruch Siach a ?crit :
> Hi Romain,
> 
> On Mon, Jul 20, 2015 at 07:55:49PM +0200, Romain Naour wrote:
>> Some phyton packages may use the Cython compiler.
>> At least, one package (libplist) in Buildroot can use it.
> 
> Do you intend to post a patch adding cython support to libplit? Without that 
> this patch just adds dead code.

Not really, I made this package for a local python-efl package when it's fetched
from the git repository and I was able to use it.
Cython is used to regenerate some C files, it's not used to build a target binary.

However, I tried to enable cython support to libplit as an example, but it
doesn't build when a cross compiler is used.
It use the host-python to build a binary for the target using the cross-compiler...

Also there is a m4 macro AC_PYTHON_DEVEL which can't be used with a
cross-compiler. It also try to link a C test program with host-python library
using the cross-compiler.

Here is the error:
"#error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?).

I don't think it's "fixable"...

There was another proposal for host-cython (I missed it):
http://patchwork.ozlabs.org/patch/477500/

So there is some rare case where cython can be used... but I don't know if there
is another package in Buildroot which can use it.

Thanks!

Best regards,
Romain
> 
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> ---
>>  package/cython/cython.mk | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>  create mode 100644 package/cython/cython.mk
>>
>> diff --git a/package/cython/cython.mk b/package/cython/cython.mk
>> new file mode 100644
>> index 0000000..b730774
>> --- /dev/null
>> +++ b/package/cython/cython.mk
>> @@ -0,0 +1,15 @@
>> +################################################################################
>> +#
>> +# cython
>> +#
>> +################################################################################
>> +
>> +CYTHON_VERSION = 0.22.1
>> +CYTHON_SOURCE = Cython-$(CYTHON_VERSION).tar.gz
> 
> A .hash file is missing.
> 
>> +CYTHON_SITE = http://cython.org/release/
>> +# Cython can also use setuptools
>> +CYTHON_SETUP_TYPE = distutils
>> +CYTHON_LICENSE = Apache-2.0
>> +CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
>> +
>> +$(eval $(host-python-package))
> 
> baruch
> 
