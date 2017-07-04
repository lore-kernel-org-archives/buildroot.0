From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 4 Jul 2017 16:01:08 +0200
Subject: [Buildroot] [RFC] python: fix wrong library linking for CFFI
	backend
In-Reply-To: <CAGm1_kuxe_-b-+JFOqi16oj7wum4d-tu_07G2wEn+TVOxSAWag@mail.gmail.com>
References: <20170626070229.25632-1-yegorslists@googlemail.com>
 <CAGm1_kuxe_-b-+JFOqi16oj7wum4d-tu_07G2wEn+TVOxSAWag@mail.gmail.com>
Message-ID: <CAGm1_ksSffLhMS3+=iiovrup_E73oyZ=HidOaVJjrKNKvUU17g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 26, 2017 at 9:07 AM, Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> On Mon, Jun 26, 2017 at 9:02 AM,  <yegorslists@googlemail.com> wrote:
>> From: Yegor Yefremov <yegorslists@googlemail.com>
>>
>> If python-cffi target variant is installed before a CFFI backend
>> package is built, the cross-compiler tries to link the target
>> _cffi_backend.so and fails. This workaround removes target
>> _cffi_backend.so before package building and restores it after
>> the package was installed. This is only needed for Python 2.x.
>>
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>> ---
>>  package/python-pynacl/python-pynacl.mk | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/package/python-pynacl/python-pynacl.mk b/package/python-pynacl/python-pynacl.mk
>> index e1769b8f7..feb5245a7 100644
>> --- a/package/python-pynacl/python-pynacl.mk
>> +++ b/package/python-pynacl/python-pynacl.mk
>> @@ -13,4 +13,21 @@ PYTHON_PYNACL_SETUP_TYPE = setuptools
>>  PYTHON_PYNACL_DEPENDENCIES = libsodium host-python-cffi
>>  PYTHON_PYNACL_ENV = SODIUM_INSTALL=system
>>
>> +# Remove _cffi_backend.so before building the package and restore it
>> +# after installation. Without target _cffi_backend.so the cross-compilation
>> +# process will use the host _cffi_backend.so and produce correct target
>> +# *.so file. This workaround is only required for Python 2.x.
>> +ifeq ($(BR2_PACKAGE_PYTHON),y)
>> +define PYTHON_PYNACL_CFFI_HOOK
>> +       mv $(TARGET_DIR)/usr/lib/python2.7/site-packages/_cffi_backend.so \
>> +       $(TARGET_DIR)/usr/lib/python2.7/site-packages/br_cffi_backend.so 2>/dev/null || true
>> +endef
>> +define PYTHON_PYNACL_RESTORE_CFFI_BACKEND_HOOK
>> +       mv $(TARGET_DIR)/usr/lib/python2.7/site-packages/br_cffi_backend.so \
>> +       $(TARGET_DIR)/usr/lib/python2.7/site-packages/_cffi_backend.so 2>/dev/null || true
>> +endef
>> +PYTHON_PYNACL_PRE_BUILD_HOOKS = PYTHON_PYNACL_CFFI_HOOK
>> +PYTHON_PYNACL_POST_INSTALL_TARGET_HOOKS = PYTHON_PYNACL_RESTORE_CFFI_BACKEND_HOOK
>> +endif
>> +
>>  $(eval $(python-package))
>
> My original analysis
> http://buildroot-busybox.2317881.n4.nabble.com/cffi-backend-issue-td167718.html
>
> Btw the problem is not only cross-compiling but also importing during
> the build/install stage.
>
> This approach would fix:
>
> http://autobuild.buildroot.net/results/fb7/fb79e1d0fd74c65084e70e40a9c2cd4d9606fed2/
> http://autobuild.buildroot.net/results/27b/27b7edbfb5d81bf71d01de3f0d1b67875bb6200c/
>
> etc.

This quick and dirty hack fixes compilation problem:

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 2418f5dfa..b1efe314e 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -59,7 +59,7 @@ HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
 PKG_PYTHON_SETUPTOOLS_ENV = \
        _PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
        PATH=$(BR_PATH) \
-       PYTHONPATH="$(if
$(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
+       PYTHONPATH="$(HOST_DIR)/usr/lib/python2.7/site-packages/cffi-1.10.0-py2.7-linux-x86_64.egg:$(if
$(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
        PYTHONNOUSERSITE=1 \
        _python_sysroot=$(STAGING_DIR) \
        _python_prefix=/usr \

The question is how to make it properly.

Yegor
