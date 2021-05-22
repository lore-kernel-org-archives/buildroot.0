From: Chan, Donald <hoiho@lab126.com>
Date: Sat, 22 May 2021 00:42:48 +0000
Subject: [Buildroot] [PATCH 5/5] package/python3-cryptography: add
 python3 host variant
In-Reply-To: <20210521162220.GL3208066@scaer>
References: <1621475383746.46545@lab126.com>,<20210521162220.GL3208066@scaer>
Message-ID: <1621644168551.61151@lab126.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> (Not sure if I should address you as Chan, or Donald. Apologies if I
messed up; just tell me! ;-) )

Donald is fine :)

On 2021-05-20 01:49 +0000, Chan, Donald via buildroot spake thusly:
> > Add a python3 host variant since another downstream OSS component
> > (OP-TEE) uses buildroot and it will depend on a python3 host variant
> > of python-cryptography.
> 
> So, those 5 patches are OK (but still, see below for some comments)),
> but there is still nothing that uses those new host packages in the
> Buildroot tree.
> 
> You said OP-TEE OS would use them, but you haven't provided a patch that
> does so, which still leaves those packages unused.
> 
> I've had a quick look at the optee_os git tree [0], but I could not see
> anything thsat uses puthon cryptography.
> 
> [0] https://github.com/OP-TEE/optee_os
> 
> So, I guess those will only become usefull when optee_os is updated in
> Buildroot, to a version where python cryptography is actually used.
> 
> In which case, adding those pacakges should be part of the series that
> updates optee_os.

It's a chicken and egg problem - the original OP-TEE ticket to migrate to pyca/cryptography is https://github.com/OP-TEE/optee_os/issues/4599, but if it's merged now, it will immediately break their CI because they are still using buildroot 2021.02 (https://github.com/OP-TEE/manifest/blob/master/default.xml#L24).

So the best approach seems to be:

1. Update buildroot with these new packages
2. Wait till there is a new buildroot release, submit a PR to update their manifest
3. Then submit another PR to migrate to pyca/cryptography

It's going to be a long process but it will cause the least amount of disruptions. 

> Signed-off-by: Donald Chan <hoiho@lab126.com>
> ---
[--SNIP--]
> diff --git a/package/python3-cryptography/python3-cryptography.mk b/package/python3-cryptography/python3-cryptography.mk
> new file mode 100644
> index 0000000..ce8e9e6
> --- /dev/null
> +++ b/package/python3-cryptography/python3-cryptography.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# python3-cryptography
> +#
> +################################################################################
> +
> +# Please keep in sync with package/python-cryptography/python-cryptography.mk
> +PYTHON3_CRYPTOGRAPHY_VERSION = 3.0

This is not the latest version. 3.4.7 is not available:

    https://pypi.org/project/cryptography/

I haven't looked at the others, but be sure to submit packages that use
the latest version. If that is not possible, then state so in the commit
log, and explain why the latest can't be used.

While waiting for an update to optee_os that does need those packages,
I've marked them postponed in Patchwork [1], which basically means
they'll no longer appear in the list of pending patches. Please include
them uin the series that updates optee_os when that is ready.

Thanks you! :-)

Regards,
Yann E. MORIN.

> +PYTHON3_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON3_CRYPTOGRAPHY_VERSION).tar.gz
> +PYTHON3_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/bf/ac/552fc8729d90393845cc3a2062facf4a89dcbe206fa78771d60ddaae7554
> +PYTHON3_CRYPTOGRAPHY_SETUP_TYPE = setuptools
> +PYTHON3_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
> +PYTHON3_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
> +PYTHON3_CRYPTOGRAPHY_DEPENDENCIES = openssl
> +HOST_PYTHON3_CRYPTOGRAPHY_DEPENDENCIES = host-python3-cffi host-python3-pip host-python3-six
> +HOST_PYTHON3_CRYPTOGRAPHY_DL_SUBDIR = python-cryptography
> +HOST_PYTHON3_CRYPTOGRAPHY_NEEDS_HOST_PYTHON = python3
> +
> +$(eval $(host-python-package))
> --
> 2.17.1
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

--
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
