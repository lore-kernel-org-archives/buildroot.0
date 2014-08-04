From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 4 Aug 2014 16:45:37 +0200
Subject: [Buildroot] [git commit] arch: pass cpu option instead of tune
 option on ARM
In-Reply-To: <20140123181504.GB3446@free.fr>
References: <20131226222002.C88A59C1E4@busybox.osuosl.org>
 <CACmBeS0dY9NiAPJCTzSQGSH_zx71HN00MJ6Xk0_jD8DjyDwBRw@mail.gmail.com>
 <20140123181504.GB3446@free.fr>
Message-ID: <CAAXf6LWBScdsOP=E0wC_CGE63R=dq5g21rqaUsWhtfijmU20Wg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all,

On Thu, Jan 23, 2014 at 7:15 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Jonas, All,
>
> On 2014-01-23 16:31 +0100, Jonas Jensen spake thusly:
>> Moving from snapshot 20131213 to 20140123 I noticed a warning that
>> wasn't there before:
>>
>> "warning: switch -mcpu=fa526 conflicts with -march=armv4 switch
>> [enabled by default]"
>>
>> That's where I started digging and found this commit.
>>
>> In cases where -mcpu is set, buildroot doesn't actually need to set
>> -march, correct?
>
> Can you check you have this commit in your tree:
>     2c1dc32: toolchain/external: fix wrapper by not passing conflicting flags
>
> http://git.buildroot.org/buildroot/commit/toolchain/toolchain-external/ext-toolchain-wrapper.c?id=2c1dc32647eb308126b0ae80a91988059d39aa7b
>
> This one should solve your issue.
>

Sorry for bringing up this old issue, but at least some cases are not
yet solved.

The specified commit fixes the issue of the wrapper-specified
mcpu/mtune/march flags vs. the flags specified on the compiler
command-line.
However, the wrapper itself may specify a combination of -mcpu and
-march which also causes warnings such as:
"warning: switch -mcpu=arm1176jz-s conflicts with -march= switch
This is not visible with the ARM big-endian Musl toolchain available
in buildroot, but I can reproduce it with a crosstool-ng toolchain:

echo "int main(void) {}" | BR2_DEBUG_WRAPPER=1
./output/host/usr/bin/armeb-linux-gcc -x c -o /dev/null -
Toolchain wrapper executing:
'/home/tdescham/repo/contrib/buildroot-bugs/output/host/opt/ext-toolchain/bin/armeb-linux-gcc'
'--sysroot' '/home/tdescham/repo/contrib/buildroot-bugs/output/host/usr/armeb-buildroot-linux-gnueabi/sysroot'
'-mabi=aapcs-linux' '-msoft-float' '-marm' '-pipe' '-mfloat-abi=soft'
'-march=armv6zk' '-mcpu=arm1176jz-s' '-x' 'c' '-o' '/dev/null' '-'
<stdin>:1: warning: switch -mcpu=arm1176jz-s conflicts with -march= switch

This crosstool-ng toolchain is a pretty standard gcc-4.4.3-based
toolchain for arm1176jz-6 big-endian.

Another patch was sent to fix this issue:
http://patchwork.ozlabs.org/patch/348364/
by only passing march/mtune if no mcpu is given. I verified that this
patch removes the warning.

However, I don't know if it has undesired side-effects. Any input on
this is very welcome.

Thanks,
Thomas
