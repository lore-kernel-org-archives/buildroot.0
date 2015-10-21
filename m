From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Oct 2015 13:56:42 +0200
Subject: [Buildroot] [PATCH] python-ranger: new package
In-Reply-To: <20151021134806.4c7a27ff@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 21 Oct 2015 13:48:06 +0200")
References: <1445367699-13964-1-git-send-email-thijsvermeir@gmail.com>
 <20151021134806.4c7a27ff@free-electrons.com>
Message-ID: <8737x4iged.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

>> source "package/python-serial/Config.in"

 > This menu is normally for "External python modules" (as its prompt
 > says). However here, python-ranger is not really a python module, it's
 > a regular application that ends up being implemented in Python (but
 > it's kind of an implementation detail).

 > So I would rather see it visible in "System tools" or "Shell and
 > utilities", and named just 'ranger' (which is the upstream name for the
 > project.

 > Peter ?

Indeed, I was thinking the same. Question is if we want to forcible
select python / python3 (and if so, which one?) or if it should depend
on them.

It should probably also be simply called ranger instead.

I personally think it should use select and default to python3 if python
isn't enabled - E.G. something like:

config BR2_PACKAGE_RANGER
       bool "ranger"
       depends on BR2_USE_WCHAR # python
       depends on BR2_USE_MMU # python
       depends on BR2_TOOLCHAIN_HAS_THREADS # python
       depends on !BR2_STATIC_LIBS # python
       select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
       select BR2_PACKAGE_PYTHON_CURSES if BR2_PACKAGE_PYTHON
       select BR2_PACKAGE_PYTHON3_CURSES if BR2_PACKAGE_PYTHON3

(Untested, I don't know if kconfig gets confused here).

-- 
Venlig hilsen,
Peter Korsgaard 
