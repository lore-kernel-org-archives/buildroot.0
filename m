From: Gergely Imreh <imrehg@gmail.com>
Date: Tue, 22 Sep 2015 10:46:42 +0800
Subject: [Buildroot] [PATCH 1/1] board/wandboard: fix linux compilation
 error due to deprecated perl statement
In-Reply-To: <20150921224539.GI3570@free.fr>
References: <1442847794-6972-1-git-send-email-imrehg@gmail.com>
 <20150921224539.GI3570@free.fr>
Message-ID: <CAJ3iQcqT75jbtYk9CCZFt90ip9kFRGjhB7p4eiLRTrkFE9XrCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22 September 2015 at 06:45, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Gergely, All,
>
> On 2015-09-21 23:03 +0800, imrehg at gmail.com spake thusly:
>> From: Gergely Imreh <imrehg@gmail.com>
>>
>> The perl syntax has changed since linux 3.8 and it is causing a compile error
>> in wandboard's kernel. Add in a proposed simple patch (one of the many
>> identical versions found online).
>
> Or backport 70730bca1331fc50c3caacaea00439de1325bd6e which "fixes" this
> by removing the perl script in favour of a bc script:

It's a bigger change, but makes sense. Made a v2 of the patch and can
choose which one is more suitable to use.

Thanks a lot for the feedback!

Cheers,
    Gergely

>
> commit 70730bca1331fc50c3caacaea00439de1325bd6e
> Author: H. Peter Anvin <hpa@zytor.com>
> Date:   Thu Feb 14 15:13:55 2013 -0800
>
>     kernel: Replace timeconst.pl with a bc script
>
>     bc is the standard tool for multi-precision arithmetic.  We switched
>     to Perl because akpm reported a hard-to-reproduce build hang, which
>     was very odd because affected and unaffected machines were all running
>     the same version of GNU bc.
>
>     Unfortunately switching to Perl required a really ugly "canning"
>     mechanism to support Perl < 5.8 installations lacking the Math::BigInt
>     module.
>
>     It was recently pointed out to me that some very old versions of GNU
>     make had problems with pipes in subshells, which was indeed the
>     construct used in the Makefile rules in that version of the patch;
>     Perl didn't need it so switching to Perl fixed the problem for
>     unrelated reasons.  With the problem (hopefully) root-caused, we can
>     switch back to bc and do the arbitrary-precision arithmetic naturally.
>
>     Signed-off-by: H. Peter Anvin <hpa@zytor.com>
>     Cc: Andrew Morton <akpm@linux-foundation.org>
>     Acked-by: Sam Ravnborg <sam@ravnborg.org>
>     Signed-off-by: Michal Marek <mmarek@suse.cz>
>
> Regards,
> Yann E. MORIN.
>
>> Signed-off-by: Gergely Imreh <imrehg@gmail.com>
>> ---
>>  .../patches/linux/perl-define-in-timeconst.patch   | 24 ++++++++++++++++++++++
>>  configs/wandboard_defconfig                        |  1 +
>>  2 files changed, 25 insertions(+)
>>  create mode 100644 board/wandboard/patches/linux/perl-define-in-timeconst.patch
>>
>> diff --git a/board/wandboard/patches/linux/perl-define-in-timeconst.patch b/board/wandboard/patches/linux/perl-define-in-timeconst.patch
>> new file mode 100644
>> index 0000000..811b0a4
>> --- /dev/null
>> +++ b/board/wandboard/patches/linux/perl-define-in-timeconst.patch
>> @@ -0,0 +1,24 @@
>> +The use of defined() on arrays and hashes has been deprecated since perl
>> +5.6, but until 5.17.6 it only warned on lexicals, not package globals.
>> +
>> +Signed-off-by: Dagfinn Ilmari Manns?ker <ilmari@ilmari.org>
>> +---
>> + kernel/timeconst.pl |    2 +-
>> + 1 files changed, 1 insertions(+), 1 deletions(-)
>> +
>> +diff --git a/kernel/timeconst.pl b/kernel/timeconst.pl
>> +index eb51d76..0461239 100644
>> +--- a/kernel/timeconst.pl
>> ++++ b/kernel/timeconst.pl
>> +@@ -370,7 +370,7 @@ if ($hz eq '--can') {
>> +     }
>> +
>> +     @val = @{$canned_values{$hz}};
>> +-    if (!defined(@val)) {
>> ++    if (!@val) {
>> +             @val = compute_values($hz);
>> +     }
>> +     output($hz, @val);
>> +--
>> +1.7.5.4
>> +
>> diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
>> index 5d74fc3..5ce5fdf 100644
>> --- a/configs/wandboard_defconfig
>> +++ b/configs/wandboard_defconfig
>> @@ -1,5 +1,6 @@
>>  BR2_arm=y
>>  BR2_cortex_a9=y
>> +BR2_GLOBAL_PATCH_DIR="board/wandboard/patches"
>>  BR2_KERNEL_HEADERS_VERSION=y
>>  BR2_DEFAULT_KERNEL_VERSION="3.0.101"
>>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_0=y
>> --
>> 2.5.3
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
