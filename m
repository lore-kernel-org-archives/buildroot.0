From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 6 May 2019 22:35:14 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-05-05
In-Reply-To: <20190506085720.6db369b2@windsurf>
References: <20190506060044.CE8CA85CCF@whitealder.osuosl.org>
 <20190506063546.hp5272fyzyt2zshw@sapphire.tkos.co.il>
 <20190506085720.6db369b2@windsurf>
Message-ID: <342836c8-49dc-7f58-45e2-0f358dc3c752@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06/05/2019 08:57, Thomas Petazzoni wrote:
> Hello Baruch,
> 
> On Mon, 6 May 2019 09:35:46 +0300
> Baruch Siach <baruch@tkos.co.il> wrote:
> 
>> Hi Thomas,
>>
>> On Mon, May 06, 2019 at 06:00:39AM -0000, Thomas Petazzoni wrote:
>>> Detail of failures
>>> ------------------
>>>
>>>      nds32le |         18xx-ti-utils-R8.7_SP3 | NOK | http://autobuild.buildroot.net/results/3c93cfac81f15f4c18eb7ad578ad86bb7bcf1c12 |       
>>
>> glibc does not work well with BR2_STATIC_LIBS. The combination of 
>> BR2_STATIC_LIBS with glibc configuration seems to only happen in builds for 
>> nds32le. Why is that?
> 
> Because:
> 
> diff --git a/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in b/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
> index e2fe63677d..2596fc3c8b 100644
> --- a/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_TOOLCHAIN_EXTERNAL_ANDES_NDS32
>         bool "Andes nds32"
>         depends on BR2_nds32
> +       depends on !BR2_STATIC_LIBS
>         select BR2_TOOLCHAIN_GCC_AT_LEAST_8
>         select BR2_TOOLCHAIN_EXTERNAL_GLIBC
>         select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17

 To better detect this kind of issue, we should maybe do continuous randconfigs,
and also add:

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 8c5a4fb88e..e7d5f5d789 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -9,6 +9,7 @@ config BR2_TOOLCHAIN
 # Should be selected for glibc or eglibc
 config BR2_TOOLCHAIN_USES_GLIBC
        bool
+       depends on !BR2_STATIC_LIBS
        select BR2_USE_WCHAR
        select BR2_ENABLE_LOCALE
        select BR2_TOOLCHAIN_HAS_FULL_GETTEXT

 This gives no circular dependency, but it does give:

WARNING: unmet direct dependencies detected for BR2_TOOLCHAIN_USES_GLIBC
  Depends on [n]: !BR2_STATIC_LIBS [=y]
  Selected by [y]:
  - BR2_TOOLCHAIN_EXTERNAL_GLIBC [=y] && BR2_TOOLCHAIN_EXTERNAL [=y]


 Regards,
 Arnout
