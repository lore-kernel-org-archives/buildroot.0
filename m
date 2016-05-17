From: Geoff Levand <geoff@infradead.org>
Date: Tue, 17 May 2016 11:56:07 -0700
Subject: [Buildroot] Analysis of build results for 2016-05-16
In-Reply-To: <20160517153611.2a3b4199@free-electrons.com>
References: <20160517063022.7001A10142D@stock.ovh.net>
 <20160517153611.2a3b4199@free-electrons.com>
Message-ID: <1463511367.5420.26.camel@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have fixes for these, but have not yet found time to do
some final cleanup before submitting them.  Current patches
are in my master branch.

  https://github.com/glevand/buildroot--buildroot/commits/master

On Tue, 2016-05-17 at 15:36 +0200, Thomas Petazzoni wrote:
>       x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/6664189a6f3a815978e8d0a1d7ef408ca47e2874/
> 
> Geoff, can you look into this one?

I believe I have the fix for this one in my patch 'package/go: Build
special host binaries'.  This is a reworked version of what I posted
last time.

> >          arm |                  host-go-1.6.2 | NOK | http://autobuild.buildroot.net/results/42a8d07101d8d954511d1c884ecb66e8d861899e/
> 
> error: #warning requested reentrant code
> 
> Geoff, in fact it seems like host-go itself needs thread support in the
> target toolchain to build properly, so our plan to have only the Go
> packages depend on BR2_TOOLCHAIN_HAS_THREADS does not work.

Yes, the solution I came up with is that the go target package must
specify BR2_TOOLCHAIN_HAS_THREADS if it uses cgo support.  If
BR2_TOOLCHAIN_HAS_THREADS is set, then host-go sets CGO_ENABLED=1 and
builds a compiler with cgo support.  If BR2_TOOLCHAIN_HAS_THREADS is
not set, then host-go does not build in cgo support.  The two cases:

A go package which does not use cgo sets BR2_TOOLCHAIN_HAS_THREADS=n,
the host-go is not build with cgo support.  Both the target package
and host-go should build OK since no thread support is needed.

A package that uses cgo sets BR2_TOOLCHAIN_HAS_THREADS=y, host-go
is build with cgo support.  Both build OK since the toolchain has
thread support.

The patches for this are in (package/go: Add HOST_GO_CGO_ENABLED) and
(package/flannel: Add BR2_TOOLCHAIN_HAS_THREADS), and a non-cgo test
program is in (go-sample: new package).

-Geoff
