From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 14:13:13 +0200
Subject: [Buildroot] [PATCH] python-ranger: new package
In-Reply-To: <8737x4iged.fsf@dell.be.48ers.dk>
References: <1445367699-13964-1-git-send-email-thijsvermeir@gmail.com>
 <20151021134806.4c7a27ff@free-electrons.com>
 <8737x4iged.fsf@dell.be.48ers.dk>
Message-ID: <20151021141313.37715fb8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Oct 2015 13:56:42 +0200, Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
> Hi,
> 
> >> source "package/python-serial/Config.in"
> 
>  > This menu is normally for "External python modules" (as its prompt
>  > says). However here, python-ranger is not really a python module, it's
>  > a regular application that ends up being implemented in Python (but
>  > it's kind of an implementation detail).
> 
>  > So I would rather see it visible in "System tools" or "Shell and
>  > utilities", and named just 'ranger' (which is the upstream name for the
>  > project.
> 
>  > Peter ?
> 
> Indeed, I was thinking the same. Question is if we want to forcible
> select python / python3 (and if so, which one?) or if it should depend
> on them.

Good that we agree :)

> It should probably also be simply called ranger instead.

See what I wrote :-)

> I personally think it should use select and default to python3 if python
> isn't enabled - E.G. something like:
> 
> config BR2_PACKAGE_RANGER
>        bool "ranger"
>        depends on BR2_USE_WCHAR # python
>        depends on BR2_USE_MMU # python
>        depends on BR2_TOOLCHAIN_HAS_THREADS # python
>        depends on !BR2_STATIC_LIBS # python

Change all those comments to "# python3"

>        select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
>        select BR2_PACKAGE_PYTHON_CURSES if BR2_PACKAGE_PYTHON
>        select BR2_PACKAGE_PYTHON3_CURSES if BR2_PACKAGE_PYTHON3

But other than that, looks sane to me.

Or alternatively, if we don't want to hide to the user that this tool
is going to bring Python into the build, we could:

config BR2_PACKAGE_RANGER
	bool "ranger
	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
        select BR2_PACKAGE_PYTHON_CURSES if BR2_PACKAGE_PYTHON
        select BR2_PACKAGE_PYTHON3_CURSES if BR2_PACKAGE_PYTHON3

comment "ranger needs Python"
	depends on !BR2_PACKAGE_PYTHON && !BR2_PACKAGE_PYTHON3

It also removes the need for propagating the toolchain dependencies of
Python.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
