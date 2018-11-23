From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 23 Nov 2018 12:05:45 +0200
Subject: [Buildroot] [PATCH 1/5] boot/optee-os: OP-TEE secure world
In-Reply-To: <CAN5uoS_NmE9yup0vd-39aqbF9BoCkPE-LZ+=NAmeWkef_n-wpA@mail.gmail.com>
References: <1542900177-17343-1-git-send-email-etienne.carriere@linaro.org>
 <87tvk8euhw.fsf@tkos.co.il>
 <CAN5uoS_NmE9yup0vd-39aqbF9BoCkPE-LZ+=NAmeWkef_n-wpA@mail.gmail.com>
Message-ID: <87r2fcds7a.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Etienne,

Etienne Carriere writes:
> On Thu, 22 Nov 2018 at 21:18, Baruch Siach <baruch@tkos.co.il> wrote:
>> Thanks for your contribution. I have a few comments below.
>>
>> Etienne Carriere writes:
>> > OP-TEE OS is maintained by the OP-TEE project. It provides an
>> > open source solution for development and integration of secure
>> > services for Armv7-A and Armv8-A CPU based platforms supporting
>> > the TrustZone technology. This technology enables CPUs to
>> > concurrently host a secure world as the OP-TEE OS and a non-secure
>> > world as a Linux based OS.
>> >
>> > The OP-TEE project maintains other packages to leverage OP-TEE on
>> > Linux kernel based OSes. An OP-TEE interface driver is available
>> > in the Linux kernel since 4.12 upon CONFIG_OPTEE.
>> >
>> > https://www.op-tee.org/
>> > https://github.com/OP-TEE/optee_os
>> >
>> > Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
>>
>> ...
>>
>> > diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
>> > new file mode 100644
>> > index 0000000..5968531
>> > --- /dev/null
>> > +++ b/boot/optee-os/Config.in
>> > @@ -0,0 +1,102 @@
>> > +config BR2_TARGET_OPTEE_OS
>> > +     bool "optee_os"
>> > +     depends on BR2_aarch64 || BR2_arm
>> > +     select BR2_PACKAGE_OPENSSL # host tool
>>
>> Which host? Is that the host below which OPTEE OS runs? This is usually
>> called target in the Buildroot lingo. Please clarify in a comment.
>
> I see. Well, it is really the host here: OpenSSL is required to build
> the OPTEE OS binaries, it is not required in the target.
> I found such "# host tool" comment in some packages and though it was
> the shortest explicit way to highlight the deps.

Your 'select' enables the target OpenSSL, which is not what you
need. You only need to add host-openssl to the _DEPENDENCIES of your
package. No need to 'select' the host package.

Make sure to test on a host that has no openssl tools installed by the
distro. Your build test succeeds because your package is actually using
your distro installed tools. That didn't work for your other dependency
...

> By the way, I have a questions on
> optee-os also requires the Crypto module from python to build the
> optee-os target binaries.
> It failed with trace:
>      File "scripts/pem_to_pub_c.py", line 23, in main
>        from Crypto.PublicKey import RSA
>    ImportError: No module named Crypto.PublicKey
>
> I tried to resolve this by adding "select BR2_PACKAGE_PYTHON_PYCRYPTO"
> here but it did not solve the issue.
> Moreover, I had to also enable some configs to get pycrypto to build:
>  BR2_PACKAGE_PYTHON=y
>  BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
>  BR2_USE_WCHAR=y
> Finally, i worked around the issue by patching optee-os filetree: port
> related scripts to python3
>
> How do you think should have I done to get Crypto module supported for
> optee-os build?

Here again BR2_PACKAGE_PYTHON_PYCRYPTO enables the target package, while
you need the host package. The solutions is the same. Add
host-python-pycrypto to your _DEPENDENCIES.

>> Is that a build time dependency? If so you need to add openssl to
>> _DEPENDENCIES.
>
> Ok. I understand I need both: BR2_<dep>=y  + add
> <package>_DEPENDENCIES+= <dep>.

For target package you need both. For host packages you don't need BR2_<dep>.

>> > +     help
>> > +       OP-TEE OS provides the secure world boot image and the trust
>> > +       application development kit of the OP-TEE project. OP-TEE OS
>> > +       also provides generic trusted application one can embedded
>> > +       into its system.
>> > +
>> > +       http://github.org/OP-TEE/optee_os
>> > +
>> > +if BR2_TARGET_OPTEE_OS
>> > +
>> > +choice
>> > +     prompt "OP-TEE OS version"
>> > +     default BR2_TARGET_OPTEE_OS_LATEST
>> > +     help
>> > +       Select the version of OP-TEE OS you want to use
>>
>> Is there a practical need to support selection separate version
>> selection for each OPTEE component? If not then I think this version
>> selection should apply to all other components.
>
> Your absolutely right. I will see how to handle that.

baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
