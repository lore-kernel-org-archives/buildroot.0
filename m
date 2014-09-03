From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 3 Sep 2014 08:42:11 +0200
Subject: [Buildroot] Custom kernal patch not being run
In-Reply-To: <B9E2549378AA7A4EB6855F980A8E5B88F2F8EC@MSCENT02.corp.mercury-security.com>
References: <1409248855849-78152.post@n4.nabble.com>
 <8b3f2afb-67cb-4547-8956-fc4ed95402e5@email.android.com>
 <B9E2549378AA7A4EB6855F980A8E5B88F2EC59@MSCENT02.corp.mercury-security.com>
 <CAAXf6LVmYO+uteXmaZ5X6r1TvpM=5Z-Gez3-gERnCr_2UqzCzQ@mail.gmail.com>
 <1409258595604-78157.post@n4.nabble.com>
 <CAAXf6LWNgNNArj9eNs2ANESZsmm970cjkce9-+VxdmXNSJ9sjA@mail.gmail.com>
 <1409336541509-78215.post@n4.nabble.com>
 <CAAXf6LXXqtBmjvR-pUWLRobSSiDURmhKT=UCMS3BRT=GGscRwg@mail.gmail.com>
 <B9E2549378AA7A4EB6855F980A8E5B88F2F8EC@MSCENT02.corp.mercury-security.com>
Message-ID: <CAAXf6LV4s3aNJLzZPGh1x9n8s1=6GMnPQQLmh6uU4qsa16v1ig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Charles,

On Tue, Sep 2, 2014 at 11:32 PM, buildrootcharles
<charles.s@mercury-security.com> wrote:
> Thomas,
>
>> I cannot reproduce this. Your config file looks sane as far as the
>> kernel settings are concerned.
>> I just modified the path to the kernel and patch directory, then I get:
>
>> $ make linux-dirclean
>> rm -Rf /tmp/buildroot-2013.08/output/build/linux-custom
>> tdescham at argentina /tmp/buildroot-2013.08 $ make linux-patch
>> >>> linux custom Download additional patches
>> >>> linux custom Extracting
>> bzcat /tmp/buildroot-2013.08/dl/linux-3.9.4.tar.bz2 | tar
>> --strip-components=1 -C
>> /tmp/buildroot-2013.08/output/build/linux-custom  -xf -
>> >>> linux custom Patching /package/linux
>> for p in /tmp/foo ; do if echo $p | grep -q -E "^ftp://|^http://" ;
>> then support/scripts/apply-patches.sh
>> /tmp/buildroot-2013.08/output/build/linux-custom
>> /tmp/buildroot-2013.08/dl `basename $p` ; elif test -d $p ; then
>> support/scripts/apply-patches.sh
>> /tmp/buildroot-2013.08/output/build/linux-custom $p linux-\*.patch ;
>> else support/scripts/apply-patches.sh
>> /tmp/buildroot-2013.08/output/build/linux-custom `dirname $p`
>> `basename $p` ; fi done
>
>> Applying linux-bar.patch using patch:
>> [..]
>
>> The corresponding settings were:
>> BR2_LINUX_KERNEL=y
>> BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>> BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="file:///tmp/linux-3.9.4.tar.bz2"
>> BR2_LINUX_KERNEL_PATCH="/tmp/foo"
>> BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="/home/MSC/custom_linux-3.10.4.config"
>
>
>> Your config file indicates that this is not a clean buildroot tree.
>> Have you verified this issue on a clean buildroot-2013.08 release?
>> Were any changes made in this area?
>
>> If the problem is still present, you could instrument linux/linux.mk
>> with some echo statements, particularly in the LINUX_DOWNLOAD_PATCHES
>> and LINUX_APPLY_PATCHES blocks.
>
>> Best regards,
>> Thomas
>
> Based on your result, I decided to re-download Buildroot-2013.08 and run
> make linux-patch command - no patch installed. I went in and changed my
> linux configuration from Kernel Version: "Custom tarball" to "3.10.10" and
> left all other options the same, it attempted to patch the downloaded
> package with the patch that I have available in my BR2_LINUX_KERNEL_PATCH
> directory. So I guess now the question is why would it not attempt to
> install the patch on my "Custom tarball"? Does Buildroot think that since it
> is a custom tarball that no patches will be required? (I also tried manually
> editing the .config to change the BR2_LINUX_KERNEL_VERSION from "custom" to
> "3.10.4" and it attempted to patch the kernel although I would like to have
> my kernel package under source control so downloading it everytime is not
> ideal)
>

This does not make sense to me: the applying of patches is done
irrespective of whether you are using custom kernel sources or
official ones.

Could you send the output of

make linux-dirclean linux-patch V=1

using your configuration with the custom kernel (the failing one) ?

Thanks,
Thomas
