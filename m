From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 19 Oct 2015 15:26:18 +0200
Subject: [Buildroot] ltp-testsuite without native RPC (commit
	8f1c4c49a2ab0fc9e6cf73370f4483e253e5ac2d)
In-Reply-To: <20151015181727.GI2451@tarshish>
References: <CAAXf6LUBj47OW0+VBzeYE-Zh3jLMg77-kWCOiSCMPGiRKKSPfw@mail.gmail.com>
 <20151015181727.GI2451@tarshish>
Message-ID: <CAAXf6LV5hJVK+zqbFHZ0qbwfShx2ZhyLBNdEXvURPpEJp+4=OQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Thu, Oct 15, 2015 at 8:17 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Thomas,
>
> On Thu, Oct 15, 2015 at 04:06:39PM +0200, Thomas De Schampheleire wrote:
>> I only now saw your commit 8f1c4c49a2ab0fc9e6cf73370f4483e253e5ac2d
>> that disables again building ltp-testsuite without a native-RPC
>> toolchain. Using commit baedef979cda7783b399099b49cd23536e44b1c7 I had
>> added that support.
>
> I saw your commit, so I put you on the Cc of commit 8f1c4c49a2a.

Yes I saw it, I just hadn't noticed that mail when it was sent (my bad).

>
>> First of all, it looks to me that the patch is incomplete: the
>> Config.in file still allows selecting ltp-testsuite without RPC
>> support, and selects libtirpc in that case. While I haven't tried it
>> again, I think this will break compilation for these cases.
>
> I don't think so. Commit 8f1c4c49a2a adds ac_cv_header_tirpc_netconfig_h=no to
> _CONF_ENV to avoid link with the standalone libtirpc even when it's installed.
>
> But you are right that selecting BR2_PACKAGE_LIBTIRPC now makes no sense. Just
> sent a patch removing it.
>
>> But more to the core of the problem: I wonder if disabling the entire
>> ltp-testsuite here is the right approach. The RPC support is only
>> needed for the small amount of network tests that use RPC. The ltp
>> testsuite as a whole is much broader than that. By disabling
>> ltp-testsuite entirely the users without native rpc toolchain are thus
>> 'punished' unnecessarily hard.
>
> I'm not sure I follow. In what case does commit 8f1c4c49a2a disable
> ltp-testsuite?
>
>> What about patching ltp-testsuite instead, not enabling the RPC tests
>> in this case? At first sight this was added with following (ltp)
>> commit:
>> https://github.com/linux-test-project/ltp/commit/8e9a4dbb8eaa561e51d6d8ebe5a5342f3e498224
>
> Isn't that what ac_cv_header_tirpc_netconfig_h=no is doing?

I just tried building ltp-testsuite with a no-rpc toolchain on top of
latest buildroot. Here is the build failure:

/usr/bin/make -C lib -f
".../output/build/ltp-testsuite-20150420/testcases/network/rpc/basic_tests/rpc01/lib/Makefile"
all
make[7]: Entering directory
`.../output/build/ltp-testsuite-20150420/testcases/network/rpc/basic_tests/rpc01/lib'
.../output/host/usr/bin/powerpc-linux-gcc -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -Os -g -O2 -fno-strict-aliasing -pipe -Wall -W
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -Os -Wold-style-definition
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FORTIFY_SOURCE=2
-I../../../../../../include -I../../../../../../include  -c -o
librpc01.o librpc01.c
librpc01.c:19:21: fatal error: rpc/xdr.h: No such file or directory
 #include <rpc/xdr.h>
                     ^
compilation terminated.
make[7]: *** [librpc01.o] Error 1


I think my original problem (this was with a previous version of
ltp-testsuite) was that rpc/rpc.h was missing, but I think the bottom
line is the same: ltp-testsuite attempts to build RPC-related tests
but the necessary header files are not available.

My approach was to add libtirpc to the equation, which provides the
header files and library to make things work.

With your patch, libtirpc is not added, and so the header files remain
unavailable.

How do you suggest to proceed?
One approach is to disable the ltp tests that use rpc entirely (on top
of your last patch), another one is to disable only the tests that use
authdes_create (on top of my original patch; reverting yours).
Other ideas are welcome, of course.

Thanks,
Thomas
