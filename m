From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Nov 2015 16:54:42 +0100
Subject: [Buildroot] BR2_EXTERNAL - Broken in 2015.08.01????
In-Reply-To: <CAN34foyWQxHW1t=157ePm8JDfxAT6NoCarGPxOtsXh6C56gJsw@mail.gmail.com>
References: <CAN34foz=B-ig5Ci4kE=UKk6p2qws2Pp-qzaQGgCoXpXco6SAuw@mail.gmail.com>
 <20151105142958.60a38821@free-electrons.com>
 <CAN34foyu5iSPur6c7gNKsB+b6AZgkrbqQ8fP5CKH6jt_GYjTjw@mail.gmail.com>
 <20151105230545.581bf875@free-electrons.com>
 <CAN34foxQ3J=Vd5ZRDtj7X54eD9naRCk-+5-Hh7AuTXp19OBUGQ@mail.gmail.com>
 <20151106154102.6b72af73@free-electrons.com>
 <CAN34foyWQxHW1t=157ePm8JDfxAT6NoCarGPxOtsXh6C56gJsw@mail.gmail.com>
Message-ID: <20151106165442.687e5e08@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stephen Beckwith,

On Fri, 6 Nov 2015 10:22:03 -0500, Stephen Beckwith wrote:

> *And you also state:*
> 
> Package "foo" *must*:
> 
>  * Be implemented in package/foo/foo.mk

Yes, in the main Buildroot tree. In the BR2_EXTERNAL tree, it can be
anywhere you want, as long as the directory name is "foo". I.e, it can
be in

	baz/boz/foo/foo.mk
	package/vendor/foo/foo.mk

> Back to the original problem:  I have a External setup, with "packages"
> specified in a custom directory structure, NOT in a "package" directory yet
> the top level make does NOT build these external packages.  Why?  They are
> only built if I explicity:  make <package> - then it works just fine. . .

Because you named wrongly the Config.in option for those packages....

> I modified the ?leaf? config.in to declare BR2_EXTERNAL_<PKG> - re-run the
> menu config, deslect, re-select, save, verify that the BR2_EXTERNAL_<PKG>
> =y is in the top level .config.

Why do you insist on using BR2_EXTERNAL_<pkg>, while I have been
telling you (as well as the manual and the training slides) that you
should be using BR2_PACKAGE_<pkg> ?

If you don't read what I write, how do you expect things to work ?

> Still does not build from ?make? (there is build directory present.)

Yes, because your Config.in options incorrectly start with
BR2_EXTERNAL_ while they should start with BR2_PACKAGE_.

The code that decides if a package should be built or not is in
package/pkg-generic.mk, and the relevant pieces are:

$(2)_KCONFIG_VAR = BR2_PACKAGE_$(2)
...
ifeq ($$($$($(2)_KCONFIG_VAR)),y)
PACKAGES += $(1)
endif

So, a package named 'foo' is built if BR2_PACKAGE_FOO=y.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
