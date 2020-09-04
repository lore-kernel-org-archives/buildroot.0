From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 17:10:09 +0200
Subject: [Buildroot] [PATCH 10/15] package/refpolicy: allow providing
 user defined modules
In-Reply-To: <159923161720.787733.8676024574486485062@kwain>
References: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
 <20200731101040.1723047-11-antoine.tenart@bootlin.com>
 <20200904150532.4288260b@windsurf.home>
 <159923161720.787733.8676024574486485062@kwain>
Message-ID: <20200904171009.0b75a8e4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 04 Sep 2020 17:00:17 +0200
Antoine Tenart <antoine.tenart@bootlin.com> wrote:

> If there are no extra modules provided by BR2_REFPOLICY_EXTRA_MODULES_DIRS
> nor PACKAGES_SELINUX_EXTRA_MODULES_DIRS, REFPOLICY_EXTRA_MODULES_DIRS
> would still be different than an empty string as it is now a list.

There is no such thing as a "list" in make. Everything is string, and
space-separated words in a string can somehow be manipulated as a list.

> As a result, REFPOLICY_COPY_EXTRA_MODULES will always be called and
> the 'buildroot/metadata.xml' file will be installed. This would break
> the build.
> 
> But using:
> 
> ifneq ($(qstrip,$(REFPOLICY_EXTRA_MODULES_DIRS)),)

But indeed, there will always be a space in
REFPOLICY_EXTRA_MODULES_DIRS. So I guess the most logical change to do
is:

REFPOLICY_EXTRA_MODULES_DIRS = \
	$(strip \
		$(call qstrip,$(BR2_REFPOLICY_EXTRA_MODULES_DIRS)) \
		$(PACKAGES_SELINUX_EXTRA_MODULES_DIRS))

The below snippet of Makefile illustrates that:

# Strip quotes and then whitespaces
qstrip = $(strip $(subst ",,$(1)))
#"))

BR2_REFPOLICY_EXTRA_MODULES_DIRS = ""
PACKAGES_SELINUX_EXTRA_MODULES_DIRS =

REFPOLICY_EXTRA_MODULES_DIRS = \
	$(strip \
		$(call qstrip,$(BR2_REFPOLICY_EXTRA_MODULES_DIRS)) \
		$(PACKAGES_SELINUX_EXTRA_MODULES_DIRS))

all:
ifneq ($(REFPOLICY_EXTRA_MODULES_DIRS),)
	@echo "REFPOLICY_EXTRA_MODULES_DIRS is not empty"
else
	@echo "REFPOLICY_EXTRA_MODULES_DIRS is empty"
endif


> would also not work as REFPOLICY_EXTRA_MODULES_DIRS would be expanded
> too early, and PACKAGES_SELINUX_EXTRA_MODULES_DIRS might not already
> contain all the packages selinux's custom modules.

I'm not sure it's related to being expanded "too early". All those
variables are recursively expanded, i.e expanded at time of use.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
