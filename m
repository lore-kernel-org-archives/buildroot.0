From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 6 Nov 2017 23:26:12 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-11-05
In-Reply-To: <20171106070008.EF932203A4@mail.free-electrons.com>
References: <20171106070008.EF932203A4@mail.free-electrons.com>
Message-ID: <a7604f4c-f2d5-38e9-6b67-ec9b69a3e84d@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 06/11/2017 08:00, Thomas Petazzoni wrote:
>      powerpc |                   libpjsip-2.7 | NOK | http://autobuild.buildroot.net/results/5d72e0f8517a555399978d5a0e9f7efd0a278189 |     

libpjsip started failing since the bump to 2.7 was applied. Previous
version were not failing since a long time IIRC, but the diff does not
show any obvious reason for this.

I had a quick look:

> /home/test/autobuild/run/instance-3/output/host/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/libuuid.a(libuuid_la-md5.o): In function `byteReverse':
> md5.c:(.text+0x0): multiple definition of `byteReverse'
> /home/test/autobuild/run/instance-3/output/build/libpjsip-2.7/pjlib-util/lib/libpjlib-util-powerpc-buildroot-linux-uclibc.a(md5.o):md5.c:(.text+0x900): first defined here
> collect2: error: ld returned 1 exit status

Looks like byteReverse is defined in several places, thus polluting the
namespace: I found it in util-linux and fontconfig besides libpjsip.

I'm working on a patch to fix that.
-- 
Luca
