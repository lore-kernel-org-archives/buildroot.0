From: Touhtarian, Eric <etouhtarian@distech-controls.com>
Date: Fri, 2 Oct 2020 13:07:37 +0000
Subject: [Buildroot] [PATCH 1/1] Get git version and transfer it to
 build target
In-Reply-To: <20201001201449.GG11621@scaer>
References: <20200917153353.8824-1-etouhtarian@distech-controls.com>
 <DM6PR01MB4137A236093298F048094EAC8A300@DM6PR01MB4137.prod.exchangelabs.com>,
 <20201001201449.GG11621@scaer>
Message-ID: <DM6PR01MB4137985B03967C77A9A6E6008A310@DM6PR01MB4137.prod.exchangelabs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Sorry for bad email format for this request.

The issue is the kernel version, like using "uname -r" command, doesn't reflect the real git commit.

In case there are 6 commits after the release tag, we should return version like "v5.4.55-6-g10df54acb4be" but currently we always return the release version "v5.4.55".
We would prefer having the commit version to identify the right used kernel on target.

The problem is "setlocalversion" script from kernel is called within buildroot/output/build/ linux-<xxxx> folder which doesn't contain git repository information and 
so it doesn't set the committed version.

Regards
Eric



________________________________________
De : Yann E. MORIN <yann.morin.1998@free.fr>
Envoy? : jeudi 1 octobre 2020 22:14
? : Touhtarian, Eric <etouhtarian@distech-controls.com>
Cc?: buildroot at buildroot.org <buildroot@buildroot.org>
Objet : Re: [Buildroot] [PATCH 1/1] Get git version and transfer it to build target 
?
Eric, All,

Thanks for your contribution.

On 2020-10-01 14:47 +0000, Touhtarian, Eric via buildroot spake thusly:
> Signed-off-by: Eric Touhtarian <etouhtarian@distech-controls.com>
> ---
>? linux/linux.mk | 7 +++++++
>? 1 file changed, 7 insertions(+)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk index b9f2052ee7..36f98dd704 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -538,6 +538,13 @@ $(error No custom repo URL set. Check your BR2_LINUX_KERNEL_CUSTOM_REPO_URL sett? endif? endif
>? 
> +ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
> +define LINUX_GIT_VERSION
> +???? $(TOPDIR)/support/scripts/setlocalversion $(LINUX_DL_DIR)/git > 
> +$(@D)/.scmversion endef LINUX_PRE_BUILD_HOOKS += LINUX_GIT_VERSION 

This patch is badly mangled , probably by your email client. Be sure to
use 'git send-email' to send your patches, as this generates proper
emails. See the manual:

??? https://urldefense.com/v3/__https:/buildroot.org/downloads/manual/manual.html*submitting-patches__;Iw!!Po4YltK3bPMkYw!hfkAz-K0QIf2YfE5FsVWnOLkmhiLRJj1KPj8ZiScTbirmmhVnVFLP93Ld_LqP0-jJ56K-sRu$ 

> +endif

Why would we store the Linux kernel version on the target? If we were to
do so, why would we not do that for all other packages as well?

Besides, the kernel version is already included in the kernel binary
itself, if you set CONFIG_LOCALVERSION_AUTO=y in your kernel config
file.

If what you need is accountability, then 'make show-info' will dump a
json blurb with a lot of metadata about all packages in your build,
including the kernel version.

Finally, if you need traceability, you probbly already have your kernel
version string in your Buildroot configuration file.

I'll mark this patch as rejected. If you still think there is a valid
use-case for it, that is not covered by one of the above, then please
respin and provide a commit log that explains that use-case.

Regards,
Yann E. MORIN.

>? ifeq ($(BR_BUILDING),y)
>? 
>? ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
> --
> 2.17.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> https://urldefense.com/v3/__http:/lists.busybox.net/mailman/listinfo/buildroot__;!!Po4YltK3bPMkYw!hfkAz-K0QIf2YfE5FsVWnOLkmhiLRJj1KPj8ZiScTbirmmhVnVFLP93Ld_LqP0-jJz9E4NdN$ 

-- 
.-----------------.--------------------.------------------.--------------------.
|? Yann E. MORIN? | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software? Designer | \ / CAMPAIGN???? |? ___?????????????? |
| +33 561 099 427 `------------.-------:? X? AGAINST????? |? \e/? There is no? |
| https://urldefense.com/v3/__http:/ymorin.is-a-geek.org/__;!!Po4YltK3bPMkYw!hfkAz-K0QIf2YfE5FsVWnOLkmhiLRJj1KPj8ZiScTbirmmhVnVFLP93Ld_LqP0-jJ1R7rICb$? | _/*\_ | / \ HTML MAIL??? |?? v?? conspiracy.? |
'------------------------------^-------^------------------^--------------------'
