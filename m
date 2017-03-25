From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Mar 2017 15:50:55 +0100
Subject: [Buildroot] [PATCH 2/2] xenomai: Add configuration opt for SMP
 in Xenomai
In-Reply-To: <20170321164405.23334-2-sikor6@gmail.com>
References: <187458> <20170321164405.23334-1-sikor6@gmail.com>
 <20170321164405.23334-2-sikor6@gmail.com>
Message-ID: <20170325155055.34b440fb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Mar 2017 17:44:05 +0100, Pawel Sikora wrote:

> +config BR2_PACKAGE_XENOMAI_ENABLE_SMP
> +	bool "Enable SMP configuration"
> +	help
> +	  Manually enable SMP in Xenomai. If left empty, the default
> +	  SMP will be disabled.

I don't understand what you mean by "the default SMP will be disabled".
Your current patch does *not* pass anything if
BR2_PACKAGE_XENOMAI_ENABLE_SMP is disabled, i.e it lets Xenomai decide
whether SMP should be enabled or not.

And with Xenomai 2.6, the default is:

$ ./configure --help | grep smp
  --enable-smp            Enable SMP support [default=yes on x86, Power, ARM]

So in fact, with your option disabled, SMP would still be enabled on
x86, Power and ARM.

So it should forcefully disable SMP by passing --disable-smp if the
option is disabled (that normally how we do things in Buildroot).

However, such a change will break things for existing users of Xenomai
on x86, Power and ARM, because they will now have SMP being disabled.
Not sure how to handle that.

Has the semantic of this option changed with Xenomai 3.x ?

> +	  Make sure that in your kernel config you also have SMP
> +	  enabled. If configuration will differ regarding this
> +	  config between Xenomai package and the Linux kernel
> +	  you will not be able to run Xenomai testsuite

This is not completely correct English I believe. A better wording is
probably: "If there is a mismatch between the kernel configuration and
Xenomai configuration in terms of SMP support, the Xenomai testsuite
will fail to run.".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
