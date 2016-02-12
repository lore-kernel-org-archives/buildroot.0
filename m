From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 12 Feb 2016 20:26:41 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20160212104541.0e3774b1@free-electrons.com>
References: <20160212073018.E5E46101657@stock.ovh.net>
 <20160212104541.0e3774b1@free-electrons.com>
Message-ID: <56BE31F1.7010700@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All,

Le 12/02/2016 10:45, Thomas Petazzoni a ?crit :
> Hello,
> 
> Rodrigo, Martin, Romain, Vicente, J?rg, Bernd, Gustavo, please see
> below. Others, please see below as well :-)
> 
> On Fri, 12 Feb 2016 08:30:18 +0100 (CET), Thomas Petazzoni wrote:
> 

>>          arc |                host-efl-1.15.3 | NOK | http://autobuild.buildroot.net/results/7dcaeb8fbb5739c36aa0615e3d8a13e9c32993b0/
> 
> I guess would be fixed by http://patchwork.ozlabs.org/patch/572201/.

I reopened a bug about this issue the upstream fix is not enough. See
https://phab.enlightenment.org/T2718
So, for the moment we can build efl 1.15 only with Lua 5.1 (Lua 5.1 was the
default version used at the time I tested the efl bump series).

I have a local branch that bump the efl to the latest version (1.17.0) and the
support for lua-old doesn't build with (5.1, 5.2 and 5.3) due to this issue. The
only solution is to add lua-jit support which build and work correctly (tested
with Qemu).

The problem for 2016.02 is it's too late to enable lua-jit support in efl. So
people using efl with 2016.02 will have to switch to lua-jit when efl will be
updated to a newer version :-/

Do you want me to send a small series (3 patches) adding lua-jit support for
2016.02 ?

> 
>> microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/d63e346ba4d00a68602b1bcec0acb09e266a53c9/
> 
> The infamous documentation problem, would be fixed by
> http://patchwork.ozlabs.org/patch/576556/.

Or this one http://patchwork.ozlabs.org/patch/572150/ even if I don't like to
use sed all over the gdb tree :-/

> 
>>        nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/00a5ef3a4e10700c79b83bc1ab026808ce930030/
>>        nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/c98add9541defd5f12415b69521a1b32ddfa270d/
>>        nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/527d982ab6616eb7bef9419a9e793f7a46c32830/
>>        nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/d4e18789c1da2d8518db873d7833af186daf9859/
> 
> Romain, didn't we say we should add some exclusion for this issue ? If
> so, can you submit a patch ?

Technically, it's a toolchain issue with gcc 4.9. So if we rebuild a new nios2
toolchain with gcc 5.3 this error is gone. Otherwise we can add an autobuilder
exception for br-nios2-full-2015.11-rc1-71-g90d1299.tar.bz2.

Even we can remove BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII since the new
codesourcery toolchain use gcc 5.2.

> 
>>        nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ee562524c5b12191e584ceae89006c5a5103e700/
> 
> Romain, is the patch for this pending somewhere ?

We need to rebuild a nios2 toolchain with the upstream patch applied [1] and
disable for BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII:

[1]
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=83da6e748c8f105f07e17f53aa6b99ed7867ff5f

Otherwise we can apply this one: http://patchwork.ozlabs.org/patch/561414/

Best regards,
Romain
